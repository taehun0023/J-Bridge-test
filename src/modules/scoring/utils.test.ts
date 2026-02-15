import { describe, it, expect } from 'vitest'
import { avg, DIFFICULTY_MULTIPLIER, RANK_SCORES } from './utils'

describe('avg()', () => {
  it('returns 0 for empty array', () => {
    expect(avg([])).toBe(0)
  })

  it('returns the value for single-element array', () => {
    expect(avg([75])).toBe(75)
  })

  it('calculates average and rounds', () => {
    expect(avg([80, 90])).toBe(85)
    expect(avg([70, 80, 90])).toBe(80)
  })

  it('rounds to nearest integer', () => {
    expect(avg([33, 34])).toBe(34) // 33.5 → 34
    expect(avg([10, 11, 12])).toBe(11) // 11.0
  })

  it('handles all zeros', () => {
    expect(avg([0, 0, 0])).toBe(0)
  })

  it('handles 100s', () => {
    expect(avg([100, 100, 100])).toBe(100)
  })
})

describe('DIFFICULTY_MULTIPLIER', () => {
  it('has correct values for easy/medium/hard', () => {
    expect(DIFFICULTY_MULTIPLIER['easy']).toBe(0.6)
    expect(DIFFICULTY_MULTIPLIER['medium']).toBe(0.8)
    expect(DIFFICULTY_MULTIPLIER['hard']).toBe(1.0)
  })
})

describe('RANK_SCORES', () => {
  it('maps coding ranks to numeric scores', () => {
    expect(RANK_SCORES['D']).toBe(20)
    expect(RANK_SCORES['C']).toBe(40)
    expect(RANK_SCORES['B']).toBe(60)
    expect(RANK_SCORES['A']).toBe(80)
    expect(RANK_SCORES['S']).toBe(100)
  })

  it('returns undefined for invalid rank', () => {
    expect(RANK_SCORES['X']).toBeUndefined()
  })
})
