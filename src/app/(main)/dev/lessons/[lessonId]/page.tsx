import { notFound, redirect } from 'next/navigation'
import DevStaticLessonPage from '@/components/dev/DevStaticLessonPage'
import { getDevLessonDetail, getDevSubjectContent } from '@/lib/dev-content'
import { createClient } from '@/lib/supabase/server'
import { toDevCourseId } from '@/lib/dev-course'

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

  const [{ data: progress }, subjectContent, { data: profile }] = await Promise.all([
    supabase
      .from('dev_lesson_progress')
      .select('status')
      .eq('user_id', user.id)
      .eq('lesson_id', lessonId)
      .single(),
    getDevSubjectContent(lesson.subjectSlug),
    supabase.from('profiles').select('role').eq('id', user.id).single(),
  ])

  const isCompleted = progress?.status === 'completed'
  // 관리자는 문제를 풀지 않아도 다음으로 넘어갈 수 있게 한다.
  const isAdmin = profile?.role === 'admin'

  // Compute prev/next lesson navigation
  const allLessons = subjectContent?.modules.flatMap((m) => m.lessons) ?? []
  const currentIndex = allLessons.findIndex((l) => l.lessonId === lessonId)
  const previousLessonHref =
    currentIndex > 0 ? `/dev/lessons/${allLessons[currentIndex - 1].lessonId}` : null
  const nextLessonHref =
    currentIndex >= 0 && currentIndex < allLessons.length - 1
      ? `/dev/lessons/${allLessons[currentIndex + 1].lessonId}`
      : null

  return (
    <DevStaticLessonPage
      lesson={lesson}
      initialLang={initialLang}
      lessonId={lessonId}
      courseId={courseId}
      isCompleted={isCompleted}
      isAdmin={isAdmin}
      previousLessonHref={previousLessonHref}
      nextLessonHref={nextLessonHref}
    />
  )
}
