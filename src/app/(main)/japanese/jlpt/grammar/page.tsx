import { createClient } from '@/lib/supabase/server'
import { getMasteredIds } from '@/app/actions/mastery'
import JlptBackLink from '@/components/japanese/JlptBackLink'
import MasteryProgress from '@/components/japanese/MasteryProgress'
import { getMasteredLevelIds, getLevelSeqMap } from '@/lib/jlpt-mastery'
import type { JlptLevel } from '@/lib/supabase/types'
import { getJlptLevel } from '@/lib/assessment-config'
import JlptGrammarClient from '../JlptGrammarClient'

interface SearchParams {
  level?: string
  search?: string
  category?: string
  page?: string
  start?: string
  mastery?: string
}

const ITEMS_PER_PAGE = 30

export default async function JlptGrammarPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const search = params.search ?? ''
  const category = params.category ?? ''
  const startItem = params.start ? Math.max(1, parseInt(params.start)) : 0
  const page = params.page
    ? Math.max(1, parseInt(params.page))
    : startItem > 0 ? Math.ceil(startItem / ITEMS_PER_PAGE) : 1
  const mastery = params.mastery ?? ''
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()

  const { data: { user } } = await supabase.auth.getUser()

  let defaultLevel: JlptLevel = 'N5'
  if (!params.level && user) {
    const { data: exam } = await supabase.from('comprehensive_exams').select('score')
      .eq('user_id', user.id).eq('category', 'seikatsu')
      .in('status', ['completed', 'failed']).not('completed_at', 'is', null)
      .order('completed_at', { ascending: false }).limit(1).maybeSingle()
    if (exam?.score != null) defaultLevel = getJlptLevel(exam.score)
  }
  const level = (['N5', 'N4', 'N3', 'N2', 'N1'].includes(params.level ?? '') ? params.level : defaultLevel) as JlptLevel

  // Parallel batch 1: masteredIds + distinct categories + total count
  const [masteredIds, { data: catData }, { count: totalInLevel }] = await Promise.all([
    getMasteredIds('jlpt_grammar'),
    supabase.from('jlpt_grammar').select('category')
      .eq('jlpt_level', level).not('category', 'is', null),
    supabase.from('jlpt_grammar').select('id', { count: 'exact', head: true })
      .eq('jlpt_level', level),
  ])

  const categoryOptions = [...new Set(catData?.map(c => c.category).filter(Boolean) ?? [])]

  const totalItems = totalInLevel ?? 0
  const masteredLevelIds = await getMasteredLevelIds(supabase, 'jlpt_grammar', level, masteredIds)
  const masteredInLevel = masteredLevelIds.length
  const seqMap = await getLevelSeqMap(supabase, 'jlpt_grammar', level)

  // Main query
  let query = supabase
    .from('jlpt_grammar')
    .select('*', { count: 'exact' })
    .eq('jlpt_level', level)
    .order('seq', { ascending: true })

  if (search) {
    query = query.or(`pattern.ilike.%${search}%,meaning_ko.ilike.%${search}%`)
  }
  if (category) {
    query = query.eq('category', category)
  }

  if (mastery === 'mastered' && masteredLevelIds.length > 0) {
    query = query.in('id', masteredLevelIds)
  } else if (mastery === 'mastered') {
    query = query.in('id', ['00000000-0000-0000-0000-000000000000'])
  } else if (mastery === 'unmastered' && masteredLevelIds.length > 0) {
    query = query.not('id', 'in', `(${masteredLevelIds.join(',')})`)
  }

  query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

  const { data: items, count } = await query
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)

  return (
    <div>
      <JlptBackLink href={`/japanese/jlpt/${level.toLowerCase()}`} label={`${level} 学習メニューへ戻る`} />
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{level} 文法</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別の文法パターンを学習し、フラッシュカードで復習しましょう</p>
      </div>

      <MasteryProgress mastered={masteredInLevel} total={totalItems} />

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
        seqMap={seqMap}
      />
    </div>
  )
}
