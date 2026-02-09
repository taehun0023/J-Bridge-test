'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import type { UserRole } from '@/lib/supabase/types'

const navItems = [
  { href: '/dashboard', label: '대시보드', icon: '📊' },
  { href: '/courses', label: '코스', icon: '📚' },
  { href: '/japanese/jlpt', label: 'JLPT 일본어', icon: '🇯🇵' },
  { href: '/japanese/business', label: 'IT 일본어', icon: '💼' },
  { href: '/coding/problems', label: '코딩 문제', icon: '💻' },
  { href: '/coding/exams', label: '등급 시험', icon: '🏆' },
  { href: '/ranking', label: '랭킹', icon: '🥇' },
  { href: '/profile', label: '프로필', icon: '👤' },
]

const adminNavItems = [
  { href: '/admin/users', label: '사용자 관리', icon: '👥' },
  { href: '/admin/courses', label: '콘텐츠 관리', icon: '📝' },
  { href: '/admin/tasks', label: '과제 배정', icon: '📋' },
  { href: '/admin/reports', label: '리포트', icon: '📈' },
]

export default function Sidebar({ onClose, userRole = 'mentee' }: { onClose?: () => void; userRole?: UserRole }) {
  const pathname = usePathname()

  return (
    <nav className="flex h-full flex-col bg-white border-r border-gray-200">
      <div className="flex h-16 items-center justify-between px-6 border-b border-gray-100">
        <Link href="/dashboard" className="text-xl font-bold text-blue-600">
          J-Bridge
        </Link>
        {onClose && (
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 lg:hidden">
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
                    ? 'bg-blue-50 text-blue-700'
                    : 'text-gray-600 hover:bg-gray-50 hover:text-gray-900'
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
              <span className="px-3 text-xs font-semibold uppercase tracking-wider text-gray-400">
                관리자
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
                        ? 'bg-red-50 text-red-700'
                        : 'text-gray-600 hover:bg-gray-50 hover:text-gray-900'
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
