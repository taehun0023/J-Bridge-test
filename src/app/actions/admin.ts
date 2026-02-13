'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { createNotification } from '@/app/actions/notifications'

async function assertAdmin() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) throw new Error('Not authenticated')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') throw new Error('Not authorized')

  // Service role client bypasses RLS — needed for admin operations
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) throw new Error('Service role key not configured')

  return { supabase, serviceClient, adminId: user.id }
}

// ─── User Management ───

export async function updateUserRole(userId: string, role: string) {
  const { serviceClient } = await assertAdmin()

  const { error } = await serviceClient
    .from('profiles')
    .update({ role, updated_at: new Date().toISOString() })
    .eq('id', userId)

  if (error) return { error: error.message }
  revalidatePath('/admin/users')
  return { success: true }
}

export async function createUserAccount(formData: FormData) {
  const { serviceClient } = await assertAdmin()

  const email = formData.get('email') as string
  const password = formData.get('password') as string
  const fullName = formData.get('full_name') as string
  const role = formData.get('role') as string

  if (!email || !password || !fullName) {
    return { error: '必須フィールドをすべて入力してください' }
  }

  // Create auth user via admin API (requires service role key)
  const { data: authData, error: authError } = await serviceClient.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: { full_name: fullName },
  })

  if (authError) return { error: authError.message }

  // Update profile role if not default mentee
  // Service role client bypasses RLS so admin can update any profile
  if (authData.user && role !== 'mentee') {
    const { error: updateError } = await serviceClient
      .from('profiles')
      .update({ role, full_name: fullName })
      .eq('id', authData.user.id)

    if (updateError) {
      return { error: `ユーザーは作成されましたが、ロール設定に失敗しました: ${updateError.message}` }
    }
  }

  revalidatePath('/admin/users')
  return { success: true }
}

// ─── Task Assignment ───

export async function createTaskAssignment(formData: FormData) {
  const { supabase, adminId } = await assertAdmin()

  const assignedTo = formData.get('assigned_to') as string
  const targetType = formData.get('target_type') as string
  const targetId = formData.get('target_id') as string
  const title = formData.get('title') as string
  const description = formData.get('description') as string
  const dueDate = formData.get('due_date') as string

  const { error } = await supabase
    .from('task_assignments')
    .insert({
      assigned_by: adminId,
      assigned_to: assignedTo,
      target_type: targetType,
      target_id: targetId,
      title,
      description: description || null,
      due_date: dueDate || null,
    })

  if (error) return { error: error.message }
  revalidatePath('/admin/tasks')
  return { success: true }
}

export async function deleteTaskAssignment(taskId: string) {
  const { supabase } = await assertAdmin()

  const { error } = await supabase
    .from('task_assignments')
    .delete()
    .eq('id', taskId)

  if (error) return { error: error.message }
  revalidatePath('/admin/tasks')
  return { success: true }
}

// ─── Feedback ───

export async function createFeedback(formData: FormData) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor'))
    return { error: '権限がありません' }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const userId = formData.get('user_id') as string
  const category = formData.get('category') as string
  const content = formData.get('content') as string

  if (!userId || !content) return { error: '必須フィールドをすべて入力してください' }

  const { data, error } = await serviceClient
    .from('admin_feedbacks')
    .insert({
      admin_id: user.id,
      user_id: userId,
      category: category || 'seikatsu',
      content,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  // 受信者に通知
  await createNotification(
    userId,
    'feedback_received',
    'フィードバックが届きました',
    content.slice(0, 100),
    '/feedback',
    data.id
  )

  revalidatePath('/admin/reports')
  revalidatePath('/feedback')
  return { success: true }
}

export async function updateFeedback(feedbackId: string, content: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { error } = await supabase
    .from('admin_feedbacks')
    .update({ content })
    .eq('id', feedbackId)
    .eq('admin_id', user.id)

  if (error) return { error: error.message }
  revalidatePath('/admin/reports')
  revalidatePath('/feedback')
  return { success: true }
}

export async function deleteFeedback(feedbackId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { error } = await supabase
    .from('admin_feedbacks')
    .delete()
    .eq('id', feedbackId)
    .eq('admin_id', user.id)

  if (error) return { error: error.message }
  revalidatePath('/admin/reports')
  revalidatePath('/feedback')
  return { success: true }
}

// ─── Retake Management ───

export async function approveRetakeRequest(attemptId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor'))
    return { error: '権限がありません' }

  const serviceClient = createServiceRoleClient()
  const updateClient = serviceClient ?? supabase

  const { error } = await updateClient
    .from('quiz_attempts')
    .update({
      retake_request_status: 'approved',
      retake_approved_at: new Date().toISOString(),
    })
    .eq('id', attemptId)
    .eq('retake_request_status', 'requested')

  if (error) return { error: error.message }
  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard')
  return { success: true }
}

export async function denyRetakeRequest(attemptId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor'))
    return { error: '権限がありません' }

  const serviceClient = createServiceRoleClient()
  const updateClient = serviceClient ?? supabase

  const { error } = await updateClient
    .from('quiz_attempts')
    .update({
      retake_request_status: 'denied',
    })
    .eq('id', attemptId)
    .eq('retake_request_status', 'requested')

  if (error) return { error: error.message }
  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard')
  return { success: true }
}

// ─── Content Management ───

export async function updateCoursePublished(courseId: string, isPublished: boolean) {
  const { supabase } = await assertAdmin()

  const { error } = await supabase
    .from('courses')
    .update({ is_published: isPublished, updated_at: new Date().toISOString() })
    .eq('id', courseId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}

export async function deleteCourse(courseId: string) {
  const { supabase } = await assertAdmin()

  const { error } = await supabase
    .from('courses')
    .delete()
    .eq('id', courseId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}

// ─── Question Management ───

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
  const { serviceClient } = await assertAdmin()

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

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function updateQuestion(questionId: string, data: QuestionFormData) {
  const { serviceClient } = await assertAdmin()

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

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function deleteQuestion(questionId: string) {
  const { serviceClient } = await assertAdmin()

  const { error } = await serviceClient
    .from('quiz_questions')
    .delete()
    .eq('id', questionId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}

export async function toggleQuestionPublished(questionId: string, isPublished: boolean) {
  const { serviceClient } = await assertAdmin()

  const { error } = await serviceClient
    .from('quiz_questions')
    .update({ is_published: isPublished })
    .eq('id', questionId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}
