import Link from 'next/link'
import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { getMenteeHiddenSubcats } from '@/app/actions/admin/categories'
import { getAllCsCoursesWithProgress } from '@/lib/cs-course'
import { createClient } from '@/lib/supabase/server'

export default async function CSHubPage() {
  const config = categoryChildren['cs']
  if (!config) return null

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const bypassLock = profile?.role === 'admin' || profile?.role === 'mentor'
  const allSubjects = await getAllCsCoursesWithProgress(supabase, user.id, bypassLock)
  const hidden = await getMenteeHiddenSubcats()
  const subjects = allSubjects.filter(s => !hidden.has(`/cs/${s.slug}`))

  return (
    <div>
      <div className="mb-6 flex items-start justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        </div>
        <Link
          href="/cs/quiz"
          className="inline-flex shrink-0 items-center rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-blue-500"
        >
          理解度テスト
        </Link>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {subjects.map((subject) => (
          <Link key={subject.slug} href={`/cs/${subject.slug}`}>
            <Card className="h-full transition-shadow hover:shadow-md">
              <h3 className="font-semibold text-gray-900 dark:text-white">{subject.title}</h3>
              <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{subject.description}</p>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
