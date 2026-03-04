import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
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

export default async function JlptKanjiPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()

  let defaultLevel: JlptLevel = 'N5'
  if (!params.level) {
    const { data: { user } } = await supabase.auth.getUser()
    if (user) {
      const { data: exam } = await supabase.from('comprehensive_exams').select('score')
        .eq('user_id', user.id).eq('category', 'seikatsu')
        .in('status', ['completed', 'failed']).not('completed_at', 'is', null)
        .order('completed_at', { ascending: false }).limit(1).maybeSingle()
      if (exam?.score != null) defaultLevel = getJlptLevel(exam.score)
    }
  }
  const level = (['N5', 'N4', 'N3', 'N2', 'N1'].includes(params.level ?? '') ? params.level : defaultLevel) as JlptLevel

  const masteredIds = await getMasteredIds('jlpt_kanji')

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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">JLPT漢字学習</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別の漢字を学習しましょう</p>
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
