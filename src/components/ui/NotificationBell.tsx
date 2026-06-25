'use client'

import { useState, useEffect, useRef, useCallback } from 'react'
import { Bell, X } from 'lucide-react'
import { useRouter } from 'next/navigation'
import { getUnreadNotificationCount, getNotifications, markAsRead, markAllAsRead, deleteNotification, deleteAllNotifications } from '@/app/actions/notifications'

interface NotificationItem {
  id: string
  type: string
  title: string
  message: string | null
  link: string | null
  is_read: boolean
  created_at: string
}

export default function NotificationBell() {
  const [unreadCount, setUnreadCount] = useState(0)
  const [notifications, setNotifications] = useState<NotificationItem[]>([])
  const [isOpen, setIsOpen] = useState(false)
  const [loading, setLoading] = useState(false)
  const dropdownRef = useRef<HTMLDivElement>(null)
  const router = useRouter()

  const fetchCount = useCallback(async () => {
    const result = await getUnreadNotificationCount()
    setUnreadCount(result.count)
  }, [])

  useEffect(() => {
    fetchCount()
    const interval = setInterval(fetchCount, 5000)
    return () => clearInterval(interval)
  }, [fetchCount])

  useEffect(() => {
    function handleClickOutside(e: MouseEvent) {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
        setIsOpen(false)
      }
    }
    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  async function handleOpen() {
    if (isOpen) {
      setIsOpen(false)
      return
    }
    setIsOpen(true)
    setLoading(true)
    const result = await getNotifications(15)
    setNotifications(result.notifications as NotificationItem[])
    setLoading(false)
  }

  function handleNotificationClick(notification: NotificationItem) {
    // Navigate first for instant response — don't block on server round-trip.
    if (notification.link) {
      setIsOpen(false)
      router.push(notification.link)
    }
    // Mark as read asynchronously (fire-and-forget); local state updates immediately
    // so the UI reflects the read state without waiting for the server.
    if (!notification.is_read) {
      setNotifications(prev =>
        prev.map(n => n.id === notification.id ? { ...n, is_read: true } : n)
      )
      setUnreadCount(prev => Math.max(0, prev - 1))
      markAsRead(notification.id).catch(err => console.error('Failed to mark notification as read:', err))
    }
  }

  async function handleMarkAllRead() {
    await markAllAsRead()
    setNotifications(prev => prev.map(n => ({ ...n, is_read: true })))
    setUnreadCount(0)
  }

  async function handleDelete(notificationId: string, wasUnread: boolean) {
    await deleteNotification(notificationId)
    setNotifications(prev => prev.filter(n => n.id !== notificationId))
    if (wasUnread) {
      setUnreadCount(prev => Math.max(0, prev - 1))
    }
  }

  async function handleDeleteAll() {
    await deleteAllNotifications()
    setNotifications([])
    setUnreadCount(0)
  }

  function formatTime(dateStr: string) {
    const diff = Date.now() - new Date(dateStr).getTime()
    const minutes = Math.floor(diff / 60000)
    if (minutes < 1) return 'たった今'
    if (minutes < 60) return `${minutes}分前`
    const hours = Math.floor(minutes / 60)
    if (hours < 24) return `${hours}時間前`
    const days = Math.floor(hours / 24)
    return `${days}日前`
  }

  return (
    <div className="relative" ref={dropdownRef}>
      <button
        onClick={handleOpen}
        className="relative rounded-lg p-1.5 text-zinc-500 hover:bg-gray-100 hover:text-zinc-700 dark:text-zinc-400 dark:hover:bg-white/5 dark:hover:text-zinc-200 transition-colors"
        aria-label="通知"
      >
        <Bell className="h-5 w-5" />
        {unreadCount > 0 && (
          <span className="absolute -top-0.5 -right-0.5 flex h-4 min-w-4 items-center justify-center rounded-full bg-red-500 px-1 text-[10px] font-bold text-white">
            {unreadCount > 99 ? '99+' : unreadCount}
          </span>
        )}
      </button>

      {isOpen && (
        <div className="absolute right-0 top-full z-50 mt-2 w-80 rounded-xl border border-gray-200 bg-white shadow-lg dark:border-white/[0.08] dark:bg-zinc-900">
          <div className="flex items-center justify-between border-b border-gray-100 px-4 py-3 dark:border-white/[0.06]">
            <h3 className="text-sm font-semibold text-zinc-900 dark:text-zinc-100">通知</h3>
            <div className="flex items-center gap-2">
              {notifications.length > 0 && (
                <button
                  onClick={handleDeleteAll}
                  className="text-xs text-red-500 hover:text-red-400"
                >
                  すべて削除
                </button>
              )}
              {unreadCount > 0 && (
                <button
                  onClick={handleMarkAllRead}
                  className="text-xs text-indigo-600 hover:text-indigo-500 dark:text-indigo-400"
                >
                  すべて既読
                </button>
              )}
            </div>
          </div>

          <div className="max-h-80 overflow-y-auto">
            {loading ? (
              <div className="py-8 text-center text-sm text-zinc-400">読み込み中...</div>
            ) : notifications.length === 0 ? (
              <div className="py-8 text-center text-sm text-zinc-400">通知はありません</div>
            ) : (
              notifications.map(notification => (
                <div
                  key={notification.id}
                  className={`group relative flex items-start px-4 py-3 hover:bg-gray-50 dark:hover:bg-white/5 transition-colors border-b border-gray-50 dark:border-white/[0.03] last:border-0 ${
                    !notification.is_read ? 'bg-indigo-50/50 dark:bg-indigo-500/5' : ''
                  }`}
                >
                  <button
                    onClick={() => handleNotificationClick(notification)}
                    className="flex-1 text-left"
                  >
                    <div className="flex items-start gap-2">
                      {!notification.is_read && (
                        <span className="mt-1.5 h-2 w-2 shrink-0 rounded-full bg-indigo-500" />
                      )}
                      <div className={!notification.is_read ? '' : 'pl-4'}>
                        <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100 line-clamp-2">
                          {notification.title}
                        </p>
                        {notification.message && (
                          <p className="mt-0.5 text-xs text-zinc-500 dark:text-zinc-400 line-clamp-1">
                            {notification.message}
                          </p>
                        )}
                        <p className="mt-1 text-xs text-zinc-400 dark:text-zinc-500">
                          {formatTime(notification.created_at)}
                        </p>
                      </div>
                    </div>
                  </button>
                  <button
                    onClick={(e) => { e.stopPropagation(); handleDelete(notification.id, !notification.is_read) }}
                    className="opacity-0 group-hover:opacity-100 ml-1 mt-1 shrink-0 rounded p-1 text-zinc-400 hover:text-red-500 transition-all"
                  >
                    <X className="h-3.5 w-3.5" />
                  </button>
                </div>
              ))
            )}
          </div>
          <div className="border-t border-gray-100 px-4 py-2 text-center dark:border-white/[0.06]">
            <button onClick={() => { setIsOpen(false); router.push('/notifications') }} className="text-xs font-medium text-indigo-600 hover:text-indigo-500 dark:text-indigo-400">
              すべて見る
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
