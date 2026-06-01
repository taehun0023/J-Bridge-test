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
    // seikatsu: both have no content_level → tie at rank 0 → most recent (55) wins
    expect(scores[1]).toBe(55)
    expect(scores[3]).toBe(80) // latest cs
  })

  it('seikatsu: picks highest N-level (N1 > N5) regardless of date', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 70, content_level: 'N5', completed_at: '2026-03-01T00:00:00Z' }, // newest, lowest level
      { category: 'seikatsu', score: 60, content_level: 'N3', completed_at: '2026-02-01T00:00:00Z' },
      { category: 'seikatsu', score: 50, content_level: 'N1', completed_at: '2026-01-01T00:00:00Z' }, // oldest, highest level
    ])
    expect(scores[1]).toBe(50) // N1 wins even with low score and old date
  })

  it('seikatsu: failing high-level exam still wins over passing low-level', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 30, content_level: 'N1', completed_at: '2026-01-01T00:00:00Z' }, // failed N1
      { category: 'seikatsu', score: 95, content_level: 'N3', completed_at: '2026-02-01T00:00:00Z' }, // passed N3
    ])
    expect(scores[1]).toBe(30) // N1 wins
  })

  it('seikatsu: same N-level uses most recent', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 75, content_level: 'N2', completed_at: '2026-03-01T00:00:00Z' }, // newer
      { category: 'seikatsu', score: 90, content_level: 'N2', completed_at: '2026-01-01T00:00:00Z' }, // older
    ])
    expect(scores[1]).toBe(75) // newer N2 wins (tiebreaker)
  })

  it('seikatsu: missing content_level falls back to tie at rank 0', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 80, content_level: null, completed_at: '2026-02-01T00:00:00Z' }, // unranked
      { category: 'seikatsu', score: 65, content_level: 'N4', completed_at: '2026-01-01T00:00:00Z' }, // ranked N4
    ])
    expect(scores[1]).toBe(65) // N4 wins over unranked
  })

  it('non-seikatsu category keeps latest strategy (cs)', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'cs', score: 60, content_level: 'N1', completed_at: '2026-03-01T00:00:00Z' }, // newest
      { category: 'cs', score: 95, content_level: 'N5', completed_at: '2026-01-01T00:00:00Z' }, // older but higher level
    ])
    expect(scores[3]).toBe(60) // latest wins for cs (N-level ignored)
  })
})
