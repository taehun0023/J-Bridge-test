'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { createNotification } from '@/app/actions/notifications'

export async function bulkDeleteFeedbacks() {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') return { error: '権限がありません' }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  // Fetch all feedback IDs then delete
  const { data: allFeedbacks } = await serviceClient
    .from('admin_feedbacks')
    .select('id')

  if (!allFeedbacks?.length) return { success: true }

  const ids = allFeedbacks.map(f => f.id)
  const { error } = await serviceClient
    .from('admin_feedbacks')
    .delete()
    .in('id', ids)

  if (error) return { error: error.message }

  revalidatePath('/profile/feedback')
  revalidatePath('/admin/reports')
  revalidatePath('/dashboard')
  return { success: true }
}

export async function createFeedbackReply(feedbackId: string, content: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth
  if (!content.trim()) return { error: '内容を入力してください' }

  const { error } = await supabase
    .from('feedback_replies')
    .insert({
      feedback_id: feedbackId,
      user_id: user.id,
      content: content.trim(),
    })

  if (error) return { error: error.message }

  // 相手に通知（発信者 or 受信者）
  const { data: feedback } = await supabase
    .from('admin_feedbacks')
    .select('admin_id, user_id')
    .eq('id', feedbackId)
    .single()

  if (feedback) {
    const recipientId = feedback.admin_id === user.id ? feedback.user_id : feedback.admin_id
    await createNotification(
      recipientId,
      'feedback_reply',
      'フィードバックに返信がありました',
      content.slice(0, 100),
      '/profile/feedback',
      feedbackId
    )
  }

  revalidatePath('/profile/feedback')
  return { success: true }
}

export async function updateFeedbackReply(replyId: string, content: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth
  if (!content.trim()) return { error: '内容を入力してください' }

  const { error } = await supabase
    .from('feedback_replies')
    .update({ content: content.trim() })
    .eq('id', replyId)
    .eq('user_id', user.id)

  if (error) return { error: error.message }
  revalidatePath('/profile/feedback')
  return { success: true }
}

export async function deleteFeedbackReply(replyId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { error } = await supabase
    .from('feedback_replies')
    .delete()
    .eq('id', replyId)
    .eq('user_id', user.id)

  if (error) return { error: error.message }
  revalidatePath('/profile/feedback')
  return { success: true }
}
