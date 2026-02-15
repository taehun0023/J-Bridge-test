import { describe, it, expect } from 'vitest'
import { calcCodingAxes } from './axis-core-programming'
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

describe('calcCodingAxes()', () => {
  describe('Axis 3: CS知識 (Core Programming)', () => {
    it('returns all zeros when no data exists', () => {
      const data = makeScoringData()
      const result = calcCodingAxes(data)

      expect(result.javaScore).toBe(0)
      expect(result.jsScore).toBe(0)
      expect(result.algorithmScore).toBe(0)
      expect(result.coreNormalized).toBe(0)
    })

    it('calculates language scores from code submissions', () => {
      const data = makeScoringData({
        bestByProblem: {
          'prob-1': { language: 'java', ratio: 1.0, difficulty: 'easy' },
          'prob-2': { language: 'java', ratio: 0.5, difficulty: 'medium' },
          'prob-3': { language: 'javascript', ratio: 0.8, difficulty: 'hard' },
        },
      })
      const result = calcCodingAxes(data)

      // java: prob-1 = 100*0.6=60, prob-2 = 50*0.8=40 → avg = 50
      expect(result.javaScore).toBe(50)
      // js: prob-3 = 80*1.0=80 → avg = 80
      expect(result.jsScore).toBe(80)
    })

    it('calculates algorithm score from medium/hard problems only', () => {
      const data = makeScoringData({
        bestByProblem: {
          'easy-1': { language: 'java', ratio: 1.0, difficulty: 'easy' },
          'med-1': { language: 'java', ratio: 1.0, difficulty: 'medium' },
          'hard-1': { language: 'java', ratio: 0.5, difficulty: 'hard' },
        },
      })
      const result = calcCodingAxes(data)

      // med-1: 100*0.8=80, hard-1: 50*1.0=50 → avg = 65
      expect(result.algorithmScore).toBe(65)
    })

    it('includes core_programming quiz scores', () => {
      const data = makeScoringData({
        quizScoresByType: {
          core_programming: [90, 80],
        },
      })
      const result = calcCodingAxes(data)

      // core quiz avg = 85, only non-zero score → coreNormalized = 85
      expect(result.coreNormalized).toBe(85)
    })

    it('uses assessment score if higher than learning', () => {
      const data = makeScoringData({
        assessmentScores: { 3: 95 },
        quizScoresByType: {
          core_programming: [50],
        },
      })
      const result = calcCodingAxes(data)
      expect(result.coreNormalized).toBe(95)
    })
  })

  describe('Axis 4: 開発実務能力 (Framework)', () => {
    it('returns all zeros when no exam data exists', () => {
      const data = makeScoringData()
      const result = calcCodingAxes(data)

      expect(result.springBootScore).toBe(0)
      expect(result.reactScore).toBe(0)
      expect(result.projectScore).toBe(0)
      expect(result.frameworkNormalized).toBe(0)
    })

    it('derives framework scores from highest rank score', () => {
      const data = makeScoringData({
        highestRankScore: 80, // A rank
      })
      const result = calcCodingAxes(data)

      expect(result.springBootScore).toBe(64) // 80 * 0.8
      expect(result.reactScore).toBe(56)      // 80 * 0.7
      expect(result.projectScore).toBe(48)    // 80 * 0.6
    })

    it('caps framework sub-scores at 100', () => {
      const data = makeScoringData({
        highestRankScore: 100, // S rank
      })
      const result = calcCodingAxes(data)

      expect(result.springBootScore).toBe(80)  // 100 * 0.8
      expect(result.reactScore).toBe(70)       // 100 * 0.7
      expect(result.projectScore).toBe(60)     // 100 * 0.6
    })

    it('uses assessment score if higher than learning', () => {
      const data = makeScoringData({
        assessmentScores: { 4: 90 },
        highestRankScore: 20, // D rank
      })
      const result = calcCodingAxes(data)
      expect(result.frameworkNormalized).toBe(90)
    })

    it('calculates dbDesignScore from language scores', () => {
      const data = makeScoringData({
        bestByProblem: {
          'prob-1': { language: 'java', ratio: 1.0, difficulty: 'easy' },
        },
      })
      const result = calcCodingAxes(data)

      // javaScore = 60 (100 * 0.6 easy multiplier)
      // dbDesignScore = 60 * 0.9 = 54
      expect(result.dbDesignScore).toBe(54)
    })
  })
})
