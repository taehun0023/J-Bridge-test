'use client'

import { useState, useEffect, useTransition } from 'react'
import Card from '@/components/ui/Card'
import { getPersonalVocab, updatePersonalVocab, deletePersonalVocab } from '@/app/actions/personal-vocab'
import { Pencil, Trash2, X, Check } from 'lucide-react'

interface VocabItem {
  id: string
  term: string
  meaning: string | null
  memo: string | null
  source_url: string | null
  created_at: string
}

export default function PersonalVocabClient() {
  const [items, setItems] = useState<VocabItem[]>([])
  const [search, setSearch] = useState('')
  const [editId, setEditId] = useState<string | null>(null)
  const [editTerm, setEditTerm] = useState('')
  const [editMeaning, setEditMeaning] = useState('')
  const [editMemo, setEditMemo] = useState('')
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [pending, startTransition] = useTransition()

  function loadItems(searchVal?: string) {
    startTransition(async () => {
      const result = await getPersonalVocab(searchVal || undefined)
      setItems(result.items as VocabItem[])
    })
  }

  useEffect(() => {
    loadItems()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  function startEdit(item: VocabItem) {
    setEditId(item.id)
    setEditTerm(item.term)
    setEditMeaning(item.meaning ?? '')
    setEditMemo(item.memo ?? '')
  }

  function cancelEdit() {
    setEditId(null)
  }

  function handleSaveEdit(id: string) {
    startTransition(async () => {
      const result = await updatePersonalVocab(id, {
        term: editTerm,
        meaning: editMeaning || null,
        memo: editMemo || null,
      })
      if ('error' in result && result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '更新しました' })
        setEditId(null)
      }
      loadItems(search || undefined)
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleDelete(id: string) {
    startTransition(async () => {
      const result = await deletePersonalVocab(id)
      if ('error' in result && result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '削除しました' })
      }
      loadItems(search || undefined)
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleSearch() {
    loadItems(search || undefined)
  }

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">個人単語帳</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">自分だけの単語帳。テキストを選択して右クリックで追加できます。</p>
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

      <Card>
        <div className="mb-4 flex items-center gap-3">
          <input
            type="text"
            placeholder="検索..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            onKeyDown={e => e.key === 'Enter' && handleSearch()}
            className="w-full max-w-xs rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100 dark:placeholder-zinc-500"
          />
          <button
            onClick={handleSearch}
            disabled={pending}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            検索
          </button>
          <span className="ml-auto text-sm text-zinc-400">全 {items.length}件</span>
        </div>

        {items.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">
            {search ? '検索結果がありません' : 'まだ単語が登録されていません。テキストを選択して右クリックで追加できます。'}
          </div>
        ) : (
          <div className="divide-y divide-gray-100 dark:divide-gray-700">
            {items.map((item, idx) => (
              <div key={item.id} className="py-3">
                {editId === item.id ? (
                  <div className="space-y-2">
                    <input
                      type="text"
                      value={editTerm}
                      onChange={e => setEditTerm(e.target.value)}
                      className="w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                      placeholder="単語"
                    />
                    <input
                      type="text"
                      value={editMeaning}
                      onChange={e => setEditMeaning(e.target.value)}
                      className="w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                      placeholder="意味"
                    />
                    <input
                      type="text"
                      value={editMemo}
                      onChange={e => setEditMemo(e.target.value)}
                      className="w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                      placeholder="メモ"
                    />
                    <div className="flex gap-2">
                      <button
                        onClick={() => handleSaveEdit(item.id)}
                        disabled={pending}
                        className="inline-flex items-center gap-1 rounded-lg bg-emerald-600 px-3 py-1.5 text-xs text-white hover:bg-emerald-500 disabled:opacity-50"
                      >
                        <Check className="h-3.5 w-3.5" /> 保存
                      </button>
                      <button
                        onClick={cancelEdit}
                        className="inline-flex items-center gap-1 rounded-lg bg-gray-200 px-3 py-1.5 text-xs text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200"
                      >
                        <X className="h-3.5 w-3.5" /> キャンセル
                      </button>
                    </div>
                  </div>
                ) : (
                  <div className="flex items-start gap-3">
                    <span className="mt-0.5 w-8 shrink-0 text-center text-xs text-gray-400">{idx + 1}</span>
                    <div className="min-w-0 flex-1">
                      <span className="font-semibold text-gray-900 dark:text-white">{item.term}</span>
                      {item.meaning && (
                        <span className="ml-2 text-sm text-gray-600 dark:text-gray-300">| {item.meaning}</span>
                      )}
                      {item.memo && (
                        <span className="ml-2 text-xs text-gray-400">| {item.memo}</span>
                      )}
                    </div>
                    <div className="flex shrink-0 items-center gap-1">
                      <button
                        onClick={() => startEdit(item)}
                        className="rounded-lg p-1.5 text-gray-400 hover:bg-gray-100 hover:text-gray-600 dark:hover:bg-gray-700 dark:hover:text-gray-300"
                        title="編集"
                      >
                        <Pencil className="h-4 w-4" />
                      </button>
                      <button
                        onClick={() => handleDelete(item.id)}
                        disabled={pending}
                        className="rounded-lg p-1.5 text-gray-400 hover:bg-red-50 hover:text-red-500 disabled:opacity-50 dark:hover:bg-red-900/20"
                        title="削除"
                      >
                        <Trash2 className="h-4 w-4" />
                      </button>
                    </div>
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </Card>
    </div>
  )
}
