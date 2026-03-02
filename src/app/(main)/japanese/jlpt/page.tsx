import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import JlptTestBlock from '@/components/japanese/JlptTestBlock'
import GuideCard from '@/components/japanese/JlptGuideCard'

const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const

export default async function JlptHubPage() {
  const config = categoryChildren['seikatsu']
  if (!config) return null

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  // Parallel batch: profile + 4 content tables + mastered items (6 queries)
  const [prof, vocabAll, grammarAll, readingAll, listeningAll, masteredResult] = await Promise.all([
    supabase.from('profiles').select('role').eq('id', user.id).single(),
    supabase.from('jlpt_vocabulary').select('id, jlpt_level'),
    supabase.from('jlpt_grammar').select('id, jlpt_level'),
    supabase.from('jlpt_reading_passages').select('id, jlpt_level'),
    supabase.from('jlpt_listening_scripts').select('id, jlpt_level'),
    supabase.from('user_mastered_items').select('item_type, item_id')
      .eq('user_id', user.id)
      .in('item_type', ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening']),
  ])

  const bypassLock = prof.data?.role === 'admin' || prof.data?.role === 'mentor'

  // Group by level and compute progress (client-side)
  const masteredSet = new Set(masteredResult.data?.map(m => `${m.item_type}:${m.item_id}`) ?? [])

  const levelProgress: Record<string, { vocabMastered: number; vocabTotal: number; grammarMastered: number; grammarTotal: number; readingMastered: number; readingTotal: number; listeningMastered: number; listeningTotal: number }> = {}

  for (const level of JLPT_LEVELS) {
    const vocabIds = vocabAll.data?.filter(v => v.jlpt_level === level) ?? []
    const grammarIds = grammarAll.data?.filter(g => g.jlpt_level === level) ?? []
    const readingIds = readingAll.data?.filter(r => r.jlpt_level === level) ?? []
    const listeningIds = listeningAll.data?.filter(l => l.jlpt_level === level) ?? []

    levelProgress[level] = {
      vocabMastered: vocabIds.filter(v => masteredSet.has(`jlpt_vocabulary:${v.id}`)).length,
      vocabTotal: vocabIds.length,
      grammarMastered: grammarIds.filter(g => masteredSet.has(`jlpt_grammar:${g.id}`)).length,
      grammarTotal: grammarIds.length,
      readingMastered: readingIds.filter(r => masteredSet.has(`jlpt_reading:${r.id}`)).length,
      readingTotal: readingIds.length,
      listeningMastered: listeningIds.filter(l => masteredSet.has(`jlpt_listening:${l.id}`)).length,
      listeningTotal: listeningIds.length,
    }
  }

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
      </div>

      <GuideCard storageKey="jlpt-guide-dismissed">
        <ol className="mt-2 list-inside list-decimal space-y-1 text-sm text-blue-800 dark:text-blue-300">
          <li>各レベルの語彙・文法・読解・聴解を学習し「✓」でチェックしてください</li>
          <li>進行率80%以上で理解度テストが解放されます</li>
          <li>テストに合格して次のレベルへ進みましょう</li>
        </ol>
      </GuideCard>

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
        <JlptTestBlock levelProgress={levelProgress} bypassLock={bypassLock} />
      </div>
    </div>
  )
}
