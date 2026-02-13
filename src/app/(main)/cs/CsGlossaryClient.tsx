'use client'

import { useState, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import TabBar from '@/components/ui/TabBar'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import GlossaryTable from '@/components/japanese/GlossaryTable'
import RangeQuizModal from '@/components/japanese/RangeQuizModal'
import { generateCsTermQuiz } from '@/app/actions/range-quiz'

interface CsTerm {
  id: string
  term_ja: string
  reading: string | null
  term_ko: string
  term_en: string | null
  category: string
  description: string | null
  example_sentence: string | null
}

interface Props {
  items: CsTerm[]
  category: string
  activeDifficulty: string
  search: string
  currentPage: number
  totalPages: number
  totalCount: number
  basePath: string
  offset: number
  masteredIds: string[]
  mastery: string
  categoryLabel: string
}

const DIFFICULTY_TABS = [
  { key: 'ip', label: 'ITパスポート' },
  { key: 'fe', label: '基本情報' },
]

const MASTERY_FILTERS = [
  { key: '', label: '全て' },
  { key: 'mastered', label: '暗記済み' },
  { key: 'unmastered', label: '未暗記' },
]

export default function CsGlossaryClient({
  items, category, activeDifficulty, search, currentPage, totalPages, totalCount,
  basePath, offset, masteredIds, mastery, categoryLabel,
}: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [searchInput, setSearchInput] = useState(search)
  const [showQuiz, setShowQuiz] = useState(false)

  function updateParams(updates: Record<string, string>) {
    const params = new URLSearchParams(searchParams.toString())
    Object.entries(updates).forEach(([k, v]) => {
      if (v) params.set(k, v)
      else params.delete(k)
    })
    if (!('page' in updates)) params.delete('page')
    router.push(`${basePath}?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  const fetchQuestions = useCallback(async (start: number, end: number, count: number) => {
    return generateCsTermQuiz({
      category,
      difficultyLevel: activeDifficulty || undefined,
      rangeStart: start,
      rangeEnd: end,
      questionCount: count,
    })
  }, [category, activeDifficulty])

  return (
    <div>
      <TabBar
        tabs={DIFFICULTY_TABS}
        activeKey={activeDifficulty}
        onChange={(key) => updateParams({ difficulty: key, search: '', mastery: '', page: '' })}
      />

      <div className="mt-4 flex flex-wrap items-center gap-3">
        <form onSubmit={handleSearch} className="flex gap-2">
          <input
            type="text"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            placeholder="日本語/韓国語/英語で検索..."
            className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
          />
          <button
            type="submit"
            className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600"
          >
            検索
          </button>
        </form>

        <div className="flex rounded-lg border border-gray-200 dark:border-gray-600">
          {MASTERY_FILTERS.map((f) => (
            <button
              key={f.key}
              onClick={() => updateParams({ mastery: f.key })}
              className={`px-3 py-1.5 text-xs font-medium transition-colors first:rounded-l-lg last:rounded-r-lg ${
                mastery === f.key
                  ? 'bg-blue-600 text-white'
                  : 'text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'
              }`}
            >
              {f.label}
            </button>
          ))}
        </div>

        <div className="ml-auto flex items-center gap-3">
          <span className="text-sm text-gray-500 dark:text-gray-400">{totalCount}語</span>
          <button
            onClick={() => setShowQuiz(true)}
            disabled={totalCount === 0}
            className="rounded-lg bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700 disabled:opacity-50"
          >
            範囲クイズ
          </button>
        </div>
      </div>

      <div className="mt-3">
        <a
          href={`/cs/quiz?category=${category}`}
          className="text-sm font-medium text-blue-600 hover:text-blue-700 dark:text-blue-400 dark:hover:text-blue-300"
        >
          {categoryLabel}テストに挑戦 &rarr;
        </a>
      </div>

      <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="用語がありません" description="検索条件を変更してください" icon="📖" />
        ) : (
          <GlossaryTable items={items} offset={offset} masteredIds={masteredIds} itemType="cs_term" />
        )}
      </div>

      <Pagination
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={(page) => updateParams({ page: String(page) })}
      />

      {showQuiz && (
        <RangeQuizModal
          totalCount={totalCount}
          onClose={() => setShowQuiz(false)}
          fetchQuestions={fetchQuestions}
        />
      )}
    </div>
  )
}
