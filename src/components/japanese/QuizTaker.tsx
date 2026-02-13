'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import QuizQuestion from '@/components/quiz/QuizQuestion'
import QuizResults from '@/components/quiz/QuizResults'
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

  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [submitting, setSubmitting] = useState(false)
  const [result, setResult] = useState<{
    score: number
    passed: boolean
    correctCount: number
    totalCount: number
  } | null>(null)

  const currentQuestion = stableQuestions[currentIndex]

  async function handleSubmit() {
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
  }

  function handleRetry() {
    setAnswers({})
    setCurrentIndex(0)
    setResult(null)
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
        onBack={() => router.push(backUrl)}
      />
    )
  }

  if (!currentQuestion) return null

  const answeredCount = Object.keys(answers).length
  const allAnswered = answeredCount === stableQuestions.length

  return (
    <div className="mx-auto max-w-2xl">
      <div className="mb-6">
        <h1 className="text-xl font-bold text-gray-900 dark:text-white">{quiz.title}</h1>
        <div className="mt-2 flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400">
          <span>{stableQuestions.length}問</span>
          <span>合格 {quiz.passing_score}点</span>
          {quiz.time_limit_minutes && <span>制限時間 {quiz.time_limit_minutes}分</span>}
        </div>
      </div>

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
