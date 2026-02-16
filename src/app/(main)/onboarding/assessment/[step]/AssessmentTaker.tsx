'use client'

import { useState, useEffect, useCallback, useRef } from 'react'
import { useRouter } from 'next/navigation'
import { submitAssessment } from '@/app/actions/assessment'
import { submitQuestionClaim } from '@/app/actions/claims'
import QuizQuestion from '@/components/quiz/QuizQuestion'

interface Question {
  id: string
  question_text: string
  options: { id: string; option_text: string; sort_order: number }[]
}

interface ReviewResult {
  questionId: string
  selectedOptionId: string
  correctOptionId: string
  isCorrect: boolean
}

interface Props {
  step: number
  label: string
  timeLimit: number
  questions: Question[]
  totalSteps: number
  displayStep: number
  isAlreadyCompleted?: boolean
}

export default function AssessmentTaker({ step, label, timeLimit, questions, totalSteps, displayStep, isAlreadyCompleted }: Props) {
  const router = useRouter()

  // Stabilize questions: lock the initial set to prevent re-render issues
  const [stableQuestions] = useState<Question[]>(() => {
    if (typeof window !== 'undefined') {
      const stored = sessionStorage.getItem(`assessment_${step}`)
      if (stored) {
        try {
          const parsed = JSON.parse(stored) as Question[]
          if (parsed.length === questions.length) return parsed
        } catch { /* ignore parse errors */ }
      }
    }
    return questions
  })

  // Persist stableQuestions to sessionStorage
  useEffect(() => {
    sessionStorage.setItem(`assessment_${step}`, JSON.stringify(stableQuestions))
  }, [stableQuestions, step])

  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')
  const [remainingSeconds, setRemainingSeconds] = useState(timeLimit * 60)
  const hasSubmittedRef = useRef(false)
  const answersRef = useRef(answers)

  // Review mode state
  const [reviewMode, setReviewMode] = useState(false)
  const [reviewResults, setReviewResults] = useState<ReviewResult[] | null>(null)
  const [reviewScore, setReviewScore] = useState<{ score: number; correctCount: number; totalCount: number } | null>(null)
  const [claimedQuestions, setClaimedQuestions] = useState<Set<string>>(new Set())
  const [claimingId, setClaimingId] = useState<string | null>(null)
  const [expandedQuestions, setExpandedQuestions] = useState<Set<string>>(new Set())
  const [claimForms, setClaimForms] = useState<Set<string>>(new Set())
  const [claimReasons, setClaimReasons] = useState<Record<string, string>>({})
  const [claimError, setClaimError] = useState<string | null>(null)

  // If server says already completed and client has no review state → redirect to dashboard
  useEffect(() => {
    if (isAlreadyCompleted && !reviewMode) {
      router.replace('/dashboard')
    }
  }, [isAlreadyCompleted, reviewMode, router])

  const totalQuestions = stableQuestions.length
  const currentQuestion = stableQuestions[currentIndex]
  const answeredCount = Object.keys(answers).length

  useEffect(() => {
    answersRef.current = answers
  }, [answers])

  const doSubmit = useCallback(async (currentAnswers: Record<string, string>) => {
    if (hasSubmittedRef.current) return
    hasSubmittedRef.current = true

    const answerArray = stableQuestions
      .map(q => ({ questionId: q.id, selectedOptionId: currentAnswers[q.id] ?? '' }))
      .filter(a => a.selectedOptionId !== '')

    if (answerArray.length === 0) {
      hasSubmittedRef.current = false
      return
    }

    await submitAssessment(answerArray, step, totalQuestions)
    sessionStorage.removeItem(`assessment_${step}`)
  }, [stableQuestions, step, totalQuestions])

  const handleSubmit = useCallback(async () => {
    if (hasSubmittedRef.current) return
    hasSubmittedRef.current = true
    setSubmitting(true)
    setError('')

    const answerArray = stableQuestions
      .map(q => ({ questionId: q.id, selectedOptionId: answers[q.id] ?? '' }))
      .filter(a => a.selectedOptionId !== '')

    if (answerArray.length === 0) {
      setError('最低1問以上回答してください')
      setSubmitting(false)
      hasSubmittedRef.current = false
      return
    }

    const result = await submitAssessment(answerArray, step, totalQuestions)

    if ('error' in result && result.error) {
      setError(result.error)
      setSubmitting(false)
      hasSubmittedRef.current = false
      return
    }

    // Clear sessionStorage and enter review mode
    sessionStorage.removeItem(`assessment_${step}`)

    if ('results' in result && result.results) {
      setReviewResults(result.results)
      setReviewScore({ score: result.score, correctCount: result.correctCount, totalCount: result.totalCount })
      setReviewMode(true)
      setSubmitting(false)
    } else {
      router.push('/dashboard')
    }
  }, [answers, stableQuestions, step, totalQuestions, router])

  useEffect(() => {
    if (reviewMode) return // Don't count down in review mode
    const timer = setInterval(() => {
      setRemainingSeconds(prev => {
        if (prev <= 1) {
          clearInterval(timer)
          handleSubmit()
          return 0
        }
        return prev - 1
      })
    }, 1000)
    return () => clearInterval(timer)
  }, [handleSubmit, reviewMode])

  useEffect(() => {
    if (reviewMode) return
    const handleClick = (e: MouseEvent) => {
      if (hasSubmittedRef.current) return
      const anchor = (e.target as HTMLElement).closest('a')
      if (!anchor || !anchor.href) return

      const url = new URL(anchor.href, window.location.origin)
      if (url.pathname === window.location.pathname) return

      e.preventDefault()
      e.stopPropagation()

      const leave = window.confirm(
        'テストを中断すると、回答済みの問題のみ採点されます。本当に退出しますか？'
      )
      if (leave) {
        doSubmit(answersRef.current).then(() => {
          window.location.href = anchor.href
        })
      }
    }

    document.addEventListener('click', handleClick, true)
    return () => document.removeEventListener('click', handleClick, true)
  }, [doSubmit, reviewMode])

  useEffect(() => {
    if (reviewMode) return
    const handlePopState = () => {
      if (hasSubmittedRef.current) return
      const leave = window.confirm(
        'テストを中断すると、回答済みの問題のみ採点されます。本当に退出しますか？'
      )
      if (leave) {
        doSubmit(answersRef.current).then(() => {
          router.push('/dashboard')
        })
      } else {
        window.history.pushState(null, '', window.location.href)
      }
    }

    window.history.pushState(null, '', window.location.href)
    window.addEventListener('popstate', handlePopState)
    return () => window.removeEventListener('popstate', handlePopState)
  }, [doSubmit, router, reviewMode])

  useEffect(() => {
    if (reviewMode) return
    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      if (hasSubmittedRef.current) return
      e.preventDefault()
    }

    window.addEventListener('beforeunload', handleBeforeUnload)
    return () => window.removeEventListener('beforeunload', handleBeforeUnload)
  }, [reviewMode])

  const formatTime = (seconds: number) => {
    const m = Math.floor(seconds / 60)
    const s = seconds % 60
    return `${m}:${s.toString().padStart(2, '0')}`
  }

  const handleSelect = (optionId: string) => {
    if (optionId === '') {
      setAnswers(prev => {
        const next = { ...prev }
        delete next[currentQuestion.id]
        return next
      })
    } else {
      setAnswers(prev => ({ ...prev, [currentQuestion.id]: optionId }))
    }
  }

  const handleClaim = async (questionId: string) => {
    setClaimingId(questionId)
    setClaimError(null)
    const reason = claimReasons[questionId] || undefined
    const result = await submitQuestionClaim(questionId, reason)
    if (result.success) {
      setClaimedQuestions(prev => new Set(prev).add(questionId))
      setClaimForms(prev => { const next = new Set(prev); next.delete(questionId); return next })
    } else if ('error' in result && result.error) {
      setClaimError(result.error)
    }
    setClaimingId(null)
  }

  const toggleClaimForm = (questionId: string) => {
    setClaimForms(prev => {
      const next = new Set(prev)
      if (next.has(questionId)) next.delete(questionId)
      else next.add(questionId)
      return next
    })
  }

  const toggleExpanded = (questionId: string) => {
    setExpandedQuestions(prev => {
      const next = new Set(prev)
      if (next.has(questionId)) next.delete(questionId)
      else next.add(questionId)
      return next
    })
  }

  // ==================== REVIEW MODE ====================
  if (reviewMode && reviewResults && reviewScore) {
    const resultMap = new Map(reviewResults.map(r => [r.questionId, r]))

    return (
      <div>
        {/* Review Header */}
        <div className="mb-6">
          <p className="text-sm font-medium text-indigo-400">
            等級テスト {displayStep}/{totalSteps} — 結果レビュー
          </p>
          <h1 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{label}</h1>
          <div className="mt-3 flex items-center gap-4">
            <div className="rounded-xl bg-white/[0.03] border border-white/[0.08] px-4 py-2 dark:bg-white/[0.03] dark:border-white/[0.08] bg-zinc-100 border-gray-200">
              <span className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">{reviewScore.score}</span>
              <span className="text-sm text-zinc-500 dark:text-zinc-400">点</span>
            </div>
            <div className="text-sm text-zinc-500 dark:text-zinc-400">
              {reviewScore.correctCount}/{reviewScore.totalCount} 正解
            </div>
          </div>
        </div>

        {/* Question Review List */}
        <div className="space-y-3">
          {stableQuestions.map((q, i) => {
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
                      {q.options.map(opt => {
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
                          {claimError && claimingId === null && (
                            <p className="mt-1 text-xs text-red-500">{claimError}</p>
                          )}
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
        <div className="mt-6 flex justify-center">
          <button
            onClick={() => router.push('/dashboard')}
            className="rounded-xl bg-indigo-600 px-6 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500 transition-colors"
          >
            ダッシュボードに戻る
          </button>
        </div>
      </div>
    )
  }

  // ==================== EXAM MODE ====================
  const isTimeLow = remainingSeconds < 60

  return (
    <div>
      {/* Header */}
      <div className="mb-6 flex items-center justify-between">
        <div>
          <p className="text-sm font-medium text-indigo-400">
            等級テスト {displayStep}/{totalSteps}
          </p>
          <h1 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{label}</h1>
        </div>
        <div className={`rounded-xl px-4 py-2 text-sm font-mono font-bold backdrop-blur-md ${
          isTimeLow
            ? 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20 animate-pulse'
            : 'bg-white/[0.03] text-zinc-300 border border-white/[0.08] dark:bg-white/[0.03] dark:text-zinc-300 dark:border-white/[0.08] bg-zinc-100 text-zinc-700 border-gray-200'
        }`}>
          {formatTime(remainingSeconds)}
        </div>
      </div>

      {/* Progress bar */}
      <div className="mb-6">
        <div className="flex items-center justify-between text-xs text-zinc-500 dark:text-zinc-400 mb-1">
          <span>進捗</span>
          <span>{answeredCount}/{totalQuestions} 回答完了</span>
        </div>
        <div className="h-2 rounded-full bg-white/5 dark:bg-white/5 bg-zinc-200">
          <div
            className="h-2 rounded-full bg-indigo-600 transition-all"
            style={{ width: `${(answeredCount / totalQuestions) * 100}%` }}
          />
        </div>
      </div>

      {/* Question navigation dots */}
      <div className="mb-6 flex flex-wrap gap-1.5">
        {stableQuestions.map((q, i) => (
          <button
            key={q.id}
            onClick={() => setCurrentIndex(i)}
            className={`h-7 w-7 rounded text-xs font-medium transition-colors ${
              i === currentIndex
                ? 'bg-indigo-600 text-white'
                : answers[q.id]
                  ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
                  : 'bg-white/5 text-zinc-500 dark:bg-white/5 dark:text-zinc-400 bg-zinc-100 text-zinc-500'
            }`}
          >
            {i + 1}
          </button>
        ))}
      </div>

      {/* Current question */}
      <div className="rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md p-6 dark:border-white/[0.08] dark:bg-white/[0.03]">
        <QuizQuestion
          questionNumber={currentIndex + 1}
          totalQuestions={totalQuestions}
          questionText={currentQuestion.question_text}
          options={currentQuestion.options}
          selectedOptionId={answers[currentQuestion.id] ?? null}
          onSelect={handleSelect}
        />
      </div>

      {/* Navigation */}
      <div className="mt-6 flex items-center justify-between">
        <button
          onClick={() => setCurrentIndex(prev => Math.max(0, prev - 1))}
          disabled={currentIndex === 0}
          className="rounded-xl border border-gray-200 dark:border-white/[0.08] px-4 py-2 text-sm font-medium text-zinc-700 dark:text-zinc-300 hover:bg-zinc-50 dark:hover:bg-white/5 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
        >
          前へ
        </button>

        {currentIndex < totalQuestions - 1 ? (
          <button
            onClick={() => setCurrentIndex(prev => Math.min(totalQuestions - 1, prev + 1))}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
          >
            次へ
          </button>
        ) : (
          <button
            onClick={handleSubmit}
            disabled={submitting || answeredCount === 0}
            className="rounded-xl bg-emerald-600 px-6 py-2 text-sm font-semibold text-white hover:bg-emerald-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors"
          >
            {submitting ? '提出中...' : '提出する'}
          </button>
        )}
      </div>

      {error && (
        <p className="mt-4 text-center text-sm text-red-500">{error}</p>
      )}

      {currentIndex === totalQuestions - 1 && answeredCount < totalQuestions && (
        <p className="mt-3 text-center text-xs text-amber-400 dark:text-amber-400">
          {totalQuestions - answeredCount}問がまだ未回答です
        </p>
      )}
    </div>
  )
}
