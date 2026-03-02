import { createClient } from '@/lib/supabase/server'

interface QuestionWithOptions {
  id: string
  quiz_id: string
  question_type: string
  question_text: string
  audio_url: string | null
  image_url: string | null
  explanation: string | null
  points: number
  sort_order: number
  difficulty: string | null
  question_category: string | null
  quiz_question_options_safe: {
    id: string
    option_text: string
    sort_order: number
  }[]
}

function shuffle<T>(arr: T[]): T[] {
  const result = [...arr]
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[result[i], result[j]] = [result[j], result[i]]
  }
  return result
}

export async function fetchAssessmentQuiz(quizId: string) {
  const supabase = await createClient()
  return supabase
    .from('quizzes')
    .select('*')
    .eq('id', quizId)
    .single()
}

async function fetchAllQuestions(quizIds: string | string[]): Promise<QuestionWithOptions[]> {
  const supabase = await createClient()
  const query = supabase
    .from('quiz_questions')
    .select('*, quiz_question_options_safe(*)')
    .eq('is_published', true)
    .order('sort_order', { ascending: true })

  if (Array.isArray(quizIds)) {
    query.in('quiz_id', quizIds)
  } else {
    query.eq('quiz_id', quizIds)
  }

  const { data, error } = await query
  if (error || !data) return []
  return data as unknown as QuestionWithOptions[]
}

/** Balanced random selection by difficulty */
export async function fetchRandomByDifficulty(quizIds: string | string[], count: number): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizIds)
  const easy = allQuestions.filter(q => q.difficulty === 'easy')
  const medium = allQuestions.filter(q => q.difficulty === 'medium')
  const hard = allQuestions.filter(q => q.difficulty === 'hard')

  // 30 questions: easy 6, medium 12, hard 12
  const easyCount = count <= 10 ? Math.round(count * 0.2) : 6
  const hardCount = count <= 10 ? Math.round(count * 0.4) : 12
  const mediumCount = count - easyCount - hardCount

  return shuffle([
    ...shuffle(easy).slice(0, easyCount),
    ...shuffle(medium).slice(0, mediumCount),
    ...shuffle(hard).slice(0, hardCount),
  ])
}

/** Balanced random selection by question_category (IT Japanese: vocab/reading/fill_blank) */
export async function fetchRandomByCategory(
  quizIds: string | string[],
  countPerCategory: number,
  categories?: string[]
): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizIds)
  const cats = categories ?? ['vocab', 'reading', 'fill_blank']

  return shuffle(
    cats.flatMap(cat => {
      const pool = allQuestions.filter(q => q.question_category === cat)
      return shuffle(pool).slice(0, countPerCategory)
    })
  )
}

/** Language group based selection for programming/framework quizzes */
export async function fetchRandomByLanguageGroup(
  quizIds: string | string[],
  categories: string[],
  count: number
): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizIds)
  const filtered = allQuestions.filter(q => categories.includes(q.question_category ?? ''))

  const easy = filtered.filter(q => q.difficulty === 'easy')
  const medium = filtered.filter(q => q.difficulty === 'medium')
  const hard = filtered.filter(q => q.difficulty === 'hard')

  const easyCount = count <= 10 ? Math.round(count * 0.2) : 6
  const hardCount = count <= 10 ? Math.round(count * 0.4) : 12
  const mediumCount = count - easyCount - hardCount

  return shuffle([
    ...shuffle(easy).slice(0, easyCount),
    ...shuffle(medium).slice(0, mediumCount),
    ...shuffle(hard).slice(0, hardCount),
  ])
}

