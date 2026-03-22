import { describe, expect, it } from 'vitest'
import { buildCsGovernanceInventory, buildCsShortageTable, type CsGovernanceRow } from './cs-governance-inventory'

describe('buildCsGovernanceInventory', () => {
  it('counts approved questions by difficulty and usage scope', () => {
    const rows: CsGovernanceRow[] = [
      {
        id: '1',
        question_category: 'network',
        difficulty: 'easy',
        curriculum_status: 'aligned',
        question_usage_scope: 'understanding_only',
      },
      {
        id: '2',
        question_category: 'network',
        difficulty: 'medium',
        curriculum_status: 'aligned',
        question_usage_scope: 'comprehensive_only',
      },
      {
        id: '3',
        question_category: 'network',
        difficulty: null,
        curriculum_status: 'adaptable',
        question_usage_scope: 'understanding_only',
      },
      {
        id: '4',
        question_category: 'network',
        difficulty: 'hard',
        curriculum_status: 'out_of_scope',
        question_usage_scope: 'exclude',
      },
    ]

    const inventory = buildCsGovernanceInventory(rows)
    const network = inventory.find(row => row.category === 'network')

    expect(network).toEqual({
      category: 'network',
      approvedEasy: 1,
      approvedMedium: 1,
      approvedHard: 0,
      approvedTotal: 3,
      understandingOnly: 2,
      comprehensiveOnly: 1,
      excluded: 1,
      outOfScope: 1,
      unsetDifficulty: 1,
    })
  })
})

describe('buildCsShortageTable', () => {
  it('computes shortage against 9/15/6 and 30-total floor', () => {
    const shortages = buildCsShortageTable([
      {
        category: 'os',
        approvedEasy: 5,
        approvedMedium: 8,
        approvedHard: 4,
        approvedTotal: 20,
        understandingOnly: 3,
        comprehensiveOnly: 17,
        excluded: 2,
        outOfScope: 2,
        unsetDifficulty: 1,
      },
    ])

    expect(shortages).toEqual([
      {
        category: 'os',
        easyShortage: 4,
        mediumShortage: 7,
        hardShortage: 2,
        totalShortage: 10,
        unsetDifficulty: 1,
      },
    ])
  })
})
