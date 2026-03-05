'use client'

import { useState, useEffect } from 'react'
import Badge from '@/components/ui/Badge'
import TtsButton from './TtsButton'
import type { JlptLevel } from '@/lib/supabase/types'

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

interface VocabularyItem {
  id: string
  word: string
  reading: string
  meaning_ko: string
  jlpt_level: string
  part_of_speech: string | null
  example_sentence: string | null
  example_sentence_ko: string | null
}

interface VocabularyListProps {
  items: VocabularyItem[]
  level: JlptLevel
  offset?: number
  masteredIds?: string[]
  onToggleMastery?: (itemId: string) => void
}

export default function VocabularyList({ items, level, offset = 0, masteredIds = [], onToggleMastery }: VocabularyListProps) {
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
              <div className="flex items-center gap-2">
                <span className="text-lg font-semibold text-gray-900 dark:text-white">{item.word}</span>
                <TtsButton text={item.word} />
                <span className="text-sm text-gray-500 dark:text-gray-400">{item.reading}</span>
                {item.part_of_speech && (
                  <span className="text-xs text-gray-400 dark:text-gray-500">{posLabels[item.part_of_speech] ?? item.part_of_speech}</span>
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

          {expandedId === item.id && item.example_sentence && (
            <div className="mt-3 rounded-lg bg-gray-50 p-4 dark:bg-gray-700">
              <p className="text-sm font-medium text-gray-900 dark:text-white">{item.example_sentence}</p>
              {item.example_sentence_ko && (
                <p className="mt-1 text-sm text-gray-600 dark:text-gray-300">{item.example_sentence_ko}</p>
              )}
            </div>
          )}
        </div>
      ))}
    </div>
  )
}
