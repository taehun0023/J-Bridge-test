'use client'

import { useState, useCallback } from 'react'
import Card from '@/components/ui/Card'

interface TableInfo {
  total: number
  label: string
}

interface BatchResult {
  processed: number
  cached: number
  newlyCached: number
  errors: number
  done: boolean
}

type Status = 'idle' | 'loading' | 'running' | 'done' | 'error'

export default function TtsCacheClient() {
  const [counts, setCounts] = useState<Record<string, TableInfo> | null>(null)
  const [status, setStatus] = useState<Status>('idle')
  const [currentTable, setCurrentTable] = useState('')
  const [progress, setProgress] = useState({ processed: 0, cached: 0, newlyCached: 0, errors: 0 })
  const [totalProgress, setTotalProgress] = useState({ total: 0, current: 0 })
  const [message, setMessage] = useState('')

  const loadCounts = useCallback(async () => {
    setStatus('loading')
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

  const runPrecache = useCallback(async () => {
    if (!counts) return
    setStatus('running')
    setProgress({ processed: 0, cached: 0, newlyCached: 0, errors: 0 })

    const tables = Object.entries(counts)
    const grandTotal = tables.reduce((sum, [, info]) => sum + info.total, 0)
    setTotalProgress({ total: grandTotal, current: 0 })

    let overallProcessed = 0
    let overallCached = 0
    let overallNew = 0
    let overallErrors = 0

    for (const [table, info] of tables) {
      setCurrentTable(info.label)
      let offset = 0

      while (true) {
        try {
          const res = await fetch('/api/admin/tts-precache', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ table, offset }),
          })

          if (!res.ok) {
            overallErrors++
            break
          }

          const result: BatchResult = await res.json()
          overallProcessed += result.processed
          overallCached += result.cached
          overallNew += result.newlyCached
          overallErrors += result.errors

          setProgress({
            processed: overallProcessed,
            cached: overallCached,
            newlyCached: overallNew,
            errors: overallErrors,
          })
          setTotalProgress(prev => ({ ...prev, current: overallProcessed }))

          if (result.done) break
          offset += result.processed
        } catch {
          overallErrors++
          break
        }
      }
    }

    setCurrentTable('')
    setStatus('done')
    setMessage(
      `完了: ${overallNew}件の新規キャッシュ生成、${overallCached}件は既存キャッシュ${overallErrors > 0 ? `、${overallErrors}件エラー` : ''}`
    )
  }, [counts])

  const pct = totalProgress.total > 0
    ? Math.round((totalProgress.current / totalProgress.total) * 100)
    : 0

  return (
    <div className="mt-6 space-y-6">
      {/* Load counts */}
      {!counts && (
        <Card>
          <button
            onClick={loadCounts}
            disabled={status === 'loading'}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
          >
            {status === 'loading' ? '読み込み中...' : 'コンテンツ数を確認'}
          </button>
        </Card>
      )}

      {/* Show counts and start button */}
      {counts && (
        <>
          <div className="grid grid-cols-1 gap-4 sm:grid-cols-3">
            {Object.entries(counts).map(([table, info]) => (
              <Card key={table}>
                <p className="text-sm text-gray-500 dark:text-gray-400">{info.label}</p>
                <p className="text-2xl font-bold text-gray-900 dark:text-white">{info.total}件</p>
              </Card>
            ))}
          </div>

          <Card>
            <div className="space-y-4">
              <div className="flex items-center gap-4">
                <button
                  onClick={runPrecache}
                  disabled={status === 'running'}
                  className="rounded-lg bg-green-600 px-6 py-2 text-sm font-medium text-white hover:bg-green-700 disabled:opacity-50"
                >
                  {status === 'running' ? 'キャッシュ生成中...' : 'キャッシュ一括生成'}
                </button>
                {status === 'running' && currentTable && (
                  <span className="text-sm text-gray-500 dark:text-gray-400">
                    処理中: {currentTable}
                  </span>
                )}
              </div>

              {/* Progress bar */}
              {(status === 'running' || status === 'done') && (
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
              {(status === 'running' || status === 'done') && (
                <div className="grid grid-cols-2 gap-3 text-sm sm:grid-cols-4">
                  <div>
                    <span className="text-gray-500 dark:text-gray-400">処理済み</span>
                    <p className="font-semibold text-gray-900 dark:text-white">{progress.processed}</p>
                  </div>
                  <div>
                    <span className="text-gray-500 dark:text-gray-400">既存キャッシュ</span>
                    <p className="font-semibold text-blue-600">{progress.cached}</p>
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
