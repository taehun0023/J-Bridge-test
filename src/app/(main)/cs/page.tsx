import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { getAllCsSubjectContents } from '@/lib/cs-content'

export default async function CSHubPage() {
  const config = categoryChildren['cs']
  if (!config) return null

  const subjects = await getAllCsSubjectContents()
  const lessonCount = subjects.reduce((sum, subject) => sum + subject.lessons.length, 0)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
      </div>

      <Card className="mb-6 border-blue-200 bg-blue-50/50 dark:border-blue-900 dark:bg-blue-950/30">
        <h2 className="text-base font-semibold text-blue-900 dark:text-blue-200">
          静的CSコンテンツ
        </h2>
        <p className="mt-2 text-sm leading-6 text-blue-800 dark:text-blue-300">
          このセクションは静的な解説型レッスンを基本学習面として使います。既定言語は日本語で、
          韓国語翻訳があるレッスンは詳細画面で切り替えられます。
        </p>
        <div className="mt-3 flex flex-wrap gap-2 text-xs text-blue-800 dark:text-blue-300">
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            {subjects.length}科目
          </span>
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            {lessonCount}レッスン
          </span>
          <span className="rounded-full border border-blue-200 px-2.5 py-1 dark:border-blue-800">
            ja default / ko available
          </span>
        </div>
      </Card>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {config.children.map((child) => (
          <Link key={child.href} href={child.href}>
            <Card className="h-full transition-shadow hover:shadow-md">
              <h3 className="font-semibold text-gray-900 dark:text-white">{child.label}</h3>
              <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{child.description}</p>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
