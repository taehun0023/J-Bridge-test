'use client'

import Card from '@/components/ui/Card'
import Link from 'next/link'
import type { JapaneseProgressStat } from '@/lib/japanese-progress'

interface MenteeRow {
  id: string
  full_name: string | null
  email: string
  stat: JapaneseProgressStat
}

interface Props {
  mentorName: string | null
  mentees: MenteeRow[]
  unreadAnnouncements?: number
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
      <p className="mb-6 text-sm text-zinc-500 dark:text-zinc-400">
        {mentorName ?? 'メンター'}さんの担当メンティー進捗状況
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
                  <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">名前</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">生活日本語</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">ビジネス日本語</th>
                  <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">未完了</th>
                  <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">遅延</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">今月進捗</th>
                  <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">全体進捗</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                {sorted.map(m => (
                  <tr key={m.id} className="hover:bg-gray-50 dark:hover:bg-white/[0.02]">
                    <td className="whitespace-nowrap px-4 py-3">
                      <Link
                        href={`/admin/reports?mentee=${m.id}`}
                        className="text-sm font-medium text-zinc-900 hover:text-indigo-500 dark:text-zinc-100"
                      >
                        {m.full_name ?? m.email}
                      </Link>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                      {fmtPair(m.stat.seikatsu)}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                      {fmtPair(m.stat.businessJp)}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right text-sm text-zinc-700 dark:text-zinc-300">
                      {m.stat.incomplete}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right text-sm">
                      <span className={m.stat.overdue > 0 ? 'font-semibold text-red-500' : 'text-zinc-500 dark:text-zinc-400'}>
                        {m.stat.overdue}
                      </span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                      {fmtPair(m.stat.thisMonth)}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                      {fmtPair(m.stat.all)}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </Card>
    </div>
  )
}
