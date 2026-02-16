'use client'

import { useState } from 'react'
import MarkdownRenderer from './MarkdownRenderer'

interface Props {
  contentJa: string
  contentKo: string | null
}

export default function LessonContentToggle({ contentJa, contentKo }: Props) {
  const [lang, setLang] = useState<'ja' | 'ko'>('ja')
  const content = lang === 'ko' && contentKo ? contentKo : contentJa

  return (
    <div>
      {contentKo && (
        <div className="mb-4 flex gap-2">
          <button
            onClick={() => setLang('ja')}
            className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${
              lang === 'ja'
                ? 'bg-blue-600 text-white'
                : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'
            }`}
          >
            日本語
          </button>
          <button
            onClick={() => setLang('ko')}
            className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${
              lang === 'ko'
                ? 'bg-blue-600 text-white'
                : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'
            }`}
          >
            한국어
          </button>
        </div>
      )}
      <MarkdownRenderer content={content} />
    </div>
  )
}
