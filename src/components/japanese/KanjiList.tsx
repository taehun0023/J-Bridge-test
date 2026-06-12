'use client'

import { useState, useEffect } from 'react'
import Badge from '@/components/ui/Badge'
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

interface KanjiListProps {
  items: KanjiItem[]
  level: JlptLevel
  offset?: number
  masteredIds?: string[]
  onToggleMastery?: (itemId: string) => void
}

export default function KanjiList({ items, level, offset = 0, masteredIds = [], onToggleMastery }: KanjiListProps) {
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

  function handleToggle(e: React.MouseEvent, itemId: string) {
    e.stopPropagation()
    e.preventDefault()
    const next = new Set(localMastered)
    if (next.has(itemId)) {
      next.delete(itemId)
    } else {
      next.add(itemId)
    }
    setLocalMastered(next)
    onToggleMastery?.(itemId)
  }

  return (
    <div className="divide-y divide-gray-100 dark:divide-gray-700">
      {items.map((item, index) => (
        <div key={item.id} className="py-3">
          <div
            onClick={() => setExpandedId(expandedId === item.id ? null : item.id)}
            className="flex w-full cursor-pointer items-center gap-4 text-left"
            role="button"
            tabIndex={0}
            onKeyDown={(e) => { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); setExpandedId(expandedId === item.id ? null : item.id) } }}
          >
            <span className="w-8 shrink-0 text-center text-xs text-gray-400 dark:text-gray-500">
              {offset + index + 1}
            </span>
            {onToggleMastery && (
              <button
                onClick={(e) => handleToggle(e, item.id)}
                className="-m-1.5 shrink-0 p-1.5"
                title={localMastered.has(item.id) ? '暗記済み' : '未暗記'}
              >
                {localMastered.has(item.id) ? (
                  <svg className="h-5 w-5 text-green-500" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                  </svg>
                ) : (
                  <svg className="h-5 w-5 text-gray-300 dark:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z" />
                  </svg>
                )}
              </button>
            )}
            <div className="min-w-0 flex-1">
              <div className="flex items-center gap-3">
                <span className="text-3xl font-bold text-gray-900 dark:text-white">{item.kanji}</span>
                <div>
                  {item.reading_on && (
                    <p className="text-sm text-gray-500 dark:text-gray-400">音: {item.reading_on}</p>
                  )}
                  {item.reading_kun && (
                    <p className="text-sm text-gray-500 dark:text-gray-400">訓: {item.reading_kun}</p>
                  )}
                  {item.korean_gloss && (
                    <p className="text-sm text-gray-500 dark:text-gray-400">韓: {item.korean_gloss}</p>
                  )}
                </div>
                {item.stroke_count && (
                  <span className="text-xs text-gray-400">{item.stroke_count}画</span>
                )}
              </div>
              <p className="mt-0.5 text-sm text-gray-700 dark:text-gray-300">{item.meaning_ko}</p>
            </div>
            <Badge label={level} variant="jlpt" />
            <svg
              className={`h-5 w-5 shrink-0 text-gray-400 transition-transform ${expandedId === item.id ? 'rotate-180' : ''}`}
              fill="none" viewBox="0 0 24 24" stroke="currentColor"
            >
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
            </svg>
          </div>

          {expandedId === item.id && item.example_words && item.example_words.length > 0 && (
            <div className="mt-3 rounded-lg bg-gray-50 p-4 dark:bg-gray-700">
              <p className="mb-2 text-xs font-medium text-gray-500 dark:text-gray-400">例語:</p>
              <div className="space-y-1">
                {item.example_words.map((ew, i) => (
                  <p key={i} className="text-sm">
                    <span className="font-medium text-gray-900 dark:text-white">{ew.word}</span>
                    <span className="ml-1 text-gray-500">({ew.reading})</span>
                    <span className="ml-2 text-gray-600 dark:text-gray-300">{ew.meaning}</span>
                  </p>
                ))}
              </div>
            </div>
          )}
        </div>
      ))}
    </div>
  )
}
