'use server'

import { revalidatePath } from 'next/cache'
import { requireAuth, requireAdminOrMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { scoreWriting } from '@/lib/writing-scorer'
import { recalculateUserScores } from '@/modules/scoring'
import { checkAssignmentProgress } from '@/app/actions/learning-assignments'
import { shuffleArray } from '@/lib/shuffle'

const WRITING_POOL_QUIZ_ID = 'f0000001-0000-0000-0000-000000000005'
const WRITING_PASS_SCORE = 70

const WRITING_CATEGORIES = ['expression', 'sentence_pattern', 'keigo', 'writing']

export interface WritingItem {
  id: string
  term_ja: string
  term_ko: string
  description: string | null
  example_sentence: string
  example_sentence_ko: string | null
  category: string
}

export interface WritingExerciseRecord {
  id: string
  glossary_id: string
  user_answer: string
  auto_score: number
  memo: string | null
  created_at: string
}

/** Fetch writing items with optional category filter, search, status filter, pagination */
export async function getWritingItems({
  category,
  search,
  page = 1,
  perPage = 20,
  status,
  mastery,
  masteredIds: externalMasteredIds,
}: {
  category?: string
  search?: string
  page?: number
  perPage?: number
  status?: string // 'unanswered' | 'answered'
  mastery?: string // 'mastered' | 'unmastered'
  masteredIds?: string[]
}) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // When filtering by status, we need to know which items have exercises
  let answeredIds: Set<string> | null = null
  if (status === 'unanswered' || status === 'answered') {
    const { data: allExercises } = await supabase
      .from('writing_exercises')
      .select('glossary_id')
      .eq('user_id', user.id)
    answeredIds = new Set((allExercises ?? []).map(e => e.glossary_id))
  }

  // Fetch all matching glossary IDs first (for status filtering)
  let baseQuery = supabase
    .from('it_glossary')
    .select('id', { count: 'exact' })
    .in('category', category && WRITING_CATEGORIES.includes(category) ? [category] : WRITING_CATEGORIES)
    .not('example_sentence', 'is', null)

  if (search) {
    baseQuery = baseQuery.or(`term_ko.ilike.%${search}%,description.ilike.%${search}%,example_sentence_ko.ilike.%${search}%`)
  }

  if (answeredIds !== null) {
    const idArray = [...answeredIds]
    if (status === 'unanswered') {
      if (idArray.length > 0) {
        baseQuery = baseQuery.not('id', 'in', `(${idArray.join(',')})`)
      }
    } else if (status === 'answered') {
      if (idArray.length > 0) {
        baseQuery = baseQuery.in('id', idArray)
      } else {
        // No answered items, return empty
        return { items: [], exerciseMap: {}, totalCount: 0, totalPages: 0 }
      }
    }
  }

  // Mastery filter
  const mIds = externalMasteredIds ?? []
  if (mastery === 'mastered' && mIds.length > 0) {
    baseQuery = baseQuery.in('id', mIds)
  } else if (mastery === 'mastered' && mIds.length === 0) {
    return { items: [], exerciseMap: {}, totalCount: 0, totalPages: 0 }
  } else if (mastery === 'unmastered' && mIds.length > 0) {
    baseQuery = baseQuery.not('id', 'in', `(${mIds.join(',')})`)
  }

  const { count: totalCount } = await baseQuery

  // Now fetch the actual page with full data
  let query = supabase
    .from('it_glossary')
    .select('id, term_ja, term_ko, description, example_sentence, example_sentence_ko, category')
    .in('category', category && WRITING_CATEGORIES.includes(category) ? [category] : WRITING_CATEGORIES)
    .not('example_sentence', 'is', null)
    .order('created_at', { ascending: true })

  if (search) {
    query = query.or(`term_ko.ilike.%${search}%,description.ilike.%${search}%,example_sentence_ko.ilike.%${search}%`)
  }

  if (answeredIds !== null) {
    const idArray = [...answeredIds]
    if (status === 'unanswered') {
      if (idArray.length > 0) {
        query = query.not('id', 'in', `(${idArray.join(',')})`)
      }
    } else if (status === 'answered') {
      if (idArray.length > 0) {
        query = query.in('id', idArray)
      } else {
        return { items: [], exerciseMap: {}, totalCount: 0, totalPages: 0 }
      }
    }
  }

  if (mastery === 'mastered' && mIds.length > 0) {
    query = query.in('id', mIds)
  } else if (mastery === 'unmastered' && mIds.length > 0) {
    query = query.not('id', 'in', `(${mIds.join(',')})`)
  }

  const offset = (page - 1) * perPage
  query = query.range(offset, offset + perPage - 1)
  const { data: items } = await query

  // Fetch exercises for items on this page
  const itemIds = (items ?? []).map(i => i.id)
  const exerciseMap: Record<string, WritingExerciseRecord> = {}

  if (itemIds.length > 0) {
    const { data: exercises } = await supabase
      .from('writing_exercises')
      .select('id, glossary_id, user_answer, auto_score, memo, created_at')
      .eq('user_id', user.id)
      .in('glossary_id', itemIds)
      .order('created_at', { ascending: false })

    for (const ex of exercises ?? []) {
      if (!exerciseMap[ex.glossary_id]) {
        exerciseMap[ex.glossary_id] = ex as WritingExerciseRecord
      }
    }
  }

  // Fetch model answers from quiz_questions (admin-editable)
  const modelAnswerMap: Record<string, string> = {}
  if (itemIds.length > 0) {
    const koTexts = (items ?? []).map(i => i.example_sentence_ko ?? i.term_ko).filter(Boolean)
    if (koTexts.length > 0) {
      const { data: qqs } = await supabase
        .from('quiz_questions')
        .select('question_text, explanation')
        .eq('question_category', 'writing')
        .in('question_text', koTexts)
      for (const qq of qqs ?? []) {
        if (qq.explanation) modelAnswerMap[qq.question_text] = qq.explanation
      }
    }
  }

  const total = totalCount ?? 0
  return {
    items: (items ?? []) as WritingItem[],
    exerciseMap,
    modelAnswerMap,
    totalCount: total,
    totalPages: Math.ceil(total / perPage),
  }
}

