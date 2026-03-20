import { notFound, redirect } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevCourseBySubject } from '@/lib/dev-course'
import { createClient } from '@/lib/supabase/server'

export default async function ReactPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const course = await getDevCourseBySubject(supabase, 'react', user.id)
  if (!course) notFound()

  return <DevStaticSubjectPage course={course} subjectLabel="React" quizCategory="react" />
}
