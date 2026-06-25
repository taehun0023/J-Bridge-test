'use client'

import Link from 'next/link'
import { ClipboardList } from 'lucide-react'

export interface AssignmentBoardCard {
  id: string
  month: string // 'YYYY-MM'
  catLabel: string
  areaLabel: string
  areaKey: string
  levelLabel: string
  count: number | null
  done: number | null
  rangeFrom: number | null
  rangeTo: number | null
  status: string
  dueDate: string | null
  url: string
}

// 영역 정렬 순서: 어휘 → 문법 → 독해 → 청해 → 한자
const AREA_ORDER = ['vocabulary', 'grammar', 'reading', 'listening']
const areaIdx = (k: string) => { const i = AREA_ORDER.indexOf(k); return i === -1 ? 99 : i }

const statusLabel: Record<string, string> = {
  pending: '未着手',
  in_progress: '進行中',
  overdue: '期限超過',
  awaiting_confirmation: '確認待ち',
  completed: '完了',
}

const statusCls: Record<string, string> = {
  pending: 'bg-zinc-500/10 text-zinc-500 ring-1 ring-zinc-500/20',
  in_progress: 'bg-blue-500/10 text-blue-500 ring-1 ring-blue-500/20',
  overdue: 'bg-red-500/10 text-red-500 ring-1 ring-red-500/20',
  awaiting_confirmation: 'bg-orange-500/10 text-orange-500 ring-1 ring-orange-500/20',
  completed: 'bg-emerald-500/10 text-emerald-600 ring-1 ring-emerald-500/20 dark:text-emerald-400',
}

function monthLabel(m: string, currentYear: string): string {
  const [y, mo] = m.split('-')
  if (!mo) return m
  return y === currentYear ? `${parseInt(mo, 10)}月` : `${y}年${parseInt(mo, 10)}月`
}

/** 멘티 대시보드: 부여된 미완료 과제를 월별로 묶어 표시. 완료되면 목록에서 사라짐. 지난달 미완료는 상단에 빨간 구분선으로 우선 표시. */
export default function MenteeAssignmentBoard({ cards, currentMonth }: { cards: AssignmentBoardCard[]; currentMonth: string }) {
  if (!cards.length) return null

  const byMonth = new Map<string, AssignmentBoardCard[]>()
  for (const c of cards) {
    const arr = byMonth.get(c.month) ?? []
    arr.push(c)
    byMonth.set(c.month, arr)
  }
  const months = [...byMonth.keys()].sort() // 오래된 달(미완료) 먼저
  const curYear = currentMonth.split('-')[0]

  return (
    <div className="mb-6 rounded-2xl border border-amber-200 bg-amber-50/60 p-5 dark:border-amber-700/40 dark:bg-amber-900/10">
      <div className="mb-4 flex items-center gap-2">
        <ClipboardList className="h-5 w-5 text-amber-500" />
        <h2 className="text-base font-bold text-zinc-900 dark:text-zinc-100">課題</h2>
      </div>

      <div className="space-y-5">
        {months.map(m => {
          const past = m < currentMonth
          return (
            <div key={m}>
              <div className="mb-2 flex items-center gap-2">
                <span className={`shrink-0 text-sm font-bold ${past ? 'text-red-500' : 'text-zinc-700 dark:text-zinc-200'}`}>
                  {monthLabel(m, curYear)}{past && '（未完了）'}
                </span>
                <div className={`h-px flex-1 ${past ? 'bg-red-300 dark:bg-red-700/50' : 'bg-zinc-200 dark:bg-white/10'}`} />
              </div>
              <div className="grid gap-2 sm:grid-cols-2">
                {[...byMonth.get(m)!].sort((a, b) => areaIdx(a.areaKey) - areaIdx(b.areaKey)).map(c => {
                  const isDone = c.status === 'completed'
                  return (
                  <Link
                    key={c.id}
                    href={c.url}
                    className={`flex items-center justify-between gap-2 rounded-xl border px-4 py-3 transition-colors hover:shadow-sm ${isDone ? 'border-emerald-300 bg-emerald-50/60 dark:border-emerald-700/50 dark:bg-emerald-900/15' : 'border-zinc-200 bg-white hover:border-amber-300 dark:border-white/10 dark:bg-white/5'}`}
                  >
                    <div className="min-w-0">
                      <p className="truncate text-sm font-semibold text-zinc-900 dark:text-zinc-100">
                        {c.areaLabel || c.catLabel}{c.levelLabel && ` · ${c.levelLabel}`}
                        {c.rangeFrom != null && <span className="ml-1.5 text-xs font-normal text-zinc-500 dark:text-zinc-400">{c.rangeFrom}〜{c.rangeTo}番</span>}
                      </p>
                      <p className="truncate text-xs text-zinc-500 dark:text-zinc-400">
                        {c.catLabel}
                        {c.count != null && <span className="ml-1 font-medium text-zinc-700 dark:text-zinc-300">{c.done ?? 0}/{c.count}</span>}
                        {c.dueDate && ` · 〆 ${new Date(c.dueDate).toLocaleDateString('ja-JP')}`}
                      </p>
                    </div>
                    <span className={`shrink-0 rounded-full px-2 py-0.5 text-[10px] font-medium ${statusCls[c.status] ?? statusCls.pending}`}>
                      {statusLabel[c.status] ?? c.status}
                    </span>
                  </Link>
                  )
                })}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}
