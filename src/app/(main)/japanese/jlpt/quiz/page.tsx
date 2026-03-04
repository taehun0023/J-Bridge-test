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

const LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const
const CATEGORY_ORDER = ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening']

export default async function QuizListPage({ searchParams }: { searchParams: Promise<{ level?: string }> }) {
  const { level } = await searchParams
  if (!level || !LEVELS.includes(level as typeof LEVELS[number])) {
    redirect('/japanese/jlpt')
  }

  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()

  let userRole: string | null = null
  if (user) {
    const { data: prof } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    userRole = prof?.role ?? null
  }

  // Fetch pool quizzes for the selected level only
  const { data: poolQuizzes } = await supabase
    .from('quizzes')
    .select('*')
    .eq('is_pool', true)
    .in('quiz_type', ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening'])
    .ilike('title', `${level}%`)
    .order('created_at', { ascending: true })

  // Fetch user's attempts for pool quizzes
  let attemptMap: Record<string, { id: string; score: number; passed: boolean; retake_request_status: string | null }> = {}
  if (user && poolQuizzes?.length) {
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

  const quizzes = (poolQuizzes ?? [])
    .sort((a: Quiz, b: Quiz) => CATEGORY_ORDER.indexOf(a.quiz_type) - CATEGORY_ORDER.indexOf(b.quiz_type))

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{level} テスト</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">レベルごとにランダム出題されます</p>
      </div>

      {quizzes.length === 0 ? (
        <EmptyState title="テストはありません" description="まだ登録されたテストはありません" icon="📝" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {quizzes.map((quiz: Quiz) => {
            const attempt = attemptMap[quiz.id] ?? null
            return (
              <PracticeQuizCard
                key={quiz.id}
                quiz={quiz}
                attempt={attempt}
                quizHref={`/japanese/jlpt/quiz/${quiz.id}`}
                userRole={userRole}
              />
            )
          })}
        </div>
      )}
    </div>
  )
}
