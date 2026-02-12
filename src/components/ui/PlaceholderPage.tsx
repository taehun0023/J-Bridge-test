'use client'

import { useState } from 'react'
import { requestContentAccess } from '@/app/actions/access-request'

export default function PlaceholderPage({ title, category }: { title: string; category: string }) {
  const [submitted, setSubmitted] = useState(false)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const handleRequest = async () => {
    setLoading(true)
    setError(null)
    try {
      const result = await requestContentAccess(category, `/${category}`)
      if (result.error) {
        setError(result.error)
      } else {
        setSubmitted(true)
      }
    } catch {
      setError('リクエストの送信に失敗しました')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="flex flex-col items-center justify-center min-h-[60vh] gap-6">
      <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">{title}</h1>
      <p className="text-zinc-500 dark:text-zinc-400">コンテンツは準備中です</p>
      {submitted ? (
        <p className="text-sm text-green-600 dark:text-green-400">閲覧申請を送信しました</p>
      ) : (
        <button
          onClick={handleRequest}
          disabled={loading}
          className="rounded-lg bg-indigo-600 px-5 py-2.5 text-sm font-medium text-white hover:bg-indigo-700 disabled:opacity-50 transition-colors"
        >
          {loading ? '送信中...' : '閲覧申請'}
        </button>
      )}
      {error && <p className="text-sm text-red-500">{error}</p>}
    </div>
  )
}
