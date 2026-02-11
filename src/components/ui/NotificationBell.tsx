'use client'

import { useEffect, useState } from 'react'
import { Bell } from 'lucide-react'
import { getUnreadTaskCount, getTaskNotifications } from '@/app/actions/notifications'

export default function NotificationBell() {
  const [unreadCount, setUnreadCount] = useState(0)
  const [isOpen, setIsOpen] = useState(false)

  useEffect(() => {
    async function fetchCount() {
      const { count } = await getUnreadTaskCount()
      setUnreadCount(count)
    }
    fetchCount()
    const interval = setInterval(fetchCount, 30000)
    return () => clearInterval(interval)
  }, [])

  return (
    <div className="relative">
      <button
        onClick={() => setIsOpen(!isOpen)}
        className="relative rounded-lg p-2 text-zinc-500 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-white/5"
        aria-label="通知"
      >
        <Bell className="h-5 w-5" />
        {unreadCount > 0 && (
          <span className="absolute right-0 top-0 flex h-4 w-4 items-center justify-center rounded-full bg-indigo-500 text-xs font-bold text-white">
            {unreadCount > 9 ? '9+' : unreadCount}
          </span>
        )}
      </button>
      {isOpen && (
        <>
          <div
            className="fixed inset-0 z-40"
            onClick={() => setIsOpen(false)}
          />
          <div className="absolute right-0 top-12 z-50 w-80 rounded-2xl border border-gray-200 bg-white shadow-lg dark:border-white/[0.08] dark:bg-zinc-900/90 dark:backdrop-blur-xl">
            <NotificationDropdown onClose={() => setIsOpen(false)} />
          </div>
        </>
      )}
    </div>
  )
}

function NotificationDropdown({ onClose }: { onClose: () => void }) {
  const [notifications, setNotifications] = useState<any[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchNotifications() {
      const { notifications } = await getTaskNotifications()
      setNotifications(notifications)
      setLoading(false)
    }
    fetchNotifications()
  }, [])

  if (loading) {
    return (
      <div className="p-4 text-center text-sm text-zinc-500 dark:text-zinc-400">
        読み込み中...
      </div>
    )
  }

  if (notifications.length === 0) {
    return (
      <div className="p-4 text-center text-sm text-zinc-500 dark:text-zinc-400">
        通知はありません
      </div>
    )
  }

  return (
    <div className="max-h-96 overflow-y-auto">
      <div className="border-b border-gray-200 px-4 py-3 dark:border-white/[0.06]">
        <h3 className="text-sm font-semibold text-zinc-900 dark:text-zinc-100">通知</h3>
      </div>
      <div className="divide-y divide-gray-200 dark:divide-white/[0.06]">
        {notifications.map((notification) => (
          <div
            key={notification.id}
            className="px-4 py-3 hover:bg-zinc-50 dark:hover:bg-white/5"
          >
            <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100">
              {notification.title}
            </p>
            {notification.description && (
              <p className="mt-1 text-xs text-zinc-500 dark:text-zinc-400">
                {notification.description}
              </p>
            )}
            <p className="mt-1 text-xs text-zinc-400 dark:text-zinc-500">
              {notification.assignedBy} · {new Date(notification.createdAt).toLocaleDateString('ja-JP')}
            </p>
          </div>
        ))}
      </div>
    </div>
  )
}
