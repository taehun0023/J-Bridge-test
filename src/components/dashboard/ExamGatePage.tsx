'use client'

import Link from 'next/link'
import { ClipboardCheck, CheckCircle, Clock, Circle, Hourglass } from 'lucide-react'
import type { ExamCycleInfo, CycleExam } from '@/app/actions/exam-scheduling'

const CATEGORY_LABELS: Record<string, string> = {
  seikatsu: '生活日本語',
  'business-jp': 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務',
  'business-lit': 'ビジネスリテラシー',
}

function getStatusIcon(status: string) {
  switch (status) {
    case 'completed':
      return <CheckCircle className="h-6 w-6 text-emerald-500" />
    case 'failed':
      return <CheckCircle className="h-6 w-6 text-red-400" />
    case 'in_progress':
      return <Clock className="h-6 w-6 text-blue-500 animate-pulse" />
    case 'requested':
      return <Hourglass className="h-6 w-6 text-amber-500" />
    default:
      return <Circle className="h-6 w-6 text-zinc-400" />
  }
}

function getStatusLabel(status: string, score: number | null) {
  switch (status) {
    case 'completed':
      return <span className="text-sm font-bold text-emerald-500">{score}点 合格</span>
    case 'failed':
      return <span className="text-sm font-bold text-red-400">{score}点 不合格</span>
    case 'in_progress':
      return <span className="text-sm font-medium text-blue-500">進行中</span>
    case 'requested':
      return <span className="text-sm font-medium text-amber-500">承認待ち</span>
    default:
      return <span className="text-sm text-zinc-500">未受験</span>
  }
}

function getDaysRemaining(deadlineAt: string): number {
  const now = new Date()
  const deadline = new Date(deadlineAt)
  return Math.max(0, Math.ceil((deadline.getTime() - now.getTime()) / (1000 * 60 * 60 * 24)))
}

function getNextUnfinishedExam(exams: CycleExam[]): CycleExam | null {
  // Prioritize in_progress, then approved (not started)
  // 'requested' exams are not clickable (waiting for admin approval)
  const inProgress = exams.find(e => e.status === 'in_progress')
  if (inProgress) return inProgress
  return exams.find(e => e.status === 'approved') ?? null
}

function allWaitingApproval(exams: CycleExam[]): boolean {
  return exams.every(e => e.status === 'requested' || e.status === 'completed' || e.status === 'failed')
    && exams.some(e => e.status === 'requested')
}

interface Props {
  cycle: ExamCycleInfo
  userName: string | null
}

