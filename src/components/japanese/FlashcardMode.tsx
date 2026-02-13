'use client'

import { useState, useCallback, useMemo, useEffect } from 'react'
import TtsButton from './TtsButton'

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

type MasteryFilter = '' | 'mastered' | 'unmastered'

export default function FlashcardMode({ items, onClose, masteredIds = [], onToggleMastery }: FlashcardModeProps) {
  const [index, setIndex] = useState(0)
  const [flipped, setFlipped] = useState(false)
  const [localMastered, setLocalMastered] = useState<Set<string>>(new Set(masteredIds))
  const [filter, setFilter] = useState<MasteryFilter>('')

  useEffect(() => {
    setLocalMastered(new Set(masteredIds))
  }, [masteredIds])

  const filteredItems = useMemo(() => {
    if (!filter) return items
    if (filter === 'mastered') return items.filter(i => localMastered.has(i.id))
    return items.filter(i => !localMastered.has(i.id))
  }, [items, filter, localMastered])

  const current = filteredItems[index]

  const next = useCallback(() => {
    if (index < filteredItems.length - 1) {
      setIndex(index + 1)
      setFlipped(false)
    }
  }, [index, filteredItems.length])

  const prev = useCallback(() => {
    if (index > 0) {
      setIndex(index - 1)
      setFlipped(false)
    }
  }, [index])

  function handleToggle() {
    if (!current || !onToggleMastery) return
    const next = new Set(localMastered)
    if (next.has(current.id)) {
      next.delete(current.id)
    } else {
      next.add(current.id)
    }
    setLocalMastered(next)
    onToggleMastery(current.id)
  }

  // Reset index when filter changes and items reduce
  const safeIndex = Math.min(index, Math.max(0, filteredItems.length - 1))
  if (safeIndex !== index) setIndex(safeIndex)

  if (filteredItems.length === 0) {
    return (
      <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
        <div className="w-full max-w-lg text-center">
          <p className="text-lg text-white">該当するカードがありません</p>
          <button onClick={onClose} className="mt-4 rounded-lg px-4 py-2 text-sm font-medium text-white hover:bg-white/20">
            閉じる
          </button>
        </div>
      </div>
    )
  }

  if (!current) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
      <div className="w-full max-w-lg">
        {/* Header */}
        <div className="mb-4 flex items-center justify-between">
          <span className="text-sm font-medium text-white">
            {safeIndex + 1} / {filteredItems.length}
          </span>
          {/* Filter tabs */}
          {onToggleMastery && (
            <div className="flex gap-1">
              {(['', 'mastered', 'unmastered'] as const).map((f) => (
                <button
                  key={f}
                  onClick={() => { setFilter(f); setIndex(0); setFlipped(false) }}
                  className={`rounded px-2 py-1 text-xs font-medium ${
                    filter === f ? 'bg-white/30 text-white' : 'text-white/60 hover:text-white/80'
                  }`}
                >
                  {f === '' ? '全て' : f === 'mastered' ? '暗記済み' : '未暗記'}
                </button>
              ))}
            </div>
          )}
          <button
            onClick={onClose}
            className="rounded-lg px-3 py-1.5 text-sm font-medium text-white hover:bg-white/20"
          >
            閉じる
          </button>
        </div>

        {/* Card */}
        <button
          onClick={() => setFlipped(!flipped)}
          className="w-full rounded-2xl bg-white p-8 shadow-2xl transition-all hover:shadow-3xl min-h-[280px] flex flex-col items-center justify-center"
        >
          {!flipped ? (
            <>
              <div className="flex items-center gap-2">
                <p className="text-4xl font-bold text-gray-900">{current.word}</p>
                <TtsButton text={current.word} />
              </div>
              <p className="mt-2 text-lg text-gray-500">{current.reading}</p>
              <p className="mt-6 text-sm text-gray-400">クリックして意味を確認</p>
            </>
          ) : (
            <>
              <p className="text-2xl font-bold text-blue-600">{current.meaning_ko}</p>
              {current.example_sentence && (
                <div className="mt-6 text-center">
                  <p className="text-sm text-gray-700">{current.example_sentence}</p>
                  {current.example_sentence_ko && (
                    <p className="mt-1 text-sm text-gray-500">{current.example_sentence_ko}</p>
                  )}
                </div>
              )}
              <p className="mt-6 text-sm text-gray-400">クリックして次の単語</p>
            </>
          )}
        </button>

        {/* Mastery toggle + Navigation */}
        <div className="mt-4 flex items-center justify-between">
          <button
            onClick={prev}
            disabled={safeIndex === 0}
            className="rounded-lg px-4 py-2 text-sm font-medium text-white hover:bg-white/20 disabled:opacity-40"
          >
            前へ
          </button>
          {onToggleMastery && (
            <button
              onClick={handleToggle}
              className={`rounded-lg px-4 py-2 text-sm font-medium transition-colors ${
                localMastered.has(current.id)
                  ? 'bg-green-600 text-white hover:bg-green-700'
                  : 'bg-white/20 text-white hover:bg-white/30'
              }`}
            >
              {localMastered.has(current.id) ? '暗記済み' : '未暗記'}
            </button>
          )}
          <button
            onClick={next}
            disabled={safeIndex === filteredItems.length - 1}
            className="rounded-lg px-4 py-2 text-sm font-medium text-white hover:bg-white/20 disabled:opacity-40"
          >
            次へ
          </button>
        </div>
      </div>
    </div>
  )
}
