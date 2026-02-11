'use server'

import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { revalidatePath } from 'next/cache'
import { fetchRandomAssessmentQuestions, fetchAssessmentQuiz } from '@/lib/supabase/queries/assessments'
import { recalculateUserScores } from './scores'
import { ASSESSMENT_QUIZ_IDS } from '@/lib/assessment-config'

/** Save onboarding preferences (step 0 → 1) */
export async function savePreferences(formData: FormData) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { error: '認証が必要です' }

  const targetJlptLevel = formData.get('target_jlpt_level') as string
  const targetCodingArea = formData.get('target_coding_area') as string

  const validJlptLevels = ['N5', 'N4', 'N3', 'N2', 'N1']
  const validCodingAreas = ['java', 'javascript', 'sql']

  if (!validJlptLevels.includes(targetJlptLevel)) {
    return { error: '有効なJLPTレベルを選択してください' }
  }
  if (!validCodingAreas.includes(targetCodingArea)) {
    return { error: '有効なコーディング分野を選択してください' }
  }

  const { error } = await supabase
    .from('profiles')
    .update({
      target_jlpt_level: targetJlptLevel,
      target_coding_area: targetCodingArea,
      onboarding_step: 1,
      updated_at: new Date().toISOString(),
    })
    .eq('id', user.id)

  if (error) return { error: '保存中にエラーが発生しました' }

  revalidatePath('/', 'layout')
  redirect('/onboarding/assessment/1')
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
  step: number
) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { error: '認証が必要です' }

  const quizId = ASSESSMENT_QUIZ_IDS[step]
  if (!quizId) return { error: '無効なステップです' }

  // Check if user is already onboarded
  const { data: profile } = await supabase
    .from('profiles')
    .select('is_onboarded, onboarding_step')
    .eq('id', user.id)
    .single()

  const isOnboarded = profile?.is_onboarded ?? false

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

  // Score: max(1, round((correct/total) * 100))
  const score = Math.max(1, Math.round((correctCount / answers.length) * 100))

  await supabase
    .from('quiz_attempts')
    .update({
      score,
      passed: true, // Assessment always "passes" (diagnostic)
      completed_at: new Date().toISOString(),
    })
    .eq('id', attempt.id)

  // Only advance onboarding step for non-onboarded users
  const nextStep = step + 1
  if (!isOnboarded) {
    await supabase
      .from('profiles')
      .update({
        onboarding_step: nextStep,
        updated_at: new Date().toISOString(),
      })
      .eq('id', user.id)
  }

  // Recalculate scores
  await recalculateUserScores(user.id)

  revalidatePath('/', 'layout')
  revalidatePath('/dashboard')

  return {
    score,
    correctCount,
    totalCount: answers.length,
    nextStep,
    redirectTo: isOnboarded ? '/dashboard' : undefined,
  }
}

/** Finalize onboarding: set is_onboarded=true and redirect to dashboard */
export async function finalizeOnboarding() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { error: '認証が必要です' }

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
