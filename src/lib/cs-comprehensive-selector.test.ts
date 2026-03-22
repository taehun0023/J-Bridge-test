import { describe, expect, it } from 'vitest'
import { selectCsComprehensiveQuestionsFromPool, type CsComprehensiveQuestion } from './cs-comprehensive-selector'
import {
  CS_COMPREHENSIVE_CATEGORIES,
  CS_COMPREHENSIVE_CATEGORY_COUNT,
  CS_COMPREHENSIVE_DIFFICULTY_COUNTS,
  CS_COMPREHENSIVE_TOTAL_QUESTIONS,
} from '@/lib/assessment-config'

function makeQuestion(
  id: string,
  question_category: string,
  difficulty: string | null,
  overrides: Partial<CsComprehensiveQuestion> = {},
): CsComprehensiveQuestion {
  return {
    id,
    question_category,
    difficulty,
    question_usage_scope: 'understanding_only',
    curriculum_status: 'aligned',
    ...overrides,
  }
}

describe('selectCsComprehensiveQuestionsFromPool', () => {
  it('returns 80 questions with 10 per category and 3/5/2 mix when inventory is sufficient', () => {
    const pool: CsComprehensiveQuestion[] = []

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      for (let i = 0; i < 6; i++) pool.push(makeQuestion(`${category}-e-${i}`, category, 'easy'))
      for (let i = 0; i < 8; i++) pool.push(makeQuestion(`${category}-m-${i}`, category, 'medium'))
      for (let i = 0; i < 4; i++) pool.push(makeQuestion(`${category}-h-${i}`, category, 'hard'))
    }

    const selected = selectCsComprehensiveQuestionsFromPool(pool)

    expect(selected).toHaveLength(CS_COMPREHENSIVE_TOTAL_QUESTIONS)

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      const categoryRows = selected.filter(q => q.question_category === category)
      expect(categoryRows).toHaveLength(CS_COMPREHENSIVE_CATEGORY_COUNT)
      expect(categoryRows.filter(q => q.difficulty === 'easy')).toHaveLength(CS_COMPREHENSIVE_DIFFICULTY_COUNTS.easy)
      expect(categoryRows.filter(q => q.difficulty === 'medium')).toHaveLength(CS_COMPREHENSIVE_DIFFICULTY_COUNTS.medium)
      expect(categoryRows.filter(q => q.difficulty === 'hard')).toHaveLength(CS_COMPREHENSIVE_DIFFICULTY_COUNTS.hard)
    }
  })

  it('fills shortages from the same category only when one difficulty bucket is insufficient', () => {
    const pool: CsComprehensiveQuestion[] = []

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      for (let i = 0; i < 2; i++) pool.push(makeQuestion(`${category}-e-${i}`, category, 'easy'))
      for (let i = 0; i < 8; i++) pool.push(makeQuestion(`${category}-m-${i}`, category, 'medium'))
      for (let i = 0; i < 6; i++) pool.push(makeQuestion(`${category}-h-${i}`, category, 'hard'))
    }

    const selected = selectCsComprehensiveQuestionsFromPool(pool)

    expect(selected).toHaveLength(CS_COMPREHENSIVE_TOTAL_QUESTIONS)

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      const categoryRows = selected.filter(q => q.question_category === category)
      expect(categoryRows).toHaveLength(CS_COMPREHENSIVE_CATEGORY_COUNT)
      expect(categoryRows.filter(q => q.difficulty === 'easy')).toHaveLength(2)
      expect(categoryRows.filter(q => q.difficulty === 'medium').length + categoryRows.filter(q => q.difficulty === 'hard').length).toBe(8)
    }
  })

  it('does not borrow from other categories when a category cannot reach 10 questions', () => {
    const pool: CsComprehensiveQuestion[] = []

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      const total = category === 'os' ? 7 : 12
      for (let i = 0; i < total; i++) {
        const difficulty = i < 3 ? 'easy' : i < 8 ? 'medium' : 'hard'
        pool.push(makeQuestion(`${category}-${i}`, category, difficulty))
      }
    }

    const selected = selectCsComprehensiveQuestionsFromPool(pool)
    const osRows = selected.filter(q => q.question_category === 'os')
    const nonOsRows = selected.filter(q => q.question_category !== 'os')

    expect(osRows).toHaveLength(7)
    expect(nonOsRows).toHaveLength(7 * CS_COMPREHENSIVE_CATEGORY_COUNT)
    expect(selected).toHaveLength(nonOsRows.length + osRows.length)
  })

  it('excludes out_of_scope or exclude-scoped questions and preserves 3/5/2 with two operational scopes', () => {
    const pool: CsComprehensiveQuestion[] = []

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      for (let i = 0; i < 3; i++) {
        pool.push(makeQuestion(`${category}-e-comp-${i}`, category, 'easy', { question_usage_scope: 'comprehensive_only' }))
      }
      for (let i = 0; i < 5; i++) {
        pool.push(makeQuestion(`${category}-m-under-${i}`, category, 'medium', { question_usage_scope: 'understanding_only' }))
      }
      for (let i = 0; i < 2; i++) {
        pool.push(makeQuestion(`${category}-h-comp-${i}`, category, 'hard', { question_usage_scope: 'comprehensive_only' }))
      }
      pool.push(makeQuestion(`${category}-excluded`, category, 'easy', { question_usage_scope: 'exclude' }))
      pool.push(makeQuestion(`${category}-oos`, category, 'medium', { curriculum_status: 'out_of_scope' }))
    }

    const selected = selectCsComprehensiveQuestionsFromPool(pool)

    expect(selected).toHaveLength(CS_COMPREHENSIVE_TOTAL_QUESTIONS)
    expect(selected.some(q => q.question_usage_scope === 'exclude')).toBe(false)
    expect(selected.some(q => q.curriculum_status === 'out_of_scope')).toBe(false)

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      const categoryRows = selected.filter(q => q.question_category === category)
      expect(categoryRows.filter(q => q.question_usage_scope === 'comprehensive_only')).toHaveLength(5)
      expect(categoryRows.filter(q => q.question_usage_scope === 'understanding_only')).toHaveLength(5)
    }
  })

  it('keeps comprehensive_only at or above 50 percent overall when enough such questions exist', () => {
    const pool: CsComprehensiveQuestion[] = []

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      for (let i = 0; i < 3; i++) {
        pool.push(makeQuestion(`${category}-easy-comp-${i}`, category, 'easy', { question_usage_scope: 'comprehensive_only' }))
        pool.push(makeQuestion(`${category}-easy-under-${i}`, category, 'easy', { question_usage_scope: 'understanding_only' }))
      }
      for (let i = 0; i < 5; i++) {
        pool.push(makeQuestion(`${category}-medium-comp-${i}`, category, 'medium', { question_usage_scope: 'comprehensive_only' }))
        pool.push(makeQuestion(`${category}-medium-under-${i}`, category, 'medium', { question_usage_scope: 'understanding_only' }))
      }
      for (let i = 0; i < 2; i++) {
        pool.push(makeQuestion(`${category}-hard-comp-${i}`, category, 'hard', { question_usage_scope: 'comprehensive_only' }))
        pool.push(makeQuestion(`${category}-hard-under-${i}`, category, 'hard', { question_usage_scope: 'understanding_only' }))
      }
    }

    const selected = selectCsComprehensiveQuestionsFromPool(pool)
    const comprehensiveOnlyCount = selected.filter(q => q.question_usage_scope === 'comprehensive_only').length

    expect(selected).toHaveLength(CS_COMPREHENSIVE_TOTAL_QUESTIONS)
    expect(comprehensiveOnlyCount).toBeGreaterThanOrEqual(CS_COMPREHENSIVE_TOTAL_QUESTIONS / 2)
  })

  it('keeps understanding_only at or above 20 percent overall when enough such questions exist', () => {
    const pool: CsComprehensiveQuestion[] = []

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      for (let i = 0; i < 3; i++) {
        pool.push(makeQuestion(`${category}-easy-comp-${i}`, category, 'easy', { question_usage_scope: 'comprehensive_only' }))
        pool.push(makeQuestion(`${category}-easy-under-${i}`, category, 'easy', { question_usage_scope: 'understanding_only' }))
      }
      for (let i = 0; i < 5; i++) {
        pool.push(makeQuestion(`${category}-medium-comp-${i}`, category, 'medium', { question_usage_scope: 'comprehensive_only' }))
        pool.push(makeQuestion(`${category}-medium-under-${i}`, category, 'medium', { question_usage_scope: 'understanding_only' }))
      }
      for (let i = 0; i < 2; i++) {
        pool.push(makeQuestion(`${category}-hard-comp-${i}`, category, 'hard', { question_usage_scope: 'comprehensive_only' }))
        pool.push(makeQuestion(`${category}-hard-under-${i}`, category, 'hard', { question_usage_scope: 'understanding_only' }))
      }
    }

    const selected = selectCsComprehensiveQuestionsFromPool(pool)
    const understandingOnlyCount = selected.filter(q => q.question_usage_scope === 'understanding_only').length

    expect(selected).toHaveLength(CS_COMPREHENSIVE_TOTAL_QUESTIONS)
    expect(understandingOnlyCount).toBeGreaterThanOrEqual(CS_COMPREHENSIVE_TOTAL_QUESTIONS * 0.2)
  })

  it('maps understanding check and final categories into their base comprehensive subject buckets', () => {
    const pool: CsComprehensiveQuestion[] = []

    for (const category of CS_COMPREHENSIVE_CATEGORIES) {
      for (let i = 0; i < 3; i++) {
        pool.push(makeQuestion(`${category}-easy-comp-${i}`, category, 'easy', { question_usage_scope: 'comprehensive_only' }))
      }
      for (let i = 0; i < 5; i++) {
        pool.push(
          makeQuestion(`${category}-medium-under-${i}`, `${category}_check_1`, 'medium', {
            question_usage_scope: 'understanding_only',
          })
        )
      }
      for (let i = 0; i < 2; i++) {
        pool.push(
          makeQuestion(`${category}-hard-under-${i}`, `${category}_final`, 'hard', {
            question_usage_scope: 'understanding_only',
          })
        )
      }
    }

    const selected = selectCsComprehensiveQuestionsFromPool(pool)

    expect(selected).toHaveLength(CS_COMPREHENSIVE_TOTAL_QUESTIONS)
    expect(selected.filter(q => q.question_usage_scope === 'understanding_only')).toHaveLength(
      CS_COMPREHENSIVE_CATEGORIES.length * 7
    )
  })
})
