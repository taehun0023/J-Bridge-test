'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { useLoadingTransition } from '@/lib/loading-store'
import Card from '@/components/ui/Card'
import { setSubcategoryActive } from '@/app/actions/admin/categories'

interface Child { href: string; label: string; description?: string }
interface Category { key: string; title: string; children: Child[] }

export default function AdminCategoriesClient({ categories, topCategories, settings }: { categories: Category[]; topCategories: Child[]; settings: Record<string, boolean> }) {
  const router = useRouter()
  const [pending, startTransition] = useLoadingTransition()
  const [local, setLocal] = useState<Record<string, boolean>>(settings)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  const isActive = (href: string) => local[href] !== false

  function toggle(href: string) {
    const next = !isActive(href)
    setLocal(prev => ({ ...prev, [href]: next }))
    startTransition(async () => {
      const result = await setSubcategoryActive(href, next)
      if ('error' in result) {
        setLocal(prev => ({ ...prev, [href]: !next }))
        setMessage({ type: 'error', text: result.error ?? 'エラーが発生しました' })
      } else {
        setMessage({ type: 'success', text: next ? '有効にしました' : '無効にしました' })
      }
      setTimeout(() => setMessage(null), 2000)
      router.refresh()
    })
  }

  const renderRow = (item: Child) => {
    const active = isActive(item.href)
    return (
      <div key={item.href} className="flex items-center justify-between gap-4 py-3">
        <div className="min-w-0">
          <p className={`text-sm font-medium ${active ? 'text-gray-900 dark:text-white' : 'text-gray-400 line-through dark:text-gray-500'}`}>
            {item.label} <span className="ml-1 text-xs font-normal text-gray-400 dark:text-gray-500">{item.href}</span>
          </p>
          {item.description && <p className="mt-0.5 truncate text-xs text-gray-500 dark:text-gray-400">{item.description}</p>}
        </div>
        <button
          type="button" role="switch" aria-checked={active} onClick={() => toggle(item.href)} disabled={pending}
          title={active ? '有効（クリックで無効化）' : '無効（クリックで有効化）'}
          className={`relative inline-flex h-6 w-11 shrink-0 items-center rounded-full transition-colors disabled:opacity-50 ${active ? 'bg-emerald-500' : 'bg-gray-300 dark:bg-gray-600'}`}
        >
          <span className={`inline-block h-4 w-4 transform rounded-full bg-white shadow transition-transform ${active ? 'translate-x-6' : 'translate-x-1'}`} />
        </button>
      </div>
    )
  }

  return (
    <div className="mt-6 space-y-6">
      {message && (
        <div className={`rounded-xl px-4 py-3 text-sm ${
          message.type === 'success'
            ? 'bg-emerald-500/10 text-emerald-500 ring-1 ring-emerald-500/20'
            : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
        }`}>
          {message.text}
        </div>
      )}

      <Card title="最上位カテゴリ（大分類）">
        <div className="divide-y divide-gray-100 dark:divide-white/[0.06]">
          {topCategories.map(renderRow)}
        </div>
      </Card>

      {categories.map(cat => (
        <Card key={cat.key} title={cat.title}>
          <div className="divide-y divide-gray-100 dark:divide-white/[0.06]">
            {cat.children.map(renderRow)}
          </div>
        </Card>
      ))}
    </div>
  )
}
