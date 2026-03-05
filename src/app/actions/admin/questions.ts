'use server'

import { revalidatePath } from 'next/cache'
import { requireAdminOrTechMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { logAuditEvent } from '@/app/actions/audit'
import { ERR } from '@/lib/action-types'

interface QuestionOptionData {
  option_text: string
  is_correct: boolean
  sort_order: number
}

interface QuestionFormData {
  question_text: string
  question_type: string
  difficulty: string
  question_category: string | null
  explanation: string | null
  options: QuestionOptionData[]
}

export async function createQuestion(quizId: string, data: QuestionFormData) {
  const auth = await requireAdminOrTechMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Get next sort_order
  const { data: existing } = await serviceClient
    .from('quiz_questions')
    .select('sort_order')
    .eq('quiz_id', quizId)
    .order('sort_order', { ascending: false })
    .limit(1)

  const nextOrder = (existing?.[0]?.sort_order ?? 0) + 1

  const { data: question, error } = await serviceClient
    .from('quiz_questions')
    .insert({
      quiz_id: quizId,
      question_text: data.question_text,
      question_type: data.question_type,
      difficulty: data.difficulty,
      question_category: data.question_category,
      explanation: data.explanation,
      points: 1,
      sort_order: nextOrder,
      is_published: true,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  // Insert options
  const optionRows = data.options.map((opt, i) => ({
    question_id: question.id,
    option_text: opt.option_text,
    is_correct: opt.is_correct,
    sort_order: i + 1,
  }))

  const { error: optError } = await serviceClient
    .from('quiz_question_options')
    .insert(optionRows)

  if (optError) return { error: optError.message }

  await logAuditEvent(auth.user.id, 'create', 'quiz_questions', question.id, null, { quiz_id: quizId, ...data })

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function updateQuestion(questionId: string, data: QuestionFormData) {
  const auth = await requireAdminOrTechMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Fetch old data for audit
  const { data: oldData } = await serviceClient
    .from('quiz_questions')
    .select('*')
    .eq('id', questionId)
    .single()

  const { error } = await serviceClient
    .from('quiz_questions')
    .update({
      question_text: data.question_text,
      difficulty: data.difficulty,
      question_category: data.question_category,
      explanation: data.explanation,
    })
    .eq('id', questionId)

  if (error) return { error: error.message }

  // Delete existing options and re-insert
  await serviceClient
    .from('quiz_question_options')
    .delete()
    .eq('question_id', questionId)

  const optionRows = data.options.map((opt, i) => ({
    question_id: questionId,
    option_text: opt.option_text,
    is_correct: opt.is_correct,
    sort_order: i + 1,
  }))

  const { error: optError } = await serviceClient
    .from('quiz_question_options')
    .insert(optionRows)

  if (optError) return { error: optError.message }

  await logAuditEvent(auth.user.id, 'update', 'quiz_questions', questionId, oldData, { ...data })

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function deleteQuestion(questionId: string) {
  const auth = await requireAdminOrTechMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Fetch old data for audit
  const { data: oldData } = await serviceClient
    .from('quiz_questions')
    .select('*')
    .eq('id', questionId)
    .single()

  const { error } = await serviceClient
    .from('quiz_questions')
    .delete()
    .eq('id', questionId)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'delete', 'quiz_questions', questionId, oldData, null)

  revalidatePath('/admin/courses')
  return { success: true }
}

// ── On-demand question fetching for admin content management ──

interface QuestionResult {
  id: string
  quiz_id: string
  question_text: string
  question_type: string
  difficulty: string | null
  question_category: string | null
  explanation: string | null
  is_published: boolean
  sort_order: number
  options: { id: string; option_text: string; is_correct: boolean; sort_order: number }[]
  claim_count: number
  claim_details: { userName: string; reason: string | null; createdAt: string }[]
}

/**
 * Fetch questions for a specific set of quiz IDs (on-demand).
 * Used by admin content management to avoid loading all questions at once.
 */
export async function fetchQuestionsForQuizIds(quizIds: string[]): Promise<{ questions: QuestionResult[]; error?: string }> {
  const auth = await requireAdminOrTechMentor()
  if ('error' in auth) return { questions: [], error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { questions: [], error: ERR.SERVICE_KEY_MISSING }

  // Fetch questions in batches of 1 quiz ID at a time
  // Supabase counts joined rows toward the response limit (~1000 rows),
  // so a quiz with 250 questions × 4 options = 1000 rows already hits the cap.
  type QRow = {
    id: string; quiz_id: string; question_text: string; question_type: string;
    difficulty: string | null; question_category: string | null; explanation: string | null;
    is_published: boolean; sort_order: number;
    quiz_question_options: { id: string; option_text: string; is_correct: boolean; sort_order: number }[]
  }
  let allQuestions: QRow[] = []
  for (const qid of quizIds) {
    const { data } = await serviceClient
      .from('quiz_questions')
      .select('id, quiz_id, question_text, question_type, difficulty, question_category, explanation, is_published, sort_order, quiz_question_options(id, option_text, is_correct, sort_order)')
      .eq('quiz_id', qid)
      .order('sort_order')
    if (data) allQuestions = [...allQuestions, ...(data as unknown as QRow[])]
  }

  // Fetch claims for these questions
  const questionIds = allQuestions.map(q => q.id)
  type ClaimRow = { question_id: string; claim_reason: string | null; profiles: { full_name: string | null } | null; created_at: string }
  let claimsData: ClaimRow[] = []
  const CLAIM_BATCH = 100
  for (let i = 0; i < questionIds.length; i += CLAIM_BATCH) {
    const batch = questionIds.slice(i, i + CLAIM_BATCH)
    const { data } = await serviceClient
      .from('question_claims')
      .select('question_id, claim_reason, profiles:user_id(full_name), created_at')
      .in('question_id', batch)
    if (data) claimsData = [...claimsData, ...(data as unknown as ClaimRow[])]
  }

  // Aggregate claims
  const claimMap: Record<string, { count: number; details: { userName: string; reason: string | null; createdAt: string }[] }> = {}
  for (const c of claimsData) {
    if (!claimMap[c.question_id]) claimMap[c.question_id] = { count: 0, details: [] }
    claimMap[c.question_id].count++
    claimMap[c.question_id].details.push({
      userName: (c.profiles as { full_name: string | null } | null)?.full_name ?? '不明',
      reason: c.claim_reason,
      createdAt: c.created_at,
    })
  }

  const questions: QuestionResult[] = allQuestions.map(q => ({
    id: q.id,
    quiz_id: q.quiz_id,
    question_text: q.question_text,
    question_type: q.question_type,
    difficulty: q.difficulty,
    question_category: q.question_category,
    explanation: q.explanation,
    is_published: q.is_published,
    sort_order: q.sort_order,
    options: (q.quiz_question_options ?? []).sort((a, b) => a.sort_order - b.sort_order),
    claim_count: claimMap[q.id]?.count ?? 0,
    claim_details: claimMap[q.id]?.details ?? [],
  }))

  return { questions }
}

export async function toggleQuestionPublished(questionId: string, isPublished: boolean) {
  const auth = await requireAdminOrTechMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Fetch old data for audit
  const { data: oldData } = await serviceClient
    .from('quiz_questions')
    .select('is_published')
    .eq('id', questionId)
    .single()

  const { error } = await serviceClient
    .from('quiz_questions')
    .update({ is_published: isPublished })
    .eq('id', questionId)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'quiz_questions', questionId, oldData, { is_published: isPublished })

  revalidatePath('/admin/courses')
  return { success: true }
}
