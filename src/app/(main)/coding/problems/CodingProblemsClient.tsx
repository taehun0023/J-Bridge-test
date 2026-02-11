'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import Badge from '@/components/ui/Badge'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import type { ProblemDifficulty } from '@/lib/supabase/types'

interface Problem {
  id: string
  title: string
  difficulty: string
  language: string
  time_limit_ms: number
}

interface Props {
  problems: Problem[]
  solvedMap: Record<string, string>
  difficulty: string
  language: string
  currentPage: number
  totalPages: number
  totalCount: number
}

const difficultyLabels: Record<string, string> = {
  easy: '易しい',
  medium: '普通',
  hard: '難しい',
}

export default function CodingProblemsClient({
  problems, solvedMap, difficulty, language, currentPage, totalPages, totalCount,
}: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()

  function updateParams(updates: Record<string, string>) {
    const params = new URLSearchParams(searchParams.toString())
    Object.entries(updates).forEach(([k, v]) => {
      if (v) params.set(k, v)
      else params.delete(k)
    })
    if (!('page' in updates)) params.delete('page')
    router.push(`/coding/problems?${params.toString()}`)
  }

  return (
    <div>
      {/* Filters */}
      <div className="flex flex-wrap items-center gap-3">
        <select
          value={difficulty}
          onChange={(e) => updateParams({ difficulty: e.target.value })}
          className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
        >
          <option value="">全難易度</option>
          <option value="easy">易しい</option>
          <option value="medium">普通</option>
          <option value="hard">難しい</option>
        </select>

        <select
          value={language}
          onChange={(e) => updateParams({ language: e.target.value })}
          className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
        >
          <option value="">全言語</option>
          <option value="java">Java</option>
          <option value="javascript">JavaScript</option>
          <option value="sql">SQL</option>
        </select>

        <span className="ml-auto text-sm text-gray-500 dark:text-gray-400">{totalCount}問</span>
      </div>

      {/* Problem list */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        {problems.length === 0 ? (
          <EmptyState title="問題がありません" icon="💻" />
        ) : (
          <div className="divide-y divide-gray-100 dark:divide-gray-700">
            {problems.map((problem) => {
              const status = solvedMap[problem.id]
              return (
                <a
                  key={problem.id}
                  href={`/coding/problems/${problem.id}`}
                  className="flex items-center gap-4 px-5 py-4 hover:bg-gray-50 dark:hover:bg-gray-700"
                >
                  <div className="flex h-6 w-6 items-center justify-center">
                    {status === 'accepted' ? (
                      <span className="text-green-500">&#10003;</span>
                    ) : status ? (
                      <span className="text-yellow-500">&#9679;</span>
                    ) : (
                      <span className="text-gray-300">&#9675;</span>
                    )}
                  </div>
                  <div className="flex-1">
                    <span className="text-sm font-medium text-gray-900 dark:text-white">{problem.title}</span>
                  </div>
                  <Badge label={difficultyLabels[problem.difficulty] ?? problem.difficulty} variant="difficulty" />
                  <span className="text-xs text-gray-400 dark:text-gray-500 uppercase">{problem.language}</span>
                </a>
              )
            })}
          </div>
        )}
      </div>

      <Pagination
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={(page) => updateParams({ page: String(page) })}
      />

      {/* Link to coding exams */}
      <div className="mt-6 rounded-xl border border-blue-200 bg-blue-50 p-5 dark:border-blue-800 dark:bg-blue-900/30">
        <h3 className="font-semibold text-blue-900 dark:text-blue-300">コーディング等級試験</h3>
        <p className="mt-1 text-sm text-blue-700 dark:text-blue-400">D〜S等級試験でコーディング等級を取得しましょう</p>
        <a
          href="/coding/exams"
          className="mt-3 inline-block rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
        >
          等級試験を受ける
        </a>
      </div>
    </div>
  )
}
