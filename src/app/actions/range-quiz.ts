'use server'

import { createClient } from '@/lib/supabase/server'

interface QuizQuestion {
  id: string
  question: string
  reading?: string
  options: { label: string; correct: boolean }[]
}

function shuffle<T>(arr: T[]): T[] {
  const a = [...arr]
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[a[i], a[j]] = [a[j], a[i]]
  }
  return a
}

export async function generateGlossaryQuiz({
  category,
  subcategory,
  categories,
  rangeStart,
  rangeEnd,
  questionCount = 10,
}: {
  category?: string
  subcategory?: string
  categories?: string[]
  rangeStart: number
  rangeEnd: number
  questionCount?: number
}): Promise<{ questions?: QuizQuestion[]; error?: string }> {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  // Build query matching page sort order
  let query = supabase
    .from('it_glossary')
    .select('id, term_ja, reading, term_ko')
    .order('term_ja', { ascending: true })

  if (category) {
    query = query.eq('category', category)
  }
  if (subcategory) {
    query = query.eq('subcategory', subcategory)
  }
  if (categories && categories.length > 0) {
    query = query.in('category', categories)
  }

  // Fetch range (0-indexed: rangeStart-1 to rangeEnd-1)
  query = query.range(rangeStart - 1, rangeEnd - 1)

  const { data: rangeItems, error } = await query
  if (error || !rangeItems || rangeItems.length === 0) {
    return { error: '指定範囲にデータがありません' }
  }

  // Fetch wrong answer pool from same category scope
  let poolQuery = supabase
    .from('it_glossary')
    .select('term_ko')

  if (category) {
    poolQuery = poolQuery.eq('category', category)
  }
  if (categories && categories.length > 0) {
    poolQuery = poolQuery.in('category', categories)
  }

  const { data: poolData } = await poolQuery
  const allAnswers = [...new Set(poolData?.map(p => p.term_ko) ?? [])]

  // Select questions
  const selected = shuffle(rangeItems).slice(0, questionCount)

  const questions: QuizQuestion[] = selected.map(item => {
    const wrongAnswers = shuffle(allAnswers.filter(a => a !== item.term_ko)).slice(0, 3)
    const options = shuffle([
      { label: item.term_ko, correct: true },
      ...wrongAnswers.map(w => ({ label: w, correct: false })),
    ])
    return {
      id: item.id,
      question: item.term_ja,
      reading: item.reading ?? undefined,
      options,
    }
  })

  return { questions }
}

export async function generateCsTermQuiz({
  category,
  difficultyLevel,
  rangeStart,
  rangeEnd,
  questionCount = 10,
}: {
  category: string
  difficultyLevel?: string
  rangeStart: number
  rangeEnd: number
  questionCount?: number
}): Promise<{ questions?: QuizQuestion[]; error?: string }> {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  let query = supabase
    .from('cs_terms')
    .select('id, term_ja, reading, term_ko')
    .eq('category', category)
    .order('sort_order', { ascending: true })

  if (difficultyLevel) {
    query = query.eq('difficulty_level', difficultyLevel)
  }

  query = query.range(rangeStart - 1, rangeEnd - 1)

  const { data: rangeItems, error } = await query
  if (error || !rangeItems || rangeItems.length === 0) {
    return { error: '指定範囲にデータがありません' }
  }

  // Wrong answer pool from same category
  let poolQuery = supabase
    .from('cs_terms')
    .select('term_ko')
    .eq('category', category)

  const { data: poolData } = await poolQuery
  const allAnswers = [...new Set(poolData?.map(p => p.term_ko) ?? [])]

  const selected = shuffle(rangeItems).slice(0, questionCount)

  const questions: QuizQuestion[] = selected.map(item => {
    const wrongAnswers = shuffle(allAnswers.filter(a => a !== item.term_ko)).slice(0, 3)
    const options = shuffle([
      { label: item.term_ko, correct: true },
      ...wrongAnswers.map(w => ({ label: w, correct: false })),
    ])
    return {
      id: item.id,
      question: item.term_ja,
      reading: item.reading ?? undefined,
      options,
    }
  })

  return { questions }
}

export async function generateVocabQuiz({
  level,
  pos,
  rangeStart,
  rangeEnd,
  questionCount = 10,
}: {
  level: string
  pos?: string
  rangeStart: number
  rangeEnd: number
  questionCount?: number
}): Promise<{ questions?: QuizQuestion[]; error?: string }> {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  // Build query matching page sort order
  let query = supabase
    .from('jlpt_vocabulary')
    .select('id, word, reading, meaning_ko')
    .eq('jlpt_level', level)
    .order('created_at', { ascending: true })

  if (pos) {
    query = query.eq('part_of_speech', pos)
  }

  query = query.range(rangeStart - 1, rangeEnd - 1)

  const { data: rangeItems, error } = await query
  if (error || !rangeItems || rangeItems.length === 0) {
    return { error: '指定範囲にデータがありません' }
  }

  // Wrong answer pool from same level
  const { data: poolData } = await supabase
    .from('jlpt_vocabulary')
    .select('meaning_ko')
    .eq('jlpt_level', level)

  const allAnswers = [...new Set(poolData?.map(p => p.meaning_ko) ?? [])]

  const selected = shuffle(rangeItems).slice(0, questionCount)

  const questions: QuizQuestion[] = selected.map(item => {
    const wrongAnswers = shuffle(allAnswers.filter(a => a !== item.meaning_ko)).slice(0, 3)
    const options = shuffle([
      { label: item.meaning_ko, correct: true },
      ...wrongAnswers.map(w => ({ label: w, correct: false })),
    ])
    return {
      id: item.id,
      question: item.word,
      reading: item.reading ?? undefined,
      options,
    }
  })

  return { questions }
}
