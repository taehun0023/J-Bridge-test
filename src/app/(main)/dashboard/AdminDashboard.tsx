'use client'

import { useState } from 'react'
import Card from '@/components/ui/Card'
import Link from 'next/link'

interface EmployeeProgress {
  id: string
  full_name: string | null
  email: string
  jlpt_level: string | null
  mentor_name: string | null
  total: number
  completed: number
  last_activity: string | null
}

interface Props {
  adminName: string | null
  employees: EmployeeProgress[]
  unreadAnnouncements?: number
}

export default function AdminDashboard({ adminName, employees, unreadAnnouncements = 0 }: Props) {
  const [search, setSearch] = useState('')

  const filtered = employees.filter(e =>
    (e.full_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
    e.email.toLowerCase().includes(search.toLowerCase())
  )

  const sorted = [...filtered].sort((a, b) => {
    if (a.total === 0 && b.total === 0) return 0
    if (a.total === 0) return 1
    if (b.total === 0) return -1
    return (a.completed / a.total) - (b.completed / b.total)
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
        {adminName ?? '管理者'}さん — 全社員の学習進捗状況
      </p>

      <Card title="全社員の進捗">
        <div className="mb-4">
          <input
            type="text"
            placeholder="名前またはメールで検索..."
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
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">JLPT</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">進捗率</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">最終活動日</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
              {sorted.map(e => {
                const pct = e.total > 0 ? Math.round((e.completed / e.total) * 100) : -1
                return (
                  <tr key={e.id} className="hover:bg-gray-50 dark:hover:bg-white/[0.02]">
                    <td className="whitespace-nowrap px-4 py-3">
                      <Link href={`/admin/reports?mentee=${e.id}`} className="text-sm font-medium text-zinc-900 hover:text-indigo-500 dark:text-zinc-100">
                        {e.full_name ?? e.email}
                      </Link>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                      {e.mentor_name ?? '—'}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      {e.jlpt_level ? (
                        <span className="rounded-full bg-indigo-500/10 px-2 py-0.5 text-[10px] font-bold text-indigo-400 ring-1 ring-indigo-500/20">
                          {e.jlpt_level}
                        </span>
                      ) : (
                        <span className="text-xs text-zinc-400">—</span>
                      )}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      {pct >= 0 ? (
                        <div className="flex items-center gap-2">
                          <div className="h-2 w-20 rounded-full bg-gray-200 dark:bg-gray-600">
                            <div
                              className="h-2 rounded-full bg-indigo-500 transition-all"
                              style={{ width: `${pct}%` }}
                            />
                          </div>
                          <span className="text-xs text-zinc-500">{pct}%</span>
                        </div>
                      ) : (
                        <span className="text-xs text-zinc-400">未割当</span>
                      )}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                      {e.last_activity ? new Date(e.last_activity).toLocaleDateString('ja-JP') : '—'}
                    </td>
                  </tr>
                )
              })}
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
