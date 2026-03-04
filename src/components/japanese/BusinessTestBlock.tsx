import Link from 'next/link'
import { Lock, ArrowRight } from 'lucide-react'
import { BJ_POOL_QUIZ_IDS } from '@/lib/assessment-config'

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
    <div className="max-w-2xl space-y-4">
      <div>
        <h2 className="text-lg font-semibold text-gray-900 dark:text-white">理解度テスト</h2>
        <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
          ※ 進行率{THRESHOLD}%以上でテストが解放されます
        </p>
      </div>

      <div className="space-y-3">
        {subcategories.map(sub => {
          const pct = sub.total > 0 ? Math.round((sub.mastered / sub.total) * 100) : 0
          const unlocked = bypassLock || pct >= THRESHOLD

          const card = (
            <div className={`rounded-xl border border-gray-200 p-4 transition-all dark:border-gray-700 ${
              unlocked ? 'hover:shadow-md' : ''
            }`}>
              <div className="flex items-center justify-between">
                <h3 className="font-semibold text-gray-900 dark:text-white">{sub.label}</h3>
                <span className={`text-sm font-semibold tabular-nums ${
                  pct >= THRESHOLD ? 'text-emerald-600 dark:text-emerald-400' : 'text-gray-500 dark:text-gray-400'
                }`}>
                  {pct}%
                </span>
              </div>

              {/* Progress bar */}
              <div className="mt-3 h-2 w-full overflow-hidden rounded-full bg-gray-100 dark:bg-gray-800">
                <div
                  className={`h-full rounded-full transition-all duration-500 ${
                    pct >= THRESHOLD
                      ? 'bg-indigo-500'
                      : 'bg-gray-300 dark:bg-gray-600'
                  }`}
                  style={{ width: `${Math.min(pct, 100)}%` }}
                />
              </div>

              {/* Progress detail */}
              <div className="mt-3 text-xs text-gray-500 dark:text-gray-400">
                {sub.mastered}/{sub.total}
              </div>

              {/* Action */}
              <div className="mt-3">
                {unlocked ? (
                  <span className="inline-flex items-center gap-1.5 text-sm font-medium text-indigo-600 dark:text-indigo-400">
                    テスト一覧へ
                    <ArrowRight className="h-4 w-4 transition-transform group-hover:translate-x-0.5" />
                  </span>
                ) : (
                  <span className="inline-flex items-center gap-1.5 text-sm text-gray-400 dark:text-gray-500">
                    <Lock className="h-3.5 w-3.5" />
                    進行率{THRESHOLD}%以上で解放
                  </span>
                )}
              </div>
            </div>
          )

          if (unlocked) {
            const poolQuizId = BJ_POOL_QUIZ_IDS[sub.quizType]
            const href = poolQuizId
              ? `/japanese/business/quiz/${poolQuizId}`
              : `/japanese/business/quiz?type=${sub.quizType}`
            return (
              <Link
                key={sub.quizType}
                href={href}
                className="group block"
              >
                {card}
              </Link>
            )
          }

          return <div key={sub.quizType}>{card}</div>
        })}
      </div>
    </div>
  )
}
