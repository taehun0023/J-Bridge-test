'use client'

import { useState } from 'react'
import Link from 'next/link'
import Card from '@/components/ui/Card'

const DIFFICULTY_LABELS: Record<string, string> = { easy: '初級', medium: '中級', hard: '上級' }
const DIFFICULTY_COLORS: Record<string, string> = {
  easy: 'bg-green-100 text-green-700 dark:bg-green-900/40 dark:text-green-300',
  medium: 'bg-amber-100 text-amber-700 dark:bg-amber-900/40 dark:text-amber-300',
  hard: 'bg-red-100 text-red-700 dark:bg-red-900/40 dark:text-red-300',
}

interface Option {
  id: string
  option_text: string
  is_correct: boolean
}

interface Question {
  id: string
  questionText: string
  difficulty: string
  explanation: string
  options: Option[]
}

type Phase = 'quiz' | 'result'

export default function CodeReadingQuiz({ questions, lang, langLabel }: {
  questions: Question[]
  lang: string
  langLabel: string
}) {
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [phase, setPhase] = useState<Phase>('quiz')

  const total = questions.length
  const answeredCount = Object.keys(answers).length
  const allAnswered = answeredCount === total

  function handleSelect(questionId: string, optionId: string) {
    if (phase === 'result') return
    setAnswers(prev => ({ ...prev, [questionId]: optionId }))
  }

  function handleSubmit() {
    if (!allAnswered) return
    setPhase('result')
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  // Result calculations
  const correctCount = questions.filter(q => {
    const selected = answers[q.id]
    return q.options.some(o => o.id === selected && o.is_correct)
  }).length
  const score = total > 0 ? Math.round((correctCount / total) * 100) : 0
  const passed = score >= 70

  if (phase === 'result') {
    return (
      <div>
        <div className="mb-6">
          <Link href={`/coding/problems?lang=${lang}`} className="text-sm text-indigo-600 hover:text-indigo-500 dark:text-indigo-400">
            ← {langLabel} に戻る
          </Link>
          <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{langLabel} コード解析 — 結果</h1>
        </div>

        {/* Summary */}
        <Card>
          <div className="flex items-center gap-3">
            <h2 className="text-xl font-bold text-gray-900 dark:text-white">結果まとめ</h2>
            <span className={`rounded-full px-3 py-1 text-sm font-bold ${
              passed
                ? 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/40 dark:text-emerald-300'
                : 'bg-red-100 text-red-700 dark:bg-red-900/40 dark:text-red-300'
            }`}>
              {passed ? '合格' : '不合格'}
            </span>
          </div>
          <div className="mt-4 grid grid-cols-3 gap-4 text-center">
            <div className="rounded-lg bg-gray-50 p-3 dark:bg-gray-800/50">
              <p className="text-xs text-gray-500">正解数</p>
              <p className="text-xl font-bold text-gray-900 dark:text-white">{correctCount}/{total}</p>
            </div>
            <div className="rounded-lg bg-gray-50 p-3 dark:bg-gray-800/50">
              <p className="text-xs text-gray-500">スコア</p>
              <p className={`text-xl font-bold ${score >= 70 ? 'text-emerald-600' : 'text-red-600'}`}>{score}点</p>
            </div>
            <div className="rounded-lg bg-gray-50 p-3 dark:bg-gray-800/50">
              <p className="text-xs text-gray-500">合格ライン</p>
              <p className="text-xl font-bold text-gray-900 dark:text-white">70点</p>
            </div>
          </div>
          <div className="mt-4 flex gap-3">
            <Link
              href={`/coding/problems?lang=${lang}&mode=reading`}
              className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500"
            >
              もう一度
            </Link>
            <Link
              href={`/coding/problems?lang=${lang}`}
              className="rounded-lg border border-gray-200 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-700 dark:text-gray-300 dark:hover:bg-gray-800"
            >
              戻る
            </Link>
          </div>
        </Card>

        {/* Review each question */}
        <div className="mt-6 space-y-4">
          {questions.map((q, qi) => {
            const selected = answers[q.id]
            const correctOpt = q.options.find(o => o.is_correct)
            const isCorrect = correctOpt?.id === selected

            return (
              <div key={q.id} className={`rounded-xl border p-4 ${
                isCorrect ? 'border-emerald-200 dark:border-emerald-800' : 'border-red-200 dark:border-red-800'
              }`}>
                <div className="flex items-center gap-2 mb-2">
                  <span className="text-sm font-bold text-gray-500">問{qi + 1}</span>
                  <span className={`inline-flex rounded-md px-2 py-0.5 text-xs font-medium ${DIFFICULTY_COLORS[q.difficulty]}`}>
                    {DIFFICULTY_LABELS[q.difficulty]}
                  </span>
                  <span className={`text-sm font-bold ${isCorrect ? 'text-emerald-600' : 'text-red-600'}`}>
                    {isCorrect ? '○' : '✕'}
                  </span>
                </div>

                {/* Code block */}
                {q.questionText.split('```').map((part, i) => {
                  if (i % 2 === 0) {
                    const text = part.trim()
                    if (!text) return null
                    return <p key={i} className="text-sm text-gray-900 dark:text-white whitespace-pre-wrap">{text}</p>
                  }
                  const [, ...codeLines] = part.split('\n')
                  return (
                    <pre key={i} className="mt-2 rounded-lg bg-gray-900 p-3 text-xs text-green-400 overflow-x-auto">
                      <code>{codeLines.join('\n').trim()}</code>
                    </pre>
                  )
                })}

                {/* Options with result highlighting */}
                <div className="mt-3 space-y-1">
                  {q.options.map(opt => {
                    let cls = 'text-gray-500 dark:text-gray-400'
                    if (opt.is_correct) cls = 'font-bold text-emerald-700 dark:text-emerald-300'
                    else if (opt.id === selected) cls = 'line-through text-red-500 dark:text-red-400'
                    return (
                      <p key={opt.id} className={`text-sm ${cls}`}>
                        {opt.is_correct ? '○ ' : opt.id === selected ? '✕ ' : '　'}{opt.option_text}
                      </p>
                    )
                  })}
                </div>

                {q.explanation && (
                  <p className="mt-2 rounded-lg bg-blue-50 p-2 text-xs text-blue-800 dark:bg-blue-900/20 dark:text-blue-300">
                    {q.explanation}
                  </p>
                )}
              </div>
            )
          })}
        </div>
      </div>
    )
  }

  // Quiz phase
  return (
    <div>
      <div className="mb-6">
        <Link href={`/coding/problems?lang=${lang}`} className="text-sm text-indigo-600 hover:text-indigo-500 dark:text-indigo-400">
          ← {langLabel} に戻る
        </Link>
        <h1 className="mt-2 text-2xl font-bold text-gray-900 dark:text-white">{langLabel} コード解析</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">コードを読んで出力結果を予測しましょう（{total}問）</p>
      </div>

      {/* Progress */}
      <div className="mb-6">
        <div className="flex items-center justify-between text-sm text-gray-500 dark:text-gray-400">
          <span>回答済み: {answeredCount}/{total}</span>
        </div>
        <div className="mt-1 h-1.5 rounded-full bg-gray-200 dark:bg-gray-700">
          <div
            className="h-1.5 rounded-full bg-indigo-500 transition-all duration-300"
            style={{ width: `${(answeredCount / total) * 100}%` }}
          />
        </div>
      </div>

      {/* All questions */}
      <div className="space-y-6">
        {questions.map((q, qi) => {
          const selected = answers[q.id]
          return (
            <div key={q.id} className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-800">
              <div className="flex items-center gap-2 mb-3">
                <span className="text-sm font-bold text-gray-500 dark:text-gray-400">問{qi + 1}</span>
                <span className={`inline-flex rounded-md px-2 py-0.5 text-xs font-medium ${DIFFICULTY_COLORS[q.difficulty]}`}>
                  {DIFFICULTY_LABELS[q.difficulty]}
                </span>
              </div>

              {/* Question with code */}
              {q.questionText.split('```').map((part, i) => {
                if (i % 2 === 0) {
                  const text = part.trim()
                  if (!text) return null
                  return <p key={i} className="text-sm text-gray-900 dark:text-white whitespace-pre-wrap">{text}</p>
                }
                const [, ...codeLines] = part.split('\n')
                return (
                  <pre key={i} className="mt-2 rounded-lg bg-gray-900 p-4 text-sm text-green-400 overflow-x-auto">
                    <code>{codeLines.join('\n').trim()}</code>
                  </pre>
                )
              })}

              {/* Options */}
              <div className="mt-4 space-y-2">
                {q.options.map(opt => (
                  <button
                    key={opt.id}
                    onClick={() => handleSelect(q.id, opt.id)}
                    className={`w-full rounded-lg border p-3 text-left text-sm transition-colors ${
                      selected === opt.id
                        ? 'border-indigo-400 bg-indigo-50 text-indigo-900 dark:border-indigo-600 dark:bg-indigo-900/20 dark:text-indigo-200'
                        : 'border-gray-200 text-gray-900 hover:border-indigo-300 dark:border-gray-600 dark:text-white dark:hover:border-indigo-600'
                    }`}
                  >
                    {opt.option_text}
                  </button>
                ))}
              </div>
            </div>
          )
        })}
      </div>

      {/* Submit button */}
      <div className="sticky bottom-4 mt-6">
        <button
          onClick={handleSubmit}
          disabled={!allAnswered}
          className="w-full rounded-xl bg-indigo-600 px-6 py-3 text-base font-semibold text-white shadow-lg transition-colors hover:bg-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          {allAnswered ? '提出する' : `${total - answeredCount}問 未回答`}
        </button>
      </div>
    </div>
  )
}
