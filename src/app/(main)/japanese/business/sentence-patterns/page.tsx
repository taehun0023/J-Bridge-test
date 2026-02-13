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
  { key: 'email', label: 'ビジネスメール' },
  { key: 'horenso', label: '報連相' },
  { key: 'meeting', label: '会議' },
  { key: 'document', label: 'ドキュメント' },
  { key: 'daily', label: '日常業務' },
]

export default async function SentencePatternsPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
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
    .eq('category', 'sentence_pattern')
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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">文章パターン</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">ビジネスメールや報連相の文章パターンを学習しましょう</p>
      </div>

      <BusinessGlossaryClient
        items={items ?? []}
        categories={CATEGORIES}
        activeCategory={subcategory}
        search={search}
        currentPage={page}
        totalPages={totalPages}
        totalCount={count ?? 0}
        basePath="/japanese/business/sentence-patterns"
        offset={offset}
        masteredIds={masteredIds}
        mastery={mastery}
        itemType="it_glossary"
      />
    </div>
  )
}
