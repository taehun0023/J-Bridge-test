'use server'

import { createClient } from '@/lib/supabase/server'

export async function submitQuestionClaim(questionId: string, reason?: string): Promise<{ success?: boolean; error?: string }> {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { error: '認証が必要です' }

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
      user_id: user.id,
      claim_reason: reason || null,
    })

  if (error) {
    // Unique violation means already claimed
    if (error.code === '23505') return { success: true }
    return { error: 'クレーム送信に失敗しました' }
  }

  return { success: true }
}
