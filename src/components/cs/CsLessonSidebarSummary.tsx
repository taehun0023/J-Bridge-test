'use client'

import { useMemo } from 'react'
import { useSearchParams } from 'next/navigation'
import Card from '@/components/ui/Card'
import type { CsLessonInteractiveContent } from '@/lib/cs-content'

interface Props {
  initialLang: 'ja' | 'ko'
  hasKoreanContent: boolean
  keyPoints: string[]
  interactiveContent: CsLessonInteractiveContent | null
}

function getLocalizedSummaryPoints(
  lang: 'ja' | 'ko',
  interactiveContent: CsLessonInteractiveContent | null,
  fallbackKeyPoints: string[]
) {
  if (!interactiveContent) {
    return fallbackKeyPoints.slice(0, 4)
  }

  const locale = lang === 'ko' && interactiveContent.ko ? interactiveContent.ko : interactiveContent.ja
  const summaryStep = locale.steps.find((step) => step.type === 'summary')

  if (summaryStep?.type === 'summary' && summaryStep.bullets.length > 0) {
    return summaryStep.bullets.slice(0, 4)
  }

  return fallbackKeyPoints.slice(0, 4)
}

export default function CsLessonSidebarSummary({
  initialLang,
  hasKoreanContent,
  keyPoints,
  interactiveContent,
}: Props) {
  const searchParams = useSearchParams()
  const langParam = searchParams.get('lang')
  const lang =
    langParam === 'ko' && hasKoreanContent
      ? 'ko'
      : initialLang === 'ko' && hasKoreanContent
        ? 'ko'
        : 'ja'

  const points = useMemo(
    () => getLocalizedSummaryPoints(lang, interactiveContent, keyPoints),
    [interactiveContent, keyPoints, lang]
  )

  return (
    <Card title="ひと目で整理">
      <ul className="space-y-2 text-sm text-gray-700 dark:text-gray-300">
        {points.map((point) => (
          <li key={point}>{point}</li>
        ))}
      </ul>
    </Card>
  )
}
