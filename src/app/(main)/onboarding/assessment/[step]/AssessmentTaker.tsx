'use client'

import { useState, useEffect, useCallback, useRef } from 'react'
import { useRouter } from 'next/navigation'
import { submitAssessment } from '@/app/actions/assessment'
import QuizQuestion from '@/components/quiz/QuizQuestion'

interface Question {
  id: string
  question_text: string
  options: { id: string; option_text: string; sort_order: number }[]
}

interface Props {
  step: number
  label: string
  timeLimit: number
  questions: Question[]
  totalSteps: number
  displayStep: number
}

export default function AssessmentTaker({ step, label, timeLimit, questions, totalSteps, displayStep }: Props) {
  const router = useRouter()
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')
  const [remainingSeconds, setRemainingSeconds] = useState(timeLimit * 60)
  const hasSubmittedRef = useRef(false)
  const answersRef = useRef(answers)

  const totalQuestions = questions.length
  const currentQuestion = questions[currentIndex]
  const answeredCount = Object.keys(answers).length

  useEffect(() => {
    answersRef.current = answers
  }, [answers])

  const doSubmit = useCallback(async (currentAnswers: Record<string, string>) => {
    if (hasSubmittedRef.current) return
    hasSubmittedRef.current = true

    const answerArray = questions
      .map(q => ({ questionId: q.id, selectedOptionId: currentAnswers[q.id] ?? '' }))
      .filter(a => a.selectedOptionId !== '')

    if (answerArray.length === 0) {
      hasSubmittedRef.current = false
      return
    }

    await submitAssessment(answerArray, step, totalQuestions)
  }, [questions, step, totalQuestions])

  const handleSubmit = useCallback(async () => {
    if (hasSubmittedRef.current) return
    hasSubmittedRef.current = true
    setSubmitting(true)
    setError('')

    const answerArray = questions
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

    router.push('/dashboard')
  }, [answers, questions, step, totalQuestions, router])

  useEffect(() => {
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
  }, [handleSubmit])

  useEffect(() => {
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
  }, [doSubmit])

  useEffect(() => {
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
  }, [doSubmit, router])

  useEffect(() => {
    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      if (hasSubmittedRef.current) return
      e.preventDefault()
    }

    window.addEventListener('beforeunload', handleBeforeUnload)
    return () => window.removeEventListener('beforeunload', handleBeforeUnload)
  }, [])

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
        {questions.map((q, i) => (
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
