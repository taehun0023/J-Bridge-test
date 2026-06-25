'use client'

import { useState, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import KanjiList from '@/components/japanese/KanjiList'
import RangeQuizModal from '@/components/japanese/RangeQuizModal'
import { generateKanjiQuiz } from '@/app/actions/range-quiz'
import { toggleMastery } from '@/app/actions/mastery'
import type { JlptLevel } from '@/lib/supabase/types'

interface KanjiItem {
  id: string
  kanji: string
  reading_on: string | null
  reading_kun: string | null
  meaning_ko: string
  meaning_en: string | null
  korean_gloss: string | null
  stroke_count: number | null
  jlpt_level: string
  example_words: { word: string; reading: string; meaning: string }[] | null
}

interface Props {
  items: KanjiItem[]
  level: JlptLevel
  totalPages: number
  currentPage: number
  search: string
  totalCount: number
  offset: number
  masteredIds: string[]
  mastery: string
  seqMap: Record<string, number>
}

const MASTERY_FILTERS = [
  { key: '', label: '全て' },
  { key: 'mastered', label: '暗記済み' },
  { key: 'unmastered', label: '未暗記' },
]

export default function JlptKanjiClient({
  items, level, totalPages, currentPage, search, totalCount, offset, masteredIds, mastery, seqMap
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
    router.push(`/japanese/jlpt/kanji?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  const handleToggleMastery = useCallback(async (itemId: string) => {
    await toggleMastery('jlpt_kanji', itemId)
  }, [])

  const fetchQuestions = useCallback(async (start: number, end: number, count: number) => {
    return generateKanjiQuiz({ level, rangeStart: start, rangeEnd: end, questionCount: count })
  }, [level])

  return (
    <div>
      <div className="flex flex-wrap items-center gap-3">
        <form onSubmit={handleSearch} className="flex gap-2">
          <input
            type="text"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            placeholder="漢字/読み/意味を検索..."
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
          <span className="text-sm text-gray-500 dark:text-gray-400">{totalCount}字</span>
          <button
            onClick={() => setShowQuiz(true)}
            disabled={totalCount === 0}
            className="rounded-lg bg-green-600 px-4 py-2 text-sm font-medium text-white hover:bg-green-700 disabled:opacity-50"
          >
            範囲クイズ
          </button>
        </div>
      </div>

      <div className="mt-4 rounded-xl border border-gray-200 bg-white px-4 dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="漢字がありません" description="検索条件を変更してください" icon="漢" />
        ) : (
          <KanjiList items={items} level={level} offset={offset} masteredIds={masteredIds} onToggleMastery={handleToggleMastery} seqMap={seqMap} />
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
