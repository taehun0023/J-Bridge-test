'use server'

import { requireAuth } from '@/lib/auth-helpers'

export interface ReviewQuestion {
  questionId: string
  questionText: string
  options: { id: string; option_text: string }[]
  selectedOptionId: string
  correctOptionId: string
  isCorrect: boolean
}

export interface ReviewData {
  questions: ReviewQuestion[]
  title: string
  score: number
  completedAt: string
}

const SEVEN_DAYS_MS = 7 * 24 * 60 * 60 * 1000

export async function getQuizAttemptReview(attemptId: string): Promise<{ data?: ReviewData; error?: string }> {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // Fetch the quiz attempt
  const { data: attempt } = await supabase
    .from('quiz_attempts')
    .select('id, quiz_id, score, completed_at, user_id, quizzes(title)')
    .eq('id', attemptId)
    .eq('user_id', user.id)
    .single()

  if (!attempt) return { error: '試験結果が見つかりません' }
  if (!attempt.completed_at) return { error: '未完了の試験です' }

  // 7-day limit check
  const completedAt = new Date(attempt.completed_at).getTime()
  if (Date.now() - completedAt > SEVEN_DAYS_MS) {
    return { error: 'レビュー期限（7日間）を過ぎています' }
  }

  // Fetch answers for this attempt
  const { data: answers } = await supabase
    .from('quiz_answers')
    .select('question_id, selected_option_id, is_correct')
    .eq('attempt_id', attemptId)

  if (!answers || answers.length === 0) return { error: '回答データが見つかりません' }

  // Fetch questions with options
  const questionIds = answers.map(a => a.question_id)
  const { data: questions } = await supabase
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text, is_correct, sort_order)')
    .in('id', questionIds)

  if (!questions) return { error: '問題データが見つかりません' }

  const answerMap = new Map(answers.map(a => [a.question_id, a]))

  const reviewQuestions: ReviewQuestion[] = questions.map(q => {
    const answer = answerMap.get(q.id)
    const options = (q.quiz_question_options as { id: string; option_text: string; is_correct: boolean; sort_order: number }[])
      .sort((a, b) => a.sort_order - b.sort_order)
    const correctOption = options.find(o => o.is_correct)

    return {
      questionId: q.id,
      questionText: q.question_text,
      options: options.map(o => ({ id: o.id, option_text: o.option_text })),
      selectedOptionId: answer?.selected_option_id ?? '',
      correctOptionId: correctOption?.id ?? '',
      isCorrect: answer?.is_correct ?? false,
    }
  })

  const quizzesRaw = attempt.quizzes
  const quizObj = Array.isArray(quizzesRaw) ? quizzesRaw[0] : quizzesRaw
  const quizTitle = (quizObj as { title: string } | null)?.title ?? 'クイズ'

  return {
    data: {
      questions: reviewQuestions,
      title: quizTitle,
      score: attempt.score,
      completedAt: attempt.completed_at,
    },
  }
}

export async function getCompExamReview(examId: string): Promise<{ data?: ReviewData; error?: string }> {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // Fetch the comprehensive exam
  const { data: exam } = await supabase
    .from('comprehensive_exams')
    .select('id, category, score, completed_at, user_id')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) return { error: '試験結果が見つかりません' }
  if (!exam.completed_at) return { error: '未完了の試験です' }

  // 7-day limit check
  const completedAt = new Date(exam.completed_at).getTime()
  if (Date.now() - completedAt > SEVEN_DAYS_MS) {
    return { error: 'レビュー期限（7日間）を過ぎています' }
  }

  // Fetch answers for this exam
  const { data: answers } = await supabase
    .from('comprehensive_exam_answers')
    .select('question_id, selected_option_id, is_correct')
    .eq('exam_id', examId)

  if (!answers || answers.length === 0) return { error: '回答データが見つかりません' }

  // Fetch questions with options
  const questionIds = answers.map(a => a.question_id)
  const { data: questions } = await supabase
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text, is_correct, sort_order)')
    .in('id', questionIds)

  if (!questions) return { error: '問題データが見つかりません' }

  const answerMap = new Map(answers.map(a => [a.question_id, a]))

  const EXAM_CATEGORY_LABELS: Record<string, string> = {
    seikatsu: '生活日本語 総合試験',
    'business-jp': 'ビジネス日本語 総合試験',
    cs: 'CS知識 総合試験',
    dev: '開発実務能力 総合試験',
    'business-lit': 'ビジネスリテラシー 総合試験',
  }

  const reviewQuestions: ReviewQuestion[] = questions.map(q => {
    const answer = answerMap.get(q.id)
    const options = (q.quiz_question_options as { id: string; option_text: string; is_correct: boolean; sort_order: number }[])
      .sort((a, b) => a.sort_order - b.sort_order)
    const correctOption = options.find(o => o.is_correct)

    return {
      questionId: q.id,
      questionText: q.question_text,
      options: options.map(o => ({ id: o.id, option_text: o.option_text })),
      selectedOptionId: answer?.selected_option_id ?? '',
      correctOptionId: correctOption?.id ?? '',
      isCorrect: answer?.is_correct ?? false,
    }
  })

  return {
    data: {
      questions: reviewQuestions,
      title: EXAM_CATEGORY_LABELS[exam.category] ?? exam.category,
      score: exam.score ?? 0,
      completedAt: exam.completed_at,
    },
  }
}
