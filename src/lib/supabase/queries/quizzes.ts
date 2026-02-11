import { createClient } from '@/lib/supabase/server'
import type { QuizType } from '@/lib/supabase/types'

export async function fetchQuizzes(quizType?: QuizType) {
  const supabase = await createClient()
  let query = supabase
    .from('quizzes')
    .select('*, quiz_questions(count)')
    .eq('is_assessment', false)
    .order('created_at', { ascending: true })

  if (quizType) {
    query = query.eq('quiz_type', quizType)
  }

  return query
}

export async function fetchQuizById(quizId: string) {
  const supabase = await createClient()
  return supabase
    .from('quizzes')
    .select('*')
    .eq('id', quizId)
    .single()
}

export async function fetchQuizQuestions(quizId: string) {
  const supabase = await createClient()
  return supabase
    .from('quiz_questions')
    .select('*, quiz_question_options_safe(*)')
    .eq('quiz_id', quizId)
    .order('sort_order', { ascending: true })
}

export async function fetchQuizQuestionsWithAnswers(quizId: string) {
  const supabase = await createClient()
  return supabase
    .from('quiz_questions')
    .select('*, quiz_question_options(*)')
    .eq('quiz_id', quizId)
    .order('sort_order', { ascending: true })
}

export async function fetchQuizAttempts(userId: string, quizId?: string) {
  const supabase = await createClient()
  let query = supabase
    .from('quiz_attempts')
    .select('*')
    .eq('user_id', userId)
    .order('started_at', { ascending: false })

  if (quizId) {
    query = query.eq('quiz_id', quizId)
  }

  return query
}
