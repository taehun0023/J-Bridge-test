import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import EmptyState from '@/components/ui/EmptyState'
import PracticeQuizCard from '@/components/quiz/PracticeQuizCard'

export const dynamic = 'force-dynamic'

interface Quiz {
  id: string
  title: string
  quiz_type: string
  passing_score: number
  time_limit_minutes: number | null
  questions_per_attempt: number | null
}

const JAVA_TRACK_KEYWORDS = ['Java基礎', 'Spring Boot', 'SQL テスト']
const JS_TRACK_KEYWORDS = ['JavaScript基礎', 'React', 'SQL テスト (共通)']

export default async function DevQuizListPage({
  searchParams,
}: {
  searchParams: Promise<{ track?: string }>
}) {
  const { track } = await searchParams
  const activeTrack = track === 'javascript' ? 'javascript' : 'java'
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  let userRole: string | null = null
  const { data: prof } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  userRole = prof?.role ?? null

  // Fetch dev pool quizzes
  const { data: poolQuizzes } = await supabase
    .from('quizzes')
    .select('*')
    .eq('is_pool', true)
    .in('quiz_type', ['core_programming', 'framework'])
    .order('created_at', { ascending: true })

  // Fetch user's latest completed attempts
  let attemptMap: Record<string, { id: string; score: number; passed: boolean; retake_request_status: string | null }> = {}
  if (poolQuizzes?.length) {
    const { data: attempts } = await supabase
      .from('quiz_attempts')
      .select('id, quiz_id, score, passed, retake_request_status')
      .eq('user_id', user.id)
      .in('quiz_id', poolQuizzes.map(q => q.id))
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })

    attempts?.forEach((a) => {
      if (!attemptMap[a.quiz_id]) {
        attemptMap[a.quiz_id] = { id: a.id, score: a.score, passed: a.passed, retake_request_status: a.retake_request_status }
      }
    })
  }

  // Filter by track
  const trackKeywords = activeTrack === 'java' ? JAVA_TRACK_KEYWORDS : JS_TRACK_KEYWORDS
  const filteredQuizzes = (poolQuizzes ?? []).filter((q: Quiz) =>
    trackKeywords.some(kw => q.title.includes(kw))
  )

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">開発実務能力 理解度テスト</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">ランダム出題・難易度別配分で出題されます</p>
      </div>

      {/* Track Toggle */}
      <div className="mb-6 flex border-b border-gray-200 dark:border-gray-700">
        <a
          href="/dev/quiz?track=java"
          className={`px-4 py-2.5 text-sm font-medium border-b-2 transition-colors ${
            activeTrack === 'java'
              ? 'border-orange-600 text-orange-700 dark:border-orange-400 dark:text-orange-400'
              : 'border-transparent text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300'
          }`}
        >
          Java トラック
        </a>
        <a
          href="/dev/quiz?track=javascript"
          className={`px-4 py-2.5 text-sm font-medium border-b-2 transition-colors ${
            activeTrack === 'javascript'
              ? 'border-yellow-600 text-yellow-700 dark:border-yellow-400 dark:text-yellow-400'
              : 'border-transparent text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300'
          }`}
        >
          JavaScript トラック
        </a>
      </div>

      {filteredQuizzes.length === 0 ? (
        <EmptyState title="テストはありません" description="まだ登録されたテストはありません" icon="📝" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {filteredQuizzes.map((quiz: Quiz) => {
            const attempt = attemptMap[quiz.id] ?? null
            return (
              <PracticeQuizCard
                key={quiz.id}
                quiz={quiz}
                attempt={attempt}
                quizHref={`/dev/quiz/${quiz.id}`}
                userRole={userRole}
              />
            )
          })}
        </div>
      )}
    </div>
  )
}
