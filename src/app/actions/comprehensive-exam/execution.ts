'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { requireAuth } from '@/lib/auth-helpers'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'
import { notifyMentorsOf, getUserDisplayName } from '@/lib/notification-helpers'
import { recalculateUserScores } from '@/modules/scoring'
import { tryCompleteActiveCycle, resetCycleCompletedAt } from '@/app/actions/exam-scheduling'
import {
  COMP_EXAM_CATEGORY_TO_STEP,
  ASSESSMENT_QUIZ_IDS,
  ASSESSMENT_CONTENT_QUIZ_TYPES,
  ASSESSMENT_TOTAL_QUESTIONS,
  ASSESSMENT_TIME_LIMITS,
  CS_COMPREHENSIVE_TOTAL_QUESTIONS,
} from '@/lib/assessment-config'
import { fetchCsComprehensiveQuestions, fetchRandomAssessmentQuestions } from '@/lib/supabase/queries/assessments'

function shuffleOptions(options: { id: string; option_text: string; sort_order?: number }[]) {
  const shuffled = [...options].sort(() => Math.random() - 0.5)
  return shuffled.map((o, i) => ({ id: o.id, option_text: o.option_text, sort_order: i + 1 }))
}

type RuntimeQuestion = {
  id: string
  question_text: string
  question_category: string | null
  quiz_question_options_safe: {
    id: string
    option_text: string
    sort_order: number
  }[]
}

function formatExamQuestions(questions: RuntimeQuestion[]) {
  return questions.map(q => ({
    id: q.id,
    question_text: q.question_text,
    question_category: q.question_category,
    options: shuffleOptions(q.quiz_question_options_safe),
  }))
}

async function persistExamQuestions(
  serviceClient: NonNullable<ReturnType<typeof createServiceRoleClient>>,
  examId: string,
  questions: {
    id: string
    question_category: string | null
    difficulty: string | null
  }[],
) {
  await serviceClient
    .from('comprehensive_exam_questions')
    .delete()
    .eq('exam_id', examId)

  if (questions.length === 0) return null

  const { error } = await serviceClient
    .from('comprehensive_exam_questions')
    .insert(
      questions.map((q, index) => ({
        exam_id: examId,
        question_id: q.id,
        question_category: q.question_category,
        difficulty: q.difficulty,
        sort_order: index,
      }))
    )

  return error
}

async function loadPersistedExamQuestions(
  serviceClient: NonNullable<ReturnType<typeof createServiceRoleClient>>,
  examId: string,
) {
  const { data: persisted, error: persistedErr } = await serviceClient
    .from('comprehensive_exam_questions')
    .select('question_id, sort_order')
    .eq('exam_id', examId)
    .order('sort_order', { ascending: true })

  if (persistedErr || !persisted || persisted.length === 0) {
    return { error: persistedErr, questions: [] as RuntimeQuestion[] }
  }

  const { data: questionRows, error: questionErr } = await serviceClient
    .from('quiz_questions')
    .select('id, question_text, question_category, quiz_question_options_safe(id, option_text, sort_order)')
    .in('id', persisted.map(row => row.question_id))

  if (questionErr || !questionRows) {
    return { error: questionErr, questions: [] as RuntimeQuestion[] }
  }

  const questionMap = new Map(questionRows.map(q => [q.id, q]))
  const orderedQuestions = persisted
    .map(row => questionMap.get(row.question_id))
    .filter(Boolean) as RuntimeQuestion[]

  return { error: null, questions: orderedQuestions }
}

async function fetchCsComprehensiveQuizIds(
  serviceClient: NonNullable<ReturnType<typeof createServiceRoleClient>>
) {
  const { data: quizzes, error } = await serviceClient
    .from('quizzes')
    .select('id')
    .eq('quiz_type', 'cs_knowledge')

  if (error) {
    console.error('Failed to load CS comprehensive source quizzes:', error)
    return [ASSESSMENT_QUIZ_IDS[3]]
  }

  const ids = new Set<string>([ASSESSMENT_QUIZ_IDS[3]])
  for (const quiz of quizzes ?? []) {
    ids.add(quiz.id as string)
  }
  return [...ids]
}

