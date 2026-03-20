export const ASSESSMENT_QUIZ_IDS: Record<number, string> = {
  1: 'a0000001-0000-0000-0000-000000000001',
  2: 'a0000002-0000-0000-0000-000000000002',
  3: 'a0000003-0000-0000-0000-000000000003',
  4: 'a0000004-0000-0000-0000-000000000004',
  5: 'a0000005-0000-0000-0000-000000000005',
}

export const ASSESSMENT_LABELS: Record<number, string> = {
  1: '生活日本語総合試験',
  2: 'ビジネス日本語総合試験',
  3: 'CS知識総合試験',
  4: '開発実務総合試験',
  5: 'ビジネスリテラシー総合試験',
}

export const ASSESSMENT_TIME_LIMITS: Record<number, number> = {
  1: 50,
  2: 50,
  3: 30,
  4: 30,
  5: 25,
}

export const ASSESSMENT_TOTAL_QUESTIONS: Record<number, number> = {
  1: 60,
  2: 60,
  3: 30,
  4: 30,
  5: 30,
}

export const STEP1_CATEGORY_WEIGHTS: Record<string, number> = {
  listening: 15,
  grammar: 30,
  reading: 15,
}

export const STEP1_DIFFICULTY_RATIOS: Record<string, number> = {
  N5: 0.1,
  N4: 0.1,
  N3: 0.2,
  N2: 0.3,
  N1: 0.3,
}

export const STEP2_CATEGORY_WEIGHTS: Record<string, number> = {
  vocabulary: 12,
  sentence_pattern: 12,
  business_expression: 12,
  keigo: 12,
  reading: 12,
}

export const STEP2_DIFFICULTY_RATIOS: Record<string, number> = {
  初級: 0.2,
  中級: 0.4,
  上級: 0.4,
}

export const ASSESSMENT_CONTENT_QUIZ_TYPES: Record<number, string[]> = {
  1: ['jlpt_grammar', 'jlpt_reading', 'jlpt_listening'],
  2: ['it_terminology', 'sentence_pattern', 'business_expression', 'keigo'],
  3: ['cs_knowledge'],
  4: ['core_programming', 'framework'],
}

export const ADMIN_CONTENT_QUIZ_TYPES: Record<number, string[]> = {
  1: ['jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji'],
  2: ['it_terminology', 'sentence_pattern', 'business_expression', 'keigo'],
  3: ['cs_knowledge'],
  4: ['core_programming', 'framework'],
}

export const PRACTICE_QUIZ_TYPE_LABELS: Record<string, string> = {
  jlpt_vocab: '語彙(練習)',
  jlpt_grammar: '文法(練習)',
  jlpt_reading: '読解(練習)',
  jlpt_listening: '聴解(練習)',
  jlpt_kanji: '漢字(練習)',
  it_terminology: '語彙(練習)',
  sentence_pattern: '文型表現(練習)',
  business_expression: 'ビジネス表現(練習)',
  keigo: '敬語(練習)',
  cs_knowledge: 'CS知識(練習)',
  core_programming: 'コア開発(練習)',
  framework: 'フレームワーク(練習)',
}

export const CS_POOL_QUIZ_IDS: Record<string, string> = {
  algorithm: '60000001-0000-0000-0000-000000000001',
  data_structure: '60000001-0000-0000-0000-000000000002',
  basic_theory: '60000001-0000-0000-0000-000000000003',
  computer_architecture: '60000001-0000-0000-0000-000000000010',
  database: '60000001-0000-0000-0000-000000000004',
  network: '60000001-0000-0000-0000-000000000005',
  os: '60000001-0000-0000-0000-000000000006',
  security: '60000001-0000-0000-0000-000000000007',
}

export const DEV_POOL_QUIZ_IDS: Record<string, string> = {
  java_core: 'e0000001-0000-0000-0000-000000000001',
  spring_boot: 'e0000001-0000-0000-0000-000000000002',
  sql: 'e0000001-0000-0000-0000-000000000003',
  javascript_core: 'e0000001-0000-0000-0000-000000000004',
  react: 'e0000001-0000-0000-0000-000000000005',
  sql_shared: 'e0000001-0000-0000-0000-000000000006',
}

