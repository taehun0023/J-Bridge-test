import { createClient } from '@/lib/supabase/server'
import { notFound, redirect } from 'next/navigation'
import QuizTaker from '@/components/japanese/QuizTaker'
import { shuffleArray } from '@/lib/shuffle'
import {
  getCsQuizSetByQuizId,
  getCsQuizSetUnlockState,
  getCsCourseIdForQuiz,
  getCsQuizCategoryFromQuiz,
  getCsQuizListHref,
  getCsQuizUnlockState,
  getCsQuestionCategoryForPoolQuiz,
  getDifficultyRatiosForCsQuiz,
} from '@/lib/cs-quiz'
import { getAllCsCoursesWithProgress } from '@/lib/cs-course'

export const dynamic = 'force-dynamic'

interface Params {
  quizId: string
}

interface SafeOption {
  id: string
  option_text: string
  sort_order: number
}

interface QuestionRow {
  id: string
  question_text: string
  explanation: string | null
  points: number
  sort_order: number
  difficulty: string | null
  quiz_question_options_safe: SafeOption[]
}

export default async function CsQuizPage({ params }: { params: Promise<Params> }) {
  const { quizId } = await params
  const supabase = await createClient()

  const {
    data: { user },
  } = await supabase.auth.getUser()

  const { data: quiz } = await supabase.from('quizzes').select('*').eq('id', quizId).single()
  if (!quiz) notFound()

  const quizSet = getCsQuizSetByQuizId(quiz.id)
  const quizCategory = getCsQuizCategoryFromQuiz(quiz.id, quiz.title)
  const backUrl = getCsQuizListHref(quizCategory)

  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    const isMentee = profile?.role === 'mentee'
    const isAdmin = profile?.role === 'admin'
    const isBypass = profile?.role === 'admin' || profile?.role === 'mentor'

    if (!isBypass) {
      const courseId = getCsCourseIdForQuiz(quiz.id, quiz.title)

      if (courseId) {
        const courses = await getAllCsCoursesWithProgress(supabase, user.id, isBypass)
        const course = courses.find((item) => item.id === courseId)

        if (quizSet && quizCategory) {
          const unlocks = getCsQuizSetUnlockState(
            quizCategory,
            course?.completedLessons ?? 0,
            course?.totalLessons ?? 0
          )
          const currentUnlock = unlocks.find((item) => item.quizId === quizId)
          if (!currentUnlock?.unlocked) {
            redirect(backUrl)
          }
        } else {
          const unlockState = getCsQuizUnlockState(
            course?.completedLessons ?? 0,
            course?.totalLessons ?? 0
          )
          if (!unlockState.unlocked) {
            redirect(backUrl)
          }
        }
      }
    }

    if (isMentee) {
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

  let questions: QuestionRow[]

  if (quiz.is_pool && quiz.questions_per_attempt) {
    const { data: sourceQuizzes } = await supabase
      .from('quizzes')
      .select('id')
      .eq('quiz_type', quiz.quiz_type)
      .eq('is_pool', false)
      .eq('is_assessment', false)

    const sourceIds = (sourceQuizzes ?? []).map((item) => item.id)

    if (sourceIds.length === 0) {
      questions = []
    } else {
      const poolCategory = getCsQuestionCategoryForPoolQuiz(quiz.id, quiz.title)

      let query = supabase
        .from('quiz_questions')
        .select(
          'id, question_text, explanation, points, sort_order, difficulty, quiz_question_options_safe(id, option_text, sort_order)'
        )
        .in('quiz_id', sourceIds)
        .eq('is_published', true)

      if (poolCategory) {
        query = query.eq('question_category', poolCategory)
      }

      const { data: allQuestions } = await query
      const ratios = getDifficultyRatiosForCsQuiz(quiz.id)
      const byDifficulty = new Map<string, QuestionRow[]>()

      for (const question of (allQuestions ?? []) as QuestionRow[]) {
        const difficulty = question.difficulty ?? 'medium'
        if (!byDifficulty.has(difficulty)) byDifficulty.set(difficulty, [])
        byDifficulty.get(difficulty)?.push(question)
      }

      const selected: QuestionRow[] = []
      const usedIds = new Set<string>()

      for (const [difficulty, ratio] of Object.entries(ratios)) {
        const targetCount = Math.round(quiz.questions_per_attempt * ratio)
        const pool = shuffleArray(byDifficulty.get(difficulty) ?? [])

        for (const question of pool) {
          if (usedIds.has(question.id)) continue
          if (
            selected.filter((item) => (item.difficulty ?? 'medium') === difficulty).length >=
            targetCount
          ) {
            break
          }

          selected.push(question)
          usedIds.add(question.id)
        }
      }

      if (selected.length < quiz.questions_per_attempt) {
        const remaining = ((allQuestions ?? []) as QuestionRow[]).filter(
          (question) => !usedIds.has(question.id)
        )

        for (const question of shuffleArray(remaining)) {
          if (selected.length >= quiz.questions_per_attempt) break
          selected.push(question)
          usedIds.add(question.id)
        }
      }

      questions = shuffleArray(selected).map((question) => ({
        ...question,
        quiz_question_options_safe: shuffleArray(question.quiz_question_options_safe).map(
          (option, index) => ({
            ...option,
            sort_order: index + 1,
          })
        ),
      }))
    }
  } else {
    const { data: rawQuestions } = await supabase
      .from('quiz_questions')
      .select(
        'id, question_text, explanation, points, sort_order, quiz_question_options_safe(id, option_text, sort_order)'
      )
      .eq('quiz_id', quizId)
      .eq('is_published', true)
      .order('sort_order', { ascending: true })

    questions = shuffleArray(
      (rawQuestions ?? []).map((question) => ({
        ...question,
        quiz_question_options_safe: shuffleArray(
          (question as { quiz_question_options_safe: SafeOption[] }).quiz_question_options_safe
        ).map((option, index) => ({
          ...option,
          sort_order: index + 1,
        })),
      }))
    ) as QuestionRow[]
  }

  return (
    <QuizTaker
      quiz={{
        ...quiz,
        title: quizSet?.title ?? quiz.title,
      }}
      questions={questions}
      backUrl={backUrl}
      hideRetry
      sessionKey={crypto.randomUUID()}
    />
  )
}
