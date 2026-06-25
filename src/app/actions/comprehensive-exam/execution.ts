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
  jlptMockSectionsFor,
  jlptMockSessionDef,
  jlptMockScaled,
  jlptMockTotalPass,
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

// ─── JLPT 모의시험(jlpt-mock) 헬퍼 ───
type MockRuntimeQuestion = RuntimeQuestion & { section: string; section_label: string }

function mockSectionRank(level: string | null, section: string): number {
  const secs = jlptMockSectionsFor(level ?? '')
  const idx = secs.findIndex(s => s.section === section)
  return idx === -1 ? 99 : idx
}

function mockSectionLabel(level: string | null, section: string): string {
  const secs = jlptMockSectionsFor(level ?? '')
  return secs.find(s => s.section === section)?.label ?? section
}

function formatMockQuestions(questions: MockRuntimeQuestion[]) {
  return questions.map(q => ({
    id: q.id,
    question_text: q.question_text,
    question_category: q.question_category,
    section: q.section,
    section_label: q.section_label,
    options: shuffleOptions(q.quiz_question_options_safe),
  }))
}

async function loadMockSetQuestions(
  serviceClient: NonNullable<ReturnType<typeof createServiceRoleClient>>,
  level: string | null,
  setNo: number | null,
  sessionSections?: string[],
): Promise<{ error?: string; set?: { id: string; time_limit_minutes: number }; questions: MockRuntimeQuestion[] }> {
  if (!level || setNo == null) return { error: 'Mock exam level/set not configured', questions: [] }

  const { data: set } = await serviceClient
    .from('jlpt_mock_sets')
    .select('id, time_limit_minutes')
    .eq('level', level)
    .eq('set_no', setNo)
    .maybeSingle()
  if (!set) return { error: 'Mock set not found', questions: [] }

  const { data: junctionAll } = await serviceClient
    .from('jlpt_mock_set_questions')
    .select('question_id, section, sort_order')
    .eq('set_id', set.id)
  // 교시(session)별 섹션 필터
  const junction = sessionSections
    ? (junctionAll ?? []).filter(j => sessionSections.includes(j.section as string))
    : (junctionAll ?? [])
  if (junction.length === 0) return { set, questions: [] }

  const { data: qRows } = await serviceClient
    .from('quiz_questions')
    .select('id, question_text, question_category, quiz_question_options_safe(id, option_text, sort_order)')
    .in('id', junction.map(j => j.question_id))
  const qMap = new Map((qRows ?? []).map(q => [q.id as string, q as unknown as RuntimeQuestion]))

  const sortedJ = [...junction].sort((a, b) =>
    (mockSectionRank(level, a.section as string) - mockSectionRank(level, b.section as string)) ||
    ((a.sort_order ?? 0) - (b.sort_order ?? 0))
  )
  const rows: MockRuntimeQuestion[] = []
  for (const j of sortedJ) {
    const q = qMap.get(j.question_id as string)
    if (!q) continue
    rows.push({ ...q, section: j.section as string, section_label: mockSectionLabel(level, j.section as string) })
  }
  return { set, questions: rows }
}

