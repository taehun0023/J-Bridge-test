'use client'

import { useState, useEffect } from 'react'
import Badge from '@/components/ui/Badge'
import TtsButton from './TtsButton'
import type { JlptLevel, JlptGrammar, GrammarCategory } from '@/lib/supabase/types'

interface GrammarListProps {
  items: JlptGrammar[]
  level: JlptLevel
  offset?: number
  masteredIds?: string[]
  onToggleMastery?: (itemId: string) => void
}

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

export default function GrammarList({ items, level, offset = 0, masteredIds = [], onToggleMastery }: GrammarListProps) {
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
                <span className="text-lg font-semibold text-gray-900 dark:text-white">{item.pattern}</span>
                <TtsButton text={item.pattern} />
                <span className="text-sm text-gray-700 dark:text-gray-300">{item.meaning_ko}</span>
              </div>
              {item.category && (
                <span className="text-xs text-gray-400 dark:text-gray-500">{categoryLabels[item.category]}</span>
              )}
            </div>
            <Badge label={level} variant="jlpt" />
            <svg
              className={`h-5 w-5 shrink-0 text-gray-400 transition-transform ${expandedId === item.id ? 'rotate-180' : ''}`}
              fill="none" viewBox="0 0 24 24" stroke="currentColor"
            >
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
            </svg>
          </div>

          {expandedId === item.id && (
            <div className="mt-3 space-y-3 rounded-lg bg-gray-50 p-4 dark:bg-gray-700">
              {/* Formation */}
              <div>
                <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">接続</p>
                <p className="mt-0.5 text-sm font-medium text-gray-900 dark:text-white">{item.formation}</p>
                {item.formation_detail && (
                  <p className="mt-0.5 text-sm text-gray-600 dark:text-gray-300">{item.formation_detail}</p>
                )}
              </div>

              {/* Japanese meaning */}
              <div>
                <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">意味</p>
                <p className="mt-0.5 text-sm text-gray-700 dark:text-gray-300">{item.meaning_ja}</p>
              </div>

              {/* Example sentences */}
              {item.example_sentences.length > 0 && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">例文</p>
                  <div className="mt-1 space-y-2">
                    {item.example_sentences.map((ex, i) => (
                      <div key={i} className="rounded-md bg-white p-2 dark:bg-gray-600">
                        <p className="text-sm font-medium text-gray-900 dark:text-white">{ex.ja}</p>
                        <p className="mt-0.5 text-sm text-gray-600 dark:text-gray-300">{ex.ko}</p>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Related patterns */}
              {item.related_patterns && item.related_patterns.length > 0 && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">関連文法</p>
                  <div className="mt-1 flex flex-wrap gap-1">
                    {item.related_patterns.map((p, i) => (
                      <span key={i} className="rounded-full bg-blue-50 px-2 py-0.5 text-xs text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">
                        {p}
                      </span>
                    ))}
                  </div>
                </div>
              )}

              {/* Common mistakes */}
              {item.common_mistakes && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">注意点</p>
                  <p className="mt-0.5 text-sm text-amber-700 dark:text-amber-300">{item.common_mistakes}</p>
                </div>
              )}

              {/* Usage notes */}
              {item.usage_notes && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">IT現場での活用</p>
                  <p className="mt-0.5 text-sm text-gray-700 dark:text-gray-300">{item.usage_notes}</p>
                </div>
              )}
            </div>
          )}
        </div>
      ))}
    </div>
  )
}
