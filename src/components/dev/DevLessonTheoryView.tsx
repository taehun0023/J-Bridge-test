'use client'

import { useState } from 'react'
import MarkdownRenderer from '@/components/ui/MarkdownRenderer'

export default function DevLessonTheoryView({
  contentJa,
  contentKo,
  initialLang,
  keyPoints,
  misconceptions,
}: {
  contentJa: string
  contentKo: string | null
  initialLang: 'ja' | 'ko'
  keyPoints: string[]
  misconceptions: string[]
}) {
  const [lang, setLang] = useState<'ja' | 'ko'>(initialLang === 'ko' && contentKo ? 'ko' : 'ja')
  const referenceContent = lang === 'ko' && contentKo ? contentKo : contentJa

  return (
    <div>
      {contentKo && (
        <div className="mb-4 flex gap-2">
          {(['ja', 'ko'] as const).map((l) => (
            <button
              key={l}
              onClick={() => setLang(l)}
              className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${
                lang === l
                  ? 'bg-blue-600 text-white'
                  : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300'
              }`}
            >
              {l === 'ja' ? '日本語' : '한국어'}
            </button>
          ))}
        </div>
      )}

      {keyPoints.length > 0 && (
        <section className="mb-5 rounded-2xl border border-indigo-200 bg-indigo-50/60 p-4 dark:border-indigo-900 dark:bg-indigo-950/20">
          <p className="text-xs font-semibold uppercase tracking-[0.18em] text-indigo-600 dark:text-indigo-400">
            要点
          </p>
          <ul className="mt-3 space-y-2 text-sm text-gray-700 dark:text-gray-300">
            {keyPoints.map((point) => (
              <li key={point} className="flex gap-2">
                <span className="mt-1 h-1.5 w-1.5 shrink-0 rounded-full bg-indigo-500" />
                <span className="leading-6">{point}</span>
              </li>
            ))}
          </ul>
        </section>
      )}

      <div className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
        <MarkdownRenderer content={referenceContent} />
      </div>

      {misconceptions.length > 0 && (
        <section className="mt-5 rounded-2xl border border-amber-200 bg-amber-50 p-4 dark:border-amber-900 dark:bg-amber-950/20">
          <p className="text-xs font-semibold uppercase tracking-[0.18em] text-amber-600 dark:text-amber-400">
            よくある誤解
          </p>
          <ul className="mt-3 space-y-2 text-sm text-amber-900 dark:text-amber-200">
            {misconceptions.map((item) => (
              <li key={item} className="flex gap-2">
                <span className="shrink-0">⚠️</span>
                <span className="leading-6">{item}</span>
              </li>
            ))}
          </ul>
        </section>
      )}
    </div>
  )
}
