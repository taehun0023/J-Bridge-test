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

const CODE_INDICATORS = ['{', 'class ', 'function ', 'console.', 'const ', 'import ', 'public ', 'static ', 'void ', 'System.', 'return ', 'int ', 'String ']

/** Convert literal \n sequences (stored as two chars in DB) to actual newlines */
function normalizeNewlines(text: string): string {
  return text.replace(/\\n/g, '\n')
}

function splitQuestionText(text: string): { prompt: string; codeBlock: string | null } {
  const splitIndex = text.indexOf('\n\n')
  if (splitIndex === -1) return { prompt: text, codeBlock: null }

  const before = text.substring(0, splitIndex)
  const after = text.substring(splitIndex + 2)

  const hasCode = CODE_INDICATORS.some(indicator => after.includes(indicator))
  if (!hasCode) return { prompt: text, codeBlock: null }

  return { prompt: before, codeBlock: after }
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
  const { prompt: promptText, codeBlock } = splitQuestionText(normalizeNewlines(questionText))
  function handleClick(optionId: string) {
    if (showResult) return
    if (selectedOptionId === optionId) {
      onSelect('')
    } else {
      onSelect(optionId)
    }
  }

  return (
    <div>
      <div className="mb-4 flex items-center justify-between">
        <span className="text-sm font-medium text-zinc-500 dark:text-zinc-400">
          問題 {questionNumber} / {totalQuestions}
        </span>
        {showResult !== undefined && selectedOptionId && (
          <span className={`rounded-full px-3 py-1 text-xs font-medium ${
            isCorrect
              ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20 dark:bg-emerald-500/10 dark:text-emerald-400'
              : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20 dark:bg-red-500/10 dark:text-red-400'
          }`}>
            {isCorrect ? '正解' : '不正解'}
          </span>
        )}
      </div>

      <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100 whitespace-pre-line">{promptText}</h3>

      {codeBlock && (
        <pre className="mt-3 rounded-xl bg-zinc-50 border border-zinc-200 p-4 font-mono text-sm text-zinc-800 overflow-x-auto dark:bg-zinc-900 dark:border-white/[0.08] dark:text-zinc-300">
          <code>{codeBlock}</code>
        </pre>
      )}

      <div className="mt-4 space-y-2">
        {options
          .sort((a, b) => a.sort_order - b.sort_order)
          .map((option) => {
            const isSelected = selectedOptionId === option.id
            let borderClass = 'border-gray-200/60 hover:border-gray-300 dark:border-white/[0.08] dark:hover:border-white/[0.15]'
            if (isSelected && !showResult) {
              borderClass = 'border-indigo-500 bg-indigo-500/5 dark:border-indigo-500 dark:bg-indigo-500/10'
            } else if (showResult && isSelected) {
              borderClass = isCorrect
                ? 'border-emerald-500 bg-emerald-500/5 dark:border-emerald-500 dark:bg-emerald-500/10'
                : 'border-red-500 bg-red-500/5 dark:border-red-500 dark:bg-red-500/10'
            }

            return (
              <button
                key={option.id}
                onClick={() => handleClick(option.id)}
                disabled={showResult === true}
                className={`flex w-full items-center gap-3 rounded-xl border-2 px-4 py-3 text-left transition-colors backdrop-blur-md ${borderClass} disabled:cursor-default`}
              >
                <div className={`flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-xs font-bold ${
                  isSelected
                    ? 'bg-indigo-600 text-white'
                    : 'bg-white/5 text-zinc-400 dark:bg-white/5 dark:text-zinc-400 bg-zinc-100 text-zinc-600'
                }`}>
                  {option.sort_order}
                </div>
                <span className="text-sm text-zinc-800 dark:text-zinc-200 whitespace-pre-line">{normalizeNewlines(option.option_text)}</span>
              </button>
            )
          })}
      </div>
    </div>
  )
}
