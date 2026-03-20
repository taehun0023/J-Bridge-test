export type CsQuizCategory =
  | 'algorithm'
  | 'data_structure'
  | 'basic_theory'
  | 'computer_architecture'
  | 'database'
  | 'network'
  | 'os'
  | 'security'

export type CsQuizCategorySlug =
  | 'algorithms'
  | 'data-structures'
  | 'basic-theory'
  | 'computer-architecture'
  | 'database'
  | 'networking'
  | 'operating-systems'
  | 'security'

export type CsQuizSetId = 'check-1' | 'check-2' | 'final'

export interface CsQuizSetDefinition {
  id: CsQuizSetId
  quizId: string
  category: CsQuizCategory
  title: string
  questionCategory: string
  questionsPerAttempt: number
}

export const CS_QUIZ_UNLOCK_THRESHOLD = 75

export const CS_QUIZ_CATEGORY_ORDER: CsQuizCategory[] = [
  'basic_theory',
  'data_structure',
  'algorithm',
  'computer_architecture',
  'database',
  'network',
  'os',
  'security',
]

export const CS_QUIZ_CATEGORY_LABELS: Record<CsQuizCategory, string> = {
  algorithm: 'アルゴリズム',
  data_structure: 'データ構造',
  basic_theory: '情報表現',
  computer_architecture: 'コンピュータ構成',
  database: 'データベース',
  network: 'ネットワーク',
  os: 'オペレーティングシステム',
  security: 'セキュリティ',
}

const CS_QUIZ_CATEGORY_SLUGS: Record<CsQuizCategory, CsQuizCategorySlug> = {
  algorithm: 'algorithms',
  data_structure: 'data-structures',
  basic_theory: 'basic-theory',
  computer_architecture: 'computer-architecture',
  database: 'database',
  network: 'networking',
  os: 'operating-systems',
  security: 'security',
}

const CS_CATEGORY_BY_SLUG: Record<CsQuizCategorySlug, CsQuizCategory> = {
  algorithms: 'algorithm',
  'data-structures': 'data_structure',
  'basic-theory': 'basic_theory',
  'computer-architecture': 'computer_architecture',
  database: 'database',
  networking: 'network',
  'operating-systems': 'os',
  security: 'security',
}

const CS_COURSE_ID_BY_QUIZ_CATEGORY: Record<CsQuizCategory, string> = {
  algorithm: 'cs-algorithms',
  data_structure: 'cs-data-structures',
  basic_theory: 'cs-basic-theory',
  computer_architecture: 'cs-computer-architecture',
  database: 'cs-database',
  network: 'cs-networking',
  os: 'cs-operating-systems',
  security: 'cs-security',
}

