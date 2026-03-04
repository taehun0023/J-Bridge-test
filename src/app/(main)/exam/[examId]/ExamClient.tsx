'use client'

import { useState, useEffect, useCallback, useRef } from 'react'
import { startExam, submitExam, requestRetakeExam, loadExamQuestions } from '@/app/actions/comprehensive-exam'
import { submitQuestionClaim } from '@/app/actions/claims'
import { useRouter } from 'next/navigation'
import Card from '@/components/ui/Card'
import QuizQuestion from '@/components/quiz/QuizQuestion'

interface ExamData {
  id: string
  status: string
  time_limit_minutes: number
  total_questions: number
  passing_score: number
  started_at: string | null
  exam_cycle_id?: string | null
}

interface Question {
  id: string
  question_text: string
  question_category?: string | null
  options: { id: string; option_text: string; sort_order: number }[]
}

/**
 * Parse listening question: split into script (for TTS) and question (for display).
 * Format: "次の会話を聞いて...\n\n[dialogue]\n\n質問？"
 */
function parseListeningQuestion(text: string): { script: string; question: string } | null {
  const normalized = text.replace(/\\n/g, '\n')
  // Split by double newline
  const parts = normalized.split('\n\n')
  if (parts.length < 3) return null
  // First part: instruction, middle parts: script, last part: question
  const question = parts[parts.length - 1]
  const script = parts.slice(0, parts.length - 1).join('\n\n')
  return { script, question }
}

/** Inline TTS player for listening questions */
function ListeningPlayer({ script }: { script: string }) {
  const [playing, setPlaying] = useState(false)
  const [loading, setLoading] = useState(false)
  const [playCount, setPlayCount] = useState(0)
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const blobUrlRef = useRef<string | null>(null)

  const MAX_PLAYS = 1

  const handlePlay = async () => {
    if (playCount >= MAX_PLAYS || playing) return

    setLoading(true)
    try {
      const res = await fetch('/api/tts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ text: script, speed: 1.0 }),
      })
      if (!res.ok) throw new Error('TTS error')
      const blob = await res.blob()
      const url = URL.createObjectURL(blob)
      blobUrlRef.current = url
      const audio = new Audio(url)
      audioRef.current = audio
      audio.onended = () => {
        setPlaying(false)
        setPlayCount(c => c + 1)
      }
      audio.play()
      setPlaying(true)
    } catch {
      console.error('TTS playback failed')
    } finally {
      setLoading(false)
    }
  }

  // Cleanup
  useEffect(() => {
    return () => {
      if (audioRef.current) audioRef.current.pause()
      if (blobUrlRef.current) URL.revokeObjectURL(blobUrlRef.current)
    }
  }, [])

  const canPlay = playCount < MAX_PLAYS

  return (
    <div className="mb-4 flex items-center gap-3 rounded-xl border border-indigo-500/20 bg-indigo-500/5 px-4 py-3">
      <button
        onClick={handlePlay}
        disabled={loading || !canPlay || playing}
        className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-indigo-600 text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
      >
        {loading || playing ? (
          <svg className="h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none">
            <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
            <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
          </svg>
        ) : (
          <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24"><path d="M8 5v14l11-7z" /></svg>
        )}
      </button>
      <div className="flex-1">
        <p className="text-sm font-medium text-indigo-700 dark:text-indigo-300">
          聴解問題 — 音声を聞いてから回答してください
        </p>
        <p className="text-xs text-indigo-500/70 dark:text-indigo-400/60">
          再生回数: {playCount}/{MAX_PLAYS}
        </p>
      </div>
    </div>
  )
}

interface ReviewResult {
  questionId: string
  selectedOptionId: string
  correctOptionId: string
  isCorrect: boolean
}

interface Props {
  exam: ExamData
  mode: 'start' | 'exam' | 'retake'
  examLabel?: string
}

