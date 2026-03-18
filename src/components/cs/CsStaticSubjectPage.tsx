import Link from 'next/link'
import Card from '@/components/ui/Card'
import EmptyState from '@/components/ui/EmptyState'
import type { CsSubjectContent } from '@/lib/cs-content'

const LEVEL_LABELS: Record<string, string> = {
  foundation: '基礎',
  intermediate: '中級',
  advanced: '上級',
}

export default function CsStaticSubjectPage({ subject }: { subject: CsSubjectContent }) {
  return (
    <div>
      <div className="mb-6">
        <div className="mb-2 inline-flex rounded-full border border-indigo-200 bg-indigo-50 px-3 py-1 text-xs font-medium text-indigo-700 dark:border-indigo-900 dark:bg-indigo-950/40 dark:text-indigo-300">
          {LEVEL_LABELS[subject.level] ?? subject.level} / 日本語既定・韓国語切替対応
        </div>
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{subject.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{subject.description}</p>
      </div>

      {!subject.lessons.length ? (
        <EmptyState
          title="レッスンがまだありません"
          description="この科目にはまだ静的コンテンツが追加されていません。"
        />
      ) : (
        <div className="grid gap-4 lg:grid-cols-2">
          {subject.lessons.map((lesson) => (
            <Link key={lesson.lessonId} href={`/cs/lessons/${lesson.lessonId}`}>
              <Card className="h-full transition-shadow hover:shadow-md">
                <div className="mb-3 flex items-center justify-between gap-3 text-xs text-gray-500 dark:text-gray-400">
                  <span>{lesson.estMinutes}分</span>
                  <span>{lesson.tags.length}タグ</span>
                </div>
                <h2 className="font-semibold text-gray-900 dark:text-white">{lesson.title}</h2>
                <p className="mt-2 text-sm leading-6 text-gray-600 dark:text-gray-300">
                  {lesson.summary}
                </p>
              </Card>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
