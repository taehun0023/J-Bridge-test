'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import dynamic from 'next/dynamic'
import Card from '@/components/ui/Card'
import { getGrade, getGradeColor, getJlptLevel, getJlptLevelColor, AXIS_DISPLAY_LABELS, DISPATCH_MINIMUM_SCORE } from '@/lib/assessment-config'
import type { AxisKey, JlptLevel, SkillGrade } from '@/lib/assessment-config'
import type { MenteeOverview } from '@/app/actions/mentor'
import { ClipboardList, FileBarChart, ChevronDown, Calendar, CheckCircle2, Clock, AlertTriangle, Eye } from 'lucide-react'

const RadarChart = dynamic(() => import('./RadarChart'), { ssr: false })

interface Props {
  mentees: MenteeOverview[]
  pendingVocabCount: number
  mentorSpecialty: string | null
}

const EXAM_CATEGORY_LABELS: Record<string, string> = {
  seikatsu: '生活日本語',
  'business-jp': 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  'business-lit': 'ビジネスリテラシー',
}

const AXIS_KEYS: AxisKey[] = ['jlpt', 'itJapanese', 'coreProgramming', 'framework', 'attitudeCulture']
const FOURTEEN_DAYS_MS = 14 * 24 * 60 * 60 * 1000

function AxisDots({ scores, isJapanese }: { scores: MenteeOverview['radarScores']; isJapanese: boolean }) {
  const axes = isJapanese
    ? (['coreProgramming', 'framework', 'attitudeCulture'] as const)
    : AXIS_KEYS

  return (
    <div className="flex items-center gap-1">
      {axes.map(key => {
        const v = scores[key]
        const color = v >= DISPATCH_MINIMUM_SCORE
          ? 'bg-emerald-500'
          : v >= 50
            ? 'bg-amber-400'
            : 'bg-zinc-300 dark:bg-zinc-600'
        return (
          <span
            key={key}
            className={`inline-block h-2.5 w-2.5 rounded-full ${color}`}
            title={`${AXIS_DISPLAY_LABELS[key]}: ${v}点`}
          />
        )
      })}
    </div>
  )
}

function formatDate(iso: string | null) {
  if (!iso) return '—'
  const d = new Date(iso)
  return `${d.getMonth() + 1}/${d.getDate()}`
}

function daysUntil(iso: string | null) {
  if (!iso) return null
  const diff = Math.ceil((new Date(iso).getTime() - Date.now()) / (1000 * 60 * 60 * 24))
  return diff
}

function DispatchBadge({ scores, isJapanese }: { scores: MenteeOverview['radarScores']; isJapanese: boolean }) {
  const axes = isJapanese
    ? (['coreProgramming', 'framework', 'attitudeCulture'] as const)
    : AXIS_KEYS
  const allPass = axes.every(k => scores[k] >= DISPATCH_MINIMUM_SCORE)
  return (
    <span className={`inline-flex items-center gap-1 rounded-full px-2 py-0.5 text-xs font-medium ${
      allPass
        ? 'bg-emerald-100 text-emerald-800 dark:bg-emerald-900/30 dark:text-emerald-300'
        : 'bg-zinc-100 text-zinc-600 dark:bg-zinc-800 dark:text-zinc-400'
    }`}>
      {allPass ? '派遣可能' : '未達'}
    </span>
  )
}

