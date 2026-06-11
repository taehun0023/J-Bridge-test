'use server'

import { requireAuth } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { recalculateUserScores } from '@/modules/scoring'
import { checkAssignmentProgress } from './learning-assignments'

export async function startQuizAttempt(quizId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { data, error } = await supabase
    .from('quiz_attempts')
    .insert({ user_id: user.id, quiz_id: quizId })
    .select('id')
    .single()

  if (error) return { error: 'クイズの開始に失敗しました: ' + error.message }

  return { attemptId: data.id }
}

export async function submitQuizAnswers(
  attemptId: string,
  answers: { questionId: string; selectedOptionId: string }[],
  totalQuestions?: number
) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Verify attempt belongs to user
  const { data: attempt } = await supabase
    .from('quiz_attempts')
    .select('id, quiz_id')
    .eq('id', attemptId)
    .eq('user_id', user.id)
    .is('completed_at', null)
    .single()

  if (!attempt) return { error: '無効な試行です' }

  // At most one answer per question — payload is client-controlled, and
  // quiz_answers enforces UNIQUE(attempt_id, question_id) since 00180
  const seenQuestionIds = new Set<string>()
  const uniqueAnswers = answers.filter(a => {
    if (seenQuestionIds.has(a.questionId)) return false
    seenQuestionIds.add(a.questionId)
    return true
  })

  // Get correct answers (server-side only — base-table SELECT is admin/mentor-only
  // under RLS since 00178; mentees only see the is_correct-free safe view)
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: '採点処理を実行できませんでした' }

  const questionIds = uniqueAnswers.map(a => a.questionId)
  const { data: correctOptions } = await serviceClient
    .from('quiz_question_options')
    .select('id, question_id, is_correct')
    .in('question_id', questionIds)
    .eq('is_correct', true)

  const correctMap = new Map(
    correctOptions?.map(o => [o.question_id, o.id]) ?? []
  )

  // Grade and insert answers
  let correctCount = 0
  const answerRows = uniqueAnswers.map((a, index) => {
    const isCorrect = correctMap.get(a.questionId) === a.selectedOptionId
    if (isCorrect) correctCount++
    return {
      attempt_id: attemptId,
      question_id: a.questionId,
      selected_option_id: a.selectedOptionId,
      is_correct: isCorrect,
      sort_order: index,
    }
  })

  const { error: answersError } = await supabase.from('quiz_answers').insert(answerRows)
  if (answersError) return { error: '回答の保存に失敗しました: ' + answersError.message }

  // Calculate score: use totalQuestions (full quiz length) as denominator when provided
  const denominator = totalQuestions && totalQuestions > 0 ? totalQuestions : uniqueAnswers.length
  const score = denominator > 0 ? Math.round((correctCount / denominator) * 100) : 0

  // Get passing score
  const { data: quiz, error: quizError } = await supabase
    .from('quizzes')
    .select('passing_score')
    .eq('id', attempt.quiz_id)
    .single()

  if (quizError) return { error: 'クイズ情報の取得に失敗しました: ' + quizError.message }

  const passed = score >= (quiz?.passing_score ?? 70)

  // Double-submit guard: only complete an attempt that is still open
  const { data: completedAttempt, error: updateError } = await supabase
    .from('quiz_attempts')
    .update({
      score,
      passed,
      completed_at: new Date().toISOString(),
    })
    .eq('id', attemptId)
    .is('completed_at', null)
    .select('id')
    .single()

  if (updateError || !completedAttempt) return { error: 'クイズ結果の保存に失敗しました' }

  // Recalculate user scores after quiz completion
  recalculateUserScores(user.id).catch((err) =>
    console.error('[Score Recalculation Failed]', user.id, err)
  )

  // Update learning assignment progress on quiz pass
  if (passed) {
    checkAssignmentProgress(user.id, attempt.quiz_id).catch((err) =>
      console.error('[Assignment Progress Check Failed]', user.id, attempt.quiz_id, err)
    )
  }

  // Per-question results for review mode
  const results = answers.map(a => ({
    questionId: a.questionId,
    selectedOptionId: a.selectedOptionId,
    correctOptionId: correctMap.get(a.questionId) ?? '',
    isCorrect: correctMap.get(a.questionId) === a.selectedOptionId,
  }))

  return {
    score,
    passed,
    correctCount,
    totalCount: denominator,
    results,
  }
}
