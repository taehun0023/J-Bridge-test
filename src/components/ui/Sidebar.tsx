'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import {
  LayoutDashboard,
  BookOpen,
  Languages,
  Briefcase,
  Code2,
  Trophy,
  Medal,
  User,
  Users,
  FileEdit,
  ClipboardList,
  BarChart3,
  X,
} from 'lucide-react'
import type { UserRole } from '@/lib/supabase/types'

const navItems = [
  { href: '/dashboard', label: 'ダッシュボード', icon: LayoutDashboard },
  { href: '/courses', label: 'コース', icon: BookOpen },
  { href: '/japanese/jlpt', label: 'JLPT日本語', icon: Languages },
  { href: '/japanese/business', label: 'ITビジネス日本語', icon: Briefcase },
  { href: '/coding/problems', label: 'コーディング問題', icon: Code2 },
  { href: '/coding/exams', label: '等級試験', icon: Trophy },
  { href: '/ranking', label: 'ランキング', icon: Medal },
  { href: '/profile', label: 'プロフィール', icon: User },
]

const adminNavItems = [
  { href: '/admin/users', label: 'ユーザー管理', icon: Users },
  { href: '/admin/courses', label: 'コンテンツ管理', icon: FileEdit },
  { href: '/admin/tasks', label: '課題配信', icon: ClipboardList },
  { href: '/admin/reports', label: 'レポート', icon: BarChart3 },
]

export default function Sidebar({ onClose, userRole = 'mentee' }: { onClose?: () => void; userRole?: UserRole }) {
  const pathname = usePathname()

  return (
    <nav className="flex h-full flex-col bg-white/80 backdrop-blur-xl border-r border-gray-200 dark:bg-zinc-950/80 dark:backdrop-blur-xl dark:border-r dark:border-white/[0.06]">
      <div className="flex h-16 items-center justify-between px-6 border-b border-gray-100 dark:border-white/[0.06]">
        <Link href="/dashboard" className="text-xl font-bold">
          <span className="text-indigo-500">J</span>
          <span className="text-zinc-900 dark:text-zinc-100">-Bridge</span>
        </Link>
        {onClose && (
          <button onClick={onClose} className="text-zinc-400 hover:text-zinc-600 dark:text-zinc-500 dark:hover:text-zinc-300 lg:hidden">
            <X className="h-5 w-5" />
          </button>
        )}
      </div>

      <ul className="flex-1 space-y-1 px-3 py-4 overflow-y-auto">
        {navItems.map((item) => {
          const isActive = pathname.startsWith(item.href)
          const Icon = item.icon
          return (
            <li key={item.href}>
              <Link
                href={item.href}
                onClick={onClose}
                className={`flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors ${
                  isActive
                    ? 'bg-indigo-50 text-indigo-700 dark:bg-indigo-500/10 dark:text-indigo-400 dark:border-l-2 dark:border-indigo-500'
                    : 'text-zinc-600 hover:bg-gray-50 hover:text-zinc-900 dark:text-zinc-400 dark:hover:bg-white/5 dark:hover:text-zinc-200'
                }`}
              >
                <Icon className="h-4 w-4 shrink-0" />
                {item.label}
              </Link>
            </li>
          )
        })}

        {userRole === 'admin' && (
          <>
            <li className="pt-4 pb-1">
              <div className="border-t border-gray-200 dark:border-white/[0.06] pt-4">
                <span className="px-3 text-xs font-semibold uppercase tracking-wider text-zinc-400 dark:text-zinc-500">
                  管理者
                </span>
              </div>
            </li>
            {adminNavItems.map((item) => {
              const isActive = pathname.startsWith(item.href)
              const Icon = item.icon
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    onClick={onClose}
                    className={`flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors ${
                      isActive
                        ? 'bg-indigo-50 text-indigo-700 dark:bg-indigo-500/10 dark:text-indigo-400 dark:border-l-2 dark:border-indigo-500'
                        : 'text-zinc-600 hover:bg-gray-50 hover:text-zinc-900 dark:text-zinc-400 dark:hover:bg-white/5 dark:hover:text-zinc-200'
                    }`}
                  >
                    <Icon className="h-4 w-4 shrink-0" />
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
