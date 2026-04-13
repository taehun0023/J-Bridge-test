'use client'

import { useState, useEffect, useRef, useCallback, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import { MessageSquare } from 'lucide-react'
import Card from '@/components/ui/Card'
import { submitWritingAnswer, submitWritingClaim, completeWritingAttempt } from '@/app/actions/writing'
import { scoreWriting } from '@/lib/writing-scorer'
import type { WritingItem } from '@/app/actions/writing'

const CATEGORY_BADGES: Record<string, { label: string; color: string }> = {
  expression: { label: '表現', color: 'bg-blue-100 text-blue-700 dark:bg-blue-900/40 dark:text-blue-300' },
  sentence_pattern: { label: '文型', color: 'bg-green-100 text-green-700 dark:bg-green-900/40 dark:text-green-300' },
  keigo: { label: '敬語', color: 'bg-purple-100 text-purple-700 dark:bg-purple-900/40 dark:text-purple-300' },
}

interface AnswerRecord {
  userAnswer: string
  score: number
  keywordHits: string[]
  keywordMisses: string[]
  memo: string
  claimed: boolean
}

type Phase = 'start' | 'question' | 'result' | 'summary'

const BACK_URL = '/japanese/business/writing'
const TIME_LIMIT_MINUTES = 25
const TIME_LIMIT_SECONDS = TIME_LIMIT_MINUTES * 60

export default function WritingTestClient({ questions, attemptId }: { questions: WritingItem[]; attemptId: string }) {
  const router = useRouter()
  const [phase, setPhase] = useState<Phase>('start')
  const [currentIndex, setCurrentIndex] = useState(0)
  const [userInput, setUserInput] = useState('')
  const [answers, setAnswers] = useState<AnswerRecord[]>([])
  const [currentResult, setCurrentResult] = useState<AnswerRecord | null>(null)
  const [claimContent, setClaimContent] = useState('')
  const [showClaimModal, setShowClaimModal] = useState(false)
  const [isPending, startTransition] = useTransition()
  const [completed, setCompleted] = useState(false)
  const [timeLeft, setTimeLeft] = useState(TIME_LIMIT_SECONDS)
  const [timerPaused, setTimerPaused] = useState(false)

  const question = questions[currentIndex]
  const badge = CATEGORY_BADGES[question?.category]
  const total = questions.length
  const answersRef = useRef(answers)
  answersRef.current = answers
  const currentResultRef = useRef(currentResult)
  currentResultRef.current = currentResult
  const completedRef = useRef(completed)
  completedRef.current = completed

  // Timer
  useEffect(() => {
    if (phase === 'start' || phase === 'summary' || timerPaused || completed) return
    if (timeLeft <= 0) {
      // Time's up — auto-submit
      const scores = answersRef.current.map(a => a.score)
      if (currentResultRef.current) scores.push(currentResultRef.current.score)
      completeWritingAttempt(attemptId, scores).then(() => setCompleted(true))
      setPhase('summary')
      return
    }
    const timer = setInterval(() => setTimeLeft(t => t - 1), 1000)
    return () => clearInterval(timer)
  }, [phase, timeLeft, timerPaused, completed, attemptId])

  // Abandonment handler
  useEffect(() => {
    if (phase === 'start') return
    const handleBeforeUnload = (e: BeforeUnloadEvent) => {
      if (!completedRef.current) e.preventDefault()
    }
    const handlePopState = () => {
      if (completedRef.current) return
      if (confirm('テストを中断すると、現在までの回答内容でそのまま提出されます。よろしいですか？')) {
        const scores = answersRef.current.map(a => a.score)
        if (currentResultRef.current) scores.push(currentResultRef.current.score)
        completeWritingAttempt(attemptId, scores).then(() => {
          setCompleted(true)
          router.push(BACK_URL)
        })
      } else {
        history.pushState(null, '', location.href)
      }
    }
    history.pushState(null, '', location.href)
    window.addEventListener('beforeunload', handleBeforeUnload)
    window.addEventListener('popstate', handlePopState)
    return () => {
      window.removeEventListener('beforeunload', handleBeforeUnload)
      window.removeEventListener('popstate', handlePopState)
    }
  }, [phase, attemptId, router])

  function handleSubmit() {
    if (!userInput.trim() || !question) return

    const modelAnswer = question.example_sentence
    const result = scoreWriting(userInput, modelAnswer)

    setCurrentResult({
      userAnswer: userInput,
      score: result.score,
      keywordHits: result.keywordHits,
      keywordMisses: result.keywordMisses,
      memo: '',
      claimed: false,
    })
    setPhase('result')

    // Save exercise result
    startTransition(async () => {
      await submitWritingAnswer({
        glossaryId: question.id,
        userAnswer: userInput,
        modelAnswer: question.example_sentence,
        memo: undefined,
      })
    })
  }

  function handleNext() {
    if (!currentResult || !question) return
    setAnswers(prev => [...prev, { ...currentResult, memo: '', claimed: false }])

    if (currentIndex + 1 < total) {
      setCurrentIndex(prev => prev + 1)
      setPhase('question')
      setUserInput('')
      setClaimContent('')
      setCurrentResult(null)
    } else {
      setPhase('summary')
    }
  }

  function handleClaim() {
    if (!currentResult || !question || !claimContent.trim()) return

    startTransition(async () => {
      const questionText = question.example_sentence_ko ?? question.term_ko
      await submitWritingClaim({
        questionText,
        userAnswer: currentResult.userAnswer,
        autoScore: currentResult.score,
        claimContent: claimContent,
      })
      setAnswers(prev => [...prev, { ...currentResult, memo: claimContent, claimed: true }])

      if (currentIndex + 1 < total) {
        setCurrentIndex(prev => prev + 1)
        setPhase('question')
        setUserInput('')
        setClaimContent('')
        setCurrentResult(null)
      } else {
        setPhase('summary')
      }
    })
  }

  // Complete attempt when entering summary
  useEffect(() => {
    if (phase === 'summary' && !completed) {
      const scores = answers.map(a => a.score)
      completeWritingAttempt(attemptId, scores).then(() => setCompleted(true))
    }
  }, [phase, completed, answers, attemptId])

  // Start screen
  if (phase === 'start') {
    return (
      <div className="mx-auto max-w-2xl">
        <div className="rounded-xl bg-white p-8 shadow-lg dark:bg-gray-900">
          <h1 className="text-xl font-bold text-gray-900 dark:text-white">作文 理解度テスト</h1>
          <div className="mt-4 space-y-2 text-sm text-gray-600 dark:text-gray-400">
            <p>問題数: <span className="font-medium text-gray-900 dark:text-white">{total}問</span></p>
            <p>合格点: <span className="font-medium text-gray-900 dark:text-white">70点（平均）</span></p>
            <p>制限時間: <span className="font-medium text-gray-900 dark:text-white">{TIME_LIMIT_MINUTES}分</span></p>
          </div>
          <p className="mt-4 flex items-center gap-1.5 text-xs text-amber-600 dark:text-amber-400">
            開始後、タイマーが自動的にスタートします
          </p>
          <button
            onClick={() => setPhase('question')}
            className="mt-6 inline-flex items-center gap-2 rounded-xl bg-indigo-600 px-6 py-3 text-base font-semibold text-white shadow-sm transition-colors hover:bg-indigo-500"
          >
            開始
          </button>
        </div>
      </div>
    )
  }

  // Summary phase
  if (phase === 'summary') {
    const avgScore = answers.length > 0
      ? Math.round(answers.reduce((sum, a) => sum + a.score, 0) / answers.length)
      : 0
    const lowScoreItems = answers
      .map((a, i) => ({ ...a, index: i, question: questions[i] }))
      .filter(a => a.score < 70)
    const claimedCount = answers.filter(a => a.claimed).length

    return (
      <div className="mx-auto max-w-2xl">
        <Card>
          <div className="flex items-center gap-3">
            <h2 className="text-xl font-bold text-gray-900 dark:text-white">結果まとめ</h2>
            <span className={`rounded-full px-3 py-1 text-sm font-bold ${
              avgScore >= 70
                ? 'bg-emerald-100 text-emerald-700 dark:bg-emerald-900/40 dark:text-emerald-300'
                : 'bg-red-100 text-red-700 dark:bg-red-900/40 dark:text-red-300'
            }`}>
              {avgScore >= 70 ? '合格' : '不合格'}
            </span>
          </div>
          <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{total}問完了（合格ライン: 70点）</p>

          <div className="mt-4 grid grid-cols-2 gap-4">
            <div className="rounded-lg bg-gray-50 p-4 text-center dark:bg-gray-800/50">
              <p className="text-sm text-gray-500 dark:text-gray-400">平均スコア</p>
              <p className={`mt-1 text-2xl font-bold ${
                avgScore >= 70 ? 'text-emerald-600' : avgScore >= 40 ? 'text-amber-600' : 'text-red-600'
              }`}>{avgScore}点</p>
            </div>
            <div className="rounded-lg bg-gray-50 p-4 text-center dark:bg-gray-800/50">
              <p className="text-sm text-gray-500 dark:text-gray-400">問い合わせ</p>
              <p className="mt-1 text-2xl font-bold text-amber-600">{claimedCount}件</p>
            </div>
          </div>

          {lowScoreItems.length > 0 && (
            <div className="mt-6">
              <h3 className="text-sm font-semibold text-gray-700 dark:text-gray-300">
                70点未満の問題 ({lowScoreItems.length})
              </h3>
              <div className="mt-2 space-y-2">
                {lowScoreItems.map(item => (
                  <div key={item.index} className="rounded-lg border border-amber-200 p-3 dark:border-amber-800/50">
                    <div className="flex items-center justify-between">
                      <p className="text-sm font-medium text-gray-900 dark:text-white">
                        問{item.index + 1}: {item.question.term_ko}
                      </p>
                      <span className="text-sm font-bold text-amber-600">{item.score}点</span>
                    </div>
                    {item.memo && (
                      <p className="mt-1 text-xs text-gray-500 italic">{item.memo}</p>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}

          <div className="mt-6 flex gap-3">
            <Link
              href="/japanese/business/writing/test"
              className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500"
            >
              もう一度
            </Link>
            <Link
              href="/japanese/business/writing"
              className="rounded-lg border border-gray-200 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-700 dark:text-gray-300 dark:hover:bg-gray-800"
            >
              一覧に戻る
            </Link>
          </div>
        </Card>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-2xl">
      {/* Progress + Timer */}
      <div className="mb-4 flex items-center justify-between text-sm text-gray-500 dark:text-gray-400">
        <span>作文テスト</span>
        <div className="flex items-center gap-3">
          <span className={`font-mono tabular-nums ${timeLeft < 300 ? 'font-bold text-red-600 dark:text-red-400' : ''}`}>
            {Math.floor(timeLeft / 60).toString().padStart(2, '0')}:{(timeLeft % 60).toString().padStart(2, '0')}
          </span>
          <span>{currentIndex + 1} / {total}</span>
        </div>
      </div>
      <div className="mb-6 h-1.5 rounded-full bg-gray-200 dark:bg-gray-700">
        <div
          className="h-1.5 rounded-full bg-indigo-500 transition-all duration-300"
          style={{ width: `${((currentIndex + (phase === 'result' ? 1 : 0)) / total) * 100}%` }}
        />
      </div>

      <Card>
        {/* Question prompt */}
        <div className="flex items-center gap-2">
          {badge && (
            <span className={`inline-flex rounded-md px-2 py-0.5 text-xs font-medium ${badge.color}`}>
              {badge.label}
            </span>
          )}
        </div>

        <p className="mt-3 text-lg font-medium text-gray-900 dark:text-white">
          {question.example_sentence_ko ?? question.term_ko}
        </p>

        {question.description && (
          <p className="mt-2 text-sm text-gray-500 dark:text-gray-400">
            <span className="font-medium text-gray-600 dark:text-gray-300">状況: </span>
            {question.description}
          </p>
        )}

        {phase === 'question' && (
          <>
            <textarea
              value={userInput}
              onChange={(e) => setUserInput(e.target.value)}
              placeholder="日本語で書いてください..."
              rows={3}
              className="mt-4 w-full rounded-lg border border-gray-300 bg-white p-3 text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
            />
            <button
              onClick={handleSubmit}
              disabled={!userInput.trim()}
              className="mt-3 w-full rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-medium text-white transition-colors hover:bg-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              提出
            </button>
          </>
        )}

        {phase === 'result' && currentResult && (
          <div className="mt-4 space-y-4">
            {/* Score */}
            <div className="flex items-center gap-3">
              <span className={`text-2xl font-bold ${
                currentResult.score >= 70 ? 'text-emerald-600 dark:text-emerald-400' :
                currentResult.score >= 40 ? 'text-amber-600 dark:text-amber-400' :
                'text-red-600 dark:text-red-400'
              }`}>
                {currentResult.score}点
              </span>
            </div>

            {/* Model answer */}
            <div className="rounded-lg bg-emerald-50 p-3 dark:bg-emerald-900/20">
              <p className="text-xs font-medium text-emerald-700 dark:text-emerald-400">模範答案</p>
              <p className="mt-1 text-sm text-emerald-900 dark:text-emerald-200">{question.example_sentence}</p>
              <p className="mt-1 text-xs text-emerald-600 dark:text-emerald-400">
                核心表現: {question.term_ja}
              </p>
            </div>

            {/* User answer */}
            <div className="rounded-lg bg-gray-50 p-3 dark:bg-gray-800/50">
              <p className="text-xs font-medium text-gray-500 dark:text-gray-400">自分の答え</p>
              <p className="mt-1 text-sm text-gray-900 dark:text-white">{currentResult.userAnswer}</p>
            </div>

            {/* Keyword analysis */}
            {(currentResult.keywordHits.length > 0 || currentResult.keywordMisses.length > 0) && (
              <div className="flex flex-wrap gap-1.5 text-xs">
                {currentResult.keywordHits.map((kw, i) => (
                  <span key={`h-${i}`} className="rounded-full bg-emerald-100 px-2 py-0.5 text-emerald-700 dark:bg-emerald-900/40 dark:text-emerald-300">{kw}</span>
                ))}
                {currentResult.keywordMisses.map((kw, i) => (
                  <span key={`m-${i}`} className="rounded-full bg-red-100 px-2 py-0.5 text-red-700 dark:bg-red-900/40 dark:text-red-300">{kw}</span>
                ))}
              </div>
            )}

            {/* Action buttons */}
            <div className="flex gap-3">
              <button
                onClick={() => { setClaimContent(''); setShowClaimModal(true); setTimerPaused(true) }}
                className="flex items-center justify-center gap-2 rounded-lg border border-amber-300 bg-amber-50 px-4 py-2.5 text-sm font-medium text-amber-700 transition-colors hover:bg-amber-100 dark:border-amber-700 dark:bg-amber-900/20 dark:text-amber-400 dark:hover:bg-amber-900/40"
              >
                <MessageSquare className="h-4 w-4" />
                問い合わせ
              </button>
              <button
                onClick={handleNext}
                disabled={isPending}
                className="flex flex-1 items-center justify-center gap-2 rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-medium text-white transition-colors hover:bg-indigo-500 disabled:opacity-50"
              >
                {currentIndex + 1 < total ? '次へ' : '結果を見る'}
              </button>
            </div>

            {/* Claim modal */}
            {showClaimModal && (
              <div
                className="fixed inset-0 z-50 flex items-center justify-center bg-black/50"
                onClick={e => { if (e.target === e.currentTarget) { setShowClaimModal(false); setTimerPaused(false) } }}
              >
                <div className="mx-4 w-full max-w-lg rounded-2xl bg-white p-6 shadow-xl dark:bg-gray-800">
                  <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-4">問い合わせ</h3>

                  <div className="rounded-lg border border-gray-200 bg-gray-50 p-3 text-xs text-gray-600 dark:border-gray-700 dark:bg-gray-800/50 dark:text-gray-400">
                    <p><span className="font-medium">ユーザー回答:</span> {currentResult.userAnswer}</p>
                    <p className="mt-1"><span className="font-medium">点数:</span> {currentResult.score}点</p>
                  </div>

                  <textarea
                    value={claimContent}
                    onChange={(e) => setClaimContent(e.target.value)}
                    placeholder="問い合わせ内容を入力..."
                    rows={3}
                    className="mt-3 w-full rounded-lg border border-gray-300 bg-white p-3 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-indigo-500 focus:outline-none focus:ring-1 focus:ring-indigo-500"
                    autoFocus
                  />

                  <div className="mt-4 flex gap-2 justify-end">
                    <button
                      onClick={() => { setShowClaimModal(false); setTimerPaused(false) }}
                      className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700"
                    >
                      キャンセル
                    </button>
                    <button
                      onClick={() => { setShowClaimModal(false); setTimerPaused(false); handleClaim() }}
                      disabled={isPending || !claimContent.trim()}
                      className="rounded-lg bg-amber-600 px-4 py-2 text-sm font-medium text-white hover:bg-amber-500 disabled:opacity-50"
                    >
                      送信
                    </button>
                  </div>
                </div>
              </div>
            )}
          </div>
        )}
      </Card>
    </div>
  )
}
