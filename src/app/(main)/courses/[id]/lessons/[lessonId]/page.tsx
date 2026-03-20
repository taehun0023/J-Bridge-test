import Link from 'next/link'
import { ClipboardCheck } from 'lucide-react'
import { notFound, redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import LessonContentToggle from '@/components/ui/LessonContentToggle'
import CsStaticLessonPage from '@/components/cs/CsStaticLessonPage'
import LessonComplete from './LessonComplete'
import { createClient } from '@/lib/supabase/server'
import {
  ensureCsCourseStarted,
  fromCsCourseId,
  getCsLessonByCourseAndLessonId,
} from '@/lib/cs-course'
import { getCsQuizListHref, getCsQuizSetByLessonId } from '@/lib/cs-quiz'

interface Params {
  id: string
  lessonId: string
}

export default async function LessonPage({
  params,
  searchParams,
}: {
  params: Promise<Params>
  searchParams: Promise<{ lang?: string }>
}) {
  const { id: courseId, lessonId } = await params
  const { lang } = await searchParams

  if (fromCsCourseId(courseId)) {
    return <CsCourseLessonPage courseId={courseId} lessonId={lessonId} lang={lang} />
  }

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  const { data: lesson } = await supabase
    .from('lessons')
    .select('*')
    .eq('id', lessonId)
    .single()
  if (!lesson) notFound()

  const { data: course } = await supabase
    .from('courses')
    .select('title')
    .eq('id', courseId)
    .single()

  let isCompleted = false
  let enrollmentId: string | null = null
  if (user) {
    const { data: enrollment } = await supabase
      .from('enrollments')
      .select('id')
      .eq('user_id', user.id)
      .eq('course_id', courseId)
      .single()

    if (enrollment) {
      enrollmentId = enrollment.id
      const { data: progress } = await supabase
        .from('lesson_progress')
        .select('status')
        .eq('enrollment_id', enrollment.id)
        .eq('lesson_id', lessonId)
        .single()
      isCompleted = progress?.status === 'completed'
    }
  }

  const { data: quiz } = await supabase
    .from('quizzes')
    .select('id, title')
    .eq('lesson_id', lessonId)
    .single()

  const { data: allLessons } = await supabase
    .from('lessons')
    .select('id, title, sort_order')
    .eq('course_id', courseId)
    .order('sort_order', { ascending: true })

  const currentIndex = allLessons?.findIndex((item) => item.id === lessonId) ?? 0
  const prevLesson = allLessons?.[currentIndex - 1]
  const nextLesson = allLessons?.[currentIndex + 1]

  return (
    <div className="mx-auto max-w-4xl">
      <div className="mb-4 flex items-center gap-2 text-sm text-gray-500">
        <Link href={`/courses/${courseId}`} className="hover:text-blue-600">
          {course?.title ?? 'Course'}
        </Link>
        <span>/</span>
        <span className="text-gray-900 dark:text-white">{lesson.title}</span>
      </div>

      <Card>
        <h1 className="text-xl font-bold text-gray-900 dark:text-white">{lesson.title}</h1>

        <div className="mt-6">
          {lesson.content_body ? (
            <LessonContentToggle contentJa={lesson.content_body} contentKo={lesson.content_body_ko} />
          ) : lesson.content_url ? (
            <div>
              {lesson.content_type === 'video' ? (
                <div className="flex aspect-video items-center justify-center rounded-lg bg-gray-900">
                  <p className="text-gray-400">動画コンテンツ</p>
                </div>
              ) : (
                <a
                  href={lesson.content_url}
                  className="text-blue-600 hover:underline"
                  target="_blank"
                  rel="noreferrer"
                >
                  外部コンテンツを開く
                </a>
              )}
            </div>
          ) : (
            <p className="text-gray-400">コンテンツが登録されていません</p>
          )}
        </div>
      </Card>

      {quiz && (
        <div className="mt-4">
          <Card>
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <ClipboardCheck className="h-5 w-5 text-indigo-500" />
                <div>
                  <p className="font-medium text-gray-900 dark:text-white">理解度チェック</p>
                  <p className="text-sm text-gray-500 dark:text-gray-400">
                    このレッスンに対応するクイズへ進めます
                  </p>
                </div>
              </div>
              <Link
                href={`/courses/${courseId}/lessons/${lessonId}/quiz/${quiz.id}`}
                className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-indigo-500"
              >
                クイズを開く
              </Link>
            </div>
          </Card>
        </div>
      )}

      <div className="mt-6 flex items-center justify-between">
        <div>
          {prevLesson && (
            <Link
              href={`/courses/${courseId}/lessons/${prevLesson.id}`}
              className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-800"
            >
              &larr; 前へ
            </Link>
          )}
        </div>

        <LessonComplete
          lessonId={lessonId}
          courseId={courseId}
          isCompleted={isCompleted}
          enrollmentId={enrollmentId}
        />

        <div>
          {nextLesson && (
            <Link
              href={`/courses/${courseId}/lessons/${nextLesson.id}`}
              className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
            >
              次へ &rarr;
            </Link>
          )}
        </div>
      </div>
    </div>
  )
}

async function CsCourseLessonPage({
  courseId,
  lessonId,
  lang,
}: {
  courseId: string
  lessonId: string
  lang?: string
}) {
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  let isAdmin = false
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()
    isAdmin = profile?.role === 'admin'
  }

  const detail = await getCsLessonByCourseAndLessonId(
    supabase,
    courseId,
    lessonId,
    user?.id ?? null,
    isAdmin
  )
  if (!detail) notFound()

  if (user && detail.course.isLocked && !isAdmin) {
    redirect('/cs')
  }

  if (user && !detail.course.isLocked) {
    await ensureCsCourseStarted(supabase, user.id, courseId)
  }

  const initialLang = lang === 'ko' && detail.lesson.contentKo ? 'ko' : 'ja'
  const lessonIds = detail.course.lessons.map((item) => item.lessonId)
  const quizCategory = quizCategoryForCourse(detail.course.slug)
  const quizSet = getCsQuizSetByLessonId(detail.course.slug, detail.lesson.lessonId)
  const quizHref = quizSet
    ? `/cs/quiz/${quizSet.quizId}`
    : quizCategory
      ? getCsQuizListHref(quizCategory)
      : null

  return (
    <CsStaticLessonPage
      lesson={detail.lesson}
      initialLang={initialLang}
      backHref={`/courses/${courseId}`}
      previousLessonHref={
        detail.previousLesson ? `/courses/${courseId}/lessons/${detail.previousLesson.lessonId}` : null
      }
      nextLessonHref={
        detail.nextLesson ? `/courses/${courseId}/lessons/${detail.nextLesson.lessonId}` : null
      }
      quizHref={quizHref}
      completionControl={
        user ? (
          <LessonComplete
            lessonId={lessonId}
            courseId={courseId}
            isCompleted={detail.isCompleted}
            enrollmentId={null}
            progressKind="cs"
            allLessonIds={lessonIds}
          />
        ) : null
      }
    />
  )
}

function quizCategoryForCourse(slug: string) {
  return slug
}
