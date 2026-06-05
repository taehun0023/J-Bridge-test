'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { CS_COMPREHENSIVE_TOTAL_QUESTIONS } from '@/lib/assessment-config'

export async function requestExam(category: string, subcategory: string, contentLevel: string | null) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Use serviceClient for RLS bypass (admin/mentor may not have RLS access to comprehensive_exams)
  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

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

  // 承認制は廃止 — すべての試験は即座に承認済みで作成される（メンティーは承認なしで受験可能）
  const nowIso = new Date().toISOString()

  const { data, error } = await queryClient
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category,
      subcategory,
      content_level: contentLevel,
      status: 'approved',
      total_questions: category === 'cs' && subcategory === 'comprehensive'
        ? CS_COMPREHENSIVE_TOTAL_QUESTIONS
        : undefined,
      approved_at: nowIso,
      approved_by: user.id,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

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
