'use client'

import Sidebar from './Sidebar'

export default function MobileNav({
  isOpen,
  onClose,
  hiddenNav = [],
}: {
  isOpen: boolean
  onClose: () => void
  hiddenNav?: string[]
}) {
  if (!isOpen) return null

  return (
    <>
      <div
        className="fixed inset-0 z-40 bg-black/60 backdrop-blur-sm lg:hidden"
        onClick={onClose}
      />
      <div className="fixed inset-y-0 left-0 z-50 w-64 lg:hidden">
        <Sidebar onClose={onClose} hiddenNav={hiddenNav} />
      </div>
    </>
  )
}
