'use server'

import { requireAuth } from '@/lib/auth-helpers'

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

// 漢字の meaning_ko は問題の漢字そのものを含む形式があり、選択肢に出すと答えがバレる。
// 主な形式: A「음(漢字), 뜻」 / B「뜻(漢字)」 / C「漢字, 뜻」。漢字部分を除去し意味だけ残す。
function stripKanjiHint(meaningKo: string): string {
  let s = meaningKo
  // A) 「음(漢字), 뜻」→ 先頭の「読み + (漢字),」を除去
  s = s.replace(/^[^(,]*\([^)]*\)\s*,\s*/, '')
  // B) 残った「(漢字)」括弧（漢字を含むもの）を除去: 「고개(峠)」→「고개」
  s = s.replace(/\s*\([^)]*[一-鿿][^)]*\)/g, '')
  // C) 先頭にむき出しの漢字が残る場合を除去: 「届, 닿다」→「닿다」
  s = s.replace(/^[一-鿿]+\s*[,/]\s*/, '')
  return s.trim() || meaningKo
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
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

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
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

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
  const poolQuery = supabase
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
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

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

export async function generateKanjiQuiz({
  level,
  rangeStart,
  rangeEnd,
  questionCount = 10,
}: {
  level: string
  rangeStart: number
  rangeEnd: number
  questionCount?: number
}): Promise<{ questions?: QuizQuestion[]; error?: string }> {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  // Match the kanji page sort order (sort_order ascending)
  const query = supabase
    .from('jlpt_kanji')
    .select('id, kanji, reading_on, reading_kun, meaning_ko')
    .eq('jlpt_level', level)
    .order('sort_order', { ascending: true })
    .range(rangeStart - 1, rangeEnd - 1)

  const { data: rangeItems, error } = await query
  if (error || !rangeItems || rangeItems.length === 0) {
    return { error: '指定範囲にデータがありません' }
  }

  // Wrong answer pool from same level
  const { data: poolData } = await supabase
    .from('jlpt_kanji')
    .select('meaning_ko')
    .eq('jlpt_level', level)

  const allAnswers = [...new Set(poolData?.map(p => stripKanjiHint(p.meaning_ko)) ?? [])]

  const selected = shuffle(rangeItems).slice(0, questionCount)

  const questions: QuizQuestion[] = selected.map(item => {
    const answer = stripKanjiHint(item.meaning_ko)
    const wrongAnswers = shuffle(allAnswers.filter(a => a !== answer)).slice(0, 3)
    const options = shuffle([
      { label: answer, correct: true },
      ...wrongAnswers.map(w => ({ label: w, correct: false })),
    ])
    return {
      id: item.id,
      question: item.kanji,
      reading: item.reading_on ?? item.reading_kun ?? undefined,
      options,
    }
  })

  return { questions }
}

