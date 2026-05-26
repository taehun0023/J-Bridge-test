import { createClient } from '@/lib/supabase/server'
import { notFound, redirect } from 'next/navigation'
import QuizTaker from '@/components/japanese/QuizTaker'
import { shuffleArray } from '@/lib/shuffle'
import { STEP4_DIFFICULTY_RATIOS } from '@/lib/assessment-config'
import { getDevQuizDef, getDevQuizUnlockState } from '@/lib/dev-quiz'
import { getDevCourseBySubject } from '@/lib/dev-course'
import type { DevSubjectSlug } from '@/lib/dev-content'

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

  const backUrl = '/dev/quiz'

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const isBypass = profile?.role === 'admin' || profile?.role === 'mentor'

  const def = getDevQuizDef(quizId)

  // Quiz lock check for mentees
  if (!isBypass && def) {
    const slug = def.courseId.replace(/^dev-/, '') as DevSubjectSlug
    const course = await getDevCourseBySubject(supabase, slug, user.id)
    const unlockState = getDevQuizUnlockState(
      course?.completedLessons ?? 0,
      course?.totalLessons ?? 0
    )
    if (!unlockState.unlocked) {
      redirect(backUrl)
    }
  }

  // Mentees can freely retake practice quizzes

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
      const questionCategory = def?.questionCategory ?? null

      let questionQuery = supabase
        .from('quiz_questions')
        .select('id, question_text, explanation, points, sort_order, difficulty, quiz_question_options_safe(id, option_text, sort_order)')
        .in('quiz_id', sourceIds)
        .eq('is_published', true)

      if (questionCategory) {
        questionQuery = questionQuery.eq('question_category', questionCategory)
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

  if (questions.length === 0) {
    return (
      <div className="mx-auto max-w-lg py-20 text-center">
        <p className="text-4xl">📝</p>
        <h1 className="mt-4 text-xl font-bold text-gray-900 dark:text-white">
          問題がまだ登録されていません
        </h1>
        <p className="mt-2 text-sm text-gray-500 dark:text-gray-400">
          この科目の問題プールは現在準備中です。しばらくお待ちください。
        </p>
        <a
          href={backUrl}
          className="mt-6 inline-block rounded-lg bg-orange-600 px-5 py-2.5 text-sm font-medium text-white transition-colors hover:bg-orange-500"
        >
          テスト一覧に戻る
        </a>
      </div>
    )
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
