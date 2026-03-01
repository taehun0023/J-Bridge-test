import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { BookOpen, FileText, CheckCircle2 } from 'lucide-react'

export default function BusinessLiteracyHubPage() {
  const config = categoryChildren['business-lit']
  if (!config) return null

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
      </div>

      {/* Guide card */}
      <Card className="mb-6 border-blue-200 bg-blue-50/50 dark:border-blue-800 dark:bg-blue-900/20">
        <h2 className="flex items-center gap-2 text-base font-semibold text-blue-900 dark:text-blue-200">
          <BookOpen className="h-5 w-5" />
          学習の進め方
        </h2>
        <ol className="mt-3 space-y-2 text-sm text-blue-800 dark:text-blue-300">
          <li className="flex items-start gap-2">
            <FileText className="mt-0.5 h-4 w-4 shrink-0" />
            <span>各カテゴリのマニュアルを読み、全項目を「読了」にしてください。</span>
          </li>
          <li className="flex items-start gap-2">
            <CheckCircle2 className="mt-0.5 h-4 w-4 shrink-0" />
            <span>全項目を読了すると、理解度テストが解放されます。</span>
          </li>
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
    </div>
  )
}
