'use client'

import Link from 'next/link'
import { signOut } from '@/app/actions/auth'
import NotificationBell from './NotificationBell'
import ProfileAvatar from './ProfileAvatar'
import { useTheme } from '@/components/theme/ThemeProvider'
import { Menu, Sun, Moon, Shield, BookOpen, LogOut } from 'lucide-react'
import type { UserRole, JlptLevel } from '@/lib/supabase/types'

export default function Header({
  userName,
  avatarUrl,
  userRole,
  jlptLevel,
  onMenuToggle,
}: {
  userName: string | null
  avatarUrl: string | null
  userRole: UserRole
  jlptLevel: JlptLevel | null
  onMenuToggle: () => void
}) {
  const { theme, toggleTheme } = useTheme()

  return (
    <header className="relative z-50 flex h-16 items-center bg-white/80 backdrop-blur-xl px-4 dark:bg-zinc-950/80 dark:backdrop-blur-xl border-b border-gray-200 dark:border-white/[0.06] lg:px-6">
      <button
        onClick={onMenuToggle}
        className="rounded-lg p-2 text-zinc-500 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-white/5 lg:hidden"
      >
        <Menu className="h-5 w-5" />
      </button>

      {(userRole === 'admin' || userRole === 'mentor') && (
        <Link
          href={userRole === 'admin' ? '/admin' : '/mentor'}
          className="ml-2 flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-sm font-medium text-indigo-600 hover:bg-indigo-50 dark:text-indigo-400 dark:hover:bg-indigo-500/10 transition-colors"
        >
          <Shield className="h-4 w-4" />
          管理
        </Link>
      )}

      <Link
        href="/personal-vocab"
        className="ml-2 flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-sm font-medium text-emerald-600 hover:bg-emerald-50 dark:text-emerald-400 dark:hover:bg-emerald-500/10 transition-colors"
      >
        <BookOpen className="h-4 w-4" />
        単語帳
      </Link>

      <div className="flex-1" />

      <div className="flex items-center gap-3">
        <button
          onClick={toggleTheme}
          className="rounded-lg p-2 text-zinc-500 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-white/5"
          aria-label="テーマ変更"
        >
          {theme === 'dark' ? <Sun className="h-5 w-5" /> : <Moon className="h-5 w-5" />}
        </button>

        <NotificationBell />

        <ProfileAvatar avatarUrl={avatarUrl} userName={userName} size="md" />

        <Link
          href="/profile"
          className="rounded-lg px-1 text-sm text-zinc-600 hover:text-indigo-600 dark:text-zinc-300 dark:hover:text-indigo-400 transition-colors"
        >
          {userName ?? 'ユーザー'}
        </Link>
        {jlptLevel && (
          <span className="rounded-full bg-indigo-100 px-2 py-0.5 text-xs font-semibold text-indigo-700 dark:bg-indigo-500/20 dark:text-indigo-300">
            {jlptLevel}
          </span>
        )}
        <form action={signOut}>
          <button
            type="submit"
            className="flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-sm text-zinc-500 dark:text-zinc-400"
          >
            <LogOut className="h-4 w-4" />
            ログアウト
          </button>
        </form>
      </div>
    </header>
  )
}
