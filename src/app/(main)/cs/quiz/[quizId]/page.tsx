import { createClient } from '@/lib/supabase/server'
import { notFound, redirect } from 'next/navigation'
import QuizTaker from '@/components/japanese/QuizTaker'
import { shuffleArray } from '@/lib/shuffle'
import { STEP3_DIFFICULTY_RATIOS } from '@/lib/assessment-config'

export const dynamic = 'force-dynamic'

interface Params {
  quizId: string
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

  const backUrl = '/cs/quiz'

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

  // Pool quiz: draw random questions with difficulty ratio (easy 20% / medium 40% / hard 40%)
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
      // 2. Fetch all published questions from source quizzes
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

      // 3. Group by difficulty
      const byDifficulty = new Map<string, QuestionRow[]>()
      for (const q of (allQuestions ?? []) as QuestionRow[]) {
        const d = q.difficulty ?? 'medium'
        if (!byDifficulty.has(d)) byDifficulty.set(d, [])
        byDifficulty.get(d)!.push(q)
      }

      // 4. Select proportionally by difficulty ratio
      const total = quiz.questions_per_attempt
      const selected: QuestionRow[] = []
      const usedIds = new Set<string>()

      for (const [diff, ratio] of Object.entries(STEP3_DIFFICULTY_RATIOS)) {
        const target = Math.round(total * ratio)
        const pool = shuffleArray(byDifficulty.get(diff) ?? [])
        for (const q of pool) {
          if (usedIds.has(q.id)) continue
          if (selected.filter(s => (s.difficulty ?? 'medium') === diff).length >= target) break
          selected.push(q)
          usedIds.add(q.id)
        }
      }

      // 5. Rounding fix — fill remaining from any difficulty
      if (selected.length < total) {
        const remaining = ((allQuestions ?? []) as QuestionRow[]).filter(q => !usedIds.has(q.id))
        for (const q of shuffleArray(remaining)) {
          if (selected.length >= total) break
          selected.push(q)
          usedIds.add(q.id)
        }
      }

      // 6. Shuffle everything and shuffle options
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

/** Extract question_category from pool quiz title */
function getCategoryFromTitle(title: string): string | null {
  const mapping: Record<string, string> = {
    'アルゴリズム': 'algorithm',
    'データ構造': 'data_structure',
    '基礎理論': 'basic_theory',
    'データベース': 'database',
    'ネットワーク': 'network',
    'OS': 'os',
    'セキュリティ': 'security',
  }
  for (const [keyword, category] of Object.entries(mapping)) {
    if (title.includes(keyword)) return category
  }
  return null
}
