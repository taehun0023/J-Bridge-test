'use client'

import { useState, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import ReadingPassageList from '@/components/japanese/ReadingPassageList'
import { toggleMastery } from '@/app/actions/mastery'
import type { JlptLevel, JlptReadingPassage, ReadingPassageType } from '@/lib/supabase/types'

interface Props {
  items: JlptReadingPassage[]
  level: JlptLevel
  totalPages: number
  currentPage: number
  search: string
  passageType: string
  typeOptions: string[]
  totalCount: number
  masteredIds: string[]
}

const typeLabels: Record<ReadingPassageType, string> = {
  notice: 'お知らせ',
  email: 'メール',
  article: '記事',
  advertisement: '広告',
  instruction: '説明書',
  essay: 'エッセイ',
  letter: '手紙',
  report: 'レポート',
}

export default function JlptReadingClient({
  items, level, totalPages, currentPage, search, passageType, typeOptions, totalCount, masteredIds
}: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [searchInput, setSearchInput] = useState(search)

  function updateParams(updates: Record<string, string>) {
    const params = new URLSearchParams(searchParams.toString())
    Object.entries(updates).forEach(([k, v]) => {
      if (v) params.set(k, v)
      else params.delete(k)
    })
    if (!('page' in updates)) params.delete('page')
    router.push(`/japanese/jlpt/reading?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  const handleToggleMastery = useCallback(async (itemId: string) => {
    await toggleMastery('jlpt_reading', itemId)
  }, [])

  return (
    <div>
      {/* Filters */}
      <div className="mt-4 flex flex-wrap items-center gap-3">
        <form onSubmit={handleSearch} className="flex gap-2">
          <input
            type="text"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            placeholder="タイトル/内容を検索..."
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
          value={passageType}
          onChange={(e) => updateParams({ passage_type: e.target.value })}
          className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none"
        >
          <option value="">全タイプ</option>
          {typeOptions.map((t) => (
            <option key={t} value={t}>{typeLabels[t as ReadingPassageType] ?? t}</option>
          ))}
        </select>

        <div className="ml-auto flex items-center gap-3">
          <span className="text-sm text-gray-500 dark:text-gray-400">{totalCount}項目</span>
        </div>
      </div>

      {/* Reading list */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white px-4 dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="読解項目がありません" description="検索条件を変更してください" icon="📖" />
        ) : (
          <ReadingPassageList items={items} level={level} masteredIds={masteredIds} onToggleMastery={handleToggleMastery} />
        )}
      </div>

      {/* Pagination */}
      <Pagination
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={(page) => updateParams({ page: String(page) })}
      />
    </div>
  )
}
