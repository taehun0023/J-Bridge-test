import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'
import Link from 'next/link'

interface SearchParams {
  category?: string
}

const CATEGORY_LABELS: Record<string, string> = {
  jlpt_prep: 'JLPT',
  it_japanese: 'IT日本語',
  core_programming: '基本プログラミング',
  framework: 'フレームワーク',
  algorithm: 'アルゴリズム',
  project: 'プロジェクト',
  attitude_culture: '態度/文化',
}

const DIFFICULTY_LABELS: Record<string, string> = {
  beginner: '初級',
  intermediate: '中級',
  advanced: '上級',
}

export default async function CoursesPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  let query = supabase
    .from('courses')
    .select('*')
    .eq('is_published', true)
    .order('category', { ascending: true })
    .order('sort_order', { ascending: true })

  if (params.category) {
    query = query.eq('category', params.category)
  }

  const { data: courses } = await query

  // Get user's enrollments
  let enrolledIds = new Set<string>()
  if (user) {
    const { data: enrollments } = await supabase
      .from('enrollments')
      .select('course_id')
      .eq('user_id', user.id)
    enrollments?.forEach(e => enrolledIds.add(e.course_id))
  }

  // Group by category
  const grouped: Record<string, typeof courses> = {}
  courses?.forEach(c => {
    if (!grouped[c.category]) grouped[c.category] = []
    grouped[c.category]!.push(c)
  })

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">コース一覧</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">日本語、プログラミング、態度/文化のコースを探索しましょう</p>
      </div>

      {/* Category filter */}
      <div className="mb-6 flex flex-wrap gap-2">
        <Link
          href="/courses"
          className={`rounded-full px-4 py-1.5 text-sm font-medium ${
            !params.category ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'
          }`}
        >
          全て
        </Link>
        {Object.entries(CATEGORY_LABELS).map(([key, label]) => (
          <Link
            key={key}
            href={`/courses?category=${key}`}
            className={`rounded-full px-4 py-1.5 text-sm font-medium ${
              params.category === key ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'
            }`}
          >
            {label}
          </Link>
        ))}
      </div>

      {!courses?.length ? (
        <EmptyState title="コースがありません" icon="📚" />
      ) : (
        Object.entries(grouped).map(([category, categoryCourses]) => (
          <div key={category} className="mb-8">
            <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">
              {CATEGORY_LABELS[category] ?? category}
            </h2>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {categoryCourses?.map((course) => (
                <Link key={course.id} href={`/courses/${course.id}`}>
                  <Card className="h-full transition-shadow hover:shadow-md">
                    <div className="flex items-start justify-between">
                      <Badge label={DIFFICULTY_LABELS[course.difficulty] ?? course.difficulty} variant="default" />
                      {enrolledIds.has(course.id) && (
                        <span className="text-xs font-medium text-green-600 dark:text-green-400">受講中</span>
                      )}
                    </div>
                    <h3 className="mt-3 font-semibold text-gray-900 dark:text-white">{course.title}</h3>
                    <p className="mt-1 text-sm text-gray-500 dark:text-gray-400 line-clamp-2">{course.description}</p>
                  </Card>
                </Link>
              ))}
            </div>
          </div>
        ))
      )}
    </div>
  )
}
