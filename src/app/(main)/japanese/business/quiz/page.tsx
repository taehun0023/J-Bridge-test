import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'

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

export default async function BusinessQuizListPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const supabase = await createClient()
  const params = await searchParams

  const { data: { user } } = await supabase.auth.getUser()

  const validTypes = ['it_terminology', 'sentence_pattern', 'business_expression']
  const quizTypes = params.type && validTypes.includes(params.type)
    ? [params.type]
    : validTypes

  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('*')
    .in('quiz_type', quizTypes)
    .eq('is_assessment', false)
    .order('created_at', { ascending: true })

  // Fetch user's attempts
  let attemptMap: Record<string, { score: number; passed: boolean }> = {}
  if (user && quizzes?.length) {
    const { data: attempts } = await supabase
      .from('quiz_attempts')
      .select('quiz_id, score, passed')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null)
      .order('score', { ascending: false })

    attempts?.forEach((a) => {
      if (!attemptMap[a.quiz_id] || a.score > attemptMap[a.quiz_id].score) {
        attemptMap[a.quiz_id] = { score: a.score, passed: a.passed }
      }
    })
  }

  const itTermQuizzes = quizzes?.filter(q => q.quiz_type === 'it_terminology') ?? []
  const patternQuizzes = quizzes?.filter(q => q.quiz_type === 'sentence_pattern') ?? []
  const expressionQuizzes = quizzes?.filter(q => q.quiz_type === 'business_expression') ?? []

  function renderQuizCard(quiz: Quiz) {
    const attempt = attemptMap[quiz.id]
    return (
      <Link
        key={quiz.id}
        href={`/japanese/business/quiz/${quiz.id}`}
        className="group rounded-xl border border-gray-200 bg-white p-5 transition-shadow hover:shadow-md dark:border-gray-700 dark:bg-gray-800"
      >
        <div className="flex items-start justify-between">
          <h3 className="font-semibold text-gray-900 group-hover:text-blue-600 dark:text-white">
            {quiz.title}
          </h3>
          {attempt && (
            <Badge
              label={attempt.passed ? '合格' : '不合格'}
              variant="default"
            />
          )}
        </div>
        <div className="mt-3 flex items-center gap-3 text-sm text-gray-500 dark:text-gray-400">
          {quiz.time_limit_minutes && (
            <span>制限時間 {quiz.time_limit_minutes}分</span>
          )}
          <span>合格 {quiz.passing_score}点</span>
        </div>
        {attempt && (
          <div className="mt-2 text-sm">
            <span className={attempt.passed ? 'text-green-600' : 'text-red-600'}>
              最高点: {attempt.score}点
            </span>
          </div>
        )}
      </Link>
    )
  }

  const hasAny = itTermQuizzes.length > 0 || patternQuizzes.length > 0 || expressionQuizzes.length > 0

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
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">IT語彙テスト</h2>
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
        </div>
      )}
    </div>
  )
}
