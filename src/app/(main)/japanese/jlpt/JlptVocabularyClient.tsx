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
  { key: 'N5', label: 'N5 기초' },
  { key: 'N4', label: 'N4 초급' },
  { key: 'N3', label: 'N3 중급' },
  { key: 'N2', label: 'N2 중상급' },
  { key: 'N1', label: 'N1 상급' },
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
            placeholder="단어/읽기/뜻 검색..."
            className="rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none focus:ring-1 focus:ring-blue-500"
          />
          <button
            type="submit"
            className="rounded-lg bg-gray-100 px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-200"
          >
            검색
          </button>
        </form>

        <select
          value={pos}
          onChange={(e) => updateParams({ pos: e.target.value })}
          className="rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none"
        >
          <option value="">전체 품사</option>
          {partOfSpeechOptions.map((p) => (
            <option key={p} value={p}>{p}</option>
          ))}
        </select>

        <div className="ml-auto flex items-center gap-3">
          <span className="text-sm text-gray-500">{totalCount}개 단어</span>
          <button
            onClick={() => setShowFlashcard(true)}
            disabled={items.length === 0}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
          >
            플래시카드
          </button>
        </div>
      </div>

      {/* Quiz link */}
      <div className="mt-3">
        <a
          href={`/japanese/jlpt/quiz?level=${level}`}
          className="text-sm font-medium text-blue-600 hover:text-blue-700"
        >
          {level} 어휘 퀴즈 풀기 &rarr;
        </a>
      </div>

      {/* Vocabulary list */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white px-4">
        {items.length === 0 ? (
          <EmptyState title="단어가 없습니다" description="검색 조건을 변경해보세요" icon="📝" />
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
