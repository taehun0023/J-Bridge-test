'use client'

import { useState, useEffect, useCallback, useRef } from 'react'
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
  quizType?: string
}

type PlayState = 'idle' | 'loading' | 'playing' | 'paused'

/**
 * 청해 퀴즈의 question_text에서 대화 스크립트와 질문을 분리
 * 포맷: "대화 스크립트...\n質問：실제 질문"
 */
function parseListeningQuestion(text: string): { script: string; question: string } {
  const cleaned = text.replace(/\\n/g, '\n')
  const marker = '質問：'
  const idx = cleaned.lastIndexOf(marker)
  if (idx === -1) return { script: '', question: cleaned }
  return {
    script: cleaned.substring(0, idx).trim(),
    question: marker + cleaned.substring(idx + marker.length),
  }
}

export default function QuizTaker({ quiz, questions, backUrl, quizType }: Props) {
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
  const isListening = quizType === 'jlpt_listening'

  // TTS audio state (listening quizzes only)
  const [playState, setPlayState] = useState<PlayState>('idle')
  const [speed, setSpeed] = useState(1.0)
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const audioBlobUrlRef = useRef<string | null>(null)

  const cleanupAudio = useCallback(() => {
    if (audioRef.current) {
      audioRef.current.pause()
      audioRef.current.removeAttribute('src')
      audioRef.current = null
    }
    if (audioBlobUrlRef.current) {
      URL.revokeObjectURL(audioBlobUrlRef.current)
      audioBlobUrlRef.current = null
    }
  }, [])

  // Reset audio when question changes
  useEffect(() => {
    if (isListening) {
      cleanupAudio()
      setPlayState('idle')
    }
  }, [currentIndex, isListening, cleanupAudio])

  const handlePlay = useCallback(async (scriptText: string) => {
    // Toggle pause/resume
    if (audioRef.current) {
      if (playState === 'playing') {
        audioRef.current.pause()
        setPlayState('paused')
        return
      }
      if (playState === 'paused') {
        audioRef.current.play()
        setPlayState('playing')
        return
      }
    }

    cleanupAudio()
    setPlayState('loading')

    try {
      const res = await fetch('/api/tts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ text: scriptText, speed }),
      })

      if (!res.ok) throw new Error('TTS request failed')

      const blob = await res.blob()
      const url = URL.createObjectURL(blob)
      audioBlobUrlRef.current = url

      const audio = new Audio(url)
      audioRef.current = audio

      audio.onended = () => {
        setPlayState('idle')
        cleanupAudio()
      }
      audio.onerror = () => {
        setPlayState('idle')
        cleanupAudio()
      }

      await audio.play()
      setPlayState('playing')
    } catch {
      setPlayState('idle')
      cleanupAudio()
    }
  }, [playState, speed, cleanupAudio])

  const handleStop = useCallback(() => {
    cleanupAudio()
    setPlayState('idle')
  }, [cleanupAudio])

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

      {/* Listening quiz audio controls */}
      {isListening && (() => {
        const { script } = parseListeningQuestion(currentQuestion.question_text)
        if (!script) return null
        return (
          <div className="mb-4 rounded-xl border border-purple-200 bg-purple-50 p-4 dark:border-purple-800 dark:bg-purple-900/20">
            <p className="mb-3 text-sm font-medium text-purple-700 dark:text-purple-300">
              音声を聞いて質問に答えてください
            </p>
            <div className="flex items-center gap-3">
              {playState === 'loading' ? (
                <button
                  disabled
                  className="flex items-center gap-2 rounded-lg bg-purple-100 px-3 py-1.5 text-sm font-medium text-purple-400 dark:bg-purple-900/30 dark:text-purple-300"
                >
                  <svg className="h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                  </svg>
                  読み込み中...
                </button>
              ) : playState === 'playing' ? (
                <>
                  <button
                    onClick={() => handlePlay(script)}
                    className="flex items-center gap-2 rounded-lg bg-purple-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-purple-700"
                  >
                    <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                      <rect x="6" y="4" width="4" height="16" />
                      <rect x="14" y="4" width="4" height="16" />
                    </svg>
                    一時停止
                  </button>
                  <button
                    onClick={handleStop}
                    className="flex items-center gap-2 rounded-lg bg-gray-200 px-3 py-1.5 text-sm font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200 dark:hover:bg-gray-500"
                  >
                    <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                      <rect x="6" y="6" width="12" height="12" />
                    </svg>
                    停止
                  </button>
                </>
              ) : playState === 'paused' ? (
                <>
                  <button
                    onClick={() => handlePlay(script)}
                    className="flex items-center gap-2 rounded-lg bg-purple-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-purple-700"
                  >
                    <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                      <polygon points="5,3 19,12 5,21" />
                    </svg>
                    再開
                  </button>
                  <button
                    onClick={handleStop}
                    className="flex items-center gap-2 rounded-lg bg-gray-200 px-3 py-1.5 text-sm font-medium text-gray-700 hover:bg-gray-300 dark:bg-gray-600 dark:text-gray-200 dark:hover:bg-gray-500"
                  >
                    <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                      <rect x="6" y="6" width="12" height="12" />
                    </svg>
                    停止
                  </button>
                </>
              ) : (
                <button
                  onClick={() => handlePlay(script)}
                  className="flex items-center gap-2 rounded-lg bg-purple-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-purple-700"
                >
                  <svg className="h-4 w-4" fill="currentColor" viewBox="0 0 24 24">
                    <polygon points="5,3 19,12 5,21" />
                  </svg>
                  再生
                </button>
              )}

              <select
                value={speed}
                onChange={(e) => setSpeed(Number(e.target.value))}
                className="rounded-lg border border-gray-300 bg-white px-2 py-1.5 text-sm text-gray-700 dark:border-gray-600 dark:bg-gray-600 dark:text-gray-200"
              >
                <option value={0.75}>0.75x</option>
                <option value={1.0}>1.0x</option>
                <option value={1.25}>1.25x</option>
              </select>
            </div>
          </div>
        )
      })()}

      {/* Question */}
      <div className="rounded-xl border border-gray-200 bg-white p-6 dark:border-gray-700 dark:bg-gray-900">
        <QuizQuestion
          questionNumber={currentIndex + 1}
          totalQuestions={questions.length}
          questionText={isListening ? parseListeningQuestion(currentQuestion.question_text).question : currentQuestion.question_text}
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
