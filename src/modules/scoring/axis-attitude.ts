import type { ScoringData, AttitudeAxisResult } from './types'

/**
 * Axis 5 (ビジネスリテラシー) calculation.
 * Uses only comprehensive assessment scores (not learning quiz scores).
 */
export function calcAttitudeAxis(data: ScoringData): AttitudeAxisResult {
  const { assessmentScores } = data
  const attitudeNormalized = assessmentScores[5] ?? 0

  return { attitudeNormalized }
}
