'use server'

import { requireAuth, requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'

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

  // Fetch answers for this attempt (ordered by sort_order for presentation order)
  const { data: answers } = await supabase
    .from('quiz_answers')
    .select('question_id, selected_option_id, is_correct, sort_order')
    .eq('attempt_id', attemptId)
    .order('sort_order', { ascending: true, nullsFirst: false })

  if (!answers || answers.length === 0) return { error: '回答データが見つかりません' }

  // Fetch questions with options
  const questionIds = answers.map(a => a.question_id)
  const { data: questions } = await supabase
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text, is_correct, sort_order)')
    .in('id', questionIds)

  if (!questions) return { error: '問題データが見つかりません' }

  // Reorder questions to match answer (presentation) order
  const qMap = new Map(questions.map(q => [q.id, q]))
  const orderedQuestions = answers.map(a => qMap.get(a.question_id)).filter(Boolean) as typeof questions
  const answerMap = new Map(answers.map(a => [a.question_id, a]))

  const reviewQuestions: ReviewQuestion[] = orderedQuestions.map(q => {
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

  // Fetch answers for this exam (ordered by sort_order for presentation order)
  const { data: answers } = await supabase
    .from('comprehensive_exam_answers')
    .select('question_id, selected_option_id, is_correct, sort_order')
    .eq('exam_id', examId)
    .order('sort_order', { ascending: true, nullsFirst: false })

  if (!answers || answers.length === 0) return { error: '回答データが見つかりません' }

  // Fetch questions with options
  const questionIds = answers.map(a => a.question_id)
  const { data: questions } = await supabase
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text, is_correct, sort_order)')
    .in('id', questionIds)

  if (!questions) return { error: '問題データが見つかりません' }

  // Reorder questions to match answer (presentation) order
  const qMap = new Map(questions.map(q => [q.id, q]))
  const orderedQuestions = answers.map(a => qMap.get(a.question_id)).filter(Boolean) as typeof questions
  const answerMap = new Map(answers.map(a => [a.question_id, a]))

  const EXAM_CATEGORY_LABELS: Record<string, string> = {
    seikatsu: '生活日本語 総合試験',
    'business-jp': 'ビジネス日本語 総合試験',
    cs: 'CS知識 総合試験',
    dev: '開発実務能力 総合試験',
    'business-lit': 'ビジネスリテラシー 総合試験',
  }

  const reviewQuestions: ReviewQuestion[] = orderedQuestions.map(q => {
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

const FOURTEEN_DAYS_MS = 14 * 24 * 60 * 60 * 1000

export async function getMentorCompExamReview(examId: string): Promise<{ data?: ReviewData; error?: string }> {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user, profile } = auth

  // Fetch the comprehensive exam (no user_id filter — mentor views mentee's exam)
  const { data: exam } = await supabase
    .from('comprehensive_exams')
    .select('id, category, score, completed_at, user_id')
    .eq('id', examId)
    .single()

  if (!exam) return { error: '試験結果が見つかりません' }
  if (!exam.completed_at) return { error: '未完了の試験です' }

  // Authorization: admin bypasses, mentor must be assigned to this mentee
  if (profile.role !== 'admin') {
    const { data: assignment } = await supabase
      .from('mentor_mentee_assignments')
      .select('id')
      .eq('mentor_id', user.id)
      .eq('mentee_id', exam.user_id)
      .single()

    if (!assignment) return { error: '担当メンティではありません' }
  }

  // 14-day limit check
  const completedAt = new Date(exam.completed_at).getTime()
  if (Date.now() - completedAt > FOURTEEN_DAYS_MS) {
    return { error: 'レビュー期限（14日間）を過ぎています' }
  }

  // Use service role client to bypass RLS on comprehensive_exam_answers
  // (RLS only allows admin or exam owner — no mentor policy)
  const serviceClient = createServiceRoleClient()
  const queryClient = serviceClient ?? supabase

  // Fetch answers for this exam (ordered by sort_order for presentation order)
  const { data: answers } = await queryClient
    .from('comprehensive_exam_answers')
    .select('question_id, selected_option_id, is_correct, sort_order')
    .eq('exam_id', examId)
    .order('sort_order', { ascending: true, nullsFirst: false })

  if (!answers || answers.length === 0) return { error: '回答データが見つかりません' }

  // Fetch questions with options
  const questionIds = answers.map(a => a.question_id)
  const { data: questions } = await queryClient
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text, is_correct, sort_order)')
    .in('id', questionIds)

  if (!questions) return { error: '問題データが見つかりません' }

  // Reorder questions to match answer (presentation) order
  const qMap = new Map(questions.map(q => [q.id, q]))
  const orderedQuestions = answers.map(a => qMap.get(a.question_id)).filter(Boolean) as typeof questions
  const answerMap = new Map(answers.map(a => [a.question_id, a]))

  const EXAM_CATEGORY_LABELS: Record<string, string> = {
    seikatsu: '生活日本語 総合試験',
    'business-jp': 'ビジネス日本語 総合試験',
    cs: 'CS知識 総合試験',
    dev: '開発実務能力 総合試験',
    'business-lit': 'ビジネスリテラシー 総合試験',
  }

  const reviewQuestions: ReviewQuestion[] = orderedQuestions.map(q => {
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
