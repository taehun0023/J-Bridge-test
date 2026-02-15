/** Average an array of numbers, returning 0 for empty arrays */
export function avg(scores: number[]): number {
  if (scores.length === 0) return 0
  return Math.round(scores.reduce((a, b) => a + b, 0) / scores.length)
}

/** Difficulty multiplier for code submission scoring */
export const DIFFICULTY_MULTIPLIER: Record<string, number> = {
  easy: 0.6,
  medium: 0.8,
  hard: 1.0,
}

/** Coding rank → numeric score */
export const RANK_SCORES: Record<string, number> = {
  D: 20,
  C: 40,
  B: 60,
  A: 80,
  S: 100,
}
