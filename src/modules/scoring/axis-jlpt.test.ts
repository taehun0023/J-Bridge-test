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

    it('calculates weighted average of JLPT sub-scores', () => {
      const data = makeScoringData({
        quizScoresByType: {
          jlpt_vocab: [80],
          jlpt_grammar: [70],
          jlpt_reading: [60],
          jlpt_listening: [50],
        },
      })
      const result = calcJapaneseAxes(data)

      expect(result.vocabMastery).toBe(80)
      expect(result.grammarMastery).toBe(70)
      expect(result.readingMastery).toBe(60)
      expect(result.listeningMastery).toBe(50)

      // Weighted: (80*0.3 + 70*0.3 + 60*0.25 + 50*0.15) / 1.0 = 67.5 → 68
      expect(result.jlptNormalized).toBe(68)
    })

    it('uses assessment score if higher than learning score', () => {
      const data = makeScoringData({
        assessmentScores: { 1: 90 },
        quizScoresByType: {
          jlpt_vocab: [50],
          jlpt_grammar: [50],
        },
      })
      const result = calcJapaneseAxes(data)
      expect(result.jlptNormalized).toBe(90)
    })

    it('uses learning score if higher than assessment score', () => {
      const data = makeScoringData({
        assessmentScores: { 1: 30 },
        quizScoresByType: {
          jlpt_vocab: [80],
          jlpt_grammar: [80],
          jlpt_reading: [80],
          jlpt_listening: [80],
        },
      })
      const result = calcJapaneseAxes(data)
      expect(result.jlptNormalized).toBe(80)
    })

    it('handles partial JLPT scores (only active parts weighted)', () => {
      const data = makeScoringData({
        quizScoresByType: {
          jlpt_vocab: [100],
          // no grammar, reading, listening
        },
      })
      const result = calcJapaneseAxes(data)

      expect(result.vocabMastery).toBe(100)
      expect(result.grammarMastery).toBe(0)
      // Only vocab is active, so normalized = 100
      expect(result.jlptNormalized).toBe(100)
    })
  })

  describe('Axis 2: ビジネス日本語 (IT Japanese)', () => {
    it('returns 0 when no IT quiz scores exist', () => {
      const data = makeScoringData()
      const result = calcJapaneseAxes(data)
      expect(result.itJapaneseNormalized).toBe(0)
    })

    it('calculates IT Japanese scores from terminology and role-play', () => {
      const data = makeScoringData({
        quizScoresByType: {
          it_terminology: [80],
          role_play_scenario: [60],
        },
      })
      const result = calcJapaneseAxes(data)

      expect(result.itTermScore).toBe(80)
      expect(result.businessConvScore).toBe(60)
      expect(result.docReadingScore).toBe(64) // 80 * 0.8 = 64
      expect(result.itJapaneseNormalized).toBeGreaterThan(0)
    })

    it('uses assessment score if higher', () => {
      const data = makeScoringData({
        assessmentScores: { 2: 95 },
        quizScoresByType: {
          it_terminology: [50],
        },
      })
      const result = calcJapaneseAxes(data)
      expect(result.itJapaneseNormalized).toBe(95)
    })
  })
})
