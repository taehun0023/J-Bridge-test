import type { SupabaseClient } from '@supabase/supabase-js'

export interface CourseWithProgress {
  id: string
  title: string
  description: string | null
  difficulty: string
  sort_order: number
  isLocked: boolean
  isCompleted: boolean
  totalQuizzes: number
  passedQuizzes: number
}

/**
 * Fetch published courses for a subcategory with per-course quiz completion progress.
 * First course is always unlocked; subsequent courses require all quizzes of the previous course to be passed.
 * Admins bypass all locks.
 */
export async function getCoursesWithProgress(
  supabase: SupabaseClient,
  userId: string,
  subcategory: string,
  isAdmin: boolean
): Promise<CourseWithProgress[]> {
  // 1. Fetch published courses
  const { data: courses } = await supabase
    .from('courses')
    .select('id, title, description, difficulty, sort_order')
    .eq('is_published', true)
    .eq('subcategory', subcategory)
    .order('sort_order', { ascending: true })

  if (!courses?.length) return []

  const courseIds = courses.map(c => c.id)

  // 2. Fetch lessons for these courses
  const { data: lessons } = await supabase
    .from('lessons')
    .select('id, course_id')
    .in('course_id', courseIds)

  const lessonIds = lessons?.map(l => l.id) ?? []

  // 3. Fetch quizzes mapped to lessons
  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('id, lesson_id')
    .in('lesson_id', lessonIds.length > 0 ? lessonIds : ['__none__'])

  // 4. Fetch user's passing quiz attempts
  const quizIds = quizzes?.map(q => q.id) ?? []
  const { data: passedAttempts } = await supabase
    .from('quiz_attempts')
    .select('quiz_id')
    .eq('user_id', userId)
    .eq('passed', true)
    .in('quiz_id', quizIds.length > 0 ? quizIds : ['__none__'])

  const passedQuizIds = new Set(passedAttempts?.map(a => a.quiz_id) ?? [])

  // Build lesson→course and quiz→lesson maps
  const lessonToCourse = new Map<string, string>()
  for (const l of lessons ?? []) {
    lessonToCourse.set(l.id, l.course_id)
  }

  // courseId → quiz ids
  const courseQuizMap = new Map<string, string[]>()
  for (const q of quizzes ?? []) {
    const courseId = lessonToCourse.get(q.lesson_id)
    if (!courseId) continue
    const arr = courseQuizMap.get(courseId) ?? []
    arr.push(q.id)
    courseQuizMap.set(courseId, arr)
  }

  // 5. Calculate lock/completion state sequentially
  const result: CourseWithProgress[] = []
  let previousCompleted = true // first course is always unlocked

  for (const course of courses) {
    const quizIdsForCourse = courseQuizMap.get(course.id) ?? []
    const totalQuizzes = quizIdsForCourse.length
    const passedCount = quizIdsForCourse.filter(qid => passedQuizIds.has(qid)).length
    const isCompleted = totalQuizzes > 0 && passedCount >= totalQuizzes
    const isLocked = isAdmin ? false : !previousCompleted

    result.push({
      id: course.id,
      title: course.title,
      description: course.description,
      difficulty: course.difficulty,
      sort_order: course.sort_order,
      isLocked,
      isCompleted,
      totalQuizzes,
      passedQuizzes: passedCount,
    })

    previousCompleted = isCompleted
  }

  return result
}