/**
 * Fetch 20 questions for the writing test with smart ordering:
 * 1. Unanswered items first
 * 2. Then low-score items (ascending by auto_score)
 * 3. If all items >= 80, random order
 */
export async function getWritingTestQuestions() {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  const [{ data: allItems }, { data: allExercises }] = await Promise.all([
    supabase
      .from('it_glossary')
      .select('id, term_ja, term_ko, description, example_sentence, example_sentence_ko, category')
      .in('category', WRITING_CATEGORIES)
      .not('example_sentence', 'is', null),
    supabase
      .from('writing_exercises')
      .select('glossary_id, auto_score')
      .eq('user_id', user.id)
      .order('created_at', { ascending: false }),
  ])

  if (!allItems || allItems.length === 0) return { error: 'No writing items available' }

  // Build latest score per glossary_id
  const scoreMap: Record<string, number> = {}
  for (const ex of allExercises ?? []) {
    if (!(ex.glossary_id in scoreMap)) {
      scoreMap[ex.glossary_id] = ex.auto_score
    }
  }

  const unanswered: WritingItem[] = []
  const lowScore: { item: WritingItem; score: number }[] = []
  const highScore: WritingItem[] = []

  for (const item of allItems) {
    if (!(item.id in scoreMap)) {
      unanswered.push(item as WritingItem)
    } else if (scoreMap[item.id] < 80) {
      lowScore.push({ item: item as WritingItem, score: scoreMap[item.id] })
    } else {
      highScore.push(item as WritingItem)
    }
  }

  // Sort low-score ascending (worst first)
  lowScore.sort((a, b) => a.score - b.score)

  let questions: WritingItem[]

  if (unanswered.length === 0 && lowScore.length === 0) {
    // All >= 80: random
    questions = shuffleArray(highScore)
  } else {
    // Priority: unanswered (shuffled) → low score (ascending) → high score (shuffled)
    questions = [
      ...shuffleArray(unanswered),
      ...lowScore.map(l => l.item),
      ...shuffleArray(highScore),
    ]
  }

  return { questions: questions.slice(0, 20) as WritingItem[] }
}

/** Score and save a single writing exercise result */
export async function submitWritingAnswer({
  glossaryId,
  userAnswer,
  modelAnswer,
  memo,
}: {
  glossaryId: string
  userAnswer: string
  modelAnswer: string
  memo?: string
}) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  const { score, keywordHits, keywordMisses } = scoreWriting(userAnswer, modelAnswer)

  const { error } = await supabase.from('writing_exercises').insert({
    user_id: user.id,
    glossary_id: glossaryId,
    user_answer: userAnswer,
    auto_score: score,
    memo: memo ?? null,
  })

  if (error) return { error: error.message }

  return { score, keywordHits, keywordMisses }
}

/** Complete a writing test attempt — update quiz_attempts with score/pass + trigger recalculation */
export async function completeWritingAttempt(attemptId: string, scores: number[]) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // Verify attempt exists and belongs to user
  const { data: attempt } = await supabase
    .from('quiz_attempts')
    .select('id, quiz_id, completed_at')
    .eq('id', attemptId)
    .eq('user_id', user.id)
    .single()

  if (!attempt) return { error: 'Attempt not found' }
  if (attempt.completed_at) return { error: 'Already completed' }

  const avgScore = scores.length > 0
    ? Math.round(scores.reduce((sum, s) => sum + s, 0) / scores.length)
    : 0
  const passed = avgScore >= WRITING_PASS_SCORE

  const { error } = await supabase
    .from('quiz_attempts')
    .update({
      score: avgScore,
      passed,
      completed_at: new Date().toISOString(),
    })
    .eq('id', attemptId)

  if (error) return { error: error.message }

  // Async: recalculate scores
  recalculateUserScores(user.id).catch(err =>
    console.error('[Writing Score Recalculation Failed]', user.id, err)
  )

  // Async: check assignment progress on pass
  if (passed) {
    checkAssignmentProgress(user.id, attempt.quiz_id).catch(err =>
      console.error('[Writing Assignment Progress Failed]', user.id, err)
    )
  }

  return { score: avgScore, passed }
}

