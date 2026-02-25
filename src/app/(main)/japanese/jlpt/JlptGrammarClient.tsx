'use client'

import { useState, useCallback } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import TabBar from '@/components/ui/TabBar'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import GrammarList from '@/components/japanese/GrammarList'
import GrammarFlashcard from '@/components/japanese/GrammarFlashcard'
import { toggleMastery } from '@/app/actions/mastery'
import type { JlptLevel, JlptGrammar, GrammarCategory } from '@/lib/supabase/types'

interface Props {
  items: JlptGrammar[]
  level: JlptLevel
  totalPages: number
  currentPage: number
  search: string
  category: string
  categoryOptions: string[]
  totalCount: number
  offset: number
  masteredIds: string[]
  mastery: string
}

const levelTabs = [
  { key: 'N5', label: 'N5 基礎' },
  { key: 'N4', label: 'N4 初級' },
  { key: 'N3', label: 'N3 中級' },
  { key: 'N2', label: 'N2 中上級' },
  { key: 'N1', label: 'N1 上級' },
]

const categoryLabels: Record<GrammarCategory, string> = {
  permission: '許可',
  obligation: '義務',
  desire: '願望',
  ability: '能力',
  condition: '条件',
  reason: '理由',
  contrast: '逆接',
  conjecture: '推量',
  change: '変化',
  degree: '程度',
  time: '時間',
  manner: '方法',
  listing: '列挙',
  emphasis: '強調',
  formal: '丁寧',
}

const MASTERY_FILTERS = [
  { key: '', label: '全て' },
  { key: 'mastered', label: '暗記済み' },
  { key: 'unmastered', label: '未暗記' },
]

export default function JlptGrammarClient({
  items, level, totalPages, currentPage, search, category, categoryOptions, totalCount,
  offset, masteredIds, mastery
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
    if (!('page' in updates)) params.delete('page')
    router.push(`/japanese/jlpt/grammar?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  const handleToggleMastery = useCallback(async (itemId: string) => {
    await toggleMastery('jlpt_grammar', itemId)
  }, [])

  return (
    <div>
      {/* Level tabs */}
      <TabBar
        tabs={levelTabs}
        activeKey={level}
        onChange={(key) => updateParams({ level: key, search: '', category: '', mastery: '' })}
      />

      {/* Filters */}
      <div className="mt-4 flex flex-wrap items-center gap-3">
        <form onSubmit={handleSearch} className="flex gap-2">
          <input
            type="text"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            placeholder="文法パターン/意味を検索..."
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
          value={category}
          onChange={(e) => updateParams({ category: e.target.value })}
          className="rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none"
        >
          <option value="">全カテゴリ</option>
          {categoryOptions.map((c) => (
            <option key={c} value={c}>{categoryLabels[c as GrammarCategory] ?? c}</option>
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
          <span className="text-sm text-gray-500 dark:text-gray-400">{totalCount}項目</span>
          <button
            onClick={() => setShowFlashcard(true)}
            disabled={items.length === 0}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
          >
            フラッシュカード
          </button>
        </div>
      </div>

      {/* Grammar list */}
      <div className="mt-4 rounded-xl border border-gray-200 bg-white px-4 dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="文法項目がありません" description="検索条件を変更してください" icon="📝" />
        ) : (
          <GrammarList items={items} level={level} offset={offset} masteredIds={masteredIds} onToggleMastery={handleToggleMastery} />
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
        <GrammarFlashcard items={items} onClose={() => setShowFlashcard(false)} masteredIds={masteredIds} onToggleMastery={handleToggleMastery} />
      )}
    </div>
  )
}
