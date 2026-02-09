'use client'

import { useState } from 'react'
import dynamic from 'next/dynamic'
import Badge from '@/components/ui/Badge'
import { submitCode, runCode } from '@/app/actions/coding'

const MonacoEditor = dynamic(() => import('@monaco-editor/react'), { ssr: false })

interface Problem {
  id: string
  title: string
  description: string
  difficulty: string
  language: string
  starter_code: string | null
  time_limit_ms: number
  memory_limit_mb: number
}

interface SampleCase {
  input: string
  expected_output: string
  sort_order: number
}

interface Props {
  problem: Problem
  sampleCases: SampleCase[]
}

const difficultyLabels: Record<string, string> = {
  easy: '쉬움', medium: '보통', hard: '어려움',
}

const monacoLanguageMap: Record<string, string> = {
  java: 'java',
  javascript: 'javascript',
  sql: 'sql',
}

export default function CodeEditor({ problem, sampleCases }: Props) {
  const [code, setCode] = useState(problem.starter_code ?? '')
  const [output, setOutput] = useState('')
  const [running, setRunning] = useState(false)
  const [submitting, setSubmitting] = useState(false)
  const [submitResult, setSubmitResult] = useState<{
    status: string
    passedCount: number
    totalCount: number
  } | null>(null)
  const [reviews, setReviews] = useState<{
    feedback: string
    severity: string
    line_number: number | null
    review_type: string
  }[]>([])
  const [showReviews, setShowReviews] = useState(false)

  async function handleRun() {
    setRunning(true)
    setOutput('')
    const input = sampleCases[0]?.input ?? ''
    const result = await runCode(code, problem.language, input)
    if (result.error && !result.output) {
      setOutput(`Error:\n${result.error}`)
    } else {
      setOutput(result.output)
      if (result.error) setOutput(prev => prev + `\nStderr:\n${result.error}`)
    }
    setRunning(false)
  }

  async function handleSubmit() {
    setSubmitting(true)
    setSubmitResult(null)
    const result = await submitCode(problem.id, code, problem.language)
    if ('error' in result && result.error) {
      setOutput(`Error: ${result.error}`)
    } else if ('status' in result) {
      setSubmitResult({
        status: result.status as string,
        passedCount: result.passedCount as number,
        totalCount: result.totalCount as number,
      })
      // Show sample test results
      const results = (result as { results?: { input: string; expected: string; actual: string | null; status: string }[] }).results
      if (results) {
        setOutput(results.map((r, i) =>
          `테스트 ${i + 1}: ${r.status === 'accepted' ? 'PASS' : 'FAIL'}\n  입력: ${r.input}\n  기대: ${r.expected}\n  실제: ${r.actual ?? '(없음)'}`
        ).join('\n\n'))
      }
      // Show code reviews
      const reviewData = (result as { reviews?: { feedback: string; severity: string; line_number: number | null; review_type: string }[] }).reviews
      if (reviewData && reviewData.length > 0) {
        setReviews(reviewData)
        setShowReviews(true)
      }
    }
    setSubmitting(false)
  }

  return (
    <div className="flex h-[calc(100vh-8rem)] gap-4">
      {/* Left: Problem description */}
      <div className="flex w-1/2 flex-col overflow-hidden rounded-xl border border-gray-200 bg-white">
        <div className="border-b border-gray-200 px-5 py-4">
          <div className="flex items-center gap-3">
            <h1 className="text-lg font-bold text-gray-900">{problem.title}</h1>
            <Badge label={difficultyLabels[problem.difficulty] ?? problem.difficulty} variant="difficulty" />
          </div>
          <div className="mt-1 flex gap-4 text-xs text-gray-500">
            <span>언어: {problem.language.toUpperCase()}</span>
            <span>시간: {problem.time_limit_ms}ms</span>
            <span>메모리: {problem.memory_limit_mb}MB</span>
          </div>
        </div>
        <div className="flex-1 overflow-y-auto p-5">
          <div className="prose prose-sm max-w-none whitespace-pre-wrap text-gray-700">
            {problem.description}
          </div>

          {sampleCases.length > 0 && (
            <div className="mt-6 space-y-4">
              <h3 className="text-sm font-semibold text-gray-900">예제</h3>
              {sampleCases.map((tc, i) => (
                <div key={i} className="rounded-lg bg-gray-50 p-4">
                  <div className="text-xs font-medium text-gray-500">입력</div>
                  <pre className="mt-1 text-sm text-gray-800">{tc.input}</pre>
                  <div className="mt-2 text-xs font-medium text-gray-500">출력</div>
                  <pre className="mt-1 text-sm text-gray-800">{tc.expected_output}</pre>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Right: Code editor + output */}
      <div className="flex w-1/2 flex-col gap-4">
        <div className="flex-1 overflow-hidden rounded-xl border border-gray-200">
          <MonacoEditor
            height="100%"
            language={monacoLanguageMap[problem.language] ?? 'plaintext'}
            value={code}
            onChange={(val) => setCode(val ?? '')}
            theme="vs-dark"
            options={{
              minimap: { enabled: false },
              fontSize: 14,
              tabSize: 4,
              scrollBeyondLastLine: false,
            }}
          />
        </div>

        {/* Output panel */}
        <div className="h-48 overflow-hidden rounded-xl border border-gray-200 bg-gray-900">
          <div className="flex items-center justify-between border-b border-gray-700 px-4 py-2">
            <span className="text-xs font-medium text-gray-400">출력</span>
            {submitResult && (
              <span className={`text-xs font-medium ${
                submitResult.status === 'accepted' ? 'text-green-400' : 'text-red-400'
              }`}>
                {submitResult.passedCount}/{submitResult.totalCount} 통과
                {submitResult.status === 'accepted' ? ' - 정답!' : ` - ${submitResult.status}`}
              </span>
            )}
          </div>
          <pre className="h-full overflow-y-auto p-4 text-sm text-gray-300">
            {output || '실행 결과가 여기에 표시됩니다'}
          </pre>
        </div>

        {/* Code Review Panel */}
        {showReviews && reviews.length > 0 && (
          <div className="max-h-48 overflow-y-auto rounded-xl border border-gray-200 bg-white">
            <div className="flex items-center justify-between border-b border-gray-200 px-4 py-2">
              <span className="text-xs font-medium text-gray-700">코드 리뷰 ({reviews.length}건)</span>
              <button onClick={() => setShowReviews(false)} className="text-xs text-gray-400 hover:text-gray-600">닫기</button>
            </div>
            <div className="divide-y divide-gray-100">
              {reviews.map((r, i) => (
                <div key={i} className="px-4 py-2.5">
                  <div className="flex items-center gap-2">
                    <span className={`inline-flex rounded-full px-1.5 py-0.5 text-[10px] font-medium ${
                      r.severity === 'error' ? 'bg-red-100 text-red-700' :
                      r.severity === 'warning' ? 'bg-yellow-100 text-yellow-700' :
                      'bg-blue-100 text-blue-700'
                    }`}>
                      {r.severity === 'error' ? 'ERROR' : r.severity === 'warning' ? 'WARN' : 'INFO'}
                    </span>
                    <span className="text-[10px] text-gray-400">
                      {r.review_type === 'japan_convention' ? '日本慣習' : r.review_type}
                    </span>
                    {r.line_number && (
                      <span className="text-[10px] text-gray-400">Line {r.line_number}</span>
                    )}
                  </div>
                  <p className="mt-1 text-xs text-gray-600">{r.feedback}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Action buttons */}
        <div className="flex gap-3">
          <button
            onClick={handleRun}
            disabled={running || submitting}
            className="flex-1 rounded-lg border border-gray-300 py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50"
          >
            {running ? '실행 중...' : '실행'}
          </button>
          <button
            onClick={handleSubmit}
            disabled={running || submitting}
            className="flex-1 rounded-lg bg-blue-600 py-2.5 text-sm font-semibold text-white hover:bg-blue-700 disabled:opacity-50"
          >
            {submitting ? '채점 중...' : '제출'}
          </button>
        </div>
      </div>
    </div>
  )
}
