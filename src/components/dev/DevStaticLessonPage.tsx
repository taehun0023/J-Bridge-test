import Link from 'next/link'
import type { ReactNode } from 'react'
import Card from '@/components/ui/Card'
import CsLessonLearningPanel from '@/components/cs/CsLessonLearningPanel'
import CsLessonSidebarSummary from '@/components/cs/CsLessonSidebarSummary'
import type { DevLessonDetail, DevSubjectSlug } from '@/lib/dev-content'

const SLUG_TO_URL: Record<DevSubjectSlug, string> = {
  'common-workplace-fundamentals': 'cwf',
  java: 'java',
  javascript: 'javascript',
  python: 'python',
  sql: 'sql',
  'spring-boot': 'spring-boot',
  react: 'react',
  nextjs: 'nextjs',
}

export default function DevStaticLessonPage({
  lesson,
  initialLang,
  backHref,
  completionControl,
  previousLessonHref,
  nextLessonHref,
  quizHref,
}: {
  lesson: DevLessonDetail
  initialLang: 'ja' | 'ko'
  backHref?: string
  completionControl?: ReactNode
  previousLessonHref?: string | null
  nextLessonHref?: string | null
  quizHref?: string | null
}) {
  const urlPath = SLUG_TO_URL[lesson.subjectSlug]

  return (
    <div className="space-y-6">
      <div>
        <Link
          href={backHref ?? `/dev/${urlPath}`}
          className="text-sm text-indigo-600 underline hover:text-indigo-500 dark:text-indigo-400"
        >
          科目ページへ戻る
        </Link>
        <div className="mt-3 flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.moduleTitle}
          </span>
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.estMinutes}分
          </span>
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.contentKo ? '日本語 / 韓国語' : '日本語のみ'}
          </span>
        </div>
        <h1 className="mt-3 text-3xl font-bold text-gray-900 dark:text-white">{lesson.title}</h1>
        <p className="mt-2 text-gray-500 dark:text-gray-400">{lesson.meta.summary}</p>
      </div>

      {(completionControl || previousLessonHref || nextLessonHref || quizHref) && (
        <div className="flex flex-wrap items-center justify-between gap-3 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-700 dark:bg-gray-900">
          <div className="flex flex-wrap items-center gap-2">
            {previousLessonHref && (
              <Link
                href={previousLessonHref}
                className="rounded-lg border border-gray-200 px-3 py-2 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-50 dark:border-gray-700 dark:text-gray-200 dark:hover:bg-gray-800"
              >
                前のレッスン
              </Link>
            )}
            {nextLessonHref && (
              <Link
                href={nextLessonHref}
                className="rounded-lg border border-gray-200 px-3 py-2 text-sm font-medium text-gray-700 transition-colors hover:bg-gray-50 dark:border-gray-700 dark:text-gray-200 dark:hover:bg-gray-800"
              >
                次のレッスン
              </Link>
            )}
            {quizHref && (
              <Link
                href={quizHref}
                className="rounded-lg bg-indigo-600 px-3 py-2 text-sm font-medium text-white transition-colors hover:bg-indigo-500"
              >
                理解度テスト
              </Link>
            )}
          </div>
          {completionControl}
        </div>
      )}

      <div className="grid gap-6 xl:grid-cols-[minmax(0,1fr)_280px]">
        <Card className="overflow-hidden">
          <CsLessonLearningPanel
            contentJa={lesson.contentJa}
            contentKo={lesson.contentKo}
            initialLang={initialLang}
            interactiveContent={lesson.interactiveContent}
          />
        </Card>

        <div className="space-y-4">
          <CsLessonSidebarSummary
            initialLang={initialLang}
            hasKoreanContent={!!lesson.contentKo}
            keyPoints={lesson.meta.key_points}
            interactiveContent={lesson.interactiveContent}
          />
        </div>
      </div>
    </div>
  )
}
