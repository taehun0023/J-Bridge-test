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

const CATEGORY_ORDER = ['it_terminology', 'sentence_pattern', 'business_expression', 'keigo']

const CATEGORY_TITLES: Record<string, string> = {
  it_terminology: 'ビジネス語彙テスト',
  sentence_pattern: '文章パターンテスト',
  business_expression: 'ビジネス表現テスト',
  keigo: '敬語テスト',
}

export default async function BusinessQuizTestsPage({
  searchParams,
}: {
  searchParams: Promise<{ type?: string }>
}) {
  const { type } = await searchParams
  const quizTypes = type && CATEGORY_ORDER.includes(type)
    ? [type]
    : CATEGORY_ORDER
  const pageTitle = (type && CATEGORY_TITLES[type]) || 'ビジネス日本語 理解度テスト'
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  let userRole: string | null = null
  const { data: prof } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  userRole = prof?.role ?? null

  // Fetch BJ pool quizzes
  const { data: poolQuizzes } = await supabase
    .from('quizzes')
    .select('*')
    .eq('is_pool', true)
    .in('quiz_type', quizTypes)
    .order('created_at', { ascending: true })

  // Fetch user's latest completed attempts for these quizzes
  let attemptMap: Record<string, { id: string; score: number; passed: boolean }> = {}
  if (poolQuizzes?.length) {
    const { data: attempts } = await supabase
      .from('quiz_attempts')
      .select('id, quiz_id, score, passed')
      .eq('user_id', user.id)
      .in('quiz_id', poolQuizzes.map(q => q.id))
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })

    attempts?.forEach((a) => {
      if (!attemptMap[a.quiz_id]) {
        attemptMap[a.quiz_id] = { id: a.id, score: a.score, passed: a.passed }
      }
    })
  }

  const quizzes = (poolQuizzes ?? [])
    .sort((a: Quiz, b: Quiz) => CATEGORY_ORDER.indexOf(a.quiz_type) - CATEGORY_ORDER.indexOf(b.quiz_type))

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
                quizHref={`/japanese/business/quiz/${quiz.id}`}
                userRole={userRole}
              />
            )
          })}
        </div>
      )}
    </div>
  )
}
