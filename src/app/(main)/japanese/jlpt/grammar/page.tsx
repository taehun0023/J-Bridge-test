import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
import type { JlptLevel } from '@/lib/supabase/types'
import JlptGrammarClient from '../JlptGrammarClient'

interface SearchParams {
  level?: string
  search?: string
  category?: string
  page?: string
  mastery?: string
}

const ITEMS_PER_PAGE = 30

export default async function JlptGrammarPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const level = (['N5', 'N4', 'N3', 'N2', 'N1'].includes(params.level ?? '') ? params.level : 'N5') as JlptLevel
  const search = params.search ?? ''
  const category = params.category ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()

  // Parallel batch 1: masteredIds + distinct categories (independent of main query)
  const [masteredIds, { data: catData }] = await Promise.all([
    getMasteredIds('jlpt_grammar'),
    supabase.from('jlpt_grammar').select('category')
      .eq('jlpt_level', level).not('category', 'is', null),
  ])

  const categoryOptions = [...new Set(catData?.map(c => c.category).filter(Boolean) ?? [])]

  // Main query (may depend on masteredIds for mastery filter)
  let query = supabase
    .from('jlpt_grammar')
    .select('*', { count: 'exact' })
    .eq('jlpt_level', level)
    .order('sort_order', { ascending: true })

  if (search) {
    query = query.or(`pattern.ilike.%${search}%,meaning_ko.ilike.%${search}%`)
  }
  if (category) {
    query = query.eq('category', category)
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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">JLPT文法学習</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別の文法パターンを学習し、フラッシュカードで復習しましょう</p>
      </div>

      <JlptGrammarClient
        items={items ?? []}
        level={level}
        totalPages={totalPages}
        currentPage={page}
        search={search}
        category={category}
        categoryOptions={categoryOptions as string[]}
        totalCount={count ?? 0}
        offset={offset}
        masteredIds={masteredIds}
        mastery={mastery}
      />
    </div>
  )
}
