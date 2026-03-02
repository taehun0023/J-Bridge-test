import { describe, it, expect } from 'vitest'
import { mergeCompExamScores } from './fetch-scoring-data'
import type { AssessmentScores } from './types'

describe('mergeCompExamScores()', () => {
  it('applies comprehensive exam scores when no assessment scores exist', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 80, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'cs', score: 70, completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[1]).toBe(80)
    expect(scores[3]).toBe(70)
  })

  it('overwrites assessment score with latest comprehensive exam (even if lower)', () => {
    const scores: AssessmentScores = { 1: 90 }
    mergeCompExamScores(scores, [{ category: 'seikatsu', score: 75, completed_at: '2026-02-01T00:00:00Z' }])
    expect(scores[1]).toBe(75)
  })

  it('overwrites assessment score with latest comprehensive exam (higher)', () => {
    const scores: AssessmentScores = { 1: 70 }
    mergeCompExamScores(scores, [{ category: 'seikatsu', score: 85, completed_at: '2026-02-01T00:00:00Z' }])
    expect(scores[1]).toBe(85)
  })

  it('uses the most recent exam (first in DESC-sorted array) for same category', () => {
    const scores: AssessmentScores = {}
    // Array is sorted by completed_at DESC — first entry is most recent
    mergeCompExamScores(scores, [
      { category: 'cs', score: 75, completed_at: '2026-03-01T00:00:00Z' },
      { category: 'cs', score: 90, completed_at: '2026-02-01T00:00:00Z' },
      { category: 'cs', score: 60, completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[3]).toBe(75) // latest wins, not max
  })

  it('ignores entries with null score', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [{ category: 'seikatsu', score: null, completed_at: '2026-01-01T00:00:00Z' }])
    expect(scores[1]).toBeUndefined()
  })

  it('ignores entries with unknown category', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [{ category: 'unknown', score: 80, completed_at: '2026-01-01T00:00:00Z' }])
    expect(Object.keys(scores)).toHaveLength(0)
  })

  it('handles all five categories correctly', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 80, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'business-jp', score: 75, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'cs', score: 90, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'dev', score: 65, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'business-lit', score: 70, completed_at: '2026-01-01T00:00:00Z' },
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

  it('skips null score entries but still picks latest non-null', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'cs', score: null, completed_at: '2026-03-01T00:00:00Z' },
      { category: 'cs', score: 60, completed_at: '2026-02-01T00:00:00Z' },
    ])
    expect(scores[3]).toBe(60)
  })

  it('handles mixed categories with different timestamps', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 55, completed_at: '2026-03-01T00:00:00Z' },
      { category: 'cs', score: 80, completed_at: '2026-02-15T00:00:00Z' },
      { category: 'seikatsu', score: 90, completed_at: '2026-02-01T00:00:00Z' },
      { category: 'cs', score: 60, completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[1]).toBe(55) // latest seikatsu
    expect(scores[3]).toBe(80) // latest cs
  })
})
