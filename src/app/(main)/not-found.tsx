import Link from 'next/link'

export default function NotFound() {
  return (
    <div className="flex min-h-[50vh] flex-col items-center justify-center">
      <div className="text-center">
        <p className="text-5xl">🔍</p>
        <h2 className="mt-4 text-xl font-bold text-gray-900">페이지를 찾을 수 없습니다</h2>
        <p className="mt-2 text-sm text-gray-500">
          요청하신 페이지가 존재하지 않습니다.
        </p>
        <Link
          href="/dashboard"
          className="mt-6 inline-block rounded-lg bg-blue-600 px-6 py-2.5 text-sm font-medium text-white hover:bg-blue-700"
        >
          대시보드로 돌아가기
        </Link>
      </div>
    </div>
  )
}
