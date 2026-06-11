import { describe, it, expect, vi } from 'vitest'

// assessments.ts imports the server-only supabase client at module level —
// mock it so the module loads in the node test environment.
vi.mock('@/lib/supabase/server', () => ({
  createClient: vi.fn(),
  createServiceRoleClient: vi.fn(() => null),
}))

import { pickByCategoryAndDifficulty } from './assessments'
import type { QuestionWithOptions } from './assessments'

function makeQuestion(id: string, category: string, difficulty: string): QuestionWithOptions {
  return {
    id,
    quiz_id: 'quiz-1',
    question_type: 'multiple_choice',
    question_text: `Q ${id}`,
    audio_url: null,
    image_url: null,
    explanation: null,
    points: 1,
    sort_order: 0,
    difficulty,
    question_category: category,
    question_subtype: null,
    curriculum_status: null,
    question_usage_scope: null,
    lesson_mapping: null,
    quiz_question_options_safe: [],
  }
}

function makePool(category: string, perDifficulty: number, difficulties: string[]) {
  const pool: QuestionWithOptions[] = []
  for (const difficulty of difficulties) {
    for (let i = 0; i < perDifficulty; i++) {
      pool.push(makeQuestion(`${category}-${difficulty}-${i}`, category, difficulty))
    }
  }
  return pool
}

const N_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1']
const STEP1_RATIOS = { N5: 0.1, N4: 0.1, N3: 0.2, N2: 0.3, N1: 0.3 }
const STEP1_WEIGHTS = { listening: 15, grammar: 30, reading: 15 }

describe('pickByCategoryAndDifficulty()', () => {
  it('returns exactly the target count per category (rounding overshoot is trimmed)', () => {
    // 15 × STEP1 ratios rounds to 2+2+3+5+5 = 17 — the historical 64-question
    // overshoot bug. Must land on exactly 15/30/15 = 60.
    const pool = [
      ...makePool('listening', 20, N_LEVELS),
      ...makePool('grammar', 20, N_LEVELS),
      ...makePool('reading', 20, N_LEVELS),
    ]
    const picked = pickByCategoryAndDifficulty(pool, STEP1_WEIGHTS, STEP1_RATIOS)

    const byCategory: Record<string, number> = {}
    for (const q of picked) byCategory[q.question_category!] = (byCategory[q.question_category!] ?? 0) + 1
    expect(byCategory).toEqual({ listening: 15, grammar: 30, reading: 15 })
    expect(picked).toHaveLength(60)
  })

  it('never returns duplicate questions', () => {
    const pool = [...makePool('listening', 4, N_LEVELS), ...makePool('grammar', 8, N_LEVELS)]
    const picked = pickByCategoryAndDifficulty(pool, { listening: 15, grammar: 30 }, STEP1_RATIOS)
    expect(new Set(picked.map(q => q.id)).size).toBe(picked.length)
  })

  it('fills the shortfall from other difficulties when a difficulty bucket is empty', () => {
    const pool = makePool('listening', 20, ['N5', 'N4', 'N3', 'N2']) // no N1 at all
    const picked = pickByCategoryAndDifficulty(pool, { listening: 15 }, STEP1_RATIOS)
    expect(picked).toHaveLength(15)
  })

  it('returns the whole pool when it is smaller than the target', () => {
    const pool = makePool('listening', 2, ['N5', 'N3']) // 4 questions total
    const picked = pickByCategoryAndDifficulty(pool, { listening: 15 }, STEP1_RATIOS)
    expect(picked).toHaveLength(4)
  })

  it('skips categories that have no questions in the pool', () => {
    const pool = makePool('grammar', 20, N_LEVELS)
    const picked = pickByCategoryAndDifficulty(pool, STEP1_WEIGHTS, STEP1_RATIOS)
    expect(picked).toHaveLength(30)
    expect(picked.every(q => q.question_category === 'grammar')).toBe(true)
  })
})
