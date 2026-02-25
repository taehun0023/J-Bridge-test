import Link from 'next/link'
import Card from '@/components/ui/Card'
import { Lock } from 'lucide-react'

interface LevelProgress {
  vocabMastered: number
  vocabTotal: number
  grammarMastered: number
  grammarTotal: number
  kanjiMastered: number
  kanjiTotal: number
  readingMastered: number
  readingTotal: number
  listeningMastered: number
  listeningTotal: number
}

interface Props {
  levelProgress: Record<string, LevelProgress>
}

const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const
const THRESHOLD = 80

function getOverallProgress(p: LevelProgress): number {
  const total = p.vocabTotal + p.grammarTotal + p.kanjiTotal + p.readingTotal + p.listeningTotal
  if (total === 0) return 0
  const mastered = p.vocabMastered + p.grammarMastered + p.kanjiMastered + p.readingMastered + p.listeningMastered
  return Math.round((mastered / total) * 100)
}

export default function JlptTestBlock({ levelProgress }: Props) {
  return (
    <Card>
      <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">理解度テスト</h2>
      <p className="mb-4 text-xs text-gray-500 dark:text-gray-400">
        ※ 進行率{THRESHOLD}%以上でテストが解放されます
      </p>

      <div className="space-y-4">
        {JLPT_LEVELS.map(level => {
          const progress = levelProgress[level]
          if (!progress) return null

          const pct = getOverallProgress(progress)
          const unlocked = pct >= THRESHOLD

          const cardContent = (
            <>
              <div className="mb-2 flex items-center justify-between">
                <h3 className="font-semibold text-gray-900 dark:text-white">{level}</h3>
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
              <div className="mb-3 flex flex-wrap gap-x-4 gap-y-1 text-xs text-gray-500 dark:text-gray-400">
                <span>語彙 {progress.vocabMastered}/{progress.vocabTotal}</span>
                <span>文法 {progress.grammarMastered}/{progress.grammarTotal}</span>
                <span>漢字 {progress.kanjiMastered}/{progress.kanjiTotal}</span>
                <span>読解 {progress.readingMastered}/{progress.readingTotal}</span>
                <span>聴解 {progress.listeningMastered}/{progress.listeningTotal}</span>
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
                key={level}
                href={`/japanese/jlpt/quiz?level=${level}`}
                className="block rounded-xl border border-gray-200 p-4 transition-colors hover:border-indigo-300 hover:bg-indigo-50/50 dark:border-gray-700 dark:hover:border-indigo-700 dark:hover:bg-indigo-900/20"
              >
                {cardContent}
              </Link>
            )
          }

          return (
            <div key={level} className="rounded-xl border border-gray-200 p-4 dark:border-gray-700">
              {cardContent}
            </div>
          )
        })}
      </div>
    </Card>
  )
}
