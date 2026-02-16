import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import Card from '@/components/ui/Card'
import LessonContentToggle from '@/components/ui/LessonContentToggle'
import LessonComplete from './LessonComplete'
import Link from 'next/link'
import { ClipboardCheck } from 'lucide-react'

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

  // Check enrollment and lesson completion
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

  // Fetch quiz linked to this lesson
  const { data: quiz } = await supabase
    .from('quizzes')
    .select('id, title')
    .eq('lesson_id', lessonId)
    .single()

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
          {course?.title ?? 'コース'}
        </Link>
        <span>/</span>
        <span className="text-gray-900 dark:text-white">{lesson.title}</span>
      </div>

      <Card>
        <h1 className="text-xl font-bold text-gray-900 dark:text-white">{lesson.title}</h1>

        {/* Content */}
        <div className="mt-6">
          {lesson.content_body ? (
            <LessonContentToggle contentJa={lesson.content_body} contentKo={lesson.content_body_ko} />
          ) : lesson.content_url ? (
            <div>
              {lesson.content_type === 'video' ? (
                <div className="aspect-video rounded-lg bg-gray-900 flex items-center justify-center">
                  <p className="text-gray-400">動画準備中</p>
                </div>
              ) : (
                <a href={lesson.content_url} className="text-blue-600 hover:underline" target="_blank" rel="noreferrer">
                  コンテンツリンク
                </a>
              )}
            </div>
          ) : (
            <p className="text-gray-400">コンテンツはまだ登録されていません。</p>
          )}
        </div>
      </Card>

      {/* Quiz section */}
      {quiz && (
        <div className="mt-4">
          <Card>
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <ClipboardCheck className="h-5 w-5 text-indigo-500" />
                <div>
                  <p className="font-medium text-gray-900 dark:text-white">理解度テスト</p>
                  <p className="text-sm text-gray-500 dark:text-gray-400">このレッスンの内容を確認しましょう</p>
                </div>
              </div>
              <Link
                href={`/courses/${courseId}/lessons/${lessonId}/quiz/${quiz.id}`}
                className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
              >
                テストを受ける
              </Link>
            </div>
          </Card>
        </div>
      )}

      {/* Complete + Navigation */}
      <div className="mt-6 flex items-center justify-between">
        <div>
          {prevLesson && (
            <Link
              href={`/courses/${courseId}/lessons/${prevLesson.id}`}
              className="rounded-lg border border-gray-300 dark:border-gray-600 px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-800"
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
