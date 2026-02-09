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
        <h2 className="mt-4 text-xl font-bold text-gray-900">오류가 발생했습니다</h2>
        <p className="mt-2 text-sm text-gray-500">
          {error.message || '페이지를 불러오는 중 문제가 발생했습니다.'}
        </p>
        <button
          onClick={reset}
          className="mt-6 rounded-lg bg-blue-600 px-6 py-2.5 text-sm font-medium text-white hover:bg-blue-700"
        >
          다시 시도
        </button>
      </div>
    </div>
  )
}
