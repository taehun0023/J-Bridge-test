import { createClient } from '@/lib/supabase/server'
import { computeRankingEntry, filterUnscoredUsers, filterForCategory, sortByCategory } from '@/lib/ranking'
import type { RankingUserData, RankingCategory } from '@/lib/ranking'
import RankingClient from './RankingClient'

interface SearchParams {
  category?: string
}

export default async function RankingPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const category = (params.category ?? 'overall') as RankingCategory
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: users } = await supabase
    .from('profiles')
    .select(`
      id, full_name, avatar_url, is_japanese,
      japanese_skills(jlpt_normalized, it_japanese_normalized, updated_at),
      coding_skills(core_normalized, framework_normalized, updated_at)
    `)
    .in('role', ['mentee', 'mentor'])

  const rankingUsers: RankingUserData[] = (users ?? [])
    .filter((u: Record<string, unknown>) => u.japanese_skills !== null || u.coding_skills !== null)
    .map((u: Record<string, unknown>) => {
    const jp = u.japanese_skills as { jlpt_normalized: number; it_japanese_normalized: number; updated_at: string } | null
    const cs = u.coding_skills as { core_normalized: number; framework_normalized: number; updated_at: string } | null
    return {
      user_id: u.id as string,
      full_name: u.full_name as string | null,
      avatar_url: u.avatar_url as string | null,
      is_japanese: u.is_japanese as boolean,
      jlpt_normalized: jp?.jlpt_normalized ?? 0,
      it_japanese_normalized: jp?.it_japanese_normalized ?? 0,
      core_normalized: cs?.core_normalized ?? 0,
      framework_normalized: cs?.framework_normalized ?? 0,
      japanese_skills_updated_at: jp?.updated_at ?? null,
      coding_skills_updated_at: cs?.updated_at ?? null,
    }
  })

  const entries = rankingUsers.map(computeRankingEntry)
  const nonZero = filterUnscoredUsers(entries)
  const filtered = filterForCategory(nonZero, category)
  const sorted = sortByCategory(filtered, category)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ランキング</h1>
      </div>

      <RankingClient
        rankings={sorted}
        category={category}
        currentUserId={user?.id ?? ''}
      />
    </div>
  )
}
