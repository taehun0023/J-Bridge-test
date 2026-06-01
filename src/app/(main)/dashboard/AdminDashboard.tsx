'use client'

import { useState } from 'react'
import Card from '@/components/ui/Card'
import Link from 'next/link'
import type { JapaneseProgressStat } from '@/lib/japanese-progress'

interface EmployeeRow {
  id: string
  full_name: string | null
  email: string
  mentor_name: string | null
  stat: JapaneseProgressStat
}

interface Props {
  adminName: string | null
  employees: EmployeeRow[]
  unreadAnnouncements?: number
}

function progressRatio(c: { completed: number; total: number }): number {
  if (c.total === 0) return -1
  return c.completed / c.total
}

function fmtPair(c: { completed: number; total: number }): string {
  return `${c.completed}/${c.total}`
}

export default function AdminDashboard({ adminName, employees }: Props) {
  const [search, setSearch] = useState('')

  const filtered = employees.filter(e =>
    (e.full_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
    e.email.toLowerCase().includes(search.toLowerCase()) ||
    (e.mentor_name ?? '').toLowerCase().includes(search.toLowerCase())
  )

  const sorted = [...filtered].sort((a, b) => {
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
        <span className="rounded-full bg-red-500/10 px-3 py-1 text-xs font-bold text-red-500 ring-1 ring-red-500/20">
          管理者
        </span>
      </div>
      <p className="mb-6 text-sm text-zinc-500 dark:text-zinc-400">
        {adminName ?? '管理者'}さん — 全社員の日本語進捗状況
      </p>

      <Card title="全社員の日本語進捗">
        <div className="mb-4">
          <input
            type="text"
            placeholder="名前・メール・メンターで検索..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            className="w-full max-w-xs rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100 dark:placeholder-zinc-500"
          />
        </div>
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200 dark:divide-white/[0.06]">
            <thead>
              <tr>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">名前</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">担当メンター</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">生活日本語</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">ビジネス日本語</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">未完了</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">遅延</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">今月進捗</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">全体進捗</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
              {sorted.map(e => (
                <tr key={e.id} className="hover:bg-gray-50 dark:hover:bg-white/[0.02]">
                  <td className="whitespace-nowrap px-4 py-3">
                    <Link
                      href={`/admin/reports?mentee=${e.id}`}
                      className="text-sm font-medium text-zinc-900 hover:text-indigo-500 dark:text-zinc-100"
                    >
                      {e.full_name ?? e.email}
                    </Link>
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                    {e.mentor_name ?? '—'}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                    {fmtPair(e.stat.seikatsu)}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                    {fmtPair(e.stat.businessJp)}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-right text-sm text-zinc-700 dark:text-zinc-300">
                    {e.stat.incomplete}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-right text-sm">
                    <span className={e.stat.overdue > 0 ? 'font-semibold text-red-500' : 'text-zinc-500 dark:text-zinc-400'}>
                      {e.stat.overdue}
                    </span>
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                    {fmtPair(e.stat.thisMonth)}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-700 dark:text-zinc-300">
                    {fmtPair(e.stat.all)}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {sorted.length === 0 && (
          <div className="py-8 text-center text-sm text-zinc-500">
            {search ? '該当する社員がいません' : 'メンティーがいません'}
          </div>
        )}
      </Card>
    </div>
  )
}
