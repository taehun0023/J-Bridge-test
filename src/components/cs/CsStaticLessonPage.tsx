import Link from 'next/link'
import Card from '@/components/ui/Card'
import LessonContentToggle from '@/components/ui/LessonContentToggle'
import type { CsLessonDetail } from '@/lib/cs-content'

export default function CsStaticLessonPage({ lesson }: { lesson: CsLessonDetail }) {
  return (
    <div className="space-y-6">
      <div>
        <Link
          href={`/cs/${lesson.subjectSlug}`}
          className="text-sm text-indigo-600 underline hover:text-indigo-500 dark:text-indigo-400"
        >
          科目一覧へ戻る
        </Link>
        <div className="mt-3 flex flex-wrap items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.moduleTitle}
          </span>
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.estMinutes}分
          </span>
          <span className="rounded-full border border-gray-200 px-2.5 py-1 dark:border-gray-700">
            {lesson.contentKo ? 'ja / ko' : 'ja only'}
          </span>
        </div>
        <h1 className="mt-3 text-3xl font-bold text-gray-900 dark:text-white">{lesson.title}</h1>
        <p className="mt-2 text-gray-500 dark:text-gray-400">{lesson.meta.summary}</p>
      </div>

      <div className="grid gap-6 xl:grid-cols-[minmax(0,1fr)_320px]">
        <Card className="overflow-hidden">
          <LessonContentToggle contentJa={lesson.content} contentKo={lesson.contentKo} />
        </Card>

        <div className="space-y-4">
          <Card title="要点">
            <ul className="space-y-2 text-sm text-gray-700 dark:text-gray-300">
              {lesson.meta.key_points.map((point) => (
                <li key={point}>{point}</li>
              ))}
            </ul>
          </Card>

          <Card title="確認質問">
            <ul className="space-y-2 text-sm text-gray-700 dark:text-gray-300">
              {lesson.meta.check_questions.map((question) => (
                <li key={question}>{question}</li>
              ))}
            </ul>
          </Card>

          <Card title="問題抽出候補">
            <div className="space-y-3 text-sm text-gray-700 dark:text-gray-300">
              <div>
                <h2 className="font-semibold text-gray-900 dark:text-gray-100">比較観点</h2>
                <ul className="mt-1 space-y-1">
                  {lesson.meta.exam_extractables.concept_contrast_candidates.map((item) => (
                    <li key={item}>{item}</li>
                  ))}
                </ul>
              </div>
              <div>
                <h2 className="font-semibold text-gray-900 dark:text-gray-100">判断シナリオ</h2>
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
