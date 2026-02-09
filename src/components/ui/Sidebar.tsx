'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'

const navItems = [
  { href: '/dashboard', label: '대시보드', icon: '📊' },
  { href: '/courses', label: '코스', icon: '📚' },
  { href: '/japanese/jlpt', label: 'JLPT 일본어', icon: '🇯🇵' },
  { href: '/japanese/business', label: 'IT 일본어', icon: '💼' },
  { href: '/coding/problems', label: '코딩 문제', icon: '💻' },
  { href: '/profile', label: '프로필', icon: '👤' },
]

export default function Sidebar({ onClose }: { onClose?: () => void }) {
  const pathname = usePathname()

  return (
    <nav className="flex h-full flex-col bg-white border-r border-gray-200">
      <div className="flex h-16 items-center justify-between px-6 border-b border-gray-100">
        <Link href="/dashboard" className="text-xl font-bold text-blue-600">
          J-Bridge
        </Link>
        {onClose && (
          <button onClick={onClose} className="text-gray-400 hover:text-gray-600 lg:hidden">
            ✕
          </button>
        )}
      </div>

      <ul className="flex-1 space-y-1 px-3 py-4">
        {navItems.map((item) => {
          const isActive = pathname.startsWith(item.href)
          return (
            <li key={item.href}>
              <Link
                href={item.href}
                onClick={onClose}
                className={`flex items-center gap-3 rounded-lg px-3 py-2.5 text-sm font-medium transition-colors ${
                  isActive
                    ? 'bg-blue-50 text-blue-700'
                    : 'text-gray-600 hover:bg-gray-50 hover:text-gray-900'
                }`}
              >
                <span className="text-base">{item.icon}</span>
                {item.label}
              </Link>
            </li>
          )
        })}
      </ul>
    </nav>
  )
}
