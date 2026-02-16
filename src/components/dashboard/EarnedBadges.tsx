'use client'

import { Lock } from 'lucide-react'
import type { CourseWithProgress } from '@/lib/course-progress'

interface BadgeConfig {
  label: string
  emoji: string
  gradient: string
  glowColor: string
  textColor: string
  borderColor: string
}

const DIFFICULTY_BADGE: Record<string, BadgeConfig> = {
  beginner: {
    label: 'Bronze',
    emoji: '\u{1F949}',
    gradient: 'from-amber-700/20 to-orange-900/20',
    glowColor: 'shadow-amber-500/20',
    textColor: 'text-amber-500 dark:text-amber-400',
    borderColor: 'border-amber-600/30',
  },
  intermediate: {
    label: 'Silver',
    emoji: '\u{1F948}',
    gradient: 'from-gray-300/20 to-slate-400/20',
    glowColor: 'shadow-gray-300/20',
    textColor: 'text-gray-400 dark:text-gray-300',
    borderColor: 'border-gray-400/30',
  },
  advanced: {
    label: 'Gold',
    emoji: '\u{1F947}',
    gradient: 'from-yellow-400/20 to-amber-500/20',
    glowColor: 'shadow-yellow-400/20',
    textColor: 'text-yellow-500 dark:text-yellow-400',
    borderColor: 'border-yellow-500/30',
  },
}

interface EarnedBadgesProps {
  language: string
  badges: CourseWithProgress[]
}

export default function EarnedBadges({ language, badges }: EarnedBadgesProps) {
  return (
    <div>
      <p className="mb-3 text-xs font-medium text-zinc-500 dark:text-zinc-400">{language}</p>
      <div className="grid grid-cols-3 gap-2">
        {badges.map((course) => {
          const config = DIFFICULTY_BADGE[course.difficulty] ?? DIFFICULTY_BADGE.beginner

          if (course.isCompleted) {
            return (
              <div
                key={course.id}
                className={`relative rounded-xl border ${config.borderColor} bg-gradient-to-br ${config.gradient} p-3 text-center shadow-lg ${config.glowColor}`}
              >
                <div className="text-3xl">{config.emoji}</div>
                <p className={`mt-1 text-sm font-bold ${config.textColor}`}>{config.label}</p>
                <span className="mt-1 inline-block rounded-full bg-emerald-500/10 px-2 py-0.5 text-[10px] font-medium text-emerald-400 ring-1 ring-emerald-500/20">
                  取得済み
                </span>
              </div>
            )
          }

          if (course.isLocked) {
            return (
              <div
                key={course.id}
                className="rounded-xl border border-white/[0.06] bg-white/[0.02] dark:border-white/[0.06] dark:bg-white/[0.02] border-gray-200/40 p-3 text-center opacity-50"
              >
                <Lock className="mx-auto h-7 w-7 text-zinc-500" />
                <p className="mt-1 text-sm font-bold text-zinc-500">{config.label}</p>
              </div>
            )
          }

          // In progress
          const pct = course.totalQuizzes > 0 ? Math.round((course.passedQuizzes / course.totalQuizzes) * 100) : 0
          return (
            <div
              key={course.id}
              className="rounded-xl border border-white/[0.08] bg-white/[0.03] dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 p-3 text-center"
            >
              <div className="text-3xl opacity-40">{config.emoji}</div>
              <p className={`mt-1 text-sm font-bold ${config.textColor} opacity-60`}>{config.label}</p>
              <div className="mt-2">
                <div className="h-1.5 w-full rounded-full bg-gray-200 dark:bg-gray-700">
                  <div
                    className="h-1.5 rounded-full bg-indigo-500 transition-all"
                    style={{ width: `${pct}%` }}
                  />
                </div>
                <p className="mt-1 text-[10px] text-zinc-500">{course.passedQuizzes}/{course.totalQuizzes}</p>
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
