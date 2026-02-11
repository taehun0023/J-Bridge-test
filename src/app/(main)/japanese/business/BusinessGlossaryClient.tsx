'use client'

import { useState } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import TabBar from '@/components/ui/TabBar'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import GlossaryTable from '@/components/japanese/GlossaryTable'

interface GlossaryItem {
  id: string
  term_ja: string
  reading: string | null
  term_ko: string
  term_en: string | null
  category: string
  description: string | null
  example_sentence: string | null
}

interface CategoryTab {
  key: string
  label: string
}

interface Props {
  items: GlossaryItem[]
  categories: CategoryTab[]
  activeCategory: string
  search: string
  currentPage: number
  totalPages: number
  totalCount: number
}

export default function BusinessGlossaryClient({
  items, categories, activeCategory, search, currentPage, totalPages, totalCount
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
    router.push(`/japanese/business?${params.toString()}`)
  }

  function handleSearch(e: React.FormEvent) {
    e.preventDefault()
    updateParams({ search: searchInput })
  }

  return (
    <div>
      <TabBar
        tabs={categories}
        activeKey={activeCategory}
        onChange={(key) => updateParams({ category: key, search: '' })}
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
        <span className="ml-auto text-sm text-gray-500 dark:text-gray-400">{totalCount}語</span>
      </div>

      <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="用語がありません" description="検索条件を変更してください" icon="📖" />
        ) : (
          <GlossaryTable items={items} />
        )}
      </div>

      <Pagination
        currentPage={currentPage}
        totalPages={totalPages}
        onPageChange={(page) => updateParams({ page: String(page) })}
      />
    </div>
  )
}
