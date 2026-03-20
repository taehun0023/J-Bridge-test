import { redirect } from 'next/navigation'
import EmptyState from '@/components/ui/EmptyState'
import PracticeQuizCard from '@/components/quiz/PracticeQuizCard'
import {
  getCsCourseIdForQuiz,
  getCsQuizCategoryFromQuiz,
  getCsQuizCategoryLabel,
  getCsQuizSetByQuizId,
  getCsQuizSetUnlockState,
  getCsQuizUnlockState,
  getQuizCardSortKey,
  isKnownCsPoolQuiz,
  normalizeCsQuizCategory,
} from '@/lib/cs-quiz'
import { getAllCsCoursesWithProgress } from '@/lib/cs-course'
import { createClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

interface Quiz {
  id: string
  title: string
  quiz_type: string
  passing_score: number
  time_limit_minutes: number | null
  questions_per_attempt: number | null
}

export default async function CsQuizListPage({
  searchParams,
}: {
  searchParams: Promise<{ category?: string }>
}) {
  const { category } = await searchParams
  const supabase = await createClient()

  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()

  const userRole = profile?.role ?? null
  const isBypass = userRole === 'admin' || userRole === 'mentor'

  const [{ data: poolQuizzes }, { data: attempts }, courses] = await Promise.all([
    supabase
      .from('quizzes')
      .select('*')
      .eq('quiz_type', 'cs_knowledge')
      .eq('is_pool', true)
      .order('created_at', { ascending: true }),
    supabase
      .from('quiz_attempts')
      .select('id, quiz_id, score, passed, retake_request_status, completed_at')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null),
    getAllCsCoursesWithProgress(supabase, user.id, isBypass),
  ])

  const attemptMap: Record<
    string,
    { id: string; score: number; passed: boolean; retake_request_status: string | null }
  > = {}

  for (const attempt of attempts ?? []) {
    if (!attemptMap[attempt.quiz_id]) {
      attemptMap[attempt.quiz_id] = {
        id: attempt.id,
        score: attempt.score,
        passed: attempt.passed,
        retake_request_status: attempt.retake_request_status,
      }
    }
  }

  const courseMap = new Map(courses.map((course) => [course.id, course]))
  const normalizedCategory = normalizeCsQuizCategory(category)

  let quizzes = ((poolQuizzes ?? []) as Quiz[]).filter((quiz) => isKnownCsPoolQuiz(quiz.id))

  if (normalizedCategory) {
    quizzes = quizzes.filter(
      (quiz) => getCsQuizCategoryFromQuiz(quiz.id, quiz.title) === normalizedCategory
    )
  }

  quizzes = quizzes.sort(
    (a, b) => getQuizCardSortKey(a.id, a.title) - getQuizCardSortKey(b.id, b.title)
  )

  const pageTitle = normalizedCategory
    ? `CS知識 ${getCsQuizCategoryLabel(normalizedCategory)} 理解度テスト`
    : 'CS知識 理解度テスト'

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{pageTitle}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">
          各科目の学習進行率が 75% 以上になると、理解度テストを受験できます。
        </p>
      </div>

      {quizzes.length === 0 ? (
        <EmptyState
          title="該当する理解度テストがありません"
          description="まだ問題が準備中か、選択したカテゴリに対応するテストがありません。"
          icon="Q"
        />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {quizzes.map((quiz) => {
            const quizSet = getCsQuizSetByQuizId(quiz.id)
            const attempt = attemptMap[quiz.id] ?? null
            const courseId = getCsCourseIdForQuiz(quiz.id, quiz.title)
            const course = courseId ? courseMap.get(courseId) : null
            const quizCategory = getCsQuizCategoryFromQuiz(quiz.id, quiz.title)
            const unlockState = quizCategory
              ? getCsQuizSetUnlockState(
                  quizCategory,
                  course?.completedLessons ?? 0,
                  course?.totalLessons ?? 0
                ).find((item) => item.quizId === quiz.id)
              : getCsQuizUnlockState(course?.completedLessons ?? 0, course?.totalLessons ?? 0)
            const locked = !isBypass && !(unlockState?.unlocked ?? false)
            let lockedReason: string | null = null

            if (locked) {
              if (quizSet && quizCategory) {
                lockedReason =
                  getCsQuizSetUnlockState(
                    quizCategory,
                    course?.completedLessons ?? 0,
                    course?.totalLessons ?? 0
                  ).find((item) => item.quizId === quiz.id)?.description ?? null
              } else {
                lockedReason = getCsQuizUnlockState(
                  course?.completedLessons ?? 0,
                  course?.totalLessons ?? 0
                ).lockedReason
              }
            }

            return (
              <PracticeQuizCard
                key={quiz.id}
                quiz={{
                  ...quiz,
                  title: quizSet?.title ?? quiz.title,
                }}
                attempt={attempt}
                quizHref={`/cs/quiz/${quiz.id}`}
                userRole={userRole}
                locked={locked}
                lockedReason={lockedReason}
              />
            )
          })}
        </div>
      )}
    </div>
  )
}
