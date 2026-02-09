import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'

interface SearchParams {
  level?: string
}

export default async function QuizListPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()

  let query = supabase
    .from('quizzes')
    .select('*')
    .eq('quiz_type', 'jlpt_vocab')
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

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900">JLPT 어휘 퀴즈</h1>
        <p className="mt-1 text-gray-500">급수별 어휘 퀴즈를 풀고 실력을 점검하세요</p>
      </div>

      {!quizzes?.length ? (
        <EmptyState title="퀴즈가 없습니다" description="아직 등록된 퀴즈가 없습니다" icon="📝" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {quizzes.map((quiz) => {
            const attempt = attemptMap[quiz.id]
            return (
              <Link
                key={quiz.id}
                href={`/japanese/jlpt/quiz/${quiz.id}`}
                className="group rounded-xl border border-gray-200 bg-white p-5 transition-shadow hover:shadow-md"
              >
                <div className="flex items-start justify-between">
                  <h3 className="font-semibold text-gray-900 group-hover:text-blue-600">
                    {quiz.title}
                  </h3>
                  {attempt && (
                    <Badge
                      label={attempt.passed ? '합격' : '불합격'}
                      variant="default"
                    />
                  )}
                </div>
                <div className="mt-3 flex items-center gap-3 text-sm text-gray-500">
                  {quiz.time_limit_minutes && (
                    <span>제한시간 {quiz.time_limit_minutes}분</span>
                  )}
                  <span>합격 {quiz.passing_score}점</span>
                </div>
                {attempt && (
                  <div className="mt-2 text-sm">
                    <span className={attempt.passed ? 'text-green-600' : 'text-red-600'}>
                      최고점: {attempt.score}점
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
