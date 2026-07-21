'use client'

import { useEffect, useMemo, useRef, useState, type Dispatch, type SetStateAction } from 'react'
import { BookOpen, ChevronDown } from 'lucide-react'
import MarkdownRenderer from '@/components/ui/MarkdownRenderer'
import { CodeExerciseResult } from '@/components/cs/CsLessonLearningPanel'
import { markDevLessonComplete } from '@/app/actions/dev-progress'
import { shuffleArray } from '@/lib/shuffle'
import { highlightJava } from '@/lib/java-highlight'
import { matchAnswer } from '@/lib/answer-match'
import type { CsLessonInteractiveContent, CsLessonStep } from '@/lib/cs-content'

function needsAnswer(step: CsLessonStep): boolean {
  return 'options' in step || step.type === 'order' || step.type === 'code_exercise'
}

/** 백틱(`code`)으로 감싼 부분을 인라인 코드로 렌더한다. */
function renderInline(text: string) {
  return text.split(/(`[^`]+`)/g).map((part, i) =>
    /^`[^`]+`$/.test(part) ? (
      <code
        key={i}
        className="rounded bg-gray-100 px-1 py-0.5 font-mono text-[0.9em] text-violet-700 dark:bg-gray-800 dark:text-violet-300"
      >
        {part.slice(1, -1)}
      </code>
    ) : (
      <span key={i}>{part}</span>
    ),
  )
}

const FILE_NAME: Record<string, string> = {
  html: 'index.html',
  css: 'styles.css',
  js: 'script.js',
  javascript: 'script.js',
  java: 'Main.java',
  python: 'main.py',
  sql: 'query.sql',
}

/**
 * 웹(데스크톱) 학습사이트식 분할 화면 (Codecademy 스타일).
 * 왼쪽 = 説明(理論 + 問題文), 오른쪽 = コードエディタ + 実行結果. 스텝 네비게이션.
 * 같은 code_exercise 콘텐츠를 모바일 3탭과 공유.
 */
export default function DevLessonWebSplit({
  interactiveContent,
  initialLang,
  contentJa,
  contentKo,
  lessonId,
  courseId,
  isAdmin = false,
  index: controlledIndex,
  onIndexChange,
}: {
  interactiveContent: CsLessonInteractiveContent
  initialLang: 'ja' | 'ko'
  contentJa: string
  contentKo: string | null
  lessonId: string
  courseId: string
  /** 관리자면 문제를 풀지 않아도 다음으로 진행 가능 */
  isAdmin?: boolean
  /** 웹/모바일 위치 공유용(controlled). 없으면 내부 상태 사용 */
  index?: number
  onIndexChange?: Dispatch<SetStateAction<number>>
}) {
  const hasKo = !!interactiveContent.ko || !!contentKo
  const [lang, setLang] = useState<'ja' | 'ko'>(initialLang === 'ko' && hasKo ? 'ko' : 'ja')
  const locale = lang === 'ko' && interactiveContent.ko ? interactiveContent.ko : interactiveContent.ja
  const referenceContent = lang === 'ko' && contentKo ? contentKo : contentJa

  // 웹은 問題(確認)만 순차 진행 — 理論은 별도 컬럼으로 노출하지 않음(参考ノート로 대체)
  const problems = useMemo(() => locale.steps.filter(needsAnswer), [locale])

  const total = problems.length
  const [internalIndex, setInternalIndex] = useState(0)
  const index = controlledIndex ?? internalIndex
  const setIndex = onIndexChange ?? setInternalIndex
  const [solved, setSolved] = useState<Record<string, boolean>>({})

  // 문제 전부 정답 → 레슨 자동 완료(과목 경로 번호가 녹색으로)
  const completedRef = useRef(false)
  useEffect(() => {
    if (completedRef.current) return
    if (problems.length > 0 && problems.every((p) => solved[p.id])) {
      completedRef.current = true
      markDevLessonComplete(lessonId, courseId)
    }
  }, [solved, problems, lessonId, courseId])

  const currentProblem = problems[index]
  // 관리자는 문제 정답 없이도 다음 진행 허용
  const canNext = isAdmin || !currentProblem || !!solved[currentProblem.id]

  return (
    <div className="overflow-hidden rounded-2xl border border-gray-200 shadow-sm dark:border-gray-700">
      {/* 상단 바 */}
      <div className="flex items-center justify-between border-b border-gray-200 bg-gray-50 px-5 py-3 dark:border-gray-700 dark:bg-gray-900/60">
        <span className="text-xs font-semibold uppercase tracking-[0.16em] text-gray-500 dark:text-gray-400">
          レッスン · {index + 1} / {total}
        </span>
        {hasKo && (
          <div className="flex gap-1.5">
            {(['ja', 'ko'] as const).map((l) => (
              <button
                key={l}
                onClick={() => setLang(l)}
                className={`rounded-md px-2.5 py-1 text-xs font-medium transition-colors ${
                  lang === l
                    ? 'bg-blue-600 text-white'
                    : 'bg-gray-200 text-gray-600 hover:bg-gray-300 dark:bg-gray-700 dark:text-gray-300'
                }`}
              >
                {l === 'ja' ? '日本語' : '한국어'}
              </button>
            ))}
          </div>
        )}
      </div>

      <div className="grid min-h-[540px] lg:grid-cols-2">
        {/* 왼쪽 — 確認(問題) + ワークスペース (넓게) */}
        <div className="flex flex-col border-b border-gray-200 bg-white lg:border-b-0 lg:border-r dark:border-gray-700 dark:bg-gray-900">
          {currentProblem ? (
            <>
              <div className="border-b border-gray-200 px-6 py-5 dark:border-gray-700">
                <p className="text-xs font-semibold uppercase tracking-[0.16em] text-violet-600 dark:text-violet-400">
                  確認 {index + 1}
                </p>
                <h4 className="mt-2 text-base font-semibold text-gray-900 dark:text-white">
                  {currentProblem.title}
                </h4>
                {'prompt' in currentProblem && currentProblem.prompt && (
                  currentProblem.prompt.includes('```') ? (
                    <div className="mt-1.5 text-sm leading-7 text-gray-600 dark:text-gray-300">
                      <MarkdownRenderer content={currentProblem.prompt} />
                    </div>
                  ) : (
                    <p className="mt-1.5 whitespace-pre-line text-sm leading-7 text-gray-600 dark:text-gray-300">
                      {renderInline(currentProblem.prompt)}
                    </p>
                  )
                )}
                {'code' in currentProblem && currentProblem.code && (
                  <pre className="mt-3 overflow-x-auto rounded-lg border border-gray-800 bg-[#0d1117] p-3 text-[13px] leading-6">
                    <code className="font-mono text-gray-100">{highlightJava(currentProblem.code)}</code>
                  </pre>
                )}
              </div>
              <Workspace
                key={currentProblem.id}
                step={currentProblem}
                onSolved={(ok) => setSolved((s) => ({ ...s, [currentProblem.id]: ok }))}
              />
            </>
          ) : (
            <div className="flex flex-1 items-center justify-center p-10 text-center text-sm text-gray-400">
              この位置に問題はありません。
            </div>
          )}
        </div>

        {/* 오른쪽 — 実行結果(문제와 분리해서 따로 표시) */}
        <div className="flex flex-col bg-gray-50 dark:bg-gray-900/40">
          <div className="border-b border-gray-200 px-6 py-5 dark:border-gray-700">
            <p className="text-xs font-semibold uppercase tracking-[0.16em] text-emerald-600 dark:text-emerald-400">
              実行結果
            </p>
          </div>
          <div className="flex-1 overflow-y-auto px-6 py-5">
            <ResultPanel step={currentProblem} solved={!!currentProblem && !!solved[currentProblem.id]} />
          </div>
        </div>
      </div>

      {/* 하단 네비 */}
      <div className="flex items-center justify-between border-t border-gray-200 bg-gray-50 px-5 py-3 dark:border-gray-700 dark:bg-gray-900/60">
        <button
          onClick={() => setIndex((i) => Math.max(0, i - 1))}
          disabled={index === 0}
          className="rounded-lg border border-gray-200 px-4 py-2 text-sm font-medium text-gray-700 transition-colors hover:bg-white disabled:opacity-40 dark:border-gray-700 dark:text-gray-200 dark:hover:bg-gray-800"
        >
          ‹ 前へ
        </button>
        <span className="text-xs text-gray-400">
          {canNext ? '' : '問題を解くと次へ進めます'}
        </span>
        <button
          onClick={() => setIndex((i) => Math.min(total - 1, i + 1))}
          disabled={index >= total - 1 || !canNext}
          className="rounded-lg bg-indigo-600 px-5 py-2 text-sm font-semibold text-white transition-colors hover:bg-indigo-500 disabled:opacity-40"
        >
          次へ ›
        </button>
      </div>

      {/* 参考ノート — 前へ/次へ 아래, 전체 폭, 작은 버튼 */}
      <details className="group border-t border-gray-200 dark:border-gray-700">
        <summary className="flex list-none cursor-pointer px-5 py-3">
          <span className="inline-flex items-center gap-1.5 rounded-md border border-gray-300 bg-white px-3 py-1.5 text-xs font-semibold text-gray-600 shadow-sm transition-colors hover:border-indigo-400 hover:bg-gray-50 dark:border-gray-600 dark:bg-gray-800 dark:text-gray-300 dark:hover:bg-gray-700">
            <BookOpen className="h-3.5 w-3.5" />
            {locale.referenceLabel ?? '参考ノートを見る'}
            <ChevronDown className="h-3.5 w-3.5 transition-transform group-open:rotate-180" />
          </span>
        </summary>
        <div className="border-t border-gray-200 px-5 py-5 dark:border-gray-700">
          <MarkdownRenderer content={referenceContent} />
        </div>
      </details>
    </div>
  )
}

/* ---------- 오른쪽 実行結果 패널 (문제와 분리) ---------- */
function ResultPanel({ step, solved }: { step: CsLessonStep | undefined; solved: boolean }) {
  if (!step) return <p className="text-sm text-gray-400">—</p>
  if (!solved) {
    return (
      <p className="text-sm leading-7 text-gray-400">
        左で問題を解いて「実行」すると、ここに結果が表示されます。
      </p>
    )
  }
  return (
    <>
      <p className="mb-3 text-xs font-semibold text-emerald-600 dark:text-emerald-400">✓ 正解！</p>
      {step.type === 'code_exercise' && <CodeExerciseResult step={step} />}
      {'explanation' in step && step.explanation && (
        <p className="mt-3 text-sm leading-7 text-gray-600 dark:text-gray-400">{step.explanation}</p>
      )}
    </>
  )
}

/* ---------- 오른쪽 워크스페이스 ---------- */
function Workspace({ step, onSolved }: { step: CsLessonStep; onSolved: (ok: boolean) => void }) {
  if (step.type === 'code_exercise') return <WebCodeEditor step={step} onSolved={onSolved} />
  if (step.type === 'fill_blank') return <WebFillBlank step={step} onSolved={onSolved} />
  if (step.type === 'order') return <WebOrder step={step} onSolved={onSolved} />
  if (step.type === 'mini_check' || step.type === 'apply_check')
    return <WebChoice step={step} onSolved={onSolved} />
  return null
}

function EditorFrame({
  file,
  action,
  children,
}: {
  file: string
  action?: React.ReactNode
  children: React.ReactNode
}) {
  return (
    <div className="flex min-h-[300px] flex-col">
      <div className="flex items-center gap-2 bg-[#191c27] px-4 py-1.5">
        <span className="rounded-t-md bg-[#0f1119] px-3 py-1 font-mono text-xs text-gray-200">{file}</span>
        {action && <div className="ml-auto">{action}</div>}
      </div>
      {children}
    </div>
  )
}

/* code_exercise — 타이핑 코드 에디터 (빈칸에 직접 입력) */
function WebCodeEditor({
  step,
  onSolved,
}: {
  step: Extract<CsLessonStep, { type: 'code_exercise' }>
  onSolved: (ok: boolean) => void
}) {
  const parts = useMemo(() => step.codeTemplate.split(/(\[\[\d+\]\])/g), [step.codeTemplate])
  const tokenMode = step.inputMode === 'tokens'
  const [values, setValues] = useState<string[]>(Array(step.answers.length).fill(''))
  const [ran, setRan] = useState(false)
  // 카드(토큰) 선택 모드 상태
  const bank = useMemo(() => shuffleArray(step.tokens), [step.tokens])
  const [filled, setFilled] = useState<(string | null)[]>(Array(step.answers.length).fill(null))

  function change(i: number, val: string) {
    setValues((prev) => {
      const n = [...prev]
      n[i] = val
      return n
    })
    setRan(false)
    onSolved(false)
  }
  function run() {
    setRan(true)
    onSolved(values.every((v, i) => matchAnswer(v, step.answers[i], step.acceptedAnswers?.[i])))
  }
  function placeToken(token: string) {
    const slot = filled.indexOf(null)
    if (slot === -1) return
    const next = [...filled]
    next[slot] = token
    setFilled(next)
    if (next.every((f) => f !== null)) onSolved(next.every((f, i) => f === step.answers[i]))
  }
  function clearSlot(i: number) {
    if (filled[i] === null) return
    const next = [...filled]
    next[i] = null
    setFilled(next)
    onSolved(false)
  }

  let bi = -1
  if (tokenMode) {
    const usedCount = new Map<string, number>()
    filled.forEach((f) => f && usedCount.set(f, (usedCount.get(f) ?? 0) + 1))
    const bankCounts = new Map<string, number>()
    bank.forEach((t) => bankCounts.set(t, (bankCounts.get(t) ?? 0) + 1))
    const allFilled = filled.every((f) => f !== null)
    let bk = -1
    return (
      <EditorFrame file={FILE_NAME[step.lang] ?? 'code.txt'} action={null}>
        <pre className="flex-1 overflow-x-auto bg-[#0f1119] p-5 font-mono text-[13px] leading-[2.4] text-gray-100">
          <code>
            {parts.map((part, idx) => {
              if (!/^\[\[\d+\]\]$/.test(part)) return <span key={idx}>{highlightJava(part)}</span>
              bk += 1
              const i = bk
              const f = filled[i]
              const cls = allFilled
                ? f === step.answers[i]
                  ? 'border-emerald-400 text-emerald-200'
                  : 'border-rose-400 text-rose-200'
                : 'border-dashed border-indigo-400/70 text-indigo-200'
              return (
                <button
                  key={idx}
                  onClick={() => clearSlot(i)}
                  className={`mx-0.5 inline-block min-w-[64px] rounded-md border bg-white/5 px-2 text-center align-middle font-mono whitespace-pre ${cls}`}
                >
                  {f ?? ' '}
                </button>
              )
            })}
          </code>
        </pre>
        <div className="flex flex-wrap gap-2 border-t border-gray-800 bg-[#0d0f16] p-4">
          {bank.map((token, i) => {
            const remaining = (bankCounts.get(token) ?? 0) - (usedCount.get(token) ?? 0)
            const spent = remaining <= 0
            return (
              <button
                key={i}
                disabled={spent}
                onClick={() => placeToken(token)}
                className={`rounded-lg border px-3 py-2 font-mono text-[13px] whitespace-pre transition-colors ${
                  spent
                    ? 'border-gray-800 text-gray-600'
                    : 'border-gray-600 text-gray-100 hover:border-indigo-400'
                }`}
              >
                {token}
              </button>
            )
          })}
        </div>
      </EditorFrame>
    )
  }
  return (
    <EditorFrame
      file={FILE_NAME[step.lang] ?? 'code.txt'}
      action={
        <button
          onClick={run}
          className="rounded-md bg-emerald-500 px-3 py-1 text-xs font-semibold text-white transition-colors hover:bg-emerald-400"
        >
          ▶ 実行
        </button>
      }
    >
      <pre className="flex-1 overflow-x-auto bg-[#0f1119] p-5 font-mono text-[13px] leading-[2.1] text-gray-100">
        <code>
          {parts.map((part, idx) => {
            if (!/^\[\[\d+\]\]$/.test(part)) return <span key={idx}>{highlightJava(part)}</span>
            bi += 1
            const i = bi
            const v = values[i]
            const border = !ran
              ? 'border-indigo-400/70'
              : matchAnswer(v, step.answers[i], step.acceptedAnswers?.[i])
                ? 'border-emerald-400 text-emerald-200'
                : 'border-rose-400 text-rose-200'
            return (
              <input
                key={idx}
                value={v}
                onChange={(e) => change(i, e.target.value)}
                spellCheck={false}
                autoCapitalize="off"
                autoCorrect="off"
                style={{ width: `calc(${Math.max(3, step.answers[i].length)}ch + 1.4rem)` }}
                className={`mx-0.5 inline-block rounded border bg-white/5 px-1.5 text-center font-mono text-gray-100 outline-none focus:border-indigo-300 ${border}`}
              />
            )
          })}
        </code>
      </pre>
    </EditorFrame>
  )
}

/* fill_blank — 타이핑 단일 빈칸 */
function WebFillBlank({
  step,
  onSolved,
}: {
  step: Extract<CsLessonStep, { type: 'fill_blank' }>
  onSolved: (ok: boolean) => void
}) {
  const correctText = step.options.find((o) => o.id === step.correctOptionId)?.text ?? ''
  const [val, setVal] = useState('')
  const [ran, setRan] = useState(false)
  const norm = (s: string) => s.trim()
  const ok = ran && norm(val) === norm(correctText)

  return (
    <EditorFrame
      file="code"
      action={
        <button
          onClick={() => {
            setRan(true)
            onSolved(norm(val) === norm(correctText))
          }}
          className="rounded-md bg-emerald-500 px-3 py-1 text-xs font-semibold text-white transition-colors hover:bg-emerald-400"
        >
          ▶ 実行
        </button>
      }
    >
      <pre className="flex-1 overflow-x-auto bg-[#0f1119] p-5 font-mono text-[13px] leading-[2.1] text-gray-100">
        <code>
          {step.codeBefore}
          <input
            value={val}
            onChange={(e) => {
              setVal(e.target.value)
              setRan(false)
              onSolved(false)
            }}
            spellCheck={false}
            autoCapitalize="off"
            autoCorrect="off"
            style={{ width: `calc(${Math.max(3, correctText.length)}ch + 1.4rem)` }}
            className={`mx-0.5 inline-block rounded border bg-white/5 px-1.5 text-center font-mono text-gray-100 outline-none focus:border-indigo-300 ${
              !ran ? 'border-indigo-400/70' : ok ? 'border-emerald-400 text-emerald-200' : 'border-rose-400 text-rose-200'
            }`}
          />
          {step.codeAfter}
        </code>
      </pre>
    </EditorFrame>
  )
}

/* mini_check / apply_check — 선택식 */
function WebChoice({
  step,
  onSolved,
}: {
  step: Extract<CsLessonStep, { type: 'mini_check' | 'apply_check' }>
  onSolved: (ok: boolean) => void
}) {
  const opts = useMemo(() => shuffleArray(step.options), [step.options])
  const [sel, setSel] = useState<string | null>(null)
  const LABELS = ['A', 'B', 'C', 'D']

  return (
    <div className="flex flex-1 flex-col p-6">
      <div className="space-y-2">
        {opts.map((o, i) => {
          const active = sel === o.id
          const isRight = o.id === step.correctOptionId
          return (
            <button
              key={o.id}
              onClick={() => {
                setSel(o.id)
                onSolved(o.id === step.correctOptionId)
              }}
              className={`flex w-full items-start gap-3 rounded-xl border px-4 py-3 text-left text-sm transition-colors ${
                active
                  ? isRight
                    ? 'border-emerald-400 bg-emerald-50 dark:bg-emerald-950/30'
                    : 'border-rose-400 bg-rose-50 dark:bg-rose-950/30'
                  : 'border-gray-200 bg-white hover:border-indigo-400 dark:border-gray-700 dark:bg-gray-900'
              }`}
            >
              <span className="mt-0.5 h-5 w-5 rounded-full border border-current text-center text-xs leading-5 text-gray-500">
                {LABELS[i] ?? o.id}
              </span>
              <span className="text-gray-800 dark:text-gray-100">{renderInline(o.text)}</span>
            </button>
          )
        })}
      </div>
    </div>
  )
}

/* order — 순서 배열 */
function WebOrder({
  step,
  onSolved,
}: {
  step: Extract<CsLessonStep, { type: 'order' }>
  onSolved: (ok: boolean) => void
}) {
  const allCards = useMemo(
    () => [...step.items, ...(step.distractors ?? [])],
    [step.items, step.distractors]
  )
  const shuffled = useMemo(() => shuffleArray(allCards), [allCards])
  const [placed, setPlaced] = useState<string[]>([])
  const [submitted, setSubmitted] = useState(false)
  const textOf = (id: string) => allCards.find((i) => i.id === id)?.text ?? ''
  const pool = shuffled.map((i) => i.id).filter((id) => !placed.includes(id))
  const hasDistractors = (step.distractors?.length ?? 0) > 0
  const correctOrder = step.items.map((i) => i.id)
  const matches =
    placed.length === correctOrder.length &&
    placed.every((id, i) => textOf(id) === textOf(correctOrder[i]))
  // 오답 카드가 있으면 '확인' 제출로 채점, 없으면 전량 배치 시 자동 채점(기존 동작)
  const done = hasDistractors ? submitted : placed.length === allCards.length
  const correct = done && matches

  function push(id: string) {
    const next = [...placed, id]
    setPlaced(next)
    if (!hasDistractors && next.length === allCards.length) {
      onSolved(next.every((x, i) => textOf(x) === textOf(correctOrder[i])))
    }
  }

  function submit() {
    setSubmitted(true)
    onSolved(matches)
  }

  function reset() {
    setPlaced([])
    setSubmitted(false)
    onSolved(false)
  }

  return (
    <div className="flex flex-1 flex-col p-6">
      <div className="space-y-2 rounded-xl border border-dashed border-gray-300 p-3 dark:border-gray-600">
        {placed.length === 0 ? (
          <p className="py-2 text-center text-xs text-gray-400">下のブロックをクリックして順番に並べる</p>
        ) : (
          placed.map((id, i) => (
            <button
              key={id}
              onClick={() => {
                setPlaced(placed.filter((x) => x !== id))
                setSubmitted(false)
                onSolved(false)
              }}
              className="flex w-full items-center gap-3 rounded-lg bg-[#0f1119] px-3 py-2 text-left font-mono text-[13px] text-gray-100"
            >
              <span className="text-indigo-400">{i + 1}</span>
              <span className="flex-1 whitespace-pre">{textOf(id)}</span>
            </button>
          ))
        )}
      </div>
      {pool.length > 0 && (
        <div className="mt-3 flex flex-wrap gap-2">
          {pool.map((id) => (
            <button
              key={id}
              onClick={() => push(id)}
              className="rounded-lg border border-gray-300 bg-white px-3 py-2 font-mono whitespace-pre text-[13px] text-gray-800 hover:border-indigo-400 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-100"
            >
              {textOf(id)}
            </button>
          ))}
        </div>
      )}
      {hasDistractors && !submitted && placed.length > 0 && (
        <button
          onClick={submit}
          className="mt-4 self-start rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-500"
        >
          確認
        </button>
      )}
      {done && !correct && (
        <div className="mt-4 rounded-xl bg-rose-50 px-4 py-3 text-sm text-rose-900 dark:bg-rose-950/30 dark:text-rose-200">
          <p className="font-semibold">順序が違います</p>
          <button
            onClick={reset}
            className="mt-2 rounded-lg bg-white/70 px-3 py-1 text-xs font-medium dark:bg-white/10"
          >
            やり直す
          </button>
        </div>
      )}
    </div>
  )
}
