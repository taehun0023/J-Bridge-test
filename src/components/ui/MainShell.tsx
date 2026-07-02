'use client'

import { useState } from 'react'
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
}: {
  children: React.ReactNode
  userName: string | null
  avatarUrl: string | null
  userRole?: UserRole
  jlptLevel?: JlptLevel | null
  hiddenNav?: string[]
}) {
  const [mobileOpen, setMobileOpen] = useState(false)

  return (
    <div className="flex h-screen bg-zinc-50 dark:bg-zinc-950">
      {/* Desktop sidebar */}
      <div className="hidden w-64 shrink-0 lg:block">
        <Sidebar hiddenNav={hiddenNav} />
      </div>

      {/* Mobile nav */}
      <MobileNav isOpen={mobileOpen} onClose={() => setMobileOpen(false)} hiddenNav={hiddenNav} />

      {/* Main content */}
      <div className="flex flex-1 flex-col overflow-hidden">
        <Header
          userName={userName}
          avatarUrl={avatarUrl}
          userRole={userRole}
          jlptLevel={jlptLevel}
          onMenuToggle={() => setMobileOpen(true)}
        />
        <main className="flex-1 overflow-y-auto p-4 lg:p-6">
          {children}
        </main>
      </div>
      <VocabContextMenu />
    </div>
  )
}
