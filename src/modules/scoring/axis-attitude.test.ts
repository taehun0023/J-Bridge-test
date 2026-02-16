import { describe, it, expect } from 'vitest'
import { calcAttitudeAxis } from './axis-attitude'
import type { ScoringData } from './types'

function makeScoringData(overrides: Partial<ScoringData> = {}): ScoringData {
  return {
    isJapanese: false,
    assessmentScores: {},
    quizScoresByType: {},
    bestByProblem: {},
    highestRankScore: 0,
    ...overrides,
  }
}

describe('calcAttitudeAxis()', () => {
  it('returns 0 when no data exists', () => {
    const result = calcAttitudeAxis(makeScoringData())
    expect(result.attitudeNormalized).toBe(0)
  })

  it('uses assessment score', () => {
    const data = makeScoringData({
      assessmentScores: { 5: 95 },
    })
    const result = calcAttitudeAxis(data)
    expect(result.attitudeNormalized).toBe(95)
  })

  it('ignores learning quiz scores — only assessment matters', () => {
    const data = makeScoringData({
      quizScoresByType: {
        attitude_culture: [80, 90],
      },
    })
    const result = calcAttitudeAxis(data)
    expect(result.attitudeNormalized).toBe(0)
  })

  it('ignores learning quiz scores even when assessment is lower', () => {
    const data = makeScoringData({
      assessmentScores: { 5: 30 },
      quizScoresByType: {
        attitude_culture: [80, 90],
      },
    })
    const result = calcAttitudeAxis(data)
    expect(result.attitudeNormalized).toBe(30)
  })
})
