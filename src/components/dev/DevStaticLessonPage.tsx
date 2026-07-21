import Link from 'next/link'
import { MoveLeft } from 'lucide-react'
import DevLessonResponsive from '@/components/dev/DevLessonResponsive'
import type { DevLessonDetail } from '@/lib/dev-content'

export default function DevStaticLessonPage({
  lesson,
  initialLang,
  backHref,
  previousLessonHref,
  nextLessonHref,
  lessonId,
  courseId,
  isCompleted = false,
  isAdmin = false,
}: {
  lesson: DevLessonDetail
  initialLang: 'ja' | 'ko'
  backHref?: string
  previousLessonHref?: string | null
  nextLessonHref?: string | null
  lessonId: string
  courseId: string
  isCompleted?: boolean
  isAdmin?: boolean
}) {
  const subjectHref = backHref ?? '/dev'

  return (
    <div className="space-y-6">
      <div>
        <Link
          href={subjectHref}
          aria-label="戻る"
          className="inline-flex items-center text-zinc-500 transition-colors hover:text-indigo-600 dark:text-zinc-400 dark:hover:text-indigo-400"
        >
          <MoveLeft className="h-7 w-7" strokeWidth={2} />
        </Link>
        <h1 className="mt-3 text-2xl font-bold text-gray-900 dark:text-white sm:text-3xl">{lesson.title}</h1>
      </div>

      <DevLessonResponsive
        lesson={lesson}
        initialLang={initialLang}
        lessonId={lessonId}
        courseId={courseId}
        isCompleted={isCompleted}
        isAdmin={isAdmin}
        previousLessonHref={previousLessonHref}
        nextLessonHref={nextLessonHref}
        subjectHref={subjectHref}
      />
    </div>
  )
}
