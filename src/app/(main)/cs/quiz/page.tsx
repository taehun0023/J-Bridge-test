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

const POOL_CATEGORY_ORDER = ['algorithm', 'data_structure', 'basic_theory', 'database', 'network', 'os', 'security']

const POOL_CATEGORY_LABELS: Record<string, string> = {
  algorithm: 'アルゴリズム',
  data_structure: 'データ構造',
  basic_theory: '基礎理論',
  database: 'データベース',
  network: 'ネットワーク',
  os: 'OS',
  security: 'セキュリティ',
}

export default async function CsQuizListPage({
  searchParams,
}: {
  searchParams: Promise<{ category?: string }>
}) {
  const { category } = await searchParams
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  let userRole: string | null = null
  const { data: prof } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  userRole = prof?.role ?? null

  // Fetch CS pool quizzes only
  const { data: poolQuizzes } = await supabase
    .from('quizzes')
    .select('*')
    .eq('quiz_type', 'cs_knowledge')
    .eq('is_pool', true)
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

  // Sort by category order and optionally filter
  let quizzes = (poolQuizzes ?? []).sort((a: Quiz, b: Quiz) => {
    const aIdx = POOL_CATEGORY_ORDER.findIndex(cat => a.title.includes(POOL_CATEGORY_LABELS[cat] ?? ''))
    const bIdx = POOL_CATEGORY_ORDER.findIndex(cat => b.title.includes(POOL_CATEGORY_LABELS[cat] ?? ''))
    return (aIdx === -1 ? 99 : aIdx) - (bIdx === -1 ? 99 : bIdx)
  })

  // Filter by category if specified
  if (category && POOL_CATEGORY_LABELS[category]) {
    quizzes = quizzes.filter((q: Quiz) => q.title.includes(POOL_CATEGORY_LABELS[category]))
  }

  const pageTitle = (category && POOL_CATEGORY_LABELS[category])
    ? `CS知識 ${POOL_CATEGORY_LABELS[category]}テスト`
    : 'CS知識 理解度テスト'

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{pageTitle}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">ランダム出題・難易度別配分で出題されます</p>
      </div>

      {quizzes.length === 0 ? (
        <EmptyState title="テストはありません" description="まだ登録されたテストはありません" icon="📝" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {quizzes.map((quiz: Quiz) => {
            const attempt = attemptMap[quiz.id] ?? null
            return (
              <PracticeQuizCard
                key={quiz.id}
                quiz={quiz}
                attempt={attempt}
                quizHref={`/cs/quiz/${quiz.id}`}
                userRole={userRole}
              />
            )
          })}
        </div>
      )}
    </div>
  )
}