export async function startExam(examId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam } = await serviceClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) return { error: 'Exam not found' }
  if (exam.status !== 'approved') return { error: 'Exam is not approved' }

  if (exam.category === 'cs' && exam.subcategory === 'comprehensive') {
    const quizIds = await fetchCsComprehensiveQuizIds(serviceClient)
    const selectedQuestions = await fetchCsComprehensiveQuestions(quizIds)
    if (selectedQuestions.length === 0) return { error: 'No CS comprehensive questions available' }

    const totalQ = Math.min(selectedQuestions.length, CS_COMPREHENSIVE_TOTAL_QUESTIONS)
    const startedAt = new Date().toISOString()
    const persistErr = await persistExamQuestions(serviceClient, examId, selectedQuestions.slice(0, totalQ))

    if (persistErr) {
      console.error('Failed to persist CS comprehensive exam questions:', persistErr)
      return { error: 'Failed to persist CS comprehensive exam questions' }
    }

    const { error: updateErr } = await serviceClient
      .from('comprehensive_exams')
      .update({
        status: 'in_progress',
        started_at: startedAt,
        total_questions: totalQ,
      })
      .eq('id', examId)

    if (updateErr) {
      console.error('Failed to update CS comprehensive exam status to in_progress:', updateErr)
      return { error: 'Failed to start CS comprehensive exam' }
    }

    return {
      questions: formatExamQuestions(selectedQuestions.slice(0, totalQ)),
      timeLimit: exam.time_limit_minutes,
      startedAt,
    }
  }

  if (exam.subcategory === 'comprehensive') {
    const step = COMP_EXAM_CATEGORY_TO_STEP[exam.category]
    if (!step) return { error: 'Unsupported comprehensive exam category' }

    const assessmentQuizId = ASSESSMENT_QUIZ_IDS[step]
    if (!assessmentQuizId) return { error: 'Assessment quiz not found' }

    const quizIds: string[] = [assessmentQuizId]
    const contentQuizTypes = ASSESSMENT_CONTENT_QUIZ_TYPES[step]
    if (contentQuizTypes) {
      const { data: contentQuizzes } = await serviceClient
        .from('quizzes')
        .select('id')
        .in('quiz_type', contentQuizTypes)
        .eq('is_assessment', false)
      if (contentQuizzes?.length) {
        quizIds.push(...contentQuizzes.map(q => q.id))
      }
    }

    let targetCodingArea: string | null = null
    let isJapanese: boolean | undefined
    if (step >= 3) {
      const { data: profile } = await serviceClient
        .from('profiles')
        .select('target_coding_area, is_japanese')
        .eq('id', user.id)
        .single()
      targetCodingArea = profile?.target_coding_area ?? null
      isJapanese = profile?.is_japanese ?? undefined
    }

    const questions = await fetchRandomAssessmentQuestions(
      quizIds.length === 1 ? quizIds[0] : quizIds,
      step,
      targetCodingArea,
      isJapanese
    )
    if (questions.length === 0) return { error: 'No comprehensive questions available' }

    const totalQ = ASSESSMENT_TOTAL_QUESTIONS[step] ?? exam.total_questions
    const timeLimit = ASSESSMENT_TIME_LIMITS[step] ?? exam.time_limit_minutes
    const startedAt = new Date().toISOString()

    const { error: updateErr } = await serviceClient
      .from('comprehensive_exams')
      .update({
        status: 'in_progress',
        started_at: startedAt,
        total_questions: totalQ,
        time_limit_minutes: timeLimit,
      })
      .eq('id', examId)

    if (updateErr) {
      console.error('Failed to update comprehensive exam status to in_progress:', updateErr)
      return { error: 'Failed to start comprehensive exam' }
    }

    return {
      questions: formatExamQuestions(questions.slice(0, totalQ)),
      timeLimit,
      startedAt,
    }
  }

  const subcatConfig = ASSIGNMENT_CATEGORIES[exam.category]?.subcategories[exam.subcategory]
  const quizTypes = subcatConfig?.quizType ? [subcatConfig.quizType] : []
  if (quizTypes.length === 0) return { error: 'No quiz types configured for this exam' }

  const quizQuery = serviceClient
    .from('quizzes')
    .select('id')
    .in('quiz_type', quizTypes)
    .eq('is_published', true)

  if (exam.content_level) {
    quizQuery.eq('content_level', exam.content_level)
  }

  const { data: matchingQuizzes } = await quizQuery
  const quizIds = (matchingQuizzes ?? []).map(q => q.id)
  if (quizIds.length === 0) return { error: 'No published quizzes found' }

  const { data: allQuestions } = await serviceClient
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text)')
    .in('quiz_id', quizIds)

  if (!allQuestions || allQuestions.length === 0) {
    return { error: 'No questions available' }
  }

  const shuffled = allQuestions.sort(() => Math.random() - 0.5)
  const selected = shuffled.slice(0, exam.total_questions)
  const standardStartedAt = new Date().toISOString()

  const { error: stdUpdateErr } = await serviceClient
    .from('comprehensive_exams')
    .update({
      status: 'in_progress',
      started_at: standardStartedAt,
    })
    .eq('id', examId)

  if (stdUpdateErr) {
    console.error('Failed to update exam status to in_progress:', stdUpdateErr)
    return { error: 'Failed to start exam' }
  }

  return {
    questions: selected.map(q => ({
      id: q.id,
      question_text: q.question_text,
      options: shuffleOptions(q.quiz_question_options as { id: string; option_text: string }[]),
    })),
    timeLimit: exam.time_limit_minutes,
    startedAt: standardStartedAt,
  }
}

