'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Home } from 'lucide-react'

const TABS = [
  { href: '/dashboard', label: 'ホーム', icon: Home, match: (p: string) => p.startsWith('/dashboard') },
]

export default function DevMobileShellLayout({ children }: { children: React.ReactNode }) {
  const pathname = usePathname() ?? ''
  // 레슨 상세는 몰입형(앱바·탭바 숨김) — 스텝 플레이어가 전체화면
  const isLesson = pathname.includes('/dev/lessons/')
  const showShell = !isLesson

  return (
    <>
      <div className={showShell ? 'pb-20 lg:pb-0' : ''}>{children}</div>

      {/* Mobile bottom tab bar */}
      {showShell && (
        <nav
          className="fixed inset-x-0 bottom-0 z-40 flex border-t border-gray-200 bg-white/95 backdrop-blur dark:border-gray-700 dark:bg-gray-900/95 lg:hidden"
          style={{ paddingBottom: 'env(safe-area-inset-bottom)' }}
        >
          {TABS.map((tab) => {
            const active = tab.match(pathname)
            const Icon = tab.icon
            return (
              <Link
                key={tab.href}
                href={tab.href}
                className={`flex flex-1 flex-col items-center justify-center gap-0.5 py-2 text-xs font-medium ${
                  active
                    ? 'text-indigo-600 dark:text-indigo-400'
                    : 'text-gray-500 dark:text-gray-400'
                }`}
              >
                <Icon className="h-5 w-5" />
                {tab.label}
              </Link>
            )
          })}
        </nav>
      )}
    </>
  )
}
