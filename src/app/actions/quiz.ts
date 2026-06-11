'use server'

import { requireAuth } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { recalculateUserScores } from './scores'
import { checkAssignmentProgress } from './learning-assignments'

// Practice quiz types that are subject to 1-attempt limit (pool quizzes)
const PRACTICE_QUIZ_TYPES = [
  'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji',
  'it_terminology', 'sentence_pattern', 'business_expression', 'keigo',
  'cs_knowledge',
  'core_programming', 'framework',
]

export async function startQuizAttempt(quizId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  // Check if this is a practice quiz with 1-attempt limit
  const { data: quiz } = await queryClient
    .from('quizzes')
    .select('quiz_type, is_assessment, is_pool')
    .eq('id', quizId)
    .single()

  if (quiz && !quiz.is_assessment && PRACTICE_QUIZ_TYPES.includes(quiz.quiz_type)) {
    // Check user role
    const { data: profile } = await queryClient
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (profile?.role === 'mentee') {
      // Mentees can freely retake practice quizzes — no approval gate
    }
  }

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

  // Get correct answers (server-side only — base-table SELECT is admin/mentor-only
  // under RLS since 00178; mentees only see the is_correct-free safe view)
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: '採点処理を実行できませんでした' }

  const questionIds = answers.map(a => a.questionId)
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
  const answerRows = answers.map((a, index) => {
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
  const denominator = totalQuestions && totalQuestions > 0 ? totalQuestions : answers.length
  const score = denominator > 0 ? Math.round((correctCount / denominator) * 100) : 0

  // Get passing score
  const { data: quiz, error: quizError } = await supabase
    .from('quizzes')
    .select('passing_score')
    .eq('id', attempt.quiz_id)
    .single()

  if (quizError) return { error: 'クイズ情報の取得に失敗しました: ' + quizError.message }

  const passed = score >= (quiz?.passing_score ?? 70)

  const { error: updateError } = await supabase
    .from('quiz_attempts')
    .update({
      score,
      passed,
      completed_at: new Date().toISOString(),
    })
    .eq('id', attemptId)

  if (updateError) return { error: 'クイズ結果の保存に失敗しました: ' + updateError.message }

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