/**
 * Load questions for an in-progress exam (handles page refresh mid-exam).
 */
export async function loadExamQuestions(examId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam } = await serviceClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) return { error: 'Exam not found' }
  if (exam.status !== 'in_progress') return { error: 'Exam is not in progress' }

  if (exam.category === 'cs' && exam.subcategory === 'comprehensive') {
    const { error: persistedErr, questions } = await loadPersistedExamQuestions(serviceClient, examId)
    if (persistedErr || questions.length === 0) {
      console.error('Failed to load persisted CS comprehensive exam questions:', persistedErr)
      return { error: 'Failed to load persisted CS comprehensive exam questions' }
    }

    return {
      questions: formatExamQuestions(questions),
      timeLimit: exam.time_limit_minutes,
      startedAt: exam.started_at,
    }
  }

  if (exam.subcategory === 'comprehensive') {
    const step = COMP_EXAM_CATEGORY_TO_STEP[exam.category]
    if (!step) return { error: 'Unsupported comprehensive exam category' }

    const assessmentQuizId = ASSESSMENT_QUIZ_IDS[step]
    if (!assessmentQuizId) return { error: 'Assessment quiz not found' }

    const quizIds: string[] = [assessmentQuizId]
    const contentQuizTypes = ASSESSMENT_CONTENT_QUIZ_TYPES[step]
    if (contentQuizTypes) {
      const { data: contentQuizzes } = await serviceClient
        .from('quizzes')
        .select('id')
        .in('quiz_type', contentQuizTypes)
        .eq('is_assessment', false)
      if (contentQuizzes?.length) {
        quizIds.push(...contentQuizzes.map(q => q.id))
      }
    }

    let targetCodingArea: string | null = null
    let isJapanese: boolean | undefined
    if (step >= 3) {
      const { data: profile } = await serviceClient
        .from('profiles')
        .select('target_coding_area, is_japanese')
        .eq('id', user.id)
        .single()
      targetCodingArea = profile?.target_coding_area ?? null
      isJapanese = profile?.is_japanese ?? undefined
    }

    const questions = await fetchRandomAssessmentQuestions(
      quizIds.length === 1 ? quizIds[0] : quizIds,
      step,
      targetCodingArea,
      isJapanese
    )
    if (questions.length === 0) return { error: 'No comprehensive questions available' }

    const totalQ = ASSESSMENT_TOTAL_QUESTIONS[step] ?? exam.total_questions
    const timeLimit = ASSESSMENT_TIME_LIMITS[step] ?? exam.time_limit_minutes

    return {
      questions: formatExamQuestions(questions.slice(0, totalQ)),
      timeLimit,
      startedAt: exam.started_at,
    }
  }

  const subcatConfig = ASSIGNMENT_CATEGORIES[exam.category]?.subcategories[exam.subcategory]
  const quizTypes = subcatConfig?.quizType ? [subcatConfig.quizType] : []
  if (quizTypes.length === 0) return { error: 'No quiz types configured for this exam' }

  const quizQuery = serviceClient
    .from('quizzes')
    .select('id')
    .in('quiz_type', quizTypes)
    .eq('is_published', true)

  if (exam.content_level) {
    quizQuery.eq('content_level', exam.content_level)
  }

  const { data: matchingQuizzes } = await quizQuery
  const quizIds = (matchingQuizzes ?? []).map(q => q.id)
  if (quizIds.length === 0) return { error: 'No published quizzes found' }

  const { data: allQuestions } = await serviceClient
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text)')
    .in('quiz_id', quizIds)

  if (!allQuestions || allQuestions.length === 0) return { error: 'No questions available' }

  const shuffled = allQuestions.sort(() => Math.random() - 0.5)
  const selected = shuffled.slice(0, exam.total_questions)

  return {
    questions: selected.map(q => ({
      id: q.id,
      question_text: q.question_text,
      options: shuffleOptions(q.quiz_question_options as { id: string; option_text: string }[]),
    })),
    timeLimit: exam.time_limit_minutes,
    startedAt: exam.started_at,
  }
}

