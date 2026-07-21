'use client'

import { useEffect, useMemo, useRef, useState, type Dispatch, type SetStateAction } from 'react'
import Link from 'next/link'
import { CheckCircle2 } from 'lucide-react'
import { useLoadingTransition } from '@/lib/loading-store'
import { markDevLessonComplete } from '@/app/actions/dev-progress'
import { StepCard, CodeExerciseResult } from '@/components/cs/CsLessonLearningPanel'
import type { CsLessonInteractiveContent, CsLessonStep } from '@/lib/cs-content'

/** 정답/조작이 필요한 스텝인지 (問題=確認 카드) */
function needsAnswer(step: CsLessonStep): boolean {
  return 'options' in step || step.type === 'order' || step.type === 'code_exercise'
}

/** 정답까지 충족됐는지 — 정답이어야 다음 진행 허용 */
function isSatisfied(step: CsLessonStep, answer: string | undefined): boolean {
  if (!needsAnswer(step)) return true
  if (!answer) return false
  if ('correctOptionId' in step) return answer === step.correctOptionId
  if (step.type === 'order') return answer === '__done__'
  if (step.type === 'code_exercise') return answer === '__correct__'
  return true
}

/** 結果 탭 — 현재 問題의 결과(브라우저/콘솔/테이블) 또는 해설 */
function ResultView({ problem, solved }: { problem: CsLessonStep | undefined; solved: boolean }) {
  const placeholder = (msg: string) => (
    <div className="flex min-h-[40vh] flex-col items-center justify-center rounded-2xl border border-dashed border-gray-300 p-8 text-center text-sm text-gray-400 dark:border-gray-600">
      {msg}
    </div>
  )

  if (!problem) return placeholder('この位置に問題はありません。')
  if (!solved) return placeholder('問題を解くと、ここに結果が表示されます。')

  if (problem.type === 'code_exercise') {
    return (
      <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
        <p className="text-xs font-semibold uppercase tracking-[0.18em] text-emerald-600 dark:text-emerald-400">
          結果
        </p>
        <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{problem.title}</h3>
        <CodeExerciseResult step={problem} />
        <p className="mt-3 text-sm leading-7 text-gray-600 dark:text-gray-400">{problem.explanation}</p>
      </section>
    )
  }

  // 선택식/순서/빈칸 → 해설
  const explanation = 'explanation' in problem ? problem.explanation : ''
  return (
    <section className="rounded-2xl border border-gray-200 bg-white p-5 dark:border-gray-700 dark:bg-gray-900">
      <p className="text-xs font-semibold uppercase tracking-[0.18em] text-emerald-600 dark:text-emerald-400">
        正解！
      </p>
      <h3 className="mt-2 text-lg font-semibold text-gray-900 dark:text-white">{problem.title}</h3>
      <p className="mt-3 text-sm leading-7 text-gray-700 dark:text-gray-300">{explanation}</p>
    </section>
  )
}

