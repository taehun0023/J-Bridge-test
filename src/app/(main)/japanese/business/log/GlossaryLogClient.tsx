'use client'

import { useState, useEffect } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import Card from '@/components/ui/Card'
import Pagination from '@/components/ui/Pagination'
import { getGlossaryLog, revertGlossaryChange } from '@/app/actions/admin/glossary'
import type { GlossaryLogEntry } from '@/app/actions/admin/glossary'
import { Undo2 } from 'lucide-react'
import NameRuby from '@/components/ui/NameRuby'

const ACTION_LABELS: Record<string, string> = {
  create: '作成',
  update: '更新',
  delete: '削除',
  restore: '復元',
}

const ACTION_COLORS: Record<string, string> = {
  create: 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400',
  update: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400',
  delete: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
  restore: 'bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400',
}

const CATEGORY_LABELS: Record<string, string> = {
  business: 'ビジネス',
  it: 'IT語彙',
  dev: '開発',
  expression: 'ビジネス表現',
  sentence_pattern: '文章パターン',
}

const FIELD_LABELS: Record<string, string> = {
  term_ja: '日本語',
  reading: '読み',
  term_ko: '韓国語',
  term_en: '英語',
  description: '説明',
  example_sentence: '例文',
  category: 'カテゴリ',
  subcategory: 'サブカテゴリ',
}

const DIFF_FIELDS = ['term_ja', 'reading', 'term_ko', 'term_en', 'description', 'example_sentence', 'category', 'subcategory']

function getTermName(entry: GlossaryLogEntry): string {
  const old = entry.old_data as Record<string, unknown> | null
  const nw = entry.new_data as Record<string, unknown> | null
  return (old?.term_ja ?? nw?.term_ja ?? '—') as string
}

function getCategory(entry: GlossaryLogEntry): string {
  const old = entry.old_data as Record<string, unknown> | null
  const nw = entry.new_data as Record<string, unknown> | null
  const cat = (old?.category ?? nw?.category ?? '') as string
  return CATEGORY_LABELS[cat] ?? cat
}

function getChangedFields(entry: GlossaryLogEntry): { field: string; oldVal: string; newVal: string }[] {
  if (entry.action !== 'update' || !entry.old_data || !entry.new_data) return []
  const changes: { field: string; oldVal: string; newVal: string }[] = []
  for (const key of DIFF_FIELDS) {
    const oldVal = String(entry.old_data[key] ?? '')
    const newVal = String(entry.new_data[key] ?? '')
    if (oldVal !== newVal) {
      changes.push({ field: FIELD_LABELS[key] ?? key, oldVal: oldVal || '(空)', newVal: newVal || '(空)' })
    }
  }
  return changes
}

