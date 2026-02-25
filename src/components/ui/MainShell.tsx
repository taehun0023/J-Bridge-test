'use client'

import { useState } from 'react'
import Sidebar from './Sidebar'
import Header from './Header'
import MobileNav from './MobileNav'
import VocabContextMenu from '@/components/personal-vocab/VocabContextMenu'
import type { UserRole } from '@/lib/supabase/types'

export default function MainShell({
  children,
  userName,
  avatarUrl,
  userRole = 'mentee',
}: {
  children: React.ReactNode
  userName: string | null
  avatarUrl: string | null
  userRole?: UserRole
}) {
  const [mobileOpen, setMobileOpen] = useState(false)

  return (
    <div className="flex h-screen bg-zinc-50 dark:bg-zinc-950">
      {/* Desktop sidebar */}
      <div className="hidden w-64 shrink-0 lg:block">
        <Sidebar userRole={userRole} />
      </div>

      {/* Mobile nav */}
      <MobileNav isOpen={mobileOpen} onClose={() => setMobileOpen(false)} userRole={userRole} />

      {/* Main content */}
      <div className="flex flex-1 flex-col overflow-hidden">
        <Header
          userName={userName}
          avatarUrl={avatarUrl}
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
