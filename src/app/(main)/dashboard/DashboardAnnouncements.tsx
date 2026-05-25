'use client'

import Link from 'next/link'
import { Megaphone } from 'lucide-react'

interface AnnouncementItem {
  id: string
  title: string
  created_at: string
  is_read: boolean
}

interface Props {
  announcements: AnnouncementItem[]
}

export default function DashboardAnnouncements({ announcements }: Props) {
  const unread = announcements.filter(a => !a.is_read)
  const display = unread.length > 0 ? unread.slice(0, 5) : announcements.slice(0, 3)

  if (announcements.length === 0) return null

  return (
    <div className="mb-6 rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03] p-4">
      <div className="flex items-center gap-2 mb-3">
        <Megaphone className="h-4 w-4 text-indigo-500" />
        <h3 className="text-sm font-semibold text-zinc-900 dark:text-zinc-100">お知らせ</h3>
        {unread.length > 0 && (
          <span className="inline-flex h-5 min-w-5 items-center justify-center rounded-full bg-red-500 px-1.5 text-[10px] font-bold text-white">
            {unread.length}
          </span>
        )}
        <Link
          href="/announcements"
          className="ml-auto text-xs text-indigo-500 hover:text-indigo-400 transition-colors"
        >
          全て見る →
        </Link>
      </div>
      <div className="space-y-1.5">
        {display.map(a => (
          <Link
            key={a.id}
            href={`/announcements/${a.id}`}
            className="flex items-center gap-2.5 rounded-lg px-3 py-2 hover:bg-gray-50 dark:hover:bg-white/[0.03] transition-colors"
          >
            {!a.is_read && (
              <span className="inline-flex h-4 min-w-4 items-center justify-center rounded bg-red-500 text-[9px] font-bold text-white">
                N
              </span>
            )}
            <span className={`flex-1 truncate text-sm ${!a.is_read ? 'font-medium text-zinc-900 dark:text-zinc-100' : 'text-zinc-500 dark:text-zinc-400'}`}>
              {a.title}
            </span>
            <span className="shrink-0 text-xs text-zinc-400">
              {new Date(a.created_at).toLocaleDateString('ja-JP')}
            </span>
          </Link>
        ))}
      </div>
    </div>
  )
}
