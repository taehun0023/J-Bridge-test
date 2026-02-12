'use client'

import { useState, useEffect, useCallback, useTransition } from 'react'
import { startExam, submitExam, requestRetakeExam } from '@/app/actions/comprehensive-exam'
import { useRouter } from 'next/navigation'
import Card from '@/components/ui/Card'

interface ExamData {
  id: string
  status: string
  time_limit_minutes: number
  total_questions: number
  passing_score: number
  started_at: string | null
}

interface Question {
  id: string
  question_text: string
  options: { id: string; option_text: string }[]
}

interface Props {
  exam: ExamData
  mode: 'start' | 'exam' | 'retake'
}

export default function ExamClient({ exam, mode }: Props) {
  const [pending, startTransition] = useTransition()
  const [questions, setQuestions] = useState<Question[]>([])
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [timeLeft, setTimeLeft] = useState(exam.time_limit_minutes * 60)
  const [started, setStarted] = useState(mode === 'exam')
  const [submitted, setSubmitted] = useState(false)
  const [result, setResult] = useState<{ score: number; passed: boolean } | null>(null)
  const [error, setError] = useState<string | null>(null)
  const router = useRouter()

  // Calculate time left if exam is already in progress
  useEffect(() => {
    if (mode === 'exam' && exam.started_at) {
      const elapsed = Math.floor((Date.now() - new Date(exam.started_at).getTime()) / 1000)
      const remaining = Math.max(0, exam.time_limit_minutes * 60 - elapsed)
      setTimeLeft(remaining)
    }
  }, [mode, exam.started_at, exam.time_limit_minutes])

  const handleSubmit = useCallback(() => {
    if (submitted) return
    setSubmitted(true)
    startTransition(async () => {
      const answerArray = questions.map(q => ({
        questionId: q.id,
        selectedOptionId: answers[q.id] ?? '',
      })).filter(a => a.selectedOptionId)

      const res = await submitExam(exam.id, answerArray)
      if (res.error) {
        setError(res.error)
        setSubmitted(false)
      } else {
        setResult({ score: res.score!, passed: res.passed! })
      }
    })
  }, [submitted, questions, answers, exam.id])

  // Timer
  useEffect(() => {
    if (!started || submitted || questions.length === 0) return

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
  }, [started, submitted, questions.length, handleSubmit])

  function handleStart() {
    startTransition(async () => {
      const res = await startExam(exam.id)
      if (res.error) {
        setError(res.error)
      } else if (res.questions) {
        setQuestions(res.questions)
        setTimeLeft(res.timeLimit! * 60)
        setStarted(true)
      }
    })
  }

  function handleRetake() {
    startTransition(async () => {
      const res = await requestRetakeExam(exam.id)
      if (res.error) {
        setError(res.error)
      } else {
        router.push('/dashboard/assignments')
      }
    })
  }

  // Retake button mode
  if (mode === 'retake') {
    return (
      <button
        onClick={handleRetake}
        disabled={pending}
        className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50"
      >
        {pending ? 'リクエスト中...' : '再試験リクエスト'}
      </button>
    )
  }

  // Start button mode
  if (mode === 'start' && !started) {
    return (
      <div className="mt-6">
        {error && <p className="mb-3 text-sm text-red-500">{error}</p>}
        <button
          onClick={handleStart}
          disabled={pending}
          className="rounded-lg bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
        >
          {pending ? '準備中...' : '試験を開始する'}
        </button>
        <p className="mt-3 text-xs text-zinc-400 dark:text-zinc-500">
          開始後、タイマーが自動的にスタートします
        </p>
      </div>
    )
  }

  // Result display
  if (result) {
    return (
      <div className="mx-auto max-w-2xl py-8">
        <Card>
          <div className="py-8 text-center">
            <div className={`mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full ${
              result.passed ? 'bg-emerald-100 dark:bg-emerald-500/10' : 'bg-red-100 dark:bg-red-500/10'
            }`}>
              <span className="text-3xl">{result.passed ? '合' : '不'}</span>
            </div>
            <h2 className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">
              {result.passed ? '合格' : '不合格'}
            </h2>
            <p className="mt-4 text-4xl font-bold font-mono text-zinc-900 dark:text-zinc-100">
              {result.score}点
            </p>
            <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">
              合格点: {exam.passing_score}点
            </p>
            <div className="mt-6 flex justify-center gap-3">
              <button
                onClick={() => router.push('/dashboard/assignments')}
                className="rounded-lg bg-gray-100 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600"
              >
                課題一覧へ
              </button>
              {!result.passed && (
                <button
                  onClick={handleRetake}
                  disabled={pending}
                  className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50"
                >
                  再試験リクエスト
                </button>
              )}
            </div>
          </div>
        </Card>
      </div>
    )
  }

  // Exam in progress
  const minutes = Math.floor(timeLeft / 60)
  const seconds = timeLeft % 60
  const answeredCount = Object.keys(answers).length
  const isTimeLow = timeLeft < 300 // 5 minutes

  return (
    <div className="mx-auto max-w-3xl">
      {error && (
        <div className="mb-4 rounded-lg bg-red-50 px-4 py-3 text-sm text-red-600 dark:bg-red-900/30 dark:text-red-400">
          {error}
        </div>
      )}

      {/* Sticky timer bar */}
      <div className="sticky top-0 z-10 mb-4 flex items-center justify-between rounded-xl border border-gray-200 bg-white/90 px-4 py-3 shadow-sm backdrop-blur dark:border-white/[0.08] dark:bg-zinc-900/90">
        <span className="text-sm text-zinc-500 dark:text-zinc-400">
          回答: {answeredCount}/{questions.length}
        </span>
        <span className={`text-lg font-mono font-bold ${isTimeLow ? 'text-red-500 animate-pulse' : 'text-zinc-900 dark:text-zinc-100'}`}>
          {String(minutes).padStart(2, '0')}:{String(seconds).padStart(2, '0')}
        </span>
        <button
          onClick={handleSubmit}
          disabled={pending || submitted}
          className="rounded-lg bg-indigo-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50"
        >
          {pending ? '提出中...' : '提出する'}
        </button>
      </div>

      {/* Questions */}
      {questions.length === 0 && started ? (
        <Card>
          <div className="py-8 text-center text-zinc-500">問題を読み込み中...</div>
        </Card>
      ) : (
        <div className="space-y-4">
          {questions.map((question, idx) => (
            <Card key={question.id}>
              <div className="flex items-start gap-3">
                <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-indigo-100 text-xs font-bold text-indigo-700 dark:bg-indigo-500/10 dark:text-indigo-400">
                  {idx + 1}
                </span>
                <div className="flex-1">
                  <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100 whitespace-pre-wrap">
                    {question.question_text}
                  </p>
                  <div className="mt-3 space-y-2">
                    {question.options.map(option => (
                      <label
                        key={option.id}
                        className={`flex cursor-pointer items-center gap-3 rounded-lg border px-3 py-2.5 transition-colors ${
                          answers[question.id] === option.id
                            ? 'border-indigo-500 bg-indigo-50 dark:border-indigo-400 dark:bg-indigo-500/10'
                            : 'border-gray-200 hover:bg-gray-50 dark:border-gray-600 dark:hover:bg-white/5'
                        }`}
                      >
                        <input
                          type="radio"
                          name={`q-${question.id}`}
                          value={option.id}
                          checked={answers[question.id] === option.id}
                          onChange={() => setAnswers(prev => ({ ...prev, [question.id]: option.id }))}
                          className="h-4 w-4 text-indigo-600"
                        />
                        <span className="text-sm text-zinc-700 dark:text-zinc-300">{option.option_text}</span>
                      </label>
                    ))}
                  </div>
                </div>
              </div>
            </Card>
          ))}
        </div>
      )}
    </div>
  )
}
