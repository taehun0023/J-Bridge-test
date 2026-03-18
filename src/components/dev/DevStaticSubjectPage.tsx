import Link from 'next/link'
import Card from '@/components/ui/Card'
import EmptyState from '@/components/ui/EmptyState'
import type { DevSubjectContent, DevModuleContent } from '@/lib/dev-content'

const LEVEL_LABELS: Record<string, string> = {
  foundation: 'Foundation',
  intermediate: 'Intermediate',
  advanced: 'Advanced',
}

const LEVEL_COLORS: Record<string, string> = {
  foundation: 'border-green-200 bg-green-50 text-green-700 dark:border-green-900 dark:bg-green-950/40 dark:text-green-300',
  intermediate: 'border-yellow-200 bg-yellow-50 text-yellow-700 dark:border-yellow-900 dark:bg-yellow-950/40 dark:text-yellow-300',
  advanced: 'border-red-200 bg-red-50 text-red-700 dark:border-red-900 dark:bg-red-950/40 dark:text-red-300',
}

function groupByLevel(modules: DevModuleContent[]) {
  const groups: Record<string, DevModuleContent[]> = {}
  for (const mod of modules) {
    const level = mod.level
    if (!groups[level]) groups[level] = []
    groups[level].push(mod)
  }
  return groups
}

export default function DevStaticSubjectPage({ subject }: { subject: DevSubjectContent }) {
  const grouped = groupByLevel(subject.modules)
  const levelOrder = ['foundation', 'intermediate', 'advanced']
  const orderedLevels = levelOrder.filter((l) => grouped[l])

  return (
    <div className="space-y-8">
      {orderedLevels.map((level) => (
        <section key={level}>
          <h2 className="mb-4 text-lg font-bold text-gray-900 dark:text-white">
            {LEVEL_LABELS[level] ?? level}
          </h2>

          <div className="space-y-4">
            {grouped[level].map((mod) => (
              <div key={mod.moduleId}>
                <div className="mb-2 flex items-center gap-2">
                  <span className={`inline-flex rounded-full border px-2.5 py-0.5 text-xs font-medium ${LEVEL_COLORS[mod.level] ?? ''}`}>
                    {LEVEL_LABELS[mod.level] ?? mod.level}
                  </span>
                  <h3 className="font-semibold text-gray-900 dark:text-white">{mod.title}</h3>
                </div>
                <p className="mb-3 text-sm text-gray-500 dark:text-gray-400">{mod.description}</p>

                {!mod.lessons.length ? (
                  <EmptyState title="準備中" description="このモジュールのレッスンは現在作成中です。" />
                ) : (
                  <div className="grid gap-4 lg:grid-cols-2">
                    {mod.lessons.map((lesson) => (
                      <Link key={lesson.lessonId} href={`/dev/lessons/${lesson.lessonId}`}>
                        <Card className="h-full transition-shadow hover:shadow-md">
                          <div className="mb-3 flex items-center justify-between gap-3 text-xs text-gray-500 dark:text-gray-400">
                            <span>{lesson.estMinutes} min</span>
                            <span>{lesson.tags.length} tags</span>
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
            ))}
          </div>
        </section>
      ))}
    </div>
  )
}