/** Submit a writing claim via question_claims (existing system) */
export async function submitWritingClaim({
  questionText,
  userAnswer,
  autoScore,
  claimContent,
}: {
  questionText: string
  userAnswer: string
  autoScore: number
  claimContent: string
}) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // Find corresponding quiz_question by matching question_text
  const { data: question } = await supabase
    .from('quiz_questions')
    .select('id')
    .eq('question_category', 'writing')
    .eq('question_text', questionText)
    .limit(1)
    .maybeSingle()

  if (!question) return { error: '対応する問題が見つかりません' }

  // Format claim_reason with answer + score + content
  const reason = `ユーザー回答: ${userAnswer}\n点数: ${autoScore}\n問い合わせ内容: ${claimContent}`

  const { error } = await supabase.from('question_claims').insert({
    question_id: question.id,
    user_id: user.id,
    claim_reason: reason,
  })

  if (error) {
    if (error.code === '23505') return { success: true }
    return { error: '問い合わせ送信に失敗しました' }
  }
  return { success: true }
}

/** Add a new writing item (it_glossary + quiz_questions) */
export async function addWritingItem({
  example_sentence_ko,
  example_sentence,
  description,
}: {
  example_sentence_ko: string
  example_sentence: string
  description: string | null
}) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service key not available' }

  if (!example_sentence_ko || !example_sentence) {
    return { error: '韓国語の意味と模範答案は必須です' }
  }

  // 1. Insert into it_glossary
  const { data: glossaryItem, error: glossaryError } = await serviceClient
    .from('it_glossary')
    .insert({
      term_ja: example_sentence.slice(0, 50),
      reading: null,
      term_ko: example_sentence_ko.slice(0, 50),
      term_en: null,
      category: 'writing',
      subcategory: null,
      description,
      example_sentence,
      example_sentence_ko,
    })
    .select('id')
    .single()

  if (glossaryError) return { error: glossaryError.message }

  // 2. Insert into quiz_questions
  const { error: qqError } = await serviceClient
    .from('quiz_questions')
    .insert({
      quiz_id: 'f0000001-0000-0000-0000-000000000005',
      question_text: example_sentence_ko,
      explanation: example_sentence,
      question_type: 'writing',
      difficulty: '中級',
      question_category: 'writing',
      is_published: true,
      points: 1,
      sort_order: 999,
    })

  if (qqError) return { error: qqError.message }

  revalidatePath('/japanese/business/writing')
  return { success: true }
}

/** Update a user-defined writing item (category='writing' only) */
export async function updateWritingItem(glossaryId: string, data: {
  example_sentence_ko: string
  example_sentence: string
  description: string | null
}) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service key not available' }

  // Verify it's a user-defined item
  const { data: item } = await serviceClient.from('it_glossary').select('category').eq('id', glossaryId).single()
  if (!item || item.category !== 'writing') return { error: 'ユーザー定義の問題のみ編集できます' }

  // Update it_glossary
  await serviceClient.from('it_glossary').update({
    term_ja: data.example_sentence.slice(0, 50),
    term_ko: data.example_sentence_ko.slice(0, 50),
    example_sentence: data.example_sentence,
    example_sentence_ko: data.example_sentence_ko,
    description: data.description,
  }).eq('id', glossaryId)

  // Update corresponding quiz_question
  const oldKo = item ? data.example_sentence_ko : null
  if (oldKo) {
    await serviceClient.from('quiz_questions')
      .update({ question_text: data.example_sentence_ko, explanation: data.example_sentence })
      .eq('question_category', 'writing')
      .eq('quiz_id', 'f0000001-0000-0000-0000-000000000005')
      .or(`question_text.eq.${data.example_sentence_ko},explanation.eq.${data.example_sentence}`)
  }

  revalidatePath('/japanese/business/writing')
  return { success: true }
}

/** Delete a user-defined writing item (category='writing' only) */
export async function deleteWritingItem(glossaryId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service key not available' }

  // Verify it's a user-defined item
  const { data: item } = await serviceClient.from('it_glossary').select('category, example_sentence_ko, term_ko').eq('id', glossaryId).single()
  if (!item || item.category !== 'writing') return { error: 'ユーザー定義の問題のみ削除できます' }

  // Delete quiz_question first (FK constraint)
  const questionText = item.example_sentence_ko ?? item.term_ko
  await serviceClient.from('quiz_questions')
    .delete()
    .eq('question_category', 'writing')
    .eq('question_text', questionText)

  // Delete it_glossary
  await serviceClient.from('it_glossary').delete().eq('id', glossaryId)

  revalidatePath('/japanese/business/writing')
  return { success: true }
}
