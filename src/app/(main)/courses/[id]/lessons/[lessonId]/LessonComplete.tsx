'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'

export default function LessonComplete({ lessonId, isCompleted }: { lessonId: string; isCompleted: boolean }) {
  const [completed, setCompleted] = useState(isCompleted)
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  async function handleComplete() {
    setLoading(true)
    const supabase = createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return

    await supabase
      .from('lesson_progress')
      .upsert({
        user_id: user.id,
        lesson_id: lessonId,
        is_completed: true,
        completed_at: new Date().toISOString(),
      }, { onConflict: 'user_id,lesson_id' })

    setCompleted(true)
    setLoading(false)
    router.refresh()
  }

  if (completed) {
    return (
      <span className="rounded-lg bg-green-100 px-4 py-2 text-sm font-medium text-green-700">
        완료됨 ✓
      </span>
    )
  }

  return (
    <button
      onClick={handleComplete}
      disabled={loading}
      className="rounded-lg bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700 disabled:opacity-50"
    >
      {loading ? '저장 중...' : '학습 완료'}
    </button>
  )
}
