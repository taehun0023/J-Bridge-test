import type { SupabaseClient } from '@supabase/supabase-js'
import type {
  CsLessonDetail,
  CsLessonSummary,
  CsSubjectContent,
  CsSubjectSlug,
} from './cs-content'
import {
  getAllCsSubjectContents,
  getCsLessonDetail,
  getCsSubjectContent,
} from './cs-content'
import { CS_QUIZ_SET_DEFINITIONS } from './cs-quiz'

export interface CsVirtualCourse {
  id: string
  slug: CsSubjectSlug
  title: string
  description: string
  difficulty: string
  sortOrder: number
  isLocked: boolean
  isCompleted: boolean
  totalLessons: number
  completedLessons: number
  totalQuizzes: number
  passedQuizzes: number
  lessons: Array<CsLessonSummary & { isCompleted: boolean }>
}

export interface CsVirtualLessonDetail {
  course: CsVirtualCourse
  lesson: CsLessonDetail
  isCompleted: boolean
  previousLesson: CsLessonSummary | null
  nextLesson: CsLessonSummary | null
}

const SUBJECT_SORT_ORDER: Record<CsSubjectSlug, number> = {
  'basic-theory': 10,
  'data-structures': 20,
  algorithms: 30,
  'computer-architecture': 40,
  'operating-systems': 50,
  database: 60,
  networking: 70,
  security: 80,
}

const QUIZ_CATEGORY_BY_SUBJECT: Record<CsSubjectSlug, string | null> = {
  'basic-theory': 'basic_theory',
  'data-structures': 'data_structure',
  algorithms: 'algorithm',
  'computer-architecture': null,
  'operating-systems': 'os',
  database: 'database',
  networking: 'network',
  security: 'security',
}

type CsProgressRow = {
  course_id: string
  completed_at: string | null
}

type CsLessonProgressRow = {
  lesson_id: string
  course_id: string
  status: 'started' | 'completed'
  completed_at: string | null
}

export function toCsCourseId(slug: CsSubjectSlug) {
  return `cs-${slug}` as const
}

export function fromCsCourseId(courseId: string): CsSubjectSlug | null {
  const slug = courseId.replace(/^cs-/, '') as CsSubjectSlug
  const validSlugs: CsSubjectSlug[] = [
    'basic-theory',
    'data-structures',
    'algorithms',
    'computer-architecture',
    'operating-systems',
    'database',
    'networking',
    'security',
  ]

  return validSlugs.includes(slug) ? slug : null
}

export function isCsCourseCompleted(totalLessons: number, completedLessons: number) {
  return totalLessons > 0 && completedLessons === totalLessons
}

export function buildCsLockState(
  subjects: CsSubjectContent[],
  completedCourseIds: Set<string>,
  isAdmin: boolean
) {
  const lockMap = new Map<string, boolean>()
  let previousCompleted = true

  for (const subject of subjects) {
    const courseId = toCsCourseId(subject.slug)
    const isLocked = isAdmin ? false : !previousCompleted
    lockMap.set(courseId, isLocked)
    previousCompleted = completedCourseIds.has(courseId)
  }

  return lockMap
}

async function getPassedQuizMap(
  supabase: SupabaseClient,
  userId: string
): Promise<Map<string, { total: number; passed: number }>> {
  const { data: quizzes } = await supabase
    .from('quizzes')
    .select('id, title')
    .eq('quiz_type', 'cs_knowledge')
    .eq('is_pool', true)

  const quizRows = quizzes ?? []
  const quizIds = quizRows.map((quiz) => quiz.id)
  const passedMap = new Set<string>()

  if (quizIds.length > 0) {
    const { data: attempts } = await supabase
      .from('quiz_attempts')
      .select('quiz_id')
      .eq('user_id', userId)
      .eq('passed', true)
      .in('quiz_id', quizIds)

    for (const attempt of attempts ?? []) {
      passedMap.add(attempt.quiz_id)
    }
  }

  const result = new Map<string, { total: number; passed: number }>()
  const quizIdsByCourse = new Map<string, string[]>()

  for (const quizSet of CS_QUIZ_SET_DEFINITIONS) {
    const courseId = `cs-${quizSet.category.replaceAll('_', '-')}`
      .replace('data-structure', 'data-structures')
      .replace('basic-theory', 'basic-theory')
      .replace('computer-architecture', 'computer-architecture')
      .replace('network', 'networking')
      .replace('os', 'operating-systems')
    const list = quizIdsByCourse.get(courseId) ?? []
    list.push(quizSet.quizId)
    quizIdsByCourse.set(courseId, list)
  }

  for (const [subjectSlug, category] of Object.entries(QUIZ_CATEGORY_BY_SUBJECT) as Array<
    [CsSubjectSlug, string | null]
  >) {
    const courseId = toCsCourseId(subjectSlug)
    const relevantQuizIds = category ? quizIdsByCourse.get(courseId) ?? [] : []
    const relevantQuizzes = quizRows.filter((quiz) => relevantQuizIds.includes(quiz.id))
    result.set(courseId, {
      total: relevantQuizzes.length,
      passed: relevantQuizzes.filter((quiz) => passedMap.has(quiz.id)).length,
    })
  }

  return result
}

