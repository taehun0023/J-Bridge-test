import { CS_COMPREHENSIVE_CATEGORIES } from '@/lib/assessment-config'

export type CsGovernanceRow = {
  id: string
  question_category: string | null
  difficulty: string | null
  curriculum_status: 'aligned' | 'adaptable' | 'out_of_scope' | null
  question_usage_scope: 'understanding_only' | 'comprehensive_only' | 'exclude' | null
}

export type CsGovernanceInventoryRow = {
  category: string
  approvedEasy: number
  approvedMedium: number
  approvedHard: number
  approvedTotal: number
  understandingOnly: number
  comprehensiveOnly: number
  excluded: number
  outOfScope: number
  unsetDifficulty: number
}

function isApproved(row: CsGovernanceRow) {
  return row.question_usage_scope !== 'exclude' && row.curriculum_status !== 'out_of_scope'
}

export function buildCsGovernanceInventory(rows: CsGovernanceRow[]): CsGovernanceInventoryRow[] {
  return CS_COMPREHENSIVE_CATEGORIES.map(category => {
    const categoryRows = rows.filter(row => row.question_category === category)

    const approvedRows = categoryRows.filter(isApproved)
    const approvedEasy = approvedRows.filter(row => row.difficulty === 'easy').length
    const approvedMedium = approvedRows.filter(row => row.difficulty === 'medium').length
    const approvedHard = approvedRows.filter(row => row.difficulty === 'hard').length

    return {
      category,
      approvedEasy,
      approvedMedium,
      approvedHard,
      approvedTotal: approvedRows.length,
      understandingOnly: categoryRows.filter(row => row.question_usage_scope === 'understanding_only').length,
      comprehensiveOnly: categoryRows.filter(row => row.question_usage_scope === 'comprehensive_only').length,
      excluded: categoryRows.filter(row => row.question_usage_scope === 'exclude').length,
      outOfScope: categoryRows.filter(row => row.curriculum_status === 'out_of_scope').length,
      unsetDifficulty: approvedRows.filter(row => !['easy', 'medium', 'hard'].includes(row.difficulty ?? '')).length,
    }
  })
}

export function buildCsShortageTable(rows: CsGovernanceInventoryRow[]) {
  return rows.map(row => ({
    category: row.category,
    easyShortage: Math.max(0, 9 - row.approvedEasy),
    mediumShortage: Math.max(0, 15 - row.approvedMedium),
    hardShortage: Math.max(0, 6 - row.approvedHard),
    totalShortage: Math.max(0, 30 - row.approvedTotal),
    unsetDifficulty: row.unsetDifficulty,
  }))
}
