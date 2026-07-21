'use client'

import { useState, type Dispatch, type SetStateAction } from 'react'
import Link from 'next/link'
import { Lock } from 'lucide-react'
import DevLessonStepPlayer from './DevLessonStepPlayer'
import DevLessonTheoryView from './DevLessonTheoryView'
import DevLessonCompleteButton from './DevLessonCompleteButton'
import type { DevLessonDetail } from '@/lib/dev-content'

type Mode = 'problem' | 'result' | 'theory'

const TAB_LABEL: Record<Mode, string> = { problem: '問題', result: '結果', theory: '理論' }

export default function DevLessonMobileModes({
  lesson,
  initialLang,
  lessonId,
  courseId,
  isCompleted,
  previousLessonHref,
  nextLessonHref,
  subjectHref,
  index,
  onIndexChange,
}: {
  lesson: DevLessonDetail
  initialLang: 'ja' | 'ko'
  lessonId: string
  courseId: string
  isCompleted: boolean
  previousLessonHref?: string | null
  nextLessonHref?: string | null
  subjectHref: string
  /** 웹/모바일 위치 공유용(controlled). 없으면 StepPlayer 내부 상태 사용 */
  index?: number
  onIndexChange?: Dispatch<SetStateAction<number>>
}) {
  const hasProblems = !!lesson.interactiveContent
  const [mode, setMode] = useState<Mode>('problem')
  // 現在 문제 기준 탭 잠금 — 結果=정답 시, 理論=풀었을 때(틀림/맞힘) 해제
  const [locks, setLocks] = useState({ theoryUnlocked: false, resultUnlocked: false })

  return (
    <div>
      {hasProblems && (
        <div className="mb-5 grid grid-cols-3 gap-1 rounded-xl bg-gray-100 p-1 dark:bg-gray-800">
          {(['problem', 'result', 'theory'] as const).map((m) => {
            const locked =
              (m === 'result' && !locks.resultUnlocked) ||
              (m === 'theory' && !locks.theoryUnlocked)
            return (
              <button
                key={m}
                onClick={() => {
                  if (!locked) setMode(m)
                }}
                disabled={locked}
                aria-label={locked ? `${TAB_LABEL[m]}（ロック中）` : TAB_LABEL[m]}
                className={`flex h-10 items-center justify-center gap-1 rounded-lg text-sm font-semibold transition-colors ${
                  mode === m
                    ? 'bg-white text-indigo-700 shadow-sm dark:bg-gray-900 dark:text-indigo-300'
                    : locked
                      ? 'cursor-not-allowed text-gray-300 dark:text-gray-600'
                      : 'text-gray-500 dark:text-gray-400'
                }`}
              >
                {locked && <Lock className="h-3.5 w-3.5" />}
                {TAB_LABEL[m]}
              </button>
            )
          })}
        </div>
      )}

      {lesson.interactiveContent ? (
        /* 세 탭이 같은 index 공유 — 問題=確認N / 理論=ステップN 짝, 結果=현재 문제 결과.
           문제 정답 시 結果 탭으로, 다음 문제로 넘어가면 問題 탭으로 자동전환. 같은 인스턴스라 index·정답 보존 */
        <DevLessonStepPlayer
          interactiveContent={lesson.interactiveContent}
          lang={initialLang}
          mode={mode}
          onSolved={() => setMode('result')}
          onAdvance={() => setMode('problem')}
          onLockChange={setLocks}
          index={index}
          onIndexChange={onIndexChange}
          lessonId={lessonId}
          courseId={courseId}
          isCompleted={isCompleted}
          nextLessonHref={nextLessonHref}
          subjectHref={subjectHref}
        />
      ) : (
        <>
          <DevLessonTheoryView
            contentJa={lesson.contentJa}
            contentKo={lesson.contentKo}
            initialLang={initialLang}
            keyPoints={lesson.meta.key_points}
            misconceptions={lesson.meta.misconceptions}
          />

          {/* 理論(읽기 전용) 하단 고정 액션 — interactive 없는 레슨용 */}
          <div
            className="sticky bottom-0 z-30 -mx-4 mt-6 flex items-center gap-2 border-t border-gray-200 bg-white/95 px-4 py-3 backdrop-blur dark:border-gray-700 dark:bg-gray-900/95"
            style={{ paddingBottom: 'calc(0.75rem + env(safe-area-inset-bottom))' }}
          >
            {previousLessonHref && (
              <Link
                href={previousLessonHref}
                aria-label="前のレッスン"
                className="inline-flex h-11 w-11 shrink-0 items-center justify-center rounded-lg border border-gray-200 text-lg text-gray-700 dark:border-gray-700 dark:text-gray-200"
              >
                ‹
              </Link>
            )}
            <div className="flex-1 [&>button]:h-11 [&>button]:w-full [&>div]:h-11 [&>div]:justify-center">
              <DevLessonCompleteButton
                lessonId={lessonId}
                courseId={courseId}
                isCompleted={isCompleted}
              />
            </div>
            {nextLessonHref && (
              <Link
                href={nextLessonHref}
                className="inline-flex h-11 flex-1 items-center justify-center rounded-lg bg-indigo-600 px-4 text-sm font-medium text-white"
              >
                次へ ›
              </Link>
            )}
          </div>
        </>
      )}
    </div>
  )
}