function MenteeAccordion({ mentee }: { mentee: MenteeOverview }) {
  const [open, setOpen] = useState(false)
  const router = useRouter()

  return (
    <Card className="overflow-hidden">
      {/* Header row */}
      <button
        onClick={() => setOpen(!open)}
        className="flex w-full items-center gap-3 px-4 py-3 text-left hover:bg-zinc-50 dark:hover:bg-white/[0.02] transition-colors"
      >
        {mentee.avatar_url ? (
          <img src={mentee.avatar_url} alt="" className="h-9 w-9 rounded-full object-cover shrink-0" />
        ) : (
          <div className="flex h-9 w-9 items-center justify-center rounded-full bg-indigo-100 text-sm font-medium text-indigo-600 dark:bg-indigo-900 dark:text-indigo-300 shrink-0">
            {mentee.full_name?.charAt(0) ?? '?'}
          </div>
        )}

        <span className="font-semibold text-gray-900 dark:text-white min-w-0 truncate">
          {mentee.full_name ?? '名前未設定'}
        </span>

        <AxisDots scores={mentee.radarScores} isJapanese={mentee.is_japanese} />

        {/* Assignment badges */}
        <div className="ml-auto flex items-center gap-2 shrink-0">
          {mentee.assignmentsInProgress > 0 && (
            <span className="flex items-center gap-0.5 text-xs text-blue-600 dark:text-blue-400">
              <Clock className="h-3.5 w-3.5" />{mentee.assignmentsInProgress}
            </span>
          )}
          {mentee.assignmentsOverdue > 0 && (
            <span className="flex items-center gap-0.5 text-xs text-red-600 dark:text-red-400">
              <AlertTriangle className="h-3.5 w-3.5" />{mentee.assignmentsOverdue}
            </span>
          )}
          <ChevronDown className={`h-4 w-4 text-zinc-400 transition-transform ${open ? 'rotate-180' : ''}`} />
        </div>
      </button>

      {/* Expanded content */}
      {open && (
        <div className="border-t border-gray-200 dark:border-white/[0.06] px-4 py-4 space-y-5">
          {/* Top section: Radar + Summary */}
          <div className="grid gap-4 md:grid-cols-2">
            <div>
              <RadarChart scores={mentee.radarScores} isJapanese={mentee.is_japanese} />
            </div>
            <div className="flex flex-col justify-center space-y-3 text-sm">
              {/* Next exam */}
              <div className="flex items-center gap-2 text-gray-700 dark:text-gray-300">
                <Calendar className="h-4 w-4 text-indigo-500 shrink-0" />
                <span>次回試験:</span>
                {mentee.nextExamDate ? (
                  <span className="font-medium">
                    {formatDate(mentee.nextExamDate)}
                    {(() => {
                      const d = daysUntil(mentee.nextExamDate)
                      return d !== null ? ` (${d > 0 ? `${d}日後` : '本日'})` : ''
                    })()}
                  </span>
                ) : (
                  <span className="text-zinc-400">未定</span>
                )}
              </div>

              {/* Assignments */}
              <Link href="/admin/tasks" className="flex items-center gap-2 text-gray-700 dark:text-gray-300 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors group">
                <ClipboardList className="h-4 w-4 text-indigo-500 shrink-0" />
                <span>課題:</span>
                <span className="font-medium group-hover:underline">
                  進行中 <span className="text-blue-600">{mentee.assignmentsInProgress}</span>
                  {' / '}完了 <span className="text-emerald-600">{mentee.assignmentsCompleted}</span>
                  {mentee.assignmentsOverdue > 0 && (
                    <> / 超過 <span className="text-red-600">{mentee.assignmentsOverdue}</span></>
                  )}
                </span>
              </Link>

              {/* Dispatch readiness */}
              <div className="flex items-center gap-2 text-gray-700 dark:text-gray-300">
                <CheckCircle2 className="h-4 w-4 text-indigo-500 shrink-0" />
                <span>派遣判定:</span>
                <DispatchBadge scores={mentee.radarScores} isJapanese={mentee.is_japanese} />
              </div>
            </div>
          </div>

          {/* Comprehensive exam results */}
          {mentee.compExamResults.length > 0 && (
            <div>
              <h4 className="mb-2 text-sm font-semibold text-gray-800 dark:text-gray-200">総合試験結果</h4>
              <p className="mb-2 text-xs text-gray-400 dark:text-gray-500">※ 完了後14日以内の試験はクリックで解答レビューが可能です</p>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b border-gray-200 dark:border-white/[0.06] text-left text-xs text-gray-500 dark:text-gray-400">
                      <th className="pb-2 pr-4">カテゴリ</th>
                      <th className="pb-2 pr-4">スコア</th>
                      <th className="pb-2 pr-4">等級</th>
                      <th className="pb-2 pr-4">状態</th>
                      <th className="pb-2">日付</th>
                    </tr>
                  </thead>
                  <tbody>
                    {mentee.compExamResults.map(r => {
                      const isSeikatsu = r.category === 'seikatsu'
                      const gradeLabel = r.score !== null
                        ? (isSeikatsu ? getJlptLevel(r.score) : getGrade(r.score))
                        : null
                      const gradeColor = gradeLabel !== null
                        ? (isSeikatsu ? getJlptLevelColor(gradeLabel as JlptLevel) : getGradeColor(gradeLabel as SkillGrade))
                        : ''
                      const isReviewable = r.completedAt
                        ? Date.now() - new Date(r.completedAt).getTime() < FOURTEEN_DAYS_MS
                        : false
                      return (
                        <tr
                          key={r.category}
                          className={`border-b border-gray-100 dark:border-white/[0.03] ${
                            isReviewable
                              ? 'cursor-pointer hover:bg-indigo-50/50 dark:hover:bg-indigo-900/10 transition-colors'
                              : ''
                          }`}
                          onClick={isReviewable ? () => router.push(`/mentor/review/${r.id}`) : undefined}
                        >
                          <td className="py-2 pr-4 text-gray-800 dark:text-gray-200">
                            <span className="flex items-center gap-1.5">
                              {isReviewable && <Eye className="h-3.5 w-3.5 text-indigo-400 shrink-0" />}
                              {EXAM_CATEGORY_LABELS[r.category] ?? r.category}
                            </span>
                          </td>
                          <td className="py-2 pr-4 font-medium text-gray-900 dark:text-white">
                            {r.score !== null ? `${r.score}点` : '—'}
                          </td>
                          <td className="py-2 pr-4">
                            {gradeLabel && (
                              <span className={`inline-block rounded px-1.5 py-0.5 text-xs font-bold ${gradeColor}`}>
                                {gradeLabel}
                              </span>
                            )}
                          </td>
                          <td className="py-2 pr-4">
                            <span className={`text-xs font-medium ${
                              r.passed ? 'text-emerald-600 dark:text-emerald-400' : 'text-red-600 dark:text-red-400'
                            }`}>
                              {r.passed ? '合格' : '不合格'}
                            </span>
                          </td>
                          <td className="py-2 text-gray-500 dark:text-gray-400">
                            {formatDate(r.completedAt)}
                          </td>
                        </tr>
                      )
                    })}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          {/* Recent quiz attempts */}
          {mentee.recentQuizAttempts.length > 0 && (
            <div>
              <h4 className="mb-2 text-sm font-semibold text-gray-800 dark:text-gray-200">最近の理解度テスト</h4>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b border-gray-200 dark:border-white/[0.06] text-left text-xs text-gray-500 dark:text-gray-400">
                      <th className="pb-2 pr-4">テスト名</th>
                      <th className="pb-2 pr-4">スコア</th>
                      <th className="pb-2 pr-4">合否</th>
                      <th className="pb-2">日付</th>
                    </tr>
                  </thead>
                  <tbody>
                    {mentee.recentQuizAttempts.map((q, i) => (
                      <tr key={i} className="border-b border-gray-100 dark:border-white/[0.03]">
                        <td className="py-2 pr-4 text-gray-800 dark:text-gray-200">{q.quizTitle}</td>
                        <td className="py-2 pr-4 font-medium text-gray-900 dark:text-white">{q.score}点</td>
                        <td className="py-2 pr-4">
                          <span className={`text-xs font-medium ${
                            q.passed ? 'text-emerald-600 dark:text-emerald-400' : 'text-red-600 dark:text-red-400'
                          }`}>
                            {q.passed ? '合格' : '不合格'}
                          </span>
                        </td>
                        <td className="py-2 text-gray-500 dark:text-gray-400">{formatDate(q.completedAt)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          )}

          {/* Empty state */}
          {mentee.compExamResults.length === 0 && mentee.recentQuizAttempts.length === 0 && (
            <p className="text-center text-sm text-zinc-400 py-2">試験結果がまだありません</p>
          )}
        </div>
      )}
    </Card>
  )
}

export default function MentorDashboardClient({ mentees, pendingVocabCount, mentorSpecialty }: Props) {
  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">メンター管理</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">
          担当メンティの学習状況を確認しましょう
          {mentorSpecialty === 'japanese' && ' (日本語メンター)'}
          {mentorSpecialty === 'technical' && ' (技術メンター)'}
        </p>
      </div>

      {/* Quick links */}
      <div className="mb-6 grid gap-4 sm:grid-cols-2">
        <Link href="/admin/tasks">
          <Card className="flex items-center gap-3 hover:ring-2 hover:ring-indigo-300 dark:hover:ring-indigo-700 transition-all cursor-pointer">
            <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-indigo-100 dark:bg-indigo-900/40">
              <ClipboardList className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
            </div>
            <div>
              <p className="font-semibold text-gray-900 dark:text-white">課題配信</p>
              <p className="text-xs text-gray-500 dark:text-gray-400">学習課題の配信・管理</p>
            </div>
          </Card>
        </Link>
        <Link href="/admin/reports">
          <Card className="flex items-center gap-3 hover:ring-2 hover:ring-indigo-300 dark:hover:ring-indigo-700 transition-all cursor-pointer">
            <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-violet-100 dark:bg-violet-900/40">
              <FileBarChart className="h-5 w-5 text-violet-600 dark:text-violet-400" />
            </div>
            <div>
              <p className="font-semibold text-gray-900 dark:text-white">レポート</p>
              <p className="text-xs text-gray-500 dark:text-gray-400">取弱点分析・成績レポート</p>
            </div>
          </Card>
        </Link>
      </div>

      {/* Pending actions */}
      {pendingVocabCount > 0 && (mentorSpecialty === null || mentorSpecialty === 'japanese') && (
        <Card className="mb-6 border-amber-200 bg-amber-50/50 dark:border-amber-800 dark:bg-amber-900/20">
          <div className="flex items-center justify-between">
            <div>
              <h3 className="font-semibold text-amber-900 dark:text-amber-200">承認待ちアクション</h3>
              <p className="mt-1 text-sm text-amber-700 dark:text-amber-300">
                みんなの単語帳: {pendingVocabCount}件の承認待ち
              </p>
            </div>
            <Link
              href="/japanese/business/shared-vocab"
              className="rounded-xl bg-amber-600 px-4 py-2 text-sm font-medium text-white hover:bg-amber-500 transition-colors"
            >
              確認する
            </Link>
          </div>
        </Card>
      )}

      {/* Mentee list */}
      {mentees.length === 0 ? (
        <Card>
          <div className="py-8 text-center text-sm text-zinc-500">
            担当メンティがまだ割り当てられていません
          </div>
        </Card>
      ) : (
        <>
          <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">
            担当メンティ一覧 ({mentees.length}名)
          </h2>
          <div className="space-y-3">
            {mentees.map(mentee => (
              <MenteeAccordion key={mentee.id} mentee={mentee} />
            ))}
          </div>
        </>
      )}
    </div>
  )
}
