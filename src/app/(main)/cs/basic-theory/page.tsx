import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
import CsGlossaryClient from '../CsGlossaryClient'

interface SearchParams {
  difficulty?: string
  search?: string
  page?: string
  mastery?: string
}

const ITEMS_PER_PAGE = 30
const CATEGORY = 'basic_theory'

export default async function BasicTheoryPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const difficulty = params.difficulty ?? 'ip'
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()
  const masteredIds = await getMasteredIds('cs_term')

  let query = supabase
    .from('cs_terms')
    .select('*', { count: 'exact' })
    .eq('category', CATEGORY)
    .eq('difficulty_level', difficulty)
    .order('sort_order', { ascending: true })

  if (search) {
    query = query.or(`term_ja.ilike.%${search}%,term_ko.ilike.%${search}%,term_en.ilike.%${search}%`)
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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">基礎理論</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">2進数、論理演算、情報理論、確率統計を学習しましょう</p>
      </div>

      <CsGlossaryClient
        items={items ?? []}
        category={CATEGORY}
        activeDifficulty={difficulty}
        search={search}
        currentPage={page}
        totalPages={totalPages}
        totalCount={count ?? 0}
        basePath="/cs/basic-theory"
        offset={offset}
        masteredIds={masteredIds}
        mastery={mastery}
        categoryLabel="基礎理論"
      />
    </div>
  )
}
