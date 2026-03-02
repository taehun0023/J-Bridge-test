'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { requireAuth } from '@/lib/auth-helpers'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'
import { notifyMentorsOf, getUserDisplayName } from '@/lib/notification-helpers'
import { recalculateUserScores } from '@/modules/scoring'
import { tryCompleteActiveCycle } from '@/app/actions/exam-scheduling'
import { COMP_EXAM_CATEGORY_TO_STEP, ASSESSMENT_QUIZ_IDS, ASSESSMENT_CONTENT_QUIZ_TYPES } from '@/lib/assessment-config'
import { fetchRandomAssessmentQuestions } from '@/lib/supabase/queries/assessments'

/** Shuffle array and assign sort_order to options */
function shuffleOptions(options: { id: string; option_text: string; sort_order?: number }[]) {
  const shuffled = [...options].sort(() => Math.random() - 0.5)
  return shuffled.map((o, i) => ({ id: o.id, option_text: o.option_text, sort_order: i + 1 }))
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

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'approved') return { error: 'この試験はまだ開始できません' }

  // Cycle comprehensive exams: use assessment quiz IDs directly
  if (exam.subcategory === 'comprehensive') {
    const step = COMP_EXAM_CATEGORY_TO_STEP[exam.category]
    if (!step) return { error: 'カテゴリが無効です' }

    const assessmentQuizId = ASSESSMENT_QUIZ_IDS[step]
    if (!assessmentQuizId) return { error: '該当するクイズが見つかりません' }

    // Build quiz ID list: assessment quiz + blended content quizzes (if applicable)
    const quizIds: string[] = [assessmentQuizId]
    const contentQuizTypes = ASSESSMENT_CONTENT_QUIZ_TYPES[step]
    if (contentQuizTypes) {
      const { data: contentQuizzes } = await serviceClient
        .from('quizzes')
        .select('id')
        .in('quiz_type', contentQuizTypes)
        .eq('is_assessment', false)
        .eq('is_published', true)
      if (contentQuizzes?.length) {
        quizIds.push(...contentQuizzes.map(q => q.id))
      }
    }

    // For step 4 (dev), get user's target_coding_area
    let targetCodingArea: string | null = null
    if (step === 4) {
      const { data: profile } = await serviceClient
        .from('profiles')
        .select('target_coding_area')
        .eq('id', user.id)
        .single()
      targetCodingArea = profile?.target_coding_area ?? null
    }

    const questions = await fetchRandomAssessmentQuestions(
      quizIds.length === 1 ? quizIds[0] : quizIds,
      step,
      targetCodingArea
    )

    if (questions.length === 0) {
      return { error: '出題可能な問題がありません' }
    }

    const startedAt = new Date().toISOString()

    // Update exam status to in_progress
    const { error: updateErr } = await serviceClient
      .from('comprehensive_exams')
      .update({
        status: 'in_progress',
        started_at: startedAt,
      })
      .eq('id', examId)

    if (updateErr) {
      console.error('Failed to update exam status to in_progress:', updateErr)
      return { error: '試験の開始に失敗しました' }
    }

    // NOTE: Do NOT revalidatePath here — it causes the server component to re-render,
    // which changes mode from 'start' to 'exam' and re-mounts ExamClient, losing questions state.
    return {
      questions: questions.slice(0, exam.total_questions).map(q => ({
        id: q.id,
        question_text: q.question_text,
        options: shuffleOptions(q.quiz_question_options_safe),
      })),
      timeLimit: exam.time_limit_minutes,
      startedAt,
    }
  }

  // Standard subcategory exam: find quizzes by quiz_type
  const subcatConfig = ASSIGNMENT_CATEGORIES[exam.category]?.subcategories[exam.subcategory]
  const quizTypes = subcatConfig?.quizType ? [subcatConfig.quizType] : []

  if (quizTypes.length === 0) return { error: 'クイズタイプが見つかりません' }

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

  if (quizIds.length === 0) return { error: '該当するクイズが見つかりません' }

  const { data: allQuestions } = await serviceClient
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text)')
    .in('quiz_id', quizIds)

  if (!allQuestions || allQuestions.length === 0) {
    return { error: '出題可能な問題がありません' }
  }

  // Shuffle and pick up to total_questions
  const shuffled = allQuestions.sort(() => Math.random() - 0.5)
  const selected = shuffled.slice(0, exam.total_questions)

  const standardStartedAt = new Date().toISOString()

  // Update exam status to in_progress
  const { error: stdUpdateErr } = await serviceClient
    .from('comprehensive_exams')
    .update({
      status: 'in_progress',
      started_at: standardStartedAt,
    })
    .eq('id', examId)

  if (stdUpdateErr) {
    console.error('Failed to update exam status to in_progress:', stdUpdateErr)
    return { error: '試験の開始に失敗しました' }
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
 * Re-randomizes questions since selected IDs aren't persisted.
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

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'in_progress') return { error: 'この試験は進行中ではありません' }

  // Cycle comprehensive exam: use assessment quiz IDs + blending
  if (exam.subcategory === 'comprehensive') {
    const step = COMP_EXAM_CATEGORY_TO_STEP[exam.category]
    if (!step) return { error: 'カテゴリが無効です' }

    const assessmentQuizId = ASSESSMENT_QUIZ_IDS[step]
    if (!assessmentQuizId) return { error: '該当するクイズが見つかりません' }

    // Build quiz ID list: assessment quiz + blended content quizzes
    const quizIds: string[] = [assessmentQuizId]
    const contentQuizTypes = ASSESSMENT_CONTENT_QUIZ_TYPES[step]
    if (contentQuizTypes) {
      const { data: contentQuizzes } = await serviceClient
        .from('quizzes')
        .select('id')
        .in('quiz_type', contentQuizTypes)
        .eq('is_assessment', false)
        .eq('is_published', true)
      if (contentQuizzes?.length) {
        quizIds.push(...contentQuizzes.map(q => q.id))
      }
    }

    let targetCodingArea: string | null = null
    if (step === 4) {
      const { data: profile } = await serviceClient
        .from('profiles')
        .select('target_coding_area')
        .eq('id', user.id)
        .single()
      targetCodingArea = profile?.target_coding_area ?? null
    }

    const questions = await fetchRandomAssessmentQuestions(
      quizIds.length === 1 ? quizIds[0] : quizIds,
      step,
      targetCodingArea
    )
    if (questions.length === 0) return { error: '出題可能な問題がありません' }

    return {
      questions: questions.slice(0, exam.total_questions).map(q => ({
        id: q.id,
        question_text: q.question_text,
        options: shuffleOptions(q.quiz_question_options_safe),
      })),
      timeLimit: exam.time_limit_minutes,
      startedAt: exam.started_at,
    }
  }

  // Standard subcategory exam
  const subcatConfig = ASSIGNMENT_CATEGORIES[exam.category]?.subcategories[exam.subcategory]
  const quizTypes = subcatConfig?.quizType ? [subcatConfig.quizType] : []
  if (quizTypes.length === 0) return { error: 'クイズタイプが見つかりません' }

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
  if (quizIds.length === 0) return { error: '該当するクイズが見つかりません' }

  const { data: allQuestions } = await serviceClient
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text)')
    .in('quiz_id', quizIds)

  if (!allQuestions || allQuestions.length === 0) return { error: '出題可能な問題がありません' }

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

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'in_progress') return { error: 'この試験は提出できません' }

  // Get correct answers
  const questionIds = answers.map(a => a.questionId)
  const { data: correctOptions } = await serviceClient
    .from('quiz_question_options')
    .select('id, question_id, is_correct')
    .in('question_id', questionIds)
    .eq('is_correct', true)

  const correctMap = new Map(
    correctOptions?.map(o => [o.question_id, o.id]) ?? []
  )

  // Grade and insert answers
  let correctCount = 0
  const answerRows = answers.map(a => {
    const isCorrect = correctMap.get(a.questionId) === a.selectedOptionId
    if (isCorrect) correctCount++
    return {
      exam_id: examId,
      question_id: a.questionId,
      selected_option_id: a.selectedOptionId,
      is_correct: isCorrect,
    }
  })

  const { error: insertErr } = await serviceClient.from('comprehensive_exam_answers').insert(answerRows)
  if (insertErr) {
    console.error('Failed to insert exam answers:', insertErr)
    return { error: '回答の保存に失敗しました' }
  }

  const score = answers.length > 0 ? Math.round((correctCount / answers.length) * 100) : 0
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
    return { error: '試験結果の保存に失敗しました' }
  }

  if (updated.status !== newStatus) {
    console.error('Exam status not updated:', { expected: newStatus, actual: updated.status })
    return { error: '試験結果の保存に失敗しました' }
  }

  // Recalculate radar chart scores (merges with onboarding assessment via max strategy)
  await recalculateUserScores(user.id)

  // If this is a cycle exam, check if the cycle is now complete
  // NOTE: Don't rely on exam.exam_cycle_id — PostgREST schema cache may not recognize the column.
  // Instead, find the active cycle by user_id.
  if (exam.subcategory === 'comprehensive') {
    await tryCompleteActiveCycle(user.id)
  }

  // Notify mentor(s) about result
  const userName = await getUserDisplayName(user.id)
  await notifyMentorsOf(
    user.id,
    'exam_completed',
    `${userName}さんが総合試験を完了 (${score}点 - ${passed ? '合格' : '不合格'})`,
    undefined,
    '/admin/tasks',
    examId
  )

  // NOTE: Do NOT call any revalidatePath here. Any revalidatePath in a server action
  // causes Next.js to re-render the CURRENT page's server component, which replaces
  // ExamClient's review/claim UI with the server-rendered score card.
  // Dashboard/assignments/ranking will get fresh data via full page navigation
  // (window.location.href in ExamClient).

  const results = answers.map(a => ({
    questionId: a.questionId,
    selectedOptionId: a.selectedOptionId,
    correctOptionId: correctMap.get(a.questionId) ?? '',
    isCorrect: correctMap.get(a.questionId) === a.selectedOptionId,
  }))

  return { score, passed, correctCount, totalCount: answers.length, results }
}
