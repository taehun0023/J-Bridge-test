'use client'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <div className="flex min-h-[50vh] flex-col items-center justify-center">
      <div className="text-center">
        <p className="text-5xl">⚠️</p>
        <h2 className="mt-4 text-xl font-bold text-gray-900 dark:text-white">エラーが発生しました</h2>
        <p className="mt-2 text-sm text-gray-500 dark:text-gray-400">
          {error.message || 'ページの読み込み中に問題が発生しました。'}
        </p>
        <button
          onClick={reset}
          className="mt-6 rounded-lg bg-blue-600 px-6 py-2.5 text-sm font-medium text-white hover:bg-blue-700"
        >
          再試行
        </button>
      </div>
    </div>
  )
}
