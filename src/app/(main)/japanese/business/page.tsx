import { createClient } from '@/lib/supabase/server'
import BusinessGlossaryClient from './BusinessGlossaryClient'

interface SearchParams {
  category?: string
  search?: string
  page?: string
}

const ITEMS_PER_PAGE = 30

const CATEGORIES = [
  { key: '', label: '전체' },
  { key: 'development', label: '개발' },
  { key: 'testing', label: '테스트' },
  { key: 'design_doc', label: '설계 문서' },
  { key: 'infrastructure', label: '인프라' },
  { key: 'project_management', label: '프로젝트 관리' },
  { key: 'business', label: '비즈니스' },
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
        <h1 className="text-2xl font-bold text-gray-900">IT/비즈니스 일본어</h1>
        <p className="mt-1 text-gray-500">일본 IT 현장에서 사용하는 용어와 비즈니스 표현을 학습하세요</p>
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
