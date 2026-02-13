'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { createNotification } from './notifications'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'

export async function requestExam(category: string, subcategory: string, contentLevel: string | null) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  // Check for existing pending/in_progress exam
  const { data: existing } = await supabase
    .from('comprehensive_exams')
    .select('id')
    .eq('user_id', user.id)
    .eq('category', category)
    .eq('subcategory', subcategory)
    .in('status', ['requested', 'approved', 'in_progress'])
    .limit(1)

  if (existing && existing.length > 0) {
    return { error: '既にリクエスト中または進行中の試験があります' }
  }

  const { data, error } = await supabase
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category,
      subcategory,
      content_level: contentLevel,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  // Notify mentor(s)
  const serviceClient = createServiceRoleClient()
  if (serviceClient) {
    const { data: mentorAssignments } = await serviceClient
      .from('mentor_mentee_assignments')
      .select('mentor_id')
      .eq('mentee_id', user.id)

    const { data: userProfile } = await serviceClient
      .from('profiles')
      .select('full_name')
      .eq('id', user.id)
      .single()

    const catLabel = ASSIGNMENT_CATEGORIES[category]?.label ?? category
    const subLabel = ASSIGNMENT_CATEGORIES[category]?.subcategories[subcategory]?.label ?? subcategory
    const levelStr = contentLevel ? ` ${contentLevel}` : ''
    const userName = userProfile?.full_name ?? 'メンティー'

    for (const assignment of mentorAssignments ?? []) {
      await createNotification(
        assignment.mentor_id,
        'exam_requested',
        `${userName}さんが総合試験をリクエスト`,
        `${catLabel} > ${subLabel}${levelStr}`,
        '/admin/tasks',
        data.id
      )
    }

    // Also notify admins
    const { data: admins } = await serviceClient
      .from('profiles')
      .select('id')
      .eq('role', 'admin')

    for (const admin of admins ?? []) {
      await createNotification(
        admin.id,
        'exam_requested',
        `${userName}さんが総合試験をリクエスト`,
        `${catLabel} > ${subLabel}${levelStr}`,
        '/admin/tasks',
        data.id
      )
    }
  }

  revalidatePath('/dashboard/assignments')
  return { success: true, examId: data.id }
}

