import { createClient } from '@/lib/supabase/server'
import { notFound } from 'next/navigation'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import EnrollButton from './EnrollButton'
import Link from 'next/link'

interface Params { id: string }

export default async function CoursePage({ params }: { params: Promise<Params> }) {
  const { id } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: course } = await supabase
    .from('courses')
    .select('*')
    .eq('id', id)
    .single()

  if (!course) notFound()

  const { data: lessons } = await supabase
    .from('lessons')
    .select('*')
    .eq('course_id', id)
    .order('sort_order', { ascending: true })

  // Check enrollment
  let enrolled = false
  let completedLessonIds = new Set<string>()
  if (user) {
    const { data: enrollment } = await supabase
      .from('enrollments')
      .select('id')
      .eq('user_id', user.id)
      .eq('course_id', id)
      .single()
    enrolled = !!enrollment

    if (enrolled) {
      const { data: progress } = await supabase
        .from('lesson_progress')
        .select('lesson_id')
        .eq('user_id', user.id)
        .eq('is_completed', true)
      progress?.forEach(p => completedLessonIds.add(p.lesson_id))
    }
  }

  const completedCount = lessons?.filter(l => completedLessonIds.has(l.id)).length ?? 0
  const totalLessons = lessons?.length ?? 0
  const progress = totalLessons > 0 ? Math.round((completedCount / totalLessons) * 100) : 0

  const contentTypeLabels: Record<string, string> = {
    video: '영상', text: '텍스트', quiz: '퀴즈', coding_exercise: '코딩', role_play: '롤플레이',
  }

  return (
    <div>
      <div className="mb-6">
        <Badge label={course.category} variant="default" />
        <h1 className="mt-2 text-2xl font-bold text-gray-900">{course.title}</h1>
        <p className="mt-1 text-gray-500">{course.description}</p>
      </div>

      {!enrolled ? (
        <EnrollButton courseId={course.id} />
      ) : (
        <div className="mb-6">
          <div className="flex items-center gap-3">
            <div className="flex-1 h-2 rounded-full bg-gray-200">
              <div className="h-2 rounded-full bg-green-500" style={{ width: `${progress}%` }} />
            </div>
            <span className="text-sm text-gray-600">{progress}% 완료</span>
          </div>
        </div>
      )}

      <Card title={`레슨 (${totalLessons}개)`}>
        {!lessons?.length ? (
          <p className="py-4 text-center text-sm text-gray-400">등록된 레슨이 없습니다</p>
        ) : (
          <div className="divide-y divide-gray-100">
            {lessons.map((lesson, i) => {
              const completed = completedLessonIds.has(lesson.id)
              return (
                <Link
                  key={lesson.id}
                  href={enrolled ? `/courses/${id}/lessons/${lesson.id}` : '#'}
                  className={`flex items-center gap-4 py-3 ${enrolled ? 'hover:bg-gray-50' : 'opacity-60 cursor-default'}`}
                >
                  <div className={`flex h-8 w-8 items-center justify-center rounded-full text-xs font-bold ${
                    completed ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-500'
                  }`}>
                    {completed ? '✓' : i + 1}
                  </div>
                  <div className="flex-1">
                    <p className="text-sm font-medium text-gray-900">{lesson.title}</p>
                    <div className="flex gap-2 text-xs text-gray-500">
                      <span>{contentTypeLabels[lesson.content_type] ?? lesson.content_type}</span>
                      {lesson.duration_minutes && <span>{lesson.duration_minutes}분</span>}
                    </div>
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
