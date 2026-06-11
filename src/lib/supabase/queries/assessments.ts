import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { selectCsComprehensiveQuestionsFromPool } from '@/lib/cs-comprehensive-selector'
import { BUCKET, getCacheKey } from '@/lib/tts-utils'

export interface QuestionWithOptions {
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
  question_subtype: string | null
  curriculum_status: 'aligned' | 'adaptable' | 'out_of_scope' | null
  question_usage_scope: 'understanding_only' | 'comprehensive_only' | 'exclude' | null
  lesson_mapping: string | null
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

/**
 * Extract the TTS script the exam player will request — must replicate
 * ExamClient.parseListeningQuestion exactly (\n\n split, all parts except the
 * last). Returns null when the format doesn't produce a player; in that case
 * the full text is displayed and no audio is required.
 */
function getExamListeningScript(questionText: string): string | null {
  const normalized = questionText.replace(/\\n/g, '\n')
  const parts = normalized.split('\n\n')
  if (parts.length < 3) return null
  return parts.slice(0, parts.length - 1).join('\n\n')
}

/**
 * Safety net: exclude listening questions whose TTS audio is not in the cache
 * bucket. A cache miss at exam time falls back to live synthesis, which can
 * fail and leave the question unanswerable (audio plays only once). Fails open
 * (returns the pool unchanged) if Storage can't be listed, so exams still
 * start when the bucket is unreachable.
 */
async function filterListeningByTtsCache(pool: QuestionWithOptions[]): Promise<QuestionWithOptions[]> {
  const needsAudio = pool.filter(
    q => q.question_category === 'listening' && getExamListeningScript(q.question_text) !== null
  )
  if (needsAudio.length === 0) return pool

  const storageClient = createServiceRoleClient() ?? (await createClient())
  const cachedFiles = new Set<string>()
  const PAGE = 1000
  for (let offset = 0; offset < PAGE * 10; offset += PAGE) {
    const { data, error } = await storageClient.storage.from(BUCKET).list('', { limit: PAGE, offset })
    if (error) return pool
    for (const file of data ?? []) cachedFiles.add(file.name)
    if (!data || data.length < PAGE) break
  }

  const uncachedIds = new Set(
    needsAudio
      // The exam player always requests speed 1.0 (ExamClient ListeningPlayer)
      .filter(q => !cachedFiles.has(`${getCacheKey(getExamListeningScript(q.question_text)!, 1.0)}.mp3`))
      .map(q => q.id)
  )
  if (uncachedIds.size > 0) {
    console.warn(`[TTS Cache Filter] Excluded ${uncachedIds.size}/${needsAudio.length} listening question(s) without cached audio`)
  }
  return pool.filter(q => !uncachedIds.has(q.id))
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
    .select('*, question_subtype, curriculum_status, question_usage_scope, lesson_mapping, quiz_question_options_safe(*)')
    .eq('is_published', true)
    .order('sort_order', { ascending: true })

  if (Array.isArray(quizIds)) {
    query.in('quiz_id', quizIds)
  } else {
    query.eq('quiz_id', quizIds)
  }

  const { data, error } = await query
  if (error || !data) return []
  // Deduplicate by question_text — same content can exist in both assessment and practice quizzes
  const seen = new Set<string>()
  return (data as unknown as QuestionWithOptions[]).filter(q => {
    const key = q.question_text.trim()
    if (seen.has(key)) return false
    seen.add(key)
    return true
  })
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

export async function fetchCsComprehensiveQuestions(quizIds: string | string[]): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizIds)
  return selectCsComprehensiveQuestionsFromPool(allQuestions)
}

/** Step 1 JLPT-style selection: listening 15 + grammar 30 + reading 15 = 60, with N-level difficulty distribution.
 *  Questions are grouped by category (order from STEP1_CATEGORY_WEIGHTS), shuffled within each category. */
