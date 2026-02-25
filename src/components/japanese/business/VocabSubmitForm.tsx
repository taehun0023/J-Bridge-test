'use client'

import { useState, useTransition, useCallback } from 'react'
import Card from '@/components/ui/Card'
import { submitVocab, checkDuplicate } from '@/app/actions/shared-vocab'

interface Props {
  onSubmitted: () => void
  role: 'admin' | 'mentor' | 'mentee'
}

export default function VocabSubmitForm({ onSubmitted, role }: Props) {
  const [termJa, setTermJa] = useState('')
  const [termReading, setTermReading] = useState('')
  const [termKo, setTermKo] = useState('')
  const [exampleSentence, setExampleSentence] = useState('')
  const [category, setCategory] = useState('general')
  const [dupStatus, setDupStatus] = useState<'ok' | 'dup' | 'checking' | null>(null)
  const [dupInfo, setDupInfo] = useState<string>('')
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [pending, startTransition] = useTransition()

  const debounceRef = { timer: null as ReturnType<typeof setTimeout> | null }

  const handleTermChange = useCallback((value: string) => {
    setTermJa(value)
    setDupStatus(null)

    if (debounceRef.timer) clearTimeout(debounceRef.timer)

    if (!value.trim()) {
      setDupStatus(null)
      return
    }

    debounceRef.timer = setTimeout(async () => {
      setDupStatus('checking')
      const result = await checkDuplicate(value)
      if ('error' in result && result.error) {
        setDupStatus(null)
        return
      }
      if (result.duplicates && result.duplicates.length > 0) {
        setDupStatus('dup')
        setDupInfo(result.duplicates[0].term_ja)
      } else {
        setDupStatus('ok')
      }
    }, 300)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  function handleSubmit() {
    if (!termJa.trim()) return
    if (dupStatus === 'dup') return

    startTransition(async () => {
      const fd = new FormData()
      fd.set('term_ja', termJa)
      fd.set('term_reading', termReading)
      fd.set('term_ko', termKo)
      fd.set('example_sentence', exampleSentence)
      fd.set('category', category)

      const result = await submitVocab(fd)
      if ('error' in result && result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        const successText = role === 'mentee'
          ? '提出しました。承認後に公開されます。'
          : '追加しました'
        setMessage({ type: 'success', text: successText })
        setTermJa('')
        setTermReading('')
        setTermKo('')
        setExampleSentence('')
        setCategory('general')
        setDupStatus(null)
        onSubmitted()
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  return (
    <Card>
      <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">単語登録</h2>

      {message && (
        <div className={`mb-4 rounded-xl px-4 py-3 text-sm ${
          message.type === 'success'
            ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
            : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
        }`}>
          {message.text}
        </div>
      )}

      <div className="grid gap-4 sm:grid-cols-2">
        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">単語/文章 *</label>
          <input
            type="text"
            value={termJa}
            onChange={e => handleTermChange(e.target.value)}
            placeholder="例: 要件定義"
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
          {dupStatus === 'checking' && (
            <p className="mt-1 text-xs text-zinc-400">確認中...</p>
          )}
          {dupStatus === 'ok' && (
            <p className="mt-1 text-xs text-emerald-500">登録可能です</p>
          )}
          {dupStatus === 'dup' && (
            <p className="mt-1 text-xs text-red-500">既に登録されています: {dupInfo}</p>
          )}
        </div>
        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">読み</label>
          <input
            type="text"
            value={termReading}
            onChange={e => setTermReading(e.target.value)}
            placeholder="例: ようけんていぎ"
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">意味 (韓国語)</label>
          <input
            type="text"
            value={termKo}
            onChange={e => setTermKo(e.target.value)}
            placeholder="例: 요건정의"
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">カテゴリ</label>
          <select
            value={category}
            onChange={e => setCategory(e.target.value)}
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
          >
            <option value="general">一般</option>
            <option value="business">ビジネス</option>
            <option value="it">IT</option>
          </select>
        </div>
        <div className="sm:col-span-2">
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">例文</label>
          <input
            type="text"
            value={exampleSentence}
            onChange={e => setExampleSentence(e.target.value)}
            placeholder="例: 要件定義書を作成する"
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>
      </div>

      <div className="mt-4 flex justify-end">
        <button
          onClick={handleSubmit}
          disabled={pending || !termJa.trim() || dupStatus === 'dup'}
          className="rounded-xl bg-indigo-600 px-6 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
        >
          {pending ? '提出中...' : '提出する'}
        </button>
      </div>
    </Card>
  )
}
