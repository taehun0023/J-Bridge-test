import { createClient } from '@/lib/supabase/server'
import { redirect, notFound } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import JlptBackLink from '@/components/japanese/JlptBackLink'
import { getMasteredLevelIds } from '@/lib/jlpt-mastery'

const VALID_LEVELS = ['n5', 'n4', 'n3', 'n2', 'n1'] as const
const THRESHOLD = 80

const CATEGORIES = [
  { key: 'vocabulary', label: '語彙', description: 'JLPT 頻出語彙を学習します', itemType: 'jlpt_vocabulary', table: 'jlpt_vocabulary' as const, quizType: 'jlpt_vocab' },
  { key: 'grammar', label: '文法', description: 'JLPT 文法項目を整理します', itemType: 'jlpt_grammar', table: 'jlpt_grammar' as const, quizType: 'jlpt_grammar' },
  { key: 'reading', label: '読解', description: '読解問題の読み方を練習します', itemType: 'jlpt_reading', table: 'jlpt_reading_passages' as const, quizType: 'jlpt_reading' },
  { key: 'listening', label: '聴解', description: '音声を聞いて内容を理解します', itemType: 'jlpt_listening', table: 'jlpt_listening_scripts' as const, quizType: 'jlpt_listening' },
  { key: 'kanji', label: '漢字', description: 'JLPT 頻出漢字を学習します', itemType: 'jlpt_kanji', table: 'jlpt_kanji' as const, quizType: 'jlpt_kanji' },
] as const

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

export default async function JlptLevelPage({ params }: { params: Promise<{ level: string }> }) {
  const { level: levelParam } = await params
  if (!VALID_LEVELS.includes(levelParam as typeof VALID_LEVELS[number])) notFound()

  const displayLevel = levelParam.toUpperCase() // N5, N4, etc.

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // 정확한 개수(count: exact)로 집계 — select('id').length 는 1,000행 제한에 걸려 어휘처럼 큰 영역이 잘림.
  const TABLES: Record<string, 'jlpt_vocabulary' | 'jlpt_grammar' | 'jlpt_reading_passages' | 'jlpt_listening_scripts' | 'jlpt_kanji'> = {
    jlpt_vocabulary: 'jlpt_vocabulary',
    jlpt_grammar: 'jlpt_grammar',
    jlpt_reading: 'jlpt_reading_passages',
    jlpt_listening: 'jlpt_listening_scripts',
    jlpt_kanji: 'jlpt_kanji',
  }
  const [vC, gC, rC, lC, kC, masteredResult] = await Promise.all([
    supabase.from('jlpt_vocabulary').select('id', { count: 'exact', head: true }).eq('jlpt_level', displayLevel),
    supabase.from('jlpt_grammar').select('id', { count: 'exact', head: true }).eq('jlpt_level', displayLevel),
    supabase.from('jlpt_reading_passages').select('id', { count: 'exact', head: true }).eq('jlpt_level', displayLevel),
    supabase.from('jlpt_listening_scripts').select('id', { count: 'exact', head: true }).eq('jlpt_level', displayLevel),
    supabase.from('jlpt_kanji').select('id', { count: 'exact', head: true }).eq('jlpt_level', displayLevel),
    supabase.from('user_mastered_items').select('item_type, item_id').eq('user_id', user.id)
      .in('item_type', ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji']),
  ])

  const masteredByType: Record<string, string[]> = { jlpt_vocabulary: [], jlpt_grammar: [], jlpt_reading: [], jlpt_listening: [], jlpt_kanji: [] }
  for (const m of masteredResult.data ?? []) masteredByType[m.item_type]?.push(m.item_id as string)

  async function masteredInLevel(itemType: string): Promise<number> {
    return (await getMasteredLevelIds(supabase, TABLES[itemType], displayLevel, masteredByType[itemType] ?? [])).length
  }
  const [vM, gM, rM, lM, kM] = await Promise.all([
    masteredInLevel('jlpt_vocabulary'), masteredInLevel('jlpt_grammar'), masteredInLevel('jlpt_reading'),
    masteredInLevel('jlpt_listening'), masteredInLevel('jlpt_kanji'),
  ])

  const itemData: Record<string, { total: number; mastered: number }> = {
    jlpt_vocabulary: { total: vC.count ?? 0, mastered: vM },
    jlpt_grammar: { total: gC.count ?? 0, mastered: gM },
    jlpt_reading: { total: rC.count ?? 0, mastered: rM },
    jlpt_listening: { total: lC.count ?? 0, mastered: lM },
    jlpt_kanji: { total: kC.count ?? 0, mastered: kM },
  }

  const barColor = LEVEL_BAR_COLORS[displayLevel] ?? 'bg-indigo-500'

  return (
    <div>
      <JlptBackLink href="/japanese/jlpt" label="レベル選択へ戻る" />
      <div className="mb-6 flex items-start justify-between gap-4">
        <div>
          <h1 className={`text-2xl font-bold ${LEVEL_COLORS[displayLevel]}`}>{displayLevel}</h1>
        </div>
        <Link
          href={`/japanese/jlpt/quiz?level=${displayLevel}`}
          className="inline-flex shrink-0 items-center rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white transition-colors hover:bg-indigo-500"
        >
          模擬試験
        </Link>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {CATEGORIES.map(cat => {
          const data = itemData[cat.itemType]
          const pct = data.total > 0 ? Math.round((data.mastered / data.total) * 100) : 0

          return (
            <Link key={cat.key} href={`/japanese/jlpt/${cat.key}?level=${displayLevel}`}>
              <Card className="h-full transition-shadow hover:shadow-md">
                <h3 className="font-semibold text-gray-900 dark:text-white">{cat.label}</h3>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{cat.description}</p>
                <div className="mt-3">
                  <div className="flex items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                    <span>{data.mastered}/{data.total}</span>
                    <span className={`font-semibold tabular-nums ${
                      pct >= THRESHOLD ? 'text-emerald-600 dark:text-emerald-400' : ''
                    }`}>{pct}%</span>
                  </div>
                  <div className="mt-1 h-1.5 rounded-full bg-gray-200 dark:bg-gray-700">
                    <div
                      className={`h-1.5 rounded-full transition-all duration-500 ${
                        pct >= THRESHOLD ? barColor : 'bg-gray-300 dark:bg-gray-600'
                      }`}
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