async function getCsProgressState(
  supabase: SupabaseClient,
  userId: string
) {
  const [{ data: courseProgress }, { data: lessonProgress }] = await Promise.all([
    supabase
      .from('cs_course_progress')
      .select('course_id, completed_at')
      .eq('user_id', userId),
    supabase
      .from('cs_lesson_progress')
      .select('lesson_id, course_id, status, completed_at')
      .eq('user_id', userId),
  ])

  return {
    courseProgress: (courseProgress ?? []) as CsProgressRow[],
    lessonProgress: (lessonProgress ?? []) as CsLessonProgressRow[],
  }
}

function buildVirtualCourse(
  subject: CsSubjectContent,
  lessonProgressRows: CsLessonProgressRow[],
  lockMap: Map<string, boolean>,
  quizMap: Map<string, { total: number; passed: number }>
): CsVirtualCourse {
  const courseId = toCsCourseId(subject.slug)
  const completedLessonIds = new Set(
    lessonProgressRows
      .filter((row) => row.course_id === courseId && row.status === 'completed')
      .map((row) => row.lesson_id)
  )
  const completedLessons = subject.lessons.filter((lesson) =>
    completedLessonIds.has(lesson.lessonId)
  ).length
  const quizStats = quizMap.get(courseId) ?? { total: 0, passed: 0 }

  return {
    id: courseId,
    slug: subject.slug,
    title: subject.title,
    description: subject.description,
    difficulty: subject.level,
    sortOrder: SUBJECT_SORT_ORDER[subject.slug],
    isLocked: lockMap.get(courseId) ?? false,
    isCompleted: isCsCourseCompleted(subject.lessons.length, completedLessons),
    totalLessons: subject.lessons.length,
    completedLessons,
    totalQuizzes: quizStats.total,
    passedQuizzes: quizStats.passed,
    lessons: subject.lessons.map((lesson) => ({
      ...lesson,
      isCompleted: completedLessonIds.has(lesson.lessonId),
    })),
  }
}

export async function ensureCsCourseStarted(
  supabase: SupabaseClient,
  userId: string,
  courseId: string
) {
  await supabase
    .from('cs_course_progress')
    .upsert(
      {
        user_id: userId,
        course_id: courseId,
      },
      { onConflict: 'user_id,course_id' }
    )
}

export async function getAllCsCoursesWithProgress(
  supabase: SupabaseClient,
  userId: string | null,
  isAdmin: boolean
): Promise<CsVirtualCourse[]> {
  const subjects = await getAllCsSubjectContents()
  const quizMap = userId ? await getPassedQuizMap(supabase, userId) : new Map()

  if (!userId) {
    const lockMap = buildCsLockState(subjects, new Set<string>(), isAdmin)
    return subjects.map((subject, index) => ({
      ...buildVirtualCourse(subject, [], lockMap, quizMap),
      isLocked: isAdmin ? false : index > 0,
    }))
  }

  const { courseProgress, lessonProgress } = await getCsProgressState(supabase, userId)
  const completedCourseIds = new Set(
    courseProgress.filter((row) => row.completed_at).map((row) => row.course_id)
  )
  const lockMap = buildCsLockState(subjects, completedCourseIds, isAdmin)

  return subjects.map((subject) =>
    buildVirtualCourse(subject, lessonProgress, lockMap, quizMap)
  )
}

export async function getCsCourseById(
  supabase: SupabaseClient,
  courseId: string,
  userId: string | null,
  isAdmin: boolean
): Promise<CsVirtualCourse | null> {
  const slug = fromCsCourseId(courseId)
  if (!slug) return null

  const subjects = await getAllCsCoursesWithProgress(supabase, userId, isAdmin)
  return subjects.find((subject) => subject.id === courseId) ?? null
}

export async function getCsLessonByCourseAndLessonId(
  supabase: SupabaseClient,
  courseId: string,
  lessonId: string,
  userId: string | null,
  isAdmin: boolean
): Promise<CsVirtualLessonDetail | null> {
  const course = await getCsCourseById(supabase, courseId, userId, isAdmin)
  if (!course) return null

  const lesson = await getCsLessonDetail(lessonId)
  if (!lesson || lesson.subjectSlug !== course.slug) return null

  const lessonIndex = course.lessons.findIndex((item) => item.lessonId === lessonId)
  if (lessonIndex === -1) return null

  const previousLesson = lessonIndex > 0 ? course.lessons[lessonIndex - 1] : null
  const nextLesson = lessonIndex < course.lessons.length - 1 ? course.lessons[lessonIndex + 1] : null

  return {
    course,
    lesson,
    isCompleted: course.lessons[lessonIndex]?.isCompleted ?? false,
    previousLesson,
    nextLesson,
  }
}

export async function getThinCsSubjectPageData(slug: CsSubjectSlug) {
  const subject = await getCsSubjectContent(slug)
  if (!subject) return null

  return {
    ...subject,
    courseId: toCsCourseId(slug),
  }
}
