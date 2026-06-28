'use client'

import { useState, useEffect, useCallback, useRef } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import QuizQuestion from '@/components/quiz/QuizQuestion'
import QuizResults from '@/components/quiz/QuizResults'
import QuizReviewMode from '@/components/quiz/QuizReviewMode'
import { Clock, PlayCircle, ChevronLeft, ChevronRight, Play, Loader2, Send, CheckCircle } from 'lucide-react'
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
  hideRetry?: boolean
  sessionKey?: string
}

type PlayState = 'idle' | 'loading' | 'playing'

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

export default function QuizTaker({ quiz, questions, backUrl, quizType, hideRetry, sessionKey }: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const fromAssignments = searchParams.get('from') === 'assignments'
  const effectiveBackUrl = fromAssignments ? '/dashboard/assignments' : backUrl
  const backLabel = fromAssignments ? '課題一覧' : 'テスト一覧'

  // Stabilize questions: lock the initial set to prevent server re-render issues
  const storageKey = `quiz_${quiz.id}${sessionKey ? `_${sessionKey}` : ''}`

  const [stableQuestions] = useState<Question[]>(() => {
    if (typeof window !== 'undefined') {
      const stored = sessionStorage.getItem(storageKey)
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
      sessionStorage.setItem(storageKey, JSON.stringify(stableQuestions))
    }
  })

  const [started, setStarted] = useState(false)
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const answersRef = useRef(answers)
  answersRef.current = answers
  const [submitting, setSubmitting] = useState(false)
  const [timeLeft, setTimeLeft] = useState(quiz.time_limit_minutes ? quiz.time_limit_minutes * 60 : 0)
  const [result, setResult] = useState<{
    score: number
    passed: boolean
    correctCount: number
    totalCount: number
    results?: { questionId: string; selectedOptionId: string; correctOptionId: string; isCorrect: boolean }[]
  } | null>(null)

  const currentQuestion = stableQuestions[currentIndex]
  const isListening = quizType === 'jlpt_listening'

  // TTS audio state (listening quizzes only)
  const [playState, setPlayState] = useState<PlayState>('idle')
  const [hasPlayed, setHasPlayed] = useState(false)
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
      setHasPlayed(false)
    }
  }, [currentIndex, isListening, cleanupAudio])

  const handlePlay = useCallback(async (scriptText: string) => {
    if (hasPlayed || playState === 'playing' || playState === 'loading') return

    cleanupAudio()
    setPlayState('loading')

    try {
      const res = await fetch('/api/tts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ text: scriptText, speed: 1.0 }),
      })

      if (!res.ok) throw new Error('TTS request failed')

      const blob = await res.blob()
      const url = URL.createObjectURL(blob)
      audioBlobUrlRef.current = url

      const audio = new Audio(url)
      audioRef.current = audio

      audio.onended = () => {
        setPlayState('idle')
        setHasPlayed(true)
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
  }, [hasPlayed, playState, cleanupAudio])

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

    const submitResult = await submitQuizAnswers(attemptId, answerArray, stableQuestions.length)
    if ('error' in submitResult) {
      alert(submitResult.error)
      setSubmitting(false)
      return
    }

    // Clear sessionStorage after successful submission
    sessionStorage.removeItem(storageKey)
    setResult(submitResult)
    setSubmitting(false)
  }, [quiz.id, answers, storageKey, stableQuestions.length])

  // Anti-cheat: prevent copy, drag, right-click, text selection during quiz
  useEffect(() => {
    if (!started || submitting || result) return
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
  }, [started, submitting, result])

  // Navigation guard: warn and submit partial answers when leaving during active quiz
  const exitSubmitRef = useRef<(() => Promise<void>) | null>(null)
  exitSubmitRef.current = async () => {
    setSubmitting(true)
    const currentAnswers = answersRef.current
    const { attemptId } = await startQuizAttempt(quiz.id)
    if (attemptId) {
      await submitQuizAnswers(attemptId, Object.entries(currentAnswers).map(
        ([questionId, selectedOptionId]) => ({ questionId, selectedOptionId })
      ), stableQuestions.length)
    }
    sessionStorage.removeItem(storageKey)
    router.push(effectiveBackUrl)
  }

  useEffect(() => {
    if (!started || result) return

    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      e.preventDefault()
    }

    window.history.pushState(null, '', window.location.href)

    const handlePopState = () => {
      const confirmed = window.confirm(
        'テストを中断すると、現在までの回答内容でそのまま提出されます。よろしいですか？'
      )
      if (confirmed) {
        window.removeEventListener('popstate', handlePopState)
        window.removeEventListener('beforeunload', handleBeforeUnload)
        exitSubmitRef.current?.()
      } else {
        window.history.pushState(null, '', window.location.href)
      }
    }

    window.addEventListener('beforeunload', handleBeforeUnload)
    window.addEventListener('popstate', handlePopState)

    return () => {
      window.removeEventListener('beforeunload', handleBeforeUnload)
      window.removeEventListener('popstate', handlePopState)
    }
  }, [started, result])

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
    if (result.results) {
      return (
        <QuizReviewMode
          quizTitle={quiz.title}
          score={result.score}
          correctCount={result.correctCount}
          totalCount={result.totalCount}
          passed={result.passed}
          questions={stableQuestions}
          results={result.results}
          onRetry={handleRetry}
          onBack={() => router.push(effectiveBackUrl)}
          backLabel={backLabel}
          hideRetry={hideRetry}
        />
      )
    }
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
        hideRetry={hideRetry}
      />
    )
  }

  if (!currentQuestion) return null

  // Start screen — shown before quiz begins
  if (!started) {
    return (
      <div className="mx-auto max-w-2xl">
        <div className="rounded-xl bg-white p-8 shadow-lg dark:bg-gray-900">
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
            className="mt-6 inline-flex items-center gap-2 rounded-xl bg-blue-600 px-6 py-3 text-base font-semibold text-white shadow-sm transition-colors hover:bg-blue-700"
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
    <div
      className={`mx-auto max-w-2xl ${started && !result ? 'select-none' : ''}`}
      style={started && !result ? { userSelect: 'none', WebkitUserSelect: 'none', WebkitTouchCallout: 'none' } as React.CSSProperties : undefined}
    >
      {/* Sticky timer bar (timed quizzes only) */}
      {quiz.time_limit_minutes ? (
        <div className="sticky top-0 z-10 mb-4 flex items-center justify-between rounded-xl border border-gray-200 bg-white/90 px-4 py-3 shadow-md backdrop-blur dark:border-white/[0.08] dark:bg-zinc-900/90">
          <span className="text-sm text-zinc-500 dark:text-zinc-400">
            回答: {answeredCount}/{stableQuestions.length}
          </span>
          <span className={`text-lg font-mono font-bold ${isTimeLow ? 'text-red-500 animate-pulse' : 'text-zinc-900 dark:text-zinc-100'}`}>
            {String(minutes).padStart(2, '0')}:{String(seconds).padStart(2, '0')}
          </span>
          <button
            onClick={handleSubmit}
            disabled={!allAnswered || submitting}
            className="inline-flex items-center gap-1.5 rounded-lg bg-blue-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
          >
            <Send className="h-3.5 w-3.5" />
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
      <div className="mb-6">
        <div className="mb-1.5 text-xs font-medium text-gray-500 dark:text-gray-400">
          {answeredCount}/{stableQuestions.length} 回答済み
        </div>
        <div className="h-1.5 rounded-full bg-gray-200 dark:bg-gray-700">
          <div
            className="h-1.5 rounded-full bg-blue-600 transition-all"
            style={{ width: `${(answeredCount / stableQuestions.length) * 100}%` }}
          />
        </div>
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
              {hasPlayed ? (
                <span className="flex items-center gap-2 rounded-xl bg-gray-100 px-3 py-1.5 text-sm font-medium text-gray-500 dark:bg-gray-700 dark:text-gray-400">
                  <CheckCircle className="h-4 w-4" />
                  再生済み
                </span>
              ) : playState === 'loading' ? (
                <button
                  disabled
                  className="flex items-center gap-2 rounded-xl bg-purple-100 px-3 py-1.5 text-sm font-medium text-purple-400 dark:bg-purple-900/30 dark:text-purple-300"
                >
                  <Loader2 className="h-4 w-4 animate-spin" />
                  読み込み中...
                </button>
              ) : playState === 'playing' ? (
                <span className="flex items-center gap-2 rounded-xl bg-purple-100 px-3 py-1.5 text-sm font-medium text-purple-600 dark:bg-purple-900/30 dark:text-purple-300">
                  <Loader2 className="h-4 w-4 animate-spin" />
                  再生中...
                </span>
              ) : (
                <button
                  onClick={() => handlePlay(script)}
                  className="flex items-center gap-2 rounded-xl bg-purple-600 px-3 py-1.5 text-sm font-medium text-white hover:bg-purple-700"
                >
                  <Play className="h-4 w-4" />
                  再生
                </button>
              )}

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
      <div className="mt-4 rounded-xl border border-gray-200 bg-white p-3 shadow-sm dark:border-gray-700 dark:bg-gray-900">
        <div className="flex items-center justify-between">
          <button
            onClick={() => setCurrentIndex(Math.max(0, currentIndex - 1))}
            disabled={currentIndex === 0}
            className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-2 text-sm font-medium text-gray-600 transition-all hover:border-gray-300 hover:bg-gray-50 disabled:opacity-40 dark:border-gray-600 dark:text-gray-300 dark:hover:border-gray-500 dark:hover:bg-gray-800"
          >
            <ChevronLeft className="h-4 w-4" />
            前の問題
          </button>

          <div className="flex flex-wrap justify-center gap-1.5">
            {stableQuestions.map((q, i) => (
              <button
                key={q.id}
                onClick={() => setCurrentIndex(i)}
                className={`h-9 w-9 rounded-full text-xs font-medium transition-all ${
                  i === currentIndex
                    ? 'bg-blue-600 text-white ring-2 ring-blue-600 ring-offset-2 dark:ring-offset-gray-900'
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
              className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 px-3 py-2 text-sm font-medium text-gray-600 transition-all hover:border-gray-300 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:border-gray-500 dark:hover:bg-gray-800"
            >
              次の問題
              <ChevronRight className="h-4 w-4" />
            </button>
          ) : (
            <button
              onClick={handleSubmit}
              disabled={!allAnswered || submitting}
              className="inline-flex items-center gap-1.5 rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white transition-colors hover:bg-blue-700 disabled:opacity-50"
            >
              <Send className="h-3.5 w-3.5" />
              {submitting ? '提出中...' : '提出する'}
            </button>
          )}
        </div>
      </div>
    </div>
  )
}
