'use client'

import Card from '@/components/ui/Card'
import Link from 'next/link'
import { Megaphone } from 'lucide-react'

interface MenteeProgress {
  id: string
  full_name: string | null
  email: string
  jlpt_level: string | null
  total: number
  completed: number
}

interface Props {
  mentorName: string | null
  mentees: MenteeProgress[]
  unreadAnnouncements?: number
}

export default function MentorDashboard({ mentorName, mentees, unreadAnnouncements = 0 }: Props) {
  const sorted = [...mentees].sort((a, b) => {
    if (a.total === 0 && b.total === 0) return 0
    if (a.total === 0) return 1
    if (b.total === 0) return -1
    return (a.completed / a.total) - (b.completed / b.total)
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

      <Card title="担当メンティーの進捗">
        {sorted.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">
            担当メンティーがいません
          </div>
        ) : (
          <div className="divide-y divide-gray-100 dark:divide-white/[0.06]">
            {sorted.map(m => {
              const pct = m.total > 0 ? Math.round((m.completed / m.total) * 100) : -1
              return (
                <div key={m.id} className="flex items-center gap-3 py-3">
                  <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-indigo-500/10 text-xs font-bold text-indigo-400 ring-1 ring-indigo-500/20">
                    {(m.full_name ?? '?').charAt(0)}
                  </div>
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-2">
                      <span className="truncate text-sm font-medium text-zinc-900 dark:text-zinc-100">
                        {m.full_name ?? m.email}
                      </span>
                      {m.jlpt_level && (
                        <span className="shrink-0 rounded-full bg-indigo-500/10 px-2 py-0.5 text-[10px] font-bold text-indigo-400 ring-1 ring-indigo-500/20">
                          {m.jlpt_level}
                        </span>
                      )}
                    </div>
                    <div className="mt-1 flex items-center gap-2">
                      <div className="h-2 w-full max-w-[160px] rounded-full bg-gray-200 dark:bg-gray-600">
                        <div
                          className="h-2 rounded-full bg-indigo-500 transition-all"
                          style={{ width: `${pct >= 0 ? pct : 0}%` }}
                        />
                      </div>
                      <span className="shrink-0 text-xs text-zinc-500 dark:text-zinc-400">
                        {pct >= 0 ? `${pct}% (${m.completed}/${m.total})` : '未割当'}
                      </span>
                    </div>
                  </div>
                  <Link
                    href={`/admin/reports?mentee=${m.id}`}
                    className="shrink-0 text-xs text-indigo-500 hover:text-indigo-400"
                  >
                    詳細 →
                  </Link>
                </div>
              )
            })}
          </div>
        )}
      </Card>

      <div className="mt-6">
        <Card title="お知らせ">
          <Link href="/announcements" className="flex items-center gap-3 text-sm text-zinc-700 hover:text-indigo-500 dark:text-zinc-300 transition-colors">
            <Megaphone className="h-5 w-5 text-indigo-500" />
            <span>お知らせを見る</span>
            {unreadAnnouncements > 0 && (
              <span className="ml-auto inline-flex h-5 min-w-5 items-center justify-center rounded-full bg-red-500 px-1.5 text-[10px] font-bold text-white">
                {unreadAnnouncements}
              </span>
            )}
          </Link>
        </Card>
      </div>
    </div>
  )
}