export async function submitExam(
  examId: string,
  answers: { questionId: string; selectedOptionId: string }[]
) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam } = await serviceClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) return { error: 'Exam not found' }
  if (exam.status !== 'in_progress') return { error: 'Exam is not in progress' }

  // Answers are client-controlled: accept at most one answer per question, and
  // only questions actually assigned to this exam when a persisted set exists
  // (CS exams persist their set; other types fall back to dedupe only).
  const { data: assignedRows } = await serviceClient
    .from('comprehensive_exam_questions')
    .select('question_id')
    .eq('exam_id', examId)
  const assignedIds = new Set((assignedRows ?? []).map(r => r.question_id))

  const seenQuestionIds = new Set<string>()
  const validAnswers = answers.filter(a => {
    if (assignedIds.size > 0 && !assignedIds.has(a.questionId)) return false
    if (seenQuestionIds.has(a.questionId)) return false
    seenQuestionIds.add(a.questionId)
    return true
  })

  if (validAnswers.length === 0) {
    const { data: updated, error: statusErr } = await serviceClient
      .from('comprehensive_exams')
      .update({
        status: 'failed',
        completed_at: new Date().toISOString(),
        score: 0,
        passed: false,
      })
      .eq('id', examId)
      .select('id, status, score')
      .single()

    if (statusErr || !updated) {
      console.error('Failed to update exam status (0 answers):', statusErr)
      return { error: 'Failed to submit exam' }
    }

    await recalculateUserScores(user.id)

    if (exam.subcategory === 'comprehensive') {
      await tryCompleteActiveCycle(user.id)
      await resetCycleCompletedAt(user.id)
    }

    const userName = await getUserDisplayName(user.id)
    await notifyMentorsOf(
      user.id,
      'exam_completed',
      `${userName} completed a comprehensive exam (0 points - failed)`,
      undefined,
      '/admin/tasks',
      examId
    )

    return { score: 0, passed: false, correctCount: 0, totalCount: exam.total_questions, results: [] }
  }

  const questionIds = validAnswers.map(a => a.questionId)
  const { data: correctOptions } = await serviceClient
    .from('quiz_question_options')
    .select('id, question_id, is_correct')
    .in('question_id', questionIds)
    .eq('is_correct', true)

  const correctMap = new Map(
    correctOptions?.map(o => [o.question_id, o.id]) ?? []
  )

  const { data: questionRows } = await serviceClient
    .from('quiz_questions')
    .select('id, explanation')
    .in('id', questionIds)

  const explanationMap = new Map(
    questionRows?.map(q => [q.id, q.explanation]) ?? []
  )

  let correctCount = 0
  const answerRows = validAnswers.map((a, index) => {
    const isCorrect = correctMap.get(a.questionId) === a.selectedOptionId
    if (isCorrect) correctCount++
    return {
      exam_id: examId,
      question_id: a.questionId,
      selected_option_id: a.selectedOptionId,
      is_correct: isCorrect,
      sort_order: index,
    }
  })

  const { error: insertErr } = await serviceClient.from('comprehensive_exam_answers').insert(answerRows)
  if (insertErr) {
    console.error('Failed to insert exam answers:', insertErr)
    return { error: 'Failed to save exam answers' }
  }

  const totalQ = exam.total_questions > 0 ? exam.total_questions : validAnswers.length
  const score = totalQ > 0 ? Math.min(100, Math.round((correctCount / totalQ) * 100)) : 0
  const passed = score >= exam.passing_score
  const newStatus = passed ? 'completed' : 'failed'

  const { data: updated, error: statusErr } = await serviceClient
    .from('comprehensive_exams')
    .update({
      status: newStatus,
      completed_at: new Date().toISOString(),
      score,
      passed,
    })
    .eq('id', examId)
    .select('id, status, score')
    .single()

  if (statusErr || !updated) {
    console.error('Failed to update exam status:', statusErr)
    return { error: 'Failed to update exam status' }
  }

  if (updated.status !== newStatus) {
    console.error('Exam status not updated:', { expected: newStatus, actual: updated.status })
    return { error: 'Exam status update mismatch' }
  }

  await recalculateUserScores(user.id)

  if (exam.subcategory === 'comprehensive') {
    await tryCompleteActiveCycle(user.id)
    await resetCycleCompletedAt(user.id)
  }

  const userName = await getUserDisplayName(user.id)
  await notifyMentorsOf(
    user.id,
    'exam_completed',
    `${userName} completed a comprehensive exam (${score} points - ${passed ? 'passed' : 'failed'})`,
    undefined,
    '/admin/tasks',
    examId
  )

  const results = validAnswers.map(a => ({
    questionId: a.questionId,
    selectedOptionId: a.selectedOptionId,
    correctOptionId: correctMap.get(a.questionId) ?? '',
    isCorrect: correctMap.get(a.questionId) === a.selectedOptionId,
    explanation: explanationMap.get(a.questionId) ?? null,
  }))

  return { score, passed, correctCount, totalCount: totalQ, results }
}

