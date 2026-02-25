'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'
import { logAuditEvent } from '@/app/actions/audit'

export async function updateCoursePublished(courseId: string, isPublished: boolean) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  // Fetch old data for audit
  const { data: oldData } = await auth.supabase
    .from('courses')
    .select('*')
    .eq('id', courseId)
    .single()

  const { error } = await auth.supabase
    .from('courses')
    .update({ is_published: isPublished, updated_at: new Date().toISOString() })
    .eq('id', courseId)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'courses', courseId, oldData, { ...oldData, is_published: isPublished })

  revalidatePath('/admin/courses')
  return { success: true }
}

export async function deleteCourse(courseId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  // Fetch old data for audit (before delete)
  const { data: oldData } = await auth.supabase
    .from('courses')
    .select('*')
    .eq('id', courseId)
    .single()

  const { error } = await auth.supabase
    .from('courses')
    .delete()
    .eq('id', courseId)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'delete', 'courses', courseId, oldData, null)

  revalidatePath('/admin/courses')
  return { success: true }
}
