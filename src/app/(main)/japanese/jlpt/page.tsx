import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { getMenteeHiddenSubcats } from '@/app/actions/admin/categories'

const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const

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

  // 레벨별 합계는 count(exact)로 — select('id').length 는 1,000행 제한에 걸려 어휘처럼 큰 영역이 잘림.
  const TABLES = [
    { table: 'jlpt_vocabulary', type: 'jlpt_vocabulary' },
    { table: 'jlpt_kanji', type: 'jlpt_kanji' },
    { table: 'jlpt_grammar', type: 'jlpt_grammar' },
    { table: 'jlpt_reading_passages', type: 'jlpt_reading' },
    { table: 'jlpt_listening_scripts', type: 'jlpt_listening' },
  ] as const

  const masteredResult = await supabase.from('user_mastered_items').select('item_type, item_id')
    .eq('user_id', user.id)
    .in('item_type', ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji'])

  const totalByLevel: Record<string, number> = {}
  const masteredByLevel: Record<string, number> = {}
  for (const lvl of JLPT_LEVELS) { totalByLevel[lvl] = 0; masteredByLevel[lvl] = 0 }

  // 1) 영역×레벨 전체 개수(정확)
  const totalCounts = await Promise.all(
    TABLES.flatMap(t => JLPT_LEVELS.map(async lvl => {
      const { count } = await supabase.from(t.table).select('id', { count: 'exact', head: true }).eq('jlpt_level', lvl)
      return { lvl, n: count ?? 0 }
    }))
  )
  for (const r of totalCounts) totalByLevel[r.lvl] += r.n

  // 2) 마스터한 항목을 레벨별로 집계 (사용자 마스터 목록 → 각 id의 레벨 조회)
  const masteredByType = new Map<string, string[]>()
  for (const m of masteredResult.data ?? []) {
    if (!masteredByType.has(m.item_type)) masteredByType.set(m.item_type, [])
    masteredByType.get(m.item_type)!.push(m.item_id)
  }
  await Promise.all(TABLES.map(async t => {
    const ids = masteredByType.get(t.type) ?? []
    for (let i = 0; i < ids.length; i += 150) {
      const { data } = await supabase.from(t.table).select('jlpt_level').in('id', ids.slice(i, i + 150))
      for (const r of data ?? []) if (r.jlpt_level) masteredByLevel[r.jlpt_level] = (masteredByLevel[r.jlpt_level] ?? 0) + 1
    }
  }))

  // Calculate overall progress per level
  const levelData = JLPT_LEVELS.map(level => {
    const total = totalByLevel[level] ?? 0
    const mastered = masteredByLevel[level] ?? 0
    const pct = total > 0 ? Math.round((mastered / total) * 100) : 0

    return { level, mastered, total, pct }
  })
  const hidden = await getMenteeHiddenSubcats()
  const visibleLevels = levelData.filter(l => !hidden.has(`/japanese/jlpt/${l.level.toLowerCase()}`))

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
      </div>

      {/* Level cards */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {visibleLevels.map(({ level, mastered, total, pct }) => {
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
