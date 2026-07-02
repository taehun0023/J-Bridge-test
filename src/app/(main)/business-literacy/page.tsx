import Link from 'next/link'
import Card from '@/components/ui/Card'
import GuideCard from '@/components/japanese/JlptGuideCard'
import { categoryChildren } from '@/lib/navigation'
import { getMenteeHiddenSubcats } from '@/app/actions/admin/categories'
import { BookOpen, FileText, CheckCircle2 } from 'lucide-react'

export default async function BusinessLiteracyHubPage() {
  const config = categoryChildren['business-lit']
  if (!config) return null
  const hidden = await getMenteeHiddenSubcats()
  const children = config.children.filter(c => !hidden.has(c.href))

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
      </div>

      <GuideCard storageKey="business-literacy-guide-dismissed">
        <h2 className="flex items-center gap-2 text-base font-semibold text-blue-900 dark:text-blue-200">
          <BookOpen className="h-5 w-5" />
          利用方法
        </h2>
        <ol className="mt-3 space-y-2 text-sm text-blue-800 dark:text-blue-300">
          <li className="flex items-start gap-2">
            <FileText className="mt-0.5 h-4 w-4 shrink-0" />
            <span>各カテゴリで職場マナーと業務基礎を確認し、項目ごとに内容を読み進めてください。</span>
          </li>
          <li className="flex items-start gap-2">
            <CheckCircle2 className="mt-0.5 h-4 w-4 shrink-0" />
            <span>学習が終わった項目を完了にすると進行率が上がり、理解度テストに進めます。</span>
          </li>
        </ol>
      </GuideCard>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {children.map((child) => (
          <Link key={child.href} href={child.href}>
            <Card className="h-full transition-shadow hover:shadow-md">
              <h3 className="font-semibold text-gray-900 dark:text-white">{child.label}</h3>
              <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{child.description}</p>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
