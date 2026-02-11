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
      <div className={`rounded-2xl p-8 ${passed ? 'bg-green-50 dark:bg-green-900/20' : 'bg-red-50 dark:bg-red-900/20'}`}>
        <div className="text-5xl">{passed ? '🎉' : '📝'}</div>
        <h2 className="mt-4 text-2xl font-bold text-gray-900 dark:text-white">
          {passed ? '合格！' : '残念でした'}
        </h2>
        <p className="mt-2 text-gray-600 dark:text-gray-400">{quizTitle}</p>

        <div className="mt-6">
          <div className="text-4xl font-bold text-gray-900 dark:text-white">{score}点</div>
          <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
            {totalCount}問中 {correctCount}問正解
          </p>
        </div>

        <div className="mt-4">
          <Badge
            label={passed ? '合格' : '不合格'}
            variant="default"
          />
        </div>
      </div>

      <div className="mt-6 flex gap-3">
        <button
          onClick={onBack}
          className="flex-1 rounded-xl border border-gray-300 py-3 text-sm font-semibold text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-800"
        >
          クイズ一覧
        </button>
        <button
          onClick={onRetry}
          className="flex-1 rounded-xl bg-blue-600 py-3 text-sm font-semibold text-white hover:bg-blue-700"
        >
          もう一度
        </button>
      </div>
    </div>
  )
}
