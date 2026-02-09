import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import QuizTaker from './QuizTaker'

interface Params {
  quizId: string
}

export default async function QuizPage({ params }: { params: Promise<Params> }) {
  const { quizId } = await params
  const supabase = await createClient()

  const { data: quiz } = await supabase
    .from('quizzes')
    .select('*')
    .eq('id', quizId)
    .single()

  if (!quiz) notFound()

  // Fetch questions with safe options (no is_correct exposed)
  const { data: questions } = await supabase
    .from('quiz_questions')
    .select('id, question_text, explanation, points, sort_order, quiz_question_options_safe(id, option_text, sort_order)')
    .eq('quiz_id', quizId)
    .order('sort_order', { ascending: true })

  return (
    <QuizTaker
      quiz={quiz}
      questions={questions ?? []}
    />
  )
}
