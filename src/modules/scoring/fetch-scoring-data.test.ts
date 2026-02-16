import { describe, it, expect } from 'vitest'
import { mergeCompExamScores } from './fetch-scoring-data'
import type { AssessmentScores } from './types'

describe('mergeCompExamScores()', () => {
  it('applies comprehensive exam scores when no assessment scores exist', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 80 },
      { category: 'cs', score: 70 },
    ])
    expect(scores[1]).toBe(80)
    expect(scores[3]).toBe(70)
  })

  it('keeps assessment score when it is higher than comprehensive exam', () => {
    const scores: AssessmentScores = { 1: 90 }
    mergeCompExamScores(scores, [{ category: 'seikatsu', score: 75 }])
    expect(scores[1]).toBe(90)
  })

  it('uses comprehensive exam score when it is higher than assessment', () => {
    const scores: AssessmentScores = { 1: 70 }
    mergeCompExamScores(scores, [{ category: 'seikatsu', score: 85 }])
    expect(scores[1]).toBe(85)
  })

  it('picks the highest score among multiple exams in the same category', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'cs', score: 60 },
      { category: 'cs', score: 90 },
      { category: 'cs', score: 75 },
    ])
    expect(scores[3]).toBe(90)
  })

  it('ignores entries with null score', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [{ category: 'seikatsu', score: null }])
    expect(scores[1]).toBeUndefined()
  })

  it('ignores entries with unknown category', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [{ category: 'unknown', score: 80 }])
    expect(Object.keys(scores)).toHaveLength(0)
  })

  it('handles all five categories correctly', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 80 },
      { category: 'business-jp', score: 75 },
      { category: 'cs', score: 90 },
      { category: 'dev', score: 65 },
      { category: 'business-lit', score: 70 },
    ])
    expect(scores[1]).toBe(80)
    expect(scores[2]).toBe(75)
    expect(scores[3]).toBe(90)
    expect(scores[4]).toBe(65)
    expect(scores[5]).toBe(70)
  })

  it('handles empty comprehensive exam array', () => {
    const scores: AssessmentScores = { 1: 85 }
    mergeCompExamScores(scores, [])
    expect(scores[1]).toBe(85)
  })
})
