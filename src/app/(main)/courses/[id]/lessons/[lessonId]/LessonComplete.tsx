'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'

interface Props {
  lessonId: string
  courseId: string
  isCompleted: boolean
  enrollmentId: string | null
}

export default function LessonComplete({ lessonId, courseId, isCompleted, enrollmentId }: Props) {
  const [completed, setCompleted] = useState(isCompleted)
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  async function handleComplete() {
    if (!enrollmentId) {
      // Not enrolled — enroll first, then mark complete
      setLoading(true)
      const supabase = createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) return

      const { data: enrollment } = await supabase
        .from('enrollments')
        .upsert({ user_id: user.id, course_id: courseId }, { onConflict: 'user_id,course_id' })
        .select('id')
        .single()

      if (!enrollment) {
        setLoading(false)
        return
      }

      await supabase
        .from('lesson_progress')
        .upsert({
          enrollment_id: enrollment.id,
          lesson_id: lessonId,
          status: 'completed',
          progress_pct: 100,
          completed_at: new Date().toISOString(),
        }, { onConflict: 'enrollment_id,lesson_id' })

      setCompleted(true)
      setLoading(false)
      router.refresh()
      return
    }

    setLoading(true)
    const supabase = createClient()

    await supabase
      .from('lesson_progress')
      .upsert({
        enrollment_id: enrollmentId,
        lesson_id: lessonId,
        status: 'completed',
        progress_pct: 100,
        completed_at: new Date().toISOString(),
      }, { onConflict: 'enrollment_id,lesson_id' })

    setCompleted(true)
    setLoading(false)
    router.refresh()
  }

  if (completed) {
    return (
      <span className="rounded-lg bg-green-100 px-4 py-2 text-sm font-medium text-green-700 dark:bg-green-900/30 dark:text-green-300">
        完了済み ✓
      </span>
    )
  }

  return (
    <button
      onClick={handleComplete}
      disabled={loading}
      className="rounded-lg bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700 disabled:opacity-50"
    >
      {loading ? '保存中...' : '学習完了'}
    </button>
  )
}
