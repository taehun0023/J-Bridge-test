'use client'

import { useState, useCallback, useEffect } from 'react'
import type { JlptGrammar } from '@/lib/supabase/types'
import { emitMastery } from './MasteryProgress'
import { logStudyAttempt } from '@/app/actions/study-log'

interface GrammarFlashcardProps {
  items: JlptGrammar[]
  onClose: () => void
  masteredIds?: string[]
  onToggleMastery?: (itemId: string) => void
}

/** 비교용 정규화: 〜・공백・괄호 제거 */
const norm = (s: string) => s.replace(/[〜～\s（）()]/g, '').trim()

/** 예문에서 문법 핵심부(활용형 포함)를 （　）로 가린다. 못 가리면 null(앞면에 예문 숨김). */
function blankExample(ex: string, pattern: string): string | null {
  const core = pattern.replace(/[〜～\s]/g, '')
  if (!core) return null
  for (let len = core.length; len >= 2; len--) {
    const chunk = core.slice(0, len)
    if (ex.includes(chunk)) return ex.split(chunk).join('（　　）')
  }
  return null
}

export default function GrammarFlashcard({ items, onClose, masteredIds = [], onToggleMastery }: GrammarFlashcardProps) {
  const [index, setIndex] = useState(0)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))
  const [input, setInput] = useState('')
  const [result, setResult] = useState<null | 'wrong'>(null)
  const [toast, setToast] = useState(false)

  useEffect(() => { setLocalMastered(new Set(masteredIds)) }, [masteredIds])

  const current = items[index]

  const next = useCallback(() => {
    setInput(''); setResult(null)
    setIndex(i => (i < items.length - 1 ? i + 1 : i))
  }, [items.length])
  const prev = useCallback(() => {
    setInput(''); setResult(null)
    setIndex(i => (i > 0 ? i - 1 : i))
  }, [])

  function check() {
    if (!current || result || toast) return
    const ok = norm(input) === norm(current.pattern)
    void logStudyAttempt({ contentType: 'jlpt_grammar', itemId: current.id, isCorrect: ok, answerText: input })
    if (ok) {
      if (onToggleMastery && !localMastered.has(current.id)) {
        const n = new Set(localMastered); n.add(current.id); setLocalMastered(n); onToggleMastery(current.id); emitMastery(1)
      }
      setToast(true)
      setTimeout(() => { setToast(false); next() }, 700)
    } else {
      setResult('wrong')
      // 暗記済みを再テストして不正解 → リアルタイムでチェック解除 (어휘·독해·청해와 통일)
      if (onToggleMastery && localMastered.has(current.id)) {
        const n = new Set(localMastered); n.delete(current.id); setLocalMastered(n); onToggleMastery(current.id); emitMastery(-1)
      }
    }
  }

  const safeIndex = Math.min(index, Math.max(0, items.length - 1))
  if (safeIndex !== index) setIndex(safeIndex)

  if (items.length === 0) {
    return (
      <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
        <div className="w-full max-w-lg text-center">
          <p className="text-lg text-white">該当するカードがありません</p>
          <button onClick={onClose} className="mt-4 rounded-lg px-4 py-2 text-sm font-medium text-white hover:bg-white/20">閉じる</button>
        </div>
      </div>
    )
  }
  if (!current) return null

  const firstExample = current.example_sentences[0]
  const blanked = firstExample ? blankExample(firstExample.ja, current.pattern) : null
  const isMastered = localMastered.has(current.id)

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
      {toast && (
        <div className="pointer-events-none fixed left-1/2 top-10 z-[60] -translate-x-1/2 animate-pulse rounded-lg bg-green-500 px-6 py-2 text-base font-bold text-white shadow-lg">
          正解！
        </div>
      )}
      <div className="w-full max-w-lg">
        <div className="flex min-h-[360px] w-full flex-col rounded-2xl bg-white p-6 shadow-2xl">
          {/* Header */}
          <div className="mb-2 flex items-center justify-between">
            <span className="text-sm font-bold text-gray-700">{safeIndex + 1} / {items.length}</span>
            <button onClick={onClose} className="rounded-lg border border-gray-300 px-3 py-1.5 text-sm font-semibold text-gray-700 hover:bg-gray-100">閉じる</button>
          </div>

          {/* Content */}
          <div className="flex flex-1 flex-col items-center justify-center py-4">
            {/* 의미(힌트) */}
            <p className="text-base font-semibold text-blue-600">{current.meaning_ko}</p>
            {/* 예문: 정답 노출 방지 — 빈칸 가능할 때만 앞면 표시, 오답 시 전체 공개 */}
            {result === null
              ? (firstExample && (
                  <div className="mt-4 w-full text-center">
                    <p className="text-lg text-gray-800">{blanked ?? firstExample.ja}</p>
                  </div>
                ))
              : (firstExample && (
                  <div className="mt-4 w-full text-center">
                    <p className="text-lg text-gray-800">{firstExample.ja}</p>
                    <p className="mt-1 text-sm text-gray-500">{firstExample.ko}</p>
                  </div>
                ))
            }
            {isMastered && (
              <span className="mt-3 flex h-6 w-6 items-center justify-center rounded-full bg-green-500 text-sm font-bold text-white">✓</span>
            )}

            {result === null ? (
              <div className="mt-5 w-full max-w-sm">
                <input
                  key={current.id}
                  autoFocus
                  autoComplete="off"
                  value={input}
                  onChange={(e) => setInput(e.target.value)}
                  onKeyDown={(e) => { if (e.key === 'Enter' && !e.nativeEvent.isComposing) check() }}
                  placeholder="文法を入力"
                  className="w-full select-text rounded-lg border border-gray-300 px-3 py-2 text-center text-lg text-gray-900 focus:border-indigo-500 focus:outline-none"
                />
                <button onClick={check} disabled={!input.trim()} className="mt-3 w-full rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-500 disabled:opacity-50">
                  確認
                </button>
              </div>
            ) : (
              <div className="mt-5 w-full text-center">
                <p className="text-lg font-bold text-red-600">不正解</p>
                <p className="mt-2 text-2xl font-bold text-gray-900">{current.pattern}</p>
                {current.meaning_ja && <p className="mt-1 text-sm text-gray-600">{current.meaning_ja}</p>}
                <button onClick={next} disabled={safeIndex === items.length - 1} className="mt-4 rounded-lg bg-gray-800 px-6 py-2 text-sm font-semibold text-white hover:bg-gray-700 disabled:opacity-40">
                  次へ
                </button>
              </div>
            )}
          </div>

          {/* Navigation */}
          <div className="mt-2 flex items-center justify-between gap-2 border-t border-gray-100 pt-3">
            <button onClick={prev} disabled={safeIndex === 0} className="rounded-lg border border-gray-300 bg-gray-50 px-4 py-2 text-sm font-semibold text-gray-700 hover:bg-gray-100 disabled:opacity-40">前へ</button>
            <span className="text-center text-xs text-gray-500">文法を正しく入力すると習得チェックが付きます</span>
            <button onClick={next} disabled={safeIndex === items.length - 1} className="rounded-lg border border-gray-300 bg-gray-50 px-4 py-2 text-sm font-semibold text-gray-700 hover:bg-gray-100 disabled:opacity-40">次へ</button>
          </div>
        </div>
      </div>
    </div>
  )
}
