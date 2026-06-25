import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { fetchScoringData } from './fetch-scoring-data'
import { calcJapaneseAxes } from './axis-jlpt'
import { calcCodingAxes } from './axis-core-programming'
import { calcAttitudeAxis } from './axis-attitude'
import { writeScores } from './write-scores'

/**
 * Recalculate all axis scores for a user based on their quiz attempts and coding submissions.
 *
 * Orchestrator pattern:
 *   1. fetchScoringData() — parallel DB reads
 *   2. calcJapaneseAxes() — Axis 1 & 2 (pure function)
 *   3. calcCodingAxes()   — Axis 3 & 4 (pure function)
 *   4. calcAttitudeAxis() — Axis 5     (pure function)
 *   5. writeScores()      — DB writes
 */
export async function recalculateUserScores(userId: string) {
  const client = createServiceRoleClient() ?? await createClient()

  // 1. Fetch all scoring data in parallel
  const data = await fetchScoringData(client, userId)

  // 2-4. Calculate each axis (pure functions, independently testable)
  const japanese = calcJapaneseAxes(data)
  const coding = calcCodingAxes(data)
  const attitude = calcAttitudeAxis(data)

  // 5. Write results to DB
  await writeScores(client, userId, data.isJapanese, { japanese, coding, attitude })

  return { success: true }
}
