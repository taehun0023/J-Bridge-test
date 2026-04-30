'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { logAuditEvent } from '@/app/actions/audit'
import { ERR } from '@/lib/action-types'
import { getCacheKey, BUCKET } from '@/lib/tts-utils'

// Check if a question is used in any in-progress comprehensive exam
async function checkQuestionInActiveExam(
  serviceClient: NonNullable<ReturnType<typeof createServiceRoleClient>>,
  questionId: string
): Promise<boolean> {
  const { data } = await serviceClient
    .from('comprehensive_exam_questions')
    .select('id, comprehensive_exams!inner(status)')
    .eq('question_id', questionId)
    .eq('comprehensive_exams.status', 'in_progress')
    .limit(1)

  return (data?.length ?? 0) > 0
}

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
  question_subtype: string | null
  explanation: string | null
  topic_key?: string | null
  question_usage_scope?: 'understanding_only' | 'comprehensive_only' | 'exclude' | null
  options: QuestionOptionData[]
}

export async function createQuestion(quizId: string, data: QuestionFormData) {
  const auth = await requireAdmin()
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
      question_subtype: data.question_subtype,
      explanation: data.explanation,
      ...(data.topic_key !== undefined ? { topic_key: data.topic_key } : {}),
      question_usage_scope: data.question_usage_scope ?? null,
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

export async function updateQuestion(questionId: string, data: QuestionFormData, resolveClaims = true) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const inActiveExam = await checkQuestionInActiveExam(serviceClient, questionId)
  if (inActiveExam) return { error: ERR.QUESTION_IN_ACTIVE_EXAM }

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
      question_subtype: data.question_subtype,
      explanation: data.explanation,
      ...(data.topic_key !== undefined ? { topic_key: data.topic_key } : {}),
      question_usage_scope: data.question_usage_scope ?? null,
    })
    .eq('id', questionId)

  if (error) return { error: error.message }

  // Delete existing options and re-insert
  const { error: optDeleteError } = await serviceClient
    .from('quiz_question_options')
    .delete()
    .eq('question_id', questionId)

  if (optDeleteError) return { error: '選択肢の削除に失敗しました: ' + optDeleteError.message }

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

  // Resolve claims only when explicitly requested
  if (resolveClaims) {
    await serviceClient
      .from('question_claims')
      .delete()
      .eq('question_id', questionId)
  }

  // Clean up old TTS cache if question text changed (listening questions)
  if (oldData && oldData.question_text !== data.question_text) {
    const oldHash = getCacheKey(oldData.question_text.replace(/\\n/g, '\n'), 1.0)
    serviceClient.storage.from(BUCKET).remove([`${oldHash}.mp3`]).catch(() => {})
  }

  await logAuditEvent(auth.user.id, 'update', 'quiz_questions', questionId, oldData, { ...data })

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function deleteQuestion(questionId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const inActiveExam = await checkQuestionInActiveExam(serviceClient, questionId)
  if (inActiveExam) return { error: ERR.QUESTION_IN_ACTIVE_EXAM }

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

  // Clean up TTS cache for deleted question
  if (oldData?.question_text) {
    const oldHash = getCacheKey(oldData.question_text.replace(/\\n/g, '\n'), 1.0)
    serviceClient.storage.from(BUCKET).remove([`${oldHash}.mp3`]).catch(() => {})
  }

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
  question_subtype: string | null
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
  const auth = await requireAdmin()
  if ('error' in auth) return { questions: [], error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { questions: [], error: ERR.SERVICE_KEY_MISSING }

  // Fetch questions in batches of 1 quiz ID at a time
  // Supabase counts joined rows toward the response limit (~1000 rows),
  // so a quiz with 250 questions × 4 options = 1000 rows already hits the cap.
  type QRow = {
    id: string; quiz_id: string; question_text: string; question_type: string;
    difficulty: string | null; question_category: string | null; question_subtype: string | null; explanation: string | null;
    is_published: boolean; sort_order: number;
    quiz_question_options: { id: string; option_text: string; is_correct: boolean; sort_order: number }[]
  }
  let allQuestions: QRow[] = []
  for (const qid of quizIds) {
    const { data } = await serviceClient
      .from('quiz_questions')
      .select('id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, is_published, sort_order, quiz_question_options(id, option_text, is_correct, sort_order)')
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
    question_subtype: q.question_subtype,
    explanation: q.explanation,
    is_published: q.is_published,
    sort_order: q.sort_order,
    options: (q.quiz_question_options ?? []).sort((a, b) => a.sort_order - b.sort_order),
    claim_count: claimMap[q.id]?.count ?? 0,
    claim_details: claimMap[q.id]?.details ?? [],
  }))

  return { questions }
}

// ── Paginated question fetching for admin content management ──

interface QuestionPageFilters {
  difficulty?: string | null   // '__null__' → null filter, '' → all
  category?: string | null
  published?: 'published' | 'unpublished' | ''
  claimsOnly?: boolean
  questionUsageScope?: 'understanding_only' | 'comprehensive_only' | 'exclude' | null
  excludeOutOfScope?: boolean
}

