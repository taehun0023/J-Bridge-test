'use server'

import { revalidatePath } from 'next/cache'
import { requireAuth, requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { notifyMentorsAndAdmins, getUserDisplayName } from '@/lib/notification-helpers'
import { createNotification } from '@/app/actions/notifications'

export async function requestQuizRetake(attemptId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  // Fetch the attempt
  const { data: attempt } = await queryClient
    .from('quiz_attempts')
    .select('id, user_id, quiz_id, completed_at, retake_request_status')
    .eq('id', attemptId)
    .single()

  if (!attempt) return { error: '試行が見つかりません' }
  if (attempt.user_id !== user.id) return { error: '権限がありません' }
  if (!attempt.completed_at) return { error: '未完了の試行です' }
  if (attempt.retake_request_status === 'requested' || attempt.retake_request_status === 'approved') {
    return { error: '既にリクエスト済みまたは承認済みです' }
  }

  // Check role for auto-approval
  const { data: profile } = await queryClient
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()
  const isAdminOrMentor = profile?.role === 'admin' || profile?.role === 'mentor'

  if (isAdminOrMentor) {
    // Auto-approve for admin/mentor
    await queryClient
      .from('quiz_attempts')
      .update({
        retake_request_status: 'approved',
        retake_requested_at: new Date().toISOString(),
        retake_approved_at: new Date().toISOString(),
      })
      .eq('id', attemptId)
  } else {
    // Mentee: set to requested
    await queryClient
      .from('quiz_attempts')
      .update({
        retake_request_status: 'requested',
        retake_requested_at: new Date().toISOString(),
      })
      .eq('id', attemptId)

    // Notify mentors and admins
    const userName = await getUserDisplayName(user.id, queryClient)
    const { data: quiz } = await queryClient
      .from('quizzes')
      .select('title')
      .eq('id', attempt.quiz_id)
      .single()

    await notifyMentorsAndAdmins(
      user.id,
      'retake_requested',
      `${userName}さんが理解度テストの再試験をリクエスト`,
      quiz?.title ?? undefined,
      '/admin/tasks',
      attemptId,
      queryClient
    )
  }

  revalidatePath('/japanese/jlpt/quiz')
  revalidatePath('/japanese/business/quiz')
  return { success: true }
}

export async function approveQuizRetake(attemptId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  const { data: attempt } = await queryClient
    .from('quiz_attempts')
    .select('id, user_id, quiz_id, retake_request_status')
    .eq('id', attemptId)
    .single()

  if (!attempt) return { error: '試行が見つかりません' }
  if (attempt.retake_request_status !== 'requested') return { error: 'リクエスト状態ではありません' }

  await queryClient
    .from('quiz_attempts')
    .update({
      retake_request_status: 'approved',
      retake_approved_at: new Date().toISOString(),
    })
    .eq('id', attemptId)

  // Notify the mentee
  const { data: quiz } = await queryClient
    .from('quizzes')
    .select('title')
    .eq('id', attempt.quiz_id)
    .single()

  await createNotification(
    attempt.user_id,
    'exam_approved',
    '理解度テスト再試験が承認されました',
    quiz?.title ?? undefined,
    '/japanese/jlpt/quiz'
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/japanese/jlpt/quiz')
  revalidatePath('/japanese/business/quiz')
  return { success: true }
}

export async function denyQuizRetake(attemptId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  const { data: attempt } = await queryClient
    .from('quiz_attempts')
    .select('id, user_id, quiz_id, retake_request_status')
    .eq('id', attemptId)
    .single()

  if (!attempt) return { error: '試行が見つかりません' }
  if (attempt.retake_request_status !== 'requested') return { error: 'リクエスト状態ではありません' }

  await queryClient
    .from('quiz_attempts')
    .update({ retake_request_status: 'denied' })
    .eq('id', attemptId)

  // Notify the mentee
  const { data: quiz } = await queryClient
    .from('quizzes')
    .select('title')
    .eq('id', attempt.quiz_id)
    .single()

  await createNotification(
    attempt.user_id,
    'exam_denied',
    '理解度テスト再試験が拒否されました',
    quiz?.title ?? undefined,
    '/japanese/jlpt/quiz'
  )

  revalidatePath('/admin/tasks')
  return { success: true }
}
