'use client'

import { useEffect, useState } from 'react'
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
        className="relative rounded-lg p-2 text-gray-600 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-800"
        aria-label="通知"
      >
        <svg
          className="h-6 w-6"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"
          />
        </svg>
        {unreadCount > 0 && (
          <span className="absolute right-0 top-0 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-xs font-bold text-white">
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
          <div className="absolute right-0 top-12 z-50 w-80 rounded-lg border border-gray-200 bg-white shadow-lg dark:border-gray-700 dark:bg-gray-800">
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
      <div className="p-4 text-center text-sm text-gray-500 dark:text-gray-400">
        読み込み中...
      </div>
    )
  }

  if (notifications.length === 0) {
    return (
      <div className="p-4 text-center text-sm text-gray-500 dark:text-gray-400">
        通知はありません
      </div>
    )
  }

  return (
    <div className="max-h-96 overflow-y-auto">
      <div className="border-b border-gray-200 px-4 py-3 dark:border-gray-700">
        <h3 className="text-sm font-semibold text-gray-900 dark:text-white">通知</h3>
      </div>
      <div className="divide-y divide-gray-200 dark:divide-gray-700">
        {notifications.map((notification) => (
          <div
            key={notification.id}
            className="px-4 py-3 hover:bg-gray-50 dark:hover:bg-gray-700"
          >
            <p className="text-sm font-medium text-gray-900 dark:text-white">
              {notification.title}
            </p>
            {notification.description && (
              <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                {notification.description}
              </p>
            )}
            <p className="mt-1 text-xs text-gray-400 dark:text-gray-500">
              {notification.assignedBy} · {new Date(notification.createdAt).toLocaleDateString('ja-JP')}
            </p>
          </div>
        ))}
      </div>
    </div>
  )
}
