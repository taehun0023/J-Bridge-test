export const ASSESSMENT_QUIZ_IDS: Record<number, string> = {
  1: 'a0000001-0000-0000-0000-000000000001', // 生活日本語
  2: 'a0000002-0000-0000-0000-000000000002', // ビジネス日本語
  3: 'a0000003-0000-0000-0000-000000000003', // CS知識
  4: 'a0000004-0000-0000-0000-000000000004', // 開発実務能力
  5: 'a0000005-0000-0000-0000-000000000005', // ビジネスリテラシー
}

export const ASSESSMENT_LABELS: Record<number, string> = {
  1: '生活日本語総合試験',
  2: 'ビジネス日本語総合試験',
  3: 'CS知識総合試験',
  4: '開発実務能力総合試験',
  5: 'ビジネスリテラシー総合試験',
}

export const ASSESSMENT_TIME_LIMITS: Record<number, number> = {
  1: 25,
  2: 25,
  3: 30,
  4: 30,
  5: 25,
}

/** comprehensive_exams.category → assessment step (radar axis) mapping */
export const COMP_EXAM_CATEGORY_TO_STEP: Record<string, number> = {
  seikatsu: 1,
  'business-jp': 2,
  cs: 3,
  dev: 4,
  'business-lit': 5,
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

// ── Axis system ──

export const ALL_AXES = ['jlpt', 'itJapanese', 'coreProgramming', 'framework', 'attitudeCulture'] as const
export const JAPANESE_USER_AXES = ['coreProgramming', 'framework', 'attitudeCulture'] as const
export type AxisKey = typeof ALL_AXES[number]

export const AXIS_DISPLAY_LABELS: Record<AxisKey, string> = {
  jlpt: '生活日本語',
  itJapanese: 'ビジネス日本語',
  coreProgramming: 'CS知識',
  framework: '開発実務能力',
  attitudeCulture: 'ビジネスリテラシー',
}

export function getRelevantAxes(isJapanese: boolean): readonly AxisKey[] {
  return isJapanese ? JAPANESE_USER_AXES : ALL_AXES
}

export function getRelevantSteps(isJapanese: boolean): number[] {
  return isJapanese ? [3, 4, 5] : [1, 2, 3, 4, 5]
}

export function getMaxTotalScore(isJapanese: boolean): number {
  return isJapanese ? 300 : 500
}

// ── Language group mapping ──

export type TargetCodingArea = 'java' | 'javascript'

// Step 3 (CS知識): same categories for all users (7 categories)
export const CS_KNOWLEDGE_CATEGORIES = ['algorithm', 'data_structure', 'os', 'network', 'basic_theory', 'database', 'security'] as const

// Step 3 weighted distribution: 30 questions total
export const CS_KNOWLEDGE_WEIGHTS: Record<string, number> = {
  algorithm: 6,
  data_structure: 6,
  basic_theory: 4,
  database: 4,
  network: 4,
  os: 3,
  security: 3,
}

// Step 4 (開発実務能力): language-specific groups
const DEV_PRACTICAL_GROUPS: Record<TargetCodingArea, string[]> = {
  java: ['java_core', 'spring_boot', 'sql', 'java_code'],
  javascript: ['javascript_core', 'react', 'sql', 'javascript_code'],
}

export function getLanguageCategories(step: number, targetCodingArea: string | null): string[] | null {
  if (step === 3) return [...CS_KNOWLEDGE_CATEGORIES]
  if (step === 4) {
    const area = targetCodingArea as TargetCodingArea | null
    if (!area) return null
    return DEV_PRACTICAL_GROUPS[area] ?? null
  }
  return null
}
