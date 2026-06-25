'use client'

import { useState, useEffect } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import Card from '@/components/ui/Card'
import Pagination from '@/components/ui/Pagination'
import { getAuditLog, restoreResource, exportAuditLogCsv } from '@/app/actions/audit'
import type { AuditLogEntry } from '@/app/actions/audit'
import { RotateCcw, Download } from 'lucide-react'
import NameRuby from '@/components/ui/NameRuby'

const ACTION_LABELS: Record<string, string> = {
  create: '作成',
  update: '更新',
  delete: '削除',
  approve: '承認',
  reject: '反却',
  restore: '復元',
}

const ACTION_COLORS: Record<string, string> = {
  create: 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400',
  update: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400',
  delete: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
  approve: 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400',
  reject: 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400',
  restore: 'bg-purple-100 text-purple-700 dark:bg-purple-900/30 dark:text-purple-400',
}

export default function AuditLogClient({ users = [] }: { users?: { id: string; name: string }[] }) {
  const [items, setItems] = useState<AuditLogEntry[]>([])
  const [total, setTotal] = useState(0)
  const [page, setPage] = useState(1)
  const [action, setAction] = useState('all')
  const [resourceType, setResourceType] = useState('all')
  const [actorId, setActorId] = useState('all')
  const [dateFrom, setDateFrom] = useState('')
  const [dateTo, setDateTo] = useState('')
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [pending, startTransition] = useLoadingTransition()

  function loadData(p?: number) {
    const targetPage = p ?? page
    startTransition(async () => {
      const result = await getAuditLog({
        action: action !== 'all' ? action : undefined,
        resourceType: resourceType !== 'all' ? resourceType : undefined,
        actorId: actorId !== 'all' ? actorId : undefined,
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
    // mount-only: filters trigger reload via handleFilter, not effect deps
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  function handleFilter() {
    setPage(1)
    loadData(1)
  }

  function handleRestore(logId: string) {
    startTransition(async () => {
      const result = await restoreResource(logId)
      if ('error' in result && result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '復元しました' })
        loadData()
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleExport() {
    startTransition(async () => {
      const result = await exportAuditLogCsv({
        action: action !== 'all' ? action : undefined,
        resourceType: resourceType !== 'all' ? resourceType : undefined,
        actorId: actorId !== 'all' ? actorId : undefined,
        dateFrom: dateFrom || undefined,
        dateTo: dateTo || undefined,
      })
      if (result.csv) {
        const blob = new Blob(['\uFEFF' + result.csv], { type: 'text/csv;charset=utf-8;' })
        const url = URL.createObjectURL(blob)
        const a = document.createElement('a')
        a.href = url
        a.download = `audit_log_${new Date().toISOString().split('T')[0]}.csv`
        a.click()
        URL.revokeObjectURL(url)
      }
    })
  }

  function handlePageChange(p: number) {
    setPage(p)
    loadData(p)
  }

  const totalPages = Math.ceil(total / 50)

  return (
    <div className="mt-6">
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
              <option value="approve">承認</option>
              <option value="reject">反却</option>
              <option value="restore">復元</option>
            </select>
          </div>
          <div>
            <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">リソース</label>
            <select
              value={resourceType}
              onChange={e => setResourceType(e.target.value)}
              className="mt-1 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
            >
              <option value="all">全て</option>
              <option value="courses">コース</option>
              <option value="quizzes">クイズ</option>
              <option value="quiz_questions">クイズ問題</option>
              <option value="profiles">プロフィール</option>
              <option value="task_assignments">課題配信</option>
              <option value="learning_assignments">学習課題</option>
              <option value="admin_feedbacks">フィードバック</option>
              <option value="quiz_attempts">クイズ再受験</option>

              <option value="jlpt_vocabulary">JLPT語彙</option>
              <option value="jlpt_grammar">JLPT文法</option>
              <option value="jlpt_kanji">JLPT漢字</option>
              <option value="it_glossary">IT語彙</option>
              <option value="cs_terms">CS用語</option>
            </select>
          </div>
          <div>
            <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">ユーザー</label>
            <select
              value={actorId}
              onChange={e => setActorId(e.target.value)}
              className="mt-1 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
            >
              <option value="all">全ユーザー</option>
              {users.map(u => <option key={u.id} value={u.id}>{u.name}</option>)}
            </select>
          </div>
          <button
            onClick={handleFilter}
            disabled={pending}
            className="rounded-lg bg-indigo-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            検索
          </button>
          <button
            onClick={handleExport}
            disabled={pending}
            className="ml-auto inline-flex items-center gap-1 rounded-lg bg-gray-200 px-3 py-1.5 text-sm font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600 transition-colors"
          >
            <Download className="h-4 w-4" />
            CSV出力
          </button>
        </div>
      </Card>

      {/* Log entries */}
      <Card>
        {pending && items.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">読み込み中...</div>
        ) : items.length === 0 ? (
          <div className="py-8 text-center text-sm text-zinc-500">監査ログはまだありません</div>
        ) : (
          <div className="divide-y divide-gray-100 dark:divide-gray-700">
            {items.map(entry => {
              const profile = entry.profiles as { full_name: string | null; email: string } | null
              const actorFullName = profile?.full_name ?? null
              const actorFallback = profile?.email ?? entry.actor_id
              return (
                <div key={entry.id} className="flex items-start justify-between gap-4 py-3">
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-2">
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
                      {entry.resource_type} <span className="text-xs text-gray-400">#{entry.resource_id.slice(0, 8)}</span>
                    </p>
                  </div>
                  {entry.action === 'delete' && entry.old_data && (
                    <button
                      onClick={() => handleRestore(entry.id)}
                      disabled={pending}
                      className="inline-flex shrink-0 items-center gap-1 rounded-lg bg-purple-100 px-3 py-1.5 text-xs font-medium text-purple-700 hover:bg-purple-200 disabled:opacity-50 dark:bg-purple-900/30 dark:text-purple-400 dark:hover:bg-purple-900/50 transition-colors"
                    >
                      <RotateCcw className="h-3.5 w-3.5" />
                      復元する
                    </button>
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
