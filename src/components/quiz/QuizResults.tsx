import Badge from '@/components/ui/Badge'

interface QuizResultsProps {
  score: number
  passed: boolean
  correctCount: number
  totalCount: number
  quizTitle: string
  onRetry: () => void
  onBack: () => void
}

export default function QuizResults({
  score,
  passed,
  correctCount,
  totalCount,
  quizTitle,
  onRetry,
  onBack,
}: QuizResultsProps) {
  return (
    <div className="mx-auto max-w-lg text-center">
      <div className={`rounded-2xl p-8 ${passed ? 'bg-green-50' : 'bg-red-50'}`}>
        <div className="text-5xl">{passed ? '🎉' : '📝'}</div>
        <h2 className="mt-4 text-2xl font-bold text-gray-900">
          {passed ? '합격!' : '아쉽습니다'}
        </h2>
        <p className="mt-2 text-gray-600">{quizTitle}</p>

        <div className="mt-6">
          <div className="text-4xl font-bold text-gray-900">{score}점</div>
          <p className="mt-1 text-sm text-gray-500">
            {totalCount}문제 중 {correctCount}문제 정답
          </p>
        </div>

        <div className="mt-4">
          <Badge
            label={passed ? '합격' : '불합격'}
            variant="default"
          />
        </div>
      </div>

      <div className="mt-6 flex gap-3">
        <button
          onClick={onBack}
          className="flex-1 rounded-xl border border-gray-300 py-3 text-sm font-semibold text-gray-700 hover:bg-gray-50"
        >
          퀴즈 목록
        </button>
        <button
          onClick={onRetry}
          className="flex-1 rounded-xl bg-blue-600 py-3 text-sm font-semibold text-white hover:bg-blue-700"
        >
          다시 풀기
        </button>
      </div>
    </div>
  )
}
