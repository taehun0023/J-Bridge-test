import Link from 'next/link'
import { CheckCircle2 } from 'lucide-react'
import Badge from '@/components/ui/Badge'
import Card from '@/components/ui/Card'
import EmptyState from '@/components/ui/EmptyState'
import type { CsSubjectContent } from '@/lib/cs-content'
import type { CsTermItem, CsTermsIntro } from '@/lib/cs-terms'
import type { CsVirtualCourse } from '@/lib/cs-course'
import { getCsQuizListHref } from '@/lib/cs-quiz'
import CsGlossaryClient from '@/app/(main)/cs/CsGlossaryClient'

const DIFFICULTY_LABELS: Record<string, string> = {
  beginner: '初級',
  intermediate: '中級',
  advanced: '上級',
  foundation: '基礎',
}

export default function CsStaticSubjectPage({
  subject,
  course,
  pathname,
  activeTab,
  termsCategory,
  termsIntro,
  termsItems,
  termsDifficulty,
  termsSearch,
  termsPage,
  termsTotalPages,
  termsTotalCount,
  termsOffset,
  termsMasteredIds,
  termsMastery,
}: {
  subject: CsSubjectContent
  course: CsVirtualCourse
  pathname: string
  activeTab: 'learn' | 'terms'
  termsCategory: string | null
  termsIntro: CsTermsIntro
  termsItems: CsTermItem[]
  termsDifficulty: string
  termsSearch: string
  termsPage: number
  termsTotalPages: number
  termsTotalCount: number
  termsOffset: number
  termsMasteredIds: string[]
  termsMastery: string
}) {
  const progress =
    course.totalLessons > 0 ? Math.round((course.completedLessons / course.totalLessons) * 100) : 0

  return (
    <div>
      <div className="mb-6">
        <Badge label="cs" variant="default" />
        <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{subject.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{subject.description}</p>
      </div>

      <div className="mb-6 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {DIFFICULTY_LABELS[course.difficulty] ?? course.difficulty}
        </span>
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {course.completedLessons}/{course.totalLessons} レッスン完了
        </span>
        {course.totalQuizzes > 0 && (
          <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
            理解度テスト {course.passedQuizzes}/{course.totalQuizzes}
          </span>
        )}
      </div>

      <div className="mb-6 flex flex-wrap gap-2">
        <Link
          href={getCsQuizListHref(pathname.split('/').pop() ?? null)}
          className="inline-flex items-center rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-indigo-500"
        >
          理解度テスト
        </Link>
      </div>

      <div className="mb-6">
        <div className="flex items-center gap-3">
          <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
            <div className="h-2 rounded-full bg-green-500" style={{ width: `${progress}%` }} />
          </div>
          <span className="text-sm text-gray-600 dark:text-gray-400">{progress}% 進行中</span>
        </div>
      </div>

      <div className="mb-6 flex gap-1 overflow-x-auto border-b border-gray-200 pb-px dark:border-white/[0.06]">
        <Link
          href={pathname}
          className={`whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition-colors ${
            activeTab === 'learn'
              ? 'border-indigo-600 text-indigo-700 dark:border-indigo-500 dark:text-indigo-400'
              : 'border-transparent text-zinc-500 hover:border-zinc-300 hover:text-zinc-700 dark:text-zinc-400 dark:hover:border-zinc-600 dark:hover:text-zinc-200'
          }`}
        >
          学習
        </Link>
        <Link
          href={`${pathname}?tab=terms`}
          className={`whitespace-nowrap border-b-2 px-4 py-2.5 text-sm font-medium transition-colors ${
            activeTab === 'terms'
              ? 'border-indigo-600 text-indigo-700 dark:border-indigo-500 dark:text-indigo-400'
              : 'border-transparent text-zinc-500 hover:border-zinc-300 hover:text-zinc-700 dark:text-zinc-400 dark:hover:border-zinc-600 dark:hover:text-zinc-200'
          }`}
        >
          CS用語
          <span className="ml-1.5 rounded-full bg-zinc-100 px-2 py-0.5 text-xs text-zinc-600 dark:bg-white/10 dark:text-zinc-400">
            {termsCategory ? termsTotalCount : '準備中'}
          </span>
        </Link>
      </div>

      {activeTab === 'terms' ? (
        <div>
          <div className="mb-6">
            <h2 className="text-lg font-semibold text-gray-900 dark:text-white">{termsIntro.title}</h2>
            <p className="mt-1 text-sm leading-6 text-gray-500 dark:text-gray-400">
              {termsIntro.description}
            </p>
          </div>

          {!termsCategory ? (
            <EmptyState
              title="CS用語はまだ準備中です"
              description="この科目の用語データは順次追加します。"
            />
          ) : (
            <CsGlossaryClient
              items={termsItems}
              category={termsCategory}
              activeDifficulty={termsDifficulty}
              search={termsSearch}
              currentPage={termsPage}
              totalPages={termsTotalPages}
              totalCount={termsTotalCount}
              basePath={pathname}
              offset={termsOffset}
              masteredIds={termsMasteredIds}
              mastery={termsMastery}
            />
          )}
        </div>
      ) : (
        <Card title={`レッスン一覧 (${course.totalLessons})`}>
          <div className="divide-y divide-gray-100 dark:divide-gray-700">
            {course.lessons.map((lesson, index) => (
              <Link
                key={lesson.lessonId}
                href={`/courses/${course.id}/lessons/${lesson.lessonId}`}
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
      )}
    </div>
  )
}
