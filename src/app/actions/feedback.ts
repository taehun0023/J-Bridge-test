'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { createNotification } from '@/app/actions/notifications'

export async function bulkDeleteFeedbacks() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (!profile) return { error: '権限がありません' }

  if (profile.role === 'admin') {
    const serviceClient = createServiceRoleClient()
    if (!serviceClient) return { error: 'Service role key not configured' }
    const { error } = await serviceClient.from('admin_feedbacks').delete().gte('id', '00000000-0000-0000-0000-000000000000')
    if (error) return { error: error.message }
  } else if (profile.role === 'mentee') {
    const { error } = await supabase
      .from('admin_feedbacks')
      .delete()
      .eq('user_id', user.id)
    if (error) return { error: error.message }
  } else {
    return { error: '権限がありません' }
  }

  revalidatePath('/feedback')
  return { success: true }
}

export async function createFeedbackReply(feedbackId: string, content: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }
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
      '/feedback',
      feedbackId
    )
  }

  revalidatePath('/feedback')
  return { success: true }
}

export async function updateFeedbackReply(replyId: string, content: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }
  if (!content.trim()) return { error: '内容を入力してください' }

  const { error } = await supabase
    .from('feedback_replies')
    .update({ content: content.trim() })
    .eq('id', replyId)
    .eq('user_id', user.id)

  if (error) return { error: error.message }
  revalidatePath('/feedback')
  return { success: true }
}

export async function deleteFeedbackReply(replyId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { error } = await supabase
    .from('feedback_replies')
    .delete()
    .eq('id', replyId)
    .eq('user_id', user.id)

  if (error) return { error: error.message }
  revalidatePath('/feedback')
  return { success: true }
}
