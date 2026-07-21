'use client'

import Link from 'next/link'
import { Check } from 'lucide-react'
import type { DevVirtualCourse } from '@/lib/dev-course'

const DIFFICULTY_LABELS: Record<string, string> = {
  foundation: '初級',
  intermediate: '応用',
  advanced: '上級',
}

// 픽셀 좌표 기반 레이아웃 (노드=왼쪽 지그재그, 제목=오른쪽, 선=곡선)
const W = 280
const R = 26 // 노드 반지름 (지름 52)
const ROW = 92 // 노드 세로 간격
const SECTION = 40 // 레벨 라벨 추가 여백
const CX = [46, 104] // 짝/홀 노드 x (완만한 지그재그)
const TITLE_LEFT = 146 // 제목 시작 x (선/노드와 안 겹치게)

type PathNode = {
  y: number
  cx: number
  circle: string
  inner: React.ReactNode
  title: string
  sub?: string
  href: string | null
  dim: boolean
}

export default function DevSubjectPathMobile({ course }: { course: DevVirtualCourse }) {
  const lessons = course.lessons
  const currentIndex = lessons.findIndex((l) => !l.isCompleted)

  const nodes: PathNode[] = []
  const sections: { y: number; label: string }[] = []
  let y = R + 10
  let lastLevel: string | null = null
  let idx = 0

  const CIRCLE_BASE = 'flex items-center justify-center rounded-full text-base font-bold shadow-md'
  const doneCls = 'bg-emerald-500 text-white'
  const currentCls = 'bg-indigo-600 text-white ring-4 ring-indigo-200 dark:ring-indigo-500/30'
  const todoCls = 'border-2 border-gray-300 bg-white text-gray-400 dark:border-gray-600 dark:bg-gray-800'

  lessons.forEach((lesson, i) => {
    if (lesson.difficulty !== lastLevel) {
      sections.push({ y: y - R + 2, label: DIFFICULTY_LABELS[lesson.difficulty] ?? lesson.difficulty })
      y += SECTION
      lastLevel = lesson.difficulty
    }
    const state = lesson.isCompleted ? 'done' : i === currentIndex ? 'current' : 'todo'
    nodes.push({
      y,
      cx: CX[idx % 2],
      circle: state === 'done' ? doneCls : state === 'current' ? currentCls : todoCls,
      inner: state === 'done' ? <Check className="h-6 w-6" /> : i + 1,
      title: lesson.title,
      href: `/dev/lessons/${lesson.lessonId}`,
      dim: state === 'todo',
    })
    y += ROW
    idx++
  })

  const totalH = (nodes.length ? nodes[nodes.length - 1].y : R + 10) + R + 10

  // 노드 중심을 부드러운 S자 곡선으로 연결
  const pts = nodes.map((n) => ({ x: n.cx, y: n.y }))
  let d = `M ${pts[0].x} ${pts[0].y}`
  for (let k = 1; k < pts.length; k++) {
    const a = pts[k - 1]
    const b = pts[k]
    const my = (a.y + b.y) / 2
    d += ` C ${a.x} ${my}, ${b.x} ${my}, ${b.x} ${b.y}`
  }

  return (
    <div className="relative mx-auto" style={{ width: W, height: totalH }}>
      <svg
        width={W}
        height={totalH}
        className="absolute left-0 top-0 text-gray-200 dark:text-gray-700"
        style={{ pointerEvents: 'none' }}
      >
        <path d={d} fill="none" stroke="currentColor" strokeWidth={6} strokeLinecap="round" strokeLinejoin="round" />
      </svg>

      {sections.map((s, si) => (
        <div key={`sec-${si}`} className="absolute" style={{ left: TITLE_LEFT, top: s.y, transform: 'translateY(-50%)' }}>
          <span className="rounded-full bg-gray-100 px-2.5 py-0.5 text-[11px] font-semibold text-gray-500 dark:bg-gray-800 dark:text-gray-400">
            {s.label}
          </span>
        </div>
      ))}

      {nodes.map((n, ni) => {
        const circleEl = (
          <div className={`${CIRCLE_BASE} ${n.circle}`} style={{ width: R * 2, height: R * 2 }}>
            {n.inner}
          </div>
        )
        return (
          <div key={`node-${ni}`}>
            <div className="absolute" style={{ left: n.cx, top: n.y, transform: 'translate(-50%, -50%)' }}>
              {n.href ? (
                <Link href={n.href} aria-label={n.title} className="block transition-transform active:scale-95">
                  {circleEl}
                </Link>
              ) : (
                circleEl
              )}
            </div>
            <div className="absolute" style={{ left: TITLE_LEFT, right: 6, top: n.y, transform: 'translateY(-50%)' }}>
              <p
                className={`text-xs leading-tight ${
                  n.dim ? 'text-gray-400 dark:text-gray-500' : 'font-medium text-gray-700 dark:text-gray-300'
                }`}
                style={{ display: '-webkit-box', WebkitLineClamp: 2, WebkitBoxOrient: 'vertical', overflow: 'hidden' }}
              >
                {n.title}
              </p>
              {n.sub && <p className="mt-0.5 text-[11px] text-gray-400">{n.sub}</p>}
            </div>
          </div>
        )
      })}
    </div>
  )
}
