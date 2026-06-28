'use client'

import { useState, useEffect, useRef } from 'react'
import Badge from '@/components/ui/Badge'
import MasteryCheck from './MasteryCheck'
import { emitMastery } from './MasteryProgress'
import { logStudyAttempt } from '@/app/actions/study-log'
import type { JlptLevel, JlptReadingPassage, ReadingPassageType } from '@/lib/supabase/types'

interface Props {
  items: JlptReadingPassage[]
  level: JlptLevel
  masteredIds?: string[]
  onToggleMastery?: (id: string) => void
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

export default function ReadingPassageList({ items, level, masteredIds = [], onToggleMastery }: Props) {
  const [expandedId, setExpandedId] = useState<string | null>(null)
  const [showTranslation, setShowTranslation] = useState<Record<string, boolean>>({})
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))
  const [answers, setAnswers] = useState<Record<string, number>>({})
  const [results, setResults] = useState<Record<string, 'correct' | 'wrong'>>({})
  const shownAtRef = useRef<Record<string, number>>({})

  function submitQuiz(item: JlptReadingPassage) {
    const sel = answers[item.id]
    if (sel == null || !item.comprehension || results[item.id]) return
    const ok = sel === item.comprehension.answer
    setResults(prev => ({ ...prev, [item.id]: ok ? 'correct' : 'wrong' }))
    const start = shownAtRef.current[item.id]
    void logStudyAttempt({ contentType: 'jlpt_reading', itemId: item.id, isCorrect: ok, answerText: item.comprehension.options[sel], durationMs: start ? Date.now() - start : undefined })
    if (ok && !localMastered.has(item.id)) {
      setLocalMastered(prev => { const n = new Set(prev); n.add(item.id); return n })
      onToggleMastery?.(item.id); emitMastery(1)
    } else if (!ok && localMastered.has(item.id)) {
      // 暗記済みを再テストして不正解 → リアルタイムでチェック解除
      setLocalMastered(prev => { const n = new Set(prev); n.delete(item.id); return n })
      onToggleMastery?.(item.id); emitMastery(-1)
    }
  }

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

  function toggleTranslation(id: string) {
    setShowTranslation(prev => ({ ...prev, [id]: !prev[id] }))
  }

  return (
    <div className="divide-y divide-gray-100 dark:divide-gray-700">
      {items.map((item) => (
        <div key={item.id} className="py-3">
          <div
            role="button"
            tabIndex={0}
            onClick={() => { const opening = expandedId !== item.id; setExpandedId(opening ? item.id : null); if (opening && !shownAtRef.current[item.id]) shownAtRef.current[item.id] = Date.now() }}
            onKeyDown={(e) => { if (e.key === 'Enter' || e.key === ' ') setExpandedId(expandedId === item.id ? null : item.id) }}
            className="flex w-full cursor-pointer items-center gap-4 text-left"
          >
            {onToggleMastery && (
              <MasteryCheck done={localMastered.has(item.id)} title={localMastered.has(item.id) ? '学習完了' : '未完了（読解チェックに正解で完了）'} />
            )}
            <div className="min-w-0 flex-1">
              <div className="flex items-center gap-2">
                <span className="text-lg font-semibold text-gray-900 dark:text-white">{item.title}</span>
                <span className="rounded-full bg-indigo-50 px-2 py-0.5 text-xs text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-300">
                  {typeLabels[item.passage_type]}
                </span>
              </div>
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
            <div className="mt-3 space-y-3 select-none rounded-lg bg-gray-50 p-4 dark:bg-gray-700" onCopy={(e) => e.preventDefault()}>
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

              {/* 読解チェック(객관식) */}
              {item.comprehension && (
                <div className="border-t border-gray-200 pt-3 dark:border-gray-600">
                  <p className="text-xs font-medium uppercase text-gray-500 dark:text-gray-400">読解チェック</p>
                  <p className="mt-1 text-sm font-medium text-gray-900 dark:text-white">{item.comprehension.question}</p>
                  <div className="mt-2 space-y-1.5">
                    {item.comprehension.options.map((opt, i) => {
                      const sel = answers[item.id] === i
                      const r = results[item.id]
                      let cls = 'border-gray-200 dark:border-gray-600'
                      if (r === 'correct') {
                        if (i === item.comprehension!.answer) cls = 'border-emerald-500 bg-emerald-50 dark:bg-emerald-900/20'
                      } else if (r === 'wrong') {
                        if (sel) cls = 'border-red-500 bg-red-50 dark:bg-red-900/20'
                      } else if (sel) cls = 'border-indigo-500 bg-indigo-50 dark:bg-indigo-900/20'
                      return (
                        <button key={i} disabled={r === 'correct'}
                          onClick={() => { if (results[item.id] === 'wrong') setResults(prev => { const n = { ...prev }; delete n[item.id]; return n }); setAnswers(prev => ({ ...prev, [item.id]: i })) }}
                          className={`block w-full rounded-lg border px-3 py-2 text-left text-sm text-gray-800 dark:text-gray-200 ${cls}`}>
                          {i + 1}. {opt}
                        </button>
                      )
                    })}
                  </div>
                  {!results[item.id] ? (
                    <button onClick={() => submitQuiz(item)} disabled={answers[item.id] == null}
                      className="mt-2 rounded-lg bg-indigo-600 px-4 py-1.5 text-sm font-semibold text-white hover:bg-indigo-500 disabled:opacity-50">確認</button>
                  ) : results[item.id] === 'correct' ? (
                    <p className="mt-2 text-sm font-semibold text-emerald-600">正解！読了チェックが付きました</p>
                  ) : (
                    <p className="mt-2 text-sm font-semibold text-red-600">不正解です。別の選択肢を選び直してください。</p>
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
