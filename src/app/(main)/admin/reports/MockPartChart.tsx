'use client'

import type { MockPartStat } from '@/app/actions/admin/weakness-report'

/** 파트별 가로 막대: 막대 길이=正解率, 호박색 세로선=合格ライン, 우측에 正解/全(%) */
export default function MockPartChart({ parts }: { parts: MockPartStat[] }) {
  if (!parts.length) return <div className="py-4 text-center text-sm text-zinc-500">データなし</div>
  return (
    <div className="space-y-2.5">
      {parts.map(p => {
        const correctPct = p.total > 0 ? (p.correct / p.total) * 100 : 0
        const passPct = p.total > 0 ? (p.pass / p.total) * 100 : 0
        const pct = Math.round(correctPct)
        const passed = p.correct >= p.pass
        return (
          <div key={p.label} className="flex items-center gap-3">
            <span className="w-12 shrink-0 text-sm font-semibold text-zinc-700 dark:text-zinc-200">{p.label}</span>
            <div className="relative h-5 flex-1 overflow-hidden rounded-md bg-zinc-100 dark:bg-zinc-800">
              {/* 正解は항상 녹색 (범례와 일치) */}
              <div className="h-full bg-emerald-500 transition-all" style={{ width: `${correctPct}%` }} />
              {/* 合格ライン = 점선 마커 (막대 fill과 구분) */}
              <div className="absolute top-0 h-full border-l-2 border-dashed border-amber-500" style={{ left: `${passPct}%` }} title={`合格ライン ${p.pass}`} />
            </div>
            <span className="w-24 shrink-0 text-right text-xs tabular-nums">
              <span className={`font-bold ${passed ? 'text-emerald-600 dark:text-emerald-400' : 'text-red-500'}`}>{p.correct}</span>
              <span className="text-zinc-400">/{p.total}</span>
              <span className="ml-1 text-zinc-400">({pct}%)</span>
            </span>
          </div>
        )
      })}
      <div className="flex items-center gap-4 pt-1 text-[10px] text-zinc-400">
        <span className="flex items-center gap-1"><span className="inline-block h-2 w-3 rounded-sm bg-emerald-500" />正解</span>
        <span className="flex items-center gap-1"><span className="inline-block h-2.5 w-0.5 bg-amber-500" />合格ライン</span>
      </div>
    </div>
  )
}
