import type { SupabaseClient } from '@supabase/supabase-js'
import type { DevSubjectSlug, DevLessonSummary, DevSubjectContent } from './dev-content'
import { getDevSubjectContent } from './dev-content'

export interface DevVirtualCourse {
  id: string
  slug: DevSubjectSlug
  title: string
  description: string
  difficulty: string
  totalLessons: number
  completedLessons: number
  lessons: Array<DevVirtualLesson>
}

export interface DevVirtualLesson extends DevLessonSummary {
  isCompleted: boolean
  difficulty: string
}

const SUBJECT_ORDER: DevSubjectSlug[] = [
  'common-workplace-fundamentals',
  'java',
  'javascript',
  'python',
  'sql',
  'spring-boot',
  'react',
  'nextjs',
]

const SUBJECT_TITLES: Record<DevSubjectSlug, string> = {
  'common-workplace-fundamentals': '共通業務基礎',
  java: 'Java',
  javascript: 'JavaScript',
  python: 'Python',
  sql: 'SQL',
  'spring-boot': 'Spring Boot',
  react: 'React',
  nextjs: 'Next.js',
}

type DevProgressRow = {
  course_id: string
  completed_at: string | null
}

type DevLessonProgressRow = {
  lesson_id: string
  course_id: string
  status: 'started' | 'completed'
}

export function toDevCourseId(slug: DevSubjectSlug) {
  return `dev-${slug}` as const
}

function flattenLessons(subject: DevSubjectContent): Array<DevLessonSummary & { difficulty: string }> {
  const lessons: Array<DevLessonSummary & { difficulty: string }> = []
  for (const mod of subject.modules) {
    for (const lesson of mod.lessons) {
      lessons.push({ ...lesson, difficulty: mod.level })
    }
  }
  return lessons
}

async function getDevProgressState(supabase: SupabaseClient, userId: string) {
  const [{ data: courseProgress }, { data: lessonProgress }] = await Promise.all([
    supabase
      .from('dev_course_progress')
      .select('course_id, completed_at')
      .eq('user_id', userId),
    supabase
      .from('dev_lesson_progress')
      .select('lesson_id, course_id, status')
      .eq('user_id', userId),
  ])

  return {
    courseProgress: (courseProgress ?? []) as DevProgressRow[],
    lessonProgress: (lessonProgress ?? []) as DevLessonProgressRow[],
  }
}

function buildVirtualCourse(
  subject: DevSubjectContent,
  lessonProgressRows: DevLessonProgressRow[]
): DevVirtualCourse {
  const courseId = toDevCourseId(subject.slug)
  const flatLessons = flattenLessons(subject)
  const completedLessonIds = new Set(
    lessonProgressRows
      .filter((row) => row.course_id === courseId && row.status === 'completed')
      .map((row) => row.lesson_id)
  )
  const completedLessons = flatLessons.filter((lesson) =>
    completedLessonIds.has(lesson.lessonId)
  ).length

  return {
    id: courseId,
    slug: subject.slug,
    title: SUBJECT_TITLES[subject.slug],
    description: subject.modules[0]?.description ?? '',
    difficulty: subject.modules[0]?.level ?? 'foundation',
    totalLessons: flatLessons.length,
    completedLessons,
    lessons: flatLessons.map((lesson) => ({
      ...lesson,
      isCompleted: completedLessonIds.has(lesson.lessonId),
    })),
  }
}

export interface DevResumeTarget {
  course: DevVirtualCourse
  lesson: DevVirtualLesson
}

/** SUBJECT_ORDER · 모듈 난이도 순으로 정렬된 courses에서 첫 미완료 레슨을 찾는다. 전부 완료면 null. */
export function findResumeLesson(courses: DevVirtualCourse[]): DevResumeTarget | null {
  for (const course of courses) {
    const lesson = course.lessons.find((l) => !l.isCompleted)
    if (lesson) return { course, lesson }
  }
  return null
}

export async function getAllDevCourses(
  supabase: SupabaseClient,
  userId: string | null
): Promise<DevVirtualCourse[]> {
  const subjects = await Promise.all(
    SUBJECT_ORDER.map((slug) => getDevSubjectContent(slug))
  )
  const validSubjects = subjects.filter((s): s is DevSubjectContent => s !== null)

  if (!userId) {
    return validSubjects.map((subject) => buildVirtualCourse(subject, []))
  }

  const { lessonProgress } = await getDevProgressState(supabase, userId)
  return validSubjects.map((subject) => buildVirtualCourse(subject, lessonProgress))
}

export async function getDevCourseBySubject(
  supabase: SupabaseClient,
  slug: DevSubjectSlug,
  userId: string | null
): Promise<DevVirtualCourse | null> {
  const subject = await getDevSubjectContent(slug)
  if (!subject) return null

  if (!userId) {
    return buildVirtualCourse(subject, [])
  }

  const { lessonProgress } = await getDevProgressState(supabase, userId)
  return buildVirtualCourse(subject, lessonProgress)
}

export async function ensureDevCourseStarted(
  supabase: SupabaseClient,
  userId: string,
  courseId: string
) {
  await supabase
    .from('dev_course_progress')
    .upsert(
      { user_id: userId, course_id: courseId },
      { onConflict: 'user_id,course_id' }
    )
}

export async function markDevLessonCompleted(
  supabase: SupabaseClient,
  userId: string,
  lessonId: string,
  courseId: string,
  totalLessons: number
) {
  await supabase
    .from('dev_lesson_progress')
    .upsert(
      {
        user_id: userId,
        lesson_id: lessonId,
        course_id: courseId,
        status: 'completed',
        completed_at: new Date().toISOString(),
      },
      { onConflict: 'user_id,lesson_id' }
    )

  // Check if all lessons in the course are completed
  const { count } = await supabase
    .from('dev_lesson_progress')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', userId)
    .eq('course_id', courseId)
    .eq('status', 'completed')

  if (count && count >= totalLessons) {
    await supabase
      .from('dev_course_progress')
      .upsert(
        {
          user_id: userId,
          course_id: courseId,
          completed_at: new Date().toISOString(),
        },
        { onConflict: 'user_id,course_id' }
      )
  }
}
