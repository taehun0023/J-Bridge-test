'use client'

import { useState, useTransition } from 'react'
import { CheckCircle2 } from 'lucide-react'
import { markDevLessonComplete } from '@/app/actions/dev-progress'

export default function DevLessonCompleteButton({
  lessonId,
  courseId,
  isCompleted: initialCompleted,
}: {
  lessonId: string
  courseId: string
  isCompleted: boolean
}) {
  const [isCompleted, setIsCompleted] = useState(initialCompleted)
  const [pending, startTransition] = useTransition()

  function handleComplete() {
    startTransition(async () => {
      const result = await markDevLessonComplete(lessonId, courseId)
      if (result.success) {
        setIsCompleted(true)
      }
    })
  }

  if (isCompleted) {
    return (
      <div className="flex items-center gap-2 text-green-600 dark:text-green-400">
        <CheckCircle2 className="h-5 w-5" />
        <span className="text-sm font-medium">完了済み</span>
      </div>
    )
  }

  return (
    <button
      onClick={handleComplete}
      disabled={pending}
      className="rounded-lg bg-orange-600 px-5 py-2 text-sm font-medium text-white transition-colors hover:bg-orange-500 disabled:opacity-50"
    >
      {pending ? '処理中...' : '完了にする'}
    </button>
  )
}
