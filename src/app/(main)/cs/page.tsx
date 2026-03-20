import Link from 'next/link'
import { redirect } from 'next/navigation'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { getAllCsCoursesWithProgress } from '@/lib/cs-course'
import { createClient } from '@/lib/supabase/server'
import GuideCard from '@/components/japanese/JlptGuideCard'

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
  const subjects = await getAllCsCoursesWithProgress(supabase, user.id, bypassLock)
  const lessonCount = subjects.reduce((sum, subject) => sum + subject.lessons.length, 0)

  return (
    <div>
      <div className="mb-6 flex items-start justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
          <p className="mt-1 text-gray-500 dark:text-gray-400">
            科目カードから学習を始め、レッスンを進めながら CS 用語を確認し、進行率に応じて理解度テストを解放します。
          </p>
        </div>
        <Link
          href="/cs/quiz"
          className="inline-flex shrink-0 items-center rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-blue-500"
        >
          理解度テスト
        </Link>
      </div>

      <GuideCard storageKey="cs-guide-dismissed">
        <ol className="mt-2 list-inside list-decimal space-y-1 text-sm text-blue-800 dark:text-blue-300">
          <li>科目ページでレッスンを順番に進めます。</li>
          <li>必要に応じて CS用語 タブで重要用語を確認します。</li>
          <li>各科目の進行率が 75% 以上になると理解度テストが解放されます。</li>
        </ol>
        <div className="mt-3 flex flex-wrap gap-2 text-xs text-blue-800 dark:text-blue-300">
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            {subjects.length} 科目
          </span>
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            {lessonCount} レッスン
          </span>
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            学習 + 用語
          </span>
        </div>
      </GuideCard>

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
