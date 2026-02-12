'use client'

import { useState, useCallback } from 'react'
import type { JlptGrammar } from '@/lib/supabase/types'

interface GrammarFlashcardProps {
  items: JlptGrammar[]
  onClose: () => void
}

export default function GrammarFlashcard({ items, onClose }: GrammarFlashcardProps) {
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

  const firstExample = current.example_sentences[0]

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
          className="w-full rounded-2xl bg-white p-8 shadow-2xl min-h-[320px] flex flex-col items-center justify-center dark:bg-gray-800"
        >
          {!flipped ? (
            <>
              <p className="text-3xl font-bold text-gray-900 dark:text-white">{current.pattern}</p>
              <p className="mt-3 text-sm text-gray-500 dark:text-gray-400">{current.formation}</p>
              <p className="mt-6 text-sm text-gray-400 dark:text-gray-500">クリックして意味を確認</p>
            </>
          ) : (
            <>
              <p className="text-2xl font-bold text-blue-600 dark:text-blue-400">{current.meaning_ko}</p>
              <p className="mt-2 text-sm text-gray-600 dark:text-gray-300">{current.meaning_ja}</p>
              {firstExample && (
                <div className="mt-5 text-center">
                  <p className="text-sm text-gray-700 dark:text-gray-200">{firstExample.ja}</p>
                  <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{firstExample.ko}</p>
                </div>
              )}
              <p className="mt-6 text-sm text-gray-400 dark:text-gray-500">クリックして次の文法</p>
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
