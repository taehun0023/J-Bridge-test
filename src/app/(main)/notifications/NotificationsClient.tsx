'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { markAsRead, markAllAsRead, deleteNotification } from '@/app/actions/notifications'
import type { Notification } from '@/lib/supabase/types'
import { Trash2, CheckCheck } from 'lucide-react'

export default function NotificationsClient({ initial }: { initial: Notification[] }) {
  const router = useRouter()
  const [items, setItems] = useState<Notification[]>(initial)

  async function open(n: Notification) {
    if (!n.is_read) {
      setItems(prev => prev.map(x => x.id === n.id ? { ...x, is_read: true } : x))
      await markAsRead(n.id)
    }
    if (n.link) router.push(n.link)
  }

  async function readAll() {
    setItems(prev => prev.map(x => ({ ...x, is_read: true })))
    await markAllAsRead()
    router.refresh()
  }

  async function remove(id: string, e: React.MouseEvent) {
    e.stopPropagation()
    setItems(prev => prev.filter(x => x.id !== id))
    await deleteNotification(id)
  }

  const unread = items.filter(x => !x.is_read).length

  return (
    <div className="mt-4">
      <div className="mb-3 flex items-center justify-between">
        <span className="text-sm text-gray-500 dark:text-gray-400">未読 {unread}件 / 全 {items.length}件</span>
        <button onClick={readAll} disabled={unread === 0}
          className="inline-flex items-center gap-1.5 rounded-lg bg-gray-100 px-3 py-1.5 text-xs font-medium text-gray-700 hover:bg-gray-200 disabled:opacity-50 dark:bg-gray-700 dark:text-gray-200">
          <CheckCheck className="h-3.5 w-3.5" /> すべて既読
        </button>
      </div>

      {items.length === 0 ? (
        <div className="rounded-xl border border-gray-200 bg-white py-16 text-center text-sm text-gray-400 dark:border-gray-700 dark:bg-gray-800">通知はありません</div>
      ) : (
        <div className="divide-y divide-gray-100 overflow-hidden rounded-xl border border-gray-200 bg-white dark:divide-gray-700 dark:border-gray-700 dark:bg-gray-800">
          {items.map(n => (
            <div key={n.id} onClick={() => open(n)}
              className={`flex cursor-pointer items-start gap-3 px-4 py-3 transition-colors hover:bg-gray-50 dark:hover:bg-gray-700/50 ${n.is_read ? '' : 'bg-indigo-50/50 dark:bg-indigo-500/10'}`}>
              {!n.is_read && <span className="mt-1.5 h-2 w-2 shrink-0 rounded-full bg-indigo-500" />}
              <div className={`min-w-0 flex-1 ${n.is_read ? 'pl-5' : ''}`}>
                <p className="text-sm font-medium text-gray-900 dark:text-gray-100">{n.title}</p>
                {n.message && <p className="mt-0.5 text-sm text-gray-500 dark:text-gray-400">{n.message}</p>}
                <p className="mt-1 text-xs text-gray-400">{new Date(n.created_at).toLocaleString('ja-JP')}</p>
              </div>
              <button onClick={(e) => remove(n.id, e)} className="shrink-0 rounded p-1 text-gray-400 hover:bg-gray-100 hover:text-red-500 dark:hover:bg-gray-700">
                <Trash2 className="h-4 w-4" />
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
