import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'

interface SearchParams {
  level?: string
  type?: string
}

interface Quiz {
  id: string
  title: string
  quiz_type: string
  passing_score: number
  time_limit_minutes: number | null
}

const MASTERY_THRESHOLD = 80

export default async function QuizListPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()

  let userRole: string | null = null
  if (user) {
    const { data: prof } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    userRole = prof?.role ?? null
  }

  // Server-side mastery progress gate: if a specific level is requested, verify 80% mastery
  if (user && params.level && userRole !== 'admin' && userRole !== 'mentor') {
    const level = params.level
    const [vocabIds, grammarIds, kanjiIds, readingIds, listeningIds] = await Promise.all([
      supabase.from('jlpt_vocabulary').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_grammar').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_kanji').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_reading_passages').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_listening_scripts').select('id').eq('jlpt_level', level),
    ])

    const allIds = [
      ...(vocabIds.data ?? []).map(v => v.id),
      ...(grammarIds.data ?? []).map(g => g.id),
      ...(kanjiIds.data ?? []).map(k => k.id),
      ...(readingIds.data ?? []).map(r => r.id),
      ...(listeningIds.data ?? []).map(l => l.id),
    ]
    const totalCount = allIds.length

    if (totalCount > 0) {
      const { data: masteredItems } = await supabase
        .from('user_mastered_items')
        .select('item_id')
        .eq('user_id', user.id)
        .in('item_type', ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_kanji', 'jlpt_reading', 'jlpt_listening'])

      const masteredIdSet = new Set((masteredItems ?? []).map(m => m.item_id))
      const masteredCount = allIds.filter(id => masteredIdSet.has(id)).length
      const progressPct = Math.round((masteredCount / totalCount) * 100)

      if (progressPct < MASTERY_THRESHOLD) {
        redirect('/japanese/jlpt')
      }
    }
  }

  const quizTypes = params.type && ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening'].includes(params.type)
    ? [params.type]
    : ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening']

  let query = supabase
    .from('quizzes')
    .select('*')
    .in('quiz_type', quizTypes)
    .eq('is_assessment', false)
    .order('created_at', { ascending: true })

  if (params.level) {
    query = query.ilike('title', `%${params.level}%`)
  }

  const { data: quizzes } = await query

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

  const vocabQuizzes = quizzes?.filter(q => q.quiz_type === 'jlpt_vocab') ?? []
  const grammarQuizzes = quizzes?.filter(q => q.quiz_type === 'jlpt_grammar') ?? []
  const readingQuizzes = quizzes?.filter(q => q.quiz_type === 'jlpt_reading') ?? []
  const listeningQuizzes = quizzes?.filter(q => q.quiz_type === 'jlpt_listening') ?? []

  function renderQuizCard(quiz: Quiz) {
    const attempt = attemptMap[quiz.id]
    return (
      <Link
        key={quiz.id}
        href={`/japanese/jlpt/quiz/${quiz.id}`}
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

  const hasAny = vocabQuizzes.length > 0 || grammarQuizzes.length > 0 || readingQuizzes.length > 0 || listeningQuizzes.length > 0

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">生活日本語 テスト</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">テストを解いて実力を確認しましょう</p>
      </div>

      {!hasAny ? (
        <EmptyState title="テストはありません" description="まだ登録されたテストはありません" icon="📝" />
      ) : (
        <div className="space-y-8">
          {vocabQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">語彙テスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {vocabQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}

          {grammarQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">文法テスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {grammarQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}

          {readingQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">読解テスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {readingQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}

          {listeningQuizzes.length > 0 && (
            <div>
              <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">聴解テスト</h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {listeningQuizzes.map(renderQuizCard)}
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
