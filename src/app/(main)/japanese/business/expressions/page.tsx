import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
import Link from 'next/link'
import { Lock } from 'lucide-react'
import BusinessGlossaryClient from '../BusinessGlossaryClient'

interface SearchParams {
  category?: string
  search?: string
  page?: string
  mastery?: string
}

const ITEMS_PER_PAGE = 30
const UNLOCK_THRESHOLD = 80
const QUIZ_TYPE = 'business_expression'
const DB_CATEGORY = 'expression'

const CATEGORIES = [
  { key: '', label: '全て' },
  { key: 'request', label: '依頼・確認' },
  { key: 'report', label: '報告・連絡' },
  { key: 'manner', label: '挨拶・応対' },
]

export default async function ExpressionsPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const subcategory = params.category ?? ''
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  const { data: profile } = await supabase
    .from('profiles')
    .select('role, mentor_specialty')
    .eq('id', user!.id)
    .single()

  const canManage = profile?.role === 'admin' ||
    (profile?.role === 'mentor' && profile.mentor_specialty !== 'technical')
  const bypassLock = profile?.role === 'admin' || profile?.role === 'mentor'

  const masteredIds = await getMasteredIds('it_glossary')

  // Total items in this category (unfiltered, for progress)
  const { count: totalInCategory } = await supabase
    .from('it_glossary')
    .select('id', { count: 'exact', head: true })
    .eq('category', DB_CATEGORY)

  const totalItems = totalInCategory ?? 0
  const masteredInCategory = masteredIds.length > 0
    ? (await supabase.from('it_glossary').select('id').eq('category', DB_CATEGORY).in('id', masteredIds)).data?.length ?? 0
    : 0
  const progress = totalItems > 0 ? Math.round((masteredInCategory / totalItems) * 100) : 0
  const unlocked = bypassLock || progress >= UNLOCK_THRESHOLD

  let query = supabase
    .from('it_glossary')
    .select('*', { count: 'exact' })
    .eq('category', DB_CATEGORY)
    .order('created_at', { ascending: true })

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
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">表現</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">IT現場で使えるビジネス表現を学習しましょう</p>
      </div>

      <div className="mb-6 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">
          {masteredInCategory}/{totalItems} 習得
        </span>
      </div>

      <div className="mb-6 flex flex-wrap gap-2">
        {unlocked ? (
          <Link
            href={`/japanese/business/quiz/tests?type=${QUIZ_TYPE}`}
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
        canManage={canManage}
      />
    </div>
  )
}
