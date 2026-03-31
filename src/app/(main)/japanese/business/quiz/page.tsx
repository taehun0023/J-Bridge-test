import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import EmptyState from '@/components/ui/EmptyState'
import PracticeQuizCard from '@/components/quiz/PracticeQuizCard'

interface Quiz {
  id: string
  title: string
  quiz_type: string
  passing_score: number
  time_limit_minutes: number | null
}

interface SearchParams {
  type?: string
}

const MASTERY_THRESHOLD = 80

// Map quiz type to DB categories for mastery checking
const QUIZ_TYPE_TO_CATEGORIES: Record<string, string[]> = {
  it_terminology: ['business', 'it', 'dev'],
  sentence_pattern: ['sentence_pattern'],
  business_expression: ['expression'],
  keigo: ['keigo'],
}

export default async function BusinessQuizListPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const supabase = await createClient()
  const params = await searchParams

  const { data: { user } } = await supabase.auth.getUser()

  let userRole: string | null = null
  if (user) {
    const { data: prof } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    userRole = prof?.role ?? null
  }

  // Server-side mastery progress gate: if a specific type is requested, verify 80% mastery
  if (user && params.type && QUIZ_TYPE_TO_CATEGORIES[params.type] && userRole !== 'admin' && userRole !== 'mentor') {
    const dbCategories = QUIZ_TYPE_TO_CATEGORIES[params.type]

    const { data: items } = await supabase
      .from('it_glossary')
      .select('id')
      .in('category', dbCategories)

    const totalCount = items?.length ?? 0

    if (totalCount > 0) {
      const { data: masteredItems } = await supabase
        .from('user_mastered_items')
        .select('item_id')
        .eq('user_id', user.id)
        .eq('item_type', 'it_glossary')

      const masteredIdSet = new Set((masteredItems ?? []).map(m => m.item_id))
      const masteredCount = items!.filter(i => masteredIdSet.has(i.id)).length
      const progressPct = Math.round((masteredCount / totalCount) * 100)

      if (progressPct < MASTERY_THRESHOLD) {
        redirect('/japanese/business')
      }
    }
  }

  const validTypes = ['it_terminology', 'sentence_pattern', 'business_expression', 'keigo']

  // Require a specific type param — don't show all quizzes at once
  if (!params.type || !validTypes.includes(params.type)) {
    redirect('/japanese/business')
  }

  const quizTypes = [params.type]

  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('*')
    .in('quiz_type', quizTypes)
    .eq('is_assessment', false)
    .eq('is_pool', false)
    .order('created_at', { ascending: true })

  // Fetch user's attempts (include id + retake_request_status for PracticeQuizCard)
  let attemptMap: Record<string, { id: string; score: number; passed: boolean; retake_request_status: string | null }> = {}
  if (user && quizzes?.length) {
    const { data: attempts } = await supabase
      .from('quiz_attempts')
      .select('id, quiz_id, score, passed, retake_request_status')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })

    attempts?.forEach((a) => {
      // Keep the most recent attempt per quiz
      if (!attemptMap[a.quiz_id]) {
        attemptMap[a.quiz_id] = { id: a.id, score: a.score, passed: a.passed, retake_request_status: a.retake_request_status }
      }
    })
  }

  const itTermQuizzes = quizzes?.filter(q => q.quiz_type === 'it_terminology') ?? []
  const patternQuizzes = quizzes?.filter(q => q.quiz_type === 'sentence_pattern') ?? []
  const expressionQuizzes = quizzes?.filter(q => q.quiz_type === 'business_expression') ?? []
  const keigoQuizzes = quizzes?.filter(q => q.quiz_type === 'keigo') ?? []

  function renderQuizCard(quiz: Quiz) {
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
  }

  const hasAny = itTermQuizzes.length > 0 || patternQuizzes.length > 0 || expressionQuizzes.length > 0 || keigoQuizzes.length > 0

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ビジネス日本語 テスト</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">テストを解いて実力を確認しましょう</p>
      </div>

      {!hasAny ? (
        <EmptyState title="テストはありません" description="まだ登録されたテストはありません" icon="📝" />
      ) : (
        <div className="space-y-8">
          {itTermQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">ビジネス語彙テスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {itTermQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}

          {patternQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">文章パターンテスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {patternQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}

          {expressionQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">ビジネス表現テスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {expressionQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}

          {keigoQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">敬語テスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {keigoQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
