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
  { key: 'request', label: '依頼' },
  { key: 'report', label: '報告' },
  { key: 'confirm', label: '確認' },
  { key: 'apology', label: '謝罪' },
  { key: 'greeting', label: '挨拶' },
  { key: 'interview', label: '面接' },
  { key: 'phone', label: '電話' },
]

export default async function ExpressionsPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const subcategory = params.category ?? ''
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()
  const masteredIds = await getMasteredIds('it_glossary')

  let query = supabase
    .from('it_glossary')
    .select('*', { count: 'exact' })
    .eq('category', 'expression')
    .order('term_ja', { ascending: true })

  if (subcategory) {
    query = query.eq('subcategory', subcategory)
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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ビジネス表現</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">IT現場で使えるビジネス表現を学習しましょう</p>
      </div>

      <BusinessGlossaryClient
        items={items ?? []}
        categories={CATEGORIES}
        activeCategory={subcategory}
        search={search}
        currentPage={page}
        totalPages={totalPages}
        totalCount={count ?? 0}
        basePath="/japanese/business/expressions"
        offset={offset}
        masteredIds={masteredIds}
        mastery={mastery}
        itemType="it_glossary"
      />
    </div>
  )
}
