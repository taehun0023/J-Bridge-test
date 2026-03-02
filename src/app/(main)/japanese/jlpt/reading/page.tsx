import { createClient } from '@/lib/supabase/server'
import type { JlptLevel } from '@/lib/supabase/types'
import { getMasteredIds } from '@/app/actions/mastery'
import JlptReadingClient from '../JlptReadingClient'

interface SearchParams {
  level?: string
  search?: string
  passage_type?: string
  page?: string
}

const ITEMS_PER_PAGE = 10

export default async function JlptReadingPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const level = (['N5', 'N4', 'N3', 'N2', 'N1'].includes(params.level ?? '') ? params.level : 'N5') as JlptLevel
  const search = params.search ?? ''
  const passageType = params.passage_type ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()

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

  // All 3 queries in parallel (1 RTT)
  const [{ data: items, count }, masteredIds, { data: typeData }] = await Promise.all([
    query,
    getMasteredIds('jlpt_reading'),
    supabase.from('jlpt_reading_passages').select('passage_type').eq('jlpt_level', level),
  ])
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)

  const typeOptions = [...new Set(typeData?.map(t => t.passage_type).filter(Boolean) ?? [])]

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">JLPT読解学習</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別の読解問題を読んで、読む力を鍛えましょう</p>
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
