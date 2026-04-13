import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { FileClock } from 'lucide-react'
import GuideCard from '@/components/japanese/JlptGuideCard'

// Subcategory definitions: label, DB categories to include, quiz type
// label must match navigation.ts children labels
const SUBCATEGORIES = [
  { key: 'glossary', href: '/japanese/business/glossary', label: 'ビジネス用語', dbCategories: ['business', 'it', 'dev'], quizType: 'it_terminology' },
  { key: 'sentence_pattern', href: '/japanese/business/sentence-patterns', label: '文型', dbCategories: ['sentence_pattern'], quizType: 'sentence_pattern' },
  { key: 'expression', href: '/japanese/business/expressions', label: '表現', dbCategories: ['expression'], quizType: 'business_expression' },
  { key: 'keigo', href: '/japanese/business/keigo', label: '敬語', dbCategories: ['keigo'], quizType: 'keigo' },
  { key: 'writing', href: '/japanese/business/writing', label: '作文 (Beta)', dbCategories: ['expression', 'sentence_pattern', 'keigo'], quizType: 'writing' },
] as const

const THRESHOLD = 80

export default async function BusinessJapaneseHubPage() {
  const config = categoryChildren['business-jp']
  if (!config) return null

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: prof } = await supabase.from('profiles').select('role, mentor_specialty').eq('id', user.id).single()
  const canManage = prof?.role === 'admin' || (prof?.role === 'mentor' && prof?.mentor_specialty !== 'technical')

  // Fetch all mastered it_glossary items for this user
  const { data: masteredItems } = await supabase
    .from('user_mastered_items')
    .select('item_id')
    .eq('user_id', user.id)
    .eq('item_type', 'it_glossary')

  const masteredIdSet = new Set((masteredItems ?? []).map(m => m.item_id))

  // Calculate progress per subcategory
  const subcategoryProgress = await Promise.all(
    SUBCATEGORIES.map(async (sub) => {
      const { data: items } = await supabase
        .from('it_glossary')
        .select('id')
        .in('category', sub.dbCategories)

      const total = items?.length ?? 0
      const mastered = items?.filter(i => masteredIdSet.has(i.id)).length ?? 0

      return { ...sub, mastered, total }
    })
  )

  return (
    <div>
      <div className="mb-6">
        <div className="flex items-start justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
            <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
          </div>
          {canManage && (
            <Link
              href="/japanese/business/log"
              className="inline-flex shrink-0 items-center gap-1.5 rounded-lg border border-gray-200 bg-white px-3 py-1.5 text-xs font-medium text-gray-600 shadow-sm hover:bg-gray-50 hover:text-indigo-600 hover:border-indigo-200 dark:border-white/10 dark:bg-zinc-800 dark:text-gray-400 dark:hover:bg-zinc-700 dark:hover:text-indigo-400 dark:hover:border-indigo-500/30 transition-all"
            >
              <FileClock className="h-4 w-4" />
              変更履歴
            </Link>
          )}
        </div>
      </div>

      {/* Guide card */}
      <GuideCard storageKey="business-jp-guide-dismissed">
        <ol className="mt-2 list-inside list-decimal space-y-1 text-sm text-blue-800 dark:text-blue-300">
          <li>各カテゴリの語彙・パターン・表現を学習し「✓」でチェックしてください</li>
          <li>進行率{THRESHOLD}%以上で理解度テストが解放されます</li>
          <li>テストに合格して実力を確認しましょう</li>
        </ol>
      </GuideCard>

      {/* Category cards with inline progress + test button */}
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {subcategoryProgress.map((sub) => {
          const navChild = config.children.find(c => c.href === sub.href)
          const pct = sub.total > 0 ? Math.round((sub.mastered / sub.total) * 100) : 0

          return (
            <Link key={sub.key} href={sub.href}>
              <Card className="h-full transition-shadow hover:shadow-md">
                <h3 className="font-semibold text-gray-900 dark:text-white">{sub.label}</h3>
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
                  {navChild?.description ?? ''}
                </p>
                <div className="mt-3">
                  <div className="flex items-center gap-2 text-xs text-gray-500 dark:text-gray-400">
                    <span>{sub.mastered}/{sub.total}</span>
                    <span className={`font-semibold tabular-nums ${
                      pct >= THRESHOLD ? 'text-emerald-600 dark:text-emerald-400' : ''
                    }`}>{pct}%</span>
                  </div>
                  <div className="mt-1 h-1.5 rounded-full bg-gray-200 dark:bg-gray-700">
                    <div
                      className={`h-1.5 rounded-full transition-all duration-500 ${
                        pct >= THRESHOLD ? 'bg-indigo-500' : 'bg-gray-300 dark:bg-gray-600'
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
