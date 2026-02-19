'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'

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
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  // Get next sort_order
  const { data: existing } = await auth.serviceClient
    .from('quiz_questions')
    .select('sort_order')
    .eq('quiz_id', quizId)
    .order('sort_order', { ascending: false })
    .limit(1)

  const nextOrder = (existing?.[0]?.sort_order ?? 0) + 1

  const { data: question, error } = await auth.serviceClient
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

  const { error: optError } = await auth.serviceClient
    .from('quiz_question_options')
    .insert(optionRows)

  if (optError) return { error: optError.message }

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function updateQuestion(questionId: string, data: QuestionFormData) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.serviceClient
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
  await auth.serviceClient
    .from('quiz_question_options')
    .delete()
    .eq('question_id', questionId)

  const optionRows = data.options.map((opt, i) => ({
    question_id: questionId,
    option_text: opt.option_text,
    is_correct: opt.is_correct,
    sort_order: i + 1,
  }))

  const { error: optError } = await auth.serviceClient
    .from('quiz_question_options')
    .insert(optionRows)

  if (optError) return { error: optError.message }

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function deleteQuestion(questionId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.serviceClient
    .from('quiz_questions')
    .delete()
    .eq('id', questionId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}

export async function toggleQuestionPublished(questionId: string, isPublished: boolean) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.serviceClient
    .from('quiz_questions')
    .update({ is_published: isPublished })
    .eq('id', questionId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}
