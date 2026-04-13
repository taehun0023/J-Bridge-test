import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
import Link from 'next/link'
import { Lock } from 'lucide-react'
import type { JlptLevel } from '@/lib/supabase/types'
import { getJlptLevel } from '@/lib/assessment-config'
import JlptKanjiClient from '../JlptKanjiClient'

interface SearchParams {
  level?: string
  search?: string
  page?: string
  mastery?: string
}

const ITEMS_PER_PAGE = 30
const UNLOCK_THRESHOLD = 80

export default async function JlptKanjiPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const mastery = params.mastery ?? ''
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

  const [masteredIds, { count: totalInLevel }] = await Promise.all([
    getMasteredIds('jlpt_kanji'),
    supabase.from('jlpt_kanji').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
  ])

  const totalItems = totalInLevel ?? 0
  const masteredInLevel = masteredIds.length > 0
    ? (await supabase.from('jlpt_kanji').select('id').eq('jlpt_level', level).in('id', masteredIds)).data?.length ?? 0
    : 0
  const progress = totalItems > 0 ? Math.round((masteredInLevel / totalItems) * 100) : 0
  const unlocked = bypassLock || progress >= UNLOCK_THRESHOLD

  let query = supabase
    .from('jlpt_kanji')
    .select('*', { count: 'exact' })
    .eq('jlpt_level', level)
    .order('sort_order', { ascending: true })

  if (search) {
    query = query.or(`kanji.ilike.%${search}%,meaning_ko.ilike.%${search}%,reading_on.ilike.%${search}%,reading_kun.ilike.%${search}%`)
  }

  if (mastery === 'mastered' && masteredIds.length > 0) {
    query = query.in('id', masteredIds)
  } else if (mastery === 'mastered' && masteredIds.length === 0) {
    query = query.in('id', ['00000000-0000-0000-0000-000000000000'])
  } else if (mastery === 'unmastered' && masteredIds.length > 0) {
    query = query.not('id', 'in', `(${masteredIds.join(',')})`)
  }

  query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

  const { data: items, count } = await query
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{level} 漢字</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別の漢字を学習しましょう</p>
      </div>

      <div className="mb-6 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {masteredInLevel}/{totalItems} 習得
        </span>
      </div>

      <div className="mb-6 flex flex-wrap gap-2">
        {unlocked ? (
          <Link
            href={`/japanese/jlpt/quiz?level=${level}&type=jlpt_kanji`}
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

      <JlptKanjiClient
        items={items ?? []}
        level={level}
        totalPages={totalPages}
        currentPage={page}
        search={search}
        totalCount={count ?? 0}
        offset={offset}
        masteredIds={masteredIds}
        mastery={mastery}
      />
    </div>
  )
}
