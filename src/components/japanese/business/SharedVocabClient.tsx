'use client'

import { useState, useEffect, useTransition, useCallback } from 'react'
import Card from '@/components/ui/Card'
import VocabSubmitForm from './VocabSubmitForm'
import FlashcardMode from '@/components/japanese/FlashcardMode'
import RangeQuizModal from '@/components/japanese/RangeQuizModal'
import {
  getSharedVocab, getMySubmissions, updateSharedVocab, deleteSharedVocab,
  getPendingVocab, approveVocab, rejectVocab,
} from '@/app/actions/shared-vocab'
import { toggleMastery, getMasteredIds } from '@/app/actions/mastery'
import { generateSharedVocabQuiz } from '@/app/actions/range-quiz'

interface VocabItem {
  id: string
  term_ja: string
  term_reading: string | null
  term_ko: string | null
  term_en: string | null
  example_sentence: string | null
  category: string
  submitted_by: string
  created_at: string
  profiles: { full_name: string | null } | null
}

interface MySubmission {
  id: string
  term_ja: string
  term_reading: string | null
  term_ko: string | null
  example_sentence: string | null
  category: string
  status: string
  created_at: string
}

interface PendingItem {
  id: string
  term_ja: string
  term_reading: string | null
  term_ko: string | null
  example_sentence: string | null
  category: string
  submitted_by: string
  created_at: string
  profiles: { full_name: string | null } | null
}

interface Props {
  role: 'admin' | 'mentor' | 'mentee'
}

type MasteryFilter = 'all' | 'mastered' | 'unmastered'