export const CS_QUIZ_SET_DEFINITIONS: readonly CsQuizSetDefinition[] = [
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000008',
    category: 'basic_theory',
    title: 'CS知識 情報表現 Check 1',
    questionCategory: 'basic_theory_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000009',
    category: 'basic_theory',
    title: 'CS知識 情報表現 Check 2',
    questionCategory: 'basic_theory_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000003',
    category: 'basic_theory',
    title: 'CS知識 情報表現 Final',
    questionCategory: 'basic_theory_final',
    questionsPerAttempt: 12,
  },
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000011',
    category: 'data_structure',
    title: 'CS知識 データ構造 Check 1',
    questionCategory: 'data_structure_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000012',
    category: 'data_structure',
    title: 'CS知識 データ構造 Check 2',
    questionCategory: 'data_structure_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000002',
    category: 'data_structure',
    title: 'CS知識 データ構造 Final',
    questionCategory: 'data_structure_final',
    questionsPerAttempt: 12,
  },
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000013',
    category: 'algorithm',
    title: 'CS知識 アルゴリズム Check 1',
    questionCategory: 'algorithm_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000014',
    category: 'algorithm',
    title: 'CS知識 アルゴリズム Check 2',
    questionCategory: 'algorithm_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000001',
    category: 'algorithm',
    title: 'CS知識 アルゴリズム Final',
    questionCategory: 'algorithm_final',
    questionsPerAttempt: 12,
  },
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000015',
    category: 'computer_architecture',
    title: 'CS知識 コンピュータ構成 Check 1',
    questionCategory: 'computer_architecture_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000016',
    category: 'computer_architecture',
    title: 'CS知識 コンピュータ構成 Check 2',
    questionCategory: 'computer_architecture_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000010',
    category: 'computer_architecture',
    title: 'CS知識 コンピュータ構成 Final',
    questionCategory: 'computer_architecture_final',
    questionsPerAttempt: 12,
  },
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000017',
    category: 'database',
    title: 'CS知識 データベース Check 1',
    questionCategory: 'database_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000018',
    category: 'database',
    title: 'CS知識 データベース Check 2',
    questionCategory: 'database_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000004',
    category: 'database',
    title: 'CS知識 データベース Final',
    questionCategory: 'database_final',
    questionsPerAttempt: 12,
  },
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000019',
    category: 'network',
    title: 'CS知識 ネットワーク Check 1',
    questionCategory: 'network_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000020',
    category: 'network',
    title: 'CS知識 ネットワーク Check 2',
    questionCategory: 'network_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000005',
    category: 'network',
    title: 'CS知識 ネットワーク Final',
    questionCategory: 'network_final',
    questionsPerAttempt: 12,
  },
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000021',
    category: 'os',
    title: 'CS知識 オペレーティングシステム Check 1',
    questionCategory: 'os_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000022',
    category: 'os',
    title: 'CS知識 オペレーティングシステム Check 2',
    questionCategory: 'os_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000006',
    category: 'os',
    title: 'CS知識 オペレーティングシステム Final',
    questionCategory: 'os_final',
    questionsPerAttempt: 12,
  },
  {
    id: 'check-1',
    quizId: '60000001-0000-0000-0000-000000000023',
    category: 'security',
    title: 'CS知識 セキュリティ Check 1',
    questionCategory: 'security_check_1',
    questionsPerAttempt: 8,
  },
  {
    id: 'check-2',
    quizId: '60000001-0000-0000-0000-000000000024',
    category: 'security',
    title: 'CS知識 セキュリティ Check 2',
    questionCategory: 'security_check_2',
    questionsPerAttempt: 8,
  },
  {
    id: 'final',
    quizId: '60000001-0000-0000-0000-000000000007',
    category: 'security',
    title: 'CS知識 セキュリティ Final',
    questionCategory: 'security_final',
    questionsPerAttempt: 12,
  },
] as const

const LESSON_SET_TRIGGER: Record<string, Partial<Record<CsQuizSetId, string>>> = {
  'basic-theory': { 'check-1': 'CSK-BT-01-02', final: 'CSK-BT-01-04' },
  'data-structures': { 'check-1': 'CSK-DS-01-02', final: 'CSK-DS-01-04' },
  algorithms: { 'check-1': 'CSK-AL-01-02', final: 'CSK-AL-01-04' },
  'computer-architecture': { 'check-1': 'CSK-CA-01-02', final: 'CSK-CA-01-04' },
  database: { 'check-1': 'CSK-DB-01-02', final: 'CSK-DB-01-04' },
  networking: { 'check-1': 'CSK-NW-01-02', final: 'CSK-NW-01-04' },
  'operating-systems': { 'check-1': 'CSK-OS-01-02', final: 'CSK-OS-01-04' },
  security: { 'check-1': 'CSK-SC-01-02', final: 'CSK-SC-01-04' },
}

export function normalizeCsQuizCategory(category: string | null | undefined): CsQuizCategory | null {
  if (!category) return null
  if (category in CS_QUIZ_CATEGORY_SLUGS) return category as CsQuizCategory
  if (category in CS_CATEGORY_BY_SLUG) return CS_CATEGORY_BY_SLUG[category as CsQuizCategorySlug]
  return null
}

export function getCsQuizCategorySlug(category: string | null | undefined): CsQuizCategorySlug | null {
  const normalized = normalizeCsQuizCategory(category)
  return normalized ? CS_QUIZ_CATEGORY_SLUGS[normalized] : null
}

export function getCsQuizListHref(category: string | null | undefined) {
  const slug = getCsQuizCategorySlug(category)
  return slug ? `/cs/quiz?category=${slug}` : '/cs/quiz'
}

export function getCsQuizCategoryLabel(category: string) {
  const normalized = normalizeCsQuizCategory(category)
  return normalized ? CS_QUIZ_CATEGORY_LABELS[normalized] : category
}

