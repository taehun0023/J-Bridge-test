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

async function fetchAllQuestions(quizId: string): Promise<QuestionWithOptions[]> {
  const supabase = await createClient()
  const { data, error } = await supabase
    .from('quiz_questions')
    .select('*, quiz_question_options_safe(*)')
    .eq('quiz_id', quizId)
    .order('sort_order', { ascending: true })

  if (error || !data) return []
  return data as unknown as QuestionWithOptions[]
}

/** Balanced random selection by difficulty (JLPT, programming, framework, attitude/culture) */
export async function fetchRandomByDifficulty(quizId: string, count: number): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizId)
  const easy = allQuestions.filter(q => q.difficulty === 'easy')
  const medium = allQuestions.filter(q => q.difficulty === 'medium')
  const hard = allQuestions.filter(q => q.difficulty === 'hard')

  // 30 questions: easy 6, medium 12, hard 12
  // 10 questions (attitude/culture): easy 3, medium 4, hard 3
  const easyCount = count === 10 ? 3 : 6
  const hardCount = count === 10 ? 3 : 12
  const mediumCount = count - easyCount - hardCount

  return shuffle([
    ...shuffle(easy).slice(0, easyCount),
    ...shuffle(medium).slice(0, mediumCount),
    ...shuffle(hard).slice(0, hardCount),
  ])
}

/** Balanced random selection by question_category (IT Japanese: vocab/reading/fill_blank) */
export async function fetchRandomByCategory(quizId: string, countPerCategory: number): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizId)
  const categories = ['vocab', 'reading', 'fill_blank']

  return shuffle(
    categories.flatMap(cat => {
      const pool = allQuestions.filter(q => q.question_category === cat)
      return shuffle(pool).slice(0, countPerCategory)
    })
  )
}

/** Language group based selection for programming/framework quizzes */
export async function fetchRandomByLanguageGroup(
  quizId: string,
  categories: string[],
  count: number
): Promise<QuestionWithOptions[]> {
  const allQuestions = await fetchAllQuestions(quizId)
  const filtered = allQuestions.filter(q => categories.includes(q.question_category ?? ''))

  const easy = filtered.filter(q => q.difficulty === 'easy')
  const medium = filtered.filter(q => q.difficulty === 'medium')
  const hard = filtered.filter(q => q.difficulty === 'hard')

  // 30 questions: easy 6, medium 12, hard 12
  const easyCount = count === 10 ? 3 : 6
  const hardCount = count === 10 ? 3 : 12
  const mediumCount = count - easyCount - hardCount

  return shuffle([
    ...shuffle(easy).slice(0, easyCount),
    ...shuffle(medium).slice(0, mediumCount),
    ...shuffle(hard).slice(0, hardCount),
  ])
}

/** Fetch random assessment questions based on step and optional target coding area */
export async function fetchRandomAssessmentQuestions(
  quizId: string,
  step: number,
  targetCodingArea?: string | null
): Promise<QuestionWithOptions[]> {
  if (step === 2) {
    // IT Japanese: category-based selection (10 per category = 30 total)
    return fetchRandomByCategory(quizId, 10)
  }
  if (step === 5) {
    // Attitude/Culture: 10 questions
    return fetchRandomByDifficulty(quizId, 10)
  }

  // Step 3 (programming) or Step 4 (framework): use language grouping if available
  if ((step === 3 || step === 4) && targetCodingArea) {
    const { getLanguageCategories } = await import('@/lib/assessment-config')
    const categories = getLanguageCategories(step, targetCodingArea)
    if (categories) {
      const result = await fetchRandomByLanguageGroup(quizId, categories, 30)
      // Fallback to difficulty-based if categories not yet tagged in DB
      if (result.length > 0) return result
    }
  }

  // JLPT or fallback: 30 questions by difficulty
  return fetchRandomByDifficulty(quizId, 30)
}
