'use client'

import dynamic from 'next/dynamic'
import { useRouter } from 'next/navigation'
import { useState } from 'react'
import { finalizeOnboarding } from '@/app/actions/assessment'
import { getGrade, getGradeColor, DISPATCH_MINIMUM_SCORE } from '@/lib/assessment-config'

const RadarChart = dynamic(() => import('@/components/dashboard/RadarChart'), { ssr: false })

interface Props {
  radarScores: {
    jlpt: number
    itJapanese: number
    coreProgramming: number
    framework: number
    attitudeCulture: number
  }
  totalScore: number
}

const AXIS_LABELS = [
  { key: 'jlpt' as const, label: 'JLPT' },
  { key: 'itJapanese' as const, label: 'IT日本語' },
  { key: 'coreProgramming' as const, label: '基本プログラミング' },
  { key: 'framework' as const, label: 'フレームワーク' },
  { key: 'attitudeCulture' as const, label: '態度・文化' },
] as const

export default function ResultsSummary({ radarScores, totalScore }: Props) {
  const router = useRouter()
  const [pending, setPending] = useState(false)

  async function handleStart() {
    setPending(true)
    await finalizeOnboarding()
    router.push('/dashboard')
  }

  return (
    <div>
      <div className="text-center">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">初期ランク試験完了！</h1>
        <p className="mt-2 text-gray-500 dark:text-gray-400">
          合計点: <span className="font-bold text-blue-600 text-lg">{totalScore}</span> / 500点
        </p>
      </div>

      {/* Radar chart */}
      <div className="mt-6 mx-auto max-w-md">
        <RadarChart scores={radarScores} />
      </div>

      {/* Score cards with grade badges */}
      <div className="mt-6 grid gap-3 sm:grid-cols-5">
        {AXIS_LABELS.map(({ key, label }) => {
          const score = radarScores[key]
          const grade = getGrade(score)
          const gradeColor = getGradeColor(grade)
          const isBelowB = score < DISPATCH_MINIMUM_SCORE
          return (
            <div
              key={key}
              className={`rounded-xl border p-4 text-center ${
                isBelowB
                  ? 'border-red-300 bg-red-50 dark:border-red-800 dark:bg-red-950/30'
                  : 'border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900'
              }`}
            >
              <p className="text-xs font-medium text-gray-500 dark:text-gray-400">{label}</p>
              <p className={`mt-1 text-2xl font-bold ${isBelowB ? 'text-red-600 dark:text-red-400' : 'text-gray-900 dark:text-white'}`}>
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
        <p className="text-sm text-gray-500 dark:text-gray-400 mb-4">
          これから学習を始めると各分野のスコアが向上します
        </p>
        <button
          onClick={handleStart}
          disabled={pending}
          className="rounded-xl bg-blue-600 px-8 py-3 text-sm font-semibold text-white shadow-sm hover:bg-blue-700 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {pending ? '移動中...' : '学習を始める'}
        </button>
      </div>
    </div>
  )
}
