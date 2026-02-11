'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import type { UserRole } from '@/lib/supabase/types'

const navItems = [
  { href: '/dashboard', label: 'ダッシュボード', icon: '📊' },
  { href: '/courses', label: 'コース', icon: '📚' },
  { href: '/japanese/jlpt', label: 'JLPT日本語', icon: '🇯🇵' },
  { href: '/japanese/business', label: 'ITビジネス日本語', icon: '💼' },
  { href: '/coding/problems', label: 'コーディング問題', icon: '💻' },
  { href: '/coding/exams', label: '等級試験', icon: '🏆' },
  { href: '/ranking', label: 'ランキング', icon: '🥇' },
  { href: '/profile', label: 'プロフィール', icon: '👤' },
]

const adminNavItems = [
  { href: '/admin/users', label: 'ユーザー管理', icon: '👥' },
  { href: '/admin/courses', label: 'コンテンツ管理', icon: '📝' },
  { href: '/admin/tasks', label: '課題配信', icon: '📋' },
  { href: '/admin/reports', label: 'レポート', icon: '📈' },
]

export default function Sidebar({ onClose, userRole = 'mentee' }: { onClose?: () => void; userRole?: UserRole }) {
  const pathname = usePathname()

  return (
    <nav className="flex h-full flex-col bg-white border-r border-gray-200 dark:bg-gray-900 dark:border-gray-700">
      <div className="flex h-16 items-center justify-between px-6 border-b border-gray-100 dark:border-gray-800">
        <Link href="/dashboard" className="text-xl font-bold text-blue-600 dark:text-blue-400">
          J-Bridge
        </Link>
        {onClose && (
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 dark:text-gray-500 dark:hover:text-gray-300 lg:hidden">
            ✕
          </button>
        )}
      </div>

      <ul className="flex-1 space-y-1 px-3 py-4 overflow-y-auto">
        {navItems.map((item) => {
          const isActive = pathname.startsWith(item.href)
          return (
            <li key={item.href}>
              <Link
                href={item.href}
                onClick={onClose}
                className={`flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors ${
                  isActive
                    ? 'bg-blue-50 text-blue-700 dark:bg-blue-900/30 dark:text-blue-300'
                    : 'text-gray-600 hover:bg-gray-50 hover:text-gray-900 dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-white'
                }`}
              >
                <span className="text-base">{item.icon}</span>
                {item.label}
              </Link>
            </li>
          )
        })}

        {userRole === 'admin' && (
          <>
            <li className="pt-4 pb-1">
              <span className="px-3 text-xs font-semibold uppercase tracking-wider text-gray-400 dark:text-gray-500">
                管理者
              </span>
            </li>
            {adminNavItems.map((item) => {
              const isActive = pathname.startsWith(item.href)
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    onClick={onClose}
                    className={`flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors ${
                      isActive
                        ? 'bg-red-50 text-red-700 dark:bg-red-900/30 dark:text-red-300'
                        : 'text-gray-600 hover:bg-gray-50 hover:text-gray-900 dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-white'
                    }`}
                  >
                    <span className="text-base">{item.icon}</span>
                    {item.label}
                  </Link>
                </li>
              )
            })}
          </>
        )}
      </ul>
    </nav>
  )
}
