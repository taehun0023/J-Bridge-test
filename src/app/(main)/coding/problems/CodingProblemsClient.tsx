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
  easy: '쉬움',
  medium: '보통',
  hard: '어려움',
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
          className="rounded-lg border border-gray-300 px-3 py-2 text-sm"
        >
          <option value="">전체 난이도</option>
          <option value="easy">쉬움</option>
          <option value="medium">보통</option>
          <option value="hard">어려움</option>
        </select>

        <select
          value={language}
          onChange={(e) => updateParams({ language: e.target.value })}
          className="rounded-lg border border-gray-300 px-3 py-2 text-sm"
        >
          <option value="">전체 언어</option>
          <option value="java">Java</option>
          <option value="javascript">JavaScript</option>
          <option value="sql">SQL</option>
        </select>

        <span className="ml-auto text-sm text-gray-500">{totalCount}개 문제</span>
      </div>

      {/* Problem list */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white">
        {problems.length === 0 ? (
          <EmptyState title="문제가 없습니다" icon="💻" />
        ) : (
          <div className="divide-y divide-gray-100">
            {problems.map((problem) => {
              const status = solvedMap[problem.id]
              return (
                <a
                  key={problem.id}
                  href={`/coding/problems/${problem.id}`}
                  className="flex items-center gap-4 px-5 py-4 hover:bg-gray-50"
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
                    <span className="text-sm font-medium text-gray-900">{problem.title}</span>
                  </div>
                  <Badge label={difficultyLabels[problem.difficulty] ?? problem.difficulty} variant="difficulty" />
                  <span className="text-xs text-gray-400 uppercase">{problem.language}</span>
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
      <div className="mt-6 rounded-xl border border-blue-200 bg-blue-50 p-5">
        <h3 className="font-semibold text-blue-900">코딩 등급 시험</h3>
        <p className="mt-1 text-sm text-blue-700">D~S 등급 시험을 통해 코딩 등급을 획득하세요</p>
        <a
          href="/coding/exams"
          className="mt-3 inline-block rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
        >
          등급 시험 보기
        </a>
      </div>
    </div>
  )
}
