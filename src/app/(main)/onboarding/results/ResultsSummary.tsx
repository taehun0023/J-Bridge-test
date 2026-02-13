'use client'

import dynamic from 'next/dynamic'
import { useRouter } from 'next/navigation'
import { useState } from 'react'
import { finalizeOnboarding } from '@/app/actions/assessment'
import { getGrade, getGradeColor, DISPATCH_MINIMUM_SCORE, getRelevantAxes, AXIS_DISPLAY_LABELS } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'

const RadarChart = dynamic(() => import('@/components/dashboard/RadarChart'), { ssr: false })

interface Props {
  radarScores: Record<AxisKey, number>
  totalScore: number
  maxScore: number
  isJapanese: boolean
}

export default function ResultsSummary({ radarScores, totalScore, maxScore, isJapanese }: Props) {
  const router = useRouter()
  const [pending, setPending] = useState(false)

  const relevantAxes = getRelevantAxes(isJapanese)
  const gridCols = isJapanese ? 'sm:grid-cols-3' : 'sm:grid-cols-5'

  async function handleStart() {
    setPending(true)
    await finalizeOnboarding()
    router.push('/dashboard')
  }

  return (
    <div>
      <div className="text-center">
        <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">初期総合試験完了！</h1>
        <p className="mt-2 text-zinc-500 dark:text-zinc-400">
          合計点: <span className="font-mono font-bold text-indigo-400 text-lg">{totalScore}</span> / {maxScore}点
        </p>
      </div>

      {/* Radar chart */}
      <div className="mt-6 mx-auto max-w-md">
        <RadarChart scores={radarScores} isJapanese={isJapanese} />
      </div>

      {/* Score cards with grade badges */}
      <div className={`mt-6 grid gap-3 ${gridCols}`}>
        {relevantAxes.map((key) => {
          const score = radarScores[key]
          const grade = getGrade(score)
          const gradeColor = getGradeColor(grade)
          const isBelowB = score < DISPATCH_MINIMUM_SCORE
          return (
            <div
              key={key}
              className={`rounded-2xl border p-4 text-center backdrop-blur-md ${
                isBelowB
                  ? 'border-red-500/20 bg-red-500/5 dark:border-red-500/20 dark:bg-red-500/5'
                  : 'border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 bg-white/80'
              }`}
            >
              <p className="text-xs font-medium text-zinc-500 dark:text-zinc-400">{AXIS_DISPLAY_LABELS[key]}</p>
              <p className={`mt-1 text-2xl font-mono font-bold ${isBelowB ? 'text-red-400' : 'text-zinc-900 dark:text-zinc-100'}`}>
                {score}
              </p>
              <span className={`mt-1 inline-block rounded-full px-2.5 py-0.5 text-xs font-bold ${gradeColor}`}>
                {grade}
              </span>
            </div>
          )
        })}
      </div>

      {/* CTA */}
      <div className="mt-8 text-center">
        <p className="text-sm text-zinc-500 dark:text-zinc-400 mb-4">
          これから学習を始めると各分野のスコアが向上します
        </p>
        <button
          onClick={handleStart}
          disabled={pending}
          className="rounded-xl bg-indigo-600 px-8 py-3 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
        >
          {pending ? '移動中...' : '学習を始める'}
        </button>
      </div>
    </div>
  )
}
