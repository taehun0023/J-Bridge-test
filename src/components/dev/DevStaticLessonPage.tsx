import Link from 'next/link'
import Card from '@/components/ui/Card'
import MarkdownRenderer from '@/components/ui/MarkdownRenderer'
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

export default function DevStaticLessonPage({ lesson }: { lesson: DevLessonDetail }) {
  const urlPath = SLUG_TO_URL[lesson.subjectSlug]
  const isJa = lesson.lang === 'ja'

  return (
    <div className="space-y-6">
      <div>
        <div className="flex items-center justify-between">
          <Link
            href={`/dev/${urlPath}`}
            className="text-sm text-indigo-600 underline hover:text-indigo-500 dark:text-indigo-400"
          >
            {isJa ? '科目に戻る' : '과목으로 돌아가기'}
          </Link>

          <div className="flex gap-1 rounded-lg border border-gray-200 p-0.5 dark:border-gray-700">
            <Link
              href={`/dev/lessons/${lesson.lessonId}`}
              className={`rounded-md px-3 py-1 text-xs font-medium transition-colors ${
                isJa
                  ? 'bg-indigo-100 text-indigo-700 dark:bg-indigo-900/40 dark:text-indigo-300'
                  : 'text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200'
              }`}
            >
              日本語
            </Link>
            {lesson.hasKo && (
              <Link
                href={`/dev/lessons/${lesson.lessonId}?lang=ko`}
                className={`rounded-md px-3 py-1 text-xs font-medium transition-colors ${
                  !isJa
                    ? 'bg-indigo-100 text-indigo-700 dark:bg-indigo-900/40 dark:text-indigo-300'
                    : 'text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200'
                }`}
              >
                한국어
              </Link>
            )}
          </div>
        </div>
        <div className="mt-3 flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.moduleTitle}
          </span>
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.estMinutes} min
          </span>
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {isJa ? '日本語' : '한국어'}
          </span>
        </div>
        <h1 className="mt-3 text-3xl font-bold text-gray-900 dark:text-white">{lesson.title}</h1>
        <p className="mt-2 text-gray-500 dark:text-gray-400">{lesson.meta.summary}</p>
      </div>

      <div className="grid gap-6 xl:grid-cols-[minmax(0,1fr)_320px]">
        <Card className="overflow-hidden">
          <MarkdownRenderer content={lesson.content} />
        </Card>

        <div className="space-y-4">
          <Card title="Key Points">
            <ul className="space-y-2 text-sm text-gray-700 dark:text-gray-300">
              {lesson.meta.key_points.map((point) => (
                <li key={point}>{point}</li>
              ))}
            </ul>
          </Card>

          <Card title="Check Questions">
            <ul className="space-y-2 text-sm text-gray-700 dark:text-gray-300">
              {lesson.meta.check_questions.map((question) => (
                <li key={question}>{question}</li>
              ))}
            </ul>
          </Card>

          <Card title="Exam Extraction">
            <div className="space-y-3 text-sm text-gray-700 dark:text-gray-300">
              <div>
                <h2 className="font-semibold text-gray-900 dark:text-gray-100">Practical Judgment</h2>
                <ul className="mt-1 space-y-1">
                  {lesson.meta.exam_extractables.practical_judgment_candidates.map((item) => (
                    <li key={item}>{item}</li>
                  ))}
                </ul>
              </div>
              <div>
                <h2 className="font-semibold text-gray-900 dark:text-gray-100">Error Interpretation</h2>
                <ul className="mt-1 space-y-1">
                  {lesson.meta.exam_extractables.error_interpretation_candidates.map((item) => (
                    <li key={item}>{item}</li>
                  ))}
                </ul>
              </div>
              <div>
                <h2 className="font-semibold text-gray-900 dark:text-gray-100">Scenarios</h2>
                <ul className="mt-1 space-y-1">
                  {lesson.meta.exam_extractables.scenario_candidates.map((item) => (
                    <li key={item}>{item}</li>
                  ))}
                </ul>
              </div>
            </div>
          </Card>
        </div>
      </div>
    </div>
  )
}
