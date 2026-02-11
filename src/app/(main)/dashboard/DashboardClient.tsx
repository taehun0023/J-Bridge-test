'use client'

import dynamic from 'next/dynamic'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import Link from 'next/link'
import { getGrade, getGradeColor, DISPATCH_MINIMUM_SCORE } from '@/lib/assessment-config'

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

interface PendingAssessment {
  step: number
  label: string
  link: string
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
  pendingAssessments: PendingAssessment[]
}

const AXIS_INFO = [
  { key: 'jlpt' as const, label: 'JLPT' },
  { key: 'itJapanese' as const, label: 'IT日本語' },
  { key: 'coreProgramming' as const, label: '基本プログラミング' },
  { key: 'framework' as const, label: 'フレームワーク' },
  { key: 'attitudeCulture' as const, label: '態度/文化' },
]

export default function DashboardClient({ profile, radarScores, recentQuizzes, tasks, pendingAssessments }: Props) {
  const hasScores = Object.values(radarScores).some((v) => v > 0)
  const hasTasks = tasks.length > 0 || pendingAssessments.length > 0

  const allAxesAboveB = hasScores && Object.values(radarScores).every(v => v >= DISPATCH_MINIMUM_SCORE)

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ダッシュボード</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">
        {profile?.full_name ? `${profile.full_name}さんの` : '自分の'}エンジニア力量現況
      </p>

      <div className="mt-6 grid gap-6 lg:grid-cols-3">
        {/* Radar chart */}
        <Card title="エンジニア力量" className="lg:col-span-2">
          {hasScores ? (
            <div>
              <div className="mx-auto max-w-md">
                <RadarChart scores={radarScores} />
              </div>

              {/* Grade summary cards */}
              <div className="mt-4 grid grid-cols-5 gap-2">
                {AXIS_INFO.map(({ key, label }) => {
                  const score = radarScores[key]
                  const grade = getGrade(score)
                  const colorClass = getGradeColor(grade)
                  const isBelowB = score < DISPATCH_MINIMUM_SCORE
                  return (
                    <div
                      key={key}
                      className={`rounded-lg border p-2 text-center ${
                        isBelowB
                          ? 'border-red-300 bg-red-50 dark:border-red-800 dark:bg-red-950/30'
                          : 'border-gray-200 dark:border-gray-700'
                      }`}
                    >
                      <p className="text-xs text-gray-500 dark:text-gray-400 truncate">{label}</p>
                      <p className="mt-1 text-lg font-bold text-gray-900 dark:text-white">{score}</p>
                      <span className={`mt-1 inline-block rounded-full px-2 py-0.5 text-xs font-bold ${colorClass}`}>
                        {grade}
                      </span>
                    </div>
                  )
                })}
              </div>

              {/* Dispatch readiness badge */}
              <div className="mt-3 text-center">
                {allAxesAboveB ? (
                  <span className="inline-flex items-center gap-1.5 rounded-full bg-green-100 px-3 py-1 text-sm font-medium text-green-800 dark:bg-green-900/30 dark:text-green-300">
                    <span className="h-2 w-2 rounded-full bg-green-500" />
                    派遣可能
                  </span>
                ) : (
                  <span className="inline-flex items-center gap-1.5 rounded-full bg-amber-100 px-3 py-1 text-sm font-medium text-amber-800 dark:bg-amber-900/30 dark:text-amber-300">
                    <span className="h-2 w-2 rounded-full bg-amber-500" />
                    派遣未達（全軸B以上が必要）
                  </span>
                )}
              </div>
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center py-8 text-center">
              <span className="text-4xl">📊</span>
              <p className="mt-3 text-sm text-gray-500 dark:text-gray-400">等級テストを完了すると力量が表示されます</p>
            </div>
          )}
        </Card>

        {/* Coding rank */}
        <Card title="コーディング等級">
          <div className="flex flex-col items-center py-4">
            <Badge
              label={profile?.coding_rank ?? 'D'}
              variant="coding_rank"
              className="text-4xl px-6 py-3"
            />
            <p className="mt-3 text-sm text-gray-500 dark:text-gray-400">現在の等級</p>
            <Link
              href="/coding/exams"
              className="mt-4 rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
            >
              等級試験を受ける
            </Link>
          </div>

          {/* Target info */}
          {(profile?.target_jlpt_level || profile?.target_coding_area) && (
            <div className="mt-4 border-t border-gray-100 dark:border-gray-700 pt-4">
              <p className="text-xs font-medium text-gray-500 dark:text-gray-400">学習目標</p>
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
        <Card title="最近のクイズ結果">
          {recentQuizzes.length === 0 ? (
            <p className="py-4 text-center text-sm text-gray-400 dark:text-gray-500">まだクイズを受けていません</p>
          ) : (
            <div className="divide-y divide-gray-100 dark:divide-gray-700">
              {recentQuizzes.map((q) => (
                <div key={q.id} className="flex items-center justify-between py-3">
                  <div>
                    <p className="text-sm font-medium text-gray-900 dark:text-white">
                      {(q.quizzes as { title: string } | null)?.title ?? 'クイズ'}
                    </p>
                    <p className="text-xs text-gray-500 dark:text-gray-400">
                      {new Date(q.completed_at).toLocaleDateString('ja-JP')}
                    </p>
                  </div>
                  <div className="text-right">
                    <span className={`text-sm font-bold ${q.passed ? 'text-green-600' : 'text-red-600'}`}>
                      {q.score}点
                    </span>
                  </div>
                </div>
              ))}
            </div>
          )}
        </Card>

        {/* Assigned tasks + pending assessments */}
        <Card title="配信された課題">
          {!hasTasks ? (
            <p className="py-4 text-center text-sm text-gray-400 dark:text-gray-500">配信された課題はありません</p>
          ) : (
            <div className="divide-y divide-gray-100 dark:divide-gray-700">
              {/* Pending assessment quizzes */}
              {pendingAssessments.map((assessment) => (
                <Link
                  key={`assessment-${assessment.step}`}
                  href={assessment.link}
                  className="flex items-center justify-between py-3 group"
                >
                  <div className="flex items-center gap-3">
                    <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-blue-100 text-xs font-bold text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">
                      {assessment.step}
                    </div>
                    <div>
                      <p className="text-sm font-medium text-gray-900 dark:text-white group-hover:text-blue-600 dark:group-hover:text-blue-400">
                        {assessment.label}
                      </p>
                      <p className="text-xs text-gray-500 dark:text-gray-400">初期等級テスト</p>
                    </div>
                  </div>
                  <Badge label="未受験" variant="default" />
                </Link>
              ))}

              {/* Regular assigned tasks */}
              {tasks.map((task) => (
                <div key={task.id} className="py-3">
                  <div className="flex items-center justify-between">
                    <p className="text-sm font-medium text-gray-900 dark:text-white">{task.title ?? '課題'}</p>
                    <Badge label={task.status === 'pending' ? '待機' : '進行中'} variant="default" />
                  </div>
                  {task.due_date && (
                    <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                      締切: {new Date(task.due_date).toLocaleDateString('ja-JP')}
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
