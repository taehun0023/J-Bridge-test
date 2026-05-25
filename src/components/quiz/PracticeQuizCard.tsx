'use client'

import Link from 'next/link'
import Badge from '@/components/ui/Badge'

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
}

interface Props {
  quiz: QuizInfo
  attempt: AttemptInfo | null
  quizHref: string
  userRole: string | null
  locked?: boolean
  lockedReason?: string | null
}

export default function PracticeQuizCard({
  quiz,
  attempt,
  quizHref,
  locked = false,
  lockedReason = null,
}: Props) {
  if (locked) {
    return (
      <div className="rounded-xl border border-gray-200 bg-white p-5 opacity-75 dark:border-gray-700 dark:bg-gray-800">
        <div className="flex items-start justify-between gap-3">
          <h3 className="font-semibold text-gray-900 dark:text-white">{quiz.title}</h3>
          <Badge label="未解放" variant="default" />
        </div>
        <div className="mt-3 flex items-center gap-3 text-sm text-gray-500 dark:text-gray-400">
          {quiz.time_limit_minutes && <span>制限時間 {quiz.time_limit_minutes}分</span>}
          <span>合格点 {quiz.passing_score}点</span>
        </div>
        {lockedReason && (
          <p className="mt-3 text-sm text-gray-500 dark:text-gray-400">{lockedReason}</p>
        )}
      </div>
    )
  }

  return (
    <Link
      href={quizHref}
      className="group rounded-xl border border-gray-200 bg-white p-5 transition-shadow hover:shadow-md dark:border-gray-700 dark:bg-gray-800"
    >
      <div className="flex items-start justify-between">
        <h3 className="font-semibold text-gray-900 group-hover:text-blue-600 dark:text-white">
          {quiz.title}
        </h3>
        {attempt && <Badge label={attempt.passed ? '合格' : '不合格'} variant="default" />}
      </div>
      <div className="mt-3 flex items-center gap-3 text-sm text-gray-500 dark:text-gray-400">
        {quiz.time_limit_minutes && <span>制限時間 {quiz.time_limit_minutes}分</span>}
        <span>合格点 {quiz.passing_score}点</span>
      </div>
      {attempt && (
        <div className="mt-2 text-sm">
          <span className={attempt.passed ? 'text-green-600' : 'text-red-600'}>
            得点 {attempt.score}点
          </span>
        </div>
      )}
    </Link>
  )
}