interface QuestionPageResult {
  questions: QuestionResult[]
  totalCount: number
  hasMore: boolean
  availableCategories: string[]
  error?: string
}

const CS_ADMIN_CATEGORY_GROUPS: Record<string, string[]> = {
  basic_theory: ['basic_theory', 'basic_theory_check_1', 'basic_theory_check_2', 'basic_theory_final'],
  data_structure: ['data_structure', 'data_structure_check_1', 'data_structure_check_2', 'data_structure_final'],
  algorithm: ['algorithm', 'algorithm_check_1', 'algorithm_check_2', 'algorithm_final'],
  computer_architecture: [
    'computer_architecture',
    'computer_architecture_check_1',
    'computer_architecture_check_2',
    'computer_architecture_final',
  ],
  database: ['database', 'database_check_1', 'database_check_2', 'database_final'],
  network: ['network', 'network_check_1', 'network_check_2', 'network_final'],
  os: ['os', 'os_check_1', 'os_check_2', 'os_final'],
  security: ['security', 'security_check_1', 'security_check_2', 'security_final'],
}

const CS_ADMIN_UNDERSTANDING_CATEGORY_GROUPS: Record<string, string[]> = {
  basic_theory: ['basic_theory_check_1', 'basic_theory_check_2', 'basic_theory_final'],
  data_structure: ['data_structure_check_1', 'data_structure_check_2', 'data_structure_final'],
  algorithm: ['algorithm_check_1', 'algorithm_check_2', 'algorithm_final'],
  computer_architecture: [
    'computer_architecture_check_1',
    'computer_architecture_check_2',
    'computer_architecture_final',
  ],
  database: ['database_check_1', 'database_check_2', 'database_final'],
  network: ['network_check_1', 'network_check_2', 'network_final'],
  os: ['os_check_1', 'os_check_2', 'os_final'],
  security: ['security_check_1', 'security_check_2', 'security_final'],
}

const CS_ADMIN_COMPREHENSIVE_CATEGORY_GROUPS: Record<string, string[]> = {
  basic_theory: ['basic_theory'],
  data_structure: ['data_structure'],
  algorithm: ['algorithm'],
  computer_architecture: ['computer_architecture'],
  database: ['database'],
  network: ['network'],
  os: ['os'],
  security: ['security'],
}

function getAdminCategoryFilterValues(category: string | null | undefined): string[] | null {
  if (!category) return null
  if (category === '__legacy_unclassified__') return null
  if (category.startsWith('__cs_understanding_subject__:')) {
    const subject = category.replace('__cs_understanding_subject__:', '')
    return CS_ADMIN_UNDERSTANDING_CATEGORY_GROUPS[subject] ?? [subject]
  }
  if (category.startsWith('__cs_comprehensive_subject__:')) {
    const subject = category.replace('__cs_comprehensive_subject__:', '')
    return CS_ADMIN_COMPREHENSIVE_CATEGORY_GROUPS[subject] ?? [subject]
  }
  if (category.startsWith('__cs_subject__:')) {
    const subject = category.replace('__cs_subject__:', '')
    return CS_ADMIN_CATEGORY_GROUPS[subject] ?? [subject]
  }
  return [category]
}

const PAGE_SIZE_DEFAULT = 200
const CATEGORY_SCAN_BATCH_SIZE = 1000