export default function DevLessonStepPlayer({
  interactiveContent,
  lang,
  mode,
  lessonId,
  courseId,
  isCompleted,
  nextLessonHref,
  subjectHref,
  onSolved,
  onAdvance,
  onLockChange,
  index: controlledIndex,
  onIndexChange,
}: {
  interactiveContent: CsLessonInteractiveContent
  lang: 'ja' | 'ko'
  /** 問題=確認 카드 / 結果=현재 문제 결과 / 理論=ステップ 카드. 세 탭이 같은 index 공유 */
  mode: 'problem' | 'result' | 'theory'
  lessonId: string
  courseId: string
  isCompleted: boolean
  nextLessonHref?: string | null
  subjectHref: string
  /** 코딩 문제 정답 시 호출(부모가 結果 탭으로 자동전환) */
  onSolved?: () => void
  /** 다음 문제로 넘어갈 때 호출(부모가 問題 탭으로 자동복귀) */
  onAdvance?: () => void
  /** 現在 문제의 탭 잠금 상태 보고 — 結果=정답 시, 理論=풀었을 때(틀림/맞힘) 해제 */
  onLockChange?: (locks: { theoryUnlocked: boolean; resultUnlocked: boolean }) => void
  /** 웹/모바일 위치 공유용(controlled). 없으면 내부 상태 사용 */
  index?: number
  onIndexChange?: Dispatch<SetStateAction<number>>
}) {
  const locale = lang === 'ko' && interactiveContent.ko ? interactiveContent.ko : interactiveContent.ja

  // 같은 순번(position)에서 問題(確認)과 理論(ステップ)이 짝. 한쪽 없는 순번은 準備中.
  const { problemSteps, theorySteps } = useMemo(() => {
    const problem: CsLessonStep[] = []
    const theory: CsLessonStep[] = []
    for (const s of locale.steps) {
      if (needsAnswer(s)) problem.push(s)
      else theory.push(s)
    }
    return { problemSteps: problem, theorySteps: theory }
  }, [locale])

  const total = Math.max(problemSteps.length, theorySteps.length)

  const [internalIndex, setInternalIndex] = useState(0)
  const index = controlledIndex ?? internalIndex
  const setIndex = onIndexChange ?? setInternalIndex
  const [answers, setAnswers] = useState<Record<string, string>>({})
  const [finished, setFinished] = useState(false)
  const [wrongNonce, setWrongNonce] = useState(0)
  const [pending, startTransition] = useLoadingTransition()

  const currentProblem = problemSteps[index]
  const currentTheory = theorySteps[index]
  const problemSatisfied = currentProblem
    ? isSatisfied(currentProblem, answers[currentProblem.id])
    : true

  // 탭 잠금: 理論=풀면(틀림/맞힘) 해제, 結果=정답이어야 해제
  const attempted = currentProblem ? !!answers[currentProblem.id] : true
  const theoryUnlocked = !currentProblem || attempted
  // 結果 탭은 실행결과가 있는 코딩 문제일 때만 해제(객관식·배열은 결과 화면이 없어 항상 🔒)
  const resultUnlocked = currentProblem?.type === 'code_exercise' && problemSatisfied
  useEffect(() => {
    onLockChange?.({ theoryUnlocked, resultUnlocked })
  }, [theoryUnlocked, resultUnlocked, onLockChange])

  // 문제 전부 정답 → 레슨 자동 완료
  const completedRef = useRef(false)
  useEffect(() => {
    if (completedRef.current) return
    if (problemSteps.length > 0 && problemSteps.every((p) => isSatisfied(p, answers[p.id]))) {
      completedRef.current = true
      markDevLessonComplete(lessonId, courseId)
    }
  }, [answers, problemSteps, lessonId, courseId])

  const isLast = index === total - 1
  const progressPct = total > 0 ? Math.round(((index + 1) / total) * 100) : 0

  function handleSelect(step: CsLessonStep, optionId: string) {
    setAnswers((prev) => ({ ...prev, [step.id]: optionId }))
    if (isSatisfied(step, optionId)) {
      if (step.type === 'code_exercise') onSolved?.() // 코딩 문제만 結果 탭 자동전환
    } else {
      setWrongNonce((n) => n + 1) // 틀림 → 캐릭터 토스트
    }
  }

  function handleNext() {
    if (!problemSatisfied) return
    if (isLast) {
      startTransition(async () => {
        await markDevLessonComplete(lessonId, courseId)
        setFinished(true)
      })
      return
    }
    setIndex((i) => i + 1)
    onAdvance?.() // 다음 문제 → 問題 탭 자동복귀
  }

  if (finished) {
    return (
      <div className="flex min-h-[60vh] flex-col items-center justify-center px-4 text-center">
        <div className="flex h-16 w-16 items-center justify-center rounded-full bg-green-100 dark:bg-green-900/30">
          <CheckCircle2 className="h-9 w-9 text-green-600 dark:text-green-400" />
        </div>
        <h2 className="mt-4 text-xl font-bold text-gray-900 dark:text-white">レッスン完了！</h2>
        <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">お疲れさまでした 🎉</p>
        <div className="mt-6 flex w-full max-w-xs flex-col gap-2">
          {nextLessonHref && (
            <Link
              href={nextLessonHref}
              className="inline-flex h-12 items-center justify-center rounded-xl bg-indigo-600 px-4 text-sm font-semibold text-white"
            >
              次のレッスンへ →
            </Link>
          )}
          <Link
            href={subjectHref}
            className="inline-flex h-12 items-center justify-center rounded-xl border border-gray-200 px-4 text-sm font-medium text-gray-700 dark:border-gray-700 dark:text-gray-200"
          >
            科目ページへ戻る
          </Link>
        </div>
      </div>
    )
  }

  if (total === 0) {
    return (
      <div className="flex min-h-[40vh] flex-col items-center justify-center px-4 text-center text-sm text-gray-500 dark:text-gray-400">
        このレッスンにはまだ内容がありません。
      </div>
    )
  }

  return (
    <div className="min-h-[60vh] pb-24">
      {/* 오답 캐릭터 토스트 */}
      {wrongNonce > 0 && (
        <div
          key={wrongNonce}
          onAnimationEnd={() => setWrongNonce(0)}
          className="animate-toast-pop pointer-events-none fixed bottom-24 left-1/2 z-40"
        >
          <div className="flex items-center gap-2 rounded-2xl bg-rose-500 px-4 py-2.5 text-sm font-semibold text-white shadow-lg shadow-rose-500/30">
            <span className="text-xl">🦉</span>
            <span>もう一度考えてみよう！</span>
          </div>
        </div>
      )}

      {/* 진행바 */}
      <div className="mb-5 flex items-center gap-3">
        <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
          <div
            className="h-2 rounded-full bg-indigo-500 transition-all"
            style={{ width: `${progressPct}%` }}
          />
        </div>
        <span className="shrink-0 text-xs font-medium text-gray-500 dark:text-gray-400">
          {index + 1}/{total}
        </span>
      </div>

      {/* 본문 — 탭(mode)에 따라 問題 / 結果 / 理論 */}
      <div>
        {mode === 'problem' &&
          (currentProblem ? (
            <StepCard
              key={currentProblem.id}
              badgeLabel={`確認 ${index + 1}`}
              step={currentProblem}
              codeResultInline={false}
              wrongToast
              selectedOptionId={answers[currentProblem.id] ?? null}
              onSelect={(optionId) => handleSelect(currentProblem, optionId)}
            />
          ) : (
            <PlaceholderCard label={`確認 ${index + 1}`} />
          ))}

        {mode === 'result' && <ResultView problem={currentProblem} solved={problemSatisfied && !!currentProblem} />}

        {mode === 'theory' &&
          (currentTheory ? (
            <StepCard
              key={currentTheory.id}
              badgeLabel={`ステップ ${index + 1}`}
              step={currentTheory}
              selectedOptionId={null}
              onSelect={() => {}}
            />
          ) : (
            <PlaceholderCard label={`ステップ ${index + 1}`} />
          ))}
      </div>

      {/* 하단 고정 액션 */}
      <div
        className="fixed inset-x-0 bottom-0 z-30 flex items-center gap-2 border-t border-gray-200 bg-white/95 px-4 py-3 backdrop-blur dark:border-gray-700 dark:bg-gray-900/95"
        style={{ paddingBottom: 'calc(0.75rem + env(safe-area-inset-bottom))' }}
      >
        {index > 0 && (
          <button
            onClick={() => setIndex((i) => Math.max(0, i - 1))}
            aria-label="前へ"
            className="inline-flex h-11 w-11 shrink-0 items-center justify-center rounded-lg border border-gray-200 text-lg text-gray-700 dark:border-gray-700 dark:text-gray-200"
          >
            ‹
          </button>
        )}
        <button
          onClick={handleNext}
          disabled={!problemSatisfied || pending}
          className="inline-flex h-11 flex-1 items-center justify-center rounded-lg bg-indigo-600 px-4 text-sm font-semibold text-white transition-colors hover:bg-indigo-500 disabled:opacity-40"
        >
          {isLast
            ? pending
              ? '処理中...'
              : isCompleted
                ? '完了する（済）'
                : '完了する'
            : problemSatisfied
              ? '続ける →'
              : '問題を解いてください'}
        </button>
      </div>
    </div>
  )
}

function PlaceholderCard({ label }: { label: string }) {
  return (
    <div className="flex min-h-[40vh] flex-col items-center justify-center rounded-2xl border border-dashed border-gray-300 p-8 text-center text-sm text-gray-400 dark:border-gray-600">
      <p className="font-semibold text-gray-500 dark:text-gray-400">{label}</p>
      <p className="mt-1">準備中です</p>
    </div>
  )
}
