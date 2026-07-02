export const ASSESSMENT_QUIZ_IDS: Record<number, string> = {
  1: 'a0000001-0000-0000-0000-000000000001',
  2: 'a0000002-0000-0000-0000-000000000002',
  3: 'a0000003-0000-0000-0000-000000000003',
  4: 'a0000004-0000-0000-0000-000000000004',
  5: 'a0000005-0000-0000-0000-000000000005',
}

export const ASSESSMENT_LABELS: Record<number, string> = {
  1: 'JLPT総合試験',
  2: 'ビジネス日本語総合試験',
  3: 'CS知識総合試験',
  4: '開発実務総合試験',
  5: 'ビジネスリテラシー総合試験',
}

export const ASSESSMENT_TIME_LIMITS: Record<number, number> = {
  1: 50,
  2: 50,
  3: 30,
  4: 60,
  5: 25,
}

export const ASSESSMENT_TOTAL_QUESTIONS: Record<number, number> = {
  1: 60,
  2: 60,
  3: 30,
  4: 60,
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
  2: ['it_terminology', 'sentence_pattern', 'business_expression', 'keigo', 'writing'],
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
  writing: '作文(練習)',
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
  java: 'e0000001-0000-0000-0000-000000000001',
  spring_boot: 'e0000001-0000-0000-0000-000000000002',
  sql: 'e0000001-0000-0000-0000-000000000003',
  javascript: 'e0000001-0000-0000-0000-000000000004',
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
  writing: 'f0000001-0000-0000-0000-000000000005',
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
  'writing',
  'cs_knowledge',
  'core_programming',
  'framework',
] as const

