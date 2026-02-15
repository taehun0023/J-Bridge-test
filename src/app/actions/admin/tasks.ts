'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'

export async function createTaskAssignment(formData: FormData) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const assignedTo = formData.get('assigned_to') as string
  const targetType = formData.get('target_type') as string
  const targetId = formData.get('target_id') as string
  const title = formData.get('title') as string
  const description = formData.get('description') as string
  const dueDate = formData.get('due_date') as string

  const { error } = await supabase
    .from('task_assignments')
    .insert({
      assigned_by: user.id,
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
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.supabase
    .from('task_assignments')
    .delete()
    .eq('id', taskId)

  if (error) return { error: error.message }
  revalidatePath('/admin/tasks')
  return { success: true }
}
