import { notFound, redirect } from 'next/navigation'
import DevStaticLessonPage from '@/components/dev/DevStaticLessonPage'
import DevLessonCompleteButton from '@/components/dev/DevLessonCompleteButton'
import { getDevLessonDetail, getDevSubjectContent } from '@/lib/dev-content'
import { createClient } from '@/lib/supabase/server'
import { toDevCourseId } from '@/lib/dev-course'
import { DEV_QUIZ_SET_DEFINITIONS } from '@/lib/dev-quiz'

export default async function DevLessonDetailPage({
  params,
  searchParams,
}: {
  params: Promise<{ lessonId: string }>
  searchParams: Promise<Record<string, string | string[] | undefined>>
}) {
  const { lessonId } = await params
  const sp = await searchParams
  const initialLang = sp.lang === 'ko' ? 'ko' : 'ja'
  const lesson = await getDevLessonDetail(lessonId)

  if (!lesson) notFound()

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const courseId = toDevCourseId(lesson.subjectSlug)

  const [{ data: progress }, subjectContent] = await Promise.all([
    supabase
      .from('dev_lesson_progress')
      .select('status')
      .eq('user_id', user.id)
      .eq('lesson_id', lessonId)
      .single(),
    getDevSubjectContent(lesson.subjectSlug),
  ])

  const isCompleted = progress?.status === 'completed'

  // Compute prev/next lesson navigation
  const allLessons = subjectContent?.modules.flatMap((m) => m.lessons) ?? []
  const currentIndex = allLessons.findIndex((l) => l.lessonId === lessonId)
  const previousLessonHref =
    currentIndex > 0 ? `/dev/lessons/${allLessons[currentIndex - 1].lessonId}` : null
  const nextLessonHref =
    currentIndex >= 0 && currentIndex < allLessons.length - 1
      ? `/dev/lessons/${allLessons[currentIndex + 1].lessonId}`
      : null

  const quizDef = DEV_QUIZ_SET_DEFINITIONS.find((d) => d.courseId === courseId)
  const quizHref = quizDef ? `/dev/quiz/${quizDef.quizId}` : null

  return (
    <DevStaticLessonPage
      lesson={lesson}
      initialLang={initialLang}
      previousLessonHref={previousLessonHref}
      nextLessonHref={nextLessonHref}
      quizHref={quizHref}
      completionControl={
        <DevLessonCompleteButton
          lessonId={lessonId}
          courseId={courseId}
          isCompleted={isCompleted}
        />
      }
    />
  )
}
