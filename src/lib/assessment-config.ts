export const ASSESSMENT_QUIZ_IDS: Record<number, string> = {
  1: 'a0000001-0000-0000-0000-000000000001', // JLPT
  2: 'a0000002-0000-0000-0000-000000000002', // IT Japanese
  3: 'a0000003-0000-0000-0000-000000000003', // Core Programming
  4: 'a0000004-0000-0000-0000-000000000004', // Framework
  5: 'a0000005-0000-0000-0000-000000000005', // Attitude/Culture
}

export const ASSESSMENT_LABELS: Record<number, string> = {
  1: 'JLPTランク試験',
  2: 'IT日本語ランク試験',
  3: '基本プログラミングランク試験',
  4: 'フレームワークランク試験',
  5: '態度・文化ランク試験',
}

export const ASSESSMENT_TIME_LIMITS: Record<number, number> = {
  1: 25,
  2: 25,
  3: 30,
  4: 30,
  5: 10,
}

// ── Grade system ──

export type SkillGrade = 'S' | 'A' | 'B' | 'C' | 'D'

export const DISPATCH_MINIMUM_GRADE: SkillGrade = 'B'
export const DISPATCH_MINIMUM_SCORE = 70

export function getGrade(score: number): SkillGrade {
  if (score >= 90) return 'S'
  if (score >= 80) return 'A'
  if (score >= 70) return 'B'
  if (score >= 50) return 'C'
  return 'D'
}

export function getGradeColor(grade: SkillGrade): string {
  switch (grade) {
    case 'S': return 'bg-yellow-100 text-yellow-900 dark:bg-yellow-900/30 dark:text-yellow-300'
    case 'A': return 'bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300'
    case 'B': return 'bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300'
    case 'C': return 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300'
    case 'D': return 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300'
  }
}

// ── Language group mapping for step 3 (programming) / step 4 (framework) ──

export type TargetCodingArea = 'java' | 'javascript' | 'sql'

const PROGRAMMING_GROUPS: Record<TargetCodingArea, string[]> = {
  java: ['java', 'sql'],
  javascript: ['javascript', 'sql'],
  sql: ['sql', 'java'],
}

const FRAMEWORK_GROUPS: Record<TargetCodingArea, string[]> = {
  java: ['spring_boot', 'db_design'],
  javascript: ['react', 'db_design'],
  sql: ['db_design', 'spring_boot'],
}

export function getLanguageCategories(step: number, targetCodingArea: string | null): string[] | null {
  const area = targetCodingArea as TargetCodingArea | null
  if (!area) return null
  if (step === 3) return PROGRAMMING_GROUPS[area] ?? null
  if (step === 4) return FRAMEWORK_GROUPS[area] ?? null
  return null
}
