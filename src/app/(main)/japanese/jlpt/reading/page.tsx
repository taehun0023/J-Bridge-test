import { createClient } from '@/lib/supabase/server'
import type { JlptLevel } from '@/lib/supabase/types'
import { getMasteredIds } from '@/app/actions/mastery'
import { getJlptLevel } from '@/lib/assessment-config'
import Link from 'next/link'
import { Lock } from 'lucide-react'
import JlptReadingClient from '../JlptReadingClient'

interface SearchParams {
  level?: string
  search?: string
  passage_type?: string
  page?: string
}

const ITEMS_PER_PAGE = 10
const UNLOCK_THRESHOLD = 80

export default async function JlptReadingPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const search = params.search ?? ''
  const passageType = params.passage_type ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()

  let defaultLevel: JlptLevel = 'N5'
  if (!params.level && user) {
    const { data: exam } = await supabase.from('comprehensive_exams').select('score')
      .eq('user_id', user.id).eq('category', 'seikatsu')
      .in('status', ['completed', 'failed']).not('completed_at', 'is', null)
      .order('completed_at', { ascending: false }).limit(1).maybeSingle()
    if (exam?.score != null) defaultLevel = getJlptLevel(exam.score)
  }
  const level = (['N5', 'N4', 'N3', 'N2', 'N1'].includes(params.level ?? '') ? params.level : defaultLevel) as JlptLevel

  const { data: profile } = user ? await supabase.from('profiles').select('role').eq('id', user.id).single() : { data: null }
  const bypassLock = profile?.role === 'admin' || profile?.role === 'mentor'

  let query = supabase
    .from('jlpt_reading_passages')
    .select('*', { count: 'exact' })
    .eq('jlpt_level', level)
    .order('sort_order', { ascending: true })

  if (search) {
    query = query.or(`title.ilike.%${search}%,passage.ilike.%${search}%`)
  }
  if (passageType) {
    query = query.eq('passage_type', passageType)
  }

  query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

  // All queries in parallel
  const [{ data: items, count }, masteredIds, { data: typeData }, { count: totalInLevel }] = await Promise.all([
    query,
    getMasteredIds('jlpt_reading'),
    supabase.from('jlpt_reading_passages').select('passage_type').eq('jlpt_level', level),
    supabase.from('jlpt_reading_passages').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
  ])
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)
  const typeOptions = [...new Set(typeData?.map(t => t.passage_type).filter(Boolean) ?? [])]

  const totalItems = totalInLevel ?? 0
  const masteredInLevel = masteredIds.length > 0
    ? (await supabase.from('jlpt_reading_passages').select('id').eq('jlpt_level', level).in('id', masteredIds)).data?.length ?? 0
    : 0
  const progress = totalItems > 0 ? Math.round((masteredInLevel / totalItems) * 100) : 0
  const unlocked = bypassLock || progress >= UNLOCK_THRESHOLD

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{level} 読解</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別の読解問題を読んで、読む力を鍛えましょう</p>
      </div>

      <div className="mb-6 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {masteredInLevel}/{totalItems} 習得
        </span>
      </div>

      <div className="mb-6 flex flex-wrap gap-2">
        {unlocked ? (
          <Link
            href={`/japanese/jlpt/quiz?level=${level}&type=jlpt_reading`}
            className="inline-flex items-center rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-indigo-500"
          >
            理解度テスト
          </Link>
        ) : (
          <span className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-4 py-2 text-sm text-gray-400 dark:border-gray-700 dark:text-gray-500">
            <Lock className="h-4 w-4" />
            進行率{UNLOCK_THRESHOLD}%以上で解放
          </span>
        )}
      </div>

      <div className="mb-6">
        <div className="flex items-center gap-3">
          <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
            <div
              className={`h-2 rounded-full transition-all duration-500 ${
                progress >= UNLOCK_THRESHOLD ? 'bg-indigo-500' : 'bg-gray-400 dark:bg-gray-500'
              }`}
              style={{ width: `${progress}%` }}
            />
          </div>
          <span className="text-sm text-gray-600 dark:text-gray-400">{progress}%</span>
        </div>
      </div>

      <JlptReadingClient
        items={items ?? []}
        level={level}
        totalPages={totalPages}
        currentPage={page}
        search={search}
        passageType={passageType}
        typeOptions={typeOptions as string[]}
        totalCount={count ?? 0}
        masteredIds={masteredIds}
      />
    </div>
  )
}