export const COMP_EXAM_CATEGORY_TO_STEP: Record<string, number> = {
  seikatsu: 1,
  'jlpt-mock': 1,
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

// ─── JLPT 모의시험(Bunpro식 레벨별 실전 모의시험) 설정 ───
export type JlptMockSectionKey = 'gengo_chishiki' | 'dokkai' | 'choukai' | 'gengo_dokkai'

export interface JlptMockSectionDef {
  section: JlptMockSectionKey
  label: string           // 일본어 섹션명(실제 JLPT 표기)
  quizTypes: string[]     // 이 섹션에 출제되는 quiz_type
  maxScaled: number       // 영역 환산 만점 (60, 또는 N4/N5 言語知識・読解는 120)
  minScaled: number       // 영역 합격 최저 환산점 (60점만점→19, 120점만점→38)
}

const SEC_GENGO: JlptMockSectionDef = { section: 'gengo_chishiki', label: '言語知識（文字・語彙・文法）', quizTypes: ['jlpt_vocab', 'jlpt_kanji', 'jlpt_grammar'], maxScaled: 60, minScaled: 19 }
const SEC_DOKKAI: JlptMockSectionDef = { section: 'dokkai', label: '読解', quizTypes: ['jlpt_reading'], maxScaled: 60, minScaled: 19 }
const SEC_CHOUKAI: JlptMockSectionDef = { section: 'choukai', label: '聴解', quizTypes: ['jlpt_listening'], maxScaled: 60, minScaled: 19 }
const SEC_GENGO_DOKKAI: JlptMockSectionDef = { section: 'gengo_dokkai', label: '言語知識（文字・語彙・文法）・読解', quizTypes: ['jlpt_vocab', 'jlpt_kanji', 'jlpt_grammar', 'jlpt_reading'], maxScaled: 120, minScaled: 38 }

/** 레벨별 섹션 구조 — 실제 JLPT 그대로 (N1~N3: 3섹션, N4~N5: 2섹션). */
export const JLPT_MOCK_SECTIONS: Record<JlptLevel, JlptMockSectionDef[]> = {
  N1: [SEC_GENGO, SEC_DOKKAI, SEC_CHOUKAI],
  N2: [SEC_GENGO, SEC_DOKKAI, SEC_CHOUKAI],
  N3: [SEC_GENGO, SEC_DOKKAI, SEC_CHOUKAI],
  N4: [SEC_GENGO_DOKKAI, SEC_CHOUKAI],
  N5: [SEC_GENGO_DOKKAI, SEC_CHOUKAI],
}

/** 합격한 모의시험 레벨 우열 (레이더 "합격 최고레벨" 산정). */
export const JLPT_MOCK_LEVEL_RANK: Record<JlptLevel, number> = { N1: 5, N2: 4, N3: 3, N4: 2, N5: 1 }

/** 합격 레벨 → 레이더 JLPT 축 정규화 점수. */
export const JLPT_MOCK_LEVEL_NORMALIZED: Record<JlptLevel, number> = { N1: 100, N2: 85, N3: 70, N4: 55, N5: 40 }

// ── 채점 모델(실제 JLPT식): 영역별 환산(maxScaled) + 영역 최저(minScaled) + 레벨별 총점 커트라인 ──
// 합격 = 총점(/180) ≥ 레벨 커트라인 AND 모든 영역 환산 ≥ minScaled.
export const JLPT_MOCK_LEVEL_TOTAL_PASS: Record<JlptLevel, number> = { N1: 100, N2: 90, N3: 95, N4: 90, N5: 80 }
export function jlptMockTotalPass(level: string): number {
  return JLPT_MOCK_LEVEL_TOTAL_PASS[level as JlptLevel] ?? 100
}
/** 영역 정답수 → 환산점수 (만점 max 기준). */
export function jlptMockScaled(correct: number, total: number, max: number): number {
  return total > 0 ? Math.round((correct / total) * max) : 0
}

// ── 問題유형 분류표 (실제 JLPT 구성) ──
// section = 채점 도메인(gengo_chishiki=言語知識, dokkai=読解, choukai=聴解).
export interface JlptProblemType {
  no: number          // 問題 번호(영역 내)
  code: string        // 유형 코드 (quiz_questions.question_subtype)
  label: string       // 화면 표시명
  section: JlptMockSectionKey
  count: number       // 세트당 문항 수
  choices: number     // 선택지 수
}

/** N1 問題 구성: 言語知識(45) + 読解(25) + 聴解(30) = 100문항. */
export const JLPT_N1_PROBLEM_TYPES: JlptProblemType[] = [
  // 文字・語彙 (25)
  { no: 1, code: 'KANJI_READING', label: '漢字読み', section: 'gengo_chishiki', count: 6, choices: 4 },
  { no: 2, code: 'CONTEXT_WORD', label: '文脈規定', section: 'gengo_chishiki', count: 7, choices: 4 },
  { no: 3, code: 'PARAPHRASE', label: '言い換え類義', section: 'gengo_chishiki', count: 6, choices: 4 },
  { no: 4, code: 'WORD_USAGE', label: '用法', section: 'gengo_chishiki', count: 6, choices: 4 },
  // 文法 (20)
  { no: 5, code: 'GRAMMAR_CHOICE', label: '文法形式の判断', section: 'gengo_chishiki', count: 10, choices: 4 },
  { no: 6, code: 'SENTENCE_ORDER', label: '文の組み立て', section: 'gengo_chishiki', count: 5, choices: 4 },
  { no: 7, code: 'TEXT_GRAMMAR', label: '文章の文法', section: 'gengo_chishiki', count: 5, choices: 4 },
  // 読解 (25)
  { no: 8, code: 'SHORT_READING', label: '内容理解・短文', section: 'dokkai', count: 4, choices: 4 },
  { no: 9, code: 'MEDIUM_READING', label: '内容理解・中文', section: 'dokkai', count: 9, choices: 4 },
  { no: 10, code: 'LONG_READING', label: '内容理解・長文', section: 'dokkai', count: 4, choices: 4 },
  { no: 11, code: 'INTEGRATED_READING', label: '統合理解', section: 'dokkai', count: 2, choices: 4 },
  { no: 12, code: 'OPINION_READING', label: '主張理解・長文', section: 'dokkai', count: 4, choices: 4 },
  { no: 13, code: 'INFORMATION_SEARCH', label: '情報検索', section: 'dokkai', count: 2, choices: 4 },
  // 聴解 (30)
  { no: 1, code: 'LISTENING_TASK', label: '課題理解', section: 'choukai', count: 5, choices: 4 },
  { no: 2, code: 'LISTENING_POINT', label: 'ポイント理解', section: 'choukai', count: 6, choices: 4 },
  { no: 3, code: 'LISTENING_SUMMARY', label: '概要理解', section: 'choukai', count: 5, choices: 4 },
  { no: 4, code: 'LISTENING_QUICK_RESPONSE', label: '即時応答', section: 'choukai', count: 11, choices: 3 },
  { no: 5, code: 'LISTENING_INTEGRATED', label: '統合理解', section: 'choukai', count: 3, choices: 4 },
]

/** N2 問題 구성(공식 小問数 목安): 言語知識(54) + 読解(21) + 聴解(32) = 107문항. */
export const JLPT_N2_PROBLEM_TYPES: JlptProblemType[] = [
  // 文字・語彙 (32) — N2는 表記·語形成 추가
  { no: 1, code: 'KANJI_READING', label: '漢字読み', section: 'gengo_chishiki', count: 5, choices: 4 },
  { no: 2, code: 'NOTATION', label: '表記', section: 'gengo_chishiki', count: 5, choices: 4 },
  { no: 3, code: 'WORD_FORMATION', label: '語形成', section: 'gengo_chishiki', count: 5, choices: 4 },
  { no: 4, code: 'CONTEXT_WORD', label: '文脈規定', section: 'gengo_chishiki', count: 7, choices: 4 },
  { no: 5, code: 'PARAPHRASE', label: '言い換え類義', section: 'gengo_chishiki', count: 5, choices: 4 },
  { no: 6, code: 'WORD_USAGE', label: '用法', section: 'gengo_chishiki', count: 5, choices: 4 },
  // 文法 (22)
  { no: 7, code: 'GRAMMAR_CHOICE', label: '文法形式の判断', section: 'gengo_chishiki', count: 12, choices: 4 },
  { no: 8, code: 'SENTENCE_ORDER', label: '文の組み立て', section: 'gengo_chishiki', count: 5, choices: 4 },
  { no: 9, code: 'TEXT_GRAMMAR', label: '文章の文法', section: 'gengo_chishiki', count: 5, choices: 4 },
  // 読解 (21) — N2는 問題10~14
  { no: 10, code: 'SHORT_READING', label: '内容理解・短文', section: 'dokkai', count: 5, choices: 4 },
  { no: 11, code: 'MEDIUM_READING', label: '内容理解・中文', section: 'dokkai', count: 9, choices: 4 },
  { no: 12, code: 'INTEGRATED_READING', label: '統合理解', section: 'dokkai', count: 2, choices: 4 },
  { no: 13, code: 'OPINION_READING', label: '主張理解・長文', section: 'dokkai', count: 3, choices: 4 },
  { no: 14, code: 'INFORMATION_SEARCH', label: '情報検索', section: 'dokkai', count: 2, choices: 4 },
  // 聴解 (32)
  { no: 1, code: 'LISTENING_TASK', label: '課題理解', section: 'choukai', count: 5, choices: 4 },
  { no: 2, code: 'LISTENING_POINT', label: 'ポイント理解', section: 'choukai', count: 6, choices: 4 },
  { no: 3, code: 'LISTENING_SUMMARY', label: '概要理解', section: 'choukai', count: 5, choices: 4 },
  { no: 4, code: 'LISTENING_QUICK_RESPONSE', label: '即時応答', section: 'choukai', count: 12, choices: 3 },
  { no: 5, code: 'LISTENING_INTEGRATED', label: '統合理解', section: 'choukai', count: 4, choices: 4 },
]

export function jlptMockSectionsFor(level: string): JlptMockSectionDef[] {
  return JLPT_MOCK_SECTIONS[level as JlptLevel] ?? []
}

// ── 교시(시험 시간 분리) — 1교시 言語知識・読解, 2교시 聴解 ──
export interface JlptMockSession {
  session: number
  label: string
  sections: JlptMockSectionKey[]
  timeMin: number
}
const SESS_CHOUKAI: JlptMockSession = { session: 2, label: '聴解', sections: ['choukai'], timeMin: 55 }
export const JLPT_MOCK_SESSIONS: Record<JlptLevel, JlptMockSession[]> = {
  N1: [{ session: 1, label: '言語知識（文字・語彙・文法・読解）', sections: ['gengo_chishiki', 'dokkai'], timeMin: 110 }, { ...SESS_CHOUKAI, timeMin: 55 }],
  N2: [{ session: 1, label: '言語知識（文字・語彙・文法・読解）', sections: ['gengo_chishiki', 'dokkai'], timeMin: 105 }, { ...SESS_CHOUKAI, timeMin: 50 }],
  N3: [{ session: 1, label: '言語知識（文字・語彙・文法・読解）', sections: ['gengo_chishiki', 'dokkai'], timeMin: 100 }, { ...SESS_CHOUKAI, timeMin: 40 }],
  N4: [{ session: 1, label: '言語知識・読解', sections: ['gengo_dokkai'], timeMin: 70 }, { ...SESS_CHOUKAI, timeMin: 40 }],
  N5: [{ session: 1, label: '言語知識・読解', sections: ['gengo_dokkai'], timeMin: 65 }, { ...SESS_CHOUKAI, timeMin: 35 }],
}
export function jlptMockSessionsFor(level: string): JlptMockSession[] {
  return JLPT_MOCK_SESSIONS[level as JlptLevel] ?? []
}
export function jlptMockSessionDef(level: string, session: number): JlptMockSession | null {
  return jlptMockSessionsFor(level).find(s => s.session === session) ?? null
}

/** 섹션 키 → quiz_type 목록 (특정 레벨 기준). */
export function jlptMockSectionForQuizType(level: string, quizType: string): JlptMockSectionKey | null {
  for (const sec of jlptMockSectionsFor(level)) {
    if (sec.quizTypes.includes(quizType)) return sec.section
  }
  return null
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
  jlpt: 'JLPT',
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

export const CS_COMPREHENSIVE_CATEGORIES = [
  'basic_theory',
  'data_structure',
  'algorithm',
  'computer_architecture',
  'database',
  'network',
  'os',
  'security',
] as const

export const CS_COMPREHENSIVE_CATEGORY_COUNT = 10
export const CS_COMPREHENSIVE_TOTAL_QUESTIONS = CS_COMPREHENSIVE_CATEGORIES.length * CS_COMPREHENSIVE_CATEGORY_COUNT

export const CS_COMPREHENSIVE_DIFFICULTY_COUNTS = {
  easy: 3,
  medium: 5,
  hard: 2,
} as const

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
  java: 20,
  spring_boot: 20,
  sql: 20,
}

export const STEP4_CATEGORY_WEIGHTS_JS: Record<string, number> = {
  javascript: 20,
  react: 20,
  sql: 20,
}

export const STEP4_DIFFICULTY_RATIOS: Record<string, number> = {
  easy: 0.3,
  medium: 0.5,
  hard: 0.2,
}

export const STEP4_SUBTYPE_SPLIT: Record<string, number> = {
  concept: 10,
  code_reading: 10,
}

const DEV_PRACTICAL_GROUPS: Record<TargetCodingArea, string[]> = {
  java: ['java', 'spring_boot', 'sql'],
  javascript: ['javascript', 'react', 'sql'],
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
