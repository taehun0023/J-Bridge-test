import { notFound, redirect } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevCourseBySubject } from '@/lib/dev-course'
import { getCoursesWithProgress } from '@/lib/course-progress'
import { createClient } from '@/lib/supabase/server'

interface CertLesson {
  id: string
  title: string
  course_id: string
  sort_order: number
  duration_minutes: number
}

export default async function JavaPage({ searchParams }: { searchParams: Promise<{ tab?: string }> }) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const params = await searchParams
  const activeTab = params.tab === 'cert' ? 'cert' as const : 'learn' as const

  const course = await getDevCourseBySubject(supabase, 'java', user.id)
  if (!course) notFound()

  // Only fetch cert data when cert tab is active
  let certCourses: Array<{
    id: string
    title: string
    difficulty: string
    isLocked: boolean
    isCompleted: boolean
    lessons: Array<{ id: string; title: string; sort_order: number; duration_minutes: number }>
  }> | undefined

  if (activeTab === 'cert') {
    const { data: profile } = await supabase
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()
    const isAdmin = profile?.role === 'admin'

    const courses = await getCoursesWithProgress(supabase, user.id, 'java', isAdmin)
    const courseIds = courses.map(c => c.id)

    const { data: lessons } = await supabase
      .from('lessons')
      .select('id, title, course_id, sort_order, duration_minutes')
      .in('course_id', courseIds.length > 0 ? courseIds : ['__none__'])
      .order('sort_order')

    const lessonsByCourse = new Map<string, CertLesson[]>()
    for (const l of (lessons ?? []) as CertLesson[]) {
      const arr = lessonsByCourse.get(l.course_id) ?? []
      arr.push(l)
      lessonsByCourse.set(l.course_id, arr)
    }

    certCourses = courses.map(c => ({
      id: c.id,
      title: c.title,
      difficulty: c.difficulty,
      isLocked: c.isLocked,
      isCompleted: c.isCompleted,
      lessons: lessonsByCourse.get(c.id) ?? [],
    }))
  }

  return (
    <DevStaticSubjectPage
      course={course}
      subjectLabel="Java"
      quizCategory="java"
      activeTab={activeTab}
      certCourses={certCourses}
    />
  )
}
