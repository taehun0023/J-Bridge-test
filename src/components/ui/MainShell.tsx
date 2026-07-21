'use client'

import { useState } from 'react'
import { usePathname } from 'next/navigation'
import Sidebar from './Sidebar'
import Header from './Header'
import MobileNav from './MobileNav'
import VocabContextMenu from '@/components/personal-vocab/VocabContextMenu'
import type { UserRole, JlptLevel } from '@/lib/supabase/types'

export default function MainShell({
  children,
  userName,
  avatarUrl,
  userRole = 'mentee',
  jlptLevel = null,
  hiddenNav = [],
  navOverrides = {},
}: {
  children: React.ReactNode
  userName: string | null
  avatarUrl: string | null
  userRole?: UserRole
  jlptLevel?: JlptLevel | null
  hiddenNav?: string[]
  navOverrides?: Record<string, string>
}) {
  const [mobileOpen, setMobileOpen] = useState(false)
  const [sidebarOpen, setSidebarOpen] = useState(true)
  const pathname = usePathname() ?? ''
  // /dev 는 모바일에서 자체 앱셸(앱바+하단탭)을 쓰므로 글로벌 헤더를 숨긴다 (데스크톱은 유지)
  const hideHeaderOnMobile = pathname.startsWith('/dev')

  return (
    <div className="flex h-screen bg-zinc-50 dark:bg-zinc-950">
      {/* Desktop sidebar (collapsible) */}
      <div
        className={`hidden shrink-0 overflow-hidden transition-[width] duration-200 lg:block ${
          sidebarOpen ? 'w-64' : 'w-0'
        }`}
      >
        <div className="w-64">
          <Sidebar hiddenNav={hiddenNav} navOverrides={navOverrides} onClose={() => setSidebarOpen(false)} />
        </div>
      </div>

      {/* Mobile nav */}
      <MobileNav isOpen={mobileOpen} onClose={() => setMobileOpen(false)} hiddenNav={hiddenNav} navOverrides={navOverrides} />

      {/* Main content */}
      <div className="flex flex-1 flex-col overflow-hidden">
        <div className={hideHeaderOnMobile ? 'hidden lg:block' : ''}>
          <Header
            userName={userName}
            avatarUrl={avatarUrl}
            userRole={userRole}
            jlptLevel={jlptLevel}
            onMenuToggle={() => setMobileOpen((v) => !v)}
            onSidebarToggle={() => setSidebarOpen((v) => !v)}
            sidebarOpen={sidebarOpen}
          />
        </div>
        <main className="flex-1 overflow-y-auto p-4 lg:p-6">
          {children}
        </main>
      </div>
      <VocabContextMenu />
    </div>
  )
}
