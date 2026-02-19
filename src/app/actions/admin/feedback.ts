'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createNotification } from '@/app/actions/notifications'

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
  revalidatePath('/dashboard')
  return { success: true }
}

export async function updateFeedback(feedbackId: string, content: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.supabase
    .from('admin_feedbacks')
    .update({ content })
    .eq('id', feedbackId)
    .eq('admin_id', auth.user.id)

  if (error) return { error: error.message }
  revalidatePath('/admin/reports')
  revalidatePath('/feedback')
  return { success: true }
}

export async function deleteFeedback(feedbackId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.supabase
    .from('admin_feedbacks')
    .delete()
    .eq('id', feedbackId)
    .eq('admin_id', auth.user.id)

  if (error) return { error: error.message }
  revalidatePath('/admin/reports')
  revalidatePath('/feedback')
  return { success: true }
}
