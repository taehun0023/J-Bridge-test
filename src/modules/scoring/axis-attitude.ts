import { avg } from './utils'
import type { ScoringData, AttitudeAxisResult } from './types'

/**
 * Axis 5 (ビジネスリテラシー) calculation.
 * Currently all sub-scores mirror the normalized value.
 */
export function calcAttitudeAxis(data: ScoringData): AttitudeAxisResult {
  const { quizScoresByType, assessmentScores } = data

  const learningAttitude = avg(quizScoresByType['attitude_culture'] ?? [])
  const attitudeNormalized = Math.max(assessmentScores[5] ?? 0, learningAttitude)

  return { attitudeNormalized }
}
