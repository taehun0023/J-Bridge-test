import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'
import GlossaryLogClient from './GlossaryLogClient'

export default function GlossaryLogPage() {
  return (
    <div>
      <div className="mb-6">
        <Link
          href="/japanese/business"
          className="mb-3 inline-flex items-center gap-1 text-sm text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200 transition-colors"
        >
          <ArrowLeft className="h-4 w-4" />
          ビジネス日本語に戻る
        </Link>
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">語彙変更履歴</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">ビジネス語彙の追加・編集・削除の履歴</p>
      </div>
      <GlossaryLogClient />
    </div>
  )
}
