'use client'

import { useState, useEffect, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import QuizQuestion from '@/components/quiz/QuizQuestion'
import QuizResults from '@/components/quiz/QuizResults'
import { Clock, PlayCircle } from 'lucide-react'
import { startQuizAttempt, submitQuizAnswers } from '@/app/actions/quiz'

interface Option {
  id: string
  option_text: string
  sort_order: number
}

interface Question {
  id: string
  question_text: string
  explanation: string | null
  points: number
  sort_order: number
  quiz_question_options_safe: Option[]
}

interface Quiz {
  id: string
  title: string
  passing_score: number
  time_limit_minutes: number | null
}

interface Props {
  quiz: Quiz
  questions: Question[]
  backUrl: string
}

export default function QuizTaker({ quiz, questions, backUrl }: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const fromAssignments = searchParams.get('from') === 'assignments'
  const effectiveBackUrl = fromAssignments ? '/dashboard/assignments' : backUrl
  const backLabel = fromAssignments ? '課題一覧' : 'テスト一覧'

  // Stabilize questions: lock the initial set to prevent server re-render issues
  const [stableQuestions] = useState<Question[]>(() => {
    if (typeof window !== 'undefined') {
      const stored = sessionStorage.getItem(`quiz_${quiz.id}`)
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
  useState(() => {
    if (typeof window !== 'undefined') {
      sessionStorage.setItem(`quiz_${quiz.id}`, JSON.stringify(stableQuestions))
    }
  })

  const [started, setStarted] = useState(false)
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [submitting, setSubmitting] = useState(false)
  const [timeLeft, setTimeLeft] = useState(quiz.time_limit_minutes ? quiz.time_limit_minutes * 60 : 0)
  const [result, setResult] = useState<{
    score: number
    passed: boolean
    correctCount: number
    totalCount: number
  } | null>(null)

  const currentQuestion = stableQuestions[currentIndex]

  const handleSubmit = useCallback(async () => {
    setSubmitting(true)

    const { attemptId, error: startError } = await startQuizAttempt(quiz.id)
    if (startError || !attemptId) {
      alert(startError ?? 'クイズ開始に失敗しました')
      setSubmitting(false)
      return
    }

    const answerArray = Object.entries(answers).map(([questionId, selectedOptionId]) => ({
      questionId,
      selectedOptionId,
    }))

    const submitResult = await submitQuizAnswers(attemptId, answerArray)
    if ('error' in submitResult) {
      alert(submitResult.error)
      setSubmitting(false)
      return
    }

    // Clear sessionStorage after successful submission
    sessionStorage.removeItem(`quiz_${quiz.id}`)
    setResult(submitResult)
    setSubmitting(false)
  }, [quiz.id, answers])

  // Countdown timer for timed quizzes
  useEffect(() => {
    if (!started || submitting || result || !quiz.time_limit_minutes) return

    const interval = setInterval(() => {
      setTimeLeft(prev => {
        if (prev <= 1) {
          clearInterval(interval)
          handleSubmit()
          return 0
        }
        return prev - 1
      })
    }, 1000)

    return () => clearInterval(interval)
  }, [started, submitting, result, quiz.time_limit_minutes, handleSubmit])

  function handleRetry() {
    setAnswers({})
    setCurrentIndex(0)
    setResult(null)
    setStarted(false)
    if (quiz.time_limit_minutes) {
      setTimeLeft(quiz.time_limit_minutes * 60)
    }
  }

  if (result) {
    return (
      <QuizResults
        score={result.score}
        passed={result.passed}
        correctCount={result.correctCount}
        totalCount={result.totalCount}
        quizTitle={quiz.title}
        onRetry={handleRetry}
        onBack={() => router.push(effectiveBackUrl)}
        backLabel={backLabel}
      />
    )
  }

  if (!currentQuestion) return null

  // Start screen — shown before quiz begins
  if (!started) {
    return (
      <div className="mx-auto max-w-2xl">
        <div className="rounded-xl border border-gray-200 bg-white p-8 dark:border-gray-700 dark:bg-gray-900">
          <h1 className="text-xl font-bold text-gray-900 dark:text-white">{quiz.title}</h1>
          <div className="mt-4 space-y-2 text-sm text-gray-600 dark:text-gray-400">
            <p>問題数: <span className="font-medium text-gray-900 dark:text-white">{stableQuestions.length}問</span></p>
            <p>合格点: <span className="font-medium text-gray-900 dark:text-white">{quiz.passing_score}点</span></p>
            {quiz.time_limit_minutes && (
              <p>制限時間: <span className="font-medium text-gray-900 dark:text-white">{quiz.time_limit_minutes}分</span></p>
            )}
          </div>
          {quiz.time_limit_minutes && (
            <p className="mt-4 flex items-center gap-1.5 text-xs text-amber-600 dark:text-amber-400">
              <Clock className="h-3.5 w-3.5" />
              開始後、タイマーが自動的にスタートします
            </p>
          )}
          <button
            onClick={() => setStarted(true)}
            className="mt-6 inline-flex items-center gap-2 rounded-lg bg-blue-600 px-6 py-3 text-base font-semibold text-white transition-colors hover:bg-blue-700"
          >
            <PlayCircle className="h-5 w-5" />
            開始
          </button>
        </div>
      </div>
    )
  }

  const answeredCount = Object.keys(answers).length
  const allAnswered = answeredCount === stableQuestions.length

  // Timer display values
  const minutes = Math.floor(timeLeft / 60)
  const seconds = timeLeft % 60
  const isTimeLow = timeLeft < 300

  return (
    <div className="mx-auto max-w-2xl">
      {/* Sticky timer bar (timed quizzes only) */}
      {quiz.time_limit_minutes ? (
        <div className="sticky top-0 z-10 mb-4 flex items-center justify-between rounded-xl border border-gray-200 bg-white/90 px-4 py-3 shadow-sm backdrop-blur dark:border-white/[0.08] dark:bg-zinc-900/90">
          <span className="text-sm text-zinc-500 dark:text-zinc-400">
            回答: {answeredCount}/{stableQuestions.length}
          </span>
          <span className={`text-lg font-mono font-bold ${isTimeLow ? 'text-red-500 animate-pulse' : 'text-zinc-900 dark:text-zinc-100'}`}>
            {String(minutes).padStart(2, '0')}:{String(seconds).padStart(2, '0')}
          </span>
          <button
            onClick={handleSubmit}
            disabled={!allAnswered || submitting}
            className="rounded-lg bg-blue-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
          >
            {submitting ? '提出中...' : '提出する'}
          </button>
        </div>
      ) : (
        <div className="mb-6">
          <h1 className="text-xl font-bold text-gray-900 dark:text-white">{quiz.title}</h1>
          <div className="mt-2 flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400">
            <span>{stableQuestions.length}問</span>
            <span>合格 {quiz.passing_score}点</span>
          </div>
        </div>
      )}

      {/* Progress bar */}
      <div className="mb-6 h-2 rounded-full bg-gray-200 dark:bg-gray-700">
        <div
          className="h-2 rounded-full bg-blue-600 transition-all"
          style={{ width: `${(answeredCount / stableQuestions.length) * 100}%` }}
        />
      </div>

      {/* Question */}
      <div className="rounded-xl border border-gray-200 bg-white p-6 dark:border-gray-700 dark:bg-gray-900">
        <QuizQuestion
          questionNumber={currentIndex + 1}
          totalQuestions={questions.length}
          questionText={currentQuestion.question_text}
          options={currentQuestion.quiz_question_options_safe}
          selectedOptionId={answers[currentQuestion.id] ?? null}
          onSelect={(optionId) => {
            if (optionId === '') {
              const newAnswers = { ...answers }
              delete newAnswers[currentQuestion.id]
              setAnswers(newAnswers)
            } else {
              setAnswers({ ...answers, [currentQuestion.id]: optionId })
            }
          }}
        />
      </div>

      {/* Navigation */}
      <div className="mt-4 flex items-center justify-between">
        <button
          onClick={() => setCurrentIndex(Math.max(0, currentIndex - 1))}
          disabled={currentIndex === 0}
          className="rounded-lg px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 disabled:opacity-40 dark:text-gray-300 dark:hover:bg-gray-800"
        >
          前の問題
        </button>

        <div className="flex gap-1">
          {stableQuestions.map((q, i) => (
            <button
              key={q.id}
              onClick={() => setCurrentIndex(i)}
              className={`h-8 w-8 rounded-lg text-xs font-medium ${
                i === currentIndex
                  ? 'bg-blue-600 text-white'
                  : answers[q.id]
                  ? 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-300'
                  : 'bg-gray-100 text-gray-500 dark:bg-gray-800 dark:text-gray-400'
              }`}
            >
              {i + 1}
            </button>
          ))}
        </div>

        {currentIndex < stableQuestions.length - 1 ? (
          <button
            onClick={() => setCurrentIndex(currentIndex + 1)}
            className="rounded-lg px-4 py-2 text-sm font-medium text-gray-600 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-800"
          >
            次の問題
          </button>
        ) : (
          <button
            onClick={handleSubmit}
            disabled={!allAnswered || submitting}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white hover:bg-blue-700 disabled:opacity-50"
          >
            {submitting ? '提出中...' : '提出する'}
          </button>
        )}
      </div>
    </div>
  )
}
