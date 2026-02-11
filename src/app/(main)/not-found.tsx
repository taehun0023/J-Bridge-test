import Link from 'next/link'

export default function NotFound() {
  return (
    <div className="flex min-h-[50vh] flex-col items-center justify-center">
      <div className="text-center">
        <p className="text-5xl">🔍</p>
        <h2 className="mt-4 text-xl font-bold text-gray-900 dark:text-white">ページが見つかりません</h2>
        <p className="mt-2 text-sm text-gray-500 dark:text-gray-400">
          リクエストされたページは存在しません。
        </p>
        <Link
          href="/dashboard"
          className="mt-6 inline-block rounded-lg bg-blue-600 px-6 py-2.5 text-sm font-medium text-white hover:bg-blue-700"
        >
          ダッシュボードに戻る
        </Link>
      </div>
    </div>
  )
}