async function persistMockQuestions(
  serviceClient: NonNullable<ReturnType<typeof createServiceRoleClient>>,
  examId: string,
  questions: MockRuntimeQuestion[],
) {
  await serviceClient.from('comprehensive_exam_questions').delete().eq('exam_id', examId)
  if (questions.length === 0) return null
  const { error } = await serviceClient.from('comprehensive_exam_questions').insert(
    questions.map((q, index) => ({
      exam_id: examId,
      question_id: q.id,
      question_category: q.question_category,
      section: q.section,
      sort_order: index,
    }))
  )
  return error
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

  if (exam.category === 'jlpt-mock') {
    // 교시(mock_session) 지정 시 해당 섹션만 출제 + 교시 제한시간 적용
    const session = exam.mock_session ? jlptMockSessionDef(exam.content_level ?? '', exam.mock_session) : null
    const { error: mockErr, set, questions } = await loadMockSetQuestions(serviceClient, exam.content_level, exam.mock_set_no, session?.sections)
    if (mockErr) return { error: mockErr }
    if (!set || questions.length === 0) return { error: 'No questions in this mock set' }

    const startedAt = new Date().toISOString()
    const persistErr = await persistMockQuestions(serviceClient, examId, questions)
    if (persistErr) {
      console.error('Failed to persist mock exam questions:', persistErr)
      return { error: 'Failed to persist mock exam questions' }
    }

    const timeLimit = session?.timeMin ?? set.time_limit_minutes
    const { error: updateErr } = await serviceClient
      .from('comprehensive_exams')
      .update({
        status: 'in_progress',
        started_at: startedAt,
        total_questions: questions.length,
        time_limit_minutes: timeLimit,
      })
      .eq('id', examId)
    if (updateErr) {
      console.error('Failed to start mock exam:', updateErr)
      return { error: 'Failed to start mock exam' }
    }

    return { questions: formatMockQuestions(questions), timeLimit, startedAt }
  }

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

  if (exam.category === 'jlpt-mock') {
    const { data: persisted } = await serviceClient
      .from('comprehensive_exam_questions')
      .select('question_id, section, sort_order')
      .eq('exam_id', examId)
      .order('sort_order', { ascending: true })
    if (!persisted || persisted.length === 0) return { error: 'Failed to load mock exam questions' }

    const { data: qRows } = await serviceClient
      .from('quiz_questions')
      .select('id, question_text, question_category, quiz_question_options_safe(id, option_text, sort_order)')
      .in('id', persisted.map(p => p.question_id))
    const qMap = new Map((qRows ?? []).map(q => [q.id as string, q as unknown as RuntimeQuestion]))

    const ordered: MockRuntimeQuestion[] = []
    for (const p of persisted) {
      const q = qMap.get(p.question_id as string)
      if (!q) continue
      ordered.push({ ...q, section: p.section as string, section_label: mockSectionLabel(exam.content_level, p.section as string) })
    }
    return { questions: formatMockQuestions(ordered), timeLimit: exam.time_limit_minutes, startedAt: exam.started_at, draftAnswers: exam.draft_answers ?? null, progressSavedAt: exam.progress_saved_at ?? null }
  }

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

/** 완료된 JLPT 모의시험 교시의 상세 리뷰(문항별 정오 + 섹션 점수) 로드. */
export async function loadMockReview(examId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' } as const

  const { data: exam } = await serviceClient.from('comprehensive_exams').select('*').eq('id', examId).eq('user_id', user.id).single()
  if (!exam) return { error: 'Exam not found' }
  if (exam.category !== 'jlpt-mock') return { error: 'Not a mock exam' }
  if (exam.status !== 'completed' && exam.status !== 'failed') return { error: 'Exam not finished' }

  const { data: persisted } = await serviceClient
    .from('comprehensive_exam_questions').select('question_id, section, sort_order').eq('exam_id', examId).order('sort_order', { ascending: true })
  if (!persisted || persisted.length === 0) return { error: 'No questions' }
  const ids = persisted.map(p => p.question_id)

  const [{ data: qRows }, { data: optRows }, { data: ansRows }] = await Promise.all([
    serviceClient.from('quiz_questions').select('id, question_text, question_category, explanation').in('id', ids),
    serviceClient.from('quiz_question_options').select('id, question_id, option_text, sort_order, is_correct').in('question_id', ids),
    serviceClient.from('comprehensive_exam_answers').select('question_id, selected_option_id, is_correct').eq('exam_id', examId),
  ])

  const qMap = new Map((qRows ?? []).map(q => [q.id as string, q]))
  const optsByQ = new Map<string, { id: string; option_text: string; sort_order: number }[]>()
  const correctByQ = new Map<string, string>()
  for (const o of optRows ?? []) {
    const arr = optsByQ.get(o.question_id as string) ?? []
    arr.push({ id: o.id as string, option_text: o.option_text as string, sort_order: o.sort_order as number })
    optsByQ.set(o.question_id as string, arr)
    if (o.is_correct) correctByQ.set(o.question_id as string, o.id as string)
  }
  const ansByQ = new Map((ansRows ?? []).map(a => [a.question_id as string, a]))

  const questions = persisted.map(p => {
    const q = qMap.get(p.question_id as string)
    return {
      id: p.question_id as string,
      question_text: (q?.question_text as string) ?? '',
      question_category: (q?.question_category as string) ?? null,
      section: p.section as string,
      section_label: mockSectionLabel(exam.content_level, p.section as string),
      options: (optsByQ.get(p.question_id as string) ?? []).sort((a, b) => a.sort_order - b.sort_order),
    }
  })
  const results = persisted.map(p => {
    const a = ansByQ.get(p.question_id as string)
    return {
      questionId: p.question_id as string,
      selectedOptionId: (a?.selected_option_id as string) ?? '',
      correctOptionId: correctByQ.get(p.question_id as string) ?? '',
      isCorrect: a?.is_correct ?? false,
      explanation: (qMap.get(p.question_id as string)?.explanation as string) ?? null,
    }
  })
  const answered = (ansRows ?? []).length
  const correctCount = (ansRows ?? []).filter(a => a.is_correct).length
  const totalCount = persisted.length
  return {
    questions, results,
    score: exam.score ?? 0, passed: exam.passed ?? false,
    correctCount, wrongCount: Math.max(0, answered - correctCount), unansweredCount: Math.max(0, totalCount - answered), totalCount,
    sectionScores: exam.section_scores ?? null,
    partial: exam.mock_session === 1, // 1교시는 2교시 응시 전까지 進行中 표시
  }
}

/** 응시 중 진행상황 임시 저장(제출 안 함). 중단 후 재개용. */
export async function saveExamProgress(examId: string, answers: { questionId: string; selectedOptionId: string }[]) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' } as const

  const map: Record<string, string> = {}
  for (const a of answers) if (a.selectedOptionId) map[a.questionId] = a.selectedOptionId
  const savedAt = new Date().toISOString()
  const { error } = await serviceClient
    .from('comprehensive_exams')
    .update({ draft_answers: map, progress_saved_at: savedAt })
    .eq('id', examId)
    .eq('user_id', user.id)
    .eq('status', 'in_progress')
  if (error) return { error: error.message }
  return { success: true, savedAt }
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

  if (answers.length === 0) {
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

  const questionIds = answers.map(a => a.questionId)
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

  // ─── JLPT 모의시험: 섹션별 채점 + 섹션 게이트 합격 ───
  if (exam.category === 'jlpt-mock') {
    const { data: secRows } = await serviceClient
      .from('comprehensive_exam_questions')
      .select('question_id, section')
      .eq('exam_id', examId)
    const sectionMap = new Map((secRows ?? []).map(r => [r.question_id as string, r.section as string]))

    let mockCorrect = 0
    const mockAnswerRows = answers.map((a, index) => {
      const isCorrect = correctMap.get(a.questionId) === a.selectedOptionId
      if (isCorrect) mockCorrect++
      return {
        exam_id: examId,
        question_id: a.questionId,
        selected_option_id: a.selectedOptionId,
        is_correct: isCorrect,
        section: sectionMap.get(a.questionId) ?? null,
        sort_order: index,
      }
    })

    const { error: mockInsertErr } = await serviceClient.from('comprehensive_exam_answers').insert(mockAnswerRows)
    if (mockInsertErr) {
      console.error('Failed to insert mock exam answers:', mockInsertErr)
      return { error: 'Failed to save exam answers' }
    }

    // 도메인별 전체 문항 수(미응답=오답 반영) + 정답 수
    const sectionTotalMap: Record<string, number> = {}
    for (const r of secRows ?? []) {
      const sec = (r.section as string) ?? 'unknown'
      sectionTotalMap[sec] = (sectionTotalMap[sec] ?? 0) + 1
    }
    const sectionCorrectMap: Record<string, number> = {}
    for (const a of answers) {
      if (correctMap.get(a.questionId) === a.selectedOptionId) {
        const sec = sectionMap.get(a.questionId) ?? 'unknown'
        sectionCorrectMap[sec] = (sectionCorrectMap[sec] ?? 0) + 1
      }
    }

    // 이 인스턴스(교시)에 출제된 섹션만 환산 채점(도메인별 /60)
    type SecScore = { label: string; correct: number; total: number; scaled: number; max: number; passed: boolean; accuracy: number }
    const allSecDefs = jlptMockSectionsFor(exam.content_level)
    const presentDefs = allSecDefs.filter(s => (sectionTotalMap[s.section] ?? 0) > 0)
    const section_scores: Record<string, SecScore> = {}
    let thisScaled = 0
    let thisQuestions = 0
    for (const sec of presentDefs) {
      const total = sectionTotalMap[sec.section] ?? 0
      const correct = sectionCorrectMap[sec.section] ?? 0
      const scaled = jlptMockScaled(correct, total, sec.maxScaled)
      section_scores[sec.section] = {
        label: sec.label, correct, total, scaled, max: sec.maxScaled,
        passed: scaled >= sec.minScaled, accuracy: total > 0 ? Math.round((correct / total) * 100) : 0,
      }
      thisScaled += scaled
      thisQuestions += total
    }
    const nowIso = new Date().toISOString()
    const mockResults = answers.map(a => ({
      questionId: a.questionId,
      selectedOptionId: a.selectedOptionId,
      correctOptionId: correctMap.get(a.questionId) ?? '',
      isCorrect: correctMap.get(a.questionId) === a.selectedOptionId,
      explanation: explanationMap.get(a.questionId) ?? null,
    }))

    // ── 1교시: 부분 저장(합격판정은 2교시 합산에서) ──
    if (exam.mock_session === 1) {
      await serviceClient.from('comprehensive_exams').update({
        status: 'completed', completed_at: nowIso, score: thisScaled, passed: false, section_scores,
      }).eq('id', examId)
      const answered = answers.length
      return {
        score: thisScaled, passed: false, partial: true, session: 1,
        correctCount: mockCorrect, wrongCount: Math.max(0, answered - mockCorrect),
        unansweredCount: Math.max(0, thisQuestions - answered), totalCount: thisQuestions,
        results: mockResults, sectionScores: section_scores,
      }
    }

    // ── 2교시: 1교시 점수와 합산해 최종 판정(전 도메인 ≥19 AND 총점≥100) ──
    if (exam.mock_session === 2) {
      const { data: s1 } = await serviceClient.from('comprehensive_exams')
        .select('section_scores')
        .eq('user_id', user.id).eq('category', 'jlpt-mock')
        .eq('content_level', exam.content_level).eq('mock_set_no', exam.mock_set_no)
        .eq('mock_session', 1).in('status', ['completed', 'failed'])
        .order('completed_at', { ascending: false }).limit(1).maybeSingle()
      const s1scores = (s1?.section_scores ?? {}) as Record<string, SecScore>
      const merged: Record<string, SecScore> = { ...s1scores, ...section_scores }
      let combinedTotal = 0, combinedCorrect = 0, combinedQ = 0
      let allPass = allSecDefs.length > 0
      for (const sec of allSecDefs) {
        const m = merged[sec.section]
        if (!m || !m.passed) allPass = false
        combinedTotal += m?.scaled ?? 0
        combinedCorrect += m?.correct ?? 0
        combinedQ += m?.total ?? 0
      }
      const combinedPass = allPass && combinedTotal >= jlptMockTotalPass(exam.content_level)
      await serviceClient.from('comprehensive_exams').update({
        status: combinedPass ? 'completed' : 'failed', completed_at: nowIso,
        score: combinedTotal, passed: combinedPass, section_scores: merged,
      }).eq('id', examId)
      await recalculateUserScores(user.id)
      const nm = await getUserDisplayName(user.id)
      await notifyMentorsOf(user.id, 'exam_completed',
        `${nm} が JLPT模擬試験(${exam.content_level})を完了しました（${combinedTotal}/180・${combinedPass ? '合格' : '不合格'}）`,
        undefined, '/admin/tasks', examId)
      return {
        score: combinedTotal, passed: combinedPass, session: 2,
        correctCount: combinedCorrect, wrongCount: Math.max(0, combinedQ - combinedCorrect), unansweredCount: 0, totalCount: combinedQ,
        results: mockResults, sectionScores: merged,
      }
    }

    // ── 단일 세션(legacy/멘토배정): 전 섹션 합산 ──
    let allDomainPass = allSecDefs.length > 0
    for (const sec of allSecDefs) { if (!section_scores[sec.section]?.passed) allDomainPass = false }
    const mockPassed = allDomainPass && thisScaled >= jlptMockTotalPass(exam.content_level)
    const { error: mockStatusErr } = await serviceClient.from('comprehensive_exams').update({
      status: mockPassed ? 'completed' : 'failed', completed_at: nowIso,
      score: thisScaled, passed: mockPassed, section_scores,
    }).eq('id', examId)
    if (mockStatusErr) {
      console.error('Failed to update mock exam status:', mockStatusErr)
      return { error: 'Failed to update exam status' }
    }
    await recalculateUserScores(user.id)
    const mockUserName = await getUserDisplayName(user.id)
    await notifyMentorsOf(user.id, 'exam_completed',
      `${mockUserName} が JLPT模擬試験(${exam.content_level})を完了しました（${thisScaled}/180・${mockPassed ? '合格' : '不合格'}）`,
      undefined, '/admin/tasks', examId)
    const answered2 = answers.length
    return {
      score: thisScaled, passed: mockPassed,
      correctCount: mockCorrect, wrongCount: Math.max(0, answered2 - mockCorrect),
      unansweredCount: Math.max(0, thisQuestions - answered2), totalCount: thisQuestions,
      results: mockResults, sectionScores: section_scores,
    }
  }

  let correctCount = 0
  const answerRows = answers.map((a, index) => {
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

  const totalQ = exam.total_questions > 0 ? exam.total_questions : answers.length
  const score = totalQ > 0 ? Math.round((correctCount / totalQ) * 100) : 0
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

  const results = answers.map(a => ({
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
