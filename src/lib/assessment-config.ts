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
  1: 70,
  2: 25,
  3: 30,
  4: 30,
  5: 25,
}

export const ASSESSMENT_TOTAL_QUESTIONS: Record<number, number> = {
  1: 60,  // 文法30 + 読解15 + 聴解15
  2: 30,
  3: 30,
  4: 30,
  5: 30,
}

/** Step 1 (生活日本語): JLPT-style weighted category selection — 60 questions total */
export const STEP1_CATEGORY_WEIGHTS: Record<string, number> = {
  grammar: 30,   // 文字・語彙・文法
  reading: 15,   // 読解
  listening: 15, // 聴解
}

/** Step 1 difficulty distribution by JLPT N-level: N5+N4 20%, N3 20%, N2 30%, N1 30% */
export const STEP1_DIFFICULTY_RATIOS: Record<string, number> = {
  N5: 0.1,
  N4: 0.1,
  N3: 0.2,
  N2: 0.3,
  N1: 0.3,
}

/**
 * Content quiz types that can be blended into assessment exams.
 * Step 1: practice quizzes (grammar/reading/listening) with Japanese-only options.
 * Step 2: IT terminology + sentence patterns + business expressions.
 */
export const ASSESSMENT_CONTENT_QUIZ_TYPES: Record<number, string[]> = {
  1: ['jlpt_grammar', 'jlpt_reading', 'jlpt_listening'],
  2: ['it_terminology', 'sentence_pattern', 'business_expression'],
  // 3, 4 are separate tasks (CS / dev)
}

/** comprehensive_exams.category → assessment step (radar axis) mapping */
export const COMP_EXAM_CATEGORY_TO_STEP: Record<string, number> = {
  seikatsu: 1,
  'business-jp': 2,
  cs: 3,
  dev: 4,
  'business-lit': 5,
}

// ── JLPT level system (生活日本語) ──

export type JlptLevel = 'N1' | 'N2' | 'N3' | 'N4' | 'N5'

export function getJlptLevel(score: number): JlptLevel {
  if (score >= 90) return 'N1'
  if (score >= 80) return 'N2'
  if (score >= 70) return 'N3'
  if (score >= 50) return 'N4'
  return 'N5'
}

export function getJlptLevelColor(level: JlptLevel): string {
  switch (level) {
    case 'N1': return 'bg-yellow-100 text-yellow-900 dark:bg-yellow-900/30 dark:text-yellow-300'
    case 'N2': return 'bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300'
    case 'N3': return 'bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300'
    case 'N4': return 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300'
    case 'N5': return 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300'
  }
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
