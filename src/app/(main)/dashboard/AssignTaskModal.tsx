'use client'

import { useEffect, useMemo, useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { createLearningAssignment } from '@/app/actions/learning-assignments'
import { ASSIGNMENT_CATEGORIES, JLPT_LEVELS, DEV_LEVELS } from '@/lib/assignment-categories'

export interface AssignableMentee {
  id: string
  full_name: string | null
  email: string
}

interface Props {
  open: boolean
  onClose: () => void
  mentees: AssignableMentee[]
  /** 모달이 열릴 때 미리 선택된 멘티 ID들 (개별 할당용) */
  initialMenteeIds?: string[]
}

function openPicker(e: React.SyntheticEvent<HTMLInputElement>) {
  const input = e.currentTarget
  if (typeof input.showPicker === 'function') {
    try {
      input.showPicker()
    } catch {
      // showPicker는 사용자 제스처가 필요하므로 일부 케이스에서 실패할 수 있음
    }
  }
}

const CATEGORY_OPTIONS = Object.entries(ASSIGNMENT_CATEGORIES).map(([value, cfg]) => ({
  value,
  label: cfg.label,
}))

function displayName(m: AssignableMentee): string {
  if (!m.full_name) return m.email
  // 「姓 名 (セイ メイ)」形式から漢字部分のみ抽出
  return m.full_name.replace(/\s*\([^()]*\)\s*$/, '').trim()
}

export default function AssignTaskModal({ open, onClose, mentees, initialMenteeIds }: Props) {
  const router = useRouter()
  const [selectedMentees, setSelectedMentees] = useState<Set<string>>(new Set())
  const [category, setCategory] = useState<string>('seikatsu')
  const [subcategory, setSubcategory] = useState<string>('')
  const [contentLevel, setContentLevel] = useState<string>('')
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [dueDate, setDueDate] = useState('')
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  // 모달이 열릴 때 초기 멘티 선택 반영
  useEffect(() => {
    if (open) {
      setSelectedMentees(new Set(initialMenteeIds ?? []))
    }
  }, [open, initialMenteeIds])

  const catCfg = ASSIGNMENT_CATEGORIES[category]
  const isLevelOnly = catCfg?.levelOnly === true
  const subcatCfg = !isLevelOnly && subcategory ? catCfg?.subcategories[subcategory] : null
  const subcategoryOptions = useMemo(() => {
    if (!catCfg || isLevelOnly) return []
    return Object.entries(catCfg.subcategories).map(([value, cfg]) => ({ value, label: cfg.label }))
  }, [catCfg, isLevelOnly])

  function toggleMentee(id: string) {
    setSelectedMentees(prev => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }

  function toggleAll() {
    if (selectedMentees.size === mentees.length) setSelectedMentees(new Set())
    else setSelectedMentees(new Set(mentees.map(m => m.id)))
  }

  function reset() {
    setSelectedMentees(new Set())
    setCategory('seikatsu')
    setSubcategory('')
    setContentLevel('')
    setTitle('')
    setDescription('')
    setDueDate('')
    setMessage(null)
  }

  function handleClose() {
    reset()
    onClose()
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (selectedMentees.size === 0) {
      setMessage({ type: 'error', text: 'メンティーを1名以上選択してください' })
      return
    }
    if (!title.trim()) {
      setMessage({ type: 'error', text: 'タイトルを入力してください' })
      return
    }
    if (isLevelOnly && !contentLevel) {
      setMessage({ type: 'error', text: 'レベルを選択してください' })
      return
    }
    if (!isLevelOnly && !subcategory) {
      setMessage({ type: 'error', text: 'サブカテゴリを選択してください' })
      return
    }
    if (subcatCfg?.hasLevel && !contentLevel) {
      setMessage({ type: 'error', text: 'レベルを選択してください' })
      return
    }

    startTransition(async () => {
      const fd = new FormData()
      for (const id of selectedMentees) fd.append('assigned_to', id)
      fd.set('category', category)
      fd.set('subcategory', isLevelOnly ? 'all' : subcategory)
      if (contentLevel) fd.set('content_level', contentLevel)
      fd.set('title', title.trim())
      if (description.trim()) fd.set('description', description.trim())
      if (dueDate) fd.set('due_date', dueDate)

      const result = await createLearningAssignment(fd)
      if ('error' in result && result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '課題を配信しました' })
        router.refresh()
        setTimeout(() => {
          handleClose()
        }, 1200)
      }
    })
  }

  if (!open) return null

  const showLevelSelector = isLevelOnly || subcatCfg?.hasLevel === true
  const levelOptions = category === 'dev'
    ? DEV_LEVELS.map(l => ({ value: l.value, label: l.label }))
    : JLPT_LEVELS.map(l => ({ value: l, label: l }))

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm" onClick={handleClose}>
      <div
        className="mx-4 w-full max-w-2xl rounded-2xl border border-gray-200/60 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center justify-between">
          <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">課題を割り当てる</h3>
          <button
            onClick={handleClose}
            className="rounded-lg p-1.5 text-zinc-400 hover:bg-zinc-100 dark:hover:bg-white/5"
            aria-label="閉じる"
          >
            ×
          </button>
        </div>

        <form onSubmit={handleSubmit} className="mt-4 space-y-4">
          <div>
            <div className="flex items-center justify-between">
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">対象メンティー <span className="text-red-400">*</span></label>
              <button
                type="button"
                onClick={toggleAll}
                className="text-xs text-indigo-500 hover:text-indigo-400"
              >
                {selectedMentees.size === mentees.length ? '全解除' : '全選択'}
              </button>
            </div>
            <div className="mt-1 max-h-32 overflow-y-auto rounded-xl border border-gray-200 bg-white p-2 dark:border-white/[0.08] dark:bg-white/5">
              {mentees.length === 0 ? (
                <p className="text-xs text-zinc-400">担当メンティーがいません</p>
              ) : (
                <div className="grid grid-cols-2 gap-1">
                  {mentees.map(m => (
                    <label
                      key={m.id}
                      className="flex cursor-pointer items-center gap-2 rounded-lg px-2 py-1 text-sm text-zinc-800 hover:bg-indigo-50 dark:text-zinc-200 dark:hover:bg-white/5"
                    >
                      <input
                        type="checkbox"
                        checked={selectedMentees.has(m.id)}
                        onChange={() => toggleMentee(m.id)}
                        className="rounded border-gray-300 text-indigo-600 focus:ring-indigo-500"
                      />
                      <span className="truncate">{displayName(m)}</span>
                    </label>
                  ))}
                </div>
              )}
            </div>
            <p className="mt-1 text-xs text-zinc-500 dark:text-zinc-400">{selectedMentees.size}名 選択中</p>
          </div>

          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">カテゴリ <span className="text-red-400">*</span></label>
              <select
                value={category}
                onChange={e => {
                  setCategory(e.target.value)
                  setSubcategory('')
                  setContentLevel('')
                }}
                className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
              >
                {CATEGORY_OPTIONS.map(o => (
                  <option key={o.value} value={o.value}>{o.label}</option>
                ))}
              </select>
            </div>

            {!isLevelOnly && (
              <div>
                <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">サブカテゴリ <span className="text-red-400">*</span></label>
                <select
                  value={subcategory}
                  onChange={e => {
                    setSubcategory(e.target.value)
                    setContentLevel('')
                  }}
                  className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
                >
                  <option value="">選択</option>
                  {subcategoryOptions.map(o => (
                    <option key={o.value} value={o.value}>{o.label}</option>
                  ))}
                </select>
              </div>
            )}

            {showLevelSelector && (
              <div>
                <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">レベル <span className="text-red-400">*</span></label>
                <select
                  value={contentLevel}
                  onChange={e => setContentLevel(e.target.value)}
                  className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
                >
                  <option value="">選択</option>
                  {levelOptions.map(l => (
                    <option key={l.value} value={l.value}>{l.label}</option>
                  ))}
                </select>
              </div>
            )}

            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">期限</label>
              <input
                type="date"
                value={dueDate}
                onChange={e => setDueDate(e.target.value)}
                onFocus={openPicker}
                onClick={openPicker}
                className="mt-1 w-full cursor-pointer rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">タイトル <span className="text-red-400">*</span></label>
            <input
              type="text"
              value={title}
              onChange={e => setTitle(e.target.value)}
              placeholder="例: N4 文法 重要パターン"
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">説明</label>
            <textarea
              value={description}
              onChange={e => setDescription(e.target.value)}
              rows={3}
              placeholder="任意"
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>

          {message && (
            <div className={`rounded-xl px-3 py-2 text-sm ${
              message.type === 'success'
                ? 'bg-emerald-500/10 text-emerald-500 ring-1 ring-emerald-500/20'
                : 'bg-red-500/10 text-red-500 ring-1 ring-red-500/20'
            }`}>
              {message.text}
            </div>
          )}

          <div className="flex justify-end gap-2 border-t border-gray-200 pt-4 dark:border-white/[0.08]">
            <button
              type="button"
              onClick={handleClose}
              disabled={pending}
              className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5"
            >
              キャンセル
            </button>
            <button
              type="submit"
              disabled={pending}
              className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50"
            >
              {pending ? '配信中...' : '配信'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
