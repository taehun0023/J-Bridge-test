'use client'

import { useState } from 'react'
import dynamic from 'next/dynamic'
import Link from 'next/link'
import Badge from '@/components/ui/Badge'

const MonacoEditor = dynamic(() => import('@monaco-editor/react'), { ssr: false })

interface Problem {
  id: string
  title: string
  description: string
  difficulty: string
  language: string
  starter_code: string | null
  solution_code: string | null
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
  easy: '初級', medium: '中級', hard: '上級',
}

const monacoLanguageMap: Record<string, string> = {
  java: 'java',
  javascript: 'javascript',
  sql: 'sql',
}

/** Simple markdown renderer for problem descriptions */
function renderDescription(text: string) {
  const parts = text.split('```')
  return parts.map((part, i) => {
    if (i % 2 === 1) {
      const [, ...codeLines] = part.split('\n')
      return (
        <pre key={i} className="my-2 rounded-lg bg-gray-900 p-3 text-sm text-green-400 overflow-x-auto">
          <code>{codeLines.join('\n').trim()}</code>
        </pre>
      )
    }
    return part.split('\n').map((line, j) => {
      const trimmed = line.trim()
      if (!trimmed) return null
      if (trimmed.startsWith('### ')) return <h4 key={`${i}-${j}`} className="mt-3 mb-1 text-sm font-semibold text-gray-900 dark:text-white">{trimmed.slice(4)}</h4>
      if (trimmed.startsWith('## ')) return <h3 key={`${i}-${j}`} className="mt-4 mb-1 font-semibold text-gray-900 dark:text-white">{trimmed.slice(3)}</h3>
      if (trimmed.startsWith('- ')) return <li key={`${i}-${j}`} className="ml-4 text-sm text-gray-700 dark:text-gray-300">{trimmed.slice(2)}</li>
      return <p key={`${i}-${j}`} className="text-sm text-gray-700 dark:text-gray-300">{trimmed}</p>
    })
  })
}

export default function CodeEditor({ problem, sampleCases }: Props) {
  const [code, setCode] = useState(problem.starter_code ?? '')
  const [showSolution, setShowSolution] = useState(false)

  return (
    <div>
      <div className="mb-4">
        <Link
          href={`/coding/problems?lang=${problem.language}&mode=writing`}
          className="text-sm text-indigo-600 hover:text-indigo-500 dark:text-indigo-400"
        >
          ← 問題一覧に戻る
        </Link>
      </div>
      <div className="flex h-[calc(100vh-11rem)] gap-4">
      {/* Left: Problem description */}
      <div className="flex w-1/2 flex-col overflow-hidden rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        <div className="border-b border-gray-200 px-5 py-4 dark:border-gray-700">
          <div className="flex items-center gap-3">
            <h1 className="text-lg font-bold text-gray-900 dark:text-white">{problem.title}</h1>
            <Badge label={difficultyLabels[problem.difficulty] ?? problem.difficulty} variant="difficulty" />
            <span className="rounded-full bg-amber-100 px-2 py-0.5 text-[10px] font-semibold text-amber-700 dark:bg-amber-900/30 dark:text-amber-400">
              Beta
            </span>
          </div>
          <div className="mt-1 flex gap-4 text-xs text-gray-500 dark:text-gray-400">
            <span>言語: {problem.language.toUpperCase()}</span>
          </div>
        </div>
        <div className="flex-1 overflow-y-auto p-5">
          <div className="max-w-none">
            {renderDescription(problem.description)}
          </div>

          {sampleCases.length > 0 && (
            <div className="mt-6 space-y-4">
              <h3 className="text-sm font-semibold text-gray-900 dark:text-white">例題</h3>
              {sampleCases.map((tc, i) => (
                <div key={i} className="rounded-lg bg-gray-50 p-4 dark:bg-gray-700">
                  <div className="text-xs font-medium text-gray-500 dark:text-gray-400">入力</div>
                  <pre className="mt-1 text-sm text-gray-800 dark:text-gray-200">{tc.input}</pre>
                  <div className="mt-2 text-xs font-medium text-gray-500 dark:text-gray-400">出力</div>
                  <pre className="mt-1 text-sm text-gray-800 dark:text-gray-200">{tc.expected_output}</pre>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      {/* Right: Code editor + solution */}
      <div className="flex w-1/2 flex-col gap-4">
        <div className="flex-1 overflow-hidden rounded-xl border border-gray-200 dark:border-gray-700">
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

        {/* Solution panel */}
        {showSolution && problem.solution_code && (
          <div className="max-h-64 overflow-hidden rounded-xl border border-emerald-200 bg-white dark:border-emerald-800 dark:bg-gray-800">
            <div className="flex items-center justify-between border-b border-emerald-200 px-4 py-2 dark:border-emerald-800">
              <span className="text-xs font-medium text-emerald-700 dark:text-emerald-400">模範解答</span>
              <button onClick={() => setShowSolution(false)} className="text-xs text-gray-400 hover:text-gray-600 dark:hover:text-gray-300">閉じる</button>
            </div>
            <pre className="overflow-y-auto p-4 text-sm text-gray-800 dark:text-gray-200" style={{ maxHeight: '200px' }}>
              <code>{problem.solution_code}</code>
            </pre>
          </div>
        )}

        {/* Action buttons */}
        <div className="flex gap-3">
          <button
            onClick={() => alert('現在、コード実行サーバー（Judge0）が未構築のため提出できません。\n\n「模範解答を見る」ボタンで正解コードを確認してください。')}
            className="flex-1 rounded-lg border border-gray-300 py-2.5 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700"
          >
            提出
          </button>
          <button
            onClick={() => setShowSolution(!showSolution)}
            className="flex-1 rounded-lg bg-emerald-600 py-2.5 text-sm font-semibold text-white hover:bg-emerald-500"
          >
            {showSolution ? '模範解答を閉じる' : '模範解答を見る'}
          </button>
        </div>
      </div>
      </div>
    </div>
  )
}
