'use client'

import { useEffect, useMemo, useState } from 'react'
import { usePathname, useRouter, useSearchParams } from 'next/navigation'
import MarkdownRenderer from '@/components/ui/MarkdownRenderer'
import type { CsLessonInteractiveContent, CsLessonStageLocale, CsLessonStep } from '@/lib/cs-content'
import { shuffleArray } from '@/lib/shuffle'
import { matchAnswer } from '@/lib/answer-match'
import { highlightJava } from '@/lib/java-highlight'

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

          {(() => {
            const ordinals = computeTypeOrdinals(locale.steps)
            return locale.steps.map((step, index) => (
              <StepCard
                key={step.id}
                typeOrdinal={ordinals[index]}
                step={step}
                selectedOptionId={selectedAnswers[step.id] ?? null}
                onSelect={(optionId) =>
                  setSelectedAnswers((prev) => ({ ...prev, [step.id]: optionId }))
                }
              />
            ))
          })()}
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

/** 스텝 종류별로 1부터 세는 순번(예: ステップ1/確認1/ステップ2/確認2)을 계산 */
export function computeTypeOrdinals(steps: CsLessonStep[]): number[] {
  const seen: Record<string, number> = {}
  return steps.map((step) => {
    seen[step.type] = (seen[step.type] ?? 0) + 1
    return seen[step.type]
  })
}

export function StepCard({
  typeOrdinal,
  badgeLabel,
  step,
  selectedOptionId,
  onSelect,
  codeResultInline = true,
  wrongToast = false,
}: {
  typeOrdinal?: number
  /** 주어지면 종류별 라벨 대신 이 배지 텍스트를 모든 카드에 사용(예: 練習='確認 N', 理論='ステップ N') */
  badgeLabel?: string
  step: CsLessonStep
  selectedOptionId: string | null
  onSelect: (optionId: string) => void
  /** code_exercise 정답 결과를 카드 안에 바로 표시할지(웹/데스크톱). 모바일 3탭은 false로 두고 결과 탭에서 표시 */
  codeResultInline?: boolean
  /** true면 오답 시 인라인 빨간 박스 없이 토스트만(모바일 dev). CS 레슨은 false로 인라인 피드백 유지 */
  wrongToast?: boolean
}) {
  const stepLabel = badgeLabel ?? `ステップ ${typeOrdinal}`

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
          {badgeLabel ?? `具体例 ${typeOrdinal}`}
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
          {badgeLabel ?? 'まとめ'}
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

  if (step.type === 'fill_blank') {
    return (
      <FillBlankStep step={step} badgeLabel={badgeLabel} selectedOptionId={selectedOptionId} onSelect={onSelect} />
    )
  }

  if (step.type === 'order') {
    return <OrderStep step={step} badgeLabel={badgeLabel} answered={!!selectedOptionId} onSolved={() => onSelect('__done__')} />
  }

  if (step.type === 'code_exercise') {
    return (
      <CodeExerciseStep
        key={step.id}
        step={step}
        badgeLabel={badgeLabel}
        answered={selectedOptionId === '__correct__'}
        showResult={codeResultInline}
        wrongToast={wrongToast}
        onResult={(ok) => onSelect(ok ? '__correct__' : '__wrong__')}
      />
    )
  }

  const OPTION_LABELS = ['A', 'B', 'C', 'D'] as const
  const shuffledOptions = useMemo(() => shuffleArray(step.options), [step.options])

  const isAnswered = !!selectedOptionId
  const isCorrect = selectedOptionId === step.correctOptionId

  return (
    <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
      <p className="text-xs font-semibold uppercase tracking-[0.18em] text-violet-500 dark:text-violet-400">
        {badgeLabel ?? (step.type === 'mini_check' ? `確認 ${typeOrdinal}` : `応用 ${typeOrdinal}`)}
      </p>
      <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
      {step.prompt.includes('```') ? (
        <div className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">
          <MarkdownRenderer content={step.prompt} />
        </div>
      ) : (
        <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{step.prompt}</p>
      )}

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

      {isAnswered && (isCorrect || !wrongToast) && (
        <div
          className={`mt-4 rounded-xl px-4 py-3 text-sm ${
            isCorrect
              ? 'bg-emerald-50 text-emerald-900 dark:bg-emerald-950/30 dark:text-emerald-200'
              : 'bg-rose-50 text-rose-900 dark:bg-rose-950/30 dark:text-rose-200'
          }`}
        >
          <p className="font-semibold">{isCorrect ? '正解' : 'もう一度考えましょう'}</p>
          {isCorrect && <p className="mt-1">{step.explanation}</p>}
        </div>
      )}
    </section>
  )
}

