import { redirect } from 'next/navigation'
import { categoryChildren } from '@/lib/navigation'
import { getMenteeHiddenSubcats } from '@/app/actions/admin/categories'
import { getAllDevCourses } from '@/lib/dev-course'
import { createClient } from '@/lib/supabase/server'
import DevHubClient from '@/components/dev/DevHubClient'

export default async function DevHubPage() {
  const config = categoryChildren['dev']
  if (!config) return null

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const courses = await getAllDevCourses(supabase, user.id)
  const hidden = await getMenteeHiddenSubcats()
  const visibleCourses = courses.filter((c) => !hidden.has(`/dev/${slugToUrl(c.slug)}`))

  return (
    <div>
      {/* 데스크톱 타이틀 (모바일은 앱셸 처리) */}
      <h1 className="mb-6 hidden text-2xl font-bold text-gray-900 dark:text-white lg:block">
        {config.title}
      </h1>

      <DevHubClient courses={visibleCourses} />
    </div>
  )
}

function slugToUrl(slug: string) {
  if (slug === 'common-workplace-fundamentals') return 'cwf'
  return slug
}
