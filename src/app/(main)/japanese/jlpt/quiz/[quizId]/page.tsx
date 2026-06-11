import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import QuizTaker from '@/components/japanese/QuizTaker'
import { shuffleArray } from '@/lib/shuffle'

export const dynamic = 'force-dynamic'

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

  const quizLevel = quiz.title.match(/N[1-5]/)?.[0]
  const backUrl = quizLevel ? `/japanese/jlpt/quiz?level=${quizLevel}` : '/japanese/jlpt/quiz'

  type SafeOption ={ id: string; option_text: string; sort_order: number }
  type QuestionRow = {
    id: string
    question_text: string
    explanation: string | null
    points: number
    sort_order: number
    quiz_question_options_safe: SafeOption[]
  }

  let questions: QuestionRow[]

  // Pool quiz: draw random questions from all source quizzes of the same type
  if (quiz.is_pool && quiz.questions_per_attempt) {
    // 1. Find source quiz IDs (same quiz_type, non-pool, non-assessment)
    const { data: sourceQuizzes } = await supabase
      .from('quizzes')
      .select('id')
      .eq('quiz_type', quiz.quiz_type)
      .eq('is_pool', false)
      .eq('is_assessment', false)

    const sourceIds = (sourceQuizzes ?? []).map(q => q.id)

    if (sourceIds.length === 0) {
      questions = []
    } else {
      // 2. Fetch published questions from source quizzes (filter by N-level if present)
      const nLevel = quiz.title.match(/N[1-5]/)?.[0]
      let questionsQuery = supabase
        .from('quiz_questions')
        .select('id, question_text, explanation, points, sort_order, quiz_question_options_safe(id, option_text, sort_order)')
        .in('quiz_id', sourceIds)
        .eq('is_published', true)

      if (nLevel) {
        questionsQuery = questionsQuery.eq('difficulty', nLevel)
      }

      const { data: allQuestions } = await questionsQuery

      // 3. Random selection
      const shuffled = shuffleArray(allQuestions ?? [])
      const selected = shuffled.slice(0, quiz.questions_per_attempt)

      // 4. Shuffle options too
      questions = selected.map((q) => ({
        ...q,
        quiz_question_options_safe: shuffleArray(
          (q as QuestionRow).quiz_question_options_safe
        ).map((opt, i) => ({ ...opt, sort_order: i + 1 })),
      })) as QuestionRow[]
    }
  } else {
    // Standard quiz: fetch questions directly
    const { data: rawQuestions } = await supabase
      .from('quiz_questions')
      .select('id, question_text, explanation, points, sort_order, quiz_question_options_safe(id, option_text, sort_order)')
      .eq('quiz_id', quizId)
      .eq('is_published', true)
      .order('sort_order', { ascending: true })

    questions = shuffleArray((rawQuestions ?? []).map(q => ({
      ...q,
      quiz_question_options_safe: shuffleArray(
        (q as QuestionRow).quiz_question_options_safe
      ).map((opt, i) => ({ ...opt, sort_order: i + 1 })),
    }))) as QuestionRow[]
  }

  const sessionKey = crypto.randomUUID()

  return (
    <QuizTaker
      quiz={quiz}
      questions={questions}
      backUrl={backUrl}
      quizType={quiz.quiz_type}
      hideRetry
      sessionKey={sessionKey}
    />
  )
}