export default function ExamGatePage({ cycle, userName }: Props) {
  const isFirstCycle = cycle.cycleNumber === 1
  const daysRemaining = getDaysRemaining(cycle.deadlineAt)
  const nextExam = getNextUnfinishedExam(cycle.exams)
  const completedCount = cycle.exams.filter(e => e.status === 'completed' || e.status === 'failed').length
  const totalCount = cycle.exams.length

  return (
    <div className="min-h-[80vh] flex items-center justify-center px-4">
      <div className="w-full max-w-2xl">
        {/* Main card */}
        <div className="rounded-2xl border-2 border-indigo-200 bg-gradient-to-br from-indigo-50 via-white to-purple-50 p-8 shadow-xl dark:border-indigo-800 dark:from-indigo-950/40 dark:via-zinc-900 dark:to-purple-950/30">
          {/* Header */}
          <div className="text-center mb-8">
            <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-2xl bg-indigo-100 dark:bg-indigo-900/30">
              <ClipboardCheck className="h-8 w-8 text-indigo-600 dark:text-indigo-400" />
            </div>

            {isFirstCycle ? (
              <>
                <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
                  総合試験を受けてください
                </h1>
                <p className="mt-2 text-zinc-600 dark:text-zinc-400">
                  {userName ? `${userName}さん、` : ''}J-Bridgeへようこそ！
                </p>
                <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">
                  まず、日本語の実力を測定する試験を受けてください。管理者の承認後に受験可能です。
                </p>
              </>
            ) : (
              <>
                <div className="flex items-center justify-center gap-3">
                  <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
                    定期総合試験（第{cycle.cycleNumber}回）
                  </h1>
                  <span className="inline-flex items-center rounded-full bg-amber-100 px-2.5 py-0.5 text-xs font-bold text-amber-800 dark:bg-amber-900/30 dark:text-amber-300">
                    D-{daysRemaining}
                  </span>
                </div>
                <p className="mt-2 text-sm text-zinc-500 dark:text-zinc-400">
                  2週間ごとの定期試験です。試験を完了するとダッシュボードに戻ります。
                </p>
              </>
            )}

            {/* Progress */}
            <div className="mt-4 flex items-center justify-center gap-2">
              <div className="h-2 w-32 rounded-full bg-zinc-200 dark:bg-zinc-700">
                <div
                  className="h-2 rounded-full bg-indigo-500 transition-all"
                  style={{ width: `${totalCount > 0 ? (completedCount / totalCount) * 100 : 0}%` }}
                />
              </div>
              <span className="text-sm font-mono text-zinc-600 dark:text-zinc-400">
                {completedCount}/{totalCount}
              </span>
            </div>
          </div>

          {/* Exam category cards */}
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-3">
            {cycle.exams.map((exam) => {
              const isDone = exam.status === 'completed' || exam.status === 'failed'
              const isClickable = exam.status === 'approved' || exam.status === 'in_progress'
              const isRequested = exam.status === 'requested'

              const cardContent = (
                <div
                  className={`rounded-xl border-2 p-4 text-center transition-all ${
                    isDone
                      ? exam.status === 'completed'
                        ? 'border-emerald-200 bg-emerald-50/50 dark:border-emerald-800 dark:bg-emerald-900/10'
                        : 'border-red-200 bg-red-50/50 dark:border-red-800 dark:bg-red-900/10'
                      : isRequested
                        ? 'border-amber-200 bg-amber-50/50 dark:border-amber-800 dark:bg-amber-900/10'
                        : isClickable
                          ? 'border-indigo-200 bg-white hover:border-indigo-400 hover:shadow-md cursor-pointer dark:border-indigo-700 dark:bg-zinc-800 dark:hover:border-indigo-500'
                          : 'border-zinc-200 bg-zinc-50 dark:border-zinc-700 dark:bg-zinc-800/50'
                  }`}
                >
                  <div className="flex justify-center mb-2">
                    {getStatusIcon(exam.status)}
                  </div>
                  <p className="text-sm font-bold text-zinc-900 dark:text-zinc-100">
                    {CATEGORY_LABELS[exam.category] ?? exam.category}
                  </p>
                  <div className="mt-1">
                    {getStatusLabel(exam.status, exam.score)}
                  </div>
                </div>
              )

              if (isClickable) {
                return (
                  <Link key={exam.id} href={`/exam/${exam.id}`}>
                    {cardContent}
                  </Link>
                )
              }

              return <div key={exam.id}>{cardContent}</div>
            })}
          </div>

          {/* Action button */}
          <div className="mt-8 text-center">
            {nextExam ? (
              <Link
                href={`/exam/${nextExam.id}`}
                className="inline-flex items-center gap-2 rounded-xl bg-indigo-600 px-8 py-3 text-lg font-bold text-white shadow-lg hover:bg-indigo-500 transition-all hover:shadow-xl"
              >
                {nextExam.status === 'in_progress' ? '試験を続ける' : isFirstCycle ? '最初の試験を始める' : '試験を受ける'}
                <span className="text-xl">→</span>
              </Link>
            ) : allWaitingApproval(cycle.exams) ? (
              <div className="space-y-2">
                <div className="inline-flex items-center gap-2 rounded-xl bg-amber-100 px-6 py-3 text-amber-800 dark:bg-amber-900/30 dark:text-amber-300">
                  <Hourglass className="h-5 w-5" />
                  <span className="font-semibold">管理者の承認を待っています</span>
                </div>
                <p className="text-sm text-zinc-500 dark:text-zinc-400">
                  担当メンターまたは管理者が承認すると試験を受けられます
                </p>
              </div>
            ) : (
              <p className="text-sm text-zinc-500 dark:text-zinc-400">
                すべての試験が完了しています。ページをリロードしてください。
              </p>
            )}
          </div>

          {/* Footer note */}
          <p className="mt-6 text-center text-xs text-zinc-400 dark:text-zinc-500">
            {isFirstCycle
              ? '承認後、すべての試験を完了するとダッシュボードが利用できます'
              : `締切: ${new Date(cycle.deadlineAt).toLocaleDateString('ja-JP')}`
            }
          </p>
        </div>
      </div>
    </div>
  )
}
