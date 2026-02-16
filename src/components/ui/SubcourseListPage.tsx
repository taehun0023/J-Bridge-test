import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'
import Link from 'next/link'

const DIFFICULTY_LABELS: Record<string, string> = {
  beginner: 'ブロンズ',
  intermediate: 'シルバー',
  advanced: 'ゴールド',
}

interface SubcourseListPageProps {
  title: string
  description: string
  subcategory: string
}

export default async function SubcourseListPage({ title, description, subcategory }: SubcourseListPageProps) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: courses } = await supabase
    .from('courses')
    .select('*')
    .eq('is_published', true)
    .eq('subcategory', subcategory)
    .order('sort_order', { ascending: true })

  let enrolledIds = new Set<string>()
  if (user) {
    const { data: enrollments } = await supabase
      .from('enrollments')
      .select('course_id')
      .eq('user_id', user.id)
    enrollments?.forEach(e => enrolledIds.add(e.course_id))
  }

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{description}</p>
      </div>

      {!courses?.length ? (
        <EmptyState title="コースがありません" icon="📚" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {courses.map((course) => (
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
      )}
    </div>
  )
}
