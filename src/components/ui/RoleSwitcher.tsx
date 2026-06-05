'use client'

import { useState, useTransition } from 'react'
import { switchMyRole } from '@/app/actions/dev-role-switch'
import { UserCog, Check, ChevronDown } from 'lucide-react'
import type { UserRole } from '@/lib/supabase/types'

// テスト/ローカル ref のみ許可。本番(honban)では表示しない。
const ENABLED_SUPABASE_REFS = ['nyymasirfrawsxobmfwi', 'jpjvzlmwzeiyukqqbdit']

const ROLE_LABELS: Record<UserRole, string> = {
  admin: '管理者',
  mentor: 'メンター',
  mentee: 'メンティー',
}

const ROLES: UserRole[] = ['admin', 'mentor', 'mentee']

/**
 * テスト用ロール切替ボタン。テスト環境(Supabase ref一致)でのみ表示される。
 * 本番(honban)では描画されず、サーバ側でも拒否されるため安全。
 */
export default function RoleSwitcher({ currentRole }: { currentRole: UserRole }) {
  const [open, setOpen] = useState(false)
  const [isPending, startTransition] = useTransition()

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL ?? ''
  const enabled = ENABLED_SUPABASE_REFS.some((ref) => url.includes(ref))
  if (!enabled) return null

  function handleSelect(role: UserRole) {
    setOpen(false)
    if (role === currentRole) return
    startTransition(async () => {
      const res = await switchMyRole(role)
      if (res?.error) {
        alert(res.error)
        return
      }
      // ミドルウェアとサーバコンポーネントを新ロールで再評価
      window.location.assign('/dashboard')
    })
  }

  return (
    <div className="relative">
      <button
        onClick={() => setOpen((v) => !v)}
        disabled={isPending}
        title="テスト用: ロール切替"
        className="flex items-center gap-1 rounded-lg border border-amber-400/40 bg-amber-50 px-2.5 py-1.5 text-xs font-semibold text-amber-700 hover:bg-amber-100 disabled:opacity-50 dark:border-amber-400/30 dark:bg-amber-500/10 dark:text-amber-300 dark:hover:bg-amber-500/20"
      >
        <UserCog className="h-4 w-4" />
        <span className="hidden sm:inline">{ROLE_LABELS[currentRole]}</span>
        <ChevronDown className="h-3 w-3" />
      </button>

      {open && (
        <>
          <div className="fixed inset-0 z-40" onClick={() => setOpen(false)} />
          <div className="absolute right-0 z-50 mt-1 w-36 overflow-hidden rounded-lg border border-gray-200 bg-white shadow-lg dark:border-white/10 dark:bg-zinc-900">
            <div className="border-b border-gray-100 px-3 py-1.5 text-[10px] font-semibold uppercase tracking-wide text-amber-600 dark:border-white/5 dark:text-amber-400">
              テスト用 ロール切替
            </div>
            {ROLES.map((role) => (
              <button
                key={role}
                onClick={() => handleSelect(role)}
                className="flex w-full items-center justify-between px-3 py-2 text-sm text-zinc-700 hover:bg-zinc-100 dark:text-zinc-200 dark:hover:bg-white/5"
              >
                {ROLE_LABELS[role]}
                {role === currentRole && <Check className="h-4 w-4 text-amber-600 dark:text-amber-400" />}
              </button>
            ))}
          </div>
        </>
      )}
    </div>
  )
}
