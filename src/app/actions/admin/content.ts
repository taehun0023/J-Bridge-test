'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'

export async function updateCoursePublished(courseId: string, isPublished: boolean) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.supabase
    .from('courses')
    .update({ is_published: isPublished, updated_at: new Date().toISOString() })
    .eq('id', courseId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}

export async function deleteCourse(courseId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.supabase
    .from('courses')
    .delete()
    .eq('id', courseId)

  if (error) return { error: error.message }
  revalidatePath('/admin/courses')
  return { success: true }
}