export function getCsQuizSetsForCategory(category: CsQuizCategory) {
  return CS_QUIZ_SET_DEFINITIONS.filter((item) => item.category === category)
}

export function getCsQuizSetByQuizId(quizId: string) {
  return CS_QUIZ_SET_DEFINITIONS.find((item) => item.quizId === quizId) ?? null
}

export function isKnownCsPoolQuiz(quizId: string) {
  return CS_QUIZ_SET_DEFINITIONS.some((item) => item.quizId === quizId)
}

export function getCsQuizSetByLessonId(courseSlug: string, lessonId: string) {
  const triggers = LESSON_SET_TRIGGER[courseSlug]
  if (!triggers) return null

  const matched = Object.entries(triggers).find(([, triggerLessonId]) => triggerLessonId === lessonId)
  if (!matched) return null

  const [setId] = matched
  const category = slugToQuizCategory(courseSlug)
  if (!category) return null

  return getCsQuizSetsForCategory(category).find((item) => item.id === setId) ?? null
}

export function getCsQuizCategoryFromQuiz(quizId: string, title: string) {
  const quizSet = getCsQuizSetByQuizId(quizId)
  if (quizSet) return quizSet.category

  const matched = (Object.entries(CS_QUIZ_CATEGORY_LABELS) as Array<[CsQuizCategory, string]>).find(
    ([, label]) => title.includes(label)
  )

  return matched?.[0] ?? null
}

export function getCsCourseIdForQuiz(quizId: string, title: string) {
  const category = getCsQuizCategoryFromQuiz(quizId, title)
  return category ? CS_COURSE_ID_BY_QUIZ_CATEGORY[category] : null
}

export function getCsQuizUnlockState(completedLessons: number, totalLessons: number) {
  const progressPct = totalLessons > 0 ? Math.round((completedLessons / totalLessons) * 100) : 0

  return {
    progressPct,
    unlocked: totalLessons > 0 && progressPct >= CS_QUIZ_UNLOCK_THRESHOLD,
    lockedReason: `進行率${CS_QUIZ_UNLOCK_THRESHOLD}%以上で解放されます。`,
  }
}

export function getCsQuizSetUnlockState(
  category: CsQuizCategory,
  completedLessons: number,
  totalLessons: number
) {
  const unlockState = getCsQuizUnlockState(completedLessons, totalLessons)

  return getCsQuizSetsForCategory(category).map((item) => ({
    id: item.id,
    quizId: item.quizId,
    category: item.category,
    unlocked: unlockState.unlocked,
    description: unlockState.lockedReason,
  }))
}

export function getBasicTheoryUnlockState(completedLessons: number, totalLessons: number) {
  return getCsQuizSetUnlockState('basic_theory', completedLessons, totalLessons)
}

export function getCsQuestionCategoryForPoolQuiz(quizId: string, title: string) {
  const quizSet = getCsQuizSetByQuizId(quizId)
  if (quizSet) return quizSet.questionCategory

  return getCsQuizCategoryFromQuiz(quizId, title)
}

export function getDifficultyRatiosForCsQuiz(quizId: string) {
  const quizSet = getCsQuizSetByQuizId(quizId)

  if (quizSet && quizSet.id !== 'final') {
    return {
      easy: 0.3,
      medium: 0.5,
      hard: 0.2,
    }
  }

  return {
    easy: 0.2,
    medium: 0.4,
    hard: 0.4,
  }
}

export function getQuizCardSortKey(quizId: string, title: string) {
  const quizSet = getCsQuizSetByQuizId(quizId)
  if (quizSet) {
    const categoryIndex = CS_QUIZ_CATEGORY_ORDER.indexOf(quizSet.category)
    const setOrder: Record<CsQuizSetId, number> = {
      'check-1': 0,
      'check-2': 1,
      final: 2,
    }

    return categoryIndex * 10 + setOrder[quizSet.id]
  }

  const category = getCsQuizCategoryFromQuiz(quizId, title)
  const categoryIndex = category ? CS_QUIZ_CATEGORY_ORDER.indexOf(category) : -1
  return categoryIndex === -1 ? 999 : categoryIndex * 10
}

function slugToQuizCategory(courseSlug: string): CsQuizCategory | null {
  return normalizeCsQuizCategory(courseSlug)
}
