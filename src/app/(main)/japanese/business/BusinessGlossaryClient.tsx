'use client'

import { useState, useCallback, useTransition } from 'react'
import { useRouter, useSearchParams } from 'next/navigation'
import TabBar from '@/components/ui/TabBar'
import Pagination from '@/components/ui/Pagination'
import EmptyState from '@/components/ui/EmptyState'
import GlossaryTable from '@/components/japanese/GlossaryTable'
import RangeQuizModal from '@/components/japanese/RangeQuizModal'
import { generateGlossaryQuiz } from '@/app/actions/range-quiz'
import { createGlossaryItem } from '@/app/actions/admin/glossary'
import { Plus, X } from 'lucide-react'

interface GlossaryItem {
  id: string
  term_ja: string
  reading: string | null
  term_ko: string
  term_en: string | null
  category: string
  subcategory?: string | null
  description: string | null
  example_sentence: string | null
}

interface CategoryTab {
  key: string
  label: string
}

interface AddFormState {
  term_ja: string
  reading: string
  term_ko: string
  term_en: string
  category: string
  subcategory: string
  description: string
  example_sentence: string
}

const GLOSSARY_CATEGORY_OPTIONS = [
  { key: 'business', label: 'ビジネス' },
  { key: 'it', label: 'IT' },
  { key: 'dev', label: '開発' },
]

const EXPRESSION_SUBCATEGORY_OPTIONS = [
  { key: 'request', label: '依頼・確認' },
  { key: 'report', label: '報告・連絡' },
  { key: 'manner', label: '挨拶・応対' },
]

const SENTENCE_PATTERN_SUBCATEGORY_OPTIONS = [
  { key: 'request', label: '依頼・調整' },
  { key: 'report', label: '報告・共有' },
  { key: 'response', label: '対応・応答' },
]

const KEIGO_SUBCATEGORY_OPTIONS = [
  { key: 'rule', label: '変換規則' },
  { key: 'mistake', label: 'よくある間違い' },
  { key: 'uchi_soto', label: 'ウチ・ソト' },
]

interface Props {
  items: GlossaryItem[]
  categories: CategoryTab[]
  activeCategory: string
  search: string
  currentPage: number
  totalPages: number
  totalCount: number
  basePath?: string
  offset: number
  masteredIds: string[]
  mastery: string
  itemType: 'it_glossary'
  canManage?: boolean
}

const MASTERY_FILTERS = [
  { key: '', label: '全て' },
  { key: 'mastered', label: '暗記済み' },
  { key: 'unmastered', label: '未暗記' },
]

