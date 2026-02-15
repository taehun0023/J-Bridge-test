'use server'

import { requireAuth } from '@/lib/auth-helpers'

export async function requestContentAccess(category: string, path: string, reason?: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

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