async function fetchStep1JlptStyle(quizIds: string | string[]): Promise<QuestionWithOptions[]> {
  const { STEP1_CATEGORY_WEIGHTS, STEP1_DIFFICULTY_RATIOS } = await import('@/lib/assessment-config')
  const allQuestions = await filterListeningByTtsCache(await fetchAllQuestions(quizIds))

  const result: QuestionWithOptions[] = []
  const usedIds = new Set<string>()

  for (const [category, targetCount] of Object.entries(STEP1_CATEGORY_WEIGHTS)) {
    const categoryPool = allQuestions.filter(q => q.question_category === category)
    if (categoryPool.length === 0) continue

    const picked: QuestionWithOptions[] = []

    for (const [difficulty, ratio] of Object.entries(STEP1_DIFFICULTY_RATIOS)) {
      const count = Math.round(targetCount * ratio)
      const pool = shuffle(categoryPool.filter(q => q.difficulty === difficulty && !usedIds.has(q.id)))
      const selected = pool.slice(0, count)
      selected.forEach(q => usedIds.add(q.id))
      picked.push(...selected)
    }

    // Rounding error correction: fill shortfall from remaining pool
    if (picked.length < targetCount) {
      const remaining = shuffle(categoryPool.filter(q => !usedIds.has(q.id)))
      const needed = remaining.slice(0, targetCount - picked.length)
      needed.forEach(q => usedIds.add(q.id))
      picked.push(...needed)
    }

    // Shuffle within category, but keep category order intact.
    // Math.round per difficulty can overshoot targetCount (e.g. 15 → 17) —
    // trim after shuffling so the cut falls uniformly across difficulties.
    result.push(...shuffle(picked).slice(0, targetCount))
  }

  return result
}

/** Step 2 Business JP selection: vocabulary 15 + sentence_pattern 15 + business_expression 15 + reading 15 = 60, with 初級/中級/上級 distribution.
 *  Questions are grouped by category (order from STEP2_CATEGORY_WEIGHTS), shuffled within each category. */
async function fetchStep2BusinessStyle(quizIds: string | string[]): Promise<QuestionWithOptions[]> {
  const { STEP2_CATEGORY_WEIGHTS, STEP2_DIFFICULTY_RATIOS } = await import('@/lib/assessment-config')
  const allQuestions = await fetchAllQuestions(quizIds)

  const result: QuestionWithOptions[] = []
  const usedIds = new Set<string>()

  for (const [category, targetCount] of Object.entries(STEP2_CATEGORY_WEIGHTS)) {
    const categoryPool = allQuestions.filter(q => q.question_category === category)
    if (categoryPool.length === 0) continue

    const picked: QuestionWithOptions[] = []

    for (const [difficulty, ratio] of Object.entries(STEP2_DIFFICULTY_RATIOS)) {
      const count = Math.round(targetCount * ratio)
      const pool = shuffle(categoryPool.filter(q => q.difficulty === difficulty && !usedIds.has(q.id)))
      const selected = pool.slice(0, count)
      selected.forEach(q => usedIds.add(q.id))
      picked.push(...selected)
    }

    // Rounding error correction: fill shortfall from remaining pool
    if (picked.length < targetCount) {
      const remaining = shuffle(categoryPool.filter(q => !usedIds.has(q.id)))
      const needed = remaining.slice(0, targetCount - picked.length)
      needed.forEach(q => usedIds.add(q.id))
      picked.push(...needed)
    }

    // Shuffle within category, but keep category order intact.
    // Math.round per difficulty can overshoot targetCount (e.g. 15 → 17) —
    // trim after shuffling so the cut falls uniformly across difficulties.
    result.push(...shuffle(picked).slice(0, targetCount))
  }

  return result
}

/** Step 3 CS Knowledge selection: category-weighted + difficulty-distributed.
 *  Uses STEP3_DIFFICULTY_RATIOS within each category from CS_KNOWLEDGE_WEIGHTS. */
async function fetchStep3CsStyle(quizIds: string | string[]): Promise<QuestionWithOptions[]> {
  const { CS_KNOWLEDGE_WEIGHTS, STEP3_DIFFICULTY_RATIOS } = await import('@/lib/assessment-config')
  const allQuestions = await fetchAllQuestions(quizIds)

  const result: QuestionWithOptions[] = []
  const usedIds = new Set<string>()

  for (const [category, targetCount] of Object.entries(CS_KNOWLEDGE_WEIGHTS)) {
    const categoryPool = allQuestions.filter(q => q.question_category === category)
    if (categoryPool.length === 0) continue

    const picked: QuestionWithOptions[] = []

    for (const [difficulty, ratio] of Object.entries(STEP3_DIFFICULTY_RATIOS)) {
      const count = Math.round(targetCount * ratio)
      const pool = shuffle(categoryPool.filter(q => q.difficulty === difficulty && !usedIds.has(q.id)))
      const selected = pool.slice(0, count)
      selected.forEach(q => usedIds.add(q.id))
      picked.push(...selected)
    }

    // Rounding error correction: fill shortfall from remaining pool
    if (picked.length < targetCount) {
      const remaining = shuffle(categoryPool.filter(q => !usedIds.has(q.id)))
      const needed = remaining.slice(0, targetCount - picked.length)
      needed.forEach(q => usedIds.add(q.id))
      picked.push(...needed)
    }

    result.push(...shuffle(picked).slice(0, targetCount))
  }

  return result.length > 0 ? result : fetchRandomByDifficulty(quizIds, 30)
}

