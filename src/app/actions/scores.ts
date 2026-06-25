'use server'

import { requireAuth } from '@/lib/auth-helpers'
import { recalculateUserScores } from '@/modules/scoring'

// Re-export for backward-compatible import path
export { recalculateUserScores }

/**
 * Recalculate scores for all users (admin batch operation).
 */
export async function recalculateAllScores() {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') return { error: '権限がありません' }

  const { data: users } = await supabase
    .from('profiles')
    .select('id')
    .in('role', ['mentee', 'mentor', 'admin'])

  let processed = 0
  for (const u of users ?? []) {
    await recalculateUserScores(u.id)
    processed++
  }

  return { success: true, processed }
}
