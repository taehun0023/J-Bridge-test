'use server'

import { requireAuth, requireAdmin } from '@/lib/auth-helpers'

export async function resolveQuestionClaims(questionId: string): Promise<{ success?: boolean; error?: string }> {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error as string }

  const { error } = await auth.serviceClient
    .from('question_claims')
    .delete()
    .eq('question_id', questionId)

  if (error) return { error: '問い合わせの削除に失敗しました' }
  return { success: true }
}

export async function resolveMultipleQuestionClaims(
  questionIds: string[]
): Promise<{ success?: boolean; error?: string }> {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error as string }

  if (questionIds.length === 0) return { success: true }

  const { error } = await auth.serviceClient
    .from('question_claims')
    .delete()
    .in('question_id', questionIds)

  if (error) return { error: '問い合わせの一括削除に失敗しました' }
  return { success: true }
}

export async function submitQuestionClaim(questionId: string, reason?: string): Promise<{ success?: boolean; error?: string }> {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  // Verify the question exists
  const { data: question } = await supabase
    .from('quiz_questions')
    .select('id')
    .eq('id', questionId)
    .single()

  if (!question) return { error: '問題が見つかりません' }

  // Insert claim (ON CONFLICT DO NOTHING for unique constraint)
  const { error } = await supabase
    .from('question_claims')
    .insert({
      question_id: questionId,
      user_id: auth.user.id,
      claim_reason: reason || null,
    })

  if (error) {
    // Unique violation means already claimed
    if (error.code === '23505') return { success: true }
    return { error: '問い合わせ送信に失敗しました' }
  }

  return { success: true }
}
