import {
  CS_COMPREHENSIVE_CATEGORIES,
  CS_COMPREHENSIVE_CATEGORY_COUNT,
  CS_COMPREHENSIVE_DIFFICULTY_COUNTS,
  CS_COMPREHENSIVE_TOTAL_QUESTIONS,
} from '@/lib/assessment-config'

export interface CsComprehensiveQuestion {
  id: string
  difficulty: string | null
  question_category: string | null
  question_usage_scope?: 'understanding_only' | 'comprehensive_only' | 'exclude' | null
  curriculum_status?: 'aligned' | 'adaptable' | 'out_of_scope' | null
}

function shuffle<T>(arr: T[]): T[] {
  const result = [...arr]
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[result[i], result[j]] = [result[j], result[i]]
  }
  return result
}

const CS_COMPREHENSIVE_MIN_COMPREHENSIVE_ONLY = Math.ceil(CS_COMPREHENSIVE_TOTAL_QUESTIONS * 0.5)
const CS_COMPREHENSIVE_MIN_UNDERSTANDING_ONLY = Math.ceil(CS_COMPREHENSIVE_TOTAL_QUESTIONS * 0.2)
const CS_ALLOWED_USAGE_SCOPES = new Set(['comprehensive_only', 'understanding_only'])
const CS_SCOPE_PRIORITY = ['comprehensive_only', 'understanding_only'] as const
const CS_UNDERSTANDING_CATEGORY_TO_COMPREHENSIVE: Record<string, string> = {
  basic_theory_check_1: 'basic_theory',
  basic_theory_check_2: 'basic_theory',
  basic_theory_final: 'basic_theory',
  data_structure_check_1: 'data_structure',
  data_structure_check_2: 'data_structure',
  data_structure_final: 'data_structure',
  algorithm_check_1: 'algorithm',
  algorithm_check_2: 'algorithm',
  algorithm_final: 'algorithm',
  computer_architecture_check_1: 'computer_architecture',
  computer_architecture_check_2: 'computer_architecture',
  computer_architecture_final: 'computer_architecture',
  database_check_1: 'database',
  database_check_2: 'database',
  database_final: 'database',
  network_check_1: 'network',
  network_check_2: 'network',
  network_final: 'network',
  os_check_1: 'os',
  os_check_2: 'os',
  os_final: 'os',
  security_check_1: 'security',
  security_check_2: 'security',
  security_final: 'security',
}

function isEligible<T extends CsComprehensiveQuestion>(question: T) {
  return (
    question.curriculum_status !== 'out_of_scope' &&
    !!question.question_usage_scope &&
    CS_ALLOWED_USAGE_SCOPES.has(question.question_usage_scope)
  )
}

function getComprehensiveCategory<T extends CsComprehensiveQuestion>(question: T) {
  if (!question.question_category) return null
  return CS_UNDERSTANDING_CATEGORY_TO_COMPREHENSIVE[question.question_category] ?? question.question_category
}

function countByScope<T extends CsComprehensiveQuestion>(
  questions: readonly T[],
  scope: (typeof CS_SCOPE_PRIORITY)[number],
) {
  return questions.filter(question => question.question_usage_scope === scope).length
}

function pickQuestions<T extends CsComprehensiveQuestion>(
  pool: T[],
  targetCount: number,
  preferredScopes: readonly (typeof CS_SCOPE_PRIORITY)[number][],
  usedIds: Set<string>,
) {
  const selected: T[] = []

  for (const scope of preferredScopes) {
    if (selected.length >= targetCount) break
    const candidates = shuffle(
      pool.filter(question => question.question_usage_scope === scope && !usedIds.has(question.id))
    )
    const needed = candidates.slice(0, targetCount - selected.length)
    needed.forEach(question => usedIds.add(question.id))
    selected.push(...needed)
  }

  return selected
}

export function selectCsComprehensiveQuestionsFromPool<T extends CsComprehensiveQuestion>(allQuestions: T[]): T[] {
  const result: T[] = []
  const usedIds = new Set<string>()
  let remainingComprehensiveOnly = CS_COMPREHENSIVE_MIN_COMPREHENSIVE_ONLY
  let remainingUnderstandingOnly = CS_COMPREHENSIVE_MIN_UNDERSTANDING_ONLY

  CS_COMPREHENSIVE_CATEGORIES.forEach((category, categoryIndex) => {
    const categoriesLeft = CS_COMPREHENSIVE_CATEGORIES.length - categoryIndex
    const minUnderstandingForCategory = Math.ceil(remainingUnderstandingOnly / categoriesLeft)
    const minComprehensiveForCategory = Math.ceil(remainingComprehensiveOnly / categoriesLeft)
    const categoryPool = allQuestions.filter(q => getComprehensiveCategory(q) === category && isEligible(q) && !usedIds.has(q.id))

    if (categoryPool.length === 0) return

    const categoryPicked: T[] = []

    for (const [difficulty, targetCount] of Object.entries(CS_COMPREHENSIVE_DIFFICULTY_COUNTS)) {
      const bucket = categoryPool.filter(q => q.difficulty === difficulty && !usedIds.has(q.id))
      const categoryUnderstandingCount = countByScope(categoryPicked, 'understanding_only')
      const categoryComprehensiveCount = countByScope(categoryPicked, 'comprehensive_only')

      let preferredScopes: readonly (typeof CS_SCOPE_PRIORITY)[number][] = CS_SCOPE_PRIORITY
      if (categoryUnderstandingCount < minUnderstandingForCategory) {
        preferredScopes = ['understanding_only', 'comprehensive_only']
      } else if (categoryComprehensiveCount < minComprehensiveForCategory) {
        preferredScopes = ['comprehensive_only', 'understanding_only']
      }

      const selected = pickQuestions(bucket, targetCount, preferredScopes, usedIds)
      categoryPicked.push(...selected)
    }

    if (categoryPicked.length < CS_COMPREHENSIVE_CATEGORY_COUNT) {
      const remainingSameCategory = categoryPool.filter(q => !usedIds.has(q.id))
      const categoryUnderstandingCount = countByScope(categoryPicked, 'understanding_only')
      const categoryComprehensiveCount = countByScope(categoryPicked, 'comprehensive_only')

      let preferredScopes: readonly (typeof CS_SCOPE_PRIORITY)[number][] = CS_SCOPE_PRIORITY
      if (categoryUnderstandingCount < minUnderstandingForCategory) {
        preferredScopes = ['understanding_only', 'comprehensive_only']
      } else if (categoryComprehensiveCount < minComprehensiveForCategory) {
        preferredScopes = ['comprehensive_only', 'understanding_only']
      }

      const needed = pickQuestions(
        remainingSameCategory,
        CS_COMPREHENSIVE_CATEGORY_COUNT - categoryPicked.length,
        preferredScopes,
        usedIds,
      )
      categoryPicked.push(...needed)
    }

    result.push(...shuffle(categoryPicked))
    remainingComprehensiveOnly = Math.max(0, remainingComprehensiveOnly - countByScope(categoryPicked, 'comprehensive_only'))
    remainingUnderstandingOnly = Math.max(0, remainingUnderstandingOnly - countByScope(categoryPicked, 'understanding_only'))
  })

  return result
}
