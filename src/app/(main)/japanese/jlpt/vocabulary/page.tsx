import { createClient } from '@/lib/supabase/server'
import type { JlptLevel } from '@/lib/supabase/types'
import JlptVocabularyClient from '../JlptVocabularyClient'

interface SearchParams {
  level?: string
  search?: string
  pos?: string
  page?: string
}

const ITEMS_PER_PAGE = 30

export default async function JlptVocabularyPage({ searchParams }: { searchParams: Promise<SearchParams> }) {
  const params = await searchParams
  const level = (['N5', 'N4', 'N3', 'N2', 'N1'].includes(params.level ?? '') ? params.level : 'N5') as JlptLevel
  const search = params.search ?? ''
  const pos = params.pos ?? ''
  const page = Math.max(1, parseInt(params.page ?? '1'))
  const offset = (page - 1) * ITEMS_PER_PAGE

  const supabase = await createClient()

  let query = supabase
    .from('jlpt_vocabulary')
    .select('*', { count: 'exact' })
    .eq('jlpt_level', level)
    .order('created_at', { ascending: true })

  if (search) {
    query = query.or(`word.ilike.%${search}%,reading.ilike.%${search}%,meaning_ko.ilike.%${search}%`)
  }
  if (pos) {
    query = query.eq('part_of_speech', pos)
  }

  query = query.range(offset, offset + ITEMS_PER_PAGE - 1)

  const { data: items, count } = await query
  const totalPages = Math.ceil((count ?? 0) / ITEMS_PER_PAGE)

  // Get distinct part_of_speech values for filter
  const { data: posData } = await supabase
    .from('jlpt_vocabulary')
    .select('part_of_speech')
    .eq('jlpt_level', level)
    .not('part_of_speech', 'is', null)

  const partOfSpeechOptions = [...new Set(posData?.map(p => p.part_of_speech).filter(Boolean) ?? [])]

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">JLPT語彙学習</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">級別の単語を学習し、フラッシュカードで復習しましょう</p>
      </div>

      <JlptVocabularyClient
        items={items ?? []}
        level={level}
        totalPages={totalPages}
        currentPage={page}
        search={search}
        pos={pos}
        partOfSpeechOptions={partOfSpeechOptions as string[]}
        totalCount={count ?? 0}
      />
    </div>
  )
}