export default function ExamClient({ exam, mode, examLabel }: Props) {
  const router = useRouter()
  const hasSubmittedRef = useRef(false)
  const answersRef = useRef<Record<string, string>>({})

  const [questions, setQuestions] = useState<Question[]>([])
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [remainingSeconds, setRemainingSeconds] = useState(exam.time_limit_minutes * 60)
  const [started, setStarted] = useState(mode === 'exam')
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState<string | null>(null)

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

  const totalQuestions = questions.length
  const currentQuestion = questions[currentIndex]
  const answeredCount = Object.keys(answers).length

  useEffect(() => {
    answersRef.current = answers
  }, [answers])

  // Load questions when resuming an in-progress exam
  useEffect(() => {
    if (mode === 'exam' && questions.length === 0 && !error) {
      loadExamQuestions(exam.id).then(res => {
        if ('error' in res) {
          setError(res.error ?? '問題の読み込みに失敗しました')
        } else if (res.questions) {
          setQuestions(res.questions as Question[])
          if (res.startedAt) {
            const elapsed = Math.floor((Date.now() - new Date(res.startedAt).getTime()) / 1000)
            setRemainingSeconds(Math.max(0, (res.timeLimit ?? exam.time_limit_minutes) * 60 - elapsed))
          }
        }
      })
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [mode, exam.id])

  // Fire-and-forget submit (for navigation away — submit answered questions only, or 0-score fail)
  const doSubmit = useCallback(async (currentAnswers: Record<string, string>) => {
    if (hasSubmittedRef.current) return
    hasSubmittedRef.current = true

    const answerArray = questions
      .map(q => ({ questionId: q.id, selectedOptionId: currentAnswers[q.id] ?? '' }))
      .filter(a => a.selectedOptionId !== '')

    // Even with 0 answers, submit to mark as failed (0 score) instead of stuck in_progress
    await submitExam(exam.id, answerArray)
  }, [questions, exam.id])

  // Full submit — submit and enter review mode
  const handleSubmit = useCallback(async () => {
    if (hasSubmittedRef.current) return
    hasSubmittedRef.current = true
    setSubmitting(true)
    setError(null)

    const answerArray = questions
      .map(q => ({ questionId: q.id, selectedOptionId: answersRef.current[q.id] ?? '' }))
      .filter(a => a.selectedOptionId !== '')

    const res = await submitExam(exam.id, answerArray)
    if ('error' in res && res.error) {
      setError(res.error)
      setSubmitting(false)
      hasSubmittedRef.current = false
      return
    }

    // Enter review mode with results
    if ('results' in res && res.results) {
      setReviewResults(res.results)
      setReviewScore({ score: res.score, correctCount: res.correctCount, totalCount: res.totalCount })
      setReviewMode(true)
      setSubmitting(false)
    } else {
      window.location.href = '/dashboard'
    }
  }, [questions, exam.id])

  // Timer
  useEffect(() => {
    if (!started || submitting || reviewMode || questions.length === 0) return

    const interval = setInterval(() => {
      setRemainingSeconds(prev => {
        if (prev <= 1) {
          clearInterval(interval)
          handleSubmit()
          return 0
        }
        return prev - 1
      })
    }, 1000)

    return () => clearInterval(interval)
  }, [started, submitting, reviewMode, questions.length, handleSubmit])

  // Anti-cheat: prevent drag, copy, select, right-click during exam (not in review)
  useEffect(() => {
    if (!started || submitting || reviewMode) return

    const prevent = (e: Event) => e.preventDefault()
    document.addEventListener('dragstart', prevent)
    document.addEventListener('drop', prevent)
    document.addEventListener('copy', prevent)
    document.addEventListener('cut', prevent)
    document.addEventListener('selectstart', prevent)
    document.addEventListener('contextmenu', prevent)

    return () => {
      document.removeEventListener('dragstart', prevent)
      document.removeEventListener('drop', prevent)
      document.removeEventListener('copy', prevent)
      document.removeEventListener('cut', prevent)
      document.removeEventListener('selectstart', prevent)
      document.removeEventListener('contextmenu', prevent)
    }
  }, [started, submitting, reviewMode])

  // Intercept link clicks during exam — warn and submit partial answers
  useEffect(() => {
    if (!started || submitting || reviewMode || questions.length === 0) return

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
  }, [doSubmit, started, submitting, reviewMode, questions.length])

  // Intercept browser back button — warn and submit partial answers
  useEffect(() => {
    if (!started || submitting || reviewMode || questions.length === 0) return

    const handlePopState = () => {
      if (hasSubmittedRef.current) return
      const leave = window.confirm(
        'テストを中断すると、回答済みの問題のみ採点されます。本当に退出しますか？'
      )
      if (leave) {
        doSubmit(answersRef.current).then(() => {
          window.location.href = '/dashboard'
        })
      } else {
        window.history.pushState(null, '', window.location.href)
      }
    }

    window.history.pushState(null, '', window.location.href)
    window.addEventListener('popstate', handlePopState)
    return () => window.removeEventListener('popstate', handlePopState)
  }, [doSubmit, started, submitting, reviewMode, questions.length])

  // Warn on tab close / refresh
  useEffect(() => {
    if (!started || submitting || reviewMode || questions.length === 0) return
    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      if (hasSubmittedRef.current) return
      e.preventDefault()
    }
    window.addEventListener('beforeunload', handleBeforeUnload)
    return () => window.removeEventListener('beforeunload', handleBeforeUnload)
  }, [started, submitting, reviewMode, questions.length])

  function handleStart() {
    if (!window.confirm('試験を受けますか？')) return
    setSubmitting(true)
    startExam(exam.id).then(res => {
      if ('error' in res && res.error) {
        setError(res.error)
        setSubmitting(false)
      } else if ('questions' in res && res.questions) {
        setQuestions(res.questions as Question[])
        setRemainingSeconds(res.timeLimit! * 60)
        setStarted(true)
        setSubmitting(false)
      }
    })
  }

  function handleRetake() {
    setSubmitting(true)
    requestRetakeExam(exam.id).then(res => {
      if ('error' in res && res.error) {
        setError(res.error)
        setSubmitting(false)
      } else {
        router.push('/dashboard')
      }
    })
  }

  function handleSelect(optionId: string) {
    if (!currentQuestion) return
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

  // ==================== RETAKE BUTTON ====================
  if (mode === 'retake') {
    return (
      <button
        onClick={handleRetake}
        disabled={submitting}
        className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50"
      >
        {submitting ? 'リクエスト中...' : '再試験リクエスト'}
      </button>
    )
  }

  // ==================== START SCREEN ====================
  if (mode === 'start' && !started && !reviewMode) {
    return (
      <div className="mx-auto max-w-2xl">
        <Card>
          <div className="py-8 text-center">
            <h1 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">総合試験</h1>
            {examLabel && (
              <p className="mt-2 text-zinc-500 dark:text-zinc-400">{examLabel}</p>
            )}
            <div className="mt-6 space-y-2 text-sm text-zinc-600 dark:text-zinc-300">
              <p>問題数: {exam.total_questions}問</p>
              <p>制限時間: {exam.time_limit_minutes}分</p>
              <p>合格点: {exam.passing_score}点</p>
            </div>
            <div className="mt-6">
              {error && <p className="mb-3 text-sm text-red-500">{error}</p>}
              <button
                onClick={handleStart}
                disabled={submitting}
                className="rounded-lg bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
              >
                {submitting ? '準備中...' : '試験を開始する'}
              </button>
              <p className="mt-3 text-xs text-zinc-400 dark:text-zinc-500">
                開始後、タイマーが自動的にスタートします
              </p>
            </div>
          </div>
        </Card>
      </div>
    )
  }

  // ==================== REVIEW MODE ====================
  if (reviewMode && reviewResults && reviewScore) {
    const resultMap = new Map(reviewResults.map(r => [r.questionId, r]))

    return (
      <div className="mx-auto max-w-3xl">
        {/* Review Header */}
        <div className="mb-6">
          <p className="text-sm font-medium text-indigo-400">総合試験 — 結果レビュー</p>
          {examLabel && (
            <h1 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{examLabel}</h1>
          )}
          <div className="mt-3 flex items-center gap-4">
            <div className="rounded-xl bg-zinc-100 border border-gray-200 px-4 py-2 dark:bg-white/[0.03] dark:border-white/[0.08]">
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
            onClick={() => { window.location.href = '/dashboard' }}
            className="rounded-xl bg-indigo-600 px-6 py-2.5 text-sm font-semibold text-white hover:bg-indigo-500 transition-colors"
          >
            ダッシュボードに戻る
          </button>
        </div>
      </div>
    )
  }

  // ==================== EXAM MODE (one question at a time) ====================
  if (questions.length === 0) {
    return (
      <div className="mx-auto max-w-3xl">
        <Card>
          <div className="py-8 text-center text-zinc-500">問題を読み込み中...</div>
        </Card>
      </div>
    )
  }

  const totalSeconds = exam.time_limit_minutes * 60
  const timeProgressPct = totalSeconds > 0 ? Math.max(0, (remainingSeconds / totalSeconds) * 100) : 0
  const isTimeCritical = remainingSeconds <= 60
  const isTimeLow = remainingSeconds <= 300

  const timerBg = isTimeCritical
    ? 'border-red-300 bg-red-50/90 dark:border-red-500/40 dark:bg-red-900/30'
    : isTimeLow
    ? 'border-amber-300 bg-amber-50/90 dark:border-amber-500/40 dark:bg-amber-900/30'
    : 'border-emerald-300 bg-emerald-50/90 dark:border-emerald-500/40 dark:bg-emerald-900/30'

  const timerText = isTimeCritical
    ? 'text-red-700 dark:text-red-300'
    : isTimeLow
    ? 'text-amber-700 dark:text-amber-300'
    : 'text-emerald-700 dark:text-emerald-300'

  const progressBarColor = isTimeCritical
    ? 'bg-red-500'
    : isTimeLow
    ? 'bg-amber-500'
    : 'bg-emerald-500'

  const minutes = Math.floor(remainingSeconds / 60)
  const seconds = remainingSeconds % 60

  return (
    <div
      className="mx-auto max-w-3xl select-none"
      style={{ userSelect: 'none', WebkitUserSelect: 'none', WebkitTouchCallout: 'none' } as React.CSSProperties}
    >
      {error && (
        <div className="mb-4 rounded-lg bg-red-50 px-4 py-3 text-sm text-red-600 dark:bg-red-900/30 dark:text-red-400">
          {error}
        </div>
      )}

      {/* Header + Timer */}
      <div className={`sticky top-0 z-10 mb-4 overflow-hidden rounded-xl border shadow-sm backdrop-blur ${timerBg}`}>
        <div className="flex items-center justify-between px-4 py-3">
          <div>
            <p className="text-xs font-medium text-indigo-400">総合試験</p>
          </div>
          <div className={`flex items-center gap-2 ${isTimeCritical || isTimeLow ? 'animate-pulse' : ''}`}>
            <span className={`rounded-lg px-3 py-1 text-sm font-bold ${timerText}`}>
              残り {minutes}分{seconds > 0 ? ` ${seconds}秒` : ''}
            </span>
          </div>
          <span className="text-sm text-zinc-600 dark:text-zinc-300">
            回答: <span className="font-semibold">{answeredCount}/{totalQuestions}</span>
          </span>
        </div>
        {/* Time progress bar */}
        <div className="h-1.5 w-full bg-gray-200/50 dark:bg-white/10">
          <div
            className={`h-full transition-all duration-1000 ease-linear ${progressBarColor}`}
            style={{ width: `${timeProgressPct}%` }}
          />
        </div>
      </div>

      {/* Answer progress bar */}
      <div className="mb-6">
        <div className="flex items-center justify-between text-xs text-zinc-500 dark:text-zinc-400 mb-1">
          <span>進捗</span>
          <span>{answeredCount}/{totalQuestions} 回答完了</span>
        </div>
        <div className="h-2 rounded-full bg-zinc-200 dark:bg-white/5">
          <div
            className="h-2 rounded-full bg-indigo-600 transition-all"
            style={{ width: `${(answeredCount / totalQuestions) * 100}%` }}
          />
        </div>
      </div>

      {/* Question navigation dots */}
      <div className="mb-6 flex flex-wrap gap-1.5">
        {questions.map((q, i) => (
          <button
            key={q.id}
            onClick={() => setCurrentIndex(i)}
            className={`h-7 w-7 rounded text-xs font-medium transition-colors ${
              i === currentIndex
                ? 'bg-indigo-600 text-white'
                : answers[q.id]
                  ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
                  : 'bg-zinc-100 text-zinc-500 dark:bg-white/5 dark:text-zinc-400'
            }`}
          >
            {i + 1}
          </button>
        ))}
      </div>

      {/* Current question */}
      {currentQuestion && (() => {
        const isListening = currentQuestion.question_category === 'listening'
        const parsed = isListening ? parseListeningQuestion(currentQuestion.question_text) : null

        return (
          <div className="rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md p-6 dark:border-white/[0.08] dark:bg-white/[0.03]">
            {isListening && parsed && (
              <ListeningPlayer key={currentQuestion.id} script={parsed.script} />
            )}
            <QuizQuestion
              questionNumber={currentIndex + 1}
              totalQuestions={totalQuestions}
              questionText={isListening && parsed ? parsed.question : currentQuestion.question_text}
              options={currentQuestion.options}
              selectedOptionId={answers[currentQuestion.id] ?? null}
              onSelect={handleSelect}
            />
          </div>
        )
      })()}

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

      {currentIndex === totalQuestions - 1 && answeredCount < totalQuestions && (
        <p className="mt-3 text-center text-xs text-amber-400">
          {totalQuestions - answeredCount}問がまだ未回答です
        </p>
      )}
    </div>
  )
}
