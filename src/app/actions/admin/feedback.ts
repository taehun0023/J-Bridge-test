'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createNotification } from '@/app/actions/notifications'
import { logAuditEvent } from '@/app/actions/audit'

export async function createFeedback(formData: FormData) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { user } = auth

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

  if (error) {
    console.error('[createFeedback] DB insert failed:', error.message)
    return { error: error.message }
  }

  console.log('[createFeedback] Feedback created:', data.id)

  await logAuditEvent(user.id, 'create', 'admin_feedbacks', data.id, null, { user_id: userId, category: category || 'seikatsu' })

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
  revalidatePath('/admin')
  revalidatePath('/feedback')
  revalidatePath('/dashboard')
  return { success: true }
}

export async function updateFeedback(feedbackId: string, content: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  // Fetch old data for audit
  const { data: oldData } = await auth.supabase
    .from('admin_feedbacks')
    .select('content')
    .eq('id', feedbackId)
    .eq('admin_id', auth.user.id)
    .single()

  const { error } = await auth.supabase
    .from('admin_feedbacks')
    .update({ content })
    .eq('id', feedbackId)
    .eq('admin_id', auth.user.id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'admin_feedbacks', feedbackId, oldData, { content })

  revalidatePath('/admin/reports')
  revalidatePath('/admin')
  revalidatePath('/feedback')
  return { success: true }
}

export async function deleteFeedback(feedbackId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const isAdmin = auth.profile.role === 'admin'

  // Fetch old data for audit
  let oldQuery = auth.supabase
    .from('admin_feedbacks')
    .select('*')
    .eq('id', feedbackId)
  if (!isAdmin) oldQuery = oldQuery.eq('admin_id', auth.user.id)
  const { data: oldData } = await oldQuery.single()

  let deleteQuery = auth.supabase
    .from('admin_feedbacks')
    .delete()
    .eq('id', feedbackId)
  if (!isAdmin) deleteQuery = deleteQuery.eq('admin_id', auth.user.id)
  const { error } = await deleteQuery

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'delete', 'admin_feedbacks', feedbackId, oldData, null)

  revalidatePath('/admin/reports')
  revalidatePath('/admin')
  revalidatePath('/feedback')
  return { success: true }
}
