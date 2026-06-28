'use client'

import { useState, useEffect, useCallback, useRef } from 'react'
import { startExam, submitExam, requestRetakeExam, loadExamQuestions, saveExamProgress, loadMockReview } from '@/app/actions/comprehensive-exam'
import { submitQuestionClaim } from '@/app/actions/claims'
import { useRouter } from 'next/navigation'
import Card from '@/components/ui/Card'
import QuizQuestion from '@/components/quiz/QuizQuestion'
import { LogOut, ChevronDown } from 'lucide-react'

interface ExamData {
  id: string
  status: string
  time_limit_minutes: number
  total_questions: number
  passing_score: number
  started_at: string | null
  exam_cycle_id?: string | null
  content_level?: string | null
  category?: string | null
}

interface Question {
  id: string
  question_text: string
  question_category?: string | null
  section?: string | null
  section_label?: string | null
  options: { id: string; option_text: string; sort_order: number }[]
}

/**
 * Parse listening question: split into script (for TTS) and question (for display).
 * Format: "次の会話を聞いて...\n\n[dialogue]\n\n質問？"
 */
function parseListeningQuestion(text: string): { script: string; question: string } | null {
  const normalized = text.replace(/\\n/g, '\n')

  // 1차: \n\n 블록 분리 (double newline format)
  const parts = normalized.split('\n\n')
  if (parts.length >= 2) {
    const question = parts[parts.length - 1]
    const script = parts.slice(0, parts.length - 1).join('\n\n')
    if (script.trim()) return { script, question }
  }

  // 2차 폴백: 단일 \n 형식 — 마지막 "質問" 줄을 경계로 분리
  const lines = normalized.split('\n')
  for (let i = lines.length - 1; i >= 0; i--) {
    const trimmed = lines[i].trim()
    if (trimmed.startsWith('質問') || trimmed.startsWith('問い')) {
      const script = lines.slice(0, i).join('\n')
      const question = lines.slice(i).join('\n')
      if (script.trim()) return { script, question }
    }
  }

  return null
}

