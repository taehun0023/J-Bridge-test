'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Pencil, Trash2, RotateCcw, Check, X } from 'lucide-react'
import { useLoadingTransition } from '@/lib/loading-store'
import Card from '@/components/ui/Card'
import {
  setSubcategoryActive,
  updateCategoryOverride,
  setCategoryDeleted,
  type CategoryOverride,
} from '@/app/actions/admin/categories'

interface Child { href: string; label: string; description?: string }
interface Category { key: string; title: string; children: Child[] }

const EMPTY: CategoryOverride = { is_active: true, label_override: null, description_override: null, deleted: false }

export default function AdminCategoriesClient({
  categories,
  topCategories,
  overrides,
}: {
  categories: Category[]
  topCategories: Child[]
  overrides: Record<string, CategoryOverride>
}) {
  const router = useRouter()
  const [pending, startTransition] = useLoadingTransition()
  const [local, setLocal] = useState<Record<string, CategoryOverride>>(overrides)
  const [editing, setEditing] = useState<string | null>(null)
  const [form, setForm] = useState<{ label: string; description: string }>({ label: '', description: '' })
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  const ov = (href: string): CategoryOverride => local[href] ?? EMPTY
  const isActive = (href: string) => ov(href).is_active !== false
  const isDeleted = (href: string) => ov(href).deleted === true

  function flash(type: 'success' | 'error', text: string) {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 2000)
  }
  function patch(href: string, p: Partial<CategoryOverride>) {
    setLocal(prev => ({ ...prev, [href]: { ...EMPTY, ...prev[href], ...p } }))
  }

  function toggle(href: string) {
    const next = !isActive(href)
    patch(href, { is_active: next })
    startTransition(async () => {
      const result = await setSubcategoryActive(href, next)
      if ('error' in result) {
        patch(href, { is_active: !next })
        flash('error', result.error ?? 'エラーが発生しました')
      } else {
        flash('success', next ? '有効にしました' : '無効にしました')
      }
      router.refresh()
    })
  }

  function startEdit(item: Child) {
    setEditing(item.href)
    setForm({
      label: ov(item.href).label_override ?? item.label,
      description: ov(item.href).description_override ?? (item.description ?? ''),
    })
  }

  function saveEdit(item: Child) {
    const href = item.href
    // 코드 기본값과 같으면 오버라이드 해제(null)로 저장
    const label = form.label.trim() === item.label ? '' : form.label
    const description = form.description.trim() === (item.description ?? '') ? '' : form.description
    startTransition(async () => {
      const result = await updateCategoryOverride(href, label, description)
      if ('error' in result) {
        flash('error', result.error ?? 'エラーが発生しました')
      } else {
        patch(href, { label_override: label.trim() || null, description_override: description.trim() || null })
        setEditing(null)
        flash('success', '保存しました')
      }
      router.refresh()
    })
  }

  function remove(href: string, label: string) {
    if (!window.confirm(`「${label}」をメニューから削除しますか？（全員に非表示になります。あとで復元できます）`)) return
    patch(href, { deleted: true })
    startTransition(async () => {
      const result = await setCategoryDeleted(href, true)
      if ('error' in result) {
        patch(href, { deleted: false })
        flash('error', result.error ?? 'エラーが発生しました')
      } else {
        flash('success', '削除しました')
      }
      router.refresh()
    })
  }

  function restore(href: string) {
    patch(href, { deleted: false })
    startTransition(async () => {
      const result = await setCategoryDeleted(href, false)
      if ('error' in result) {
        patch(href, { deleted: true })
        flash('error', result.error ?? 'エラーが発生しました')
      } else {
        flash('success', '復元しました')
      }
      router.refresh()
    })
  }

  const renderRow = (item: Child) => {
    const active = isActive(item.href)
    const deleted = isDeleted(item.href)
    const label = ov(item.href).label_override ?? item.label
    const description = ov(item.href).description_override ?? item.description
    const edited = ov(item.href).label_override !== null || ov(item.href).description_override !== null

    if (editing === item.href) {
      return (
        <div key={item.href} className="space-y-2 py-3">
          <input
            type="text" value={form.label} onChange={e => setForm(f => ({ ...f, label: e.target.value }))}
            placeholder="表示名" aria-label="表示名"
            className="w-full rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm text-gray-900 dark:border-white/10 dark:bg-white/5 dark:text-white"
          />
          <input
            type="text" value={form.description} onChange={e => setForm(f => ({ ...f, description: e.target.value }))}
            placeholder="説明" aria-label="説明"
            className="w-full rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-sm text-gray-900 dark:border-white/10 dark:bg-white/5 dark:text-white"
          />
          <div className="flex items-center gap-2">
            <span className="text-xs text-gray-400">{item.href}</span>
            <div className="ml-auto flex gap-2">
              <button type="button" onClick={() => saveEdit(item)} disabled={pending}
                className="inline-flex items-center gap-1 rounded-lg bg-indigo-500 px-3 py-1.5 text-xs font-medium text-white hover:bg-indigo-600 disabled:opacity-50">
                <Check className="h-3.5 w-3.5" /> 保存
              </button>
              <button type="button" onClick={() => setEditing(null)} disabled={pending}
                className="inline-flex items-center gap-1 rounded-lg bg-gray-100 px-3 py-1.5 text-xs font-medium text-gray-600 hover:bg-gray-200 dark:bg-white/5 dark:text-gray-300 dark:hover:bg-white/10">
                <X className="h-3.5 w-3.5" /> キャンセル
              </button>
            </div>
          </div>
        </div>
      )
    }

    return (
      <div key={item.href} className="flex items-center justify-between gap-3 py-3">
        <div className="min-w-0">
          <p className={`text-sm font-medium ${deleted ? 'text-gray-400 line-through dark:text-gray-500' : active ? 'text-gray-900 dark:text-white' : 'text-gray-400 line-through dark:text-gray-500'}`}>
            {label}
            {edited && <span className="ml-1.5 rounded bg-amber-500/10 px-1.5 py-0.5 text-[10px] font-normal text-amber-600 dark:text-amber-400">編集済み</span>}
            {deleted && <span className="ml-1.5 rounded bg-red-500/10 px-1.5 py-0.5 text-[10px] font-normal text-red-500">削除済み</span>}
            <span className="ml-1 text-xs font-normal text-gray-400 dark:text-gray-500">{item.href}</span>
          </p>
          {description && <p className="mt-0.5 truncate text-xs text-gray-500 dark:text-gray-400">{description}</p>}
        </div>

        <div className="flex shrink-0 items-center gap-1.5">
          {deleted ? (
            <button type="button" onClick={() => restore(item.href)} disabled={pending} title="復元"
              className="inline-flex items-center gap-1 rounded-lg bg-emerald-500/10 px-2.5 py-1.5 text-xs font-medium text-emerald-600 hover:bg-emerald-500/20 disabled:opacity-50 dark:text-emerald-400">
              <RotateCcw className="h-3.5 w-3.5" /> 復元
            </button>
          ) : (
            <>
              <button type="button" onClick={() => startEdit(item)} disabled={pending} title="表示名・説明を編集"
                className="rounded-lg p-1.5 text-gray-500 hover:bg-gray-100 hover:text-gray-700 disabled:opacity-50 dark:hover:bg-white/5 dark:hover:text-gray-300">
                <Pencil className="h-4 w-4" />
              </button>
              <button
                type="button" role="switch" aria-checked={active} onClick={() => toggle(item.href)} disabled={pending}
                title={active ? '有効（クリックで無効化）' : '無効（クリックで有効化）'}
                className={`relative inline-flex h-6 w-11 shrink-0 items-center rounded-full transition-colors disabled:opacity-50 ${active ? 'bg-emerald-500' : 'bg-gray-300 dark:bg-gray-600'}`}
              >
                <span className={`inline-block h-4 w-4 transform rounded-full bg-white shadow transition-transform ${active ? 'translate-x-6' : 'translate-x-1'}`} />
              </button>
              <button type="button" onClick={() => remove(item.href, label)} disabled={pending} title="削除（全員に非表示）"
                className="rounded-lg p-1.5 text-gray-400 hover:bg-red-500/10 hover:text-red-500 disabled:opacity-50">
                <Trash2 className="h-4 w-4" />
              </button>
            </>
          )}
        </div>
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
