'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'
import { notifyMentorsAndAdmins, getUserDisplayName } from '@/lib/notification-helpers'
import { CS_COMPREHENSIVE_TOTAL_QUESTIONS } from '@/lib/assessment-config'

export async function requestExam(category: string, subcategory: string, contentLevel: string | null) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Use serviceClient for RLS bypass (admin/mentor may not have RLS access to comprehensive_exams)
  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  // Check role for auto-approval
  const { data: profile } = await queryClient
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()
  const isAdminOrMentor = profile?.role === 'admin' || profile?.role === 'mentor'

  // Check for existing pending/in_progress exam
  const { data: existing } = await queryClient
    .from('comprehensive_exams')
    .select('id')
    .eq('user_id', user.id)
    .eq('category', category)
    .eq('subcategory', subcategory)
    .in('status', ['requested', 'approved', 'in_progress'])
    .limit(1)

  if (existing && existing.length > 0) {
    return { error: '既にリクエスト中または進行中の試験があります' }
  }

  // Check if this is the user's first exam for this category (any subcategory, any status).
  // First exams are auto-approved regardless of role to remove the approval friction.
  const { count: categoryCount } = await queryClient
    .from('comprehensive_exams')
    .select('id', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .eq('category', category)
  const isFirstExam = (categoryCount ?? 0) === 0
  const autoApprove = isAdminOrMentor || isFirstExam
  const nowIso = new Date().toISOString()

  const { data, error } = await queryClient
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category,
      subcategory,
      content_level: contentLevel,
      status: autoApprove ? 'approved' : 'requested',
      total_questions: category === 'cs' && subcategory === 'comprehensive'
        ? CS_COMPREHENSIVE_TOTAL_QUESTIONS
        : undefined,
      ...(autoApprove && {
        approved_at: nowIso,
        approved_by: user.id,
      }),
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  // Notify mentors and admins only when an approval is actually needed
  if (!autoApprove) {
    const userName = await getUserDisplayName(user.id)
    const catLabel = ASSIGNMENT_CATEGORIES[category]?.label ?? category
    const subLabel = ASSIGNMENT_CATEGORIES[category]?.subcategories[subcategory]?.label ?? subcategory
    const levelStr = contentLevel ? ` ${contentLevel}` : ''

    await notifyMentorsAndAdmins(
      user.id,
      'exam_requested',
      `${userName}さんが総合試験をリクエスト`,
      `${catLabel} > ${subLabel}${levelStr}`,
      '/admin/tasks',
      data.id
    )
  }

  revalidatePath('/dashboard/assignments')
  return { success: true, examId: data.id }
}

export async function requestRetakeExam(examId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Use serviceClient if available, otherwise fall back to regular client
  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  const { data: exam } = await queryClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'failed' && exam.status !== 'completed') return { error: '完了済みまたは不合格の試験のみ再試験リクエストできます' }

  // Prevent parallel retakes — same duplicate check as requestExam
  const { data: existing } = await queryClient
    .from('comprehensive_exams')
    .select('id')
    .eq('user_id', user.id)
    .eq('category', exam.category)
    .eq('subcategory', exam.subcategory)
    .in('status', ['requested', 'approved', 'in_progress'])
    .limit(1)

  if (existing && existing.length > 0) {
    return { error: '既にリクエスト中または進行中の試験があります' }
  }

  // Create a new exam — auto-approved for all roles (no approval gate)
  const { data: newExam, error: insertError } = await queryClient
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category: exam.category,
      subcategory: exam.subcategory,
      content_level: exam.content_level,
      status: 'approved',
      total_questions: exam.category === 'cs' && exam.subcategory === 'comprehensive'
        ? CS_COMPREHENSIVE_TOTAL_QUESTIONS
        : undefined,
    })
    .select('id')
    .single()

  if (insertError) return { error: insertError.message }

  revalidatePath('/dashboard')
  revalidatePath('/dashboard/assignments')
  return { success: true, examId: newExam.id }
}
