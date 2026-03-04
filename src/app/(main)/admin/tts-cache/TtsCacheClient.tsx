'use client'

import { useState, useEffect, useCallback } from 'react'
import Card from '@/components/ui/Card'

interface TableInfo {
  total: number
  cached: number
  uncached: number
  label: string
}

interface BatchResult {
  processed: number
  newlyCached: number
  errors: number
  done: boolean
  remaining: number
}

type Status = 'idle' | 'loading' | 'running' | 'done' | 'error'

export default function TtsCacheClient() {
  const [counts, setCounts] = useState<Record<string, TableInfo> | null>(null)
  const [status, setStatus] = useState<Status>('idle')
  const [currentTable, setCurrentTable] = useState('')
  const [progress, setProgress] = useState({ processed: 0, newlyCached: 0, errors: 0 })
  const [totalProgress, setTotalProgress] = useState({ total: 0, current: 0 })
  const [message, setMessage] = useState('')

  const loadCounts = useCallback(async () => {
    setStatus('loading')
    setMessage('')
    try {
      const res = await fetch('/api/admin/tts-precache')
      if (!res.ok) throw new Error('Failed to load counts')
      const data = await res.json()
      setCounts(data.counts)
      setStatus('idle')
    } catch {
      setStatus('error')
      setMessage('カウント取得に失敗しました')
    }
  }, [])

  // Auto-load on mount
  useEffect(() => { loadCounts() }, [loadCounts])

  const totalUncached = counts
    ? Object.values(counts).reduce((sum, t) => sum + t.uncached, 0)
    : 0

  const runPrecache = useCallback(async () => {
    if (!counts) return
    setStatus('running')
    setProgress({ processed: 0, newlyCached: 0, errors: 0 })
    setMessage('')

    // Only process tables that have uncached items
    const tables = Object.entries(counts).filter(([, info]) => info.uncached > 0)
    const grandTotal = tables.reduce((sum, [, info]) => sum + info.uncached, 0)
    setTotalProgress({ total: grandTotal, current: 0 })

    let overallProcessed = 0
    let overallNew = 0
    let overallErrors = 0

    for (const [table, info] of tables) {
      setCurrentTable(info.label)

      while (true) {
        try {
          const res = await fetch('/api/admin/tts-precache', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ table }),
          })

          if (!res.ok) {
            overallErrors++
            break
          }

          const result: BatchResult = await res.json()
          overallProcessed += result.processed
          overallNew += result.newlyCached
          overallErrors += result.errors

          setProgress({
            processed: overallProcessed,
            newlyCached: overallNew,
            errors: overallErrors,
          })
          setTotalProgress(prev => ({ ...prev, current: overallProcessed }))

          if (result.done) break
        } catch {
          overallErrors++
          break
        }
      }
    }

    setCurrentTable('')
    setStatus('done')
    setMessage(
      `完了: ${overallNew}件の新規キャッシュ生成${overallErrors > 0 ? `、${overallErrors}件エラー` : ''}`
    )

    // Reload counts to reflect updated cache status
    const res = await fetch('/api/admin/tts-precache')
    if (res.ok) {
      const data = await res.json()
      setCounts(data.counts)
    }
  }, [counts])

  const pct = totalProgress.total > 0
    ? Math.round((totalProgress.current / totalProgress.total) * 100)
    : 0

  return (
    <div className="mt-6 space-y-6">
      {/* Loading state */}
      {status === 'loading' && !counts && (
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">キャッシュ状況を確認中...</p>
        </Card>
      )}

      {/* Table cards with cache status */}
      {counts && (
        <>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5">
            {Object.entries(counts).map(([table, info]) => {
              const cachedPct = info.total > 0 ? Math.round((info.cached / info.total) * 100) : 0
              return (
                <Card key={table}>
                  <p className="text-sm font-medium text-gray-500 dark:text-gray-400">{info.label}</p>
                  <p className="mt-1 text-2xl font-bold text-gray-900 dark:text-white">{info.total}件</p>
                  <div className="mt-3 h-2 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700">
                    <div
                      className="h-full rounded-full bg-emerald-500 transition-all duration-500"
                      style={{ width: `${cachedPct}%` }}
                    />
                  </div>
                  <div className="mt-2 flex justify-between text-xs">
                    <span className="text-emerald-600 dark:text-emerald-400">
                      キャッシュ済み {info.cached}
                    </span>
                    {info.uncached > 0 && (
                      <span className="text-amber-600 dark:text-amber-400">
                        未キャッシュ {info.uncached}
                      </span>
                    )}
                  </div>
                </Card>
              )
            })}
          </div>

          <Card>
            <div className="space-y-4">
              <div className="flex items-center gap-4">
                <button
                  onClick={runPrecache}
                  disabled={status === 'running' || totalUncached === 0}
                  className="rounded-lg bg-green-600 px-6 py-2 text-sm font-medium text-white hover:bg-green-700 disabled:opacity-50"
                >
                  {status === 'running'
                    ? 'キャッシュ生成中...'
                    : totalUncached === 0
                      ? '全件キャッシュ済み'
                      : `未キャッシュ ${totalUncached}件を生成`}
                </button>
                <button
                  onClick={loadCounts}
                  disabled={status === 'loading' || status === 'running'}
                  className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700"
                >
                  再読み込み
                </button>
                {status === 'running' && currentTable && (
                  <span className="text-sm text-gray-500 dark:text-gray-400">
                    処理中: {currentTable}
                  </span>
                )}
              </div>

              {/* Progress bar */}
              {(status === 'running' || status === 'done') && totalProgress.total > 0 && (
                <div>
                  <div className="mb-1 flex justify-between text-sm text-gray-600 dark:text-gray-400">
                    <span>{totalProgress.current} / {totalProgress.total}件</span>
                    <span>{pct}%</span>
                  </div>
                  <div className="h-3 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700">
                    <div
                      className="h-full rounded-full bg-green-500 transition-all duration-300"
                      style={{ width: `${pct}%` }}
                    />
                  </div>
                </div>
              )}

              {/* Stats */}
              {(status === 'running' || status === 'done') && progress.processed > 0 && (
                <div className="grid grid-cols-3 gap-3 text-sm">
                  <div>
                    <span className="text-gray-500 dark:text-gray-400">処理済み</span>
                    <p className="font-semibold text-gray-900 dark:text-white">{progress.processed}</p>
                  </div>
                  <div>
                    <span className="text-gray-500 dark:text-gray-400">新規生成</span>
                    <p className="font-semibold text-green-600">{progress.newlyCached}</p>
                  </div>
                  <div>
                    <span className="text-gray-500 dark:text-gray-400">エラー</span>
                    <p className="font-semibold text-red-600">{progress.errors}</p>
                  </div>
                </div>
              )}

              {/* Message */}
              {message && (
                <p className={`text-sm ${status === 'error' ? 'text-red-600' : 'text-green-600'}`}>
                  {message}
                </p>
              )}
            </div>
          </Card>
        </>
      )}
    </div>
  )
}