/**
 * Auto-fail exams that are still in_progress but have exceeded their time limit.
 * Called from dashboard page load and exam page access.
 * Uses a 5-minute grace period beyond the time limit.
 */
export async function expireStaleExams(userId: string): Promise<number> {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return 0

  const { data: staleExams } = await serviceClient
    .from('comprehensive_exams')
    .select('id, started_at, time_limit_minutes, subcategory')
    .eq('user_id', userId)
    .eq('status', 'in_progress')
    .not('started_at', 'is', null)

  if (!staleExams || staleExams.length === 0) return 0

  const now = Date.now()
  const GRACE_MINUTES = 5
  let expiredCount = 0

  for (const exam of staleExams) {
    const startedAt = new Date(exam.started_at).getTime()
    const limitMs = (exam.time_limit_minutes + GRACE_MINUTES) * 60 * 1000
    if (now - startedAt <= limitMs) continue

    const { error } = await serviceClient
      .from('comprehensive_exams')
      .update({
        status: 'failed',
        completed_at: new Date().toISOString(),
        score: 0,
        passed: false,
      })
      .eq('id', exam.id)
      .eq('status', 'in_progress')

    if (!error) {
      expiredCount++
      if (exam.subcategory === 'comprehensive') {
        await tryCompleteActiveCycle(userId)
      }
    }
  }

  if (expiredCount > 0) {
    await recalculateUserScores(userId)
  }

  return expiredCount
}
