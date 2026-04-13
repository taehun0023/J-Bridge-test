import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import GuideCard from '@/components/japanese/JlptGuideCard'

const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const
const KANJI_CAP = 100

const LEVEL_COLORS: Record<string, string> = {
  N5: 'text-gray-700 dark:text-gray-300',
  N4: 'text-green-700 dark:text-green-300',
  N3: 'text-blue-700 dark:text-blue-300',
  N2: 'text-purple-700 dark:text-purple-300',
  N1: 'text-amber-700 dark:text-amber-300',
}

const LEVEL_BAR_COLORS: Record<string, string> = {
  N5: 'bg-gray-500',
  N4: 'bg-green-500',
  N3: 'bg-blue-500',
  N2: 'bg-purple-500',
  N1: 'bg-amber-500',
}

export default async function JlptHubPage() {
  const config = categoryChildren['seikatsu']
  if (!config) return null

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // Parallel batch: vocabulary (paginated) + kanji (paginated) + 3 content tables + mastered items
  const [vocabBatch1, vocabBatch2, kanjiBatch1, kanjiBatch2, grammarAll, readingAll, listeningAll, masteredResult] = await Promise.all([
    supabase.from('jlpt_vocabulary').select('id, jlpt_level').range(0, 999),
    supabase.from('jlpt_vocabulary').select('id, jlpt_level').range(1000, 1999),
    supabase.from('jlpt_kanji').select('id, jlpt_level').range(0, 999),
    supabase.from('jlpt_kanji').select('id, jlpt_level').range(1000, 1999),
    supabase.from('jlpt_grammar').select('id, jlpt_level'),
    supabase.from('jlpt_reading_passages').select('id, jlpt_level'),
    supabase.from('jlpt_listening_scripts').select('id, jlpt_level'),
    supabase.from('user_mastered_items').select('item_type, item_id')
      .eq('user_id', user.id)
      .in('item_type', ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji']),
  ])

  const vocabAllData = [...(vocabBatch1.data ?? []), ...(vocabBatch2.data ?? [])]
  const kanjiAllData = [...(kanjiBatch1.data ?? []), ...(kanjiBatch2.data ?? [])]
  const masteredSet = new Set(masteredResult.data?.map(m => `${m.item_type}:${m.item_id}`) ?? [])

  // Calculate overall progress per level
  const levelData = JLPT_LEVELS.map(level => {
    const vocabIds = vocabAllData.filter(v => v.jlpt_level === level)
    const grammarIds = grammarAll.data?.filter(g => g.jlpt_level === level) ?? []
    const readingIds = readingAll.data?.filter(r => r.jlpt_level === level) ?? []
    const listeningIds = listeningAll.data?.filter(l => l.jlpt_level === level) ?? []
    const kanjiIds = kanjiAllData.filter(k => k.jlpt_level === level)

    const vocabMastered = vocabIds.filter(v => masteredSet.has(`jlpt_vocabulary:${v.id}`)).length
    const grammarMastered = grammarIds.filter(g => masteredSet.has(`jlpt_grammar:${g.id}`)).length
    const readingMastered = readingIds.filter(r => masteredSet.has(`jlpt_reading:${r.id}`)).length
    const listeningMastered = listeningIds.filter(l => masteredSet.has(`jlpt_listening:${l.id}`)).length
    const kanjiMasteredRaw = kanjiIds.filter(k => masteredSet.has(`jlpt_kanji:${k.id}`)).length

    const total = vocabIds.length + grammarIds.length + readingIds.length + listeningIds.length + Math.min(kanjiIds.length, KANJI_CAP)
    const mastered = vocabMastered + grammarMastered + readingMastered + listeningMastered + Math.min(kanjiMasteredRaw, KANJI_CAP)
    const pct = total > 0 ? Math.round((mastered / total) * 100) : 0

    return { level, mastered, total, pct }
  })

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
      </div>

      <GuideCard storageKey="jlpt-guide-dismissed">
        <ol className="mt-2 list-inside list-decimal space-y-1 text-sm text-blue-800 dark:text-blue-300">
          <li>レベルを選び、語彙・文法・読解・聴解・漢字を学習してください</li>
          <li>各カテゴリの進行率80%以上で理解度テストが解放されます</li>
          <li>テストに合格して次のレベルへ進みましょう</li>
        </ol>
      </GuideCard>

      {/* Level cards */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {levelData.map(({ level, mastered, total, pct }) => {
          const navChild = config.children.find(c => c.label === level)

          return (
            <Link key={level} href={`/japanese/jlpt/${level.toLowerCase()}`}>
              <Card className="h-full transition-shadow hover:shadow-md">
                <h3 className={`text-lg font-bold ${LEVEL_COLORS[level]}`}>{level}</h3>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
                  {navChild?.description ?? ''}
                </p>
                <div className="mt-3">
                  <div className="flex items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                    <span>{mastered}/{total}</span>
                    <span className="font-semibold tabular-nums">{pct}%</span>
                  </div>
                  <div className="mt-1 h-1.5 rounded-full bg-gray-200 dark:bg-gray-700">
                    <div
                      className={`h-1.5 rounded-full transition-all duration-500 ${LEVEL_BAR_COLORS[level]}`}
                      style={{ width: `${Math.min(pct, 100)}%` }}
                    />
                  </div>
                </div>
              </Card>
            </Link>
          )
        })}
      </div>
    </div>
  )
}
