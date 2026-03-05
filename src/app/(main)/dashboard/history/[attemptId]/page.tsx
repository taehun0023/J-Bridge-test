import { getQuizAttemptReview, getCompExamReview, getMentorQuizAttemptReview, getMentorCompExamReview } from '@/app/actions/review'
import Link from 'next/link'
import ReviewClient from './ReviewClient'

export default async function ReviewPage({
  params,
  searchParams,
}: {
  params: Promise<{ attemptId: string }>
  searchParams: Promise<{ type?: string; role?: string }>
}) {
  const { attemptId } = await params
  const { type, role } = await searchParams
  const isMentor = role === 'mentor'

  let result
  if (type === 'comprehensive') {
    result = isMentor
      ? await getMentorCompExamReview(attemptId)
      : await getCompExamReview(attemptId)
  } else {
    result = isMentor
      ? await getMentorQuizAttemptReview(attemptId)
      : await getQuizAttemptReview(attemptId)
  }

  const backHref = isMentor ? '/admin/reports' : '/dashboard/history'

  if (result.error || !result.data) {
    return (
      <div className="mx-auto max-w-2xl py-12 text-center">
        <div className="rounded-xl border border-red-500/20 bg-red-500/5 p-8">
          <p className="text-lg font-medium text-red-500">{result.error ?? 'データが見つかりません'}</p>
          <Link
            href={backHref}
            className="mt-4 inline-block rounded-lg bg-gray-100 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600 transition-colors"
          >
            戻る
          </Link>
        </div>
      </div>
    )
  }

  return (
    <div>
      <div className="mb-6">
        <Link
          href={backHref}
          className="text-sm text-indigo-500 hover:text-indigo-400 transition-colors"
        >
          ← {isMentor ? '取弱点レポートへ戻る' : 'テスト履歴へ戻る'}
        </Link>
        <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">結果レビュー</h1>
      </div>
      <ReviewClient
        questions={result.data.questions}
        title={result.data.title}
        score={result.data.score}
        completedAt={result.data.completedAt}
      />
    </div>
  )
}
