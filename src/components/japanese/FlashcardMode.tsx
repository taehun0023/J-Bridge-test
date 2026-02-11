'use client'

import { useState, useCallback } from 'react'

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
}

export default function FlashcardMode({ items, onClose }: FlashcardModeProps) {
  const [index, setIndex] = useState(0)
  const [flipped, setFlipped] = useState(false)

  const current = items[index]

  const next = useCallback(() => {
    if (index < items.length - 1) {
      setIndex(index + 1)
      setFlipped(false)
    }
  }, [index, items.length])

  const prev = useCallback(() => {
    if (index > 0) {
      setIndex(index - 1)
      setFlipped(false)
    }
  }, [index])

  if (!current) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
      <div className="w-full max-w-lg">
        {/* Header */}
        <div className="mb-4 flex items-center justify-between">
          <span className="text-sm font-medium text-white">
            {index + 1} / {items.length}
          </span>
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
              <p className="text-4xl font-bold text-gray-900">{current.word}</p>
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

        {/* Navigation */}
        <div className="mt-4 flex justify-between">
          <button
            onClick={prev}
            disabled={index === 0}
            className="rounded-lg px-4 py-2 text-sm font-medium text-white hover:bg-white/20 disabled:opacity-40"
          >
            前へ
          </button>
          <button
            onClick={next}
            disabled={index === items.length - 1}
            className="rounded-lg px-4 py-2 text-sm font-medium text-white hover:bg-white/20 disabled:opacity-40"
          >
            次へ
          </button>
        </div>
      </div>
    </div>
  )
}