type FillBlankStepData = Extract<CsLessonStep, { type: 'fill_blank' }>
type OrderStepData = Extract<CsLessonStep, { type: 'order' }>
type CodeExerciseData = Extract<CsLessonStep, { type: 'code_exercise' }>

/**
 * 주 포인터가 정밀(마우스/키보드)인지 — 코딩 문제 입력 방식 결정용.
 * fine=true → 타이핑 입력, false(터치) → 토큰 탭. 화면 폭이 아니라 기기 특성 기준.
 * SSR/초기 렌더는 false(토큰)로 하이드레이션 일치, 마운트 후 감지해 전환.
 */
function usePointerFine() {
  const [fine, setFine] = useState(false)
  useEffect(() => {
    if (typeof window === 'undefined' || !window.matchMedia) return
    const mq = window.matchMedia('(pointer: fine)')
    const apply = () => setFine(mq.matches)
    apply()
    mq.addEventListener?.('change', apply)
    return () => mq.removeEventListener?.('change', apply)
  }, [])
  return fine
}

/** 완성 코드 조립: [[i]] → answers[i] */
function assembleCode(step: CodeExerciseData, values: string[]): string {
  let code = step.codeTemplate
  values.forEach((v, i) => {
    code = code.replace(`[[${i}]]`, v)
  })
  return code
}

