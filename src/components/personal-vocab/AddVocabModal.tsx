'use client'

import { useState, useTransition } from 'react'
import { X } from 'lucide-react'
import { addPersonalVocab } from '@/app/actions/personal-vocab'

interface Props {
  initialTerm: string
  sourceUrl: string
  onClose: () => void
}

export default function AddVocabModal({ initialTerm, sourceUrl, onClose }: Props) {
  const [term, setTerm] = useState(initialTerm)
  const [meaning, setMeaning] = useState('')
  const [memo, setMemo] = useState('')
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [pending, startTransition] = useTransition()

  function handleSubmit() {
    if (!term.trim()) return
    startTransition(async () => {
      const result = await addPersonalVocab(term, meaning || null, memo || null, sourceUrl || null)
      if ('error' in result && result.error) {
        setMessage({ type: 'error', text: result.error })
        setTimeout(() => setMessage(null), 3000)
      } else {
        setMessage({ type: 'success', text: '追加しました' })
        setTimeout(() => {
          onClose()
        }, 800)
      }
    })
  }

  return (
    <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50" onClick={onClose}>
      <div
        className="mx-4 w-full max-w-md rounded-2xl border border-gray-200 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900"
        onClick={e => e.stopPropagation()}
      >
        <div className="mb-4 flex items-center justify-between">
          <h3 className="text-lg font-semibold text-gray-900 dark:text-white">個人単語帳に追加</h3>
          <button onClick={onClose} className="rounded-lg p-1 text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700">
            <X className="h-5 w-5" />
          </button>
        </div>

        {message && (
          <div className={`mb-4 rounded-xl px-4 py-3 text-sm ${
            message.type === 'success'
              ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
              : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
          }`}>
            {message.text}
          </div>
        )}

        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">単語/文章 *</label>
            <input
              type="text"
              value={term}
              onChange={e => setTerm(e.target.value)}
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">意味</label>
            <input
              type="text"
              value={meaning}
              onChange={e => setMeaning(e.target.value)}
              placeholder="意味を入力..."
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">メモ</label>
            <input
              type="text"
              value={memo}
              onChange={e => setMemo(e.target.value)}
              placeholder="メモ (任意)"
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
        </div>

        <div className="mt-6 flex justify-end gap-3">
          <button
            onClick={onClose}
            className="rounded-xl px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700"
          >
            キャンセル
          </button>
          <button
            onClick={handleSubmit}
            disabled={pending || !term.trim()}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            {pending ? '追加中...' : '追加する'}
          </button>
        </div>
      </div>
    </div>
  )
}
