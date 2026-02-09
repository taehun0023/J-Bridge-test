import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import Badge from '@/components/ui/Badge'
import EmptyState from '@/components/ui/EmptyState'
import RankingClient from './RankingClient'

interface SearchParams {
  category?: string
}

export default async function RankingPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const category = params.category ?? 'overall'
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  // Get active season
  const { data: season } = await supabase
    .from('ranking_seasons')
    .select('*')
    .eq('is_active', true)
    .single()

  if (!season) {
    return (
      <div>
        <h1 className="text-2xl font-bold text-gray-900">랭킹</h1>
        <EmptyState title="활성 시즌이 없습니다" icon="🏆" />
      </div>
    )
  }

  // Get rankings for this season
  const { data: rankings } = await supabase
    .from('user_rankings')
    .select('*, profiles(full_name, coding_rank)')
    .eq('season_id', season.id)
    .order(
      category === 'jlpt' ? 'jlpt_score' :
      category === 'coding' ? 'coding_score' :
      category === 'attitude' ? 'attitude_score' :
      'overall_score',
      { ascending: false }
    )
    .limit(50)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900">랭킹</h1>
        <p className="mt-1 text-gray-500">
          {season.name} 시즌 ({new Date(season.start_date).toLocaleDateString('ko-KR')} ~ {new Date(season.end_date).toLocaleDateString('ko-KR')})
        </p>
      </div>

      <RankingClient
        rankings={rankings ?? []}
        category={category}
        currentUserId={user?.id ?? ''}
      />
    </div>
  )
}