/** Step 4 Dev Practical selection: category × subtype × difficulty 3-dimensional balanced selection.
 *  Each category gets 20 questions: concept 10 + code_reading 10.
 *  Each subtype split: easy 30% (3), medium 50% (5), hard 20% (2). */
async function fetchStep4DevStyle(quizIds: string | string[], targetCodingArea: string | null): Promise<QuestionWithOptions[]> {
  const {
    STEP4_CATEGORY_WEIGHTS_JAVA, STEP4_CATEGORY_WEIGHTS_JS, STEP4_DIFFICULTY_RATIOS,
    STEP4_SUBTYPE_SPLIT, getLanguageCategories,
  } = await import('@/lib/assessment-config')

  const categories = getLanguageCategories(4, targetCodingArea)
  if (!categories) return fetchRandomByDifficulty(quizIds, 60)

  const weights = targetCodingArea === 'java' ? STEP4_CATEGORY_WEIGHTS_JAVA : STEP4_CATEGORY_WEIGHTS_JS
  const allQuestions = await fetchAllQuestions(quizIds)
  const filtered = allQuestions.filter(q => categories.includes(q.question_category ?? ''))

  const result: QuestionWithOptions[] = []
  const usedIds = new Set<string>()

  for (const [category, categoryTarget] of Object.entries(weights)) {
    const categoryPool = filtered.filter(q => q.question_category === category)
    if (categoryPool.length === 0) continue

    const categoryPicked: QuestionWithOptions[] = []

    for (const [subtype, subtypeTarget] of Object.entries(STEP4_SUBTYPE_SPLIT)) {
      const subtypePool = categoryPool.filter(q => q.question_subtype === subtype)

      // Pick by difficulty ratio within this subtype
      for (const [difficulty, ratio] of Object.entries(STEP4_DIFFICULTY_RATIOS)) {
        const count = Math.round(subtypeTarget * ratio)
        const pool = shuffle(subtypePool.filter(q => q.difficulty === difficulty && !usedIds.has(q.id)))
        const selected = pool.slice(0, count)
        selected.forEach(q => usedIds.add(q.id))
        categoryPicked.push(...selected)
      }

      // Rounding fix within subtype
      const subtypePicked = categoryPicked.filter(q => q.question_subtype === subtype).length
      if (subtypePicked < subtypeTarget) {
        const remaining = shuffle(subtypePool.filter(q => !usedIds.has(q.id)))
        const needed = remaining.slice(0, subtypeTarget - subtypePicked)
        needed.forEach(q => usedIds.add(q.id))
        categoryPicked.push(...needed)
      }
    }

    // Fallback: if code_reading shortage, fill from concept (or vice versa)
    if (categoryPicked.length < categoryTarget) {
      const remaining = shuffle(categoryPool.filter(q => !usedIds.has(q.id)))
      const needed = remaining.slice(0, categoryTarget - categoryPicked.length)
      needed.forEach(q => usedIds.add(q.id))
      categoryPicked.push(...needed)
    }

    result.push(...shuffle(categoryPicked))
  }

  if (result.length > 0) return shuffle(result)

  // Fallback: language group selection
  const langResult = await fetchRandomByLanguageGroup(quizIds, categories, 60)
  if (langResult.length > 0) return langResult
  return fetchRandomByDifficulty(quizIds, 60)
}

/** Fetch random assessment questions based on step and optional target coding area */
export async function fetchRandomAssessmentQuestions(
  quizIds: string | string[],
  step: number,
  targetCodingArea?: string | null,
  isJapanese?: boolean
): Promise<QuestionWithOptions[]> {
  if (step === 1) {
    return fetchStep1JlptStyle(quizIds)
  }

  if (step === 2) {
    return fetchStep2BusinessStyle(quizIds)
  }

  if (step === 3) {
    return fetchStep3CsStyle(quizIds)
  }

  if (step === 4) {
    return fetchStep4DevStyle(quizIds, targetCodingArea ?? null)
  }

  if (step === 5) {
    // ビジネスリテラシー: weighted category selection (30 total)
    const weights: Record<string, number> = isJapanese
      ? { business_manner: 10, communication: 10, security: 10 }
      : { business_manner: 8, communication: 8, cross_culture: 7, security: 7 }
    const result = await fetchRandomByWeightedCategory(quizIds, weights)
    if (result.length > 0) return result
    return fetchRandomByDifficulty(quizIds, 30)
  }

  // Fallback: 30 questions by difficulty
  return fetchRandomByDifficulty(quizIds, 30)
}
