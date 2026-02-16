import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'
import Link from 'next/link'
import { Lock, CheckCircle2 } from 'lucide-react'
import { getCoursesWithProgress } from '@/lib/course-progress'

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

  if (!user) {
    return (
      <div>
        <div className="mb-6">
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{title}</h1>
          <p className="mt-1 text-gray-500 dark:text-gray-400">{description}</p>
        </div>
        <EmptyState title="ログインしてください" icon="🔒" />
      </div>
    )
  }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const isAdmin = profile?.role === 'admin'
  const courses = await getCoursesWithProgress(supabase, user.id, subcategory, isAdmin)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{description}</p>
      </div>

      {!courses.length ? (
        <EmptyState title="コースがありません" icon="📚" />
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {courses.map((course) => {
            const inner = (
              <Card className={`h-full transition-shadow ${course.isLocked ? 'opacity-60' : 'hover:shadow-md'}`}>
                <div className="flex items-start justify-between">
                  <Badge label={DIFFICULTY_LABELS[course.difficulty] ?? course.difficulty} variant="default" />
                  {course.isCompleted && (
                    <CheckCircle2 className="h-5 w-5 text-emerald-500" />
                  )}
                  {course.isLocked && (
                    <Lock className="h-5 w-5 text-gray-400" />
                  )}
                </div>
                <h3 className="mt-3 font-semibold text-gray-900 dark:text-white">{course.title}</h3>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400 line-clamp-2">{course.description}</p>
                {/* Quiz progress bar for non-locked, non-completed courses with quizzes */}
                {!course.isLocked && !course.isCompleted && course.totalQuizzes > 0 && (
                  <div className="mt-3">
                    <div className="flex items-center justify-between text-xs text-gray-500 dark:text-gray-400 mb-1">
                      <span>クイズ進捗</span>
                      <span>{course.passedQuizzes}/{course.totalQuizzes}</span>
                    </div>
                    <div className="h-1.5 w-full rounded-full bg-gray-200 dark:bg-gray-700">
                      <div
                        className="h-1.5 rounded-full bg-indigo-500 transition-all"
                        style={{ width: `${Math.round((course.passedQuizzes / course.totalQuizzes) * 100)}%` }}
                      />
                    </div>
                  </div>
                )}
              </Card>
            )

            if (course.isLocked) {
              return (
                <div key={course.id} className="cursor-not-allowed">
                  {inner}
                </div>
              )
            }

            return (
              <Link key={course.id} href={`/courses/${course.id}`}>
                {inner}
              </Link>
            )
          })}
        </div>
      )}
    </div>
  )
}
