'use client'

import { useEffect, useRef, useState } from 'react'
import Link from 'next/link'
import { Check, ChevronDown, Layers } from 'lucide-react'
import DevSubjectPathMobile from './DevSubjectPathMobile'
import type { DevVirtualCourse } from '@/lib/dev-course'

type Diff = 'all' | 'foundation' | 'intermediate' | 'advanced'
const DIFF_FILTERS: [Diff, string][] = [
  ['all', 'すべて'],
  ['foundation', '初級'],
  ['intermediate', '中級'],
  ['advanced', '上級'],
]

const STORAGE_KEY = 'dev-selected-subject'

export default function DevHubClient({ courses }: { courses: DevVirtualCourse[] }) {
  const [slug, setSlug] = useState<string>(courses[0]?.slug ?? '')
  const [diff, setDiff] = useState<Diff>('all')
  const [open, setOpen] = useState(false)
  const dropdownRef = useRef<HTMLDivElement>(null)

  // 드롭다운 바깥 클릭 시 닫기
  useEffect(() => {
    if (!open) return
    function onDown(e: MouseEvent) {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) setOpen(false)
    }
    document.addEventListener('mousedown', onDown)
    return () => document.removeEventListener('mousedown', onDown)
  }, [open])

  // 마지막 선택 과목 복원 (같은 기기 재로그인 시에도 유지)
  useEffect(() => {
    const saved = localStorage.getItem(STORAGE_KEY)
    if (saved && courses.some((c) => c.slug === saved)) setSlug(saved)
  }, [courses])

  function handleChange(next: string) {
    setSlug(next)
    localStorage.setItem(STORAGE_KEY, next)
  }

  const course = courses.find((c) => c.slug === slug) ?? courses[0]
  if (!course) return null

  const nextLesson = course.lessons.find((l) => !l.isCompleted) // 선택 과목의 다음 미완료 레슨
  const progress =
    course.totalLessons > 0
      ? Math.round((course.completedLessons / course.totalLessons) * 100)
      : 0

  return (
    <div>
      {/* 과목 드롭다운 (커스텀) */}
      <div ref={dropdownRef} className="relative">
        <button
          type="button"
          onClick={() => setOpen((o) => !o)}
          className="flex w-full items-center gap-3 rounded-2xl border border-gray-200 bg-white py-3 pl-3 pr-4 text-left shadow-sm transition-colors hover:border-indigo-300 focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 dark:border-gray-700 dark:bg-gray-800/80 dark:hover:border-indigo-500/60"
        >
          <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-indigo-50 text-indigo-600 dark:bg-indigo-500/15 dark:text-indigo-400">
            <Layers className="h-4 w-4" />
          </span>
          <span className="flex-1 truncate text-base font-semibold text-gray-900 dark:text-white">
            {course.title}
          </span>
          <ChevronDown
            className={`h-5 w-5 shrink-0 text-gray-400 transition-transform ${open ? 'rotate-180 text-indigo-500' : ''}`}
          />
        </button>

        {open && (
          <div className="absolute z-20 mt-2 max-h-72 w-full overflow-y-auto rounded-2xl border border-gray-200 bg-white p-1.5 shadow-xl dark:border-gray-700 dark:bg-gray-800">
            {courses.map((c) => {
              const active = c.slug === course.slug
              return (
                <button
                  key={c.slug}
                  type="button"
                  onClick={() => {
                    handleChange(c.slug)
                    setOpen(false)
                  }}
                  className={`flex w-full items-center gap-2 rounded-xl px-3 py-2.5 text-left text-sm font-medium transition-colors ${
                    active
                      ? 'bg-indigo-50 text-indigo-700 dark:bg-indigo-500/15 dark:text-indigo-300'
                      : 'text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700/60'
                  }`}
                >
                  <span className="flex-1 truncate">{c.title}</span>
                  {active && <Check className="h-4 w-4 shrink-0" />}
                </button>
              )
            })}
          </div>
        )}
      </div>

      {/* 이어보기 — 진행 중(1개 이상 완료)일 때만. 미시작이면 숨김 */}
      {!nextLesson ? (
        <div className="mt-4 rounded-xl border border-emerald-200 bg-emerald-50 p-4 dark:border-emerald-900/50 dark:bg-emerald-950/20">
          <p className="text-sm font-medium text-emerald-800 dark:text-emerald-300">🎉 全レッスン完了</p>
          <p className="mt-1 text-xs text-emerald-700/80 dark:text-emerald-400/80">お疲れさまでした。</p>
        </div>
      ) : course.completedLessons > 0 ? (
        <Link
          href={`/dev/lessons/${nextLesson.lessonId}`}
          className="mt-4 block rounded-xl border border-orange-200 bg-orange-50 p-4 transition-colors hover:bg-orange-100 dark:border-orange-900/50 dark:bg-orange-950/20 dark:hover:bg-orange-950/40"
        >
          <div className="flex items-center justify-between gap-3">
            <div className="min-w-0">
              <p className="text-xs font-semibold uppercase tracking-wide text-orange-700 dark:text-orange-400">
                続きから学習
              </p>
              <p className="mt-1 truncate text-sm font-medium text-gray-900 dark:text-white">
                {nextLesson.title}
              </p>
              <p className="mt-1 text-xs text-gray-500 dark:text-gray-400">
                {nextLesson.estMinutes}分 · 進行 {course.completedLessons}/{course.totalLessons}
              </p>
            </div>
            <span className="inline-flex h-11 shrink-0 items-center rounded-lg bg-orange-600 px-4 text-sm font-medium text-white">
              続ける →
            </span>
          </div>
          <div className="mt-3 h-1.5 rounded-full bg-orange-200/60 dark:bg-orange-900/40">
            <div className="h-1.5 rounded-full bg-orange-500" style={{ width: `${progress}%` }} />
          </div>
        </Link>
      ) : null}

      {/* 선택 과목 콘텐츠 (게시글) — 모바일=Mimo 경로 / 데스크톱=리스트 */}
      <div className="hidden">
        <DevSubjectPathMobile course={course} />
      </div>

      {/* 난이도 필터 (데스크톱) — 세그먼트 컨트롤 */}
      <div className="mt-6 flex justify-end">
        <div className="inline-flex rounded-full bg-gray-100 p-1 dark:bg-gray-800">
          {DIFF_FILTERS.map(([value, label]) => (
            <button
              key={value}
              onClick={() => setDiff(value)}
              className={`rounded-full px-4 py-1.5 text-sm font-medium transition-colors ${
                diff === value
                  ? 'bg-white text-gray-900 shadow-sm dark:bg-gray-700 dark:text-white'
                  : 'text-gray-500 hover:text-gray-800 dark:text-gray-400 dark:hover:text-gray-200'
              }`}
            >
              {label}
            </button>
          ))}
        </div>
      </div>

      <div className="mt-4 divide-y divide-gray-200 dark:divide-gray-700">
        {course.lessons.map((lesson, index) => {
          if (diff !== 'all' && lesson.difficulty !== diff) return null
          return (
          <Link
            key={lesson.lessonId}
            href={`/dev/lessons/${lesson.lessonId}`}
            className="flex items-center gap-4 rounded-lg px-3 py-3 hover:bg-gray-50 dark:hover:bg-gray-800"
          >
            <div
              className={`flex h-8 w-8 shrink-0 items-center justify-center rounded-full text-xs font-bold ${
                lesson.isCompleted
                  ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-300'
                  : 'bg-gray-100 text-gray-500 dark:bg-gray-700 dark:text-gray-400'
              }`}
            >
              {index + 1}
            </div>
            <div className="flex-1">
              <p className="text-sm font-medium text-gray-900 dark:text-white">{lesson.title}</p>
            </div>
          </Link>
          )
        })}
      </div>
    </div>
  )
}
