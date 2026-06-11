import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import CodeReadingQuiz from './CodeReadingQuiz'

interface SearchParams {
  lang?: string
  mode?: string
  qid?: string
  difficulty?: string
  page?: string
}

const LANGUAGES = [
  { key: 'java', label: 'Java', description: 'オブジェクト指向の基礎から学ぶ', color: 'text-orange-600 dark:text-orange-400' },
  { key: 'javascript', label: 'JavaScript', description: 'Web開発の基礎を学ぶ', color: 'text-yellow-600 dark:text-yellow-400' },
  { key: 'sql', label: 'SQL', description: 'データベース操作の基礎を学ぶ', color: 'text-blue-600 dark:text-blue-400' },
]

const DIFFICULTY_LABELS: Record<string, string> = { easy: '初級', medium: '中級', hard: '上級' }
const DIFFICULTY_COLORS: Record<string, string> = {
  easy: 'bg-green-100 text-green-700 dark:bg-green-900/40 dark:text-green-300',
  medium: 'bg-amber-100 text-amber-700 dark:bg-amber-900/40 dark:text-amber-300',
  hard: 'bg-red-100 text-red-700 dark:bg-red-900/40 dark:text-red-300',
}

export default async function CodingProblemsPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const lang = params.lang ?? ''
  const mode = params.mode ?? ''

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // ─── Hub: 言語選択 ───
  if (!lang || !LANGUAGES.some(l => l.key === lang)) {
    const langCounts: Record<string, number> = {}
    for (const l of LANGUAGES) {
      const [{ count: rc }, { count: wc }] = await Promise.all([
        supabase.from('quiz_questions').select('id', { count: 'exact', head: true }).eq('question_type', 'code_reading').eq('question_category', l.key),
        supabase.from('coding_problems').select('id', { count: 'exact', head: true }).eq('language', l.key).not('solution_code', 'is', null),
      ])
      langCounts[l.key] = (rc ?? 0) + (wc ?? 0)
    }

    return (
      <div>
        <div className="mb-6">
          <div className="flex items-center gap-3">
            <h1 className="text-2xl font-bold text-gray-900 dark:text-white">コーディング学習</h1>
            <span className="rounded-full bg-amber-100 px-2.5 py-0.5 text-xs font-semibold text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">Beta</span>
          </div>
          <p className="mt-1 text-gray-500 dark:text-gray-400">言語別の基礎概念をコードで学びます</p>
        </div>
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {LANGUAGES.map(l => (
            <Link key={l.key} href={`/coding/problems?lang=${l.key}`}>
              <Card className="h-full transition-shadow hover:shadow-md">
                <h3 className={`text-lg font-bold ${l.color}`}>{l.label}</h3>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{l.description}</p>
                <p className="mt-2 text-xs text-gray-400">{langCounts[l.key] ?? 0}問</p>
              </Card>
            </Link>
          ))}
        </div>
      </div>
    )
  }

  const langInfo = LANGUAGES.find(l => l.key === lang)!

  // ─── コード解析: 全問一括クイズ ───
  if (mode === 'reading') {
    // Instant client-side grading needs is_correct; base-table SELECT is
    // admin/mentor-only under RLS (00178), so read via service role.
    const dbClient = createServiceRoleClient() ?? supabase
    const { data: questions } = await dbClient
      .from('quiz_questions')
      .select('id, question_text, difficulty, explanation, quiz_question_options(id, option_text, is_correct, sort_order)')
      .eq('question_type', 'code_reading')
      .eq('question_category', lang)
      .eq('is_published', true)
      .order('sort_order', { ascending: true })

    const diffOrder: Record<string, number> = { easy: 0, medium: 1, hard: 2 }
    const sorted = (questions ?? []).sort((a, b) =>
      (diffOrder[a.difficulty ?? 'easy'] ?? 9) - (diffOrder[b.difficulty ?? 'easy'] ?? 9)
    )

    const mapped = sorted.map(q => ({
      id: q.id,
      questionText: q.question_text,
      difficulty: q.difficulty ?? 'easy',
      explanation: q.explanation ?? '',
      options: ((q.quiz_question_options as unknown as { id: string; option_text: string; is_correct: boolean; sort_order: number }[]) ?? [])
        .sort((a, b) => a.sort_order - b.sort_order),
    }))

    return <CodeReadingQuiz questions={mapped} lang={lang} langLabel={langInfo.label} />
  }

  // ─── コード作成: 問題一覧 ───
  if (mode === 'writing') {
    const { data: rawProblems } = await supabase
      .from('coding_problems')
      .select('id, title, difficulty')
      .eq('language', lang)
      .not('solution_code', 'is', null)

    const diffOrder: Record<string, number> = { easy: 0, medium: 1, hard: 2 }
    const problems = (rawProblems ?? []).sort((a, b) =>
      (diffOrder[a.difficulty] ?? 9) - (diffOrder[b.difficulty] ?? 9)
    )

    const problemIds = (problems ?? []).map(p => p.id)
    let solvedMap: Record<string, string> = {}
    if (problemIds.length > 0) {
      const { data: subs } = await supabase
        .from('code_submissions')
        .select('problem_id, status')
        .eq('user_id', user.id)
        .in('problem_id', problemIds)
        .order('submitted_at', { ascending: false })
      subs?.forEach(s => {
        if (!solvedMap[s.problem_id] || s.status === 'accepted') solvedMap[s.problem_id] = s.status
      })
    }

    return (
      <div>
        <div className="mb-6">
          <Link href={`/coding/problems?lang=${lang}`} className="text-sm text-indigo-600 hover:text-indigo-500 dark:text-indigo-400">
            ← {langInfo.label} に戻る
          </Link>
          <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{langInfo.label} コード作成</h1>
          <p className="mt-1 text-gray-500 dark:text-gray-400">コードを書いてテストケースに合格しましょう</p>
        </div>
        <div className="space-y-3">
          {(problems ?? []).map((p, i) => {
            const status = solvedMap[p.id]
            return (
              <Link key={p.id} href={`/coding/problems/${p.id}`}>
                <div className="rounded-xl border border-gray-200 p-4 transition-shadow hover:shadow-md dark:border-gray-700">
                  <div className="flex items-center gap-3">
                    <div className={`flex h-8 w-8 items-center justify-center rounded-full text-xs font-bold ${
                      status === 'accepted'
                        ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-300'
                        : 'bg-gray-100 text-gray-500 dark:bg-gray-700 dark:text-gray-400'
                    }`}>
                      {status === 'accepted' ? '✓' : i + 1}
                    </div>
                    <div className="flex-1">
                      <p className="text-sm font-medium text-gray-900 dark:text-white">{p.title}</p>
                    </div>
                    <span className={`inline-flex rounded-md px-2 py-0.5 text-xs font-medium ${DIFFICULTY_COLORS[p.difficulty]}`}>
                      {DIFFICULTY_LABELS[p.difficulty]}
                    </span>
                    {status && status !== 'accepted' && <span className="text-xs text-yellow-500">挑戦中</span>}
                  </div>
                </div>
              </Link>
            )
          })}
          {(problems ?? []).length === 0 && (
            <p className="py-8 text-center text-sm text-gray-400">問題がまだ登録されていません</p>
          )}
        </div>
      </div>
    )
  }

  // ─── 言語トップ: モード選択 ───
  const [{ count: readingCount }, { count: writingCount }] = await Promise.all([
    supabase.from('quiz_questions').select('id', { count: 'exact', head: true }).eq('question_type', 'code_reading').eq('question_category', lang),
    supabase.from('coding_problems').select('id', { count: 'exact', head: true }).eq('language', lang).not('solution_code', 'is', null),
  ])

  return (
    <div>
      <div className="mb-6">
        <Link href="/coding/problems" className="text-sm text-indigo-600 hover:text-indigo-500 dark:text-indigo-400">
          ← 言語選択に戻る
        </Link>
        <div className="mt-2 flex items-center gap-3">
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{langInfo.label}</h1>
          <span className="rounded-full bg-amber-100 px-2.5 py-0.5 text-xs font-semibold text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">Beta</span>
        </div>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{langInfo.description}</p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <Link href={`/coding/problems?lang=${lang}&mode=reading`}>
          <Card className="h-full transition-shadow hover:shadow-md">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-blue-100 dark:bg-blue-900/40">
                <span className="text-lg font-bold text-blue-600 dark:text-blue-400">解</span>
              </div>
              <div>
                <h3 className="font-semibold text-gray-900 dark:text-white">コード解析</h3>
                <p className="text-xs text-gray-500 dark:text-gray-400">コードを読んで結果を予測する</p>
              </div>
            </div>
            <p className="mt-3 text-sm text-gray-400">{readingCount ?? 0}問</p>
          </Card>
        </Link>

        <Link href={`/coding/problems?lang=${lang}&mode=writing`}>
          <Card className="h-full transition-shadow hover:shadow-md">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-orange-100 dark:bg-orange-900/40">
                <span className="text-lg font-bold text-orange-600 dark:text-orange-400">作</span>
              </div>
              <div>
                <h3 className="font-semibold text-gray-900 dark:text-white">コード作成</h3>
                <p className="text-xs text-gray-500 dark:text-gray-400">コードを書いてテストに合格する</p>
              </div>
            </div>
            <p className="mt-3 text-sm text-gray-400">{writingCount ?? 0}問</p>
          </Card>
        </Link>
      </div>
    </div>
  )
}
