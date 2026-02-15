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

  it('calculates from attitude_culture quiz scores', () => {
    const data = makeScoringData({
      quizScoresByType: {
        attitude_culture: [80, 90],
      },
    })
    const result = calcAttitudeAxis(data)
    expect(result.attitudeNormalized).toBe(85)
  })

  it('uses assessment score if higher than learning', () => {
    const data = makeScoringData({
      assessmentScores: { 5: 95 },
      quizScoresByType: {
        attitude_culture: [50],
      },
    })
    const result = calcAttitudeAxis(data)
    expect(result.attitudeNormalized).toBe(95)
  })

  it('uses learning score if higher than assessment', () => {
    const data = makeScoringData({
      assessmentScores: { 5: 30 },
      quizScoresByType: {
        attitude_culture: [80, 90],
      },
    })
    const result = calcAttitudeAxis(data)
    expect(result.attitudeNormalized).toBe(85)
  })

  it('handles single quiz score', () => {
    const data = makeScoringData({
      quizScoresByType: {
        attitude_culture: [100],
      },
    })
    const result = calcAttitudeAxis(data)
    expect(result.attitudeNormalized).toBe(100)
  })
})
