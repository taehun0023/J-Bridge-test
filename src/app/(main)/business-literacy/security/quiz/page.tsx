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

export const metadata = {
  title: 'セキュリティ 理解度テスト | J-Bridge',
  description: 'セキュリティ・服務マニュアルの理解度テスト',
}

export default async function SecurityQuizListPage() {
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()

  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('*')
    .eq('quiz_type', 'attitude_culture')
    .eq('is_assessment', false)
    .ilike('title', '%セキュリティ%')
    .order('created_at', { ascending: true })

  const attemptMap: Record<string, { score: number; passed: boolean }> = {}
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

  const allQuizzes = (quizzes ?? []) as Quiz[]

  return (
    <div>
      <div className="mb-6">
        <Link
          href="/business-literacy/security"
          className="text-sm text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200"
        >
          ← マニュアルに戻る
        </Link>
        <h1 className="mt-1 text-2xl font-bold text-zinc-900 dark:text-white">
          セキュリティ 理解度テスト
        </h1>
        <p className="mt-1 text-zinc-500 dark:text-zinc-400">
          マニュアルの内容を理解できたか、テストで確認しましょう
        </p>
      </div>

      {allQuizzes.length === 0 ? (
        <EmptyState title="テストはありません" description="まだ登録されたテストはありません" icon="📝" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2">
          {allQuizzes.map((quiz) => {
            const attempt = attemptMap[quiz.id]
            return (
              <Link
                key={quiz.id}
                href={`/business-literacy/security/quiz/${quiz.id}`}
                className="group rounded-xl border border-zinc-200 bg-white p-5 transition-shadow hover:shadow-md dark:border-zinc-700 dark:bg-zinc-800"
              >
                <div className="flex items-start justify-between">
                  <h3 className="font-semibold text-zinc-900 group-hover:text-blue-600 dark:text-white">
                    {quiz.title}
                  </h3>
                  {attempt && (
                    <Badge
                      label={attempt.passed ? '合格' : '不合格'}
                      variant="default"
                    />
                  )}
                </div>
                <div className="mt-3 flex items-center gap-3 text-sm text-zinc-500 dark:text-zinc-400">
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
          })}
        </div>
      )}
    </div>
  )
}
