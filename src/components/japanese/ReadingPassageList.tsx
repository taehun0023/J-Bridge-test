'use client'

import { useState } from 'react'
import Badge from '@/components/ui/Badge'
import type { JlptLevel, JlptReadingPassage, ReadingPassageType } from '@/lib/supabase/types'

interface Props {
  items: JlptReadingPassage[]
  level: JlptLevel
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

export default function ReadingPassageList({ items, level }: Props) {
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [showTranslation, setShowTranslation] = useState<Record<string, boolean>>({})

  function toggleTranslation(id: string) {
    setShowTranslation(prev => ({ ...prev, [id]: !prev[id] }))
  }

  return (
    <div className="divide-y divide-gray-100 dark:divide-gray-700">
      {items.map((item) => (
        <div key={item.id} className="py-3">
          <button
            onClick={() => setExpandedId(expandedId === item.id ? null : item.id)}
            className="flex w-full items-center gap-4 text-left"
          >
            <div className="min-w-0 flex-1">
              <div className="flex items-center gap-2">
                <span className="text-lg font-semibold text-gray-900 dark:text-white">{item.title}</span>
                <span className="rounded-full bg-indigo-50 px-2 py-0.5 text-xs text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-300">
                  {typeLabels[item.passage_type]}
                </span>
              </div>
              <div className="flex items-center gap-2 text-xs text-gray-400 dark:text-gray-500">
                {item.word_count > 0 && <span>{item.word_count}字</span>}
                {item.topic && <span>/ {item.topic}</span>}
              </div>
            </div>
            <Badge label={level} variant="jlpt" />
            <svg
              className={`h-5 w-5 shrink-0 text-gray-400 transition-transform ${expandedId === item.id ? 'rotate-180' : ''}`}
              fill="none" viewBox="0 0 24 24" stroke="currentColor"
            >
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
            </svg>
          </button>

          {expandedId === item.id && (
            <div className="mt-3 space-y-3 rounded-lg bg-gray-50 p-4 dark:bg-gray-700">
              {/* Passage text */}
              <div>
                <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">本文</p>
                <p className="mt-1 whitespace-pre-line text-sm leading-relaxed text-gray-900 dark:text-white">{item.passage}</p>
              </div>

              {/* Vocabulary notes */}
              {item.vocabulary_notes.length > 0 && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">語彙ノート</p>
                  <div className="mt-1 overflow-x-auto">
                    <table className="w-full text-sm">
                      <tbody>
                        {item.vocabulary_notes.map((v, i) => (
                          <tr key={i} className="border-b border-gray-200 last:border-0 dark:border-gray-600">
                            <td className="py-1 pr-3 font-medium text-gray-900 dark:text-white">{v.word}</td>
                            <td className="py-1 pr-3 text-gray-500 dark:text-gray-400">{v.reading}</td>
                            <td className="py-1 text-gray-600 dark:text-gray-300">{v.meaning_ko}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              )}

              {/* Grammar notes */}
              {item.grammar_notes && item.grammar_notes.length > 0 && (
                <div>
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">関連文法</p>
                  <div className="mt-1 flex flex-wrap gap-1">
                    {item.grammar_notes.map((g, i) => (
                      <span key={i} className="rounded-full bg-blue-50 px-2 py-0.5 text-xs text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">
                        {g}
                      </span>
                    ))}
                  </div>
                </div>
              )}

              {/* Korean translation toggle */}
              {item.translation_ko && (
                <div>
                  <button
                    onClick={() => toggleTranslation(item.id)}
                    className="text-xs font-medium text-blue-600 hover:text-blue-700 dark:text-blue-400 dark:hover:text-blue-300"
                  >
                    {showTranslation[item.id] ? '翻訳を隠す' : '韓国語翻訳を見る'}
                  </button>
                  {showTranslation[item.id] && (
                    <p className="mt-1 whitespace-pre-line text-sm text-gray-600 dark:text-gray-300">{item.translation_ko}</p>
                  )}
                </div>
              )}
            </div>
          )}
        </div>
      ))}
    </div>
  )
}
