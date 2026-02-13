'use client'

import { useState } from 'react'

interface QuizQuestion {
  id: string
  question: string
  reading?: string
  options: { label: string; correct: boolean }[]
}

interface RangeQuizModalProps {
  totalCount: number
  onClose: () => void
  fetchQuestions: (start: number, end: number, count: number) => Promise<{ questions?: QuizQuestion[]; error?: string }>
}

type Stage = 'setup' | 'loading' | 'quiz' | 'result'

export default function RangeQuizModal({ totalCount, onClose, fetchQuestions }: RangeQuizModalProps) {
  const [stage, setStage] = useState<Stage>('setup')
  const [rangeStart, setRangeStart] = useState(1)
  const [rangeEnd, setRangeEnd] = useState(Math.min(30, totalCount))
  const [questionCount, setQuestionCount] = useState(10)
  const [questions, setQuestions] = useState<QuizQuestion[]>([])
  const [currentQ, setCurrentQ] = useState(0)
  const [selectedIdx, setSelectedIdx] = useState<number | null>(null)
  const [showAnswer, setShowAnswer] = useState(false)
  const [correctCount, setCorrectCount] = useState(0)
  const [error, setError] = useState('')

  async function handleStart() {
    if (rangeStart < 1 || rangeEnd > totalCount || rangeStart > rangeEnd) {
      setError('範囲が正しくありません')
      return
    }
    setStage('loading')
    setError('')
    const result = await fetchQuestions(rangeStart, rangeEnd, questionCount)
    if (result.error || !result.questions || result.questions.length === 0) {
      setError(result.error ?? 'クイズの生成に失敗しました')
      setStage('setup')
      return
    }
    setQuestions(result.questions)
    setCurrentQ(0)
    setCorrectCount(0)
    setSelectedIdx(null)
    setShowAnswer(false)
    setStage('quiz')
  }

  function handleSelect(idx: number) {
    if (showAnswer) return
    setSelectedIdx(idx)
    setShowAnswer(true)
    if (questions[currentQ].options[idx].correct) {
      setCorrectCount(c => c + 1)
    }
  }

  function handleNext() {
    if (currentQ < questions.length - 1) {
      setCurrentQ(q => q + 1)
      setSelectedIdx(null)
      setShowAnswer(false)
    } else {
      setStage('result')
    }
  }

  function handleRetry() {
    setStage('setup')
    setQuestions([])
    setCurrentQ(0)
    setCorrectCount(0)
    setSelectedIdx(null)
    setShowAnswer(false)
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4" onClick={onClose}>
      <div className="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl dark:bg-gray-800" onClick={e => e.stopPropagation()}>
        {stage === 'setup' && (
          <>
            <h3 className="text-lg font-bold text-gray-900 dark:text-white">範囲クイズ</h3>
            <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">日本語→韓国語 4択クイズ</p>

            <div className="mt-4 space-y-3">
              <div className="flex items-center gap-2">
                <label className="w-20 text-sm font-medium text-gray-700 dark:text-gray-300">開始番号</label>
                <input
                  type="number"
                  min={1}
                  max={totalCount}
                  value={rangeStart}
                  onChange={e => setRangeStart(Number(e.target.value))}
                  className="w-24 rounded-lg border border-gray-300 px-3 py-2 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                />
              </div>
              <div className="flex items-center gap-2">
                <label className="w-20 text-sm font-medium text-gray-700 dark:text-gray-300">終了番号</label>
                <input
                  type="number"
                  min={1}
                  max={totalCount}
                  value={rangeEnd}
                  onChange={e => setRangeEnd(Number(e.target.value))}
                  className="w-24 rounded-lg border border-gray-300 px-3 py-2 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                />
                <span className="text-xs text-gray-400">/ {totalCount}</span>
              </div>
              <div className="flex items-center gap-2">
                <label className="w-20 text-sm font-medium text-gray-700 dark:text-gray-300">問題数</label>
                <select
                  value={questionCount}
                  onChange={e => setQuestionCount(Number(e.target.value))}
                  className="rounded-lg border border-gray-300 px-3 py-2 text-sm dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                >
                  <option value={5}>5問</option>
                  <option value={10}>10問</option>
                  <option value={15}>15問</option>
                  <option value={20}>20問</option>
                </select>
              </div>
            </div>

            {error && <p className="mt-2 text-sm text-red-600 dark:text-red-400">{error}</p>}

            <div className="mt-5 flex justify-end gap-2">
              <button
                onClick={onClose}
                className="rounded-lg px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700"
              >
                キャンセル
              </button>
              <button
                onClick={handleStart}
                className="rounded-lg bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700"
              >
                開始
              </button>
            </div>
          </>
        )}

        {stage === 'loading' && (
          <div className="flex flex-col items-center py-12">
            <svg className="h-8 w-8 animate-spin text-green-600" viewBox="0 0 24 24" fill="none">
              <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
              <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
            </svg>
            <p className="mt-3 text-sm text-gray-500 dark:text-gray-400">問題を生成中...</p>
          </div>
        )}

        {stage === 'quiz' && questions[currentQ] && (
          <>
            <div className="flex items-center justify-between">
              <span className="text-sm font-medium text-gray-500 dark:text-gray-400">
                {currentQ + 1} / {questions.length}
              </span>
              <span className="text-sm text-green-600 dark:text-green-400">
                正解: {correctCount}
              </span>
            </div>

            <div className="mt-4 text-center">
              <p className="text-3xl font-bold text-gray-900 dark:text-white">{questions[currentQ].question}</p>
              {questions[currentQ].reading && (
                <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{questions[currentQ].reading}</p>
              )}
            </div>

            <div className="mt-6 space-y-2">
              {questions[currentQ].options.map((opt, idx) => {
                let btnClass = 'w-full rounded-lg border px-4 py-3 text-left text-sm font-medium transition-colors '
                if (!showAnswer) {
                  btnClass += 'border-gray-200 text-gray-900 hover:bg-gray-50 dark:border-gray-600 dark:text-white dark:hover:bg-gray-700'
                } else if (opt.correct) {
                  btnClass += 'border-green-500 bg-green-50 text-green-700 dark:border-green-400 dark:bg-green-900/30 dark:text-green-300'
                } else if (idx === selectedIdx) {
                  btnClass += 'border-red-500 bg-red-50 text-red-700 dark:border-red-400 dark:bg-red-900/30 dark:text-red-300'
                } else {
                  btnClass += 'border-gray-200 text-gray-400 dark:border-gray-600 dark:text-gray-500'
                }

                return (
                  <button key={idx} onClick={() => handleSelect(idx)} className={btnClass}>
                    {opt.label}
                  </button>
                )
              })}
            </div>

            {showAnswer && (
              <div className="mt-4 flex justify-end">
                <button
                  onClick={handleNext}
                  className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
                >
                  {currentQ < questions.length - 1 ? '次へ' : '結果を見る'}
                </button>
              </div>
            )}
          </>
        )}

        {stage === 'result' && (
          <div className="text-center">
            <div className="text-5xl font-bold text-gray-900 dark:text-white">
              {correctCount} / {questions.length}
            </div>
            <p className="mt-2 text-lg text-gray-500 dark:text-gray-400">
              正答率 {Math.round((correctCount / questions.length) * 100)}%
            </p>
            <div className="mt-2">
              {correctCount === questions.length ? (
                <span className="text-green-600 dark:text-green-400">完璧です！</span>
              ) : correctCount >= questions.length * 0.8 ? (
                <span className="text-blue-600 dark:text-blue-400">よくできました！</span>
              ) : (
                <span className="text-amber-600 dark:text-amber-400">もう少し頑張りましょう！</span>
              )}
            </div>

            <div className="mt-6 flex justify-center gap-3">
              <button
                onClick={handleRetry}
                className="rounded-lg bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700"
              >
                もう一回
              </button>
              <button
                onClick={onClose}
                className="rounded-lg px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700"
              >
                閉じる
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
