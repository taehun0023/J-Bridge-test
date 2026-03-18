import { createClient } from '@/lib/supabase/server'
import { notFound, redirect } from 'next/navigation'
import QuizTaker from '@/components/japanese/QuizTaker'
import { shuffleArray } from '@/lib/shuffle'
import { STEP4_DIFFICULTY_RATIOS } from '@/lib/assessment-config'

export const dynamic = 'force-dynamic'

interface Params {
  quizId: string
}

export default async function DevQuizPage({ params }: { params: Promise<Params> }) {
  const { quizId } = await params
  const supabase = await createClient()

  const { data: quiz } = await supabase
    .from('quizzes')
    .select('*')
    .eq('id', quizId)
    .single()

  if (!quiz) notFound()

  // Determine track from quiz title for backUrl context preservation
  const track = getTrackFromTitle(quiz.title)
  const backUrl = `/dev/quiz${track ? `?track=${track}` : ''}`

  // 1-attempt guard for mentees
  const { data: { user } } = await supabase.auth.getUser()
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (profile?.role === 'mentee') {
      const { data: existingAttempt } = await supabase
        .from('quiz_attempts')
        .select('id, retake_request_status')
        .eq('user_id', user.id)
        .eq('quiz_id', quizId)
        .not('completed_at', 'is', null)
        .order('completed_at', { ascending: false })
        .limit(1)
        .single()

      if (existingAttempt && existingAttempt.retake_request_status !== 'approved') {
        redirect(backUrl)
      }
    }
  }

  type SafeOption = { id: string; option_text: string; sort_order: number }
  type QuestionRow = {
    id: string
    question_text: string
    explanation: string | null
    points: number
    sort_order: number
    difficulty: string | null
    quiz_question_options_safe: SafeOption[]
  }

  let questions: QuestionRow[]

  // Pool quiz: draw random questions with difficulty ratio
  if (quiz.is_pool && quiz.questions_per_attempt) {
    // Find source quizzes (same quiz_type, non-pool, non-assessment)
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
      // Filter by question_category matching the pool quiz's category
      const poolCategory = getCategoryFromTitle(quiz.title)

      let questionQuery = supabase
        .from('quiz_questions')
        .select('id, question_text, explanation, points, sort_order, difficulty, quiz_question_options_safe(id, option_text, sort_order)')
        .in('quiz_id', sourceIds)
        .eq('is_published', true)

      if (poolCategory) {
        questionQuery = questionQuery.eq('question_category', poolCategory)
      }

      const { data: allQuestions } = await questionQuery

      // Group by difficulty
      const byDifficulty = new Map<string, QuestionRow[]>()
      for (const q of (allQuestions ?? []) as QuestionRow[]) {
        const d = q.difficulty ?? 'medium'
        if (!byDifficulty.has(d)) byDifficulty.set(d, [])
        byDifficulty.get(d)!.push(q)
      }

      // Select proportionally by difficulty ratio
      const total = quiz.questions_per_attempt
      const selected: QuestionRow[] = []
      const usedIds = new Set<string>()

      for (const [diff, ratio] of Object.entries(STEP4_DIFFICULTY_RATIOS)) {
        const target = Math.round(total * ratio)
        const pool = shuffleArray(byDifficulty.get(diff) ?? [])
        for (const q of pool) {
          if (usedIds.has(q.id)) continue
          if (selected.filter(s => (s.difficulty ?? 'medium') === diff).length >= target) break
          selected.push(q)
          usedIds.add(q.id)
        }
      }

      // Rounding fix — fill remaining from any difficulty
      if (selected.length < total) {
        const remaining = ((allQuestions ?? []) as QuestionRow[]).filter(q => !usedIds.has(q.id))
        for (const q of shuffleArray(remaining)) {
          if (selected.length >= total) break
          selected.push(q)
          usedIds.add(q.id)
        }
      }

      // Shuffle everything and shuffle options
      questions = shuffleArray(selected).map(q => ({
        ...q,
        quiz_question_options_safe: shuffleArray(q.quiz_question_options_safe)
          .map((opt, i) => ({ ...opt, sort_order: i + 1 })),
      }))
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
        (q as { quiz_question_options_safe: SafeOption[] }).quiz_question_options_safe
      ).map((opt, i) => ({ ...opt, sort_order: i + 1 })),
    }))) as QuestionRow[]
  }

  const sessionKey = crypto.randomUUID()

  return (
    <QuizTaker
      quiz={quiz}
      questions={questions}
      backUrl={backUrl}
      hideRetry
      sessionKey={sessionKey}
    />
  )
}

/** Determine track (java/javascript) from quiz title */
function getTrackFromTitle(title: string): string | null {
  if (title.includes('Java基礎') || title.includes('Spring Boot')) return 'java'
  if (title.includes('JavaScript') || title.includes('React')) return 'javascript'
  // SQL is shared between tracks — default to java
  if (title.includes('SQL')) return 'java'
  return null
}

/** Extract question_category from pool quiz title */
function getCategoryFromTitle(title: string): string | null {
  const mapping: Record<string, string> = {
    'Java基礎': 'java_core',
    'Spring Boot': 'spring_boot',
    'JavaScript基礎': 'javascript_core',
    'React': 'react',
  }
  for (const [keyword, category] of Object.entries(mapping)) {
    if (title.includes(keyword)) return category
  }
  if (title.includes('SQL')) return 'sql'
  return null
}
