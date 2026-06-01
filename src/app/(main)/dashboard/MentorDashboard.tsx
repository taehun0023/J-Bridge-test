'use client'

import Card from '@/components/ui/Card'
import Link from 'next/link'
import type { JapaneseProgressStat } from '@/lib/japanese-progress'

interface ExamScore {
  score: number | null
  passing_score: number
}

interface MenteeRow {
  id: string
  full_name: string | null
  email: string
  stat: JapaneseProgressStat
  exam_seikatsu: ExamScore | null
  exam_business_jp: ExamScore | null
}

function ExamCell({ exam }: { exam: ExamScore | null }) {
  if (!exam || exam.score === null) {
    return <span className="text-zinc-400">—</span>
  }
  const passed = exam.score >= exam.passing_score
  return (
    <span className={passed ? 'font-medium text-emerald-500' : 'font-medium text-red-500'}>
      {exam.passing_score}/{exam.score}
    </span>
  )
}

interface Props {
  mentorName: string | null
  mentees: MenteeRow[]
  unreadAnnouncements?: number
}

interface NameParts {
  lastName: string
  firstName: string
  katakanaLast: string
  katakanaFirst: string
}

function splitName(fullName: string | null): NameParts {
  const empty: NameParts = { lastName: '', firstName: '', katakanaLast: '', katakanaFirst: '' }
  if (!fullName) return empty
  const trimmed = fullName.trim()
  const withKana = trimmed.match(/^(\S+)\s+(\S+)\s*\((\S+)\s+(\S+)\)\s*$/)
  if (withKana) {
    return {
      lastName: withKana[1],
      firstName: withKana[2],
      katakanaLast: withKana[3],
      katakanaFirst: withKana[4],
    }
  }
  const twoTokens = trimmed.match(/^(\S+)\s+(\S+)\s*$/)
  if (twoTokens) {
    return { lastName: twoTokens[1], firstName: twoTokens[2], katakanaLast: '', katakanaFirst: '' }
  }
  return { ...empty, lastName: trimmed }
}

function RubyName({
  parts,
  className,
  rtClassName,
}: {
  parts: NameParts
  className?: string
  rtClassName?: string
}) {
  const baseRt = rtClassName ?? 'pb-1 text-xs font-medium text-zinc-600 dark:text-zinc-300'
  return (
    <span className={className}>
      <ruby>
        {parts.lastName || '-'}
        <rt className={baseRt}>{parts.katakanaLast || ' '}</rt>
      </ruby>
      {parts.firstName && (
        <>
          {' '}
          <ruby>
            {parts.firstName}
            <rt className={baseRt}>{parts.katakanaFirst || ' '}</rt>
          </ruby>
        </>
      )}
    </span>
  )
}

function progressRatio(c: { completed: number; total: number }): number {
  if (c.total === 0) return -1
  return c.completed / c.total
}

function fmtPair(c: { completed: number; total: number }): string {
  return `${c.completed}/${c.total}`
}

export default function MentorDashboard({ mentorName, mentees }: Props) {
  // 全体進捗 が低い順 (= 미완료 비율이 높은 순) 으로 정렬, 担当 0 件은 末尾.
  const sorted = [...mentees].sort((a, b) => {
    const ra = progressRatio(a.stat.all)
    const rb = progressRatio(b.stat.all)
    if (ra < 0 && rb < 0) return 0
    if (ra < 0) return 1
    if (rb < 0) return -1
    return ra - rb
  })

  return (
    <div>
      <div className="mb-6 flex items-center gap-3">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ダッシュボード</h1>
        <span className="rounded-full bg-blue-500/10 px-3 py-1 text-xs font-bold text-blue-500 ring-1 ring-blue-500/20">
          メンター
        </span>
      </div>
      <p className="mb-6 rounded-2xl border border-sky-200/60 bg-sky-100 px-5 py-4 text-lg font-medium text-sky-900 dark:border-sky-500/20 dark:bg-sky-500/15 dark:text-sky-100">
        {mentorName ? (
          <RubyName
            parts={splitName(mentorName)}
            rtClassName="pb-1 text-xs font-medium text-sky-700 dark:text-sky-200"
          />
        ) : (
          'メンター'
        )}
        さんの担当メンティー進捗状況
      </p>

      <Card title="担当メンティーの日本語進捗">
        {sorted.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">
            担当メンティーがいません
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200 dark:divide-white/[0.06]">
              <thead>
                <tr>
                  <th rowSpan={2} className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">名前</th>
                  <th colSpan={2} className="border-l border-gray-200/40 px-4 py-2 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">試験</th>
                  <th colSpan={2} className="border-l border-gray-200/40 px-4 py-2 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">課題</th>
                  <th rowSpan={2} className="border-l border-gray-200/40 px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">未完了</th>
                  <th rowSpan={2} className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">遅延</th>
                  <th rowSpan={2} className="border-l border-gray-200/40 px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">今月進捗</th>
                  <th rowSpan={2} className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">全体進捗</th>
                </tr>
                <tr>
                  <th className="border-l border-gray-200/40 px-3 py-2 text-center text-[10px] font-normal text-zinc-400 dark:border-white/[0.06] dark:text-zinc-500">生活日本語</th>
                  <th className="px-3 py-2 text-center text-[10px] font-normal text-zinc-400 dark:text-zinc-500">ビジネス日本語</th>
                  <th className="border-l border-gray-200/40 px-3 py-2 text-center text-[10px] font-normal text-zinc-400 dark:border-white/[0.06] dark:text-zinc-500">生活日本語</th>
                  <th className="px-3 py-2 text-center text-[10px] font-normal text-zinc-400 dark:text-zinc-500">ビジネス日本語</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                {sorted.map(m => {
                  const parts = splitName(m.full_name)
                  const hasName = parts.lastName !== '' || parts.firstName !== ''
                  return (
                  <tr key={m.id} className="hover:bg-gray-50 dark:hover:bg-white/[0.02]">
                    <td className="whitespace-nowrap px-4 py-3">
                      <Link
                        href={`/admin/reports?mentee=${m.id}`}
                        className="text-sm font-medium text-zinc-900 hover:text-indigo-500 dark:text-zinc-100"
                      >
                        {hasName ? <RubyName parts={parts} /> : m.email}
                      </Link>
                    </td>
                    <td className="whitespace-nowrap border-l border-gray-200/40 px-3 py-3 text-center text-sm dark:border-white/[0.06]">
                      <ExamCell exam={m.exam_seikatsu} />
                    </td>
                    <td className="whitespace-nowrap px-3 py-3 text-center text-sm">
                      <ExamCell exam={m.exam_business_jp} />
                    </td>
                    <td className="whitespace-nowrap border-l border-gray-200/40 px-3 py-3 text-center text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                      {fmtPair(m.stat.seikatsu)}
                    </td>
                    <td className="whitespace-nowrap px-3 py-3 text-center text-sm text-zinc-700 dark:text-zinc-300">
                      {fmtPair(m.stat.businessJp)}
                    </td>
                    <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-right text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                      {m.stat.incomplete}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right text-sm">
                      <span className={m.stat.overdue > 0 ? 'font-semibold text-red-500' : 'text-zinc-500 dark:text-zinc-400'}>
                        {m.stat.overdue}
                      </span>
                    </td>
                    <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                      {fmtPair(m.stat.thisMonth)}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                      {fmtPair(m.stat.all)}
                    </td>
                  </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        )}
      </Card>
    </div>
  )
}