export async function fetchQuestionsPage(
  quizIds: string[],
  filters: QuestionPageFilters,
  offset: number,
  limit: number = PAGE_SIZE_DEFAULT
): Promise<QuestionPageResult> {
  const auth = await requireAdmin()
  if ('error' in auth) return { questions: [], totalCount: 0, hasMore: false, availableCategories: [], error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { questions: [], totalCount: 0, hasMore: false, availableCategories: [], error: ERR.SERVICE_KEY_MISSING }
  const client = serviceClient

  if (quizIds.length === 0) return { questions: [], totalCount: 0, hasMore: false, availableCategories: [] }

  // If claimsOnly, first get claimed question IDs
  let claimedIds: string[] | null = null
  if (filters.claimsOnly) {
    const { data: claimRows } = await serviceClient
      .from('question_claims')
      .select('question_id')
    claimedIds = [...new Set((claimRows ?? []).map(r => (r as { question_id: string }).question_id))]
    if (claimedIds.length === 0) return { questions: [], totalCount: 0, hasMore: false, availableCategories: [] }
  }

  // Build base query builder function (reused for count + data).
  // Generic Q preserves the Supabase query type through filter chaining;
  // an internal structural type captures the filter methods we use.
  type Filterable = {
    in: (col: string, vals: readonly unknown[]) => Filterable
    is: (col: string, val: unknown) => Filterable
    eq: (col: string, val: unknown) => Filterable
    or: (filter: string) => Filterable
  }
  function applyFilters<Q>(query: Q, includeCategory: boolean = true): Q {
    let q = query as unknown as Filterable
    q = q.in('quiz_id', quizIds)
    if (filters.difficulty === '__null__') {
      q = q.is('difficulty', null)
    } else if (filters.difficulty) {
      q = q.eq('difficulty', filters.difficulty)
    }
    if (includeCategory && filters.category) {
      if (filters.category === '__legacy_unclassified__') {
        q = q.or('question_category.is.null')
      } else {
        const categoryValues = getAdminCategoryFilterValues(filters.category)
        if (categoryValues && categoryValues.length === 1) {
          q = q.eq('question_category', categoryValues[0])
        } else if (categoryValues && categoryValues.length > 1) {
          q = q.in('question_category', categoryValues)
        }
      }
    }
    if (filters.published === 'published') {
      q = q.eq('is_published', true)
    } else if (filters.published === 'unpublished') {
      q = q.eq('is_published', false)
    }
    if (filters.questionUsageScope) {
      q = q.eq('question_usage_scope', filters.questionUsageScope)
    }
    if (filters.excludeOutOfScope) {
      q = q.or('curriculum_status.is.null,curriculum_status.eq.aligned,curriculum_status.eq.adaptable')
    }
    if (claimedIds) {
      q = q.in('id', claimedIds)
    }
    return q as unknown as Q
  }

  async function fetchAvailableCategories(): Promise<string[]> {
    const categorySet = new Set<string>()
    let scanOffset = 0

    while (true) {
      const categoryQuery = applyFilters(
        client.from('quiz_questions').select('question_category'),
        false
      )
      const { data } = await categoryQuery.range(scanOffset, scanOffset + CATEGORY_SCAN_BATCH_SIZE - 1)
      const rows = (data ?? []) as { question_category: string | null }[]

      for (const row of rows) {
        if (row.question_category) categorySet.add(row.question_category)
      }

      if (rows.length < CATEGORY_SCAN_BATCH_SIZE) break
      scanOffset += CATEGORY_SCAN_BATCH_SIZE
    }

    return [...categorySet]
  }

  const availableCategories = await fetchAvailableCategories()

  // Step 1: Count query
  const countQuery = applyFilters(
    serviceClient.from('quiz_questions').select('id', { count: 'exact', head: true })
  )
  const { count } = await countQuery
  const totalCount = count ?? 0

  if (totalCount === 0 || offset >= totalCount) {
    return { questions: [], totalCount, hasMore: false, availableCategories }
  }

  // Step 2: Question query (no options join to avoid 1000-row limit)
  const dataQuery = applyFilters(
    serviceClient.from('quiz_questions').select('id, quiz_id, question_text, question_type, difficulty, question_category, question_subtype, explanation, is_published, sort_order')
  )
  const { data: questionRows } = await dataQuery
    .order('sort_order')
    .range(offset, offset + limit - 1)

  if (!questionRows || questionRows.length === 0) {
    return { questions: [], totalCount, hasMore: false, availableCategories }
  }

  type QRow = {
    id: string; quiz_id: string; question_text: string; question_type: string;
    difficulty: string | null; question_category: string | null; question_subtype: string | null; explanation: string | null;
    is_published: boolean; sort_order: number;
  }
  const rows = questionRows as unknown as QRow[]
  const questionIds = rows.map(q => q.id)

  // Step 3: Batch fetch options + claims for this page's questions
  type OptRow = { question_id: string; id: string; option_text: string; is_correct: boolean; sort_order: number }
  let allOptions: OptRow[] = []
  const OPT_BATCH = 50 // ~50 questions × 4 options = 200 rows, well under 1000
  for (let i = 0; i < questionIds.length; i += OPT_BATCH) {
    const batch = questionIds.slice(i, i + OPT_BATCH)
    const { data } = await serviceClient
      .from('quiz_question_options')
      .select('question_id, id, option_text, is_correct, sort_order')
      .in('question_id', batch)
      .order('sort_order')
    if (data) allOptions = [...allOptions, ...(data as unknown as OptRow[])]
  }

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

  // Aggregate options by question
  const optionMap: Record<string, OptRow[]> = {}
  for (const o of allOptions) {
    if (!optionMap[o.question_id]) optionMap[o.question_id] = []
    optionMap[o.question_id].push(o)
  }

  // Aggregate claims by question
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

  const questions: QuestionResult[] = rows.map(q => ({
    id: q.id,
    quiz_id: q.quiz_id,
    question_text: q.question_text,
    question_type: q.question_type,
    difficulty: q.difficulty,
    question_category: q.question_category,
    question_subtype: q.question_subtype,
    explanation: q.explanation,
    is_published: q.is_published,
    sort_order: q.sort_order,
    options: (optionMap[q.id] ?? []).sort((a, b) => a.sort_order - b.sort_order),
    claim_count: claimMap[q.id]?.count ?? 0,
    claim_details: claimMap[q.id]?.details ?? [],
  }))

  return {
    questions,
    totalCount,
    hasMore: offset + rows.length < totalCount,
    availableCategories,
  }
}

export async function toggleQuestionPublished(questionId: string, isPublished: boolean) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const inActiveExam = await checkQuestionInActiveExam(serviceClient, questionId)
  if (inActiveExam) return { error: ERR.QUESTION_IN_ACTIVE_EXAM }

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
