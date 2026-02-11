'use client'

import { useState } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import TabBar from '@/components/ui/TabBar'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import VocabularyList from '@/components/japanese/VocabularyList'
import FlashcardMode from '@/components/japanese/FlashcardMode'
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
}

const levelTabs = [
  { key: 'N5', label: 'N5 基礎' },
  { key: 'N4', label: 'N4 初級' },
  { key: 'N3', label: 'N3 中級' },
  { key: 'N2', label: 'N2 中上級' },
  { key: 'N1', label: 'N1 上級' },
]

export default function JlptVocabularyClient({
  items, level, totalPages, currentPage, search, pos, partOfSpeechOptions, totalCount
}: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [showFlashcard, setShowFlashcard] = useState(false)
  const [searchInput, setSearchInput] = useState(search)

  function updateParams(updates: Record<string, string>) {
    const params = new URLSearchParams(searchParams.toString())
    Object.entries(updates).forEach(([k, v]) => {
      if (v) params.set(k, v)
      else params.delete(k)
    })
    // Reset page when changing filters
    if (!('page' in updates)) params.delete('page')
    router.push(`/japanese/jlpt?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  return (
    <div>
      {/* Level tabs */}
      <TabBar
        tabs={levelTabs}
        activeKey={level}
        onChange={(key) => updateParams({ level: key, search: '', pos: '' })}
      />

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
            <option key={p} value={p}>{p}</option>
          ))}
        </select>

        <div className="ml-auto flex items-center gap-3">
          <span className="text-sm text-gray-500 dark:text-gray-400">{totalCount}語</span>
          <button
            onClick={() => setShowFlashcard(true)}
            disabled={items.length === 0}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
          >
            フラッシュカード
          </button>
        </div>
      </div>

      {/* Quiz link */}
      <div className="mt-3">
        <a
          href={`/japanese/jlpt/quiz?level=${level}`}
          className="text-sm font-medium text-blue-600 hover:text-blue-700 dark:text-blue-400 dark:hover:text-blue-300"
        >
          {level} 語彙クイズに挑戦 &rarr;
        </a>
      </div>

      {/* Vocabulary list */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white px-4 dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="単語がありません" description="検索条件を変更してください" icon="📝" />
        ) : (
          <VocabularyList items={items} level={level} />
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
        <FlashcardMode items={items} onClose={() => setShowFlashcard(false)} />
      )}
    </div>
  )
}
