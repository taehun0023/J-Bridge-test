import CategoryHubPage from '@/components/ui/CategoryHubPage'
import { BookOpen, FileText, CheckCircle2 } from 'lucide-react'

export default function BusinessLiteracyHubPage() {
  return (
    <>
      <div className="mx-auto mb-6 max-w-4xl rounded-xl border border-blue-200 bg-blue-50 p-5 dark:border-blue-800 dark:bg-blue-900/20">
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
      </div>
      <CategoryHubPage categoryKey="business-lit" />
    </>
  )
}
