'use client'

import { useState, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import VocabularyList from '@/components/japanese/VocabularyList'
import FlashcardMode from '@/components/japanese/FlashcardMode'
import RangeQuizModal from '@/components/japanese/RangeQuizModal'
import { generateVocabQuiz } from '@/app/actions/range-quiz'
import { toggleMastery } from '@/app/actions/mastery'
import type { JlptLevel } from '@/lib/supabase/types'

interface VocabItem {
  id: string
  word: string
  reading: string
  meaning_ko: string
  jlpt_level: string
  part_of_speech: string | null
  example_sentence: string | null
  example_sentence_ko: string | null
}

interface Props {
  items: VocabItem[]
  level: JlptLevel
  totalPages: number
  currentPage: number
  search: string
  pos: string
  partOfSpeechOptions: string[]
  totalCount: number
  offset: number
  masteredIds: string[]
  mastery: string
}

const posLabels: Record<string, string> = {
  '동사': '動詞',
  '명사': '名詞',
  'い형용사': 'い形容詞',
  'な형용사': 'な形容詞',
  '형용사': '形容詞',
  '부사': '副詞',
  '대명사': '代名詞',
  '접속사': '接続詞',
  '연체사': '連体詞',
  '접두사': '接頭辞',
  '접미사': '接尾辞',
  '표현': '表現',
}

const MASTERY_FILTERS = [
  { key: '', label: '全て' },
  { key: 'mastered', label: '暗記済み' },
  { key: 'unmastered', label: '未暗記' },
]

export default function JlptVocabularyClient({
  items, level, totalPages, currentPage, search, pos, partOfSpeechOptions, totalCount,
  offset, masteredIds, mastery
}: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [showFlashcard, setShowFlashcard] = useState(false)
  const [showQuiz, setShowQuiz] = useState(false)
  const [searchInput, setSearchInput] = useState(search)

  function updateParams(updates: Record<string, string>) {
    const params = new URLSearchParams(searchParams.toString())
    Object.entries(updates).forEach(([k, v]) => {
      if (v) params.set(k, v)
      else params.delete(k)
    })
    // Reset page when changing filters
    if (!('page' in updates)) params.delete('page')
    router.push(`/japanese/jlpt/vocabulary?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  const handleToggleMastery = useCallback(async (itemId: string) => {
    await toggleMastery('jlpt_vocabulary', itemId)
  }, [])

  const fetchQuestions = useCallback(async (start: number, end: number, count: number) => {
    return generateVocabQuiz({
      level,
      pos: pos || undefined,
      rangeStart: start,
      rangeEnd: end,
      questionCount: count,
    })
  }, [level, pos])

  return (
    <div>
      {/* Filters */}
      <div className="mt-4 flex flex-wrap items-center gap-3">
        <form onSubmit={handleSearch} className="flex gap-2">
          <input
            type="text"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            placeholder="単語/読み/意味を検索..."
            className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
          />
          <button
            type="submit"
            className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600"
          >
            検索
          </button>
        </form>

        <select
          value={pos}
          onChange={(e) => updateParams({ pos: e.target.value })}
          className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none"
        >
          <option value="">全品詞</option>
          {partOfSpeechOptions.map((p) => (
            <option key={p} value={p}>{posLabels[p] ?? p}</option>
          ))}
        </select>

        {/* Mastery filter */}
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
          <button
            onClick={() => setShowFlashcard(true)}
            disabled={items.length === 0}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
          >
            フラッシュカード
          </button>
        </div>
      </div>

      {/* Vocabulary list */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white px-4 dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="単語がありません" description="検索条件を変更してください" icon="📝" />
        ) : (
          <VocabularyList items={items} level={level} offset={offset} masteredIds={masteredIds} onToggleMastery={handleToggleMastery} />
        )}
      </div>

      {/* Pagination */}
      <Pagination
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={(page) => updateParams({ page: String(page) })}
      />

      {/* Flashcard mode */}
      {showFlashcard && (
        <FlashcardMode items={items} onClose={() => setShowFlashcard(false)} masteredIds={masteredIds} onToggleMastery={handleToggleMastery} />
      )}

      {/* Range quiz */}
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
