'use client'

import { useState } from 'react'
import { submitQuestionClaim } from '@/app/actions/claims'
import type { ReviewQuestion } from '@/app/actions/review'

interface Props {
  questions: ReviewQuestion[]
  title: string
  score: number
  completedAt: string
}

export default function ReviewClient({ questions, title, score, completedAt }: Props) {
  const [expandedQuestions, setExpandedQuestions] = useState<Set<string>>(new Set())
  const [claimedQuestions, setClaimedQuestions] = useState<Set<string>>(new Set())
  const [claimingId, setClaimingId] = useState<string | null>(null)
  const [claimForms, setClaimForms] = useState<Set<string>>(new Set())
  const [claimReasons, setClaimReasons] = useState<Record<string, string>>({})
  const [claimError, setClaimError] = useState<string | null>(null)

  const correctCount = questions.filter(q => q.isCorrect).length

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
    setClaimError(null)
  }

  async function handleClaim(qId: string) {
    setClaimingId(qId)
    setClaimError(null)
    const res = await submitQuestionClaim(qId, claimReasons[qId] || undefined)
    if (res.error) {
      setClaimError(res.error)
    } else {
      setClaimedQuestions(prev => new Set(prev).add(qId))
      setClaimForms(prev => {
        const next = new Set(prev)
        next.delete(qId)
        return next
      })
    }
    setClaimingId(null)
  }

  return (
    <div className="mx-auto max-w-3xl">
      {/* Review Header */}
      <div className="mb-6">
        <h2 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{title}</h2>
        <div className="mt-3 flex items-center gap-4">
          <div className="rounded-xl bg-zinc-100 border border-gray-200 px-4 py-2 dark:bg-white/[0.03] dark:border-white/[0.08]">
            <span className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">{score}</span>
            <span className="text-sm text-zinc-500 dark:text-zinc-400">点</span>
          </div>
          <div className="text-sm text-zinc-500 dark:text-zinc-400">
            {correctCount}/{questions.length} 正解
          </div>
          <div className="text-sm text-zinc-500 dark:text-zinc-400">
            {new Date(completedAt).toLocaleDateString('ja-JP')}
          </div>
        </div>
      </div>

      {/* Question Review List */}
      <div className="space-y-3">
        {questions.map((q, i) => {
          const isExpanded = expandedQuestions.has(q.questionId)
          const isClaimed = claimedQuestions.has(q.questionId)

          return (
            <div
              key={q.questionId}
              className={`rounded-xl border p-4 transition-colors ${
                q.isCorrect
                  ? 'border-emerald-500/20 bg-emerald-500/5'
                  : q.selectedOptionId
                  ? 'border-red-500/20 bg-red-500/5'
                  : 'border-zinc-200/60 bg-zinc-50 dark:border-white/[0.08] dark:bg-white/[0.02]'
              }`}
            >
              <button
                onClick={() => toggleExpanded(q.questionId)}
                className="flex w-full items-center justify-between text-left"
              >
                <div className="flex items-center gap-3">
                  <span className={`flex h-7 w-7 items-center justify-center rounded text-xs font-bold ${
                    q.isCorrect
                      ? 'bg-emerald-500/20 text-emerald-500'
                      : q.selectedOptionId
                      ? 'bg-red-500/20 text-red-500'
                      : 'bg-zinc-200 text-zinc-500 dark:bg-zinc-700 dark:text-zinc-400'
                  }`}>
                    {q.isCorrect ? '✓' : q.selectedOptionId ? '✗' : '-'}
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
                    {q.questionText.replace(/\\n/g, '\n')}
                  </p>
                  <div className="space-y-2">
                    {q.options.map(opt => {
                      const isSelected = q.selectedOptionId === opt.id
                      const isCorrectOption = q.correctOptionId === opt.id
                      let optionClass = 'border-zinc-200/60 bg-white dark:border-white/[0.08] dark:bg-white/[0.02]'
                      if (isCorrectOption) {
                        optionClass = 'border-emerald-500/40 bg-emerald-500/10'
                      } else if (isSelected && !q.isCorrect) {
                        optionClass = 'border-red-500/40 bg-red-500/10'
                      }

                      return (
                        <div key={opt.id} className={`rounded-lg border px-3 py-2 text-sm ${optionClass}`}>
                          <div className="flex items-center gap-2">
                            {isCorrectOption && <span className="text-emerald-500 font-bold text-xs">✓</span>}
                            {isSelected && !q.isCorrect && <span className="text-red-500 font-bold text-xs">✗</span>}
                            <span className={`${
                              isCorrectOption
                                ? 'text-emerald-700 dark:text-emerald-300 font-medium'
                                : isSelected && !q.isCorrect
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

                  {/* Claim section */}
                  <div className="mt-3">
                    {isClaimed ? (
                      <div className="flex justify-end">
                        <span className="rounded-lg bg-zinc-100 px-3 py-1.5 text-xs font-medium text-zinc-400 dark:bg-zinc-800 dark:text-zinc-500">
                          クレーム送信済み
                        </span>
                      </div>
                    ) : claimForms.has(q.questionId) ? (
                      <div className="rounded-lg border border-amber-500/20 bg-amber-500/5 p-3">
                        <textarea
                          placeholder="クレーム理由（任意）"
                          value={claimReasons[q.questionId] ?? ''}
                          onChange={e => setClaimReasons(prev => ({ ...prev, [q.questionId]: e.target.value }))}
                          rows={2}
                          className="w-full rounded-lg border border-zinc-200 bg-white px-3 py-2 text-sm text-zinc-900 placeholder:text-zinc-400 focus:border-amber-500 focus:outline-none dark:border-zinc-700 dark:bg-zinc-800 dark:text-zinc-100"
                        />
                        {claimError && claimingId === null && (
                          <p className="mt-1 text-xs text-red-500">{claimError}</p>
                        )}
                        <div className="mt-2 flex justify-end gap-2">
                          <button
                            onClick={() => toggleClaimForm(q.questionId)}
                            className="rounded-lg px-3 py-1.5 text-xs font-medium text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200"
                          >
                            キャンセル
                          </button>
                          <button
                            onClick={() => handleClaim(q.questionId)}
                            disabled={claimingId === q.questionId}
                            className="rounded-lg bg-amber-500 px-3 py-1.5 text-xs font-medium text-white hover:bg-amber-600 disabled:opacity-50"
                          >
                            {claimingId === q.questionId ? '送信中...' : '送信'}
                          </button>
                        </div>
                      </div>
                    ) : (
                      <div className="flex justify-end">
                        <button
                          onClick={() => toggleClaimForm(q.questionId)}
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
    </div>
  )
}
