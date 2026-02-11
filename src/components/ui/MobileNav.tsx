'use client'

import Sidebar from './Sidebar'
import type { UserRole } from '@/lib/supabase/types'

export default function MobileNav({
  isOpen,
  onClose,
  userRole = 'mentee',
}: {
  isOpen: boolean
  onClose: () => void
  userRole?: UserRole
}) {
  if (!isOpen) return null

  return (
    <>
      <div
        className="fixed inset-0 z-40 bg-black/60 backdrop-blur-sm lg:hidden"
        onClick={onClose}
      />
      <div className="fixed inset-y-0 left-0 z-50 w-64 lg:hidden">
        <Sidebar onClose={onClose} userRole={userRole} />
      </div>
    </>
  )
}
