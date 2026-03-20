import Link from 'next/link'
import { CheckCircle2 } from 'lucide-react'
import Badge from '@/components/ui/Badge'
import Card from '@/components/ui/Card'
import type { DevVirtualCourse } from '@/lib/dev-course'

const DIFFICULTY_LABELS: Record<string, string> = {
  foundation: '基礎',
  intermediate: '応用',
  advanced: '上級',
}

export default function DevStaticSubjectPage({
  course,
  subjectLabel,
  quizCategory,
}: {
  course: DevVirtualCourse
  subjectLabel: string
  quizCategory?: string
}) {
  const progress =
    course.totalLessons > 0
      ? Math.round((course.completedLessons / course.totalLessons) * 100)
      : 0

  const quizHref = quizCategory ? `/dev/quiz?category=${quizCategory}` : '/dev/quiz'

  return (
    <div>
      <div className="mb-6">
        <Badge label="dev" variant="default" />
        <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{subjectLabel}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{course.description}</p>
      </div>

      <div className="mb-6 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {DIFFICULTY_LABELS[course.difficulty] ?? course.difficulty}
        </span>
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {course.completedLessons}/{course.totalLessons} レッスン
        </span>
      </div>

      <div className="mb-6 flex flex-wrap gap-2">
        <Link
          href={quizHref}
          className="inline-flex items-center rounded-lg bg-orange-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-orange-500"
        >
          理解度テスト
        </Link>
      </div>

      <div className="mb-6">
        <div className="flex items-center gap-3">
          <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
            <div className="h-2 rounded-full bg-orange-500" style={{ width: `${progress}%` }} />
          </div>
          <span className="text-sm text-gray-600 dark:text-gray-400">{progress}% 進行</span>
        </div>
      </div>

      <Card title={`レッスン (${course.totalLessons})`}>
        <div className="divide-y divide-gray-100 dark:divide-gray-700">
          {course.lessons.map((lesson, index) => (
            <Link
              key={lesson.lessonId}
              href={`/dev/lessons/${lesson.lessonId}`}
              className="flex items-center gap-4 py-3 hover:bg-gray-50 dark:hover:bg-gray-800"
            >
              <div
                className={`flex h-8 w-8 items-center justify-center rounded-full text-xs font-bold ${
                  lesson.isCompleted
                    ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-300'
                    : 'bg-gray-100 text-gray-500 dark:bg-gray-700 dark:text-gray-400'
                }`}
              >
                {lesson.isCompleted ? <CheckCircle2 className="h-4 w-4" /> : index + 1}
              </div>
              <div className="flex-1">
                <div className="flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                  <span>{lesson.estMinutes}分</span>
                  <span>{DIFFICULTY_LABELS[lesson.difficulty] ?? lesson.difficulty}</span>
                </div>
                <p className="mt-1 text-sm font-medium text-gray-900 dark:text-white">
                  {lesson.title}
                </p>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{lesson.summary}</p>
              </div>
            </Link>
          ))}
        </div>
      </Card>
    </div>
  )
}
