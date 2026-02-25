import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import JlptTestBlock from '@/components/japanese/JlptTestBlock'

const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const

export default async function JlptHubPage() {
  const config = categoryChildren['seikatsu']
  if (!config) return null

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // Fetch mastered counts per level for vocabulary, grammar, kanji, reading, listening
  const { data: masteredItems } = await supabase
    .from('user_mastered_items')
    .select('item_type, item_id')
    .eq('user_id', user.id)
    .in('item_type', ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_kanji', 'jlpt_reading', 'jlpt_listening'])

  // Fetch total counts per level
  const levelProgress: Record<string, { vocabMastered: number; vocabTotal: number; grammarMastered: number; grammarTotal: number; kanjiMastered: number; kanjiTotal: number; readingMastered: number; readingTotal: number; listeningMastered: number; listeningTotal: number }> = {}

  for (const level of JLPT_LEVELS) {
    const [vocabCount, grammarCount, kanjiCount, readingCount, listeningCount] = await Promise.all([
      supabase.from('jlpt_vocabulary').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
      supabase.from('jlpt_grammar').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
      supabase.from('jlpt_kanji').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
      supabase.from('jlpt_reading_passages').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
      supabase.from('jlpt_listening_scripts').select('id', { count: 'exact', head: true }).eq('jlpt_level', level),
    ])

    // Get IDs for this level to cross-reference with mastered items
    const [vocabIds, grammarIds, kanjiIds, readingIds, listeningIds] = await Promise.all([
      supabase.from('jlpt_vocabulary').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_grammar').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_kanji').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_reading_passages').select('id').eq('jlpt_level', level),
      supabase.from('jlpt_listening_scripts').select('id').eq('jlpt_level', level),
    ])

    const vocabIdSet = new Set(vocabIds.data?.map(v => v.id) ?? [])
    const grammarIdSet = new Set(grammarIds.data?.map(g => g.id) ?? [])
    const kanjiIdSet = new Set(kanjiIds.data?.map(k => k.id) ?? [])
    const readingIdSet = new Set(readingIds.data?.map(r => r.id) ?? [])
    const listeningIdSet = new Set(listeningIds.data?.map(l => l.id) ?? [])

    const vocabMastered = masteredItems?.filter(m => m.item_type === 'jlpt_vocabulary' && vocabIdSet.has(m.item_id)).length ?? 0
    const grammarMastered = masteredItems?.filter(m => m.item_type === 'jlpt_grammar' && grammarIdSet.has(m.item_id)).length ?? 0
    const kanjiMastered = masteredItems?.filter(m => m.item_type === 'jlpt_kanji' && kanjiIdSet.has(m.item_id)).length ?? 0
    const readingMastered = masteredItems?.filter(m => m.item_type === 'jlpt_reading' && readingIdSet.has(m.item_id)).length ?? 0
    const listeningMastered = masteredItems?.filter(m => m.item_type === 'jlpt_listening' && listeningIdSet.has(m.item_id)).length ?? 0

    levelProgress[level] = {
      vocabMastered,
      vocabTotal: vocabCount.count ?? 0,
      grammarMastered,
      grammarTotal: grammarCount.count ?? 0,
      kanjiMastered,
      kanjiTotal: kanjiCount.count ?? 0,
      readingMastered,
      readingTotal: readingCount.count ?? 0,
      listeningMastered,
      listeningTotal: listeningCount.count ?? 0,
    }
  }

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
      </div>

      {/* Guide card */}
      <Card className="mb-6 border-blue-200 bg-blue-50/50 dark:border-blue-800 dark:bg-blue-900/20">
        <h2 className="text-base font-semibold text-blue-900 dark:text-blue-200">学習の進め方</h2>
        <ol className="mt-2 list-inside list-decimal space-y-1 text-sm text-blue-800 dark:text-blue-300">
          <li>各レベルの語彙・文法・漢字・読解・聴解を学習し「✓」でチェックしてください</li>
          <li>進行率80%以上で理解度テストが解放されます</li>
          <li>テストに合格して次のレベルへ進みましょう</li>
        </ol>
      </Card>

      {/* Category cards */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {config.children.map((child) => (
          <Link key={child.href} href={child.href}>
            <Card className="h-full transition-shadow hover:shadow-md">
              <h3 className="font-semibold text-gray-900 dark:text-white">{child.label}</h3>
              <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{child.description}</p>
            </Card>
          </Link>
        ))}
      </div>

      {/* Test block — moved to bottom */}
      <div className="mt-6">
        <JlptTestBlock levelProgress={levelProgress} />
      </div>
    </div>
  )
}