/** Mimo식 코드 완성 문제 — 빈칸을 토큰으로 채우고, 정답이면 결과(브라우저/콘솔/테이블) 표시 */
function CodeExerciseStep({
  step,
  badgeLabel,
  answered,
  showResult = true,
  wrongToast = false,
  onResult,
}: {
  step: CodeExerciseData
  badgeLabel?: string
  answered: boolean
  /** 정답 결과 패널을 이 카드 안에 표시할지 */
  showResult?: boolean
  /** true면 오답 시 빨간 힌트 박스 없이 토스트만 */
  wrongToast?: boolean
  onResult: (correct: boolean) => void
}) {
  const parts = useMemo(() => step.codeTemplate.split(/(\[\[\d+\]\])/g), [step.codeTemplate])
  const bank = useMemo(() => shuffleArray(step.tokens), [step.tokens])

  const pointerFine = usePointerFine()
  const [filled, setFilled] = useState<(string | null)[]>(() =>
    answered ? [...step.answers] : Array(step.answers.length).fill(null)
  )
  // 타이핑 모드(fine 포인터)용 입력값
  const [values, setValues] = useState<string[]>(() =>
    answered ? [...step.answers] : Array(step.answers.length).fill('')
  )
  const [checked, setChecked] = useState(answered)

  const allFilled = filled.every((f) => f !== null)
  const allCorrect = allFilled && filled.every((f, i) => f === step.answers[i])
  const typedCorrect = values.every((v, i) => matchAnswer(v, step.answers[i], step.acceptedAnswers?.[i]))
  // 모드별 정답 여부(결과/힌트 표시에 사용)
  const isCorrect = pointerFine ? typedCorrect : allCorrect

  function place(token: string) {
    const next = [...filled]
    const slot = next.indexOf(null)
    if (slot === -1) return
    next[slot] = token
    setFilled(next)
    if (next.every((f) => f !== null)) {
      setChecked(true)
      onResult(next.every((f, i) => f === step.answers[i]))
    }
  }

  function clearBlank(i: number) {
    if (filled[i] === null) return
    const next = [...filled]
    next[i] = null
    setFilled(next)
    setChecked(false)
  }

  /** 이미 놓인 토큰(뱅크)을 다시 탭 → 빈칸에서 빼서 제자리로 */
  function unplace(token: string) {
    const i = filled.indexOf(token)
    if (i === -1) return
    const next = [...filled]
    next[i] = null
    setFilled(next)
    setChecked(false)
  }

  // 타이핑 모드 — 각 빈칸 직접 입력 후 実行으로 채점(입력 중에는 채점/토스트 없음)
  function changeTyping(i: number, val: string) {
    setValues((prev) => {
      const n = [...prev]
      n[i] = val
      return n
    })
    setChecked(false)
  }
  function submitTyping() {
    setChecked(true)
    onResult(values.every((v, i) => matchAnswer(v, step.answers[i], step.acceptedAnswers?.[i])))
  }

  let blankIndex = -1

  return (
    <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
      <p className="text-xs font-semibold uppercase tracking-[0.18em] text-violet-500 dark:text-violet-400">
        {badgeLabel ?? 'コード完成'}
      </p>
      <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
      {step.prompt.includes('```') ? (
        <div className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">
          <MarkdownRenderer content={step.prompt} />
        </div>
      ) : (
        <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{step.prompt}</p>
      )}

      {/* 코드 + 빈칸 */}
      <pre className="mt-4 overflow-x-auto rounded-xl bg-gray-900 p-4 text-sm leading-7 text-gray-100">
        <code className="font-mono">
          {parts.map((part, idx) => {
            const isBlank = /^\[\[\d+\]\]$/.test(part)
            if (!isBlank) return <span key={idx}>{highlightJava(part)}</span>
            blankIndex += 1
            const i = blankIndex
            const value = filled[i]
            const state = !checked
              ? value
                ? 'filled'
                : 'empty'
              : value === step.answers[i]
                ? 'correct'
                : 'wrong'
            const cls =
              state === 'correct'
                ? 'border-emerald-400 bg-emerald-500/25 text-emerald-100'
                : state === 'wrong'
                  ? 'border-rose-400 bg-rose-500/25 text-rose-50'
                  : state === 'filled'
                    ? 'border-violet-400 bg-violet-500/25 text-white'
                    : 'border-dashed border-gray-500 text-gray-400'
            return pointerFine ? (
              <input
                key={idx}
                value={values[i]}
                onChange={(e) => changeTyping(i, e.target.value)}
                spellCheck={false}
                autoCapitalize="off"
                autoCorrect="off"
                style={{ width: `calc(${Math.max(3, step.answers[i].length)}ch + 1.2rem)` }}
                className={`mx-0.5 inline-block rounded border bg-white/5 px-1.5 text-center font-mono text-gray-100 outline-none focus:border-indigo-300 ${
                  !checked
                    ? 'border-indigo-400/70'
                    : matchAnswer(values[i], step.answers[i], step.acceptedAnswers?.[i])
                      ? 'border-emerald-400 text-emerald-200'
                      : 'border-rose-400 text-rose-200'
                }`}
              />
            ) : (
              <button
                key={idx}
                onClick={() => clearBlank(i)}
                className={`mx-0.5 inline-block min-w-[68px] rounded-md border px-2 text-center font-mono transition-colors ${cls}`}
              >
                {value ?? '____'}
              </button>
            )
          })}
        </code>
      </pre>

      {/* 타이핑 모드(fine 포인터) → 実行 버튼 채점 / 터치 → 토큰 뱅크 탭 */}
      {pointerFine ? (
        <button
          onClick={submitTyping}
          className="mt-4 rounded-lg bg-emerald-500 px-4 py-2 text-sm font-semibold text-white transition-colors hover:bg-emerald-400"
        >
          ▶ 実行
        </button>
      ) : (
        <div className="mt-4 flex flex-wrap gap-2">
          {(() => {
            // 개수 기반: 같은 값의 토큰이 여러 개여도 각각 사용 가능
            const usedCount: Record<string, number> = {}
            filled.forEach((f) => {
              if (f !== null) usedCount[f] = (usedCount[f] || 0) + 1
            })
            const seen: Record<string, number> = {}
            return bank.map((token, bi) => {
              seen[token] = (seen[token] || 0) + 1
              const used = seen[token] <= (usedCount[token] || 0)
              return (
                <button
                  key={bi}
                  onClick={() => (used ? unplace(token) : place(token))}
                  className={`rounded-lg border px-3 py-2 font-mono text-sm transition-colors ${
                    used
                      ? 'border-gray-200 opacity-40 hover:opacity-70 dark:border-gray-700'
                      : 'border-gray-200 hover:border-violet-400 dark:border-gray-700 dark:hover:border-violet-500'
                  }`}
                >
                  {token}
                </button>
              )
            })
          })()}
        </div>
      )}

      {/* 결과 or 힌트 */}
      {checked && isCorrect && showResult && <CodeExerciseResult step={step} />}
      {checked && !isCorrect && !wrongToast && (
        <div className="mt-4 rounded-xl bg-rose-50 px-4 py-3 text-sm text-rose-900 dark:bg-rose-950/30 dark:text-rose-200">
          <p className="font-semibold">もう一度考えましょう</p>
          <p className="mt-1">
            {pointerFine ? '間違っている空欄を直して再実行してください。' : '間違っている空欄をタップして選び直してください。'}
          </p>
        </div>
      )}
      {checked && isCorrect && (
        <p className="mt-3 text-sm leading-7 text-gray-600 dark:text-gray-400">{step.explanation}</p>
      )}
    </section>
  )
}

