'use client'

import { useState, useCallback, useTransition } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import Link from 'next/link'
import { Lock, Plus, X } from 'lucide-react'
import TabBar from '@/components/ui/TabBar'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import { toggleMastery } from '@/app/actions/mastery'
import { addWritingItem, updateWritingItem, deleteWritingItem } from '@/app/actions/writing'
import type { WritingItem, WritingExerciseRecord } from '@/app/actions/writing'

const CATEGORY_TABS = [
  { key: '', label: '全て' },
  { key: 'sentence_pattern', label: '文型' },
  { key: 'expression', label: '表現' },
  { key: 'keigo', label: '敬語' },
  { key: 'writing', label: 'ユーザー定義' },
]

const MASTERY_FILTERS = [
  { key: '', label: '全て' },
  { key: 'mastered', label: '暗記済み' },
  { key: 'unmastered', label: '未暗記' },
]

const CATEGORY_BADGES: Record<string, { label: string; color: string }> = {
  expression: { label: '表現', color: 'bg-blue-100 text-blue-700 dark:bg-blue-900/40 dark:text-blue-300' },
  sentence_pattern: { label: '文型', color: 'bg-green-100 text-green-700 dark:bg-green-900/40 dark:text-green-300' },
  keigo: { label: '敬語', color: 'bg-purple-100 text-purple-700 dark:bg-purple-900/40 dark:text-purple-300' },
  writing: { label: 'ユーザー定義', color: 'bg-amber-100 text-amber-700 dark:bg-amber-900/40 dark:text-amber-300' },
}

interface Props {
  items: WritingItem[]
  exerciseMap: Record<string, WritingExerciseRecord>
  modelAnswerMap: Record<string, string>
  activeCategory: string
  activeStatus: string
  activeMastery: string
  search: string
  currentPage: number
  totalPages: number
  totalCount: number
  masteredIds: string[]
  progress: number
  masteredCount: number
  totalItemCount: number
  unlocked: boolean
  canManage: boolean
}

