'use client'

import { useEffect, useState } from 'react'

const UNLOCK_THRESHOLD = 80

/** 상단 습득 진행바 — 정답으로 습득 시 window 'jlpt-mastery' 이벤트(delta)로 실시간 갱신. */
export default function MasteryProgress({ mastered, total }: { mastered: number; total: number }) {
  const [count, setCount] = useState(mastered)

  useEffect(() => { setCount(mastered) }, [mastered])

  useEffect(() => {
    const handler = (e: Event) => {
      const delta = (e as CustomEvent).detail?.delta ?? 0
      setCount(c => Math.max(0, Math.min(total, c + delta)))
    }
    window.addEventListener('jlpt-mastery', handler as EventListener)
    return () => window.removeEventListener('jlpt-mastery', handler as EventListener)
  }, [total])

  const pct = total > 0 ? Math.round((count / total) * 100) : 0

  return (
    <div className="mb-6">
      <div className="mb-2 flex flex-wrap items-center gap-3 text-sm text-gray-600 dark:text-gray-400">
        <span className="rounded-full border border-gray-200 px-3 py-1 dark:border-gray-700">{count}/{total} 習得</span>
      </div>
      <div className="flex items-center gap-3">
        <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
          <div
            className={`h-2 rounded-full transition-all duration-500 ${pct >= UNLOCK_THRESHOLD ? 'bg-indigo-500' : 'bg-gray-400 dark:bg-gray-500'}`}
            style={{ width: `${pct}%` }}
          />
        </div>
        <span className="text-sm text-gray-600 dark:text-gray-400">{pct}%</span>
      </div>
    </div>
  )
}

/** 습득(+1)/해제(-1) 시 호출 → 진행바 실시간 반영 */
export function emitMastery(delta: number) {
  if (typeof window !== 'undefined') {
    window.dispatchEvent(new CustomEvent('jlpt-mastery', { detail: { delta } }))
  }
}