export default function SharedVocabClient({ role }: Props) {
  const isMentee = role === 'mentee'
  const isStaff = !isMentee

  const [items, setItems] = useState<VocabItem[]>([])
  const [search, setSearch] = useState('')
  const [category, setCategory] = useState('all')
  const [masteryFilter, setMasteryFilter] = useState<MasteryFilter>('all')
  const [pending, startTransition] = useTransition()

  // Toggle panels
  const [showAddForm, setShowAddForm] = useState(false)
  const [showHistory, setShowHistory] = useState(false)
  const [showPending, setShowPending] = useState(false)
  const [mySubmissions, setMySubmissions] = useState<MySubmission[]>([])
  const [pendingItems, setPendingItems] = useState<PendingItem[]>([])

  // Flashcard & Quiz
  const [flashcardOpen, setFlashcardOpen] = useState(false)
  const [quizOpen, setQuizOpen] = useState(false)

  // Edit (staff only)
  const [editId, setEditId] = useState<string | null>(null)
  const [editData, setEditData] = useState({ term_ja: '', term_reading: '', term_ko: '', example_sentence: '', category: 'general' })

  // Reject reason (staff only)
  const [rejectId, setRejectId] = useState<string | null>(null)
  const [rejectReason, setRejectReason] = useState('')

  // Mastery
  const [masteredIds, setMasteredIds] = useState<string[]>([])
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set())

  // Messages
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  function showMsg(type: 'success' | 'error', text: string) {
    setMessage({ type, text })
    setTimeout(() => setMessage(null), 3000)
  }

  function loadItems() {
    startTransition(async () => {
      const result = await getSharedVocab({ search: search || undefined, category: category !== 'all' ? category : undefined })
      setItems((result.items as unknown as VocabItem[]).map(item => ({
        ...item,
        profiles: Array.isArray(item.profiles) ? item.profiles[0] ?? null : item.profiles,
      })))
    })
  }

  function loadMastery() {
    startTransition(async () => {
      const ids = await getMasteredIds('shared_vocab')
      setMasteredIds(ids)
      setLocalMastered(new Set(ids))
    })
  }

  useEffect(() => {
    loadItems()
    loadMastery()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  function handleSearch() {
    loadItems()
  }

  function handleCategoryChange(val: string) {
    setCategory(val)
    setTimeout(loadItems, 0)
  }

  // Mastery toggle
  const handleToggleMastery = useCallback(async (itemId: string) => {
    setLocalMastered(prev => {
      const next = new Set(prev)
      if (next.has(itemId)) next.delete(itemId)
      else next.add(itemId)
      return next
    })
    await toggleMastery('shared_vocab', itemId)
  }, [])

  // History toggle (mentee)
  function handleToggleHistory() {
    if (!showHistory) {
      startTransition(async () => {
        const result = await getMySubmissions()
        setMySubmissions(result.items as MySubmission[])
      })
    }
    setShowHistory(!showHistory)
    if (showPending) setShowPending(false)
  }

  // Pending toggle (staff)
  function handleTogglePending() {
    if (!showPending) {
      loadPendingItems()
    }
    setShowPending(!showPending)
    if (showHistory) setShowHistory(false)
  }

  function loadPendingItems() {
    startTransition(async () => {
      const result = await getPendingVocab()
      setPendingItems((result.items as unknown as PendingItem[]).map(item => ({
        ...item,
        profiles: Array.isArray(item.profiles) ? item.profiles[0] ?? null : item.profiles,
      })))
    })
  }

  // Approve
  function handleApprove(id: string) {
    startTransition(async () => {
      const result = await approveVocab(id)
      if ('error' in result && result.error) {
        showMsg('error', result.error)
      } else {
        showMsg('success', '承認しました')
        loadPendingItems()
        loadItems()
      }
    })
  }

  // Reject
  function handleReject(id: string) {
    startTransition(async () => {
      const result = await rejectVocab(id, rejectReason || undefined)
      if ('error' in result && result.error) {
        showMsg('error', result.error)
      } else {
        showMsg('success', '却下しました')
        setRejectId(null)
        setRejectReason('')
        loadPendingItems()
      }
    })
  }

  // Edit (staff only)
  function startEdit(item: VocabItem) {
    setEditId(item.id)
    setEditData({
      term_ja: item.term_ja,
      term_reading: item.term_reading ?? '',
      term_ko: item.term_ko ?? '',
      example_sentence: item.example_sentence ?? '',
      category: item.category,
    })
  }

  function handleUpdate() {
    if (!editId) return
    startTransition(async () => {
      const result = await updateSharedVocab(editId, {
        term_ja: editData.term_ja,
        term_reading: editData.term_reading || null,
        term_ko: editData.term_ko || null,
        example_sentence: editData.example_sentence || null,
        category: editData.category,
      })
      if ('error' in result && result.error) {
        showMsg('error', result.error)
      } else {
        showMsg('success', '更新しました')
        setEditId(null)
        loadItems()
      }
    })
  }

  // Delete (staff only)
  function handleDelete(id: string) {
    if (!confirm('この単語を削除しますか？')) return
    startTransition(async () => {
      const result = await deleteSharedVocab(id)
      if ('error' in result && result.error) {
        showMsg('error', result.error)
      } else {
        showMsg('success', '削除しました')
        loadItems()
      }
    })
  }

  // Apply mastery filter
  const filteredItems = items.filter(item => {
    if (masteryFilter === 'mastered') return localMastered.has(item.id)
    if (masteryFilter === 'unmastered') return !localMastered.has(item.id)
    return true
  })

  // Flashcard items mapping
  const flashcardItems = filteredItems.map(item => ({
    id: item.id,
    word: item.term_ja,
    reading: item.term_reading ?? '',
    meaning_ko: item.term_ko ?? '',
    example_sentence: item.example_sentence,
    example_sentence_ko: null,
  }))

  // Quiz fetch
  const fetchQuizQuestions = useCallback(async (start: number, end: number, count: number) => {
    return generateSharedVocabQuiz({ category: category !== 'all' ? category : undefined, rangeStart: start, rangeEnd: end, questionCount: count })
  }, [category])

  const categoryLabel = (cat: string) =>
    cat === 'it' ? 'IT' : cat === 'business' ? 'ビジネス' : '一般'

  const statusLabel = (status: string) => {
    switch (status) {
      case 'pending': return '承認待ち'
      case 'approved': return '登録済み'
      case 'rejected': return '却下'
      default: return status
    }
  }

  const statusColor = (status: string) => {
    switch (status) {
      case 'pending': return 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400'
      case 'approved': return 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400'
      case 'rejected': return 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400'
      default: return 'bg-gray-100 text-gray-700 dark:bg-gray-700 dark:text-gray-400'
    }
  }

  return (
    <div>
      {/* Header */}
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">みんなの単語帳</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">みんなで作る共有単語帳。新しい単語を追加して共有しましょう。</p>
      </div>

      {/* Action buttons */}
      <div className="mb-4 flex flex-wrap gap-2">
        <button
          onClick={() => setFlashcardOpen(true)}
          disabled={filteredItems.length === 0}
          className="rounded-xl bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-500 disabled:opacity-50 transition-colors"
        >
          フラッシュカード
        </button>
        <button
          onClick={() => setQuizOpen(true)}
          disabled={filteredItems.length < 4}
          className="rounded-xl bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-500 disabled:opacity-50 transition-colors"
        >
          クイズ
        </button>
        <button
          onClick={() => { setShowAddForm(!showAddForm); if (showHistory) setShowHistory(false); if (showPending) setShowPending(false) }}
          className={`rounded-xl px-4 py-2 text-sm font-medium transition-colors ${
            showAddForm ? 'bg-indigo-100 text-indigo-700 dark:bg-indigo-900/40 dark:text-indigo-300' : 'bg-indigo-600 text-white hover:bg-indigo-500'
          }`}
        >
          {showAddForm ? '追加フォームを閉じる' : '単語追加'}
        </button>

        {/* Staff: pending approval tab */}
        {isStaff && (
          <button
            onClick={() => { handleTogglePending(); if (showAddForm) setShowAddForm(false) }}
            className={`rounded-xl px-4 py-2 text-sm font-medium transition-colors ${
              showPending ? 'bg-amber-100 text-amber-700 dark:bg-amber-900/40 dark:text-amber-300' : 'bg-amber-600 text-white hover:bg-amber-500'
            }`}
          >
            {showPending ? '承認要請を閉じる' : `承認要請${pendingItems.length > 0 ? ` (${pendingItems.length}件)` : ''}`}
          </button>
        )}

        {/* Mentee: submission history tab */}
        {isMentee && (
          <button
            onClick={() => { handleToggleHistory(); if (showAddForm) setShowAddForm(false) }}
            className={`rounded-xl px-4 py-2 text-sm font-medium transition-colors ${
              showHistory ? 'bg-gray-200 text-gray-700 dark:bg-gray-700 dark:text-gray-300' : 'bg-gray-600 text-white hover:bg-gray-500'
            }`}
          >
            {showHistory ? '提出状況を閉じる' : '提出状況'}
          </button>
        )}
      </div>

      {/* Global message */}
      {message && (
        <div className={`mb-4 rounded-xl px-4 py-3 text-sm ${
          message.type === 'success'
            ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
            : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
        }`}>
          {message.text}
        </div>
      )}

      {/* Add Form (toggle) */}
      {showAddForm && (
        <div className="mb-4">
          <VocabSubmitForm role={role} onSubmitted={() => { loadItems(); setShowAddForm(false) }} />
        </div>
      )}

      {/* Pending Approval section (staff only) */}
      {showPending && isStaff && (
        <Card className="mb-4">
          <h2 className="mb-3 text-lg font-semibold text-gray-900 dark:text-white">承認要請</h2>
          {pendingItems.length === 0 ? (
            <p className="text-sm text-zinc-500">承認待ちの単語はありません</p>
          ) : (
            <div className="divide-y divide-gray-100 dark:divide-gray-700">
              {pendingItems.map(item => (
                <div key={item.id} className="py-3">
                  <div className="flex items-start justify-between gap-3">
                    <div className="min-w-0 flex-1">
                      <div className="flex items-center gap-2">
                        <span className="text-lg font-semibold text-gray-900 dark:text-white">{item.term_ja}</span>
                        {item.term_reading && (
                          <span className="text-sm text-gray-500 dark:text-gray-400">{item.term_reading}</span>
                        )}
                        <span className="rounded-full bg-gray-100 px-2 py-0.5 text-[10px] text-gray-500 dark:bg-gray-700 dark:text-gray-400">
                          {categoryLabel(item.category)}
                        </span>
                      </div>
                      {item.term_ko && (
                        <p className="mt-0.5 text-sm text-gray-700 dark:text-gray-300">{item.term_ko}</p>
                      )}
                      {item.example_sentence && (
                        <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">例: {item.example_sentence}</p>
                      )}
                      <p className="mt-1 text-xs text-zinc-400">
                        提出者: {item.profiles?.full_name ?? '不明'}
                      </p>
                    </div>
                    <div className="flex shrink-0 items-center gap-2">
                      <button
                        onClick={() => handleApprove(item.id)}
                        disabled={pending}
                        className="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
                      >
                        承認
                      </button>
                      <button
                        onClick={() => setRejectId(rejectId === item.id ? null : item.id)}
                        disabled={pending}
                        className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-50"
                      >
                        却下
                      </button>
                    </div>
                  </div>
                  {/* Inline reject reason */}
                  {rejectId === item.id && (
                    <div className="mt-2 flex items-center gap-2">
                      <input
                        type="text"
                        value={rejectReason}
                        onChange={e => setRejectReason(e.target.value)}
                        placeholder="却下理由（任意）"
                        className="flex-1 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                      />
                      <button
                        onClick={() => handleReject(item.id)}
                        disabled={pending}
                        className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-50"
                      >
                        確定
                      </button>
                      <button
                        onClick={() => { setRejectId(null); setRejectReason('') }}
                        className="rounded-lg px-3 py-1.5 text-xs font-medium text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
                      >
                        取消
                      </button>
                    </div>
                  )}
                </div>
              ))}
            </div>
          )}
        </Card>
      )}

      {/* My Submissions (mentee only) */}
      {showHistory && isMentee && (
        <Card className="mb-4">
          <h2 className="mb-3 text-lg font-semibold text-gray-900 dark:text-white">提出状況</h2>
          {mySubmissions.filter(s => s.status !== 'approved').length === 0 ? (
            <p className="text-sm text-zinc-500">承認待ち・却下の単語はありません</p>
          ) : (
            <div className="divide-y divide-gray-100 dark:divide-gray-700">
              {mySubmissions.filter(s => s.status !== 'approved').map(s => (
                <div key={s.id} className="flex items-center justify-between py-2">
                  <div>
                    <span className="font-medium text-gray-900 dark:text-white">{s.term_ja}</span>
                    {s.term_ko && <span className="ml-2 text-sm text-gray-500">— {s.term_ko}</span>}
                  </div>
                  <span className={`rounded-full px-2 py-0.5 text-[10px] font-medium ${statusColor(s.status)}`}>
                    {statusLabel(s.status)}
                  </span>
                </div>
              ))}
            </div>
          )}
        </Card>
      )}

      {/* Main word list */}
      <Card>
        <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">みんなの単語</h2>

        {/* Search & Filter */}
        <div className="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center sm:flex-wrap">
          <input
            type="text"
            placeholder="検索..."
            value={search}
            onChange={e => setSearch(e.target.value)}
            onKeyDown={e => e.key === 'Enter' && handleSearch()}
            className="w-full max-w-xs rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100 dark:placeholder-zinc-500"
          />
          <select
            value={category}
            onChange={e => handleCategoryChange(e.target.value)}
            className="rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
          >
            <option value="all">全て</option>
            <option value="general">一般</option>
            <option value="business">ビジネス</option>
            <option value="it">IT</option>
          </select>
          <select
            value={masteryFilter}
            onChange={e => setMasteryFilter(e.target.value as MasteryFilter)}
            className="rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
          >
            <option value="all">暗記状態: 全て</option>
            <option value="mastered">暗記済み</option>
            <option value="unmastered">未暗記</option>
          </select>
          <button
            onClick={handleSearch}
            disabled={pending}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            検索
          </button>
          <span className="text-sm text-zinc-400">全 {filteredItems.length}件</span>
        </div>

        {/* Items */}
        {pending && items.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">読み込み中...</div>
        ) : filteredItems.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">
            {masteryFilter !== 'all' ? '該当する単語はありません' : '登録された単語はまだありません'}
          </div>
        ) : (
          <div className="divide-y divide-gray-100 dark:divide-gray-700">
            {filteredItems.map((item, idx) => (
              <div key={item.id} className="py-3">
                {editId === item.id ? (
                  /* Edit mode (staff only) */
                  <div className="space-y-3 rounded-xl bg-gray-50 p-4 dark:bg-white/5">
                    <div className="grid gap-3 sm:grid-cols-2">
                      <div>
                        <label className="block text-xs font-medium text-zinc-500">単語 *</label>
                        <input
                          type="text"
                          value={editData.term_ja}
                          onChange={e => setEditData({ ...editData, term_ja: e.target.value })}
                          className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                        />
                      </div>
                      <div>
                        <label className="block text-xs font-medium text-zinc-500">読み</label>
                        <input
                          type="text"
                          value={editData.term_reading}
                          onChange={e => setEditData({ ...editData, term_reading: e.target.value })}
                          className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                        />
                      </div>
                      <div>
                        <label className="block text-xs font-medium text-zinc-500">意味 (韓国語)</label>
                        <input
                          type="text"
                          value={editData.term_ko}
                          onChange={e => setEditData({ ...editData, term_ko: e.target.value })}
                          className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                        />
                      </div>
                      <div>
                        <label className="block text-xs font-medium text-zinc-500">カテゴリ</label>
                        <select
                          value={editData.category}
                          onChange={e => setEditData({ ...editData, category: e.target.value })}
                          className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
                        >
                          <option value="general">一般</option>
                          <option value="business">ビジネス</option>
                          <option value="it">IT</option>
                        </select>
                      </div>
                      <div className="sm:col-span-2">
                        <label className="block text-xs font-medium text-zinc-500">例文</label>
                        <input
                          type="text"
                          value={editData.example_sentence}
                          onChange={e => setEditData({ ...editData, example_sentence: e.target.value })}
                          className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                        />
                      </div>
                    </div>
                    <div className="flex justify-end gap-2">
                      <button
                        onClick={() => setEditId(null)}
                        className="rounded-lg px-3 py-1.5 text-xs font-medium text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
                      >
                        キャンセル
                      </button>
                      <button
                        onClick={handleUpdate}
                        disabled={pending || !editData.term_ja.trim()}
                        className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-indigo-500 disabled:opacity-50"
                      >
                        保存
                      </button>
                    </div>
                  </div>
                ) : (
                  /* View mode */
                  <div className="flex items-start gap-3">
                    <span className="mt-0.5 w-8 shrink-0 text-center text-xs text-gray-400">{idx + 1}</span>

                    {/* Mastery toggle */}
                    <button
                      onClick={() => handleToggleMastery(item.id)}
                      className="mt-0.5 shrink-0"
                      title={localMastered.has(item.id) ? '暗記済み' : '未暗記'}
                    >
                      {localMastered.has(item.id) ? (
                        <svg className="h-4 w-4 text-green-500" fill="currentColor" viewBox="0 0 24 24">
                          <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                        </svg>
                      ) : (
                        <svg className="h-4 w-4 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                          <circle cx="12" cy="12" r="10" />
                        </svg>
                      )}
                    </button>

                    <div className="min-w-0 flex-1">
                      <div className="flex items-center gap-2">
                        <span className="text-lg font-semibold text-gray-900 dark:text-white">{item.term_ja}</span>
                        {item.term_reading && (
                          <span className="text-sm text-gray-500 dark:text-gray-400">{item.term_reading}</span>
                        )}
                        <span className="rounded-full bg-gray-100 px-2 py-0.5 text-[10px] text-gray-500 dark:bg-gray-700 dark:text-gray-400">
                          {categoryLabel(item.category)}
                        </span>
                      </div>
                      {item.term_ko && (
                        <p className="mt-0.5 text-sm text-gray-700 dark:text-gray-300">{item.term_ko}</p>
                      )}
                      {item.example_sentence && (
                        <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">例: {item.example_sentence}</p>
                      )}
                    </div>

                    {/* Edit / Delete — staff only */}
                    {isStaff && (
                      <div className="flex shrink-0 items-center gap-1">
                        <button
                          onClick={() => startEdit(item)}
                          className="rounded-lg p-1.5 text-gray-400 hover:bg-gray-100 hover:text-gray-600 dark:hover:bg-gray-700 dark:hover:text-gray-300"
                          title="編集"
                        >
                          <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                            <path strokeLinecap="round" strokeLinejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                          </svg>
                        </button>
                        <button
                          onClick={() => handleDelete(item.id)}
                          className="rounded-lg p-1.5 text-gray-400 hover:bg-red-50 hover:text-red-500 dark:hover:bg-red-900/20 dark:hover:text-red-400"
                          title="削除"
                        >
                          <svg className="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                            <path strokeLinecap="round" strokeLinejoin="round" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
                        </button>
                      </div>
                    )}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </Card>

      {/* Flashcard modal */}
      {flashcardOpen && (
        <FlashcardMode
          items={flashcardItems}
          onClose={() => setFlashcardOpen(false)}
          masteredIds={[...localMastered]}
          onToggleMastery={handleToggleMastery}
        />
      )}

      {/* Quiz modal */}
      {quizOpen && (
        <RangeQuizModal
          totalCount={filteredItems.length}
          onClose={() => setQuizOpen(false)}
          fetchQuestions={fetchQuizQuestions}
        />
      )}
    </div>
  )
}
