'use server'

import { requireAuth } from '@/lib/auth-helpers'
import {
  ensureDevCourseStarted,
  markDevLessonCompleted as markCompleted,
  getDevCourseBySubject,
} from '@/lib/dev-course'
import type { DevSubjectSlug } from '@/lib/dev-content'

export async function markDevLessonComplete(lessonId: string, courseId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // Ensure course is started
  await ensureDevCourseStarted(supabase, user.id, courseId)

  // Figure out slug from courseId
  const slug = courseId.replace(/^dev-/, '') as DevSubjectSlug
  const course = await getDevCourseBySubject(supabase, slug, user.id)
  const totalLessons = course?.totalLessons ?? 0

  await markCompleted(supabase, user.id, lessonId, courseId, totalLessons)

  return { success: true }
}

export async function getDevSubjectProgress(userId: string, courseId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { completedLessonIds: [] as string[], completedCount: 0 }
  const { supabase } = auth

  const { data: lessonProgress } = await supabase
    .from('dev_lesson_progress')
    .select('lesson_id, status')
    .eq('user_id', userId)
    .eq('course_id', courseId)
    .eq('status', 'completed')

  return {
    completedLessonIds: (lessonProgress ?? []).map((row) => row.lesson_id),
    completedCount: lessonProgress?.length ?? 0,
  }
}
