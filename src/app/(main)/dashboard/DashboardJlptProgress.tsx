'use client'

import Link from 'next/link'
import { GraduationCap } from 'lucide-react'
import NameRuby from '@/components/ui/NameRuby'
import { getJlptLevelColor, type JlptLevel } from '@/lib/assessment-config'

export interface MenteeJlptProgress {
  id: string
  name: string | null
  fallback: string
  level: string
  parts: { area: string; areaLabel: string; done: number; total: number }[]
  /** 이번달 JLPT模試: done/total (미부여 0/0, 부여만 0/1, 완료 1/1) */
  mock: { done: number; total: number }
}

interface Props {
  mentees: MenteeJlptProgress[]
}

const isJlpt = (v: string): v is JlptLevel => ['N1', 'N2', 'N3', 'N4', 'N5'].includes(v)

export default function DashboardJlptProgress({ mentees }: Props) {
  if (mentees.length === 0) return null

  return (
    <div className="mb-6 rounded-2xl border border-gray-200/60 bg-white/80 p-4 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03]">
      <div className="mb-3 flex items-center gap-2">
        <GraduationCap className="h-4 w-4 text-indigo-500" />
        <h3 className="text-sm font-semibold text-zinc-900 dark:text-zinc-100">JLPT 学習状況</h3>
      </div>

      <div className="space-y-2">
        {mentees.map(m => (
          <div
            key={m.id}
            className="flex flex-col gap-2 rounded-xl border border-gray-100 px-3 py-2.5 dark:border-white/[0.06] sm:flex-row sm:items-center"
          >
            <div className="flex shrink-0 items-center gap-2 sm:w-44">
              <span className={`shrink-0 rounded px-1.5 py-0.5 text-[10px] font-bold ${isJlpt(m.level) ? getJlptLevelColor(m.level) : 'bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-300'}`}>
                {m.level}
              </span>
              <Link href={`/admin/reports?mentee=${m.id}`} className="min-w-0 truncate text-sm font-medium text-gray-900 hover:text-indigo-500 dark:text-white dark:hover:text-indigo-400">
                <NameRuby name={m.name} fallback={m.fallback} />
              </Link>
            </div>

            <div className="grid flex-1 grid-cols-2 gap-2 sm:grid-cols-5">
              {m.parts.map(p => {
                const pct = p.total > 0 ? Math.min(100, Math.round((p.done / p.total) * 100)) : 0
                return (
                  <div key={p.area} className="rounded-lg bg-gray-50 px-2 py-1.5 dark:bg-white/[0.03]">
                    <div className="flex items-baseline justify-between gap-1">
                      <span className="text-[11px] font-medium text-gray-500 dark:text-gray-400">{p.areaLabel}</span>
                      <span className="text-xs font-bold tabular-nums text-gray-900 dark:text-white">
                        {p.done}<span className="font-normal text-gray-400">/{p.total}</span>
                      </span>
                    </div>
                    <div className="mt-1 h-1.5 overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700">
                      <div className="h-full rounded-full bg-indigo-500" style={{ width: `${pct}%` }} />
                    </div>
                  </div>
                )
              })}
              {/* 모의고사: 다른 영역처럼 done/total (미부여 0/0, 부여만 0/1, 완료 1/1) */}
              <div className="rounded-lg bg-gray-50 px-2 py-1.5 dark:bg-white/[0.03]">
                <div className="flex items-baseline justify-between gap-1">
                  <span className="text-[11px] font-medium text-gray-500 dark:text-gray-400">模試</span>
                  <span className="text-xs font-bold tabular-nums text-gray-900 dark:text-white">
                    {m.mock.done}<span className="font-normal text-gray-400">/{m.mock.total}</span>
                  </span>
                </div>
                <div className="mt-1 h-1.5 overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700">
                  <div className="h-full rounded-full bg-indigo-500" style={{ width: `${m.mock.total > 0 ? Math.round((m.mock.done / m.mock.total) * 100) : 0}%` }} />
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