/** 정답 시 결과 패널 — 언어별로 브라우저/콘솔/테이블 */
export function CodeExerciseResult({ step }: { step: CodeExerciseData }) {
  const { result } = step

  if (result.kind === 'browser') {
    const body = assembleCode(step, step.answers)
    const doc = /<html/i.test(body)
      ? body
      : `<!doctype html><meta name="viewport" content="width=device-width,initial-scale=1"><style>body{margin:0;font-family:system-ui,-apple-system,sans-serif;display:grid;place-items:center;min-height:120px;padding:20px;gap:12px}</style>${body}`
    const allowScripts = step.lang === 'js' || step.lang === 'javascript'
    return (
      <div className="mt-4 overflow-hidden rounded-xl border border-gray-200 dark:border-gray-700">
        <div className="flex items-center gap-1.5 bg-gray-800 px-3 py-2">
          <span className="h-2.5 w-2.5 rounded-full bg-[#ff5f57]" />
          <span className="h-2.5 w-2.5 rounded-full bg-[#febc2e]" />
          <span className="h-2.5 w-2.5 rounded-full bg-[#28c840]" />
          <span className="ml-2 rounded bg-white/10 px-2 py-0.5 font-mono text-[10px] text-gray-300">
            preview
          </span>
        </div>
        <iframe
          title="コードの実行結果"
          sandbox={allowScripts ? 'allow-scripts' : ''}
          srcDoc={doc}
          className="h-44 w-full bg-white"
        />
      </div>
    )
  }

  if (result.kind === 'console') {
    return (
      <div className="mt-4 overflow-x-auto rounded-xl bg-gray-900 p-4 font-mono text-sm leading-7 text-gray-100">
        <p className="text-gray-500"># 実行結果</p>
        {result.output ? (
          <pre className="whitespace-pre-wrap text-emerald-300">{result.output}</pre>
        ) : (
          <pre className="whitespace-pre-wrap italic text-gray-500">（出力なし）</pre>
        )}
      </div>
    )
  }

  // table
  return (
    <div className="mt-4 overflow-x-auto rounded-xl border border-gray-200 dark:border-gray-700">
      <table className="w-full border-collapse font-mono text-xs">
        <thead>
          <tr>
            {result.columns.map((c) => (
              <th
                key={c}
                className="border border-gray-200 bg-gray-50 px-3 py-2 text-left font-semibold dark:border-gray-700 dark:bg-gray-800"
              >
                {c}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {result.rows.map((row, ri) => (
            <tr key={ri}>
              {row.map((cell, ci) => (
                <td key={ci} className="border border-gray-200 px-3 py-2 dark:border-gray-700">
                  {cell}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

/** Mimo식 빈칸 코드 채우기 — 코드의 빈칸을 토큰 탭으로 채운다 */
function FillBlankStep({
  step,
  badgeLabel,
  selectedOptionId,
  onSelect,
}: {
  step: FillBlankStepData
  badgeLabel?: string
  selectedOptionId: string | null
  onSelect: (optionId: string) => void
}) {
  const shuffled = useMemo(() => shuffleArray(step.options), [step.options])
  const answered = !!selectedOptionId
  const isCorrect = selectedOptionId === step.correctOptionId
  const selectedText = step.options.find((o) => o.id === selectedOptionId)?.text

  return (
    <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
      <p className="text-xs font-semibold uppercase tracking-[0.18em] text-violet-500 dark:text-violet-400">
        {badgeLabel ?? 'コード補完'}
      </p>
      <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
      {step.prompt.includes('```') ? (
        <div className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">
          <MarkdownRenderer content={step.prompt} />
        </div>
      ) : (
        <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{step.prompt}</p>
      )}

      <pre className="mt-4 overflow-x-auto rounded-xl bg-gray-900 p-4 text-sm leading-6 text-gray-100">
        <code>
          {step.codeBefore}
          <span
            className={`rounded px-2 py-0.5 font-semibold ${
              !answered
                ? 'bg-violet-500/30 text-violet-200'
                : isCorrect
                  ? 'bg-emerald-500/30 text-emerald-200'
                  : 'bg-rose-500/30 text-rose-200'
            }`}
          >
            {selectedText ?? '____'}
          </span>
          {step.codeAfter}
        </code>
      </pre>

      <div className="mt-4 flex flex-wrap gap-2">
        {shuffled.map((opt) => {
          const active = selectedOptionId === opt.id
          return (
            <button
              key={opt.id}
              onClick={() => onSelect(opt.id)}
              className={`rounded-lg border px-3 py-2 font-mono text-sm transition-colors ${
                active
                  ? 'border-violet-500 bg-violet-50 text-violet-900 dark:bg-violet-950/30 dark:text-violet-100'
                  : 'border-gray-200 hover:border-gray-300 dark:border-gray-700 dark:hover:border-gray-500'
              }`}
            >
              {opt.text}
            </button>
          )
        })}
      </div>

      {answered && (
        <div
          className={`mt-4 rounded-xl px-4 py-3 text-sm ${
            isCorrect
              ? 'bg-emerald-50 text-emerald-900 dark:bg-emerald-950/30 dark:text-emerald-200'
              : 'bg-rose-50 text-rose-900 dark:bg-rose-950/30 dark:text-rose-200'
          }`}
        >
          <p className="font-semibold">{isCorrect ? '正解' : 'もう一度考えましょう'}</p>
          {isCorrect && <p className="mt-1">{step.explanation}</p>}
        </div>
      )}
    </section>
  )
}

/** Mimo식 순서 배열 — 코드 블록을 탭으로 올바른 순서로 쌓는다 */
function OrderStep({
  step,
  badgeLabel,
  answered,
  onSolved,
}: {
  step: OrderStepData
  badgeLabel?: string
  answered: boolean
  onSolved: () => void
}) {
  const allCards = useMemo(
    () => [...step.items, ...(step.distractors ?? [])],
    [step.items, step.distractors]
  )
  const shuffled = useMemo(() => shuffleArray(allCards), [allCards])
  const [placed, setPlaced] = useState<string[]>([])
  const [submitted, setSubmitted] = useState(false)
  const textOf = (id: string) => allCards.find((i) => i.id === id)?.text ?? ''
  const poolIds = shuffled.map((i) => i.id).filter((id) => !placed.includes(id))
  const hasDistractors = (step.distractors?.length ?? 0) > 0
  const correctOrder = step.items.map((i) => i.id)
  const matches =
    placed.length === correctOrder.length &&
    placed.every((id, i) => textOf(id) === textOf(correctOrder[i]))
  // 오답 카드가 있으면 '確認' 제출로 채점, 없으면 전량 배치 시 자동 채점(기존 동작)
  const evaluated = hasDistractors ? submitted : placed.length === allCards.length
  const isCorrect = evaluated && matches

  useEffect(() => {
    if (evaluated && isCorrect && !answered) onSolved()
  }, [evaluated, isCorrect, answered, onSolved])

  return (
    <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
      <p className="text-xs font-semibold uppercase tracking-[0.18em] text-violet-500 dark:text-violet-400">
        {badgeLabel ?? '並べ替え'}
      </p>
      <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{step.title}</h3>
      {step.prompt.includes('```') ? (
        <div className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">
          <MarkdownRenderer content={step.prompt} />
        </div>
      ) : (
        <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{step.prompt}</p>
      )}

      <div className="mt-4 space-y-2 rounded-xl border border-dashed border-gray-300 p-3 dark:border-gray-600">
        {placed.length === 0 ? (
          <p className="py-2 text-center text-xs text-gray-400">下のブロックをタップして順番に並べる</p>
        ) : (
          placed.map((id, i) => (
            <button
              key={id}
              onClick={() => {
                setPlaced(placed.filter((x) => x !== id))
                setSubmitted(false)
              }}
              className="flex w-full items-center gap-3 rounded-lg bg-gray-900 px-3 py-2 text-left font-mono text-sm text-gray-100"
            >
              <span className="text-violet-400">{i + 1}</span>
              <span className="flex-1 whitespace-pre">{textOf(id)}</span>
            </button>
          ))
        )}
      </div>

      {poolIds.length > 0 && (
        <div className="mt-3 flex flex-wrap gap-2">
          {poolIds.map((id) => (
            <button
              key={id}
              onClick={() => setPlaced([...placed, id])}
              className="rounded-lg border border-gray-200 px-3 py-2 font-mono text-sm hover:border-gray-300 dark:border-gray-700 dark:hover:border-gray-500"
            >
              {textOf(id)}
            </button>
          ))}
        </div>
      )}

      {hasDistractors && !submitted && placed.length > 0 && (
        <button
          onClick={() => setSubmitted(true)}
          className="mt-4 rounded-lg bg-violet-600 px-4 py-2 text-sm font-semibold text-white hover:bg-violet-500"
        >
          確認
        </button>
      )}

      {evaluated && (
        <div
          className={`mt-4 rounded-xl px-4 py-3 text-sm ${
            isCorrect
              ? 'bg-emerald-50 text-emerald-900 dark:bg-emerald-950/30 dark:text-emerald-200'
              : 'bg-rose-50 text-rose-900 dark:bg-rose-950/30 dark:text-rose-200'
          }`}
        >
          <p className="font-semibold">{isCorrect ? '正解' : '順序が違います'}</p>
          {isCorrect && <p className="mt-1">{step.explanation}</p>}
          {!isCorrect && (
            <button
              onClick={() => {
                setPlaced([])
                setSubmitted(false)
              }}
              className="mt-2 rounded-lg bg-white/60 px-3 py-1 text-xs font-medium dark:bg-white/10"
            >
              やり直す
            </button>
          )}
        </div>
      )}
    </section>
  )
}
