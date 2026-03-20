'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { createClient } from '@/lib/supabase/client'

interface Props {
  lessonId: string
  courseId: string
  isCompleted: boolean
  enrollmentId: string | null
  progressKind?: 'db' | 'cs'
  allLessonIds?: string[]
}

export default function LessonComplete({
  lessonId,
  courseId,
  isCompleted,
  enrollmentId,
  progressKind = 'db',
  allLessonIds = [],
}: Props) {
  const [completed, setCompleted] = useState(isCompleted)
  const [loading, setLoading] = useState(false)
  const router = useRouter()

  async function handleComplete() {
    setLoading(true)
    const supabase = createClient()
    const {
      data: { user },
    } = await supabase.auth.getUser()

    if (!user) {
      setLoading(false)
      return
    }

    if (progressKind === 'cs') {
      await supabase
        .from('cs_course_progress')
        .upsert(
          {
            user_id: user.id,
            course_id: courseId,
          },
          { onConflict: 'user_id,course_id' }
        )

      await supabase
        .from('cs_lesson_progress')
        .upsert(
          {
            user_id: user.id,
            lesson_id: lessonId,
            course_id: courseId,
            status: 'completed',
            completed_at: new Date().toISOString(),
          },
          { onConflict: 'user_id,lesson_id' }
        )

      const { data: progressRows } = await supabase
        .from('cs_lesson_progress')
        .select('lesson_id')
        .eq('user_id', user.id)
        .eq('course_id', courseId)
        .eq('status', 'completed')

      const completedIds = new Set((progressRows ?? []).map((row) => row.lesson_id))
      const isCourseCompleted =
        allLessonIds.length > 0 && allLessonIds.every((id) => completedIds.has(id))

      if (isCourseCompleted) {
        await supabase
          .from('cs_course_progress')
          .update({ completed_at: new Date().toISOString() })
          .eq('user_id', user.id)
          .eq('course_id', courseId)
      }

      setCompleted(true)
      setLoading(false)
      router.refresh()
      return
    }

    if (!enrollmentId) {
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
        .upsert(
          {
            enrollment_id: enrollment.id,
            lesson_id: lessonId,
            status: 'completed',
            progress_pct: 100,
            completed_at: new Date().toISOString(),
          },
          { onConflict: 'enrollment_id,lesson_id' }
        )

      setCompleted(true)
      setLoading(false)
      router.refresh()
      return
    }

    await supabase
      .from('lesson_progress')
      .upsert(
        {
          enrollment_id: enrollmentId,
          lesson_id: lessonId,
          status: 'completed',
          progress_pct: 100,
          completed_at: new Date().toISOString(),
        },
        { onConflict: 'enrollment_id,lesson_id' }
      )

    setCompleted(true)
    setLoading(false)
    router.refresh()
  }

  if (completed) {
    return (
      <span className="rounded-lg bg-green-100 px-4 py-2 text-sm font-medium text-green-700 dark:bg-green-900/30 dark:text-green-300">
        完了済み
      </span>
    )
  }

  return (
    <button
      onClick={handleComplete}
      disabled={loading}
      className="rounded-lg bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700 disabled:opacity-50"
    >
      {loading ? '処理中...' : '完了にする'}
    </button>
  )
}
