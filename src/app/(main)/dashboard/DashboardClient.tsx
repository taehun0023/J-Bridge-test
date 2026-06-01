'use client'

import dynamic from 'next/dynamic'
import { useState, useTransition } from 'react'
import Card from '@/components/ui/Card'
import Link from 'next/link'
import { AlertTriangle, BarChart3, BookOpen, Eye, Calendar, ClipboardCheck, CheckCircle, Clock, Circle } from 'lucide-react'
import { getGrade, getGradeColor, getJlptLevel, getJlptLevelColor, DISPATCH_MINIMUM_SCORE, getRelevantAxes, AXIS_DISPLAY_LABELS } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'
import { requestExam, requestRetakeExam } from '@/app/actions/comprehensive-exam'
import type { ExamCycleInfo, CycleExam } from '@/app/actions/exam-scheduling'

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

const feedbackCategoryLabels: Record<string, string> = {
  seikatsu: '生活日本語',
  business_jp: 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  business_lit: 'ビジネスリテラシー',
}

const AXIS_TO_CATEGORY: Record<AxisKey, string> = {
  jlpt: 'seikatsu',
  itJapanese: 'business-jp',
  coreProgramming: 'cs',
  framework: 'dev',
  attitudeCulture: 'business-lit',
}

interface RecentAssignment {
  id: string
  title: string
  category: string
  subcategory: string
  content_level: string | null
  status: string
  due_date: string | null
  created_at: string
  assigner: { full_name: string | null } | null
}

interface Props {
  profile: Profile | null
  radarScores: Record<AxisKey, number>
  recentResults: UnifiedResult[]
  isJapanese: boolean
  learningStats?: LearningStats
  recentFeedbacks?: RecentFeedback[]
  compExamRetakeByCategory?: Record<string, { examId: string; score: number | null; retakeStatus: 'completed' | 'failed' | 'requested' | 'approved' | 'in_progress' }>
  hasCompletedExamByCategory?: Record<string, boolean>
  seikatsuExamLevel?: 'N1' | 'N2' | 'N3' | 'N4' | 'N5' | null
  role?: string
  nextExamDate?: string | null
  activeCycle?: ExamCycleInfo | null
  recentAssignments?: RecentAssignment[]
  unreadAnnouncements?: number
}

const CYCLE_CATEGORY_LABELS: Record<string, string> = {
  seikatsu: '生活日本語',
  'business-jp': 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務',
  'business-lit': 'ビジネスリテラシー',
}

function getCycleStatusIcon(status: string) {
  switch (status) {
    case 'completed':
      return <CheckCircle className="h-5 w-5 text-emerald-500" />
    case 'failed':
      return <CheckCircle className="h-5 w-5 text-red-400" />
    case 'in_progress':
      return <Clock className="h-5 w-5 text-blue-500 animate-pulse" />
    default:
      return <Circle className="h-5 w-5 text-zinc-400" />
  }
}

function getCycleStatusLabel(status: string, score: number | null) {
  switch (status) {
    case 'completed':
      return <span className="text-xs font-bold text-emerald-500">{score}点 合格</span>
    case 'failed':
      return <span className="text-xs font-bold text-red-400">{score}点 不合格</span>
    case 'in_progress':
      return <span className="text-xs font-medium text-blue-500">進行中</span>
    default:
      return <span className="text-xs text-zinc-500">未受験</span>
  }
}

function getNextCycleExam(exams: CycleExam[]): CycleExam | null {
  const inProgress = exams.find(e => e.status === 'in_progress')
  if (inProgress) return inProgress
  return exams.find(e => e.status === 'approved') ?? null
}

function getDaysUntil(deadlineAt: string): number {
  const now = new Date()
  const deadline = new Date(deadlineAt)
  return Math.max(0, Math.ceil((deadline.getTime() - now.getTime()) / (1000 * 60 * 60 * 24)))
}

