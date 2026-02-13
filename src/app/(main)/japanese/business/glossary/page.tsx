import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
import BusinessGlossaryClient from '../BusinessGlossaryClient'

interface SearchParams {
  category?: string
  search?: string
  page?: string
  mastery?: string
}

const ITEMS_PER_PAGE = 30

const CATEGORIES = [
  { key: '', label: '全て' },
  { key: 'development', label: '開発' },
  { key: 'testing', label: 'テスト' },
  { key: 'design_doc', label: '設計書' },
  { key: 'infrastructure', label: 'インフラ' },
  { key: 'project_management', label: 'プロジェクト管理' },
  { key: 'business', label: 'ビジネス' },
]

const ALL_GLOSSARY_CATEGORIES = ['development', 'testing', 'design_doc', 'infrastructure', 'project_management', 'business']

export default async function GlossaryPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const category = params.category ?? ''
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()
  const masteredIds = await getMasteredIds('it_glossary')

  let query = supabase
    .from('it_glossary')
    .select('*', { count: 'exact' })
    .order('term_ja', { ascending: true })

  if (category) {
    query = query.eq('category', category)
  } else {
    query = query.in('category', ALL_GLOSSARY_CATEGORIES)
  }
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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">IT語彙</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">IT現場の専門用語を学習しましょう</p>
      </div>

      <BusinessGlossaryClient
        items={items ?? []}
        categories={CATEGORIES}
        activeCategory={category}
        search={search}
        currentPage={page}
        totalPages={totalPages}
        totalCount={count ?? 0}
        basePath="/japanese/business/glossary"
        offset={offset}
        masteredIds={masteredIds}
        mastery={mastery}
        itemType="it_glossary"
      />
    </div>
  )
}
