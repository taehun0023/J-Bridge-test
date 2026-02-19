'use client'

import dynamic from 'next/dynamic'
import { useState, useTransition } from 'react'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import Link from 'next/link'
import { BarChart3, Trophy, BookOpen, Eye } from 'lucide-react'
import { getGrade, getGradeColor, DISPATCH_MINIMUM_SCORE, getRelevantAxes, AXIS_DISPLAY_LABELS } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'
import { requestRetake } from '@/app/actions/assessment'
import { requestRetakeExam } from '@/app/actions/comprehensive-exam'
import { CATEGORY_LABELS } from '@/lib/constants'
import { getCategoryLabel, getSubcategoryLabel } from '@/lib/assignment-categories'
import EarnedBadges from '@/components/dashboard/EarnedBadges'
import type { CourseWithProgress } from '@/lib/course-progress'

const RadarChart = dynamic(() => import('@/components/dashboard/RadarChart'), { ssr: false })

interface Profile {
  full_name: string | null
  coding_rank: string
  target_jlpt_level: string | null
  target_coding_area: string | null
}

interface UnifiedResult {
  id: string
  title: string
  score: number
  passed: boolean
  completed_at: string
  type: 'quiz' | 'comprehensive'
}

interface TaskAssignment {
  id: string
  title: string | null
  description: string | null
  due_date: string | null
  status: string
}

type BadgeType = '未受験' | '再試験' | '再試験承認済'

interface PendingAssessment {
  step: number
  label: string
  link: string
  badge: BadgeType
}

interface CompletedAssessment {
  step: number
  label: string
  completedAt: string
  retakeStatus: string | null
}

interface UserRanking {
  overall_score: number
  overall_rank: number
  japanese_score: number
  programming_score: number
}

interface EnrolledCourse {
  id: string
  course_id: string
  courses: { title: string; category: string; subcategory: string | null } | null
}

interface LearningStats {
  total: number
  inProgress: number
  completed: number
}

interface RecentFeedback {
  id: string
  category: string
  content: string
  created_at: string
  admin: { full_name: string | null } | null
}

interface CompExamRetake {
  examId: string
  category: string
  subcategory: string
  contentLevel: string | null
  score: number | null
  retakeStatus: 'failed' | 'requested' | 'approved'
}

const CATEGORY_ROUTE_PREFIX: Record<string, string> = {
  core_programming: '/dev',
  framework: '/dev',
}

const feedbackCategoryLabels: Record<string, string> = {
  seikatsu: '生活日本語',
  business_jp: 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  business_lit: 'ビジネスリテラシー',
}

const AXIS_TO_STEP: Record<AxisKey, number> = {
  jlpt: 1,
  itJapanese: 2,
  coreProgramming: 3,
  framework: 4,
  attitudeCulture: 5,
}

interface TopRankingEntry {
  user_id: string
  full_name: string | null
  avatar_url: string | null
  overall_score: number
}

interface Props {
  profile: Profile | null
  radarScores: Record<AxisKey, number>
  recentResults: UnifiedResult[]
  tasks: TaskAssignment[]
  pendingAssessments: PendingAssessment[]
  isJapanese: boolean
  completedAssessments: CompletedAssessment[]
  userRanking: UserRanking | null
  topRanking?: TopRankingEntry[] | null
  enrolledCourses: EnrolledCourse[]
  learningStats?: LearningStats
  recentFeedbacks?: RecentFeedback[]
  compExamRetakes?: CompExamRetake[]
  javaBadges?: CourseWithProgress[]
}

function getBadgeStyle(badge: BadgeType): string {
  switch (badge) {
    case '未受験': return 'bg-zinc-500/10 text-zinc-400 ring-1 ring-zinc-500/20'
    case '再試験': return 'bg-indigo-500/10 text-indigo-400 ring-1 ring-indigo-500/20'
    case '再試験承認済': return 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
  }
}