export default function DashboardClient({
  profile, radarScores, recentResults, isJapanese,
  learningStats, recentFeedbacks = [], compExamRetakeByCategory = {},
  hasCompletedExamByCategory = {}, seikatsuExamLevel = null, role,
  nextExamDate, activeCycle, recentAssignments = [], unreadAnnouncements = 0,
}: Props) {
  const isMentee = role === 'mentee'
  const relevantAxes = getRelevantAxes(isJapanese, role)
  const hasScores = relevantAxes.some(key => radarScores[key] > 0)

  const allAxesAboveB = hasScores && relevantAxes.every(key => radarScores[key] >= DISPATCH_MINIMUM_SCORE)

  const gridCols = relevantAxes.length === 3 ? 'grid-cols-3' : 'grid-cols-5'

  const [retakeMessage, setRetakeMessage] = useState<string | null>(null)
  const [pending, startTransition] = useTransition()

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

  function handleDirectRetake(examId: string) {
    startTransition(async () => {
      const result = await requestRetakeExam(examId)
      if ('error' in result && result.error) {
        setRetakeMessage(result.error)
      } else if ('examId' in result && result.examId) {
        window.location.href = `/exam/${result.examId}`
      }
      setTimeout(() => setRetakeMessage(null), 3000)
    })
  }

  function handleFirstExam(category: string) {
    startTransition(async () => {
      const result = await requestExam(category, 'comprehensive', null)
      if ('error' in result && result.error) {
        setRetakeMessage(result.error)
      } else if ('examId' in result && result.examId) {
        window.location.href = `/exam/${result.examId}`
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

      {/* Mentee priority: assignments + feedback */}
      {isMentee && (
        <div className="mt-6 grid gap-4 sm:grid-cols-2">
          {/* Learning assignments card */}
          {learningStats && learningStats.total > 0 && (
            <div className="rounded-xl border-2 border-amber-300 bg-gradient-to-br from-amber-50 to-orange-50 p-5 dark:border-amber-600 dark:from-amber-900/20 dark:to-orange-900/20">
              <div className="flex items-center gap-2 mb-3">
                <AlertTriangle className="h-5 w-5 text-amber-500" />
                <h2 className="text-base font-bold text-amber-900 dark:text-amber-200">学習課題</h2>
              </div>
              <div className="mb-3">
                <div className="flex items-center justify-between text-sm mb-1">
                  <span className="text-amber-700 dark:text-amber-300">
                    進行中 {learningStats.inProgress} / 完了 {learningStats.completed} / 全体 {learningStats.total}
                  </span>
                  <span className="font-bold text-amber-900 dark:text-amber-100">
                    {Math.round((learningStats.completed / learningStats.total) * 100)}%
                  </span>
                </div>
                <div className="h-3 w-full rounded-full bg-amber-200 dark:bg-amber-800">
                  <div
                    className="h-3 rounded-full bg-amber-500 transition-all"
                    style={{ width: `${Math.round((learningStats.completed / learningStats.total) * 100)}%` }}
                  />
                </div>
              </div>
              <Link
                href="/dashboard/assignments"
                className="block rounded-lg bg-amber-500 px-4 py-2 text-center text-sm font-bold text-white hover:bg-amber-600 transition-colors"
              >
                課題一覧へ
              </Link>
            </div>
          )}

          {/* Recent feedback card */}
          {recentFeedbacks.length > 0 && (
            <div className="rounded-xl border-2 border-blue-300 bg-gradient-to-br from-blue-50 to-indigo-50 p-5 dark:border-blue-600 dark:from-blue-900/20 dark:to-indigo-900/20">
              <div className="flex items-center gap-2 mb-3">
                <Eye className="h-5 w-5 text-blue-500" />
                <h2 className="text-base font-bold text-blue-900 dark:text-blue-200">最近のフィードバック</h2>
              </div>
              <div className="space-y-2 mb-3">
                {recentFeedbacks.map((fb) => (
                  <div key={fb.id} className="rounded-lg bg-white/60 p-2.5 dark:bg-white/5">
                    <div className="flex items-center gap-2 mb-1">
                      <span className="inline-flex rounded-full bg-blue-100 px-2 py-0.5 text-[10px] font-medium text-blue-700 dark:bg-blue-800 dark:text-blue-300">
                        {feedbackCategoryLabels[fb.category] ?? fb.category}
                      </span>
                      <span className="text-[10px] text-zinc-500 dark:text-zinc-400">
                        {new Date(fb.created_at).toLocaleDateString('ja-JP')}
                      </span>
                    </div>
                    <p className="text-xs text-zinc-700 dark:text-zinc-300 line-clamp-2">{fb.content}</p>
                  </div>
                ))}
              </div>
              <Link
                href="/profile/feedback"
                className="block rounded-lg bg-blue-500 px-4 py-2 text-center text-sm font-bold text-white hover:bg-blue-600 transition-colors"
              >
                詳細はこちら
              </Link>
            </div>
          )}
        </div>
      )}

      {/* Active exam cycle card — takes precedence over nextExamDate banner */}
      {isMentee && activeCycle ? (() => {
        const daysRemaining = getDaysUntil(activeCycle.deadlineAt)
        const nextExam = getNextCycleExam(activeCycle.exams)
        const completedCount = activeCycle.exams.filter(e => e.status === 'completed' || e.status === 'failed').length
        const totalCount = activeCycle.exams.length
        const allDone = completedCount === totalCount

        return (
          <div className="mt-4 rounded-2xl border-2 border-indigo-200 bg-gradient-to-br from-indigo-50 via-white to-purple-50 p-5 shadow-sm dark:border-indigo-800 dark:from-indigo-950/40 dark:via-zinc-900 dark:to-purple-950/30">
            <div className="flex items-start justify-between gap-4 flex-wrap">
              <div className="flex items-center gap-3">
                <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-indigo-100 dark:bg-indigo-900/30">
                  <ClipboardCheck className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
                </div>
                <div>
                  <div className="flex items-center gap-2">
                    <h2 className="text-base font-bold text-zinc-900 dark:text-zinc-100">
                      総合試験（第{activeCycle.cycleNumber}回）
                    </h2>
                    <span className="inline-flex items-center rounded-full bg-amber-100 px-2 py-0.5 text-[10px] font-bold text-amber-800 dark:bg-amber-900/30 dark:text-amber-300">
                      D-{daysRemaining}
                    </span>
                  </div>
                  <p className="text-xs text-zinc-500 dark:text-zinc-400">
                    締切: {new Date(activeCycle.deadlineAt).toLocaleDateString('ja-JP')} ・ {completedCount}/{totalCount} 完了
                  </p>
                </div>
              </div>
              {nextExam && (
                <Link
                  href={`/exam/${nextExam.id}`}
                  className="inline-flex items-center gap-1.5 rounded-xl bg-indigo-600 px-4 py-2 text-sm font-bold text-white hover:bg-indigo-500 transition-colors"
                >
                  {nextExam.status === 'in_progress' ? '試験を続ける' : '試験を受ける'}
                  <span>→</span>
                </Link>
              )}
            </div>

            {/* Exam status grid */}
            <div className="mt-4 grid grid-cols-2 gap-2 sm:grid-cols-5">
              {activeCycle.exams.map((exam) => {
                const isClickable = exam.status === 'approved' || exam.status === 'in_progress'
                const cardContent = (
                  <div
                    className={`rounded-lg border p-2.5 text-center transition-all ${
                      exam.status === 'completed'
                        ? 'border-emerald-200 bg-emerald-50/50 dark:border-emerald-800 dark:bg-emerald-900/10'
                        : exam.status === 'failed'
                          ? 'border-red-200 bg-red-50/50 dark:border-red-800 dark:bg-red-900/10'
                          : isClickable
                            ? 'border-indigo-200 bg-white hover:border-indigo-400 hover:shadow-sm cursor-pointer dark:border-indigo-700 dark:bg-zinc-800 dark:hover:border-indigo-500'
                            : 'border-zinc-200 bg-zinc-50 dark:border-zinc-700 dark:bg-zinc-800/50'
                    }`}
                  >
                    <div className="flex justify-center mb-1">
                      {getCycleStatusIcon(exam.status)}
                    </div>
                    <p className="text-[11px] font-bold text-zinc-900 dark:text-zinc-100 truncate">
                      {CYCLE_CATEGORY_LABELS[exam.category] ?? exam.category}
                    </p>
                    <div className="mt-0.5">
                      {getCycleStatusLabel(exam.status, exam.score)}
                    </div>
                  </div>
                )
                if (isClickable) {
                  return <Link key={exam.id} href={`/exam/${exam.id}`}>{cardContent}</Link>
                }
                return <div key={exam.id}>{cardContent}</div>
              })}
            </div>

            {allDone && (
              <p className="mt-3 text-xs text-zinc-500 dark:text-zinc-400 text-center">
                すべての試験が完了しています。ページをリロードしてください。
              </p>
            )}
          </div>
        )
      })() : isMentee && nextExamDate && (
        <div className="mt-4 flex items-center gap-2 rounded-xl border border-indigo-200 bg-indigo-50/50 px-4 py-3 dark:border-indigo-800 dark:bg-indigo-900/10">
          <Calendar className="h-4 w-4 text-indigo-500" />
          <span className="text-sm text-indigo-700 dark:text-indigo-300">
            次回総合試験: {new Date(nextExamDate).toLocaleDateString('ja-JP')}
            {(() => {
              const days = Math.ceil((new Date(nextExamDate).getTime() - Date.now()) / (1000 * 60 * 60 * 24))
              return days > 0 ? `（あと${days}日）` : '（本日）'
            })()}
          </span>
        </div>
      )}

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
                <RadarChart scores={radarScores} isJapanese={isJapanese} role={role} />
              </div>

              {/* Grade summary cards with retake buttons */}
              <div className={`mt-4 grid ${gridCols} gap-2`}>
                {relevantAxes.map((key) => {
                  const score = radarScores[key]
                  const isSeikatsu = key === 'jlpt'
                  const category = AXIS_TO_CATEGORY[key]
                  const hasCompleted = hasCompletedExamByCategory[category] ?? false
                  const gradeLabel = isSeikatsu
                    ? (seikatsuExamLevel ?? getJlptLevel(score))
                    : getGrade(score)
                  const colorClass = isSeikatsu ? getJlptLevelColor(gradeLabel as 'N1'|'N2'|'N3'|'N4'|'N5') : getGradeColor(gradeLabel as 'S'|'A'|'B'|'C'|'D')
                  const isBelowB = hasCompleted && score < DISPATCH_MINIMUM_SCORE
                  const retakeInfo = compExamRetakeByCategory[category]
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
                      <p className={`mt-1 text-lg font-mono font-bold ${hasCompleted ? 'text-zinc-900 dark:text-zinc-100' : 'text-zinc-400 dark:text-zinc-500'}`}>
                        {hasCompleted ? score : '—'}
                      </p>
                      {hasCompleted ? (
                        <span className={`mt-1 inline-block rounded-full px-2 py-0.5 text-xs font-bold ${colorClass}`}>
                          {gradeLabel}
                        </span>
                      ) : (
                        <span className="mt-1 inline-block rounded-full bg-zinc-200 px-2 py-0.5 text-xs font-bold text-zinc-600 dark:bg-zinc-700 dark:text-zinc-400">
                          未受験
                        </span>
                      )}
                      {retakeInfo ? (
                        <div className="mt-1.5">
                          {retakeInfo.retakeStatus === 'in_progress' ? (
                            <Link
                              href={`/exam/${retakeInfo.examId}`}
                              className="rounded-md bg-blue-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-blue-500 transition-colors"
                            >
                              試験を再開
                            </Link>
                          ) : retakeInfo.retakeStatus === 'requested' ? (
                            <span className="text-[10px] text-amber-400">リクエスト中</span>
                          ) : retakeInfo.retakeStatus === 'approved' ? (
                            <Link
                              href={`/exam/${retakeInfo.examId}`}
                              className="rounded-md bg-emerald-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-emerald-500 transition-colors"
                            >
                              再試験する
                            </Link>
                          ) : (role === 'admin' || role === 'mentor') ? (
                            <button
                              onClick={() => handleDirectRetake(retakeInfo.examId)}
                              disabled={pending}
                              className="rounded-md bg-emerald-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-emerald-500 disabled:opacity-50 transition-colors"
                            >
                              再試験する
                            </button>
                          ) : (
                            <button
                              onClick={() => handleCompRetakeRequest(retakeInfo.examId)}
                              disabled={pending}
                              className="rounded-md border border-white/[0.08] dark:border-white/[0.08] border-gray-200 px-1.5 py-0.5 text-[10px] font-medium text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 disabled:opacity-50 transition-colors"
                            >
                              再試験リクエスト
                            </button>
                          )}
                        </div>
                      ) : (
                        <div className="mt-1.5">
                          <button
                            onClick={() => handleFirstExam(category)}
                            disabled={pending}
                            className="rounded-md bg-indigo-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
                          >
                            試験を受ける
                          </button>
                        </div>
                      )}
                    </div>
                  )
                })}
              </div>

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
              <p className="mt-3 text-sm text-zinc-500 dark:text-zinc-400">総合試験を受けると力量が表示されます</p>
              <div className={`mt-6 w-full grid ${gridCols} gap-2`}>
                {relevantAxes.map((key) => {
                  const category = AXIS_TO_CATEGORY[key]
                  const retakeInfo = compExamRetakeByCategory[category]
                  return (
                    <div key={key} className="rounded-xl border border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 p-2 text-center">
                      <p className="text-xs text-zinc-500 dark:text-zinc-400 truncate">{AXIS_DISPLAY_LABELS[key]}</p>
                      <p className="mt-1 text-lg font-mono font-bold text-zinc-400 dark:text-zinc-500">—</p>
                      <span className="mt-1 inline-block rounded-full bg-zinc-200 px-2 py-0.5 text-xs font-bold text-zinc-600 dark:bg-zinc-700 dark:text-zinc-400">
                        未受験
                      </span>
                      <div className="mt-1.5">
                        {retakeInfo ? (
                          retakeInfo.retakeStatus === 'in_progress' ? (
                            <Link
                              href={`/exam/${retakeInfo.examId}`}
                              className="rounded-md bg-blue-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-blue-500 transition-colors"
                            >
                              試験を再開
                            </Link>
                          ) : retakeInfo.retakeStatus === 'requested' ? (
                            <span className="text-[10px] text-amber-400">リクエスト中</span>
                          ) : retakeInfo.retakeStatus === 'approved' ? (
                            <Link
                              href={`/exam/${retakeInfo.examId}`}
                              className="rounded-md bg-emerald-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-emerald-500 transition-colors"
                            >
                              試験を受ける
                            </Link>
                          ) : (role === 'admin' || role === 'mentor') ? (
                            <button
                              onClick={() => handleDirectRetake(retakeInfo.examId)}
                              disabled={pending}
                              className="rounded-md bg-emerald-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-emerald-500 disabled:opacity-50 transition-colors"
                            >
                              再試験する
                            </button>
                          ) : (
                            <button
                              onClick={() => handleCompRetakeRequest(retakeInfo.examId)}
                              disabled={pending}
                              className="rounded-md border border-white/[0.08] dark:border-white/[0.08] border-gray-200 px-1.5 py-0.5 text-[10px] font-medium text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 disabled:opacity-50 transition-colors"
                            >
                              再試験リクエスト
                            </button>
                          )
                        ) : (
                          <button
                            onClick={() => handleFirstExam(category)}
                            disabled={pending}
                            className="rounded-md bg-indigo-600 px-1.5 py-0.5 text-[10px] font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
                          >
                            試験を受ける
                          </button>
                        )}
                      </div>
                    </div>
                  )
                })}
              </div>
            </div>
          )}
        </Card>

        {/* Recent results — right col, row 1 */}
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

        {/* メンターからの課題 — right col, row 2 */}
        <Card title="メンターからの課題">
          {recentAssignments.length > 0 ? (
            <div>
              <div className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                {recentAssignments.map(a => (
                  <div key={a.id} className="py-2.5">
                    <div className="flex items-center justify-between gap-2">
                      <span className="truncate text-sm font-medium text-zinc-900 dark:text-zinc-100">{a.title}</span>
                      <span className={`shrink-0 rounded-full px-2 py-0.5 text-[10px] font-medium ${
                        a.status === 'completed' ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20' :
                        a.status === 'in_progress' ? 'bg-blue-500/10 text-blue-400 ring-1 ring-blue-500/20' :
                        a.status === 'overdue' ? 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20' :
                        'bg-zinc-500/10 text-zinc-400 ring-1 ring-zinc-500/20'
                      }`}>
                        {a.status === 'completed' ? '完了' : a.status === 'in_progress' ? '進行中' : a.status === 'overdue' ? '期限超過' : '待機'}
                      </span>
                    </div>
                    <div className="mt-1 flex items-center gap-3 text-xs text-zinc-500 dark:text-zinc-400">
                      <span>{a.assigner?.full_name ?? '—'}</span>
                      <span>{new Date(a.created_at).toLocaleDateString('ja-JP')}</span>
                      {a.due_date && <span>〆 {new Date(a.due_date).toLocaleDateString('ja-JP')}</span>}
                    </div>
                  </div>
                ))}
              </div>
              <Link
                href="/dashboard/assignments"
                className="mt-3 block text-center text-sm font-medium text-indigo-500 hover:text-indigo-400 transition-colors"
              >
                全て見る →
              </Link>
            </div>
          ) : (
            <div className="flex flex-col items-center justify-center py-8 text-center">
              <ClipboardCheck className="h-10 w-10 text-zinc-500" />
              <p className="mt-3 text-sm text-zinc-500 dark:text-zinc-400">現在新しい課題はありません</p>
            </div>
          )}
        </Card>
      </div>

      {/* Learning Assignments Summary */}
      {!isMentee && learningStats && learningStats.total > 0 && (
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
      {!isMentee && recentFeedbacks.length > 0 && (
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
              href="/profile/feedback"
              className="mt-3 block text-center text-sm font-medium text-indigo-500 hover:text-indigo-400 transition-colors"
            >
              詳細はこちら →
            </Link>
          </Card>
        </div>
      )}

    </div>
  )
}
