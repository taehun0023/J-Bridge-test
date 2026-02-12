'use server'

import { createClient } from '@/lib/supabase/server'

export async function requestContentAccess(category: string, path: string, reason?: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証されていません' }

  const { error } = await supabase
    .from('content_access_requests')
    .insert({
      user_id: user.id,
      content_category: category,
      content_path: path,
      reason: reason ?? null,
    })

  if (error) {
    if (error.code === '23505') {
      return { error: 'すでに申請済みです' }
    }
    return { error: 'リクエストの送信に失敗しました' }
  }

  return { success: true }
}
