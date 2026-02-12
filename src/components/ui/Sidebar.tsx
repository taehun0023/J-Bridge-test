'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { X } from 'lucide-react'
import type { UserRole } from '@/lib/supabase/types'
import { mainNavItems, getAdminNavForRole } from '@/lib/navigation'

export default function Sidebar({ onClose, userRole = 'mentee' }: { onClose?: () => void; userRole?: UserRole }) {
  const pathname = usePathname()

  const isActive = (href: string) => pathname === href || pathname.startsWith(href + '/')

  const adminItems = getAdminNavForRole(userRole)

  const activeClass = 'bg-indigo-50 text-indigo-700 dark:bg-indigo-500/10 dark:text-indigo-400 dark:border-l-2 dark:border-indigo-500'
  const inactiveClass = 'text-zinc-600 hover:bg-gray-50 hover:text-zinc-900 dark:text-zinc-400 dark:hover:bg-white/5 dark:hover:text-zinc-200'

  return (
    <nav className="flex h-full flex-col bg-white/80 backdrop-blur-xl border-r border-gray-200 dark:bg-zinc-950/80 dark:backdrop-blur-xl dark:border-r dark:border-white/[0.06]">
      <div className="flex h-16 items-center justify-between px-6 border-b border-gray-100 dark:border-white/[0.06]">
        <Link href="/dashboard" className="text-xl font-bold">
          <span className="text-indigo-500">J</span>
          <span className="text-zinc-900 dark:text-zinc-100">-Bridge</span>
        </Link>
        <div className="flex items-center gap-2">
          {onClose && (
            <button onClick={onClose} className="text-zinc-400 hover:text-zinc-600 dark:text-zinc-500 dark:hover:text-zinc-300 lg:hidden">
              <X className="h-5 w-5" />
            </button>
          )}
        </div>
      </div>

      <ul className="flex-1 space-y-1 px-3 py-4 overflow-y-auto">
        {mainNavItems.map((item) => {
          const Icon = item.icon
          return (
            <li key={item.key}>
              <Link
                href={item.href}
                onClick={onClose}
                className={`flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors ${
                  isActive(item.href) ? activeClass : inactiveClass
                }`}
              >
                <Icon className="h-4 w-4 shrink-0" />
                {item.label}
              </Link>
            </li>
          )
        })}

        {adminItems.length > 0 && (
          <>
            <li className="pt-4 pb-1">
              <div className="border-t border-gray-200 dark:border-white/[0.06] pt-4">
                <span className="px-3 text-xs font-semibold uppercase tracking-wider text-zinc-400 dark:text-zinc-500">
                  管理者
                </span>
              </div>
            </li>
            {adminItems.map((item) => {
              const Icon = item.icon
              return (
                <li key={item.href}>
                  <Link
                    href={item.href}
                    onClick={onClose}
                    className={`flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors ${
                      isActive(item.href) ? activeClass : inactiveClass
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
