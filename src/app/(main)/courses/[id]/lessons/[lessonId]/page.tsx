import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import Card from '@/components/ui/Card'
import LessonComplete from './LessonComplete'
import Link from 'next/link'

interface Params { id: string; lessonId: string }

export default async function LessonPage({ params }: { params: Promise<Params> }) {
  const { id: courseId, lessonId } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

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

  // Check if already completed
  let isCompleted = false
  if (user) {
    const { data: progress } = await supabase
      .from('lesson_progress')
      .select('is_completed')
      .eq('user_id', user.id)
      .eq('lesson_id', lessonId)
      .single()
    isCompleted = progress?.is_completed ?? false
  }

  // Get all lessons for nav
  const { data: allLessons } = await supabase
    .from('lessons')
    .select('id, title, sort_order')
    .eq('course_id', courseId)
    .order('sort_order', { ascending: true })

  const currentIndex = allLessons?.findIndex(l => l.id === lessonId) ?? 0
  const prevLesson = allLessons?.[currentIndex - 1]
  const nextLesson = allLessons?.[currentIndex + 1]

  return (
    <div className="mx-auto max-w-4xl">
      {/* Breadcrumb */}
      <div className="mb-4 flex items-center gap-2 text-sm text-gray-500">
        <Link href={`/courses/${courseId}`} className="hover:text-blue-600">
          {course?.title ?? '코스'}
        </Link>
        <span>/</span>
        <span className="text-gray-900">{lesson.title}</span>
      </div>

      <Card>
        <h1 className="text-xl font-bold text-gray-900">{lesson.title}</h1>
        <div className="mt-1 text-sm text-gray-500">
          {lesson.duration_minutes && `${lesson.duration_minutes}분`}
        </div>

        {/* Content */}
        <div className="mt-6 prose prose-sm max-w-none">
          {lesson.content_body ? (
            <div className="whitespace-pre-wrap text-gray-700">{lesson.content_body}</div>
          ) : lesson.content_url ? (
            <div>
              {lesson.content_type === 'video' ? (
                <div className="aspect-video rounded-lg bg-gray-900 flex items-center justify-center">
                  <p className="text-gray-400">영상 준비 중</p>
                </div>
              ) : (
                <a href={lesson.content_url} className="text-blue-600 hover:underline" target="_blank" rel="noreferrer">
                  콘텐츠 링크
                </a>
              )}
            </div>
          ) : (
            <p className="text-gray-400">콘텐츠가 아직 등록되지 않았습니다.</p>
          )}
        </div>
      </Card>

      {/* Complete + Navigation */}
      <div className="mt-6 flex items-center justify-between">
        <div>
          {prevLesson && (
            <Link
              href={`/courses/${courseId}/lessons/${prevLesson.id}`}
              className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"
            >
              &larr; {prevLesson.title}
            </Link>
          )}
        </div>

        <LessonComplete
          lessonId={lessonId}
          isCompleted={isCompleted}
        />

        <div>
          {nextLesson && (
            <Link
              href={`/courses/${courseId}/lessons/${nextLesson.id}`}
              className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
            >
              {nextLesson.title} &rarr;
            </Link>
          )}
        </div>
      </div>
    </div>
  )
}
