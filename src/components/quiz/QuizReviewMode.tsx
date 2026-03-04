'use client'

import { useState } from 'react'
import { ArrowLeft, RotateCcw } from 'lucide-react'
import { submitQuestionClaim } from '@/app/actions/claims'

interface QuestionResult {
  questionId: string
  selectedOptionId: string
  correctOptionId: string
  isCorrect: boolean
}

interface ReviewQuestion {
  id: string
  question_text: string
  explanation: string | null
  quiz_question_options_safe: { id: string; option_text: string; sort_order: number }[]
}

interface Props {
  quizTitle: string
  score: number
  correctCount: number
  totalCount: number
  passed: boolean
  questions: ReviewQuestion[]
  results: QuestionResult[]
  onRetry: () => void
  onBack: () => void
  backLabel?: string
  hideRetry?: boolean
}

export default function QuizReviewMode({
  quizTitle,
  score,
  correctCount,
  totalCount,
  passed,
  questions,
  results,
  onRetry,
  onBack,
  backLabel = 'テスト一覧',
  hideRetry,
}: Props) {
  const [expandedQuestions, setExpandedQuestions] = useState<Set<string>>(new Set())
  const [claimForms, setClaimForms] = useState<Set<string>>(new Set())
  const [claimedQuestions, setClaimedQuestions] = useState<Set<string>>(new Set())
  const [claimReasons, setClaimReasons] = useState<Record<string, string>>({})
  const [claimingId, setClaimingId] = useState<string | null>(null)

  const resultMap = new Map(results.map(r => [r.questionId, r]))

  function toggleExpanded(qId: string) {
    setExpandedQuestions(prev => {
      const next = new Set(prev)
      if (next.has(qId)) next.delete(qId)
      else next.add(qId)
      return next
    })
  }

  function toggleClaimForm(qId: string) {
    setClaimForms(prev => {
      const next = new Set(prev)
      if (next.has(qId)) next.delete(qId)
      else next.add(qId)
      return next
    })
  }

  async function handleClaim(qId: string) {
    setClaimingId(qId)
    const res = await submitQuestionClaim(qId, claimReasons[qId] || undefined)
    setClaimingId(null)
    if (res.error) {
      alert(res.error)
      return
    }
    setClaimedQuestions(prev => new Set(prev).add(qId))
    setClaimForms(prev => {
      const next = new Set(prev)
      next.delete(qId)
      return next
    })
  }

  return (
    <div className="mx-auto max-w-3xl">
      {/* Score Header */}
      <div className="mb-6">
        <p className="text-sm font-medium text-indigo-500 dark:text-indigo-400">理解度テスト — 結果レビュー</p>
        <h1 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{quizTitle}</h1>
        <div className="mt-3 flex items-center gap-4">
          <div className={`rounded-xl px-4 py-2 ${passed ? 'bg-emerald-50 border border-emerald-200 dark:bg-emerald-900/20 dark:border-emerald-800' : 'bg-red-50 border border-red-200 dark:bg-red-900/20 dark:border-red-800'}`}>
            <span className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">{score}</span>
            <span className="text-sm text-zinc-500 dark:text-zinc-400">点</span>
          </div>
          <div className="text-sm text-zinc-500 dark:text-zinc-400">
            {correctCount}/{totalCount} 正解
          </div>
          <span className={`rounded-full px-2.5 py-0.5 text-xs font-semibold ${
            passed
              ? 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400'
              : 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400'
          }`}>
            {passed ? '合格' : '不合格'}
          </span>
        </div>
      </div>

      {/* Question Review List */}
      <div className="space-y-3">
        {questions.map((q, i) => {
          const r = resultMap.get(q.id)
          const isCorrect = r?.isCorrect ?? false
          const wasAnswered = !!r
          const isExpanded = expandedQuestions.has(q.id)
          const isClaimed = claimedQuestions.has(q.id)

          return (
            <div
              key={q.id}
              className={`rounded-xl border p-4 transition-colors ${
                isCorrect
                  ? 'border-emerald-500/20 bg-emerald-500/5'
                  : wasAnswered
                  ? 'border-red-500/20 bg-red-500/5'
                  : 'border-zinc-200/60 bg-zinc-50 dark:border-white/[0.08] dark:bg-white/[0.02]'
              }`}
            >
              <button
                onClick={() => toggleExpanded(q.id)}
                className="flex w-full items-center justify-between text-left"
              >
                <div className="flex items-center gap-3">
                  <span className={`flex h-7 w-7 items-center justify-center rounded text-xs font-bold ${
                    isCorrect
                      ? 'bg-emerald-500/20 text-emerald-500'
                      : wasAnswered
                      ? 'bg-red-500/20 text-red-500'
                      : 'bg-zinc-200 text-zinc-500 dark:bg-zinc-700 dark:text-zinc-400'
                  }`}>
                    {isCorrect ? '\u2713' : wasAnswered ? '\u2717' : '-'}
                  </span>
                  <span className="text-sm font-medium text-zinc-900 dark:text-zinc-100">
                    問{i + 1}
                  </span>
                </div>
                <svg
                  className={`h-4 w-4 text-zinc-400 transition-transform ${isExpanded ? 'rotate-180' : ''}`}
                  fill="none" viewBox="0 0 24 24" stroke="currentColor"
                >
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
              </button>

              {isExpanded && (
                <div className="mt-3 border-t border-zinc-200/60 dark:border-white/[0.06] pt-3">
                  <p className="text-sm text-zinc-700 dark:text-zinc-300 whitespace-pre-line mb-3">
                    {q.question_text.replace(/\\n/g, '\n')}
                  </p>
                  <div className="space-y-2">
                    {q.quiz_question_options_safe.map(opt => {
                      const isSelected = r?.selectedOptionId === opt.id
                      const isCorrectOption = r?.correctOptionId === opt.id
                      let optionClass = 'border-zinc-200/60 bg-white dark:border-white/[0.08] dark:bg-white/[0.02]'
                      if (isCorrectOption) {
                        optionClass = 'border-emerald-500/40 bg-emerald-500/10'
                      } else if (isSelected && !isCorrect) {
                        optionClass = 'border-red-500/40 bg-red-500/10'
                      }

                      return (
                        <div
                          key={opt.id}
                          className={`rounded-lg border px-3 py-2 text-sm ${optionClass}`}
                        >
                          <div className="flex items-center gap-2">
                            {isCorrectOption && (
                              <span className="text-emerald-500 font-bold text-xs">{'\u2713'}</span>
                            )}
                            {isSelected && !isCorrect && (
                              <span className="text-red-500 font-bold text-xs">{'\u2717'}</span>
                            )}
                            <span className={`${
                              isCorrectOption
                                ? 'text-emerald-700 dark:text-emerald-300 font-medium'
                                : isSelected && !isCorrect
                                ? 'text-red-700 dark:text-red-300'
                                : 'text-zinc-600 dark:text-zinc-400'
                            }`}>
                              {opt.option_text}
                            </span>
                          </div>
                        </div>
                      )
                    })}
                  </div>

                  {/* Explanation */}
                  {q.explanation && (
                    <div className="mt-3 rounded-lg bg-blue-50 p-3 text-sm text-blue-800 dark:bg-blue-900/20 dark:text-blue-300">
                      {q.explanation}
                    </div>
                  )}

                  {/* Claim section */}
                  <div className="mt-3">
                    {isClaimed ? (
                      <div className="flex justify-end">
                        <span className="rounded-lg bg-zinc-100 px-3 py-1.5 text-xs font-medium text-zinc-400 dark:bg-zinc-800 dark:text-zinc-500">
                          クレーム送信済み
                        </span>
                      </div>
                    ) : claimForms.has(q.id) ? (
                      <div className="rounded-lg border border-amber-500/20 bg-amber-500/5 p-3">
                        <textarea
                          placeholder="クレーム理由（任意）"
                          value={claimReasons[q.id] ?? ''}
                          onChange={e => setClaimReasons(prev => ({ ...prev, [q.id]: e.target.value }))}
                          rows={2}
                          className="w-full rounded-lg border border-zinc-200 bg-white px-3 py-2 text-sm text-zinc-900 placeholder:text-zinc-400 focus:border-amber-500 focus:outline-none dark:border-zinc-700 dark:bg-zinc-800 dark:text-zinc-100"
                        />
                        <div className="mt-2 flex justify-end gap-2">
                          <button
                            onClick={() => toggleClaimForm(q.id)}
                            className="rounded-lg px-3 py-1.5 text-xs font-medium text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200"
                          >
                            キャンセル
                          </button>
                          <button
                            onClick={() => handleClaim(q.id)}
                            disabled={claimingId === q.id}
                            className="rounded-lg bg-amber-500 px-3 py-1.5 text-xs font-medium text-white hover:bg-amber-600 disabled:opacity-50"
                          >
                            {claimingId === q.id ? '送信中...' : '送信'}
                          </button>
                        </div>
                      </div>
                    ) : (
                      <div className="flex justify-end">
                        <button
                          onClick={() => toggleClaimForm(q.id)}
                          className="rounded-lg bg-amber-500/10 px-3 py-1.5 text-xs font-medium text-amber-600 hover:bg-amber-500/20 dark:text-amber-400"
                        >
                          問題にクレーム
                        </button>
                      </div>
                    )}
                  </div>
                </div>
              )}
            </div>
          )
        })}
      </div>

      {/* Footer */}
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