export default function DashboardClient({
  profile, radarScores, recentResults, tasks, pendingAssessments, isJapanese, completedAssessments,
  userRanking, topRanking, enrolledCourses, learningStats, recentFeedbacks = [], compExamRetakes = [], javaBadges = [],
}: Props) {
  const relevantAxes = getRelevantAxes(isJapanese)
  const hasScores = relevantAxes.some(key => radarScores[key] > 0)
  const hasTasks = tasks.length > 0 || pendingAssessments.length > 0
  const hasEnrolledCourses = enrolledCourses.length > 0

  const allAxesAboveB = hasScores && relevantAxes.every(key => radarScores[key] >= DISPATCH_MINIMUM_SCORE)

  const gridCols = isJapanese ? 'grid-cols-3' : 'grid-cols-5'

  const [retakeMessage, setRetakeMessage] = useState<string | null>(null)
  const [pending, startTransition] = useTransition()

  function handleRetakeRequest(step: number) {
    startTransition(async () => {
      const result = await requestRetake(step)
      if ('error' in result && result.error) {
        setRetakeMessage(result.error)
      } else {
        setRetakeMessage('再試験リクエストを送信しました')
      }
      setTimeout(() => setRetakeMessage(null), 3000)
    })
  }

  function handleCompRetakeRequest(examId: string) {
    startTransition(async () => {
      const result = await requestRetakeExam(examId)
      if ('error' in result && result.error) {
        setRetakeMessage(result.error)
      } else {
        setRetakeMessage('総合試験の再試験リクエストを送信しました')
      }
      setTimeout(() => setRetakeMessage(null), 3000)
    })
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">ダッシュボード</h1>
      <p className="mt-1 text-zinc-500 dark:text-zinc-400">
        {profile?.full_name ? `${profile.full_name}さんの` : '自分の'}エンジニア力量現況
      </p>

      {/* Bento grid */}
      <div className="mt-6 grid gap-4 lg:grid-cols-3 lg:grid-rows-[auto_auto]">
        {/* Radar chart — spans 2 cols, 2 rows */}
        <Card title="エンジニア力量" className="lg:col-span-2 lg:row-span-2">
          {retakeMessage && (
            <div className="mb-3 rounded-xl bg-indigo-500/10 px-3 py-2 text-sm text-indigo-400 ring-1 ring-indigo-500/20">
              {retakeMessage}
            </div>
          )}
          {hasScores ? (
            <div>
              <div className="mx-auto max-w-md">
                <RadarChart scores={radarScores} isJapanese={isJapanese} />
              </div>

              {/* Grade summary cards with retake buttons */}
              <div className={`mt-4 grid ${gridCols} gap-2`}>
                {relevantAxes.map((key) => {
                  const score = radarScores[key]
                  const grade = getGrade(score)
                  const colorClass = getGradeColor(grade)
                  const isBelowB = score < DISPATCH_MINIMUM_SCORE
                  const step = AXIS_TO_STEP[key]
                  const ca = completedAssessments.find(a => a.step === step)
                  return (
                    <div
                      key={key}
                      className={`rounded-xl border p-2 text-center backdrop-blur-md ${
                        isBelowB
                          ? 'border-red-500/20 bg-red-500/5'
                          : 'border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60'
                      }`}
                    >
                      <p className="text-xs text-zinc-500 dark:text-zinc-400 truncate">{AXIS_DISPLAY_LABELS[key]}</p>
                      <p className="mt-1 text-lg font-mono font-bold text-zinc-900 dark:text-zinc-100">{score}</p>
                      <span className={`mt-1 inline-block rounded-full px-2 py-0.5 text-xs font-bold ${colorClass}`}>
                        {grade}
                      </span>
                      {ca && (
                        <div className="mt-1.5">
                          {ca.retakeStatus === 'requested' ? (
                            <span className="text-[10px] text-amber-400">リクエスト中</span>
                          ) : ca.retakeStatus === 'approved' ? (
                            <span className="text-[10px] text-emerald-400">承認済</span>
                          ) : ca.retakeStatus === 'denied' ? (
                            <span className="text-[10px] text-red-400">拒否</span>
                          ) : (
                            <button
                              onClick={() => handleRetakeRequest(ca.step)}
                              disabled={pending}
                              className="rounded-md border border-white/[0.08] dark:border-white/[0.08] border-gray-200 px-1.5 py-0.5 text-[10px] font-medium text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 disabled:opacity-50 transition-colors"
                            >
                              再試験リクエスト
                            </button>
                          )}
                        </div>
                      )}
                    </div>
                  )
                })}
              </div>

              {/* Comprehensive exam retake section */}
              {compExamRetakes.length > 0 && (
                <div className="mt-4 border-t border-white/[0.06] dark:border-white/[0.06] border-gray-100 pt-3">
                  <p className="text-xs font-medium text-zinc-500 dark:text-zinc-400 mb-2">総合試験 再試験</p>
                  <div className="space-y-2">
                    {compExamRetakes.map((exam) => (
                      <div
                        key={exam.examId}
                        className="flex items-center justify-between rounded-xl border border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 px-3 py-2"
                      >
                        <div>
                          <p className="text-xs font-medium text-zinc-900 dark:text-zinc-100">
                            {getCategoryLabel(exam.category)} &gt; {getSubcategoryLabel(exam.category, exam.subcategory)}
                            {exam.contentLevel && ` (${exam.contentLevel})`}
                          </p>
                          {exam.score !== null && (
                            <p className="text-[10px] text-red-400">{exam.score}点（不合格）</p>
                          )}
                        </div>
                        <div>
                          {exam.retakeStatus === 'requested' ? (
                            <span className="text-[10px] text-amber-400">リクエスト中</span>
                          ) : exam.retakeStatus === 'approved' ? (
                            <Link
                              href={`/exam/${exam.examId}`}
                              className="rounded-md bg-emerald-600 px-2 py-0.5 text-[10px] font-medium text-white hover:bg-emerald-500 transition-colors"
                            >
                              試験を受ける
                            </Link>
                          ) : (
                            <button
                              onClick={() => handleCompRetakeRequest(exam.examId)}
                              disabled={pending}
                              className="rounded-md border border-white/[0.08] dark:border-white/[0.08] border-gray-200 px-1.5 py-0.5 text-[10px] font-medium text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 disabled:opacity-50 transition-colors"
                            >
                              再試験リクエスト
                            </button>
                          )}
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Dispatch readiness badge */}
              <div className="mt-3 text-center">
                {allAxesAboveB ? (
                  <span className="inline-flex items-center gap-1.5 rounded-full bg-emerald-500/10 px-3 py-1 text-sm font-medium text-emerald-400 ring-1 ring-emerald-500/20">
                    <span className="h-2 w-2 rounded-full bg-emerald-500" />
                    派遣可能
                  </span>
                ) : (
                  <span className="inline-flex items-center gap-1.5 rounded-full bg-amber-500/10 px-3 py-1 text-sm font-medium text-amber-400 ring-1 ring-amber-500/20">
                    <span className="h-2 w-2 rounded-full bg-amber-500" />
                    派遣未達（全軸B以上が必要）
                  </span>
                )}
              </div>
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center py-8 text-center">
              <BarChart3 className="h-10 w-10 text-zinc-500" />
              <p className="mt-3 text-sm text-zinc-500 dark:text-zinc-400">等級テストを完了すると力量が表示されます</p>
            </div>
          )}
        </Card>

        {/* Earned badges */}
        <Card title="取得済み資格">
          {javaBadges.length > 0 ? (
            <div className="py-2">
              <EarnedBadges language="Java" badges={javaBadges} />
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center py-8 text-center">
              <p className="text-sm text-zinc-500 dark:text-zinc-400">コースがありません</p>
            </div>
          )}

          {(profile?.target_jlpt_level || profile?.target_coding_area) && (
            <div className="mt-4 border-t border-white/[0.06] dark:border-white/[0.06] border-gray-100 pt-4">
              <p className="text-xs font-medium text-zinc-500 dark:text-zinc-400">学習目標</p>
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

        {/* Recent results — below coding rank on right */}
        <Card title="最近の試験結果">
          {recentResults.length === 0 ? (
            <p className="py-4 text-center text-sm text-zinc-500">まだ試験を受けていません</p>
          ) : (
            <div className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {recentResults.map((r) => {
                const isReviewable = Date.now() - new Date(r.completed_at).getTime() < 7 * 24 * 60 * 60 * 1000
                const reviewUrl = `/dashboard/history/${r.id}?type=${r.type}`
                const content = (
                  <>
                    <div>
                      <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100">
                        {r.title}
                      </p>
                      <p className="text-xs text-zinc-500 dark:text-zinc-400">
                        {new Date(r.completed_at).toLocaleDateString('ja-JP')}
                        {r.type === 'comprehensive' && (
                          <span className="ml-1.5 inline-flex rounded-full bg-indigo-500/10 px-1.5 py-0.5 text-[10px] font-medium text-indigo-400 ring-1 ring-indigo-500/20">
                            総合
                          </span>
                        )}
                      </p>
                    </div>
                    <div className="flex items-center gap-2">
                      {isReviewable && (
                        <Eye className="h-3.5 w-3.5 text-indigo-400" />
                      )}
                      <span className={`text-sm font-mono font-bold ${r.passed ? 'text-emerald-400' : 'text-red-400'}`}>
                        {r.score}点
                      </span>
                    </div>
                  </>
                )

                return isReviewable ? (
                  <Link
                    key={r.id}
                    href={reviewUrl}
                    className="flex items-center justify-between py-3 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 -mx-3 px-3 rounded-lg transition-colors"
                  >
                    {content}
                  </Link>
                ) : (
                  <div key={r.id} className="flex items-center justify-between py-3">
                    {content}
                  </div>
                )
              })}
            </div>
          )}
          <Link
            href="/dashboard/history"
            className="mt-3 block text-center text-sm font-medium text-indigo-500 hover:text-indigo-400 transition-colors"
          >
            全履歴を見る →
          </Link>
        </Card>
      </div>

      {/* Learning Assignments Summary */}
      {learningStats && learningStats.total > 0 && (
        <div className="mt-4">
          <Card title="学習課題">
            <div className="flex items-center gap-4">
              <div className="flex items-center gap-3">
                <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-indigo-500/10">
                  <BookOpen className="h-5 w-5 text-indigo-500" />
                </div>
                <div>
                  <p className="text-sm text-zinc-500 dark:text-zinc-400">進行中 / 完了 / 全体</p>
                  <p className="text-lg font-bold font-mono text-zinc-900 dark:text-zinc-100">
                    {learningStats.inProgress} / {learningStats.completed} / {learningStats.total}
                  </p>
                </div>
              </div>
              {learningStats.total > 0 && (
                <div className="flex-1">
                  <div className="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-600">
                    <div
                      className="h-2 rounded-full bg-indigo-500 transition-all"
                      style={{ width: `${Math.round((learningStats.completed / learningStats.total) * 100)}%` }}
                    />
                  </div>
                </div>
              )}
            </div>
            <Link
              href="/dashboard/assignments"
              className="mt-4 block rounded-xl bg-indigo-600 px-4 py-2 text-center text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
            >
              課題一覧へ
            </Link>
          </Card>
        </div>
      )}

      {/* Recent Feedbacks */}
      {recentFeedbacks.length > 0 && (
        <div className="mt-4">
          <Card title="最近のフィードバック">
            <div className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {recentFeedbacks.map((fb) => (
                <div key={fb.id} className="py-3">
                  <div className="flex items-center gap-2">
                    <span className="inline-flex rounded-full bg-indigo-500/10 px-2 py-0.5 text-xs font-medium text-indigo-400 ring-1 ring-indigo-500/20">
                      {feedbackCategoryLabels[fb.category] ?? fb.category}
                    </span>
                    <span className="text-xs text-zinc-500 dark:text-zinc-400">
                      {(fb.admin as { full_name: string | null } | null)?.full_name ?? '管理者'}
                    </span>
                    <span className="text-xs text-zinc-500 dark:text-zinc-400">
                      {new Date(fb.created_at).toLocaleDateString('ja-JP')}
                    </span>
                  </div>
                  <p className="mt-1 text-sm text-zinc-700 dark:text-zinc-300 line-clamp-2">{fb.content}</p>
                </div>
              ))}
            </div>
            <Link
              href="/feedback"
              className="mt-3 block text-center text-sm font-medium text-indigo-500 hover:text-indigo-400 transition-colors"
            >
              詳細はこちら →
            </Link>
          </Card>
        </div>
      )}

      {/* Bottom grid: Tasks | Ranking | Enrolled Courses (mentee) */}
      <div className={`mt-4 grid gap-4 ${hasEnrolledCourses ? 'lg:grid-cols-3' : 'lg:grid-cols-2'}`}>
        {/* Tasks */}
        <Card title="配信された課題">
          {!hasTasks ? (
            <p className="py-4 text-center text-sm text-zinc-500">配信された課題はありません</p>
          ) : (
            <div className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {pendingAssessments.map((assessment, index) => (
                <Link
                  key={`assessment-${assessment.step}`}
                  href={assessment.link}
                  className="flex items-center justify-between py-3 group"
                >
                  <div className="flex items-center gap-3">
                    <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-indigo-500/10 text-xs font-bold text-indigo-400 ring-1 ring-indigo-500/20">
                      {index + 1}
                    </div>
                    <div>
                      <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100 group-hover:text-indigo-400 transition-colors">
                        {assessment.label}
                      </p>
                      <p className="text-xs text-zinc-500 dark:text-zinc-400">初期総合試験</p>
                    </div>
                  </div>
                  <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${getBadgeStyle(assessment.badge)}`}>
                    {assessment.badge}
                  </span>
                </Link>
              ))}

              {tasks.map((task) => (
                <div key={task.id} className="py-3">
                  <div className="flex items-center justify-between">
                    <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100">{task.title ?? '課題'}</p>
                    <Badge label={task.status === 'pending' ? '待機' : '進行中'} variant="default" />
                  </div>
                  {task.due_date && (
                    <p className="mt-1 text-xs text-zinc-500 dark:text-zinc-400">
                      締切: {new Date(task.due_date).toLocaleDateString('ja-JP')}
                    </p>
                  )}
                </div>
              ))}
            </div>
          )}
        </Card>

        {/* Ranking */}
        <Card title="ランキング">
          {userRanking ? (
            <div>
              <div className="flex items-center gap-3 mb-4">
                <Trophy className="h-8 w-8 text-amber-400" />
                <div>
                  <p className="text-2xl font-bold font-mono text-zinc-900 dark:text-zinc-100">#{userRanking.overall_rank}</p>
                </div>
              </div>
              <div className="grid grid-cols-3 gap-2">
                <div className="rounded-xl border border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 p-2 text-center">
                  <p className="text-xs text-zinc-500 dark:text-zinc-400">日本語力 /200</p>
                  <p className="mt-1 text-sm font-mono font-bold text-zinc-900 dark:text-zinc-100">
                    {isJapanese ? '—' : userRanking.japanese_score}
                  </p>
                </div>
                <div className="rounded-xl border border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 p-2 text-center">
                  <p className="text-xs text-zinc-500 dark:text-zinc-400">プログラミング /200</p>
                  <p className="mt-1 text-sm font-mono font-bold text-zinc-900 dark:text-zinc-100">{userRanking.programming_score}</p>
                </div>
                <div className="rounded-xl border border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 p-2 text-center">
                  <p className="text-xs text-zinc-500 dark:text-zinc-400">全体 /400</p>
                  <p className="mt-1 text-sm font-mono font-bold text-zinc-900 dark:text-zinc-100">{userRanking.overall_score}</p>
                </div>
              </div>
              <Link
                href="/ranking"
                className="mt-4 block rounded-xl bg-indigo-600 px-4 py-2 text-center text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
              >
                ランキングを見る
              </Link>
            </div>
          ) : topRanking && topRanking.length > 0 ? (
            <div>
              <div className="space-y-2">
                {topRanking.map((entry, i) => (
                  <div
                    key={entry.user_id}
                    className="flex items-center gap-3 rounded-lg p-2 border border-white/[0.06] bg-white/[0.02] dark:border-white/[0.06] dark:bg-white/[0.02] border-gray-100 bg-gray-50/50"
                  >
                    <span className={`w-6 text-center text-sm font-bold ${
                      i === 0 ? 'text-amber-400' : i === 1 ? 'text-zinc-300' : i === 2 ? 'text-amber-600' : 'text-zinc-500'
                    }`}>
                      {i + 1}
                    </span>
                    <div className="flex h-7 w-7 items-center justify-center rounded-full bg-indigo-500/10 text-xs font-bold text-indigo-400 ring-1 ring-indigo-500/20">
                      {entry.full_name?.charAt(0) ?? '?'}
                    </div>
                    <span className="text-sm text-zinc-900 dark:text-zinc-100 truncate flex-1">
                      {entry.full_name ?? 'ユーザー'}
                    </span>
                    <span className="ml-auto text-sm font-mono font-bold text-zinc-900 dark:text-zinc-100">
                      {entry.overall_score}
                    </span>
                  </div>
                ))}
              </div>
              <Link
                href="/ranking"
                className="mt-4 block rounded-xl bg-indigo-600 px-4 py-2 text-center text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
              >
                ランキングを見る
              </Link>
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center py-8 text-center">
              <Trophy className="h-10 w-10 text-zinc-500" />
              <p className="mt-3 text-sm text-zinc-500 dark:text-zinc-400">ランキングデータがありません</p>
            </div>
          )}
        </Card>

        {/* Enrolled Courses (mentee only) */}
        {hasEnrolledCourses && (
          <Card title="受講中コース">
            <div className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {enrolledCourses.map((enrollment) => {
                const routePrefix = enrollment.courses?.category
                  ? CATEGORY_ROUTE_PREFIX[enrollment.courses.category]
                  : undefined
                const href = routePrefix && enrollment.courses?.subcategory
                  ? `${routePrefix}/${enrollment.courses.subcategory}`
                  : `/courses/${enrollment.course_id}`
                return (
                  <Link
                    key={enrollment.id}
                    href={href}
                    className="block py-3 -mx-3 px-3 rounded-lg hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 transition-colors"
                  >
                    <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100">
                      {enrollment.courses?.title ?? 'コース'}
                    </p>
                    {enrollment.courses?.category && (
                      <span className="mt-1 inline-block rounded-full bg-indigo-500/10 px-2 py-0.5 text-xs font-medium text-indigo-400 ring-1 ring-indigo-500/20">
                        {CATEGORY_LABELS[enrollment.courses.category] ?? enrollment.courses.category}
                      </span>
                    )}
                  </Link>
                )
              })}
            </div>
          </Card>
        )}
      </div>
    </div>
  )
}
