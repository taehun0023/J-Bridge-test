import { createClient } from '@/lib/supabase/server'
import Badge from '@/components/ui/Badge'
import Card from '@/components/ui/Card'
import EmptyState from '@/components/ui/EmptyState'
import Link from 'next/link'

export default async function CodingExamsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: exams } = await supabase
    .from('coding_skill_exams')
    .select('*')
    .eq('is_published', true)
    .order('sort_order', { ascending: true })

  // Get user's current rank
  let currentRank = 'D'
  let attemptMap: Record<string, { passed: boolean; score: number }> = {}
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('coding_rank')
      .eq('id', user.id)
      .single()
    currentRank = profile?.coding_rank ?? 'D'

    const { data: attempts } = await supabase
      .from('coding_exam_attempts')
      .select('exam_id, passed, score')
      .eq('user_id', user.id)
      .not('completed_at', 'is', null)
      .order('score', { ascending: false })

    attempts?.forEach((a) => {
      if (!attemptMap[a.exam_id] || a.score > attemptMap[a.exam_id].score) {
        attemptMap[a.exam_id] = { passed: a.passed, score: a.score }
      }
    })
  }

  const rankOrder = ['D', 'C', 'B', 'A', 'S']

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">コーディング等級試験</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">Paiza式D〜S等級試験でコーディング力を認定しましょう</p>
        <div className="mt-3 flex items-center gap-2">
          <span className="text-sm text-gray-600 dark:text-gray-400">現在の等級:</span>
          <Badge label={currentRank} variant="coding_rank" className="text-base px-3 py-1" />
        </div>
      </div>

      {!exams?.length ? (
        <EmptyState title="試験がありません" icon="🏆" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {exams.map((exam) => {
            const attempt = attemptMap[exam.id]
            const currentRankIndex = rankOrder.indexOf(currentRank)
            const examRankIndex = rankOrder.indexOf(exam.target_rank)
            const isUnlocked = examRankIndex <= currentRankIndex + 1

            return (
              <Card key={exam.id} className={!isUnlocked ? 'opacity-60' : ''}>
                <div className="flex items-start justify-between">
                  <Badge label={exam.target_rank} variant="coding_rank" className="text-lg px-3 py-1" />
                  {attempt?.passed && (
                    <span className="text-green-500 text-lg">&#10003;</span>
                  )}
                </div>
                <h3 className="mt-3 font-semibold text-gray-900 dark:text-white">{exam.title}</h3>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{exam.description}</p>
                <div className="mt-3 flex items-center gap-3 text-xs text-gray-400 dark:text-gray-500">
                  <span>制限時間 {exam.time_limit_minutes}分</span>
                  <span>合格 {exam.passing_score}点</span>
                </div>
                {attempt && (
                  <p className="mt-2 text-sm">
                    <span className={attempt.passed ? 'text-green-600' : 'text-red-600'}>
                      最高点: {attempt.score}点
                    </span>
                  </p>
                )}
                <div className="mt-4">
                  {isUnlocked ? (
                    <Link
                      href={`/coding/exams/${exam.id}`}
                      className="block w-full rounded-lg bg-blue-600 py-2.5 text-center text-sm font-medium text-white hover:bg-blue-700"
                    >
                      {attempt ? '再受験' : '試験開始'}
                    </Link>
                  ) : (
                    <div className="rounded-lg bg-gray-100 py-2.5 text-center text-sm text-gray-500 dark:bg-gray-700 dark:text-gray-400">
                      {rankOrder[examRankIndex - 1]}等級合格後に受験可能
                    </div>
                  )}
                </div>
              </Card>
            )
          })}
        </div>
      )}
    </div>
  )
}
