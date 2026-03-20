import { describe, expect, it } from 'vitest'
import {
  CS_QUIZ_UNLOCK_THRESHOLD,
  getBasicTheoryUnlockState,
  getCsCourseIdForQuiz,
  getCsQuizSetByLessonId,
  getCsQuizSetByQuizId,
  getCsQuizSetsForCategory,
  getCsQuizListHref,
  getCsQuestionCategoryForPoolQuiz,
  getCsQuizUnlockState,
  getDifficultyRatiosForCsQuiz,
  getQuizCardSortKey,
  normalizeCsQuizCategory,
} from './cs-quiz'

describe('cs quiz helpers', () => {
  it('maps pool quiz ids to dedicated question categories across subjects', () => {
    expect(getCsQuestionCategoryForPoolQuiz('60000001-0000-0000-0000-000000000008', 'x')).toBe(
      'basic_theory_check_1'
    )
    expect(getCsQuestionCategoryForPoolQuiz('60000001-0000-0000-0000-000000000013', 'x')).toBe(
      'algorithm_check_1'
    )
    expect(getCsQuestionCategoryForPoolQuiz('60000001-0000-0000-0000-000000000010', 'x')).toBe(
      'computer_architecture_final'
    )
    expect(getCsQuestionCategoryForPoolQuiz('60000001-0000-0000-0000-000000000020', 'x')).toBe(
      'network_check_2'
    )
  })

  it('defines three quiz sets for every cs category', () => {
    expect(getCsQuizSetsForCategory('algorithm')).toHaveLength(3)
    expect(getCsQuizSetsForCategory('data_structure')).toHaveLength(3)
    expect(getCsQuizSetsForCategory('computer_architecture')).toHaveLength(3)
    expect(getCsQuizSetsForCategory('security')).toHaveLength(3)
    expect(getCsQuizSetByQuizId('60000001-0000-0000-0000-000000000010')?.category).toBe(
      'computer_architecture'
    )
  })

  it('uses lighter difficulty ratios for check quizzes only', () => {
    expect(getDifficultyRatiosForCsQuiz('60000001-0000-0000-0000-000000000008')).toEqual({
      easy: 0.3,
      medium: 0.5,
      hard: 0.2,
    })
    expect(getDifficultyRatiosForCsQuiz('60000001-0000-0000-0000-000000000003')).toEqual({
      easy: 0.2,
      medium: 0.4,
      hard: 0.4,
    })
  })

  it('unlocks cs quizzes at the 75 percent course threshold', () => {
    expect(CS_QUIZ_UNLOCK_THRESHOLD).toBe(75)
    expect(getCsQuizUnlockState(2, 4).unlocked).toBe(false)
    expect(getCsQuizUnlockState(3, 4).unlocked).toBe(true)
    expect(getCsQuizUnlockState(3, 4).lockedReason).toBe('進行率75%以上で解放されます。')

    const unlocks = getBasicTheoryUnlockState(3, 4)
    expect(unlocks.every((item) => item.unlocked)).toBe(true)
  })

  it('maps quiz cards to the correct course ids', () => {
    expect(getCsCourseIdForQuiz('60000001-0000-0000-0000-000000000008', 'x')).toBe(
      'cs-basic-theory'
    )
    expect(getCsCourseIdForQuiz('60000001-0000-0000-0000-000000000001', 'x')).toBe(
      'cs-algorithms'
    )
    expect(getCsCourseIdForQuiz('60000001-0000-0000-0000-000000000010', 'x')).toBe(
      'cs-computer-architecture'
    )
  })

  it('sorts check cards ahead of final within the same category', () => {
    const check1 = getQuizCardSortKey('60000001-0000-0000-0000-000000000011', 'x')
    const check2 = getQuizCardSortKey('60000001-0000-0000-0000-000000000012', 'x')
    const final = getQuizCardSortKey('60000001-0000-0000-0000-000000000002', 'x')

    expect(check1).toBeLessThan(check2)
    expect(check2).toBeLessThan(final)
  })

  it('maps lesson milestones to check and final quiz sets', () => {
    expect(getCsQuizSetByLessonId('data-structures', 'CSK-DS-01-02')?.id).toBe('check-1')
    expect(getCsQuizSetByLessonId('data-structures', 'CSK-DS-01-04')?.id).toBe('final')
    expect(getCsQuizSetByLessonId('computer-architecture', 'CSK-CA-01-04')?.category).toBe(
      'computer_architecture'
    )
  })

  it('normalizes subject slug query params to internal quiz categories', () => {
    expect(normalizeCsQuizCategory('algorithms')).toBe('algorithm')
    expect(normalizeCsQuizCategory('data-structures')).toBe('data_structure')
    expect(normalizeCsQuizCategory('networking')).toBe('network')
    expect(normalizeCsQuizCategory('operating-systems')).toBe('os')
    expect(normalizeCsQuizCategory('algorithm')).toBe('algorithm')
    expect(normalizeCsQuizCategory('unknown-category')).toBeNull()
  })

  it('builds user-facing quiz list urls with subject slugs', () => {
    expect(getCsQuizListHref('algorithm')).toBe('/cs/quiz?category=algorithms')
    expect(getCsQuizListHref('algorithms')).toBe('/cs/quiz?category=algorithms')
    expect(getCsQuizListHref('network')).toBe('/cs/quiz?category=networking')
    expect(getCsQuizListHref(null)).toBe('/cs/quiz')
  })
})
