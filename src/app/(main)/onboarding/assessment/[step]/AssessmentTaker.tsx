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
  isOnboarded?: boolean
}

export default function AssessmentTaker({ step, label, timeLimit, questions, isOnboarded }: Props) {
  const router = useRouter()
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [submitting, setSubmitting] = useState(false)
  const [error, setError] = useState('')
  const [remainingSeconds, setRemainingSeconds] = useState(timeLimit * 60)
  const hasSubmittedRef = useRef(false)

  const totalQuestions = questions.length
  const currentQuestion = questions[currentIndex]
  const answeredCount = Object.keys(answers).length

  const handleSubmit = useCallback(async () => {
    if (hasSubmittedRef.current) return
    hasSubmittedRef.current = true
    setSubmitting(true)
    setError('')

    const answerArray = questions.map(q => ({
      questionId: q.id,
      selectedOptionId: answers[q.id] ?? '',
    })).filter(a => a.selectedOptionId !== '')

    if (answerArray.length === 0) {
      setError('最低1問以上回答してください')
      setSubmitting(false)
      hasSubmittedRef.current = false
      return
    }

    const result = await submitAssessment(answerArray, step)

    if ('error' in result && result.error) {
      setError(result.error)
      setSubmitting(false)
      hasSubmittedRef.current = false
      return
    }

    // Always redirect to dashboard after each assessment
    router.push('/dashboard')
  }, [answers, questions, step, router])

  // Timer countdown
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

  // Warn before leaving & auto-submit on leave
  useEffect(() => {
    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      if (hasSubmittedRef.current) return
      e.preventDefault()
      // Auto-submit when actually leaving
      handleSubmit()
    }

    window.addEventListener('beforeunload', handleBeforeUnload)
    return () => window.removeEventListener('beforeunload', handleBeforeUnload)
  }, [handleSubmit])

  // Intercept in-app navigation (back button, link click)
  useEffect(() => {
    const handlePopState = () => {
      if (hasSubmittedRef.current) return
      const leave = window.confirm(
        'テストを中断すると、回答済みの問題のみ採点されます。本当に退出しますか？'
      )
      if (leave) {
        handleSubmit()
      } else {
        // Push the current URL back to prevent navigation
        window.history.pushState(null, '', window.location.href)
      }
    }

    // Push a state so we can intercept the back button
    window.history.pushState(null, '', window.location.href)
    window.addEventListener('popstate', handlePopState)
    return () => window.removeEventListener('popstate', handlePopState)
  }, [handleSubmit])

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
          <p className="text-sm font-medium text-blue-600">
            {isOnboarded ? '等級テスト' : `テスト ${step}/5`}
          </p>
          <h1 className="text-xl font-bold text-gray-900 dark:text-white">{label}</h1>
        </div>
        <div className={`rounded-lg px-4 py-2 text-sm font-mono font-bold ${
          isTimeLow ? 'bg-red-100 text-red-700 animate-pulse' : 'bg-gray-100 text-gray-700 dark:bg-gray-800 dark:text-gray-300'
        }`}>
          {formatTime(remainingSeconds)}
        </div>
      </div>

      {/* Progress bar */}
      <div className="mb-6">
        <div className="flex items-center justify-between text-xs text-gray-500 dark:text-gray-400 mb-1">
          <span>進捗</span>
          <span>{answeredCount}/{totalQuestions} 回答完了</span>
        </div>
        <div className="h-2 rounded-full bg-gray-200 dark:bg-gray-700">
          <div
            className="h-2 rounded-full bg-blue-600 transition-all"
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
                ? 'bg-blue-600 text-white'
                : answers[q.id]
                  ? 'bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-300'
                  : 'bg-gray-100 text-gray-500 dark:bg-gray-800 dark:text-gray-400'
            }`}
          >
            {i + 1}
          </button>
        ))}
      </div>

      {/* Current question */}
      <div className="rounded-xl border border-gray-200 dark:border-gray-700 bg-white dark:bg-gray-900 p-6">
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
          className="rounded-lg border border-gray-300 dark:border-gray-600 px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          前へ
        </button>

        {currentIndex < totalQuestions - 1 ? (
          <button
            onClick={() => setCurrentIndex(prev => Math.min(totalQuestions - 1, prev + 1))}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
          >
            次へ
          </button>
        ) : (
          <button
            onClick={handleSubmit}
            disabled={submitting || answeredCount === 0}
            className="rounded-lg bg-green-600 px-6 py-2 text-sm font-semibold text-white hover:bg-green-700 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {submitting ? '提出中...' : '提出する'}
          </button>
        )}
      </div>

      {error && (
        <p className="mt-4 text-center text-sm text-red-600">{error}</p>
      )}

      {/* Unanswered warning */}
      {currentIndex === totalQuestions - 1 && answeredCount < totalQuestions && (
        <p className="mt-3 text-center text-xs text-amber-600 dark:text-amber-400">
          {totalQuestions - answeredCount}問がまだ未回答です
        </p>
      )}
    </div>
  )
}
