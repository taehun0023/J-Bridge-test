'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { fetchRandomAssessmentQuestions, fetchAssessmentQuiz } from '@/lib/supabase/queries/assessments'
import { recalculateUserScores } from './scores'
import { ASSESSMENT_QUIZ_IDS } from '@/lib/assessment-config'
import { notifyMentorsAndAdmins, getUserDisplayName } from '@/lib/notification-helpers'

/** Save onboarding preferences and mark as onboarded → dashboard */
export async function savePreferences(formData: FormData) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const isJapanese = formData.get('is_japanese') === 'true'
  const targetCodingArea = formData.get('target_coding_area') as string

  const validCodingAreas = ['java', 'javascript']

  if (!validCodingAreas.includes(targetCodingArea)) {
    return { error: '有効なコーディング分野を選択してください' }
  }

  const { error } = await supabase
    .from('profiles')
    .update({
      is_japanese: isJapanese,
      target_coding_area: targetCodingArea,
      is_onboarded: true,
      updated_at: new Date().toISOString(),
    })
    .eq('id', user.id)

  if (error) return { error: '保存中にエラーが発生しました' }

  revalidatePath('/', 'layout')
  redirect('/dashboard')
}

/** Get assessment quiz + randomly selected questions for a step */
export async function getAssessmentForStep(step: number, targetCodingArea?: string | null) {
  const quizId = ASSESSMENT_QUIZ_IDS[step]
  if (!quizId) return { error: '無効なステップです' }

  const { data: quiz, error } = await fetchAssessmentQuiz(quizId)
  if (error || !quiz) return { error: '評価クイズが見つかりません' }

  const questions = await fetchRandomAssessmentQuestions(quizId, step, targetCodingArea)
  if (questions.length === 0) return { error: '問題を読み込めません' }

  return { quiz, questions }
}

/** Submit assessment answers and advance step */
export async function submitAssessment(
  answers: { questionId: string; selectedOptionId: string }[],
  step: number,
  totalQuestions: number
) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const quizId = ASSESSMENT_QUIZ_IDS[step]
  if (!quizId) return { error: '無効なステップです' }

  // Delete previous attempts for this user + quiz (retake = overwrite)
  // Use service role client to bypass RLS (no DELETE policy on quiz_attempts)
  // quiz_answers are cascade-deleted via FK ON DELETE CASCADE
  const serviceClient = createServiceRoleClient()
  if (serviceClient) {
    await serviceClient
      .from('quiz_attempts')
      .delete()
      .eq('user_id', user.id)
      .eq('quiz_id', quizId)
  }

  // Create attempt
  const { data: attempt, error: attemptError } = await supabase
    .from('quiz_attempts')
    .insert({ user_id: user.id, quiz_id: quizId })
    .select('id')
    .single()

  if (attemptError || !attempt) return { error: '試験の開始に失敗しました' }

  // Get correct answers
  const questionIds = answers.map(a => a.questionId)
  const { data: correctOptions } = await supabase
    .from('quiz_question_options')
    .select('id, question_id, is_correct')
    .in('question_id', questionIds)
    .eq('is_correct', true)

  const correctMap = new Map(
    correctOptions?.map(o => [o.question_id, o.id]) ?? []
  )

  // Grade and insert answers
  let correctCount = 0
  const answerRows = answers.map(a => {
    const isCorrect = correctMap.get(a.questionId) === a.selectedOptionId
    if (isCorrect) correctCount++
    return {
      attempt_id: attempt.id,
      question_id: a.questionId,
      selected_option_id: a.selectedOptionId,
      is_correct: isCorrect,
    }
  })

  await supabase.from('quiz_answers').insert(answerRows)

  // Score: correct / totalQuestions (unanswered = wrong)
  const denominator = Math.max(totalQuestions, answers.length)
  const score = Math.max(1, Math.round((correctCount / denominator) * 100))

  await supabase
    .from('quiz_attempts')
    .update({
      score,
      passed: true, // Assessment always "passes" (diagnostic)
      completed_at: new Date().toISOString(),
    })
    .eq('id', attempt.id)

  // Recalculate scores
  await recalculateUserScores(user.id)

  revalidatePath('/dashboard')

  // Build per-question results for review screen
  const results = answers.map(a => ({
    questionId: a.questionId,
    selectedOptionId: a.selectedOptionId,
    correctOptionId: correctMap.get(a.questionId) ?? '',
    isCorrect: correctMap.get(a.questionId) === a.selectedOptionId,
  }))

  return {
    score,
    correctCount,
    totalCount: totalQuestions,
    results,
  }
}

/** Request retake for a completed assessment step */
export async function requestRetake(step: number) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const quizId = ASSESSMENT_QUIZ_IDS[step]
  if (!quizId) return { error: '無効なステップです' }

  // Find the latest completed attempt for this step
  const { data: attempt } = await supabase
    .from('quiz_attempts')
    .select('*')
    .eq('user_id', user.id)
    .eq('quiz_id', quizId)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (!attempt) return { error: '完了済みの試験が見つかりません' }
  if (attempt.retake_request_status === 'requested') return { error: '既にリクエスト済みです' }
  if (attempt.retake_request_status === 'approved') return { error: '既に承認されています' }

  const { error } = await supabase
    .from('quiz_attempts')
    .update({
      retake_request_status: 'requested',
      retake_requested_at: new Date().toISOString(),
    })
    .eq('id', attempt.id)

  if (error) return { error: 'リクエスト送信に失敗しました' }

  // Notify mentors and admins
  const queryClient = createServiceRoleClient() ?? supabase
  const userName = await getUserDisplayName(user.id, queryClient)

  const { data: quizData } = await queryClient
    .from('quizzes')
    .select('title')
    .eq('id', quizId)
    .single()

  const quizTitle = quizData?.title ?? '評価テスト'

  await notifyMentorsAndAdmins(
    user.id,
    'retake_requested',
    `${userName}さんが再試験をリクエスト`,
    quizTitle,
    '/admin/tasks',
    attempt.id,
    queryClient
  )

  revalidatePath('/dashboard')
  return { success: true }
}

/** Finalize onboarding: set is_onboarded=true and redirect to dashboard */
export async function finalizeOnboarding() {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  await supabase
    .from('profiles')
    .update({
      is_onboarded: true,
      updated_at: new Date().toISOString(),
    })
    .eq('id', user.id)

  revalidatePath('/', 'layout')
  redirect('/dashboard')
}