export default function GlossaryLogClient() {
  const [items, setItems] = useState<GlossaryLogEntry[]>([])
  const [total, setTotal] = useState(0)
  const [page, setPage] = useState(1)
  const [action, setAction] = useState('all')
  const [dateFrom, setDateFrom] = useState('')
  const [dateTo, setDateTo] = useState('')
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [pending, startTransition] = useLoadingTransition()

  function loadData(p?: number) {
    const targetPage = p ?? page
    startTransition(async () => {
      const result = await getGlossaryLog({
        action: action !== 'all' ? action : undefined,
        dateFrom: dateFrom || undefined,
        dateTo: dateTo || undefined,
        page: targetPage,
      })
      setItems(result.items)
      setTotal(result.total)
    })
  }

  useEffect(() => {
    loadData()
    // mount-only: filters trigger reload via handleFilter
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  function handleFilter() {
    setPage(1)
    loadData(1)
  }

  function handleRevert(logId: string) {
    startTransition(async () => {
      const result = await revertGlossaryChange(logId)
      if ('error' in result && result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '復元しました' })
        loadData()
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handlePageChange(p: number) {
    setPage(p)
    loadData(p)
  }

  const totalPages = Math.ceil(total / 50)

  return (
    <div>
      {message && (
        <div className={`mb-4 rounded-xl px-4 py-3 text-sm ${
          message.type === 'success'
            ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
            : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
        }`}>
          {message.text}
        </div>
      )}

      {/* Filters */}
      <Card className="mb-4">
        <div className="flex flex-wrap items-end gap-3">
          <div>
            <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">日付 (From)</label>
            <input
              type="date"
              value={dateFrom}
              onChange={e => setDateFrom(e.target.value)}
              className="mt-1 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
            />
          </div>
          <div>
            <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">日付 (To)</label>
            <input
              type="date"
              value={dateTo}
              onChange={e => setDateTo(e.target.value)}
              className="mt-1 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
            />
          </div>
          <div>
            <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">操作</label>
            <select
              value={action}
              onChange={e => setAction(e.target.value)}
              className="mt-1 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
            >
              <option value="all">全て</option>
              <option value="create">作成</option>
              <option value="update">更新</option>
              <option value="delete">削除</option>
              <option value="restore">復元</option>
            </select>
          </div>
          <button
            onClick={handleFilter}
            disabled={pending}
            className="rounded-lg bg-indigo-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            検索
          </button>
        </div>
      </Card>

      {/* Log entries */}
      <Card>
        {pending && items.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">読み込み中...</div>
        ) : items.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">変更履歴はまだありません</div>
        ) : (
          <div className="divide-y divide-gray-100 dark:divide-gray-700">
            {items.map(entry => {
              const profile = entry.profiles as { full_name: string | null; email: string } | null
              const actorFullName = profile?.full_name ?? null
              const actorFallback = profile?.email ?? entry.actor_id
              const termName = getTermName(entry)
              const category = getCategory(entry)
              const changes = getChangedFields(entry)
              const isExpanded = expandedId === entry.id
              const canRevert = (entry.action === 'update' || entry.action === 'delete') && entry.old_data

              return (
                <div key={entry.id} className="py-3">
                  <div className="flex items-start justify-between gap-4">
                    <div
                      className="min-w-0 flex-1 cursor-pointer"
                      onClick={() => setExpandedId(isExpanded ? null : entry.id)}
                    >
                      <div className="flex items-center gap-2 flex-wrap">
                        <span className="text-xs text-gray-400">
                          {new Date(entry.created_at).toLocaleString('ja-JP')}
                        </span>
                        <span className="text-xs font-medium text-gray-600 dark:text-gray-300">
                          <NameRuby name={actorFullName} fallback={actorFallback} />
                        </span>
                        <span className={`rounded-full px-2 py-0.5 text-[10px] font-medium ${ACTION_COLORS[entry.action] ?? 'bg-gray-100 text-gray-600'}`}>
                          {ACTION_LABELS[entry.action] ?? entry.action}
                        </span>
                      </div>
                      <p className="mt-0.5 text-sm text-gray-700 dark:text-gray-300">
                        <span className="font-medium">{termName}</span>
                        <span className="ml-2 text-xs text-gray-400">{category}</span>
                        {entry.action === 'update' && changes.length > 0 && (
                          <span className="ml-2 text-xs text-blue-400">({changes.length}件変更)</span>
                        )}
                      </p>
                    </div>
                    {canRevert && (
                      <button
                        onClick={() => handleRevert(entry.id)}
                        disabled={pending}
                        className="inline-flex shrink-0 items-center gap-1.5 rounded-lg border border-amber-200 bg-amber-50 px-3 py-1.5 text-xs font-semibold text-amber-700 shadow-sm hover:bg-amber-100 hover:border-amber-300 disabled:opacity-50 dark:border-amber-700/50 dark:bg-amber-900/20 dark:text-amber-400 dark:hover:bg-amber-900/40 transition-all"
                        title="この変更を元に戻します"
                      >
                        <Undo2 className="h-3.5 w-3.5" />
                        復元する
                      </button>
                    )}
                  </div>

                  {/* Expanded details */}
                  {isExpanded && (
                    <div className="mt-2 rounded-lg bg-gray-50 p-3 text-xs dark:bg-zinc-800/50">
                      {entry.action === 'update' && changes.length > 0 && (
                        <div className="space-y-1">
                          {changes.map(c => (
                            <div key={c.field} className="flex gap-2">
                              <span className="w-20 shrink-0 font-medium text-gray-500 dark:text-gray-400">{c.field}</span>
                              <span className="text-red-500 line-through">{c.oldVal}</span>
                              <span className="text-gray-400">→</span>
                              <span className="text-emerald-600 dark:text-emerald-400">{c.newVal}</span>
                            </div>
                          ))}
                        </div>
                      )}
                      {entry.action === 'delete' && entry.old_data && (
                        <div className="space-y-1">
                          {DIFF_FIELDS.map(key => {
                            const val = String(entry.old_data![key] ?? '')
                            if (!val) return null
                            return (
                              <div key={key} className="flex gap-2">
                                <span className="w-20 shrink-0 font-medium text-gray-500 dark:text-gray-400">{FIELD_LABELS[key] ?? key}</span>
                                <span className="text-gray-700 dark:text-gray-300">{val}</span>
                              </div>
                            )
                          })}
                        </div>
                      )}
                      {entry.action === 'create' && entry.new_data && (
                        <div className="space-y-1">
                          {DIFF_FIELDS.map(key => {
                            const val = String(entry.new_data![key] ?? '')
                            if (!val) return null
                            return (
                              <div key={key} className="flex gap-2">
                                <span className="w-20 shrink-0 font-medium text-gray-500 dark:text-gray-400">{FIELD_LABELS[key] ?? key}</span>
                                <span className="text-emerald-600 dark:text-emerald-400">{val}</span>
                              </div>
                            )
                          })}
                        </div>
                      )}
                      {entry.action === 'restore' && entry.new_data && (
                        <div className="space-y-1">
                          {DIFF_FIELDS.map(key => {
                            const val = String(entry.new_data![key] ?? '')
                            if (!val) return null
                            return (
                              <div key={key} className="flex gap-2">
                                <span className="w-20 shrink-0 font-medium text-gray-500 dark:text-gray-400">{FIELD_LABELS[key] ?? key}</span>
                                <span className="text-purple-600 dark:text-purple-400">{val}</span>
                              </div>
                            )
                          })}
                        </div>
                      )}
                    </div>
                  )}
                </div>
              )
            })}
          </div>
        )}
      </Card>

      {totalPages > 1 && (
        <Pagination
          currentPage={page}
          totalPages={totalPages}
          onPageChange={handlePageChange}
        />
      )}
    </div>
  )
}
