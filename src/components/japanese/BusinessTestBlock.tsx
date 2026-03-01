import Link from 'next/link'
import Card from '@/components/ui/Card'
import { Lock } from 'lucide-react'

interface SubcategoryProgress {
  label: string
  mastered: number
  total: number
  quizType: string
}

interface Props {
  subcategories: SubcategoryProgress[]
  bypassLock?: boolean
}

const THRESHOLD = 80

export default function BusinessTestBlock({ subcategories, bypassLock = false }: Props) {
  return (
    <Card>
      <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">理解度テスト</h2>
      <p className="mb-4 text-xs text-gray-500 dark:text-gray-400">
        ※ 進行率{THRESHOLD}%以上でテストが解放されます
      </p>

      <div className="space-y-4">
        {subcategories.map(sub => {
          const pct = sub.total > 0 ? Math.round((sub.mastered / sub.total) * 100) : 0
          const unlocked = bypassLock || pct >= THRESHOLD

          const cardContent = (
            <>
              <div className="mb-2 flex items-center justify-between">
                <h3 className="font-semibold text-gray-900 dark:text-white">{sub.label}</h3>
                <span className={`text-sm font-medium ${pct >= THRESHOLD ? 'text-emerald-600' : 'text-gray-500'}`}>
                  進行率 {pct}%
                </span>
              </div>

              {/* Progress bar */}
              <div className="mb-3 h-2 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700">
                <div
                  className={`h-full rounded-full transition-all ${pct >= THRESHOLD ? 'bg-emerald-500' : 'bg-blue-500'}`}
                  style={{ width: `${Math.min(pct, 100)}%` }}
                />
              </div>

              {/* Progress details */}
              <div className="mb-3 text-xs text-gray-500 dark:text-gray-400">
                <span>{sub.mastered}/{sub.total}</span>
              </div>

              {/* Status */}
              {unlocked ? (
                <span className="inline-flex items-center gap-1 text-sm font-medium text-indigo-600 dark:text-indigo-400">
                  テスト一覧へ &rarr;
                </span>
              ) : (
                <span className="inline-flex items-center gap-1 text-sm font-medium text-gray-400 dark:text-gray-500">
                  <Lock className="h-4 w-4" />
                  テスト（ロック中）
                </span>
              )}
            </>
          )

          if (unlocked) {
            return (
              <Link
                key={sub.quizType}
                href={`/japanese/business/quiz?type=${sub.quizType}`}
                className="block rounded-xl border border-gray-200 p-4 transition-colors hover:border-indigo-300 hover:bg-indigo-50/50 dark:border-gray-700 dark:hover:border-indigo-700 dark:hover:bg-indigo-900/20"
              >
                {cardContent}
              </Link>
            )
          }

          return (
            <div key={sub.quizType} className="rounded-xl border border-gray-200 p-4 dark:border-gray-700">
              {cardContent}
            </div>
          )
        })}
      </div>
    </Card>
  )
}
