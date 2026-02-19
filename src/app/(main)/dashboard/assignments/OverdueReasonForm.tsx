'use client'

import { useState, useTransition } from 'react'
import { submitOverdueReason } from '@/app/actions/learning-assignments'

interface Props {
  assignmentId: string
  existingReason: string | null
}

export default function OverdueReasonForm({ assignmentId, existingReason }: Props) {
  const [reason, setReason] = useState('')
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)

  if (existingReason) {
    return (
      <div className="mt-2 rounded-lg bg-red-50 px-3 py-2 text-sm text-red-700 dark:bg-red-900/20 dark:text-red-300">
        <span className="font-medium">提出済みの遅延理由:</span> {existingReason}
      </div>
    )
  }

  function handleSubmit() {
    if (!reason.trim()) return
    startTransition(async () => {
      const result = await submitOverdueReason(assignmentId, reason)
      if ('error' in result) setMessage(result.error ?? 'エラーが発生しました')
      else setMessage('遅延理由を提出しました')
    })
  }

  return (
    <div className="mt-3">
      {message && (
        <p className="mb-2 text-xs text-blue-600 dark:text-blue-400">{message}</p>
      )}
      <textarea
        value={reason}
        onChange={e => setReason(e.target.value)}
        placeholder="遅延理由を入力してください..."
        rows={2}
        className="w-full rounded-lg border border-red-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-red-500 focus:outline-none dark:border-red-700 dark:bg-gray-800 dark:text-white"
      />
      <button
        onClick={handleSubmit}
        disabled={pending || !reason.trim()}
        className="mt-2 rounded-lg bg-red-600 px-4 py-1.5 text-xs font-medium text-white hover:bg-red-700 disabled:opacity-50"
      >
        {pending ? '提出中...' : '遅延理由を提出'}
      </button>
    </div>
  )
}
