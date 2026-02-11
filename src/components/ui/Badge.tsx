import type { JlptLevel, CodingRank, ProblemDifficulty } from '@/lib/supabase/types'

type BadgeVariant = 'jlpt' | 'coding_rank' | 'difficulty' | 'default'

interface BadgeProps {
  label: string
  variant?: BadgeVariant
  className?: string
}

const jlptColors: Record<JlptLevel, string> = {
  N5: 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20 dark:bg-emerald-500/10 dark:text-emerald-400 dark:ring-emerald-500/20 bg-emerald-50 text-emerald-700 ring-emerald-200',
  N4: 'bg-blue-500/10 text-blue-400 ring-1 ring-blue-500/20 dark:bg-blue-500/10 dark:text-blue-400 dark:ring-blue-500/20 bg-blue-50 text-blue-700 ring-blue-200',
  N3: 'bg-amber-500/10 text-amber-400 ring-1 ring-amber-500/20 dark:bg-amber-500/10 dark:text-amber-400 dark:ring-amber-500/20 bg-amber-50 text-amber-700 ring-amber-200',
  N2: 'bg-orange-500/10 text-orange-400 ring-1 ring-orange-500/20 dark:bg-orange-500/10 dark:text-orange-400 dark:ring-orange-500/20 bg-orange-50 text-orange-700 ring-orange-200',
  N1: 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20 dark:bg-red-500/10 dark:text-red-400 dark:ring-red-500/20 bg-red-50 text-red-700 ring-red-200',
}

const rankColors: Record<CodingRank, string> = {
  D: 'bg-zinc-500/10 text-zinc-400 ring-1 ring-zinc-500/20 dark:bg-zinc-500/10 dark:text-zinc-400 dark:ring-zinc-500/20 bg-zinc-50 text-zinc-700 ring-zinc-200',
  C: 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20 dark:bg-emerald-500/10 dark:text-emerald-400 dark:ring-emerald-500/20 bg-emerald-50 text-emerald-700 ring-emerald-200',
  B: 'bg-blue-500/10 text-blue-400 ring-1 ring-blue-500/20 dark:bg-blue-500/10 dark:text-blue-400 dark:ring-blue-500/20 bg-blue-50 text-blue-700 ring-blue-200',
  A: 'bg-violet-500/10 text-violet-400 ring-1 ring-violet-500/20 dark:bg-violet-500/10 dark:text-violet-400 dark:ring-violet-500/20 bg-violet-50 text-violet-700 ring-violet-200',
  S: 'bg-amber-500/10 text-amber-400 ring-1 ring-amber-500/20 dark:bg-amber-500/10 dark:text-amber-400 dark:ring-amber-500/20 bg-amber-50 text-amber-700 ring-amber-200',
}

const difficultyColors: Record<ProblemDifficulty, string> = {
  easy: 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20 dark:bg-emerald-500/10 dark:text-emerald-400 dark:ring-emerald-500/20 bg-emerald-50 text-emerald-700 ring-emerald-200',
  medium: 'bg-amber-500/10 text-amber-400 ring-1 ring-amber-500/20 dark:bg-amber-500/10 dark:text-amber-400 dark:ring-amber-500/20 bg-amber-50 text-amber-700 ring-amber-200',
  hard: 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20 dark:bg-red-500/10 dark:text-red-400 dark:ring-red-500/20 bg-red-50 text-red-700 ring-red-200',
}

export default function Badge({ label, variant = 'default', className = '' }: BadgeProps) {
  let colorClass = 'bg-zinc-500/10 text-zinc-400 ring-1 ring-zinc-500/20 dark:bg-zinc-500/10 dark:text-zinc-400 dark:ring-zinc-500/20 bg-zinc-100 text-zinc-700 ring-zinc-200'

  if (variant === 'jlpt' && label in jlptColors) {
    colorClass = jlptColors[label as JlptLevel]
  } else if (variant === 'coding_rank' && label in rankColors) {
    colorClass = rankColors[label as CodingRank]
  } else if (variant === 'difficulty' && label in difficultyColors) {
    colorClass = difficultyColors[label as ProblemDifficulty]
  }

  return (
    <span className={`inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium ${colorClass} ${className}`}>
      {label}
    </span>
  )
}
