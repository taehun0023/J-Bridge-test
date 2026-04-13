import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { requireAuth } from '@/lib/auth-helpers'
import { getMasteredIds } from '@/app/actions/mastery'
import { getWritingItems } from '@/app/actions/writing'
import WritingListClient from '@/components/japanese/business/WritingListClient'

interface SearchParams {
  category?: string
  search?: string
  page?: string
  status?: string
  mastery?: string
}

const PROGRESS_CATEGORIES = ['expression', 'sentence_pattern', 'keigo']
const UNLOCK_THRESHOLD = 70

export default async function WritingPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const auth = await requireAuth()
  if ('error' in auth) redirect('/login')

  const supabase = await createClient()
  const { data: prof } = await supabase.from('profiles').select('role, mentor_specialty').eq('id', auth.user.id).single()
  const bypassLock = prof?.role === 'admin' || prof?.role === 'mentor'
  const canManage = prof?.role === 'admin' || (prof?.role === 'mentor' && prof?.mentor_specialty !== 'technical')

  const params = await searchParams
  const category = params.category ?? ''
  const search = params.search ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const status = params.status ?? ''
  const mastery = params.mastery ?? ''

  const masteredIds = await getMasteredIds('it_glossary')

  // Progress calculation (exclude user-defined 'writing' category)
  const { count: totalInCategory } = await supabase
    .from('it_glossary')
    .select('id', { count: 'exact', head: true })
    .in('category', PROGRESS_CATEGORIES)
    .not('example_sentence', 'is', null)

  const totalItems = totalInCategory ?? 0
  const masteredInCategory = masteredIds.length > 0
    ? (await supabase.from('it_glossary').select('id').in('category', PROGRESS_CATEGORIES).not('example_sentence', 'is', null).in('id', masteredIds)).data?.length ?? 0
    : 0
  const progress = totalItems > 0 ? Math.round((masteredInCategory / totalItems) * 100) : 0
  const unlocked = bypassLock || progress >= UNLOCK_THRESHOLD

  const result = await getWritingItems({
    category: category || undefined,
    search: search || undefined,
    page,
    status: status || undefined,
    mastery: mastery || undefined,
    masteredIds,
  })
  if ('error' in result) redirect('/login')

  return (
    <WritingListClient
      items={result.items}
      exerciseMap={result.exerciseMap}
      modelAnswerMap={result.modelAnswerMap ?? {}}
      activeCategory={category}
      activeStatus={status}
      activeMastery={mastery}
      search={search}
      currentPage={page}
      totalPages={result.totalPages}
      totalCount={result.totalCount}
      masteredIds={masteredIds}
      progress={progress}
      masteredCount={masteredInCategory}
      totalItemCount={totalItems}
      unlocked={unlocked}
      canManage={canManage}
    />
  )
}
