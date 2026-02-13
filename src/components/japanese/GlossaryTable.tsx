'use client'

import { Fragment, useState, useEffect, useTransition } from 'react'
import TtsButton from './TtsButton'
import { toggleMastery } from '@/app/actions/mastery'

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

interface GlossaryTableProps {
  items: GlossaryItem[]
  offset?: number
  masteredIds?: string[]
  itemType?: 'it_glossary'
}

export default function GlossaryTable({ items, offset = 0, masteredIds = [], itemType = 'it_glossary' }: GlossaryTableProps) {
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))
  const [isPending, startTransition] = useTransition()

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

  function handleToggleMastery(e: React.MouseEvent, itemId: string) {
    e.stopPropagation()
    const next = new Set(localMastered)
    if (next.has(itemId)) {
      next.delete(itemId)
    } else {
      next.add(itemId)
    }
    setLocalMastered(next)

    startTransition(async () => {
      await toggleMastery(itemType, itemId)
    })
  }

  return (
    <div className="overflow-x-auto">
      <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
        <thead className="bg-gray-50 dark:bg-gray-700">
          <tr>
            <th className="w-12 px-3 py-3 text-center text-xs font-medium uppercase text-gray-500 dark:text-gray-400">番号</th>
            <th className="px-4 py-3 text-left text-xs font-medium uppercase text-gray-500 dark:text-gray-400">日本語</th>
            <th className="w-10 px-4 py-3"></th>
          </tr>
        </thead>
        <tbody className="divide-y divide-gray-100 bg-white dark:divide-gray-700 dark:bg-gray-800">
          {items.map((item, index) => (
            <Fragment key={item.id}>
              <tr className="hover:bg-gray-50 dark:hover:bg-gray-700 cursor-pointer" onClick={() => setExpandedId(expandedId === item.id ? null : item.id)}>
                <td className="px-3 py-3 text-center text-xs text-gray-400 dark:text-gray-500">
                  {offset + index + 1}
                </td>
                <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white max-w-md">
                  <div className="flex items-center gap-1.5">
                    <button
                      onClick={(e) => handleToggleMastery(e, item.id)}
                      className={`shrink-0 ${isPending ? 'opacity-50' : ''}`}
                      title={localMastered.has(item.id) ? '暗記済み' : '未暗記'}
                    >
                      {localMastered.has(item.id) ? (
                        <svg className="h-4 w-4 text-green-500" fill="currentColor" viewBox="0 0 24 24">
                          <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                        </svg>
                      ) : (
                        <svg className="h-4 w-4 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                          <path strokeLinecap="round" strokeLinejoin="round" d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                        </svg>
                      )}
                    </button>
                    <span className="truncate">{item.term_ja}</span>
                    <TtsButton text={item.term_ja} />
                  </div>
                </td>
                <td className="px-4 py-3">
                  <button
                    className="text-gray-400 hover:text-gray-600 dark:text-gray-500 dark:hover:text-gray-300"
                  >
                    <svg
                      className={`h-4 w-4 transition-transform ${expandedId === item.id ? 'rotate-180' : ''}`}
                      fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    >
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                    </svg>
                  </button>
                </td>
              </tr>
              {expandedId === item.id && (
                <tr key={`${item.id}-detail`}>
                  <td colSpan={3} className="bg-gray-50 px-4 py-3 dark:bg-gray-700">
                    <dl className="grid grid-cols-[auto_1fr] gap-x-4 gap-y-1 text-sm">
                      {item.reading && (
                        <>
                          <dt className="font-medium text-gray-500 dark:text-gray-400">読み</dt>
                          <dd className="text-gray-700 dark:text-gray-300">{item.reading}</dd>
                        </>
                      )}
                      <dt className="font-medium text-gray-500 dark:text-gray-400">韓国語</dt>
                      <dd className="text-gray-700 dark:text-gray-300">{item.term_ko}</dd>
                      {item.term_en && (
                        <>
                          <dt className="font-medium text-gray-500 dark:text-gray-400">English</dt>
                          <dd className="text-gray-700 dark:text-gray-300">{item.term_en}</dd>
                        </>
                      )}
                      {item.description && (
                        <>
                          <dt className="font-medium text-gray-500 dark:text-gray-400">説明</dt>
                          <dd className="text-gray-700 dark:text-gray-300">{item.description}</dd>
                        </>
                      )}
                      {item.example_sentence && (
                        <>
                          <dt className="font-medium text-gray-500 dark:text-gray-400">例文</dt>
                          <dd className="text-gray-600 dark:text-gray-400 italic">{item.example_sentence}</dd>
                        </>
                      )}
                    </dl>
                  </td>
                </tr>
              )}
            </Fragment>
          ))}
        </tbody>
      </table>
    </div>
  )
}
