'use client'

import { useState } from 'react'
import Link from 'next/link'
import { Lock, ChevronRight, ChevronDown, CheckCircle2, ArrowRight } from 'lucide-react'

interface LevelProgress {
  vocabMastered: number
  vocabTotal: number
  grammarMastered: number
  grammarTotal: number
  readingMastered: number
  readingTotal: number
  listeningMastered: number
  listeningTotal: number
}

interface Props {
  levelProgress: Record<string, LevelProgress>
  bypassLock?: boolean
  examLevel?: string | null
}

const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const
const LEVEL_INDEX: Record<string, number> = { N5: 0, N4: 1, N3: 2, N2: 3, N1: 4 }
const THRESHOLD = 80

const LEVEL_COLORS: Record<string, string> = {
  N5: 'bg-gray-100 text-gray-700 dark:bg-gray-700 dark:text-gray-300',
  N4: 'bg-green-100 text-green-700 dark:bg-green-900/40 dark:text-green-300',
  N3: 'bg-blue-100 text-blue-700 dark:bg-blue-900/40 dark:text-blue-300',
  N2: 'bg-purple-100 text-purple-700 dark:bg-purple-900/40 dark:text-purple-300',
  N1: 'bg-amber-100 text-amber-700 dark:bg-amber-900/40 dark:text-amber-300',
}

const LEVEL_BORDERS: Record<string, string> = {
  N5: 'border-gray-400 dark:border-gray-500',
  N4: 'border-green-400 dark:border-green-600',
  N3: 'border-blue-400 dark:border-blue-600',
  N2: 'border-purple-400 dark:border-purple-600',
  N1: 'border-amber-400 dark:border-amber-600',
}

function getOverallProgress(p: LevelProgress): number {
  const total = p.vocabTotal + p.grammarTotal + p.readingTotal + p.listeningTotal
  if (total === 0) return 0
  const mastered = p.vocabMastered + p.grammarMastered + p.readingMastered + p.listeningMastered
  return Math.round((mastered / total) * 100)
}

type LevelStatus = 'unlocked' | 'examUnlocked' | 'locked'

function getLevelStatus(
  level: string,
  pct: number,
  bypassLock: boolean,
  examLevel: string | null,
): LevelStatus {
  if (bypassLock) return 'unlocked'
  const examIdx = examLevel ? (LEVEL_INDEX[examLevel] ?? -1) : -1
  const levelIdx = LEVEL_INDEX[level] ?? 0
  if (examIdx > 0 && levelIdx < examIdx) return 'examUnlocked'
  if (pct >= THRESHOLD) return 'unlocked'
  return 'locked'
}

