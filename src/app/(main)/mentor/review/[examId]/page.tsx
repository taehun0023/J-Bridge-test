import { redirect } from 'next/navigation'
import Link from 'next/link'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { getMentorCompExamReview } from '@/app/actions/review'
import ReviewClient from '@/app/(main)/dashboard/history/[attemptId]/ReviewClient'

export default async function MentorReviewPage({
  params,
}: {
  params: Promise<{ examId: string }>
}) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) redirect('/dashboard')

  const { examId } = await params
  const result = await getMentorCompExamReview(examId)

  if (result.error || !result.data) {
    return (
      <div className="mx-auto max-w-2xl py-12 text-center">
        <div className="rounded-xl border border-red-500/20 bg-red-500/5 p-8">
          <p className="text-lg font-medium text-red-500">{result.error ?? 'データが見つかりません'}</p>
          <Link
            href="/mentor"
            className="mt-4 inline-block rounded-lg bg-gray-100 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600 transition-colors"
          >
            メンター管理へ戻る
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div>
      <div className="mb-6">
        <Link
          href="/mentor"
          className="text-sm text-indigo-500 hover:text-indigo-400 transition-colors"
        >
          ← メンター管理へ戻る
        </Link>
        <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">結果レビュー</h1>
      </div>
      <ReviewClient
        questions={result.data.questions}
        title={result.data.title}
        score={result.data.score}
        completedAt={result.data.completedAt}
        hideClaim
        infoMessage="メンターは試験完了後14日間レビュー可能です"
      />
    </div>
  )
}
