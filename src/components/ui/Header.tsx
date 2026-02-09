'use client'

import { signOut } from '@/app/actions/auth'

export default function Header({
  userName,
  onMenuToggle,
}: {
  userName: string | null
  onMenuToggle: () => void
}) {
  return (
    <header className="flex h-16 items-center justify-between border-b border-gray-200 bg-white px-4 lg:px-6">
      <button
        onClick={onMenuToggle}
        className="rounded-lg p-2 text-gray-500 hover:bg-gray-100 lg:hidden"
      >
        <svg className="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </button>

      <div className="flex-1" />

      <div className="flex items-center gap-4">
        <span className="text-sm text-gray-600">{userName ?? '사용자'}</span>
        <form action={signOut}>
          <button
            type="submit"
            className="rounded-lg border border-gray-200 px-3 py-1.5 text-sm text-gray-600 hover:bg-gray-50"
          >
            로그아웃
          </button>
        </form>
      </div>
    </header>
  )
}
