'use client'

interface Option {
  id: string
  option_text: string
  sort_order: number
}

interface QuizQuestionProps {
  questionNumber: number
  totalQuestions: number
  questionText: string
  options: Option[]
  selectedOptionId: string | null
  onSelect: (optionId: string) => void
  explanation?: string | null
  showResult?: boolean
  isCorrect?: boolean
}

export default function QuizQuestion({
  questionNumber,
  totalQuestions,
  questionText,
  options,
  selectedOptionId,
  onSelect,
  showResult,
  isCorrect,
}: QuizQuestionProps) {
  function handleClick(optionId: string) {
    if (showResult) return
    // Toggle: if already selected, deselect by passing empty string
    if (selectedOptionId === optionId) {
      onSelect('')
    } else {
      onSelect(optionId)
    }
  }

  return (
    <div>
      <div className="mb-4 flex items-center justify-between">
        <span className="text-sm font-medium text-gray-500 dark:text-gray-400">
          問題 {questionNumber} / {totalQuestions}
        </span>
        {showResult !== undefined && selectedOptionId && (
          <span className={`rounded-full px-3 py-1 text-xs font-medium ${
            isCorrect ? 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300' : 'bg-red-100 text-red-800 dark:bg-red-900/30 dark:text-red-300'
          }`}>
            {isCorrect ? '正解' : '不正解'}
          </span>
        )}
      </div>

      <h3 className="text-lg font-semibold text-gray-900 dark:text-white whitespace-pre-line">{questionText}</h3>

      <div className="mt-4 space-y-2">
        {options
          .sort((a, b) => a.sort_order - b.sort_order)
          .map((option) => {
            const isSelected = selectedOptionId === option.id
            let borderClass = 'border-gray-200 hover:border-gray-300 dark:border-gray-600 dark:hover:border-gray-500'
            if (isSelected && !showResult) {
              borderClass = 'border-blue-600 bg-blue-50 dark:border-blue-400 dark:bg-blue-900/30'
            } else if (showResult && isSelected) {
              borderClass = isCorrect
                ? 'border-green-500 bg-green-50 dark:border-green-400 dark:bg-green-900/30'
                : 'border-red-500 bg-red-50 dark:border-red-400 dark:bg-red-900/30'
            }

            return (
              <button
                key={option.id}
                onClick={() => handleClick(option.id)}
                disabled={showResult === true}
                className={`flex w-full items-center gap-3 rounded-xl border-2 px-4 py-3 text-left transition-colors ${borderClass} disabled:cursor-default`}
              >
                <div className={`flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-xs font-bold ${
                  isSelected
                    ? 'bg-blue-600 text-white dark:bg-blue-500'
                    : 'bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-300'
                }`}>
                  {option.sort_order}
                </div>
                <span className="text-sm text-gray-800 dark:text-gray-200 whitespace-pre-line">{option.option_text}</span>
              </button>
            )
          })}
      </div>
    </div>
  )
}
