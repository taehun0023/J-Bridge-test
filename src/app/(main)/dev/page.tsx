import Link from 'next/link'
import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { getAllDevCourses } from '@/lib/dev-course'
import { createClient } from '@/lib/supabase/server'
import GuideCard from '@/components/japanese/JlptGuideCard'

export default async function DevHubPage() {
  const config = categoryChildren['dev']
  if (!config) return null

  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const courses = await getAllDevCourses(supabase, user.id)
  const totalLessons = courses.reduce((sum, c) => sum + c.totalLessons, 0)

  return (
    <div>
      <div className="mb-6 flex items-start justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
          <p className="mt-1 text-gray-500 dark:text-gray-400">
            科目別レッスンで開発実務能力を学び、理解度テストで知識を確認しましょう。
          </p>
        </div>
        <Link
          href="/dev/quiz"
          className="inline-flex shrink-0 items-center rounded-lg bg-orange-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-orange-500"
        >
          理解度テスト
        </Link>
      </div>

      <GuideCard storageKey="dev-guide-dismissed">
        <ol className="mt-2 list-inside list-decimal space-y-1 text-sm text-blue-800 dark:text-blue-300">
          <li>科目カードから入り、レッスンで概念の流れをつかんでください。</li>
          <li>各レッスン完了後、「完了にする」ボタンで進行率が更新されます。</li>
          <li>理解度テストは進行率75%以上で受験できます。</li>
        </ol>
        <div className="mt-3 flex flex-wrap gap-2 text-xs text-blue-800 dark:text-blue-300">
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            {courses.length}科目
          </span>
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            {totalLessons}レッスン
          </span>
        </div>
      </GuideCard>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {courses.map((course) => {
          const progress =
            course.totalLessons > 0
              ? Math.round((course.completedLessons / course.totalLessons) * 100)
              : 0
          const child = config.children.find((c) => c.href === `/dev/${slugToUrl(course.slug)}`)

          return (
            <Link key={course.slug} href={`/dev/${slugToUrl(course.slug)}`}>
              <Card className="h-full transition-shadow hover:shadow-md">
                <h3 className="font-semibold text-gray-900 dark:text-white">
                  {child?.label ?? course.title}
                </h3>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
                  {child?.description ?? course.description}
                </p>
                <div className="mt-3">
                  <div className="flex items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                    <span>
                      {course.completedLessons}/{course.totalLessons} レッスン
                    </span>
                    <span>{progress}%</span>
                  </div>
                  <div className="mt-1 h-1.5 rounded-full bg-gray-200 dark:bg-gray-700">
                    <div
                      className="h-1.5 rounded-full bg-orange-500"
                      style={{ width: `${progress}%` }}
                    />
                  </div>
                </div>
              </Card>
            </Link>
          )
        })}
      </div>
    </div>
  )
}

function slugToUrl(slug: string) {
  if (slug === 'common-workplace-fundamentals') return 'cwf'
  return slug
}
