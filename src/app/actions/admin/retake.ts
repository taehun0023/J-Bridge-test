'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdminOrMentor } from '@/lib/auth-helpers'

export async function approveRetakeRequest(attemptId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  const updateClient = serviceClient ?? auth.supabase

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
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  const updateClient = serviceClient ?? auth.supabase

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
