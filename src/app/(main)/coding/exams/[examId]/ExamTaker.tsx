'use client'

import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import dynamic from 'next/dynamic'
import Badge from '@/components/ui/Badge'
import { submitCode } from '@/app/actions/coding'

const MonacoEditor = dynamic(() => import('@monaco-editor/react'), { ssr: false })

interface Problem {
  id: string
  title: string
  description: string
  difficulty: string
  language: string
  starter_code: string | null
  sort_order: number
  points: number
}

interface Exam {
  id: string
  title: string
  target_rank: string
  time_limit_minutes: number
  passing_score: number
}

interface Props {
  exam: Exam
  problems: Problem[]
}

export default function ExamTaker({ exam, problems }: Props) {
  const router = useRouter()
  const [currentProblemIndex, setCurrentProblemIndex] = useState(0)
  const [codes, setCodes] = useState<Record<string, string>>(
    Object.fromEntries(problems.map(p => [p.id, p.starter_code ?? '']))
  )
  const [results, setResults] = useState<Record<string, { status: string; passedCount: number; totalCount: number }>>({})
  const [submitting, setSubmitting] = useState(false)
  const [timeLeft, setTimeLeft] = useState(exam.time_limit_minutes * 60)
  const [finished, setFinished] = useState(false)

  // Timer
  useEffect(() => {
    if (finished) return
    const timer = setInterval(() => {
      setTimeLeft((t) => {
        if (t <= 1) {
          clearInterval(timer)
          setFinished(true)
          return 0
        }
        return t - 1
      })
    }, 1000)
    return () => clearInterval(timer)
  }, [finished])

  const currentProblem = problems[currentProblemIndex]
  const minutes = Math.floor(timeLeft / 60)
  const seconds = timeLeft % 60

  async function handleSubmitProblem() {
    if (!currentProblem) return
    setSubmitting(true)

    const result = await submitCode(currentProblem.id, codes[currentProblem.id] ?? '', currentProblem.language)
    if ('status' in result && result.status) {
      setResults({
        ...results,
        [currentProblem.id]: {
          status: result.status,
          passedCount: result.passedCount!,
          totalCount: result.totalCount!,
        },
      })
    }
    setSubmitting(false)
  }

  function calculateScore() {
    let totalScore = 0
    problems.forEach((p) => {
      const r = results[p.id]
      if (r && r.totalCount > 0) {
        totalScore += Math.round((r.passedCount / r.totalCount) * p.points)
      }
    })
    return totalScore
  }

  const maxScore = problems.reduce((sum, p) => sum + p.points, 0)
  const currentScore = calculateScore()
  const passed = currentScore >= (maxScore * exam.passing_score / 100)

  if (finished) {
    return (
      <div className="mx-auto max-w-lg py-12 text-center">
        <div className={`rounded-2xl p-8 ${passed ? 'bg-green-50' : 'bg-red-50'}`}>
          <Badge label={exam.target_rank} variant="coding_rank" className="text-3xl px-4 py-2" />
          <h2 className="mt-4 text-2xl font-bold">{passed ? '합격!' : '불합격'}</h2>
          <p className="mt-2 text-4xl font-bold text-gray-900">{currentScore} / {maxScore}점</p>
          <p className="mt-2 text-gray-500">합격 기준: {exam.passing_score}%</p>
        </div>
        <button
          onClick={() => router.push('/coding/exams')}
          className="mt-6 rounded-lg bg-blue-600 px-6 py-3 text-sm font-medium text-white hover:bg-blue-700"
        >
          시험 목록으로
        </button>
      </div>
    )
  }

  if (!currentProblem) return null

  return (
    <div className="flex h-[calc(100vh-8rem)] flex-col">
      {/* Exam header */}
      <div className="flex items-center justify-between rounded-xl border border-gray-200 bg-white px-5 py-3">
        <div className="flex items-center gap-3">
          <Badge label={exam.target_rank} variant="coding_rank" />
          <span className="font-semibold text-gray-900">{exam.title}</span>
        </div>
        <div className="flex items-center gap-4">
          <div className="flex gap-1">
            {problems.map((p, i) => {
              const r = results[p.id]
              return (
                <button
                  key={p.id}
                  onClick={() => setCurrentProblemIndex(i)}
                  className={`h-8 w-8 rounded text-xs font-medium ${
                    i === currentProblemIndex
                      ? 'bg-blue-600 text-white'
                      : r?.status === 'accepted'
                      ? 'bg-green-100 text-green-700'
                      : r
                      ? 'bg-red-100 text-red-700'
                      : 'bg-gray-100 text-gray-600'
                  }`}
                >
                  {i + 1}
                </button>
              )
            })}
          </div>
          <span className={`font-mono text-sm font-bold ${timeLeft < 300 ? 'text-red-600' : 'text-gray-700'}`}>
            {String(minutes).padStart(2, '0')}:{String(seconds).padStart(2, '0')}
          </span>
          <button
            onClick={() => setFinished(true)}
            className="rounded-lg bg-red-600 px-4 py-2 text-sm font-medium text-white hover:bg-red-700"
          >
            시험 종료
          </button>
        </div>
      </div>

      {/* Problem + Editor */}
      <div className="mt-4 flex flex-1 gap-4 overflow-hidden">
        <div className="w-2/5 overflow-y-auto rounded-xl border border-gray-200 bg-white p-5">
          <div className="flex items-center gap-2">
            <span className="text-sm text-gray-500">문제 {currentProblemIndex + 1}</span>
            <Badge label={currentProblem.difficulty} variant="difficulty" />
            <span className="text-xs text-gray-400">{currentProblem.points}점</span>
          </div>
          <h2 className="mt-2 text-lg font-bold text-gray-900">{currentProblem.title}</h2>
          <div className="mt-4 whitespace-pre-wrap text-sm text-gray-700">
            {currentProblem.description}
          </div>
          {results[currentProblem.id] && (
            <div className={`mt-4 rounded-lg p-3 text-sm ${
              results[currentProblem.id].status === 'accepted'
                ? 'bg-green-50 text-green-700'
                : 'bg-red-50 text-red-700'
            }`}>
              {results[currentProblem.id].passedCount}/{results[currentProblem.id].totalCount} 테스트 통과
            </div>
          )}
        </div>

        <div className="flex w-3/5 flex-col gap-3">
          <div className="flex-1 overflow-hidden rounded-xl border border-gray-200">
            <MonacoEditor
              height="100%"
              language={currentProblem.language === 'java' ? 'java' : 'javascript'}
              value={codes[currentProblem.id] ?? ''}
              onChange={(val) => setCodes({ ...codes, [currentProblem.id]: val ?? '' })}
              theme="vs-dark"
              options={{
                minimap: { enabled: false },
                fontSize: 14,
                tabSize: 4,
                scrollBeyondLastLine: false,
              }}
            />
          </div>
          <button
            onClick={handleSubmitProblem}
            disabled={submitting}
            className="rounded-lg bg-blue-600 py-2.5 text-sm font-semibold text-white hover:bg-blue-700 disabled:opacity-50"
          >
            {submitting ? '채점 중...' : `문제 ${currentProblemIndex + 1} 제출`}
          </button>
        </div>
      </div>
    </div>
  )
}
