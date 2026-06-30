import { createClient } from '@/lib/supabase/server'
import type { JlptLevel } from '@/lib/supabase/types'
import { getMasteredIds } from '@/app/actions/mastery'
import { getJlptLevel } from '@/lib/assessment-config'
import JlptBackLink from '@/components/japanese/JlptBackLink'
import MasteryProgress from '@/components/japanese/MasteryProgress'
import { getMasteredLevelIds } from '@/lib/jlpt-mastery'
import JlptListeningClient from '../JlptListeningClient'

interface SearchParams {
  level?: string
  search?: string
  script_type?: string
  page?: string
  start?: string
  mastery?: string
}

const ITEMS_PER_PAGE = 10

export default async function JlptListeningPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const search = params.search ?? ''
  const scriptType = params.script_type ?? ''
  const startItem = params.start ? Math.max(1, parseInt(params.start)) : 0
  const page = params.page
    ? Math.max(1, parseInt(params.page))
    : startItem > 0 ? Math.ceil(startItem / ITEMS_PER_PAGE) : 1
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

  const mastery = params.mastery ?? ''
  const masteredIds = await getMasteredIds('jlpt_listening')
  const masteredLevelIds = await getMasteredLevelIds(supabase, 'jlpt_listening_scripts', level, masteredIds)

  let query = supabase
    .from('jlpt_listening_scripts')
    .select('*', { count: 'exact' })
    .eq('jlpt_level', level)
    .order('sort_order', { ascending: true })

  if (search) {
    query = query.or(`title.ilike.%${search}%,script.ilike.%${search}%`)
  }
  if (scriptType) {
    query = query.eq('script_type', scriptType)
  }
  if (mastery === 'mastered' && masteredLevelIds.length > 0) {
    query = query.in('id', masteredLevelIds)
  } else if (mastery === 'mastered') {
    query = query.in('id', ['00000000-0000-0000-0000-000000000000'])
  } else if (mastery === 'unmastered' && masteredLevelIds.length > 0) {
    query = query.not('id', 'in', `(${masteredLevelIds.join(',')})`)
  }

  query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

  const [{ data: items, count }, { data: typeData }, { count: totalInLevel }] = await Promise.all([
    query,
    supabase.from('jlpt_listening_scripts').select('script_type').eq('jlpt_level', level),
    supabase.from('jlpt_listening_scripts').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
  ])
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)
  const typeOptions = [...new Set(typeData?.map(t => t.script_type).filter(Boolean) ?? [])]

  const totalItems = totalInLevel ?? 0
  const masteredInLevel = masteredLevelIds.length
  return (
    <div>
      <JlptBackLink href={`/japanese/jlpt/${level.toLowerCase()}`} label={`${level} 学習メニューへ戻る`} />
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{level} 聴解</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別のスクリプトを読んで、聴く力を鍛えましょう</p>
      </div>

      <MasteryProgress mastered={masteredInLevel} total={totalItems} />

      <JlptListeningClient
        items={items ?? []}
        level={level}
        totalPages={totalPages}
        currentPage={page}
        search={search}
        scriptType={scriptType}
        typeOptions={typeOptions as string[]}
        totalCount={count ?? 0}
        masteredIds={masteredIds}
        mastery={mastery}
      />
    </div>
  )
}
