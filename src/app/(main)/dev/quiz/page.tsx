import { redirect } from 'next/navigation'
import EmptyState from '@/components/ui/EmptyState'
import PracticeQuizCard from '@/components/quiz/PracticeQuizCard'
import { createClient } from '@/lib/supabase/server'
import { getAllDevCourses } from '@/lib/dev-course'
import {
  getDevQuizUnlockState,
  isKnownDevPoolQuiz,
  getDevQuizDef,
  getDevQuizSortKey,
} from '@/lib/dev-quiz'

export const dynamic = 'force-dynamic'

interface Quiz {
  id: string
  title: string
  quiz_type: string
  passing_score: number
  time_limit_minutes: number | null
  questions_per_attempt: number | null
}

export default async function DevQuizListPage({
  searchParams,
}: {
  searchParams: Promise<Record<string, string | string[] | undefined>>
}) {
  const sp = await searchParams
  const filterCategory = typeof sp.category === 'string' ? sp.category : null

  const supabase = await createClient()

  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const userRole = profile?.role ?? null
  const isBypass = userRole === 'admin' || userRole === 'mentor'

  const [{ data: poolQuizzes }, { data: attempts }, courses] = await Promise.all([
    supabase
      .from('quizzes')
      .select('*')
      .eq('is_pool', true)
      .in('quiz_type', ['core_programming', 'framework'])
      .order('created_at', { ascending: true }),
    supabase
      .from('quiz_attempts')
      .select('id, quiz_id, score, passed, retake_request_status, completed_at')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false }),
    getAllDevCourses(supabase, user.id),
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

  const courseMap = new Map(courses.map((c) => [c.id, c]))

  // Filter to known quiz definitions only, then sort by definition order
  const quizzes = ((poolQuizzes ?? []) as Quiz[])
    .filter((q) => isKnownDevPoolQuiz(q.id))
    .filter((q) => {
      if (!filterCategory) return true
      const def = getDevQuizDef(q.id)
      return def?.category === filterCategory
    })
    .sort((a, b) => getDevQuizSortKey(a.id) - getDevQuizSortKey(b.id))

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">開発実務能力 理解度テスト</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">
          科目ごとの進行率が75%以上になるとテストが解放されます。
        </p>
      </div>

      {quizzes.length === 0 ? (
        <EmptyState
          title="テストが見つかりません"
          description="まだ登録された理解度テストがありません。"
          icon="📝"
        />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {quizzes.map((quiz) => {
            const attempt = attemptMap[quiz.id] ?? null
            const def = getDevQuizDef(quiz.id)
            const courseId = def?.courseId ?? null
            const course = courseId ? courseMap.get(courseId) : null
            const unlockState = getDevQuizUnlockState(
              course?.completedLessons ?? 0,
              course?.totalLessons ?? 0
            )
            const locked = !isBypass && !unlockState.unlocked

            return (
              <PracticeQuizCard
                key={quiz.id}
                quiz={quiz}
                attempt={attempt}
                quizHref={`/dev/quiz/${quiz.id}`}
                userRole={userRole}
                locked={locked}
                lockedReason={locked ? unlockState.lockedReason : null}
              />
            )
          })}
        </div>
      )}
    </div>
  )
}
