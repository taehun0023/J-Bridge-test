'use client'

import { useState, useTransition } from 'react'
import Link from 'next/link'
import Badge from '@/components/ui/Badge'
import { requestQuizRetake } from '@/app/actions/quiz-retake'

interface QuizInfo {
  id: string
  title: string
  passing_score: number
  time_limit_minutes: number | null
}

interface AttemptInfo {
  id: string
  score: number
  passed: boolean
  retake_request_status: string | null
}

interface Props {
  quiz: QuizInfo
  attempt: AttemptInfo | null
  quizHref: string
  userRole: string | null
}

export default function PracticeQuizCard({ quiz, attempt, quizHref, userRole }: Props) {
  const [pending, startTransition] = useTransition()
  const [localStatus, setLocalStatus] = useState<string | null>(attempt?.retake_request_status ?? null)
  const isAdminOrMentor = userRole === 'admin' || userRole === 'mentor'

  function handleRetakeRequest() {
    if (!attempt) return
    startTransition(async () => {
      const result = await requestQuizRetake(attempt.id)
      if (result.error) {
        alert(result.error)
      } else {
        setLocalStatus(isAdminOrMentor ? 'approved' : 'requested')
      }
    })
  }

  // Admin/mentor or no attempt yet or retake approved → link
  const canAccess = isAdminOrMentor || !attempt || localStatus === 'approved'

  if (canAccess) {
    return (
      <Link
        href={quizHref}
        className="group rounded-xl border border-gray-200 bg-white p-5 transition-shadow hover:shadow-md dark:border-gray-700 dark:bg-gray-800"
      >
        <div className="flex items-start justify-between">
          <h3 className="font-semibold text-gray-900 group-hover:text-blue-600 dark:text-white">
            {quiz.title}
          </h3>
          {attempt && (
            <Badge label={attempt.passed ? '合格' : '不合格'} variant="default" />
          )}
        </div>
        <div className="mt-3 flex items-center gap-3 text-sm text-gray-500 dark:text-gray-400">
          {quiz.time_limit_minutes && (
            <span>制限時間 {quiz.time_limit_minutes}分</span>
          )}
          <span>合格 {quiz.passing_score}点</span>
        </div>
        {attempt && (
          <div className="mt-2 flex items-center gap-2 text-sm">
            <span className={attempt.passed ? 'text-green-600' : 'text-red-600'}>
              スコア: {attempt.score}点
            </span>
            {localStatus === 'approved' && (
              <span className="rounded-full bg-emerald-100 px-2 py-0.5 text-xs font-medium text-emerald-700 dark:bg-emerald-900/30 dark:text-emerald-400">
                再試験可能
              </span>
            )}
          </div>
        )}
      </Link>
    )
  }

  // Mentee with completed attempt and no approved retake
  return (
    <div className="rounded-xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-800">
      <div className="flex items-start justify-between">
        <h3 className="font-semibold text-gray-900 dark:text-white">
          {quiz.title}
        </h3>
        <Badge label={attempt.passed ? '合格' : '不合格'} variant="default" />
      </div>
      <div className="mt-3 flex items-center gap-3 text-sm text-gray-500 dark:text-gray-400">
        {quiz.time_limit_minutes && (
          <span>制限時間 {quiz.time_limit_minutes}分</span>
        )}
        <span>合格 {quiz.passing_score}点</span>
      </div>
      <div className="mt-2 text-sm">
        <span className={attempt.passed ? 'text-green-600' : 'text-red-600'}>
          スコア: {attempt.score}点
        </span>
      </div>
      <div className="mt-3">
        {localStatus === 'requested' ? (
          <span className="inline-flex rounded-full bg-purple-100 px-3 py-1 text-xs font-medium text-purple-700 dark:bg-purple-900/30 dark:text-purple-400">
            再試験申請中
          </span>
        ) : localStatus === 'denied' ? (
          <div className="flex items-center gap-2">
            <span className="inline-flex rounded-full bg-red-100 px-3 py-1 text-xs font-medium text-red-700 dark:bg-red-900/30 dark:text-red-400">
              再試験拒否
            </span>
            <button
              onClick={handleRetakeRequest}
              disabled={pending}
              className="rounded-lg bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-700 disabled:opacity-50"
            >
              {pending ? '送信中...' : '再リクエスト'}
            </button>
          </div>
        ) : (
          <button
            onClick={handleRetakeRequest}
            disabled={pending}
            className="rounded-lg bg-indigo-600 px-3 py-1 text-xs font-medium text-white hover:bg-indigo-700 disabled:opacity-50"
          >
            {pending ? '送信中...' : '再試験リクエスト'}
          </button>
        )}
      </div>
    </div>
  )
}