export default function JlptTestBlock({ levelProgress, bypassLock = false, examLevel = null }: Props) {
  const [showCompleted, setShowCompleted] = useState(false)
  const [showHigher, setShowHigher] = useState(false)

  const activeLevels: { level: string; progress: LevelProgress; pct: number; status: LevelStatus }[] = []
  const completedLevels: { level: string; progress: LevelProgress; pct: number }[] = []
  const higherLevels: { level: string; progress: LevelProgress; pct: number; status: LevelStatus }[] = []

  for (const level of JLPT_LEVELS) {
    const progress = levelProgress[level]
    if (!progress) continue
    const pct = getOverallProgress(progress)
    const status = getLevelStatus(level, pct, bypassLock, examLevel)

    if (status === 'examUnlocked') {
      completedLevels.push({ level, progress, pct })
    } else if (!bypassLock && examLevel && level !== examLevel && LEVEL_INDEX[level] > (LEVEL_INDEX[examLevel] ?? -1)) {
      // Above current exam level — collapse into folder (not for admin/mentor)
      higherLevels.push({ level, progress, pct, status })
    } else {
      activeLevels.push({ level, progress, pct, status })
    }
  }

  return (
    <div className="max-w-2xl space-y-4">
      <div>
        <h2 className="text-lg font-semibold text-gray-900 dark:text-white">理解度テスト</h2>
        <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
          ※ 進行率{THRESHOLD}%以上でテストが解放されます
        </p>
      </div>

      {/* Active levels — full cards */}
      <div className="space-y-3">
        {activeLevels.map(({ level, progress, pct, status }) => {
          const badge = LEVEL_COLORS[level]
          const unlocked = status === 'unlocked'
          const isCurrent = examLevel === level
          const borderClass = isCurrent
            ? `border-2 ${LEVEL_BORDERS[level]}`
            : 'border border-gray-200 dark:border-gray-700'

          const card = (
            <div className={`rounded-xl ${borderClass} p-4 transition-all ${
              unlocked ? 'hover:shadow-md' : ''
            }`}>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <span className={`inline-flex rounded-md px-2.5 py-1 text-sm font-bold ${badge}`}>
                    {level}
                  </span>
                </div>
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

              {/* Category breakdown */}
              <div className="mt-3 grid grid-cols-2 gap-x-4 gap-y-1 text-xs text-gray-500 dark:text-gray-400 sm:grid-cols-4">
                <span>語彙 {progress.vocabMastered}/{progress.vocabTotal}</span>
                <span>文法 {progress.grammarMastered}/{progress.grammarTotal}</span>
                <span>読解 {progress.readingMastered}/{progress.readingTotal}</span>
                <span>聴解 {progress.listeningMastered}/{progress.listeningTotal}</span>
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
            return (
              <Link key={level} href={`/japanese/jlpt/quiz?level=${level}`} className="group block">
                {card}
              </Link>
            )
          }

          return <div key={level}>{card}</div>
        })}
      </div>

      {/* Completed (exam-unlocked) levels — collapsible */}
      {completedLevels.length > 0 && (
        <div className="rounded-xl border border-gray-200 dark:border-gray-700">
          <button
            onClick={() => setShowCompleted(!showCompleted)}
            className="flex w-full items-center gap-2 px-4 py-3 text-left text-sm font-medium text-gray-600 transition-colors hover:text-gray-900 dark:text-gray-400 dark:hover:text-white"
          >
            {showCompleted ? (
              <ChevronDown className="h-4 w-4" />
            ) : (
              <ChevronRight className="h-4 w-4" />
            )}
            学習済みレベル ({completedLevels.length})
          </button>

          {showCompleted && (
            <div className="grid gap-2 px-4 pb-4 sm:grid-cols-2">
              {completedLevels.map(({ level }) => {
                const badge = LEVEL_COLORS[level]
                return (
                  <Link
                    key={level}
                    href={`/japanese/jlpt/quiz?level=${level}`}
                    className="group flex items-center justify-between rounded-lg border border-gray-200 p-3 transition-all hover:shadow-sm dark:border-gray-700"
                  >
                    <div className="flex items-center gap-2">
                      <CheckCircle2 className="h-4 w-4 text-emerald-500" />
                      <span className={`inline-flex rounded-md px-2 py-0.5 text-sm font-bold ${badge}`}>
                        {level}
                      </span>
                    </div>
                    <span className="inline-flex items-center gap-1 text-sm text-indigo-600 dark:text-indigo-400">
                      テスト
                      <ArrowRight className="h-3.5 w-3.5 transition-transform group-hover:translate-x-0.5" />
                    </span>
                  </Link>
                )
              })}
            </div>
          )}
        </div>
      )}

      {/* Higher locked levels — collapsible */}
      {higherLevels.length > 0 && (
        <div className="rounded-xl border border-gray-200 dark:border-gray-700">
          <button
            onClick={() => setShowHigher(!showHigher)}
            className="flex w-full items-center gap-2 px-4 py-3 text-left text-sm font-medium text-gray-600 transition-colors hover:text-gray-900 dark:text-gray-400 dark:hover:text-white"
          >
            {showHigher ? (
              <ChevronDown className="h-4 w-4" />
            ) : (
              <ChevronRight className="h-4 w-4" />
            )}
            上位レベル ({higherLevels.length})
          </button>

          {showHigher && (
            <div className="grid gap-2 px-4 pb-4 sm:grid-cols-2">
              {higherLevels.map(({ level }) => {
                const badge = LEVEL_COLORS[level]
                return (
                  <div
                    key={level}
                    className="flex items-center justify-between rounded-lg border border-gray-200 p-3 dark:border-gray-700"
                  >
                    <div className="flex items-center gap-2">
                      <Lock className="h-4 w-4 text-gray-400" />
                      <span className={`inline-flex rounded-md px-2 py-0.5 text-sm font-bold ${badge}`}>
                        {level}
                      </span>
                    </div>
                    <span className="text-xs text-gray-400 dark:text-gray-500">ロック中</span>
                  </div>
                )
              })}
            </div>
          )}
        </div>
      )}
    </div>
  )
}