export default function BusinessGlossaryClient({
  items, categories, activeCategory, search, currentPage, totalPages, totalCount,
  basePath = '/japanese/business', offset, masteredIds, mastery, itemType, canManage
}: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const [searchInput, setSearchInput] = useState(search)
  const [showQuiz, setShowQuiz] = useState(false)
  const [showAddForm, setShowAddForm] = useState(false)
  const [addPending, startAddTransition] = useTransition()
  const [addMessage, setAddMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  const isGlossaryPage = basePath?.includes('glossary') && !basePath?.includes('expressions') && !basePath?.includes('sentence-patterns')
  const isExpressionsPage = basePath?.includes('expressions')
  const isKeigoPage = basePath?.includes('keigo')

  function getDefaultAddForm(): AddFormState {
    if (isGlossaryPage) {
      return { term_ja: '', reading: '', term_ko: '', term_en: '', category: 'business', subcategory: '', description: '', example_sentence: '' }
    } else if (isExpressionsPage) {
      return { term_ja: '', reading: '', term_ko: '', term_en: '', category: 'expression', subcategory: 'request', description: '', example_sentence: '' }
    } else if (isKeigoPage) {
      return { term_ja: '', reading: '', term_ko: '', term_en: '', category: 'keigo', subcategory: 'rule', description: '', example_sentence: '' }
    } else {
      return { term_ja: '', reading: '', term_ko: '', term_en: '', category: 'sentence_pattern', subcategory: 'request', description: '', example_sentence: '' }
    }
  }

  const [addForm, setAddForm] = useState<AddFormState>(getDefaultAddForm)

  function handleAdd() {
    startAddTransition(async () => {
      const result = await createGlossaryItem({
        term_ja: addForm.term_ja,
        reading: addForm.reading || null,
        term_ko: addForm.term_ko,
        term_en: addForm.term_en || null,
        category: addForm.category,
        subcategory: addForm.subcategory || null,
        description: addForm.description || null,
        example_sentence: addForm.example_sentence || null,
      })
      if ('error' in result && result.error) {
        setAddMessage({ type: 'error', text: result.error })
        setTimeout(() => setAddMessage(null), 3000)
      } else {
        setAddMessage({ type: 'success', text: '追加しました' })
        setTimeout(() => setAddMessage(null), 3000)
        setShowAddForm(false)
        setAddForm(getDefaultAddForm())
        router.refresh()
      }
    })
  }

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
    // Determine query params based on basePath
    if (basePath.includes('expressions')) {
      return generateGlossaryQuiz({
        category: 'expression',
        subcategory: activeCategory || undefined,
        rangeStart: start,
        rangeEnd: end,
        questionCount: count,
      })
    } else if (basePath.includes('keigo')) {
      return generateGlossaryQuiz({
        category: 'keigo',
        subcategory: activeCategory || undefined,
        rangeStart: start,
        rangeEnd: end,
        questionCount: count,
      })
    } else if (basePath.includes('sentence-patterns')) {
      return generateGlossaryQuiz({
        category: 'sentence_pattern',
        subcategory: activeCategory || undefined,
        rangeStart: start,
        rangeEnd: end,
        questionCount: count,
      })
    } else {
      // glossary page
      const glossaryCategories = ['business', 'it', 'dev']
      return generateGlossaryQuiz({
        category: activeCategory || undefined,
        categories: activeCategory ? undefined : glossaryCategories,
        rangeStart: start,
        rangeEnd: end,
        questionCount: count,
      })
    }
  }, [basePath, activeCategory])

  return (
    <div>
      <TabBar
        tabs={categories}
        activeKey={activeCategory}
        onChange={(key) => updateParams({ category: key, search: '', mastery: '' })}
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
          {canManage && (
            <button
              onClick={() => { setShowAddForm(true); setAddForm(getDefaultAddForm()) }}
              className="inline-flex items-center gap-1 rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
            >
              <Plus className="h-4 w-4" />
              追加
            </button>
          )}
        </div>
      </div>

      {addMessage && (
        <div className={`mt-3 rounded-lg px-4 py-3 text-sm ${
          addMessage.type === 'success'
            ? 'bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 ring-1 ring-emerald-500/20'
            : 'bg-red-500/10 text-red-600 dark:text-red-400 ring-1 ring-red-500/20'
        }`}>
          {addMessage.text}
        </div>
      )}

      {showAddForm && canManage && (
        <div className="mt-3 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-700 dark:bg-gray-800">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900 dark:text-white">新しい用語を追加</h3>
            <button onClick={() => setShowAddForm(false)} className="text-gray-400 hover:text-gray-600 dark:hover:text-gray-200">
              <X className="h-5 w-5" />
            </button>
          </div>
          <div className="grid gap-3 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">日本語 *</label>
              <input type="text" value={addForm.term_ja} onChange={e => setAddForm({ ...addForm, term_ja: e.target.value })}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">読み</label>
              <input type="text" value={addForm.reading} onChange={e => setAddForm({ ...addForm, reading: e.target.value })}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">韓国語 *</label>
              <input type="text" value={addForm.term_ko} onChange={e => setAddForm({ ...addForm, term_ko: e.target.value })}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">英語</label>
              <input type="text" value={addForm.term_en} onChange={e => setAddForm({ ...addForm, term_en: e.target.value })}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            {isGlossaryPage ? (
              <div>
                <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">カテゴリ *</label>
                <select value={addForm.category} onChange={e => setAddForm({ ...addForm, category: e.target.value })}
                  className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                  {GLOSSARY_CATEGORY_OPTIONS.map(c => (
                    <option key={c.key} value={c.key}>{c.label}</option>
                  ))}
                </select>
              </div>
            ) : (
              <div>
                <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">サブカテゴリ</label>
                <select value={addForm.subcategory} onChange={e => setAddForm({ ...addForm, subcategory: e.target.value })}
                  className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                  {(isKeigoPage ? KEIGO_SUBCATEGORY_OPTIONS : isExpressionsPage ? EXPRESSION_SUBCATEGORY_OPTIONS : SENTENCE_PATTERN_SUBCATEGORY_OPTIONS).map(c => (
                    <option key={c.key} value={c.key}>{c.label}</option>
                  ))}
                </select>
              </div>
            )}
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">説明</label>
              <textarea value={addForm.description} onChange={e => setAddForm({ ...addForm, description: e.target.value })} rows={2}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">例文</label>
              <textarea value={addForm.example_sentence} onChange={e => setAddForm({ ...addForm, example_sentence: e.target.value })} rows={2}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
          </div>
          <div className="mt-4 flex justify-end gap-2">
            <button onClick={() => setShowAddForm(false)}
              className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700 transition-colors">
              キャンセル
            </button>
            <button onClick={handleAdd} disabled={addPending || !addForm.term_ja || !addForm.term_ko}
              className="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors">
              {addPending ? '保存中...' : '追加'}
            </button>
          </div>
        </div>
      )}

      <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        {items.length === 0 ? (
          <EmptyState title="用語がありません" description="検索条件を変更してください" icon="📖" />
        ) : (
          <GlossaryTable items={items} offset={offset} masteredIds={masteredIds} itemType={itemType} canManage={canManage} />
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
