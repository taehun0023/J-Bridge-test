'use client'

import { Fragment, useState, useEffect, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import TtsButton from './TtsButton'
import { toggleMastery } from '@/app/actions/mastery'
import { updateGlossaryItem, deleteGlossaryItem } from '@/app/actions/admin/glossary'
import { Pencil, Trash2, X, Check } from 'lucide-react'

interface GlossaryItem {
  id: string
  term_ja: string
  reading: string | null
  term_ko: string
  term_en: string | null
  category: string
  description: string | null
  example_sentence: string | null
}

interface EditFormState {
  term_ja: string
  reading: string
  term_ko: string
  term_en: string
  description: string
  example_sentence: string
}

interface GlossaryTableProps {
  items: GlossaryItem[]
  offset?: number
  masteredIds?: string[]
  itemType?: 'it_glossary' | 'cs_term'
  canManage?: boolean
}

export default function GlossaryTable({ items, offset = 0, masteredIds = [], itemType = 'it_glossary', canManage }: GlossaryTableProps) {
  const router = useRouter()
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))
  const [isPending, startTransition] = useTransition()
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editForm, setEditForm] = useState<EditFormState>({ term_ja: '', reading: '', term_ko: '', term_en: '', description: '', example_sentence: '' })
  const [editMessage, setEditMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

  function handleToggleMastery(e: React.MouseEvent, itemId: string) {
    e.stopPropagation()
    const next = new Set(localMastered)
    if (next.has(itemId)) {
      next.delete(itemId)
    } else {
      next.add(itemId)
    }
    setLocalMastered(next)

    startTransition(async () => {
      await toggleMastery(itemType, itemId)
    })
  }

  function startEdit(item: GlossaryItem) {
    setEditingId(item.id)
    setEditForm({
      term_ja: item.term_ja,
      reading: item.reading ?? '',
      term_ko: item.term_ko,
      term_en: item.term_en ?? '',
      description: item.description ?? '',
      example_sentence: item.example_sentence ?? '',
    })
  }

  function handleSaveEdit(item: GlossaryItem) {
    startTransition(async () => {
      const result = await updateGlossaryItem(item.id, {
        term_ja: editForm.term_ja,
        reading: editForm.reading || null,
        term_ko: editForm.term_ko,
        term_en: editForm.term_en || null,
        category: item.category,
        subcategory: null,
        description: editForm.description || null,
        example_sentence: editForm.example_sentence || null,
      })
      if ('error' in result && result.error) {
        setEditMessage({ type: 'error', text: result.error })
        setTimeout(() => setEditMessage(null), 3000)
      } else {
        setEditMessage({ type: 'success', text: '保存しました' })
        setTimeout(() => setEditMessage(null), 3000)
        setEditingId(null)
        router.refresh()
      }
    })
  }

  function handleDelete(id: string) {
    if (!confirm('この用語を削除しますか？')) return
    startTransition(async () => {
      const result = await deleteGlossaryItem(id)
      if ('error' in result && result.error) {
        setEditMessage({ type: 'error', text: result.error })
        setTimeout(() => setEditMessage(null), 3000)
      } else {
        setEditMessage({ type: 'success', text: '削除しました' })
        setTimeout(() => setEditMessage(null), 3000)
        setExpandedId(null)
        router.refresh()
      }
    })
  }

  const inputClass = 'w-full rounded-lg border border-gray-300 bg-white px-2 py-1.5 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white'

  return (
    <div className="overflow-x-auto">
      <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
        <thead className="bg-gray-50 dark:bg-gray-700">
          <tr>
            <th className="w-12 px-3 py-3 text-center text-xs font-medium uppercase text-gray-500 dark:text-gray-400">番号</th>
            <th className="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500 dark:text-gray-400">用語</th>
            <th className="w-10 px-4 py-3"></th>
          </tr>
        </thead>
        <tbody className="divide-y divide-gray-100 bg-white dark:divide-gray-700 dark:bg-gray-800">
          {items.map((item, index) => (
            <Fragment key={item.id}>
              <tr className="cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-700" onClick={() => setExpandedId(expandedId === item.id ? null : item.id)}>
                <td className="px-3 py-3 text-center text-xs text-gray-400 dark:text-gray-500">
                  {offset + index + 1}
                </td>
                <td className="max-w-md px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">
                  <div className="flex items-center gap-1.5">
                    <button
                      onClick={(e) => handleToggleMastery(e, item.id)}
                      className={`shrink-0 ${isPending ? 'opacity-50' : ''}`}
                      title={localMastered.has(item.id) ? '習得済み' : '未習得'}
                    >
                      {localMastered.has(item.id) ? (
                        <svg className="h-4 w-4 text-green-500" fill="currentColor" viewBox="0 0 24 24">
                          <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                        </svg>
                      ) : (
                        <svg className="h-4 w-4 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                          <path strokeLinecap="round" strokeLinejoin="round" d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                        </svg>
                      )}
                    </button>
                    <span className="truncate">{item.term_ja}</span>
                    <TtsButton text={item.term_ja} />
                  </div>
                </td>
                <td className="px-4 py-3">
                  <button className="text-gray-400 hover:text-gray-600 dark:text-gray-500 dark:hover:text-gray-300">
                    <svg
                      className={`h-4 w-4 transition-transform ${expandedId === item.id ? 'rotate-180' : ''}`}
                      fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    >
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </button>
                </td>
              </tr>
              {expandedId === item.id && (
                <tr key={`${item.id}-detail`}>
                  <td colSpan={3} className="bg-gray-50 px-4 py-3 dark:bg-gray-700">
                    {editingId === item.id ? (
                      <div>
                        <div className="grid gap-2 text-sm sm:grid-cols-2">
                          <div>
                            <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">用語 *</label>
                            <input type="text" value={editForm.term_ja} onChange={e => setEditForm({ ...editForm, term_ja: e.target.value })} className={inputClass} />
                          </div>
                          <div>
                            <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">読み</label>
                            <input type="text" value={editForm.reading} onChange={e => setEditForm({ ...editForm, reading: e.target.value })} className={inputClass} />
                          </div>
                          <div>
                            <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">韓国語 *</label>
                            <input type="text" value={editForm.term_ko} onChange={e => setEditForm({ ...editForm, term_ko: e.target.value })} className={inputClass} />
                          </div>
                          <div>
                            <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">English</label>
                            <input type="text" value={editForm.term_en} onChange={e => setEditForm({ ...editForm, term_en: e.target.value })} className={inputClass} />
                          </div>
                          <div className="sm:col-span-2">
                            <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">説明</label>
                            <textarea value={editForm.description} onChange={e => setEditForm({ ...editForm, description: e.target.value })} rows={2} className={inputClass} />
                          </div>
                          <div className="sm:col-span-2">
                            <label className="block text-xs font-medium text-gray-500 dark:text-gray-400">例文</label>
                            <textarea value={editForm.example_sentence} onChange={e => setEditForm({ ...editForm, example_sentence: e.target.value })} rows={2} className={inputClass} />
                          </div>
                        </div>
                        <div className="mt-3 flex gap-2">
                          <button
                            onClick={() => handleSaveEdit(item)}
                            disabled={isPending || !editForm.term_ja || !editForm.term_ko}
                            className="inline-flex items-center gap-1 rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white transition-colors hover:bg-indigo-500 disabled:opacity-50"
                          >
                            <Check className="h-3.5 w-3.5" />
                            {isPending ? '保存中...' : '保存'}
                          </button>
                          <button
                            onClick={() => setEditingId(null)}
                            className="inline-flex items-center gap-1 rounded-lg border border-gray-300 px-3 py-1.5 text-xs font-medium text-gray-700 transition-colors hover:bg-gray-100 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-600"
                          >
                            <X className="h-3.5 w-3.5" />
                            キャンセル
                          </button>
                        </div>
                      </div>
                    ) : (
                      <>
                        <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 text-sm">
                          {item.reading && (
                            <>
                              <dt className="font-medium text-gray-500 dark:text-gray-400">読み</dt>
                              <dd className="text-gray-700 dark:text-gray-300">{item.reading}</dd>
                            </>
                          )}
                          <dt className="font-medium text-gray-500 dark:text-gray-400">韓国語</dt>
                          <dd className="text-gray-700 dark:text-gray-300">{item.term_ko}</dd>
                          {item.term_en && (
                            <>
                              <dt className="font-medium text-gray-500 dark:text-gray-400">English</dt>
                              <dd className="text-gray-700 dark:text-gray-300">{item.term_en}</dd>
                            </>
                          )}
                          {item.description && (
                            <>
                              <dt className="font-medium text-gray-500 dark:text-gray-400">説明</dt>
                              <dd className="text-gray-700 dark:text-gray-300">{item.description}</dd>
                            </>
                          )}
                          {item.example_sentence && (
                            <>
                              <dt className="font-medium text-gray-500 dark:text-gray-400">例文</dt>
                              <dd className="text-gray-600 dark:text-gray-400 italic">{item.example_sentence}</dd>
                            </>
                          )}
                        </dl>
                        {canManage && (
                          <div className="mt-3 flex gap-2 border-t border-gray-200 pt-3 dark:border-gray-600">
                            <button
                              onClick={() => startEdit(item)}
                              className="inline-flex items-center gap-1 rounded-lg px-3 py-1.5 text-xs font-medium text-indigo-600 transition-colors hover:bg-indigo-50 dark:text-indigo-400 dark:hover:bg-indigo-500/10"
                            >
                              <Pencil className="h-3.5 w-3.5" />
                              編集
                            </button>
                            <button
                              onClick={() => handleDelete(item.id)}
                              disabled={isPending}
                              className="inline-flex items-center gap-1 rounded-lg px-3 py-1.5 text-xs font-medium text-red-600 transition-colors hover:bg-red-50 dark:text-red-400 dark:hover:bg-red-500/10 disabled:opacity-50"
                            >
                              <Trash2 className="h-3.5 w-3.5" />
                              削除
                            </button>
                          </div>
                        )}
                      </>
                    )}
                    {editMessage && expandedId === item.id && (
                      <div className={`mt-2 rounded-lg px-3 py-2 text-xs ${
                        editMessage.type === 'success'
                          ? 'bg-emerald-500/10 text-emerald-600 dark:text-emerald-400'
                          : 'bg-red-500/10 text-red-600 dark:text-red-400'
                      }`}>
                        {editMessage.text}
                      </div>
                    )}
                  </td>
                </tr>
              )}
            </Fragment>
          ))}
        </tbody>
      </table>
    </div>
  )
}
