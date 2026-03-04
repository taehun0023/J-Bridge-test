import Badge from '@/components/ui/Badge'
import { RotateCcw, ArrowLeft } from 'lucide-react'

interface QuizResultsProps {
  score: number
  passed: boolean
  correctCount: number
  totalCount: number
  quizTitle: string
  onRetry: () => void
  onBack: () => void
  backLabel?: string
  hideRetry?: boolean
}

export default function QuizResults({
  score,
  passed,
  correctCount,
  totalCount,
  quizTitle,
  onRetry,
  onBack,
  backLabel = 'テスト一覧',
  hideRetry,
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
          className={`inline-flex items-center justify-center gap-2 rounded-xl border border-gray-300 py-3 text-sm font-semibold text-gray-700 transition-colors hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-800 ${hideRetry ? 'w-full' : 'flex-1'}`}
        >
          <ArrowLeft className="h-4 w-4" />
          {backLabel}
        </button>
        {!hideRetry && (
          <button
            onClick={onRetry}
            className="inline-flex flex-1 items-center justify-center gap-2 rounded-xl bg-blue-600 py-3 text-sm font-semibold text-white transition-colors hover:bg-blue-700"
          >
            <RotateCcw className="h-4 w-4" />
            もう一度
          </button>
        )}
      </div>
    </div>
  )
}
