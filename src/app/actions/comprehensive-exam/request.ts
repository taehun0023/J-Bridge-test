'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'
import { notifyMentorsAndAdmins, getUserDisplayName } from '@/lib/notification-helpers'

export async function requestExam(category: string, subcategory: string, contentLevel: string | null) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Check for existing pending/in_progress exam
  const { data: existing } = await supabase
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

  const { data, error } = await supabase
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category,
      subcategory,
      content_level: contentLevel,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  // Notify mentors and admins
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
  if (exam.status !== 'failed') return { error: '不合格の試験のみ再試験リクエストできます' }

  // Create a new exam request (retake)
  const { data: newExam, error: insertError } = await queryClient
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category: exam.category,
      subcategory: exam.subcategory,
      content_level: exam.content_level,
      status: 'requested',
    })
    .select('id')
    .single()

  if (insertError) return { error: insertError.message }

  // Notify mentors and admins
  const userName = await getUserDisplayName(user.id, queryClient)
  await notifyMentorsAndAdmins(
    user.id,
    'exam_requested',
    `${userName}さんが総合試験の再試験をリクエスト`,
    undefined,
    '/admin/tasks',
    newExam.id,
    queryClient
  )

  revalidatePath('/dashboard')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}