export default function WritingListClient({
  items, exerciseMap, modelAnswerMap, activeCategory, activeStatus, activeMastery, search, currentPage, totalPages, totalCount, masteredIds, progress, masteredCount, totalItemCount, unlocked, canManage,
}: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [searchInput, setSearchInput] = useState(search)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))
  const [isPending, startTransition] = useTransition()
  const [showAddForm, setShowAddForm] = useState(false)
  const [addPending, startAddTransition] = useTransition()
  const [addMessage, setAddMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [addForm, setAddForm] = useState({
    example_sentence_ko: '',
    example_sentence: '',
    description: '',
  })
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editForm, setEditForm] = useState({ example_sentence_ko: '', example_sentence: '', description: '' })

  function updateParams(updates: Record<string, string>) {
    const params = new URLSearchParams(searchParams.toString())
    Object.entries(updates).forEach(([k, v]) => {
      if (v) params.set(k, v)
      else params.delete(k)
    })
    if (!('page' in updates)) params.delete('page')
    router.push(`/japanese/business/writing?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  function handleAdd() {
    startAddTransition(async () => {
      const result = await addWritingItem({
        example_sentence_ko: addForm.example_sentence_ko,
        example_sentence: addForm.example_sentence,
        description: addForm.description || null,
      })
      if ('error' in result && result.error) {
        setAddMessage({ type: 'error', text: result.error })
      } else {
        setAddMessage({ type: 'success', text: '追加しました' })
        setShowAddForm(false)
        setAddForm({ example_sentence_ko: '', example_sentence: '', description: '' })
        router.refresh()
      }
      setTimeout(() => setAddMessage(null), 3000)
    })
  }

  function handleSaveEdit(itemId: string) {
    startAddTransition(async () => {
      const result = await updateWritingItem(itemId, {
        example_sentence_ko: editForm.example_sentence_ko,
        example_sentence: editForm.example_sentence,
        description: editForm.description || null,
      })
      if ('error' in result && result.error) {
        setAddMessage({ type: 'error', text: result.error })
      } else {
        setAddMessage({ type: 'success', text: '更新しました' })
        setEditingId(null)
        router.refresh()
      }
      setTimeout(() => setAddMessage(null), 3000)
    })
  }

  function handleDelete(itemId: string) {
    if (!confirm('この問題を削除しますか？')) return
    startAddTransition(async () => {
      const result = await deleteWritingItem(itemId)
      if ('error' in result && result.error) {
        setAddMessage({ type: 'error', text: result.error })
      } else {
        setAddMessage({ type: 'success', text: '削除しました' })
        router.refresh()
      }
      setTimeout(() => setAddMessage(null), 3000)
    })
  }

  const handleToggleMastery = useCallback((e: React.MouseEvent, itemId: string) => {
    e.stopPropagation()
    const next = new Set(localMastered)
    if (next.has(itemId)) {
      next.delete(itemId)
    } else {
      next.add(itemId)
    }
    setLocalMastered(next)
    startTransition(async () => {
      await toggleMastery('it_glossary', itemId)
    })
  }, [localMastered])

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">作文 (Beta)</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">
          韓国語の意味を見て日本語で書く練習をします
        </p>
      </div>

      <div className="mb-6 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {masteredCount}/{totalItemCount} 習得
        </span>
      </div>

      <div className="mb-6 flex flex-wrap gap-2">
        {unlocked ? (
          <Link
            href="/japanese/business/writing/test"
            className="inline-flex items-center rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-indigo-500"
          >
            理解度テスト
          </Link>
        ) : (
          <span className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-4 py-2 text-sm text-gray-400 dark:border-gray-700 dark:text-gray-500">
            <Lock className="h-4 w-4" />
            進行率70%以上で解放
          </span>
        )}
      </div>

      <div className="mb-6">
        <div className="flex items-center gap-3">
          <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
            <div
              className={`h-2 rounded-full transition-all duration-500 ${
                progress >= 70 ? 'bg-indigo-500' : 'bg-gray-400 dark:bg-gray-500'
              }`}
              style={{ width: `${progress}%` }}
            />
          </div>
          <span className="text-sm text-gray-600 dark:text-gray-400">{progress}%</span>
        </div>
      </div>

      <TabBar
        tabs={CATEGORY_TABS}
        activeKey={activeCategory}
        onChange={(key) => updateParams({ category: key, search: '', mastery: '', status: '' })}
      />

      <div className="mt-4 flex flex-wrap items-center gap-3">
        <form onSubmit={handleSearch} className="flex gap-2">
          <input
            type="text"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            placeholder="韓国語の意味で検索..."
            className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
          />
          <button
            type="submit"
            className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600"
          >
            検索
          </button>
        </form>

        {/* Mastery filter */}
        <div className="flex rounded-lg border border-gray-200 dark:border-gray-600">
          {MASTERY_FILTERS.map((f) => (
            <button
              key={f.key}
              onClick={() => updateParams({ mastery: f.key })}
              className={`px-3 py-1.5 text-xs font-medium transition-colors first:rounded-l-lg last:rounded-r-lg ${
                activeMastery === f.key
                  ? 'bg-blue-600 text-white'
                  : 'text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'
              }`}
            >
              {f.label}
            </button>
          ))}
        </div>

        {/* Status dropdown */}
        <select
          value={activeStatus}
          onChange={(e) => updateParams({ status: e.target.value })}
          className="rounded-lg border border-gray-300 bg-white px-3 py-1.5 text-xs text-gray-700 dark:border-gray-600 dark:bg-gray-700 dark:text-gray-300 focus:border-blue-500 focus:outline-none"
        >
          <option value="">回答状況: 全て</option>
          <option value="unanswered">未回答</option>
          <option value="answered">回答済み</option>
        </select>

        <div className="ml-auto flex items-center gap-3">
          <span className="text-sm text-gray-500 dark:text-gray-400">{totalCount}件</span>
          {canManage && (
            <button
              onClick={() => setShowAddForm(true)}
              className="inline-flex items-center gap-1 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
            >
              <Plus className="h-4 w-4" />
              追加
            </button>
          )}
        </div>
      </div>

      {addMessage && (
        <div className={`mt-3 rounded-lg px-4 py-3 text-sm ${
          addMessage.type === 'success'
            ? 'bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20'
            : 'bg-red-500/10 text-red-600 dark:text-red-400 ring-1 ring-red-500/20'
        }`}>
          {addMessage.text}
        </div>
      )}

      {showAddForm && canManage && (
        <div className="mt-3 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-700 dark:bg-gray-800">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900 dark:text-white">作文問題を追加</h3>
            <button onClick={() => setShowAddForm(false)} className="text-gray-400 hover:text-gray-600 dark:hover:text-gray-200">
              <X className="h-5 w-5" />
            </button>
          </div>
          <div className="grid gap-3 sm:grid-cols-2">
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">韓国語の意味（問題文） *</label>
              <textarea value={addForm.example_sentence_ko} onChange={e => setAddForm({ ...addForm, example_sentence_ko: e.target.value })} rows={2}
                placeholder="예: 바쁘신 와중에 죄송합니다만, 이 자료를 확인해 주실 수 있으시겠습니까."
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">模範答案（日本語） *</label>
              <textarea value={addForm.example_sentence} onChange={e => setAddForm({ ...addForm, example_sentence: e.target.value })} rows={2}
                placeholder="예: お忙しいところ恐れ入りますが、こちらの資料をご確認いただけますでしょうか。"
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">状況説明</label>
              <input type="text" value={addForm.description} onChange={e => setAddForm({ ...addForm, description: e.target.value })}
                placeholder="どんな場面で使うか"
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
          </div>
          <div className="mt-4 flex justify-end gap-2">
            <button onClick={() => setShowAddForm(false)}
              className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700 transition-colors">
              キャンセル
            </button>
            <button onClick={handleAdd} disabled={addPending || !addForm.example_sentence_ko || !addForm.example_sentence}
              className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors">
              {addPending ? '保存中...' : '追加'}
            </button>
          </div>
        </div>
      )}

      {items.length === 0 ? (
        <div className="mt-6">
          <EmptyState title="データがありません" description="条件に該当する項目はありません" icon="📝" />
        </div>
      ) : (
        <div className="mt-4 space-y-3">
          {items.map(item => {
            const badge = CATEGORY_BADGES[item.category]
            const exercise = exerciseMap[item.id]
            const isMastered = localMastered.has(item.id)

            return (
              <div
                key={item.id}
                className="rounded-xl border border-gray-200 p-4 dark:border-gray-700"
              >
                <div className="flex items-start gap-3">
                  {/* Mastery check */}
                  <button
                    onClick={(e) => handleToggleMastery(e, item.id)}
                    className={`mt-0.5 shrink-0 ${isPending ? 'opacity-50' : ''}`}
                    title={isMastered ? '習得済み' : '未習得'}
                  >
                    {isMastered ? (
                      <svg className="h-5 w-5 text-green-500" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                      </svg>
                    ) : (
                      <svg className="h-5 w-5 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                        <path strokeLinecap="round" strokeLinejoin="round" d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                      </svg>
                    )}
                  </button>

                  <div className="flex-1">
                    {badge && (
                      <span className={`inline-flex rounded-md px-2 py-0.5 text-xs font-medium ${badge.color}`}>
                        {badge.label}
                      </span>
                    )}
                    <p className="mt-1 font-medium text-gray-900 dark:text-white">
                      {item.example_sentence_ko ?? item.term_ko}
                    </p>
                    <p className="mt-1 text-sm text-emerald-700 dark:text-emerald-400">
                      <span className="text-xs font-medium">模範答案: </span>
                      {modelAnswerMap[item.example_sentence_ko ?? item.term_ko] ?? item.example_sentence}
                    </p>
                    {item.description && (
                      <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                        <span className="font-medium">状況: </span>{item.description}
                      </p>
                    )}

                    {/* Edit/Delete for user-defined items */}
                    {item.category === 'writing' && canManage && editingId !== item.id && (
                      <div className="mt-2 flex gap-2">
                        <button
                          onClick={() => {
                            setEditingId(item.id)
                            setEditForm({
                              example_sentence_ko: item.example_sentence_ko ?? item.term_ko,
                              example_sentence: item.example_sentence,
                              description: item.description ?? '',
                            })
                          }}
                          className="text-xs text-indigo-600 hover:text-indigo-500 dark:text-indigo-400"
                        >
                          編集
                        </button>
                        <button
                          onClick={() => handleDelete(item.id)}
                          className="text-xs text-red-600 hover:text-red-500 dark:text-red-400"
                        >
                          削除
                        </button>
                      </div>
                    )}

                    {/* Inline edit form */}
                    {editingId === item.id && (
                      <div className="mt-2 space-y-2 rounded-lg border border-indigo-200 p-3 dark:border-indigo-800">
                        <div>
                          <label className="text-xs font-medium text-gray-600 dark:text-gray-400">韓国語の意味</label>
                          <textarea value={editForm.example_sentence_ko} onChange={e => setEditForm({ ...editForm, example_sentence_ko: e.target.value })} rows={2}
                            className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-2 py-1 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
                        </div>
                        <div>
                          <label className="text-xs font-medium text-gray-600 dark:text-gray-400">模範答案（日本語）</label>
                          <textarea value={editForm.example_sentence} onChange={e => setEditForm({ ...editForm, example_sentence: e.target.value })} rows={2}
                            className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-2 py-1 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
                        </div>
                        <div>
                          <label className="text-xs font-medium text-gray-600 dark:text-gray-400">状況説明</label>
                          <input type="text" value={editForm.description} onChange={e => setEditForm({ ...editForm, description: e.target.value })}
                            className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-2 py-1 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
                        </div>
                        <div className="flex gap-2">
                          <button onClick={() => handleSaveEdit(item.id)} disabled={addPending}
                            className="rounded-lg bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-500 disabled:opacity-50">
                            保存
                          </button>
                          <button onClick={() => setEditingId(null)}
                            className="rounded-lg border border-gray-300 px-3 py-1 text-xs text-gray-600 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-400">
                            キャンセル
                          </button>
                        </div>
                      </div>
                    )}

                    {exercise ? (
                      <div className="mt-3 rounded-lg bg-gray-50 p-3 dark:bg-gray-800/50">
                        <div className="flex items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                          <span className={`font-bold ${
                            exercise.auto_score >= 70 ? 'text-emerald-600 dark:text-emerald-400' :
                            exercise.auto_score >= 40 ? 'text-amber-600 dark:text-amber-400' :
                            'text-red-600 dark:text-red-400'
                          }`}>
                            {exercise.auto_score}点
                          </span>
                          <span>{new Date(exercise.created_at).toLocaleDateString('ja-JP')}</span>
                        </div>
                        <p className="mt-1 text-sm text-gray-700 dark:text-gray-300">{exercise.user_answer}</p>
                        {exercise.memo && (
                          <p className="mt-1 text-xs text-gray-500 dark:text-gray-400 italic">{exercise.memo}</p>
                        )}
                      </div>
                    ) : (
                      <p className="mt-3 text-xs text-gray-400 dark:text-gray-500">未回答</p>
                    )}
                  </div>
                </div>
              </div>
            )
          })}
        </div>
      )}

      {totalPages > 1 && (
        <div className="mt-6">
          <Pagination
            currentPage={currentPage}
            totalPages={totalPages}
            onPageChange={(p) => updateParams({ page: String(p) })}
          />
        </div>
      )}
    </div>
  )
}