/** Weighted random selection by category (CS知識: algorithm 9, data_structure 9, os 6, network 6) */
export async function fetchRandomByWeightedCategory(
  quizIds: string | string[],
  categoryWeights: Record<string, number>
): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizIds)

  const result: QuestionWithOptions[] = []

  for (const [category, targetCount] of Object.entries(categoryWeights)) {
    const pool = allQuestions.filter(q => q.question_category === category)

    if (pool.length === 0) continue

    // Difficulty balancing within each category: easy 20%, medium 40%, hard 40%
    const easyCount = Math.max(1, Math.round(targetCount * 0.2))
    const hardCount = Math.round(targetCount * 0.4)
    const mediumCount = targetCount - easyCount - hardCount

    const easy = shuffle(pool.filter(q => q.difficulty === 'easy')).slice(0, easyCount)
    const medium = shuffle(pool.filter(q => q.difficulty === 'medium')).slice(0, mediumCount)
    const hard = shuffle(pool.filter(q => q.difficulty === 'hard')).slice(0, hardCount)

    result.push(...easy, ...medium, ...hard)
  }

  return shuffle(result)
}

/** Step 1 JLPT-style selection: grammar 30 + reading 15 + listening 15 = 60, with N-level difficulty distribution */
async function fetchStep1JlptStyle(quizIds: string | string[]): Promise<QuestionWithOptions[]> {
  const { STEP1_CATEGORY_WEIGHTS, STEP1_DIFFICULTY_RATIOS } = await import('@/lib/assessment-config')
  const allQuestions = await fetchAllQuestions(quizIds)

  const result: QuestionWithOptions[] = []

  for (const [category, targetCount] of Object.entries(STEP1_CATEGORY_WEIGHTS)) {
    const pool = allQuestions.filter(q => q.question_category === category)
    if (pool.length === 0) continue

    const easyCount = Math.round(targetCount * STEP1_DIFFICULTY_RATIOS.easy)
    const mediumCount = Math.round(targetCount * STEP1_DIFFICULTY_RATIOS.medium)
    const hardCount = targetCount - easyCount - mediumCount

    const easy = shuffle(pool.filter(q => q.difficulty === 'easy')).slice(0, easyCount)
    const medium = shuffle(pool.filter(q => q.difficulty === 'medium')).slice(0, mediumCount)
    const hard = shuffle(pool.filter(q => q.difficulty === 'hard')).slice(0, hardCount)

    result.push(...easy, ...medium, ...hard)
  }

  return shuffle(result)
}

/** Fetch random assessment questions based on step and optional target coding area */
export async function fetchRandomAssessmentQuestions(
  quizIds: string | string[],
  step: number,
  targetCodingArea?: string | null
): Promise<QuestionWithOptions[]> {
  if (step === 1) {
    // 生活日本語: JLPT-style (grammar 30 + reading 15 + listening 15 = 60)
    return fetchStep1JlptStyle(quizIds)
  }

  if (step === 2) {
    // ビジネス日本語: category-based selection (10 per category = 30 total)
    return fetchRandomByCategory(quizIds, 10)
  }

  if (step === 3) {
    // CS知識: weighted category selection
    const { CS_KNOWLEDGE_WEIGHTS } = await import('@/lib/assessment-config')
    const result = await fetchRandomByWeightedCategory(quizIds, CS_KNOWLEDGE_WEIGHTS)
    // Fallback to difficulty-based if categories not yet tagged
    if (result.length > 0) return result
    return fetchRandomByDifficulty(quizIds, 30)
  }

  if (step === 5) {
    // ビジネスリテラシー: 4 categories weighted selection (30 total)
    const weights: Record<string, number> = {
      business_manner: 8,
      communication: 8,
      cross_culture: 7,
      security: 7,
    }
    const result = await fetchRandomByWeightedCategory(quizIds, weights)
    // Fallback to difficulty-based if categories not yet tagged
    if (result.length > 0) return result
    return fetchRandomByDifficulty(quizIds, 30)
  }

  // Step 4 (開発実務能力): use language grouping if available
  if (step === 4 && targetCodingArea) {
    const { getLanguageCategories } = await import('@/lib/assessment-config')
    const categories = getLanguageCategories(step, targetCodingArea)
    if (categories) {
      const result = await fetchRandomByLanguageGroup(quizIds, categories, 30)
      if (result.length > 0) return result
    }
  }

  // Fallback: 30 questions by difficulty
  return fetchRandomByDifficulty(quizIds, 30)
}