export async function approveExam(examId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor')) {
    return { error: '権限がありません' }
  }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam, error: fetchError } = await serviceClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .single()

  if (fetchError || !exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'requested') return { error: 'この試験は承認できません' }

  const { error } = await serviceClient
    .from('comprehensive_exams')
    .update({
      status: 'approved',
      approved_at: new Date().toISOString(),
      approved_by: user.id,
    })
    .eq('id', examId)

  if (error) return { error: error.message }

  // Notify mentee
  await createNotification(
    exam.user_id,
    'exam_approved',
    '総合試験が承認されました',
    '試験を開始できます',
    `/exam/${examId}`,
    examId
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

export async function denyExam(examId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor')) {
    return { error: '権限がありません' }
  }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam } = await serviceClient
    .from('comprehensive_exams')
    .select('user_id, status')
    .eq('id', examId)
    .single()

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'requested') return { error: 'この試験は拒否できません' }

  const { error } = await serviceClient
    .from('comprehensive_exams')
    .update({ status: 'denied' })
    .eq('id', examId)

  if (error) return { error: error.message }

  await createNotification(
    exam.user_id,
    'exam_denied',
    '総合試験リクエストが拒否されました',
    undefined,
    '/dashboard/assignments',
    examId
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

export async function startExam(examId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

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

  // Get quiz type for this category/subcategory
  const subcatConfig = ASSIGNMENT_CATEGORIES[exam.category]?.subcategories[exam.subcategory]
  const quizType = subcatConfig?.quizType

  if (!quizType) return { error: 'クイズタイプが見つかりません' }

  // Fetch random questions
  let query = serviceClient
    .from('quiz_questions')
    .select('id, question_text, quiz_question_options(id, option_text)')
    .eq('quizzes.quiz_type', quizType)

  // Use a join through quizzes to filter by quiz_type and content_level
  const quizQuery = serviceClient
    .from('quizzes')
    .select('id')
    .eq('quiz_type', quizType)
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

  // Update exam status to in_progress
  await serviceClient
    .from('comprehensive_exams')
    .update({
      status: 'in_progress',
      started_at: new Date().toISOString(),
    })
    .eq('id', examId)

  revalidatePath(`/exam/${examId}`)
  return {
    questions: selected.map(q => ({
      id: q.id,
      question_text: q.question_text,
      options: (q.quiz_question_options as { id: string; option_text: string }[]).map(o => ({
        id: o.id,
        option_text: o.option_text,
      })),
    })),
    timeLimit: exam.time_limit_minutes,
    startedAt: new Date().toISOString(),
  }
}

export async function submitExam(
  examId: string,
  answers: { questionId: string; selectedOptionId: string }[]
) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

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

  await serviceClient.from('comprehensive_exam_answers').insert(answerRows)

  const score = answers.length > 0 ? Math.round((correctCount / answers.length) * 100) : 0
  const passed = score >= exam.passing_score
  const newStatus = passed ? 'completed' : 'failed'

  await serviceClient
    .from('comprehensive_exams')
    .update({
      status: newStatus,
      completed_at: new Date().toISOString(),
      score,
      passed,
    })
    .eq('id', examId)

  // Notify mentor(s) about result
  const { data: mentorAssignments } = await serviceClient
    .from('mentor_mentee_assignments')
    .select('mentor_id')
    .eq('mentee_id', user.id)

  const { data: userProfile } = await serviceClient
    .from('profiles')
    .select('full_name')
    .eq('id', user.id)
    .single()

  const userName = userProfile?.full_name ?? 'メンティー'

  for (const assignment of mentorAssignments ?? []) {
    await createNotification(
      assignment.mentor_id,
      'exam_completed',
      `${userName}さんが総合試験を完了 (${score}点 - ${passed ? '合格' : '不合格'})`,
      undefined,
      '/admin/tasks',
      examId
    )
  }

  revalidatePath(`/exam/${examId}`)
  revalidatePath('/dashboard/assignments')

  return { score, passed, correctCount, totalCount: answers.length }
}

export async function getExamStatus(examId: string) {
  const supabase = await createClient()

  const { data, error } = await supabase
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .single()

  if (error) return { error: error.message }
  return { exam: data }
}

export async function requestRetakeExam(examId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { data: exam } = await serviceClient
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .eq('user_id', user.id)
    .single()

  if (!exam) return { error: '試験が見つかりません' }
  if (exam.status !== 'failed') return { error: '不合格の試験のみ再試験リクエストできます' }

  // Create a new exam request (retake)
  const { data: newExam, error: insertError } = await serviceClient
    .from('comprehensive_exams')
    .insert({
      user_id: user.id,
      category: exam.category,
      subcategory: exam.subcategory,
      content_level: exam.content_level,
      status: 'requested',
    })
    .select('id')
    .single()

  if (insertError) return { error: insertError.message }

  // Notify mentor(s)
  const { data: mentorAssignments } = await serviceClient
    .from('mentor_mentee_assignments')
    .select('mentor_id')
    .eq('mentee_id', user.id)

  const { data: userProfile } = await serviceClient
    .from('profiles')
    .select('full_name')
    .eq('id', user.id)
    .single()

  const userName = userProfile?.full_name ?? 'メンティー'

  for (const assignment of mentorAssignments ?? []) {
    await createNotification(
      assignment.mentor_id,
      'exam_requested',
      `${userName}さんが総合試験の再試験をリクエスト`,
      undefined,
      '/admin/tasks',
      newExam.id
    )
  }

  // Also notify admins
  const { data: admins } = await serviceClient
    .from('profiles')
    .select('id')
    .eq('role', 'admin')

  for (const admin of admins ?? []) {
    await createNotification(
      admin.id,
      'exam_requested',
      `${userName}さんが総合試験の再試験をリクエスト`,
      undefined,
      '/admin/tasks',
      newExam.id
    )
  }

  revalidatePath('/dashboard')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}
