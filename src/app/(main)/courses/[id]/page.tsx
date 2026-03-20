import Link from 'next/link'
import { notFound, redirect } from 'next/navigation'
import Badge from '@/components/ui/Badge'
import Card from '@/components/ui/Card'
import EnrollButton from './EnrollButton'
import { createClient } from '@/lib/supabase/server'
import { getCoursesWithProgress } from '@/lib/course-progress'
import { fromCsCourseId } from '@/lib/cs-course'

interface Params {
  id: string
}

export default async function CoursePage({ params }: { params: Promise<Params> }) {
  const { id } = await params

  const csSlug = fromCsCourseId(id)
  if (csSlug) {
    redirect(`/cs/${csSlug}`)
  }

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  const { data: course } = await supabase.from('courses').select('*').eq('id', id).single()
  if (!course) notFound()

  if (user && course.subcategory) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (profile?.role !== 'admin') {
      const coursesWithProgress = await getCoursesWithProgress(
        supabase,
        user.id,
        course.subcategory,
        false
      )
      const thisCourse = coursesWithProgress.find((item) => item.id === id)
      if (thisCourse?.isLocked) {
        redirect(`/dev/${course.subcategory}`)
      }
    }
  }

  const { data: lessons } = await supabase
    .from('lessons')
    .select('*')
    .eq('course_id', id)
    .order('sort_order', { ascending: true })

  let enrolled = false
  const completedLessonIds = new Set<string>()
  if (user) {
    const { data: enrollment } = await supabase
      .from('enrollments')
      .select('id')
      .eq('user_id', user.id)
      .eq('course_id', id)
      .single()
    enrolled = !!enrollment

    if (enrollment) {
      const { data: progressRows } = await supabase
        .from('lesson_progress')
        .select('lesson_id')
        .eq('enrollment_id', enrollment.id)
        .eq('status', 'completed')
      progressRows?.forEach((row) => completedLessonIds.add(row.lesson_id))
    }
  }

  const completedCount = lessons?.filter((lesson) => completedLessonIds.has(lesson.id)).length ?? 0
  const totalLessons = lessons?.length ?? 0
  const progress = totalLessons > 0 ? Math.round((completedCount / totalLessons) * 100) : 0

  return (
    <div>
      <div className="mb-6">
        <Badge label={course.category} variant="default" />
        <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{course.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{course.description}</p>
      </div>

      {!enrolled ? (
        <EnrollButton courseId={course.id} />
      ) : (
        <div className="mb-6">
          <div className="flex items-center gap-3">
            <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
              <div className="h-2 rounded-full bg-green-500" style={{ width: `${progress}%` }} />
            </div>
            <span className="text-sm text-gray-600 dark:text-gray-400">{progress}% 進捗</span>
          </div>
        </div>
      )}

      <Card title={`レッスン (${totalLessons})`}>
        {!lessons?.length ? (
          <p className="py-4 text-center text-sm text-gray-400 dark:text-gray-500">
            レッスンがまだ登録されていません。
          </p>
        ) : (
          <div className="divide-y divide-gray-100 dark:divide-gray-700">
            {lessons.map((lesson, index) => {
              const completed = completedLessonIds.has(lesson.id)
              return (
                <Link
                  key={lesson.id}
                  href={enrolled ? `/courses/${id}/lessons/${lesson.id}` : '#'}
                  className={`flex items-center gap-4 py-3 ${
                    enrolled ? 'hover:bg-gray-50 dark:hover:bg-gray-700' : 'cursor-default opacity-60'
                  }`}
                >
                  <div
                    className={`flex h-8 w-8 items-center justify-center rounded-full text-xs font-bold ${
                      completed
                        ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-300'
                        : 'bg-gray-100 text-gray-500 dark:bg-gray-700 dark:text-gray-400'
                    }`}
                  >
                    {completed ? '✓' : index + 1}
                  </div>
                  <div className="flex-1">
                    <p className="text-sm font-medium text-gray-900 dark:text-white">
                      {lesson.title}
                    </p>
                  </div>
                </Link>
              )
            })}
          </div>
        )}
      </Card>
    </div>
  )
}
