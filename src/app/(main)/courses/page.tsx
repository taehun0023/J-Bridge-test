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
  it_japanese: 'IT 일본어',
  core_programming: '기본 프로그래밍',
  framework: '프레임워크',
  algorithm: '알고리즘',
  project: '프로젝트',
  attitude_culture: '태도/문화',
}

const DIFFICULTY_LABELS: Record<string, string> = {
  beginner: '초급',
  intermediate: '중급',
  advanced: '고급',
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
        <h1 className="text-2xl font-bold text-gray-900">코스 목록</h1>
        <p className="mt-1 text-gray-500">일본어, 프로그래밍, 태도/문화 코스를 탐색하세요</p>
      </div>

      {/* Category filter */}
      <div className="mb-6 flex flex-wrap gap-2">
        <Link
          href="/courses"
          className={`rounded-full px-4 py-1.5 text-sm font-medium ${
            !params.category ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
          }`}
        >
          전체
        </Link>
        {Object.entries(CATEGORY_LABELS).map(([key, label]) => (
          <Link
            key={key}
            href={`/courses?category=${key}`}
            className={`rounded-full px-4 py-1.5 text-sm font-medium ${
              params.category === key ? 'bg-blue-600 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
            }`}
          >
            {label}
          </Link>
        ))}
      </div>

      {!courses?.length ? (
        <EmptyState title="코스가 없습니다" icon="📚" />
      ) : (
        Object.entries(grouped).map(([category, categoryCourses]) => (
          <div key={category} className="mb-8">
            <h2 className="mb-4 text-lg font-semibold text-gray-900">
              {CATEGORY_LABELS[category] ?? category}
            </h2>
            <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {categoryCourses?.map((course) => (
                <Link key={course.id} href={`/courses/${course.id}`}>
                  <Card className="h-full transition-shadow hover:shadow-md">
                    <div className="flex items-start justify-between">
                      <Badge label={DIFFICULTY_LABELS[course.difficulty] ?? course.difficulty} variant="default" />
                      {enrolledIds.has(course.id) && (
                        <span className="text-xs font-medium text-green-600">수강 중</span>
                      )}
                    </div>
                    <h3 className="mt-3 font-semibold text-gray-900">{course.title}</h3>
                    <p className="mt-1 text-sm text-gray-500 line-clamp-2">{course.description}</p>
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
