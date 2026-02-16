import { describe, it, expect } from 'vitest'
import { calcJapaneseAxes } from './axis-jlpt'
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

describe('calcJapaneseAxes()', () => {
  describe('when user is Japanese', () => {
    it('returns all zeros', () => {
      const data = makeScoringData({ isJapanese: true })
      const result = calcJapaneseAxes(data)

      expect(result.vocabMastery).toBe(0)
      expect(result.grammarMastery).toBe(0)
      expect(result.readingMastery).toBe(0)
      expect(result.listeningMastery).toBe(0)
      expect(result.jlptNormalized).toBe(0)
      expect(result.itTermScore).toBe(0)
      expect(result.docReadingScore).toBe(0)
      expect(result.businessConvScore).toBe(0)
      expect(result.itJapaneseNormalized).toBe(0)
    })
  })

  describe('Axis 1: 生活日本語 (JLPT)', () => {
    it('returns 0 when no quiz scores exist', () => {
      const data = makeScoringData()
      const result = calcJapaneseAxes(data)
      expect(result.jlptNormalized).toBe(0)
    })

    it('uses assessment score only — ignores learning quiz scores', () => {
      const data = makeScoringData({
        assessmentScores: { 1: 75 },
        quizScoresByType: {
          jlpt_vocab: [80],
          jlpt_grammar: [70],
          jlpt_reading: [60],
          jlpt_listening: [50],
        },
      })
      const result = calcJapaneseAxes(data)

      // Sub-scores are still calculated from quizzes
      expect(result.vocabMastery).toBe(80)
      expect(result.grammarMastery).toBe(70)
      expect(result.readingMastery).toBe(60)
      expect(result.listeningMastery).toBe(50)

      // But normalized uses only assessment
      expect(result.jlptNormalized).toBe(75)
    })

    it('returns 0 normalized when only learning quizzes exist (no assessment)', () => {
      const data = makeScoringData({
        quizScoresByType: {
          jlpt_vocab: [100],
          jlpt_grammar: [100],
        },
      })
      const result = calcJapaneseAxes(data)
      expect(result.jlptNormalized).toBe(0)
    })
  })

  describe('Axis 2: ビジネス日本語 (IT Japanese)', () => {
    it('returns 0 when no IT quiz scores exist', () => {
      const data = makeScoringData()
      const result = calcJapaneseAxes(data)
      expect(result.itJapaneseNormalized).toBe(0)
    })

    it('uses assessment score only — ignores learning quiz scores', () => {
      const data = makeScoringData({
        assessmentScores: { 2: 70 },
        quizScoresByType: {
          it_terminology: [80],
          role_play_scenario: [60],
        },
      })
      const result = calcJapaneseAxes(data)

      // Sub-scores are still calculated from quizzes
      expect(result.itTermScore).toBe(80)
      expect(result.businessConvScore).toBe(60)
      expect(result.docReadingScore).toBe(64) // 80 * 0.8 = 64

      // But normalized uses only assessment
      expect(result.itJapaneseNormalized).toBe(70)
    })

    it('returns 0 normalized when only learning quizzes exist (no assessment)', () => {
      const data = makeScoringData({
        quizScoresByType: {
          it_terminology: [90],
        },
      })
      const result = calcJapaneseAxes(data)
      expect(result.itJapaneseNormalized).toBe(0)
    })
  })
})
