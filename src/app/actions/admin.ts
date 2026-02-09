'use server'

import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'

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
  return { supabase, adminId: user.id }
}

// ─── User Management ───

export async function updateUserRole(userId: string, role: string) {
  const { supabase } = await assertAdmin()

  const { error } = await supabase
    .from('profiles')
    .update({ role, updated_at: new Date().toISOString() })
    .eq('id', userId)

  if (error) return { error: error.message }
  revalidatePath('/admin/users')
  return { success: true }
}

export async function createUserAccount(formData: FormData) {
  const { supabase } = await assertAdmin()

  const email = formData.get('email') as string
  const password = formData.get('password') as string
  const fullName = formData.get('full_name') as string
  const role = formData.get('role') as string

  if (!email || !password || !fullName) {
    return { error: '필수 필드를 모두 입력하세요' }
  }

  // Create auth user via admin API
  const { data: authData, error: authError } = await supabase.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: { full_name: fullName },
  })

  if (authError) return { error: authError.message }

  // Update profile role (profile is auto-created by trigger)
  if (authData.user && role !== 'mentee') {
    await supabase
      .from('profiles')
      .update({ role, full_name: fullName })
      .eq('id', authData.user.id)
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
  const { supabase, adminId } = await assertAdmin()

  const userId = formData.get('user_id') as string
  const category = formData.get('category') as string
  const content = formData.get('content') as string

  if (!userId || !content) return { error: '필수 필드를 모두 입력하세요' }

  const { error } = await supabase
    .from('admin_feedbacks')
    .insert({
      admin_id: adminId,
      user_id: userId,
      category: category || 'general',
      content,
    })

  if (error) return { error: error.message }
  revalidatePath('/admin/reports')
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
