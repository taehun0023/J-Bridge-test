'use client'

import { signOut } from '@/app/actions/auth'
import NotificationBell from './NotificationBell'
import ProfileAvatar from './ProfileAvatar'
import { useTheme } from '@/components/theme/ThemeProvider'
import { Menu, Sun, Moon, LogOut } from 'lucide-react'

export default function Header({
  userName,
  avatarUrl,
  onMenuToggle,
}: {
  userName: string | null
  avatarUrl: string | null
  onMenuToggle: () => void
}) {
  const { theme, toggleTheme } = useTheme()

  return (
    <header className="flex h-16 items-center justify-between bg-white/80 backdrop-blur-xl px-4 dark:bg-zinc-950/80 dark:backdrop-blur-xl border-b border-gray-200 dark:border-white/[0.06] lg:px-6">
      <button
        onClick={onMenuToggle}
        className="rounded-lg p-2 text-zinc-500 hover:bg-zinc-100 dark:text-zinc-400 dark:hover:bg-white/5 lg:hidden"
      >
        <Menu className="h-5 w-5" />
      </button>

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

        <span className="text-sm text-zinc-600 dark:text-zinc-300">{userName ?? 'ユーザー'}</span>
        <form action={signOut}>
          <button
            type="submit"
            className="flex items-center gap-1.5 rounded-lg px-3 py-1.5 text-sm text-zinc-400 hover:text-zinc-100 dark:text-zinc-400 dark:hover:text-white transition-colors"
          >
            <LogOut className="h-4 w-4" />
            ログアウト
          </button>
        </form>
      </div>
    </header>
  )
}
