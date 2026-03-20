'use client'

import { useEffect, useState } from 'react'
import { usePathname, useRouter, useSearchParams } from 'next/navigation'
import MarkdownRenderer from './MarkdownRenderer'

interface Props {
  contentJa: string
  contentKo: string | null
  initialLang?: 'ja' | 'ko'
  syncSearchParamKey?: string
}

export default function LessonContentToggle({
  contentJa,
  contentKo,
  initialLang = 'ja',
  syncSearchParamKey,
}: Props) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()
  const [lang, setLang] = useState<'ja' | 'ko'>(() =>
    initialLang === 'ko' && contentKo ? 'ko' : 'ja'
  )

  useEffect(() => {
    setLang(initialLang === 'ko' && contentKo ? 'ko' : 'ja')
  }, [contentKo, initialLang])

  const content = lang === 'ko' && contentKo ? contentKo : contentJa

  const handleLangChange = (nextLang: 'ja' | 'ko') => {
    const resolvedLang = nextLang === 'ko' && contentKo ? 'ko' : 'ja'
    setLang(resolvedLang)

    if (!syncSearchParamKey) return

    const params = new URLSearchParams(searchParams.toString())
    params.set(syncSearchParamKey, resolvedLang)
    const query = params.toString()
    router.replace(query ? `${pathname}?${query}` : pathname, { scroll: false })
  }

  return (
    <div>
      {contentKo && (
        <div className="mb-4 flex gap-2">
          <button
            onClick={() => handleLangChange('ja')}
            className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${
              lang === 'ja'
                ? 'bg-blue-600 text-white'
                : 'bg-gray-100 text-gray-600 hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600'
            }`}
          >
            日本語
          </button>
          <button
            onClick={() => handleLangChange('ko')}
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
