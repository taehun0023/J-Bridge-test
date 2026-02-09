'use client'

import dynamic from 'next/dynamic'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import Link from 'next/link'

const RadarChart = dynamic(() => import('@/components/dashboard/RadarChart'), { ssr: false })

interface Profile {
  full_name: string | null
  coding_rank: string
  target_jlpt_level: string | null
  target_coding_area: string | null
}

interface QuizAttempt {
  id: string
  score: number
  passed: boolean
  completed_at: string
  quizzes: { title: string } | null
}

interface TaskAssignment {
  id: string
  title: string | null
  description: string | null
  due_date: string | null
  status: string
}

interface Props {
  profile: Profile | null
  radarScores: {
    jlpt: number
    itJapanese: number
    coreProgramming: number
    framework: number
    attitudeCulture: number
  }
  recentQuizzes: QuizAttempt[]
  tasks: TaskAssignment[]
}

export default function DashboardClient({ profile, radarScores, recentQuizzes, tasks }: Props) {
  const hasScores = Object.values(radarScores).some((v) => v > 0)

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900">대시보드</h1>
      <p className="mt-1 text-gray-500">
        {profile?.full_name ? `${profile.full_name}님의` : '나의'} 파견 준비도 현황
      </p>

      <div className="mt-6 grid gap-6 lg:grid-cols-3">
        {/* Radar chart */}
        <Card title="5축 파견 준비도" className="lg:col-span-2">
          {hasScores ? (
            <div className="mx-auto max-w-md">
              <RadarChart scores={radarScores} />
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center py-8 text-center">
              <span className="text-4xl">📊</span>
              <p className="mt-3 text-sm text-gray-500">학습을 시작하면 파견 준비도가 표시됩니다</p>
              <div className="mt-4 flex gap-3">
                <Link href="/japanese/jlpt" className="rounded-lg bg-blue-100 px-4 py-2 text-sm font-medium text-blue-700 hover:bg-blue-200">
                  일본어 학습
                </Link>
                <Link href="/coding/problems" className="rounded-lg bg-blue-100 px-4 py-2 text-sm font-medium text-blue-700 hover:bg-blue-200">
                  코딩 문제
                </Link>
              </div>
            </div>
          )}
        </Card>

        {/* Coding rank */}
        <Card title="코딩 등급">
          <div className="flex flex-col items-center py-4">
            <Badge
              label={profile?.coding_rank ?? 'D'}
              variant="coding_rank"
              className="text-4xl px-6 py-3"
            />
            <p className="mt-3 text-sm text-gray-500">현재 등급</p>
            <Link
              href="/coding/exams"
              className="mt-4 rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
            >
              등급 시험 보기
            </Link>
          </div>

          {/* Target info */}
          {(profile?.target_jlpt_level || profile?.target_coding_area) && (
            <div className="mt-4 border-t border-gray-100 pt-4">
              <p className="text-xs font-medium text-gray-500">학습 목표</p>
              <div className="mt-2 flex flex-wrap gap-2">
                {profile?.target_jlpt_level && (
                  <Badge label={profile.target_jlpt_level} variant="jlpt" />
                )}
                {profile?.target_coding_area && (
                  <Badge label={profile.target_coding_area.toUpperCase()} variant="default" />
                )}
              </div>
            </div>
          )}
        </Card>
      </div>

      <div className="mt-6 grid gap-6 lg:grid-cols-2">
        {/* Recent quiz results */}
        <Card title="최근 퀴즈 결과">
          {recentQuizzes.length === 0 ? (
            <p className="py-4 text-center text-sm text-gray-400">아직 퀴즈를 풀지 않았습니다</p>
          ) : (
            <div className="divide-y divide-gray-100">
              {recentQuizzes.map((q) => (
                <div key={q.id} className="flex items-center justify-between py-3">
                  <div>
                    <p className="text-sm font-medium text-gray-900">
                      {(q.quizzes as { title: string } | null)?.title ?? '퀴즈'}
                    </p>
                    <p className="text-xs text-gray-500">
                      {new Date(q.completed_at).toLocaleDateString('ko-KR')}
                    </p>
                  </div>
                  <div className="text-right">
                    <span className={`text-sm font-bold ${q.passed ? 'text-green-600' : 'text-red-600'}`}>
                      {q.score}점
                    </span>
                  </div>
                </div>
              ))}
            </div>
          )}
        </Card>

        {/* Assigned tasks */}
        <Card title="배정된 과제">
          {tasks.length === 0 ? (
            <p className="py-4 text-center text-sm text-gray-400">배정된 과제가 없습니다</p>
          ) : (
            <div className="divide-y divide-gray-100">
              {tasks.map((task) => (
                <div key={task.id} className="py-3">
                  <div className="flex items-center justify-between">
                    <p className="text-sm font-medium text-gray-900">{task.title ?? '과제'}</p>
                    <Badge label={task.status === 'pending' ? '대기' : '진행중'} variant="default" />
                  </div>
                  {task.due_date && (
                    <p className="mt-1 text-xs text-gray-500">
                      마감: {new Date(task.due_date).toLocaleDateString('ko-KR')}
                    </p>
                  )}
                </div>
              ))}
            </div>
          )}
        </Card>
      </div>
    </div>
  )
}