/** Inline TTS player for listening questions — play state lifted to parent */
function ListeningPlayer({ script, questionId, alreadyPlayed, onPlayed, autoPlay = false }: {
  script: string
  questionId: string
  alreadyPlayed: boolean
  onPlayed: (questionId: string) => void
  autoPlay?: boolean
}) {
  const [playing, setPlaying] = useState(false)
  const [loading, setLoading] = useState(false)
  const audioRef = useRef<HTMLAudioElement | null>(null)
  const blobUrlRef = useRef<string | null>(null)
  const playingRef = useRef(false)
  const busyRef = useRef(false)
  const onPlayedRef = useRef(onPlayed)
  onPlayedRef.current = onPlayed

  const handlePlay = async () => {
    if (alreadyPlayed || busyRef.current) return
    busyRef.current = true

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
        playingRef.current = false
        setPlaying(false)
        onPlayedRef.current(questionId)
      }
      audio.play()
      playingRef.current = true
      setPlaying(true)
    } catch {
      console.error('TTS playback failed')
      busyRef.current = false
    } finally {
      setLoading(false)
    }
  }

  // autoPlay が true になったタイミングで自動再生（バナー閉じた後）
  useEffect(() => {
    if (!autoPlay || alreadyPlayed) return
    const timer = setTimeout(() => { void handlePlay() }, 400)
    return () => clearTimeout(timer)
  // handlePlay は毎回同一ロジック・busyRef でガード済み
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [autoPlay])

  // Cleanup on unmount only: pause audio, mark as played if was playing
  useEffect(() => {
    return () => {
      if (audioRef.current) {
        audioRef.current.pause()
        if (playingRef.current) {
          onPlayedRef.current(questionId)
        }
      }
      if (blobUrlRef.current) URL.revokeObjectURL(blobUrlRef.current)
    }
  // refs (playingRef, onPlayedRef, blobUrlRef) are intentionally not deps
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [questionId])

  return (
    <div className="mb-4 flex items-center gap-3 rounded-xl border border-indigo-500/20 bg-indigo-500/5 px-4 py-3">
      <button
        onClick={handlePlay}
        disabled={loading || alreadyPlayed || playing}
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
          {alreadyPlayed ? '再生済み (1/1)' : '再生回数: 0/1'}
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
  explanation?: string | null
}

interface SectionScore {
  label: string
  correct: number
  total: number
  scaled: number
  max: number
  passed: boolean
  accuracy: number
}

interface Props {
  exam: ExamData
  mode: 'start' | 'exam' | 'retake' | 'review'
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
  const [reviewScore, setReviewScore] = useState<{ score: number; correctCount: number; totalCount: number; passed: boolean; wrongCount?: number; unansweredCount?: number; partial?: boolean } | null>(null)
  const [sectionScores, setSectionScores] = useState<Record<string, SectionScore> | null>(null)
  const [claimedQuestions, setClaimedQuestions] = useState<Set<string>>(new Set())
  const [claimingId, setClaimingId] = useState<string | null>(null)
  const [expandedQuestions, setExpandedQuestions] = useState<Set<string>>(new Set())
  const [claimForms, setClaimForms] = useState<Set<string>>(new Set())
  const [claimReasons, setClaimReasons] = useState<Record<string, string>>({})
  const [claimError, setClaimError] = useState<string | null>(null)
  const [playedListeningIds, setPlayedListeningIds] = useState<Set<string>>(new Set())
  const [showListeningWarning, setShowListeningWarning] = useState(false)
  const [showChoukaiBanner, setShowChoukaiBanner] = useState(false)
  const enteredChoukaiBannerRef = useRef(false)
  const [showExitConfirm, setShowExitConfirm] = useState(false)
  const [lastSavedAt, setLastSavedAt] = useState<string | null>(null)
  const [savedTick, setSavedTick] = useState(0) // 상대시간 갱신용
  const [showNav, setShowNav] = useState(false)

  const totalQuestions = questions.length
  const currentQuestion = questions[currentIndex]
  const answeredCount = Object.keys(answers).length
  const isMock = questions.some(q => !!q.section)
  const isCurrentChoukai = currentQuestion?.section === 'choukai' || currentQuestion?.question_category === 'listening'

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
          // 중단→재개: 저장된 임시 답안 복원
          if ('draftAnswers' in res && res.draftAnswers && typeof res.draftAnswers === 'object') {
            setAnswers(res.draftAnswers as Record<string, string>)
          }
          if ('progressSavedAt' in res && res.progressSavedAt) setLastSavedAt(res.progressSavedAt as string)
        }
      })
    }
  // exam.time_limit_minutes is captured at start; remount on mode/exam.id change is sufficient
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [mode, exam.id])

  // 완료 시험 리뷰(結果) 로드
  useEffect(() => {
    if (mode !== 'review' || reviewMode) return
    loadMockReview(exam.id).then(res => {
      if ('error' in res) { setError(res.error ?? '結果の読み込みに失敗しました'); return }
      setQuestions(res.questions as Question[])
      setReviewResults(res.results)
      setReviewScore({ score: res.score, correctCount: res.correctCount, totalCount: res.totalCount, passed: res.passed, wrongCount: res.wrongCount, unansweredCount: res.unansweredCount, partial: false })
      if (res.sectionScores) setSectionScores(res.sectionScores as Record<string, SectionScore>)
      setReviewMode(true)
    })
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [mode, exam.id])

  // 모의시험: 진행상황 자동 저장(20초마다)
  useEffect(() => {
    if (!isMock || !started || submitting || reviewMode || questions.length === 0) return
    const save = () => {
      const arr = questions.map(q => ({ questionId: q.id, selectedOptionId: answersRef.current[q.id] ?? '' })).filter(a => a.selectedOptionId !== '')
      saveExamProgress(exam.id, arr).then(r => { if (r && 'savedAt' in r && r.savedAt) setLastSavedAt(r.savedAt as string) })
    }
    const iv = setInterval(save, 20000)
    return () => clearInterval(iv)
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [isMock, started, submitting, reviewMode, questions.length])

  // 聴解セクション突入を検知してバナー表示
  useEffect(() => {
    if (!started || reviewMode || !currentQuestion) return
    const isChoukai = currentQuestion.section === 'choukai' || currentQuestion.question_category === 'listening'
    if (isChoukai && !enteredChoukaiBannerRef.current) {
      enteredChoukaiBannerRef.current = true
      setShowChoukaiBanner(true)
    }
  // currentIndex 変化時に評価（currentQuestion は currentIndex に従属）
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [currentIndex, started, reviewMode])

  // 종료 확인창이 열려 있는 동안 "N초 전" 갱신
  useEffect(() => {
    if (!showExitConfirm) return
    const iv = setInterval(() => setSavedTick(t => t + 1), 5000)
    return () => clearInterval(iv)
  }, [showExitConfirm])

  // 저장 후 종료(제출 안 함, 나중에 재개 가능)
  const handleExitSave = useCallback(async () => {
    const arr = questions.map(q => ({ questionId: q.id, selectedOptionId: answersRef.current[q.id] ?? '' })).filter(a => a.selectedOptionId !== '')
    await saveExamProgress(exam.id, arr)
    hasSubmittedRef.current = true // 이탈 경고/자동제출 가드 우회(저장 완료)
    // 바로 전화면(해당 레벨 모의시험 목록)으로
    window.location.href = exam.content_level ? `/japanese/jlpt/quiz?level=${exam.content_level}` : '/japanese/jlpt'
  }, [questions, exam.id, exam.content_level])

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
      setReviewScore({
        score: res.score, correctCount: res.correctCount, totalCount: res.totalCount,
        passed: 'passed' in res ? res.passed : false,
        wrongCount: 'wrongCount' in res ? (res.wrongCount as number) : undefined,
        unansweredCount: 'unansweredCount' in res ? (res.unansweredCount as number) : undefined,
        partial: 'partial' in res ? !!res.partial : false,
      })
      if ('sectionScores' in res && res.sectionScores) setSectionScores(res.sectionScores as Record<string, SectionScore>)
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
        const loadedQuestions = res.questions as Question[]
        setQuestions(loadedQuestions)
        setRemainingSeconds(res.timeLimit! * 60)
        const hasListening = loadedQuestions.some(q => q.question_category === 'listening')
        const isMockExam = loadedQuestions.some(q => !!q.section)
        // モック試験は聴解バナーで通知するため pre-start 警告をスキップ
        if (hasListening && !isMockExam) {
          setShowListeningWarning(true)
          setSubmitting(false)
        } else {
          setStarted(true)
          setSubmitting(false)
        }
      }
    })
  }

  function handleListeningConfirm() {
    setShowListeningWarning(false)
    setStarted(true)
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

        {showListeningWarning && (
          <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm" onClick={() => {}}>
            <div className="mx-4 w-full max-w-md rounded-2xl border border-gray-200/60 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
              <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">
                リスニング問題のご注意
              </h3>
              <div className="mt-4 space-y-2 text-sm text-zinc-600 dark:text-zinc-400">
                <p>このテストにはリスニング問題が含まれています。</p>
                <p>音声は1問あたり1回のみ再生可能です。</p>
                <p>準備ができたら開始してください。</p>
              </div>
              <div className="mt-6 flex justify-end gap-3">
                <button
                  onClick={() => { setShowListeningWarning(false); window.history.back() }}
                  className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5 transition-colors"
                >
                  キャンセル
                </button>
                <button
                  onClick={handleListeningConfirm}
                  className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
                >
                  開始する
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    )
  }

  // ==================== REVIEW MODE ====================
  if (reviewMode && reviewResults && reviewScore) {
    const resultMap = new Map(reviewResults.map(r => [r.questionId, r]))

    return (
      <div className="mx-auto max-w-3xl">
        <button
          onClick={() => { window.location.href = isMock && exam.content_level ? `/japanese/jlpt/quiz?level=${exam.content_level}` : '/dashboard' }}
          className="mb-4 inline-flex items-center gap-1 text-sm text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200"
        >
          ← {isMock ? '模擬試験一覧へ戻る' : 'ダッシュボードへ'}
        </button>
        {/* Review Header */}
        <div className="mb-6">
          <p className="text-sm font-medium text-indigo-400">総合試験 — 結果レビュー</p>
          {examLabel && (
            <h1 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{examLabel}</h1>
          )}
          <div className="mt-3 flex flex-wrap items-center gap-4">
            <div className="rounded-xl bg-zinc-100 border border-gray-200 px-4 py-2 dark:bg-white/[0.03] dark:border-white/[0.08]">
              <span className="text-2xl font-bold text-zinc-900 dark:text-zinc-100">{reviewScore.score}</span>
              <span className="text-sm text-zinc-500 dark:text-zinc-400">{sectionScores ? ' / 180' : '点'}</span>
            </div>
            <div className="flex gap-3 text-sm text-zinc-500 dark:text-zinc-400">
              {reviewScore.wrongCount != null || reviewScore.unansweredCount != null ? (
                <>
                  <span className="text-emerald-600 dark:text-emerald-400">正解 {reviewScore.correctCount}</span>
                  <span className="text-red-600 dark:text-red-400">不正解 {reviewScore.wrongCount ?? 0}</span>
                  <span>未回答 {reviewScore.unansweredCount ?? 0}</span>
                </>
              ) : (
                <span>{reviewScore.correctCount}/{reviewScore.totalCount} 正解</span>
              )}
            </div>
            {reviewScore.partial ? (
              <div className="rounded-full bg-amber-500/20 px-3 py-1 text-sm font-semibold text-amber-600 dark:text-amber-300">
                進行中（聴解を受験すると最終判定）
              </div>
            ) : (
              <div className={`rounded-full px-3 py-1 text-sm font-semibold ${reviewScore.passed ? 'bg-emerald-500/20 text-emerald-600 dark:text-emerald-300' : 'bg-red-500/20 text-red-600 dark:text-red-300'}`}>
                {reviewScore.passed ? '合格' : '不合格'}
              </div>
            )}
          </div>

          {/* 영역별 환산점수 (言語知識・読解・聴解, 실제 JLPT식 /60·/120) */}
          {sectionScores && (() => {
            const ss = sectionScores
            const rows = (['gengo_chishiki', 'dokkai', 'gengo_dokkai', 'choukai']).filter(k => ss[k]).map(k => ss[k])
            return (
              <div className="mt-4 space-y-2">
                {rows.map(s => (
                  <div key={s.label} className={`flex items-center justify-between rounded-lg border px-3 py-2 text-sm ${s.passed ? 'border-emerald-500/30 bg-emerald-500/5' : 'border-red-500/30 bg-red-500/5'}`}>
                    <span className="font-medium text-zinc-800 dark:text-zinc-200">{s.label}</span>
                    <span className="flex items-center gap-2">
                      <span className="font-semibold text-zinc-700 dark:text-zinc-300">{s.scaled} / {s.max}点</span>
                      <span className={`rounded-full px-2 py-0.5 text-xs font-semibold ${s.passed ? 'bg-emerald-500/20 text-emerald-600 dark:text-emerald-300' : 'bg-red-500/20 text-red-600 dark:text-red-300'}`}>{s.passed ? '合格' : '不合格'}</span>
                    </span>
                  </div>
                ))}
                <p className="text-xs text-zinc-400">※ 各領域が基準点以上、かつ総合点が基準以上で合格です。</p>
              </div>
            )
          })()}
        </div>

        {/* Question Review List */}
        <div className="space-y-3">
          {questions.map((q, i) => {
            const r = resultMap.get(q.id)
            const isCorrect = r?.isCorrect ?? false
            const wasAnswered = !!(r && r.selectedOptionId)
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

                    {/* Explanation */}
                    {r?.explanation && (
                      <div className="mt-3 rounded-lg bg-blue-50 p-3 text-sm text-blue-800 dark:bg-blue-900/20 dark:text-blue-300">
                        <span className="font-medium">解説: </span>{r.explanation}
                      </div>
                    )}

                    {/* Claim section */}
                    <div className="mt-3">
                      {isClaimed ? (
                        <div className="flex justify-end">
                          <span className="rounded-lg bg-zinc-100 px-3 py-1.5 text-xs font-medium text-zinc-400 dark:bg-zinc-800 dark:text-zinc-500">
                            問い合わせ送信済み
                          </span>
                        </div>
                      ) : claimForms.has(q.id) ? (
                        <div className="rounded-lg border border-amber-500/20 bg-amber-500/5 p-3">
                          <textarea
                            placeholder="問い合わせ理由（任意）"
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
                            問題に問い合わせ
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

  void savedTick
  const savedAgo = !lastSavedAt
    ? '保存されていません'
    : (() => {
        const s = Math.max(0, Math.floor((Date.now() - new Date(lastSavedAt).getTime()) / 1000))
        return s < 60 ? `${s}秒前` : `${Math.floor(s / 60)}分前`
      })()

  return (
    <div
      className="mx-auto max-w-3xl"
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
            <p className="text-xs font-medium text-indigo-400">{currentQuestion?.section_label ?? '総合試験'}</p>
          </div>
          <div className={`flex items-center gap-2 ${isTimeCritical || isTimeLow ? 'animate-pulse' : ''}`}>
            <span className={`rounded-lg px-3 py-1 text-sm font-bold ${timerText}`}>
              残り {minutes}分{seconds > 0 ? ` ${seconds}秒` : ''}
            </span>
          </div>
          <div className="flex items-center gap-3">
            <span className="text-sm text-zinc-600 dark:text-zinc-300">
              回答: <span className="font-semibold">{answeredCount}/{totalQuestions}</span>
            </span>
            {isMock && (
              <button onClick={() => setShowExitConfirm(true)} title="中断して保存" className="rounded-md border border-red-300 p-1 text-red-500 hover:bg-red-50 dark:border-red-500/40 dark:hover:bg-red-500/10">
                <LogOut className="h-4 w-4" />
              </button>
            )}
          </div>
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

      {/* Question navigation (클릭하면 드롭다운) */}
      <div className="mb-6">
        <button
          onClick={() => setShowNav(v => !v)}
          className="flex w-full items-center justify-between rounded-lg border border-gray-200 bg-white px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-50 dark:border-white/[0.08] dark:bg-white/[0.03] dark:text-zinc-200 dark:hover:bg-white/5"
        >
          <span>問題 {currentIndex + 1} / {totalQuestions}（回答 {answeredCount}）</span>
          <ChevronDown className={`h-4 w-4 transition-transform ${showNav ? 'rotate-180' : ''}`} />
        </button>
        {showNav && (
          <div className="mt-2 flex flex-wrap gap-1.5 rounded-lg border border-gray-200 bg-white p-3 dark:border-white/[0.08] dark:bg-white/[0.03]">
            {questions.map((q, i) => (
              <button
                key={q.id}
                onClick={() => { setCurrentIndex(i); setShowNav(false) }}
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
        )}
      </div>

      {/* Current question */}
      {currentQuestion && (() => {
        const isListening = currentQuestion.question_category === 'listening'
        const parsed = isListening ? parseListeningQuestion(currentQuestion.question_text) : null

        return (
          <div className="rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md p-6 dark:border-white/[0.08] dark:bg-white/[0.03]">
            {currentQuestion.section_label && (
              <div className="mb-3 inline-flex rounded-full bg-indigo-500/10 px-3 py-1 text-xs font-semibold text-indigo-600 dark:text-indigo-300">
                {currentQuestion.section_label}
              </div>
            )}
            {isListening && parsed && (
              <ListeningPlayer
                key={currentQuestion.id}
                script={parsed.script}
                questionId={currentQuestion.id}
                alreadyPlayed={playedListeningIds.has(currentQuestion.id)}
                onPlayed={id => setPlayedListeningIds(prev => new Set(prev).add(id))}
                autoPlay={!showChoukaiBanner}
              />
            )}
            <QuizQuestion
              questionNumber={currentIndex + 1}
              totalQuestions={totalQuestions}
              questionText={isListening && parsed ? parsed.question : currentQuestion.question_text}
              options={currentQuestion.options}
              selectedOptionId={answers[currentQuestion.id] ?? null}
              onSelect={handleSelect}
              boxPassages={!!currentQuestion.section && !isListening}
              hideMeta={!!currentQuestion.section}
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

      {/* 聴解セクション開始バナー */}
      {showChoukaiBanner && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm">
          <div className="mx-4 w-full max-w-md rounded-2xl bg-white p-6 shadow-xl dark:bg-zinc-900 text-center">
            <div className="mb-3 flex h-14 w-14 items-center justify-center rounded-full bg-indigo-500/10 mx-auto">
              <svg className="h-7 w-7 text-indigo-600 dark:text-indigo-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15.536 8.464a5 5 0 010 7.072M12 9.5v5M9 11l-.64-.64A2 2 0 017 8.858V7a5 5 0 0110 0v1.858a2 2 0 01-.36 1.502L15 11" />
              </svg>
            </div>
            <h3 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">聴解試験を開始します</h3>
            <div className="mt-4 space-y-2 text-sm text-zinc-600 dark:text-zinc-400">
              <p>これより聴解問題が始まります。</p>
              <p>音声は各問 <span className="font-semibold text-zinc-800 dark:text-zinc-200">1回のみ</span> 自動再生されます。</p>
              <p className="text-xs text-zinc-400 dark:text-zinc-500">音量を確認してから「開始する」を押してください。</p>
            </div>
            <button
              onClick={() => {
                // ブラウザの autoplay ポリシーを解除（ユーザージェスチャー内で AudioContext を unlock）
                try {
                  const Ctx = window.AudioContext ?? (window as unknown as { webkitAudioContext: typeof AudioContext }).webkitAudioContext
                  if (Ctx) { const ctx = new Ctx(); void ctx.resume(); void ctx.close() }
                } catch (_) {}
                setShowChoukaiBanner(false)
              }}
              className="mt-6 rounded-xl bg-indigo-600 px-8 py-3 text-base font-medium text-white hover:bg-indigo-500 transition-colors"
            >
              開始する
            </button>
          </div>
        </div>
      )}

      {/* 中断（保存して終了）確認 */}
      {showExitConfirm && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm p-4" onClick={() => setShowExitConfirm(false)}>
          <div className="w-full max-w-md rounded-2xl bg-white p-6 shadow-xl dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
            <div className="flex items-center gap-2 text-zinc-900 dark:text-zinc-100">
              <span className="text-red-500 font-bold">✕</span>
              <h3 className="text-lg font-bold">確認</h3>
            </div>
            <div className="mt-4 space-y-1 text-center text-sm text-zinc-600 dark:text-zinc-300">
              <p>解答を提出せずにセッションを終了しますか？</p>
              <p>進行状況は保存されたので、後で続行することができます。</p>
              <p className="text-xs text-zinc-400">最後に保存された時間: <span className="text-red-500">{savedAgo}</span></p>
            </div>
            <div className="mt-5 space-y-2">
              <button onClick={handleExitSave} className="block w-full rounded-lg bg-red-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-red-500 transition-colors">終了する</button>
              <button onClick={() => setShowExitConfirm(false)} className="block w-full rounded-lg border border-red-300 px-4 py-2.5 text-sm font-medium text-red-600 hover:bg-red-50 dark:border-red-500/40 dark:text-red-400 dark:hover:bg-red-500/10 transition-colors">戻る</button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
