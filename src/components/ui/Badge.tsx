import type { JlptLevel, CodingRank, ProblemDifficulty } from '@/lib/supabase/types'

type BadgeVariant = 'jlpt' | 'coding_rank' | 'difficulty' | 'default'

interface BadgeProps {
  label: string
  variant?: BadgeVariant
  className?: string
}

const jlptColors: Record<JlptLevel, string> = {
  N5: 'bg-green-100 text-green-800',
  N4: 'bg-blue-100 text-blue-800',
  N3: 'bg-yellow-100 text-yellow-800',
  N2: 'bg-orange-100 text-orange-800',
  N1: 'bg-red-100 text-red-800',
}

const rankColors: Record<CodingRank, string> = {
  D: 'bg-gray-100 text-gray-800',
  C: 'bg-green-100 text-green-800',
  B: 'bg-blue-100 text-blue-800',
  A: 'bg-purple-100 text-purple-800',
  S: 'bg-yellow-100 text-yellow-900',
}

const difficultyColors: Record<ProblemDifficulty, string> = {
  easy: 'bg-green-100 text-green-800',
  medium: 'bg-yellow-100 text-yellow-800',
  hard: 'bg-red-100 text-red-800',
}

export default function Badge({ label, variant = 'default', className = '' }: BadgeProps) {
  let colorClass = 'bg-gray-100 text-gray-800'

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