export const POOL_QUIZ_IDS: Record<string, Record<string, string>> = {
  jlpt_vocab: {
    N5: 'e0000001-0000-0000-0000-000000000011',
    N4: 'e0000001-0000-0000-0000-000000000012',
    N3: 'e0000001-0000-0000-0000-000000000013',
    N2: 'e0000001-0000-0000-0000-000000000014',
    N1: 'e0000001-0000-0000-0000-000000000015',
  },
  jlpt_grammar: {
    N5: 'e0000001-0000-0000-0000-000000000021',
    N4: 'e0000001-0000-0000-0000-000000000022',
    N3: 'e0000001-0000-0000-0000-000000000023',
    N2: 'e0000001-0000-0000-0000-000000000024',
    N1: 'e0000001-0000-0000-0000-000000000025',
  },
  jlpt_reading: {
    N5: 'e0000001-0000-0000-0000-000000000031',
    N4: 'e0000001-0000-0000-0000-000000000032',
    N3: 'e0000001-0000-0000-0000-000000000033',
    N2: 'e0000001-0000-0000-0000-000000000034',
    N1: 'e0000001-0000-0000-0000-000000000035',
  },
  jlpt_listening: {
    N5: 'e0000001-0000-0000-0000-000000000041',
    N4: 'e0000001-0000-0000-0000-000000000042',
    N3: 'e0000001-0000-0000-0000-000000000043',
    N2: 'e0000001-0000-0000-0000-000000000044',
    N1: 'e0000001-0000-0000-0000-000000000045',
  },
  jlpt_kanji: {
    N5: 'e0000001-0000-0000-0000-000000000051',
    N4: 'e0000001-0000-0000-0000-000000000052',
    N3: 'e0000001-0000-0000-0000-000000000053',
    N2: 'e0000001-0000-0000-0000-000000000054',
    N1: 'e0000001-0000-0000-0000-000000000055',
  },
}

export const BJ_POOL_QUIZ_IDS: Record<string, string> = {
  it_terminology: 'f0000001-0000-0000-0000-000000000001',
  sentence_pattern: 'f0000001-0000-0000-0000-000000000002',
  business_expression: 'f0000001-0000-0000-0000-000000000003',
  keigo: 'f0000001-0000-0000-0000-000000000004',
}

export const ALL_PRACTICE_QUIZ_TYPES = [
  'jlpt_vocab',
  'jlpt_grammar',
  'jlpt_reading',
  'jlpt_listening',
  'jlpt_kanji',
  'it_terminology',
  'sentence_pattern',
  'business_expression',
  'keigo',
  'cs_knowledge',
  'core_programming',
  'framework',
] as const

export const COMP_EXAM_CATEGORY_TO_STEP: Record<string, number> = {
  seikatsu: 1,
  'business-jp': 2,
  cs: 3,
  dev: 4,
  'business-lit': 5,
}

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
    case 'N1':
      return 'bg-yellow-100 text-yellow-900 dark:bg-yellow-900/30 dark:text-yellow-300'
    case 'N2':
      return 'bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300'
    case 'N3':
      return 'bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300'
    case 'N4':
      return 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300'
    case 'N5':
      return 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300'
  }
}

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
    case 'S':
      return 'bg-yellow-100 text-yellow-900 dark:bg-yellow-900/30 dark:text-yellow-300'
    case 'A':
      return 'bg-purple-100 text-purple-800 dark:bg-purple-900/30 dark:text-purple-300'
    case 'B':
      return 'bg-blue-100 text-blue-800 dark:bg-blue-900/30 dark:text-blue-300'
    case 'C':
      return 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300'
    case 'D':
      return 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300'
  }
}

export const ALL_AXES = ['jlpt', 'itJapanese', 'coreProgramming', 'framework', 'attitudeCulture'] as const
export const JAPANESE_USER_AXES = ['coreProgramming', 'framework', 'attitudeCulture'] as const
export type AxisKey = typeof ALL_AXES[number]

export const AXIS_DISPLAY_LABELS: Record<AxisKey, string> = {
  jlpt: '生活日本語',
  itJapanese: 'ビジネス日本語',
  coreProgramming: 'CS知識',
  framework: '開発実務',
  attitudeCulture: 'ビジネスリテラシー',
}

export function getRelevantAxes(isJapanese: boolean, role?: string): readonly AxisKey[] {
  if (role === 'admin' || role === 'mentor') return ALL_AXES
  return isJapanese ? JAPANESE_USER_AXES : ALL_AXES
}

export function getRelevantSteps(isJapanese: boolean): number[] {
  return isJapanese ? [3, 4, 5] : [1, 2, 3, 4, 5]
}

export function getMaxTotalScore(isJapanese: boolean): number {
  return isJapanese ? 300 : 500
}

export type TargetCodingArea = 'java' | 'javascript'

export const CS_KNOWLEDGE_CATEGORIES = [
  'algorithm',
  'data_structure',
  'basic_theory',
  'computer_architecture',
  'database',
  'network',
  'os',
  'security',
] as const

export const CS_KNOWLEDGE_WEIGHTS: Record<string, number> = {
  algorithm: 5,
  data_structure: 5,
  basic_theory: 5,
  computer_architecture: 5,
  database: 3,
  network: 3,
  os: 2,
  security: 2,
}

export const STEP3_DIFFICULTY_RATIOS: Record<string, number> = {
  easy: 0.2,
  medium: 0.4,
  hard: 0.4,
}

export const STEP4_CATEGORY_WEIGHTS_JAVA: Record<string, number> = {
  java_core: 10,
  spring_boot: 8,
  sql: 6,
  java_code: 6,
}

export const STEP4_CATEGORY_WEIGHTS_JS: Record<string, number> = {
  javascript_core: 10,
  react: 8,
  sql: 6,
  javascript_code: 6,
}

export const STEP4_DIFFICULTY_RATIOS: Record<string, number> = {
  easy: 0.2,
  medium: 0.4,
  hard: 0.4,
}

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
