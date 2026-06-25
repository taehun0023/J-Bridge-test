import { describe, it, expect } from 'vitest'
import { mergeCompExamScores } from './fetch-scoring-data'
import { JLPT_MOCK_LEVEL_NORMALIZED } from '@/lib/assessment-config'
import type { AssessmentScores } from './types'

describe('mergeCompExamScores()', () => {
  it('applies non-JLPT comprehensive exam scores', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'cs', score: 70, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'business-jp', score: 75, completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[3]).toBe(70)
    expect(scores[2]).toBe(75)
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
    mergeCompExamScores(scores, [{ category: 'cs', score: null, completed_at: '2026-01-01T00:00:00Z' }])
    expect(scores[3]).toBeUndefined()
  })

  it('ignores entries with unknown category', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [{ category: 'unknown', score: 80, completed_at: '2026-01-01T00:00:00Z' }])
    expect(Object.keys(scores)).toHaveLength(0)
  })

  it('handles the four non-JLPT categories correctly', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'business-jp', score: 75, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'cs', score: 90, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'dev', score: 65, completed_at: '2026-01-01T00:00:00Z' },
      { category: 'business-lit', score: 70, completed_at: '2026-01-01T00:00:00Z' },
    ])
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

  // ─── JLPT axis (step 1): only JLPT模試(jlpt-mock) counts ───

  it('JLPT axis: legacy seikatsu exams are NOT reflected', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'seikatsu', score: 90, content_level: 'N1', completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[1]).toBeUndefined()
  })

  it('JLPT axis: legacy seikatsu does not overwrite an existing score', () => {
    const scores: AssessmentScores = { 1: 70 }
    mergeCompExamScores(scores, [{ category: 'seikatsu', score: 30, completed_at: '2026-02-01T00:00:00Z' }])
    expect(scores[1]).toBe(70)
  })

  it('JLPT axis: jlpt-mock passed level → normalized score (highest level wins)', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'jlpt-mock', score: 80, content_level: 'N3', passed: true, completed_at: '2026-03-01T00:00:00Z' },
      { category: 'jlpt-mock', score: 75, content_level: 'N1', passed: true, completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[1]).toBe(JLPT_MOCK_LEVEL_NORMALIZED.N1) // 100
  })

  it('JLPT axis: only passed jlpt-mock exams count', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'jlpt-mock', score: 30, content_level: 'N1', passed: false, completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[1]).toBeUndefined()
  })

  it('JLPT axis: passing lower level beats a failed higher level', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'jlpt-mock', score: 30, content_level: 'N1', passed: false, completed_at: '2026-02-01T00:00:00Z' },
      { category: 'jlpt-mock', score: 95, content_level: 'N3', passed: true, completed_at: '2026-01-01T00:00:00Z' },
    ])
    expect(scores[1]).toBe(JLPT_MOCK_LEVEL_NORMALIZED.N3) // 70
  })

  it('non-JLPT category keeps latest strategy (cs, N-level ignored)', () => {
    const scores: AssessmentScores = {}
    mergeCompExamScores(scores, [
      { category: 'cs', score: 60, content_level: 'N1', completed_at: '2026-03-01T00:00:00Z' }, // newest
      { category: 'cs', score: 95, content_level: 'N5', completed_at: '2026-01-01T00:00:00Z' }, // older but higher level
    ])
    expect(scores[3]).toBe(60) // latest wins for cs (N-level ignored)
  })
})
