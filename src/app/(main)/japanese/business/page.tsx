import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import BusinessTestBlock from '@/components/japanese/BusinessTestBlock'

// Subcategory definitions: label, DB categories to include, quiz type
const SUBCATEGORIES = [
  { key: 'glossary', label: 'ビジネス語彙', dbCategories: ['business', 'it', 'dev'], quizType: 'it_terminology' },
  { key: 'sentence_pattern', label: '文章パターン', dbCategories: ['sentence_pattern'], quizType: 'sentence_pattern' },
  { key: 'expression', label: 'ビジネス表現', dbCategories: ['expression'], quizType: 'business_expression' },
] as const

export default async function BusinessJapaneseHubPage() {
  const config = categoryChildren['business-jp']
  if (!config) return null

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

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

      return {
        label: sub.label,
        mastered,
        total,
        quizType: sub.quizType,
      }
    })
  )

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
          <li>各カテゴリの語彙・パターン・表現を学習し「✓」でチェックしてください</li>
          <li>進行率80%以上で理解度テストが解放されます</li>
          <li>テストに合格して実力を確認しましょう</li>
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

      {/* Test block */}
      <div className="mt-6">
        <BusinessTestBlock subcategories={subcategoryProgress} />
      </div>
    </div>
  )
}
