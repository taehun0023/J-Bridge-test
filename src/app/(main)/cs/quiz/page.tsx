import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'

interface SearchParams {
  category?: string
}

interface Quiz {
  id: string
  title: string
  quiz_type: string
  passing_score: number
  time_limit_minutes: number | null
}

const CATEGORY_MAP: Record<string, { label: string; keyword: string }> = {
  basic_theory: { label: '基礎理論', keyword: '基礎理論' },
  algorithms: { label: 'アルゴリズム', keyword: 'アルゴリズム' },
  data_structures: { label: 'データ構造', keyword: 'データ構造' },
  computer_architecture: { label: 'コンピュータシステム', keyword: 'コンピュータシステム' },
  database: { label: 'データベース', keyword: 'データベース' },
  networking: { label: 'ネットワーク', keyword: 'ネットワーク' },
  security: { label: 'セキュリティ', keyword: 'セキュリティ' },
}

const ALL_SECTIONS = [
  ...Object.values(CATEGORY_MAP),
  { label: '総合', keyword: '総合' },
]

export default async function CsQuizListPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const categoryFilter = params.category ?? ''
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()

  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('*')
    .eq('quiz_type', 'cs_knowledge')
    .eq('is_assessment', false)
    .order('created_at', { ascending: true })

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

  function renderQuizCard(quiz: Quiz) {
    const attempt = attemptMap[quiz.id]
    return (
      <Link
        key={quiz.id}
        href={`/cs/quiz/${quiz.id}`}
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

  const allQuizzes = quizzes ?? []

  // Filter by category if specified
  const mapped = CATEGORY_MAP[categoryFilter]
  const filteredSections = mapped
    ? [mapped]
    : ALL_SECTIONS

  const sections = filteredSections.map(section => ({
    ...section,
    quizzes: allQuizzes.filter(q => q.title.includes(section.keyword)),
  })).filter(s => s.quizzes.length > 0)

  const pageTitle = mapped ? `${mapped.label} テスト` : 'CS知識 テスト'
  const pageDesc = mapped
    ? `${mapped.label}のテストに挑戦しましょう`
    : 'ITパスポート・基本情報技術者試験のCS知識テストに挑戦しましょう'

  return (
    <div>
      <div className="mb-6">
        <div className="flex items-center gap-3">
          {mapped && (
            <Link
              href="/cs/quiz"
              className="text-sm text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
            >
              ← 全テスト
            </Link>
          )}
        </div>
        <h1 className="mt-1 text-2xl font-bold text-gray-900 dark:text-white">{pageTitle}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{pageDesc}</p>
      </div>

      {sections.length === 0 ? (
        <EmptyState title="テストはありません" description="まだ登録されたテストはありません" icon="📝" />
      ) : (
        <div className="space-y-8">
          {sections.map(section => (
            <div key={section.label}>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">{section.label}</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {section.quizzes.map(renderQuizCard)}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
