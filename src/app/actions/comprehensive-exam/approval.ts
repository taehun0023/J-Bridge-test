'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createNotification, deleteNotificationsByRelatedId } from '@/app/actions/notifications'

export async function approveExam(examId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam, error: fetchError } = await serviceClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .single()

  if (fetchError || !exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'requested') return { error: 'この試験は承認できません' }

  const { error } = await serviceClient
    .from('comprehensive_exams')
    .update({
      status: 'approved',
      approved_at: new Date().toISOString(),
      approved_by: auth.user.id,
    })
    .eq('id', examId)

  if (error) return { error: error.message }

  // Clean up request notifications sent to other admins/mentors
  await deleteNotificationsByRelatedId(examId, 'exam_requested')

  // Notify mentee
  await createNotification(
    exam.user_id,
    'exam_approved',
    '総合試験が承認されました',
    '試験を開始できます',
    `/exam/${examId}`,
    examId
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

export async function denyExam(examId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam } = await serviceClient
    .from('comprehensive_exams')
    .select('user_id, status')
    .eq('id', examId)
    .single()

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'requested') return { error: 'この試験は拒否できません' }

  const { error } = await serviceClient
    .from('comprehensive_exams')
    .update({ status: 'denied' })
    .eq('id', examId)

  if (error) return { error: error.message }

  // Clean up request notifications sent to other admins/mentors
  await deleteNotificationsByRelatedId(examId, 'exam_requested')

  await createNotification(
    exam.user_id,
    'exam_denied',
    '総合試験リクエストが拒否されました',
    undefined,
    '/dashboard/assignments',
    examId
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

export async function deleteExam(examId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam } = await serviceClient
    .from('comprehensive_exams')
    .select('id, status')
    .eq('id', examId)
    .single()

  if (!exam) return { error: '試験が見つかりません' }

  // Clean up request notifications
  await deleteNotificationsByRelatedId(examId, 'exam_requested')

  // Delete related answers first (FK constraint)
  await serviceClient
    .from('comprehensive_exam_answers')
    .delete()
    .eq('exam_id', examId)

  const { error } = await serviceClient
    .from('comprehensive_exams')
    .delete()
    .eq('id', examId)

  if (error) return { error: error.message }

  revalidatePath('/admin/tasks')
  return { success: true }
}
