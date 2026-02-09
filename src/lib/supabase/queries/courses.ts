import { createClient } from '@/lib/supabase/server'
import type { CourseCategory } from '@/lib/supabase/types'

export async function fetchCourses(category?: CourseCategory) {
  const supabase = await createClient()
  let query = supabase
    .from('courses')
    .select('*')
    .eq('is_published', true)
    .order('sort_order', { ascending: true })

  if (category) {
    query = query.eq('category', category)
  }

  return query
}

export async function fetchCourseById(id: string) {
  const supabase = await createClient()
  return supabase
    .from('courses')
    .select('*')
    .eq('id', id)
    .single()
}

export async function fetchLessons(courseId: string) {
  const supabase = await createClient()
  return supabase
    .from('lessons')
    .select('*')
    .eq('course_id', courseId)
    .order('sort_order', { ascending: true })
}

export async function fetchLessonById(lessonId: string) {
  const supabase = await createClient()
  return supabase
    .from('lessons')
    .select('*')
    .eq('id', lessonId)
    .single()
}
