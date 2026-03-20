import { notFound, redirect } from 'next/navigation'
import DevStaticSubjectPage from '@/components/dev/DevStaticSubjectPage'
import { getDevCourseBySubject } from '@/lib/dev-course'
import { createClient } from '@/lib/supabase/server'

export default async function CwfPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const course = await getDevCourseBySubject(supabase, 'common-workplace-fundamentals', user.id)
  if (!course) notFound()

  return <DevStaticSubjectPage course={course} subjectLabel="共通業務基礎" quizCategory="cwf" />
}
