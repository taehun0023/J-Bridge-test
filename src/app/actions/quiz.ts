'use server'

import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { recalculateUserScores } from './scores'

export async function startQuizAttempt(quizId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { error: '인증이 필요합니다' }

  const { data, error } = await supabase
    .from('quiz_attempts')
    .insert({ user_id: user.id, quiz_id: quizId })
    .select('id')
    .single()

  if (error) return { error: '퀴즈 시작에 실패했습니다: ' + error.message }

  return { attemptId: data.id }
}

export async function submitQuizAnswers(
  attemptId: string,
  answers: { questionId: string; selectedOptionId: string }[]
) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { error: '인증이 필요합니다' }

  // Verify attempt belongs to user
  const { data: attempt } = await supabase
    .from('quiz_attempts')
    .select('id, quiz_id')
    .eq('id', attemptId)
    .eq('user_id', user.id)
    .is('completed_at', null)
    .single()

  if (!attempt) return { error: '유효하지 않은 시도입니다' }

  // Get correct answers (server-side only)
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
      attempt_id: attemptId,
      question_id: a.questionId,
      selected_option_id: a.selectedOptionId,
      is_correct: isCorrect,
    }
  })

  const { error: answersError } = await supabase.from('quiz_answers').insert(answerRows)
  if (answersError) return { error: '답안 저장에 실패했습니다: ' + answersError.message }

  // Calculate score and update attempt
  const score = answers.length > 0 ? Math.round((correctCount / answers.length) * 100) : 0

  // Get passing score
  const { data: quiz, error: quizError } = await supabase
    .from('quizzes')
    .select('passing_score')
    .eq('id', attempt.quiz_id)
    .single()

  if (quizError) return { error: '퀴즈 정보 조회 실패: ' + quizError.message }

  const passed = score >= (quiz?.passing_score ?? 70)

  const { error: updateError } = await supabase
    .from('quiz_attempts')
    .update({
      score,
      passed,
      completed_at: new Date().toISOString(),
    })
    .eq('id', attemptId)

  if (updateError) return { error: '퀴즈 결과 저장 실패: ' + updateError.message }

  revalidatePath('/japanese/jlpt/quiz')

  // Recalculate user scores after quiz completion
  recalculateUserScores(user.id).catch(() => {})

  return {
    score,
    passed,
    correctCount,
    totalCount: answers.length,
  }
}
