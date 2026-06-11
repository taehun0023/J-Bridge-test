'use server'

import { requireAdmin } from '@/lib/auth-helpers'
import { recalculateUserScores } from '@/modules/scoring'

// NOTE: recalculateUserScores is deliberately NOT re-exported here — a
// 'use server' re-export would expose the unauthenticated, service-role
// helper as a client-callable action. Import it from '@/modules/scoring'.

/**
 * Recalculate scores for all users (admin batch operation).
 */
export async function recalculateAllScores() {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  const { data: users } = await supabase
    .from('profiles')
    .select('id')
    .in('role', ['mentee', 'mentor', 'admin'])

  // Each recalc is ~9 queries — run in small parallel chunks so a large user
  // base doesn't hit the Server Action timeout.
  const CHUNK_SIZE = 5
  const ids = (users ?? []).map(u => u.id)
  let processed = 0
  for (let i = 0; i < ids.length; i += CHUNK_SIZE) {
    const results = await Promise.all(
      ids.slice(i, i + CHUNK_SIZE).map(id => recalculateUserScores(id))
    )
    processed += results.filter(r => r.success).length
  }

  return { success: true, processed }
}
