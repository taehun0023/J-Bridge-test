import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import QuizTaker from '@/components/japanese/QuizTaker'

interface Params {
  quizId: string
}

function shuffleArray<T>(arr: T[]): T[] {
  const result = [...arr]
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[result[i], result[j]] = [result[j], result[i]]
  }
  return result
}

export default async function CsQuizPage({ params }: { params: Promise<Params> }) {
  const { quizId } = await params
  const supabase = await createClient()

  const { data: quiz } = await supabase
    .from('quizzes')
    .select('*')
    .eq('id', quizId)
    .single()

  if (!quiz) notFound()

  const { data: questions } = await supabase
    .from('quiz_questions')
    .select('id, question_text, explanation, points, sort_order, quiz_question_options_safe(id, option_text, sort_order)')
    .eq('quiz_id', quizId)
    .order('sort_order', { ascending: true })

  const shuffledQuestions = (questions ?? []).map(q => ({
    ...q,
    quiz_question_options_safe: shuffleArray(
      (q as { quiz_question_options_safe: { id: string; option_text: string; sort_order: number }[] }).quiz_question_options_safe
    ).map((opt, i) => ({ ...opt, sort_order: i + 1 })),
  }))

  return (
    <QuizTaker
      quiz={quiz}
      questions={shuffledQuestions}
      backUrl="/cs/quiz"
    />
  )
}
