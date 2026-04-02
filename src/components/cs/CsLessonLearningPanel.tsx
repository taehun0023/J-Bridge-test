'use client'

import { useEffect, useMemo, useState } from 'react'
import { usePathname, useRouter, useSearchParams } from 'next/navigation'
import MarkdownRenderer from '@/components/ui/MarkdownRenderer'
import type { CsLessonInteractiveContent, CsLessonStageLocale, CsLessonStep } from '@/lib/cs-content'
import { shuffleArray } from '@/lib/shuffle'

interface Props {
  contentJa: string
  contentKo: string | null
  initialLang: 'ja' | 'ko'
  interactiveContent: CsLessonInteractiveContent | null
}

export default function CsLessonLearningPanel({
  contentJa,
  contentKo,
  initialLang,
  interactiveContent,
}: Props) {
  const router = useRouter()
  const pathname = usePathname()
  const searchParams = useSearchParams()
  const [lang, setLang] = useState<'ja' | 'ko'>(() =>
    initialLang === 'ko' && contentKo ? 'ko' : 'ja'
  )
  const [selectedAnswers, setSelectedAnswers] = useState<Record<string, string>>({})

  useEffect(() => {
    setLang(initialLang === 'ko' && contentKo ? 'ko' : 'ja')
  }, [contentKo, initialLang])

  const locale = useMemo<CsLessonStageLocale | null>(() => {
    if (!interactiveContent) return null
    if (lang === 'ko' && interactiveContent.ko) return interactiveContent.ko
    return interactiveContent.ja
  }, [interactiveContent, lang])

  const referenceContent = lang === 'ko' && contentKo ? contentKo : contentJa

  function handleLangChange(nextLang: 'ja' | 'ko') {
    const resolvedLang = nextLang === 'ko' && contentKo ? 'ko' : 'ja'
    setLang(resolvedLang)
    setSelectedAnswers({})

    const params = new URLSearchParams(searchParams.toString())
    params.set('lang', resolvedLang)
    const query = params.toString()
    router.replace(query ? `${pathname}?${query}` : pathname, { scroll: false })
  }

  return (
    <div>
      <div className="mb-5 flex items-center justify-between gap-3">
        <div>
          <p className="text-xs font-semibold uppercase tracking-[0.2em] text-indigo-600 dark:text-indigo-400">
            学習ガイド
          </p>
          <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
            短い説明、確認問題、具体例を順番にたどりながら理解を固めます。
          </p>
        </div>

        {contentKo && (
          <div className="flex gap-2">
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
      </div>

      {locale ? (
        <div className="space-y-4">
          <section className="rounded-2xl border border-indigo-200 bg-gradient-to-br from-indigo-50 via-white to-sky-50 p-5 dark:border-indigo-900 dark:from-indigo-950/50 dark:via-gray-900 dark:to-sky-950/30">
            <p className="text-xs font-semibold uppercase tracking-[0.18em] text-indigo-600 dark:text-indigo-400">
              ここから開始
            </p>
            <h2 className="mt-2 text-xl font-bold text-gray-900 dark:text-white">
              {locale.hook.title}
            </h2>
            <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">
              {locale.hook.prompt}
            </p>
            {locale.hook.takeaway && (
              <p className="mt-3 rounded-xl bg-white/80 px-4 py-3 text-sm text-gray-600 shadow-sm dark:bg-white/5 dark:text-gray-300">
                {locale.hook.takeaway}
              </p>
            )}
          </section>

          {locale.steps.map((step, index) => (
            <StepCard
              key={step.id}
              index={index}
              step={step}
              selectedOptionId={selectedAnswers[step.id] ?? null}
              onSelect={(optionId) =>
                setSelectedAnswers((prev) => ({ ...prev, [step.id]: optionId }))
              }
            />
          ))}
        </div>
      ) : (
        <div className="mb-4 rounded-xl border border-amber-200 bg-amber-50 p-4 text-sm text-amber-900 dark:border-amber-900 dark:bg-amber-950/30 dark:text-amber-200">
          このレッスンにはまだ段階型ガイドがありません。下の参考ノートを使って学習してください。
        </div>
      )}

      <details className="mt-6 rounded-2xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-900">
        <summary className="cursor-pointer list-none px-5 py-4 text-sm font-semibold text-gray-900 dark:text-white">
          {locale?.referenceLabel ?? '参考ノートを見る'}
        </summary>
        <div className="border-t border-gray-200 px-5 py-5 dark:border-gray-700">
          <MarkdownRenderer content={referenceContent} />
        </div>
      </details>
    </div>
  )
}

function StepCard({
  index,
  step,
  selectedOptionId,
  onSelect,
}: {
  index: number
  step: CsLessonStep
  selectedOptionId: string | null
  onSelect: (optionId: string) => void
}) {
  const stepLabel = `ステップ ${index + 1}`

  if (step.type === 'concept') {
    return (
      <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
        <p className="text-xs font-semibold uppercase tracking-[0.18em] text-gray-400">{stepLabel}</p>
        <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
        <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{step.body}</p>
        {step.bullets && step.bullets.length > 0 && (
          <ul className="mt-4 space-y-2 text-sm text-gray-700 dark:text-gray-300">
            {step.bullets.map((item) => (
              <li key={item} className="rounded-xl bg-gray-50 px-4 py-3 dark:bg-gray-800/70">
                {item}
              </li>
            ))}
          </ul>
        )}
      </section>
    )
  }

  if (step.type === 'worked_example') {
    return (
      <section className="rounded-2xl border border-emerald-200 bg-emerald-50/60 p-5 dark:border-emerald-900 dark:bg-emerald-950/20">
        <p className="text-xs font-semibold uppercase tracking-[0.18em] text-emerald-600 dark:text-emerald-400">
          {`具体例 ${index + 1}`}
        </p>
        <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
        <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{step.situation}</p>
        <ol className="mt-4 space-y-2 text-sm text-gray-700 dark:text-gray-300">
          {step.reasoning.map((item, itemIndex) => (
            <li key={item} className="flex gap-3 rounded-xl bg-white px-4 py-3 shadow-sm dark:bg-gray-900">
              <span className="font-semibold text-emerald-600 dark:text-emerald-400">
                {itemIndex + 1}
              </span>
              <span>{item}</span>
            </li>
          ))}
        </ol>
        <p className="mt-4 rounded-xl bg-emerald-100/70 px-4 py-3 text-sm text-emerald-900 dark:bg-emerald-900/30 dark:text-emerald-200">
          {step.takeaway}
        </p>
      </section>
    )
  }

  if (step.type === 'summary') {
    return (
      <section className="rounded-2xl border border-sky-200 bg-sky-50/70 p-5 dark:border-sky-900 dark:bg-sky-950/20">
        <p className="text-xs font-semibold uppercase tracking-[0.18em] text-sky-600 dark:text-sky-400">
          まとめ
        </p>
        <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
        <ul className="mt-4 space-y-2 text-sm text-gray-700 dark:text-gray-300">
          {step.bullets.map((item) => (
            <li key={item} className="rounded-xl bg-white px-4 py-3 shadow-sm dark:bg-gray-900">
              {item}
            </li>
          ))}
        </ul>
      </section>
    )
  }

  const OPTION_LABELS = ['A', 'B', 'C', 'D'] as const
  const shuffledOptions = useMemo(() => shuffleArray(step.options), [step.options])

  const isAnswered = !!selectedOptionId
  const isCorrect = selectedOptionId === step.correctOptionId

  return (
    <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
      <p className="text-xs font-semibold uppercase tracking-[0.18em] text-violet-500 dark:text-violet-400">
        {step.type === 'mini_check' ? `確認 ${index + 1}` : `応用 ${index + 1}`}
      </p>
      <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
      <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{step.prompt}</p>

      <div className="mt-4 space-y-2">
        {shuffledOptions.map((option, optIdx) => {
          const active = selectedOptionId === option.id
          return (
            <button
              key={option.id}
              onClick={() => onSelect(option.id)}
              className={`flex w-full items-start gap-3 rounded-xl border px-4 py-3 text-left text-sm transition-colors ${
                active
                  ? 'border-violet-500 bg-violet-50 text-violet-900 dark:bg-violet-950/30 dark:text-violet-100'
                  : 'border-gray-200 hover:border-gray-300 dark:border-gray-700 dark:hover:border-gray-500'
              }`}
            >
              <span className="mt-0.5 h-5 w-5 rounded-full border border-current text-center text-xs leading-5">
                {OPTION_LABELS[optIdx] ?? option.id}
              </span>
              <span>{option.text}</span>
            </button>
          )
        })}
      </div>

      {isAnswered && (
        <div
          className={`mt-4 rounded-xl px-4 py-3 text-sm ${
            isCorrect
              ? 'bg-emerald-50 text-emerald-900 dark:bg-emerald-950/30 dark:text-emerald-200'
              : 'bg-rose-50 text-rose-900 dark:bg-rose-950/30 dark:text-rose-200'
          }`}
        >
          <p className="font-semibold">{isCorrect ? '正解' : 'もう一度考えましょう'}</p>
          <p className="mt-1">{step.explanation}</p>
        </div>
      )}
    </section>
  )
}
