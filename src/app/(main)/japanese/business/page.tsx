import { createClient } from '@/lib/supabase/server'
import BusinessGlossaryClient from './BusinessGlossaryClient'

interface SearchParams {
  category?: string
  search?: string
  page?: string
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

export default async function BusinessJapanesePage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const category = params.category ?? ''
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()

  let query = supabase
    .from('it_glossary')
    .select('*', { count: 'exact' })
    .order('term_ja', { ascending: true })

  if (category) {
    query = query.eq('category', category)
  }
  if (search) {
    query = query.or(`term_ja.ilike.%${search}%,term_ko.ilike.%${search}%,term_en.ilike.%${search}%`)
  }

  query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

  const { data: items, count } = await query
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">IT/ビジネス日本語</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">日本のIT現場で使用する用語とビジネス表現を学習しましょう</p>
      </div>

      <BusinessGlossaryClient
        items={items ?? []}
        categories={CATEGORIES}
        activeCategory={category}
        search={search}
        currentPage={page}
        totalPages={totalPages}
        totalCount={count ?? 0}
      />
    </div>
  )
}
