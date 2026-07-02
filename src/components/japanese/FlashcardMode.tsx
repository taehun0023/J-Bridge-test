'use client'

import { useState, useCallback, useEffect } from 'react'
import TtsButton from './TtsButton'
import { emitMastery } from './MasteryProgress'
import { logStudyAttempt } from '@/app/actions/study-log'

interface FlashcardItem {
  id: string
  word: string
  reading: string
  meaning_ko: string
  example_sentence: string | null
  example_sentence_ko: string | null
}

interface FlashcardModeProps {
  items: FlashcardItem[]
  onClose: () => void
  masteredIds?: string[]
  onToggleMastery?: (itemId: string) => void
}

/** 공백 제거 + 카타카나→히라가나 정규화 후 비교용 */
function normalizeReading(s: string): string {
  return s.trim().replace(/\s+/g, '').replace(/[ァ-ヶ]/g, c => String.fromCharCode(c.charCodeAt(0) - 0x60))
}

export default function FlashcardMode({ items, onClose, masteredIds = [], onToggleMastery }: FlashcardModeProps) {
  const [index, setIndex] = useState(0)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))
  const [input, setInput] = useState('')
  const [result, setResult] = useState<null | 'wrong'>(null)
  const [toast, setToast] = useState(false)

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

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
    const ok = normalizeReading(input) === normalizeReading(current.reading)
    void logStudyAttempt({ contentType: 'jlpt_vocab', itemId: current.id, isCorrect: ok, answerText: input })
    if (ok) {
      // 정답: 습득 체크 + 사라지는 녹색 토스트 → 바로 다음 카드
      if (onToggleMastery && !localMastered.has(current.id)) {
        const n = new Set(localMastered); n.add(current.id); setLocalMastered(n); onToggleMastery(current.id); emitMastery(1)
      }
      setToast(true)
      setTimeout(() => { setToast(false); next() }, 700)
    } else {
      setResult('wrong')
      // 暗記済みを再テストして不正解 → リアルタイムでチェック解除
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

  const isMastered = localMastered.has(current.id)

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
      {toast && (
        <div className="pointer-events-none fixed left-1/2 top-10 z-[60] -translate-x-1/2 animate-pulse rounded-lg bg-green-500 px-6 py-2 text-base font-bold text-white shadow-lg">
          正解！
        </div>
      )}
      <div className="w-full max-w-lg">
        <div className="flex min-h-[340px] w-full flex-col rounded-2xl bg-white p-6 shadow-2xl">
          {/* Header */}
          <div className="mb-2 flex items-center justify-between">
            <span className="text-sm font-bold text-gray-700">{safeIndex + 1} / {items.length}</span>
            <button onClick={onClose} className="rounded-lg border border-gray-300 px-3 py-1.5 text-sm font-semibold text-gray-700 hover:bg-gray-100">閉じる</button>
          </div>

          {/* Content */}
          <div className="flex flex-1 flex-col items-center justify-center py-4">
            <div className="flex items-center gap-2">
              <p className="text-4xl font-bold text-gray-900">{current.word}</p>
              <TtsButton text={current.word} />
              {isMastered && (
                <span className="ml-1 flex h-6 w-6 items-center justify-center rounded-full bg-green-500 text-sm font-bold text-white">✓</span>
              )}
            </div>

            {result === null ? (
              <div className="mt-6 w-full max-w-xs">
                <input
                  key={current.id}
                  autoFocus
                  autoComplete="off"
                  value={input}
                  onChange={(e) => setInput(e.target.value)}
                  onKeyDown={(e) => { if (e.key === 'Enter' && !e.nativeEvent.isComposing) check() }}
                  placeholder="ふりがなを入力"
                  className="w-full select-text rounded-lg border border-gray-300 px-3 py-2 text-center text-lg text-gray-900 focus:border-indigo-500 focus:outline-none"
                />
                <button onClick={check} disabled={!input.trim()} className="mt-3 w-full rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-500 disabled:opacity-50">
                  確認
                </button>
              </div>
            ) : (
              <div className="mt-5 w-full text-center">
                <p className="text-lg font-bold text-red-600">不正解（正解: {current.reading}）</p>
                <p className="mt-2 text-lg text-gray-700">{current.reading}</p>
                <p className="mt-1 text-xl font-bold text-blue-600">{current.meaning_ko}</p>
                {current.example_sentence && (
                  <div className="mt-4">
                    <p className="text-sm text-gray-700">{current.example_sentence}</p>
                    {current.example_sentence_ko && <p className="mt-1 text-sm text-gray-500">{current.example_sentence_ko}</p>}
                  </div>
                )}
                <button onClick={next} disabled={safeIndex === items.length - 1} className="mt-4 rounded-lg bg-gray-800 px-6 py-2 text-sm font-semibold text-white hover:bg-gray-700 disabled:opacity-40">
                  次へ
                </button>
              </div>
            )}
          </div>

          {/* Navigation */}
          <div className="mt-2 flex items-center justify-between gap-2 border-t border-gray-100 pt-3">
            <button onClick={prev} disabled={safeIndex === 0} className="rounded-lg border border-gray-300 bg-gray-50 px-4 py-2 text-sm font-semibold text-gray-700 hover:bg-gray-100 disabled:opacity-40">前へ</button>
            <span className="text-center text-xs text-gray-500">ふりがなを正しく入力すると習得チェックが付きます</span>
            <button onClick={next} disabled={safeIndex === items.length - 1} className="rounded-lg border border-gray-300 bg-gray-50 px-4 py-2 text-sm font-semibold text-gray-700 hover:bg-gray-100 disabled:opacity-40">次へ</button>
          </div>
        </div>
      </div>
    </div>
  )
}
