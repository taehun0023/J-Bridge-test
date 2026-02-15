'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'
import { notifyMentorsOf, getUserDisplayName } from '@/lib/notification-helpers'

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

  // Get quiz type for this category/subcategory
  const subcatConfig = ASSIGNMENT_CATEGORIES[exam.category]?.subcategories[exam.subcategory]
  const quizType = subcatConfig?.quizType

  if (!quizType) return { error: 'クイズタイプが見つかりません' }

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
  const userName = await getUserDisplayName(user.id)
  await notifyMentorsOf(
    user.id,
    'exam_completed',
    `${userName}さんが総合試験を完了 (${score}点 - ${passed ? '合格' : '不合格'})`,
    undefined,
    '/admin/tasks',
    examId
  )

  revalidatePath(`/exam/${examId}`)
  revalidatePath('/dashboard/assignments')

  return { score, passed, correctCount, totalCount: answers.length }
}
