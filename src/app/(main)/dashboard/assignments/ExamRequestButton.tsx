'use client'

import { useState, useTransition } from 'react'
import { requestExam } from '@/app/actions/comprehensive-exam'
import { GraduationCap } from 'lucide-react'

interface Props {
  category: string
  subcategory: string
  contentLevel: string | null
}

export default function ExamRequestButton({ category, subcategory, contentLevel }: Props) {
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const [requested, setRequested] = useState(false)

  function handleRequest() {
    startTransition(async () => {
      const result = await requestExam(category, subcategory, contentLevel)
      if (result.error) {
        setMessage(result.error)
        setTimeout(() => setMessage(null), 3000)
      } else {
        setRequested(true)
        setMessage('総合試験をリクエストしました')
      }
    })
  }

  if (requested) {
    return (
      <div className="flex items-center gap-2 text-sm text-indigo-600 dark:text-indigo-400">
        <GraduationCap className="h-4 w-4" />
        <span>{message}</span>
      </div>
    )
  }

  return (
    <div>
      {message && (
        <p className="mb-2 text-xs text-red-500">{message}</p>
      )}
      <button
        onClick={handleRequest}
        disabled={pending}
        className="flex items-center gap-2 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-700 disabled:opacity-50 transition-colors"
      >
        <GraduationCap className="h-4 w-4" />
        {pending ? 'リクエスト中...' : '総合試験をリクエスト'}
      </button>
    </div>
  )
}
