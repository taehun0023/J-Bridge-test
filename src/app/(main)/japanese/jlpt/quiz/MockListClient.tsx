'use client'

import { useState } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import { useRouter } from 'next/navigation'
import { Clock } from 'lucide-react'
import { selfStartMockSession } from '@/app/actions/comprehensive-exam'

interface SessionInfo {
  session: number
  label: string
  timeMin: number
  qCount: number
  remaining: number | null
  status: string | null
  examId: string | null
  score: number | null
  startedAt: string | null
  completedAt: string | null
}
export interface SetInfo {
  id: string
  title: string
  level: string
  setNo: number
  timeLimit: number
  sections: { section: string; label: string; count: number }[]
  totalQuestions: number
  finalScore: number | null
  finalPassed: boolean | null
  status: 'pass' | 'fail' | 'progress' | null
  sessions: SessionInfo[]
}

const STATUS_BADGE: Record<'pass' | 'fail' | 'progress', { label: string; cls: string }> = {
  pass: { label: '合格', cls: 'bg-emerald-500/20 text-emerald-600 dark:text-emerald-300' },
  fail: { label: '不合格', cls: 'bg-red-500/20 text-red-600 dark:text-red-300' },
  progress: { label: '進行中', cls: 'bg-amber-500/20 text-amber-600 dark:text-amber-300' },
}
function StatusBadge({ status }: { status: SetInfo['status'] }) {
  if (!status) return null
  const b = STATUS_BADGE[status]
  return <span className={`shrink-0 rounded-full px-2 py-0.5 text-[11px] font-semibold ${b.cls}`}>{b.label}</span>
}
const displayTitle = (t: string) => t.replace(/^N[1-5]\s*/, '')

function fmtLimit(min: number): string {
  const hh = String(Math.floor(min / 60)).padStart(2, '0')
  const mm = String(min % 60).padStart(2, '0')
  return `${hh}:${mm}:00`
}

export default function MockListClient({ level, sets }: { level: string; sets: SetInfo[] }) {
  const router = useRouter()
  const [activeId, setActiveId] = useState<string | null>(null)
  const [pending, startTransition] = useLoadingTransition()
  const [err, setErr] = useState<string | null>(null)
  const active = sets.find(s => s.id === activeId) ?? null

  function startSession(setNo: number, session: number, retake = false) {
    setErr(null)
    startTransition(async () => {
      const r = await selfStartMockSession(level, setNo, session, retake)
      if (r && 'error' in r && r.error) setErr(r.error)
    })
  }

  return (
    <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      {sets.map(set => (
        <div key={set.id} className="flex flex-col rounded-2xl border border-gray-200/70 bg-white p-4 shadow-sm dark:border-white/[0.08] dark:bg-white/[0.03]">
          <div className="flex items-start justify-between gap-2">
            <div className="flex items-center gap-2">
              <h3 className="text-base font-bold text-zinc-900 dark:text-zinc-100">{displayTitle(set.title)}</h3>
              <StatusBadge status={set.status} />
            </div>
            <div className="flex shrink-0 items-center gap-1.5">
              <span className="inline-flex items-center gap-1 rounded-full bg-zinc-100 px-2 py-0.5 text-[11px] font-medium text-zinc-600 dark:bg-white/10 dark:text-zinc-300">
                <Clock className="h-3 w-3" /> {set.timeLimit}分
              </span>
            </div>
          </div>
          <div className="mt-3 grid grid-cols-2 gap-2">
            {set.sessions.map(s => (
              <div key={s.session} className="rounded-lg bg-zinc-50 px-3 py-2 dark:bg-white/[0.04]">
                <p className="truncate text-[11px] text-zinc-500 dark:text-zinc-400" title={s.label}>{s.label}</p>
                <p className="text-sm font-semibold text-zinc-800 dark:text-zinc-200">ー / {s.qCount}</p>
              </div>
            ))}
            <div className="col-span-2 rounded-lg bg-zinc-50 px-3 py-2 dark:bg-white/[0.04]">
              <p className="text-[11px] text-zinc-500 dark:text-zinc-400">合計</p>
              <p className="text-sm font-semibold text-zinc-800 dark:text-zinc-200">ー / {set.totalQuestions}</p>
            </div>
          </div>
          <div className="mt-3">
            <button onClick={() => { setErr(null); setActiveId(set.id) }} className="block w-full rounded-lg bg-red-600 px-4 py-2 text-center text-sm font-semibold text-white hover:bg-red-500 transition-colors">
              詳細・受験
            </button>
          </div>
        </div>
      ))}

      {active && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm p-4" onClick={() => setActiveId(null)}>
          <div className="w-full max-w-lg rounded-2xl bg-white shadow-xl dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
            <div className="flex items-center gap-3 border-b border-gray-200/70 px-5 py-4 dark:border-white/[0.08]">
              <h3 className="text-lg font-bold text-zinc-900 dark:text-zinc-100">{displayTitle(active.title)}</h3>
              <StatusBadge status={active.status} />
            </div>

            <div className="space-y-4 px-5 py-4">
              <div className="flex items-center justify-between rounded-xl bg-zinc-50 px-4 py-3 dark:bg-white/[0.03]">
                <div>
                  <p className="text-[11px] text-zinc-500 dark:text-zinc-400">得点</p>
                  <p className="text-lg font-bold text-zinc-900 dark:text-zinc-100">{active.finalScore != null ? `${active.finalScore} / 180` : 'ー'}</p>
                </div>
                <StatusBadge status={active.status} />
              </div>

              {err && <p className="text-sm text-red-500">{err}</p>}

              {active.sessions.map(sess => {
                const taken = sess.status === 'completed' || sess.status === 'failed'
                const inProgress = sess.status === 'in_progress'
                return (
                  <div key={sess.session} className="rounded-xl border border-gray-200/70 p-3 dark:border-white/[0.08]">
                    <div className="flex items-center justify-between gap-2">
                      <span className="text-sm font-bold text-zinc-900 dark:text-zinc-100">{sess.label}</span>
                      <div className="flex gap-2">
                        {(taken || inProgress) && (
                          <button disabled={pending} onClick={() => startSession(active.setNo, sess.session, true)} className="rounded-lg border border-red-500 px-4 py-1.5 text-sm font-semibold text-red-600 hover:bg-red-50 disabled:opacity-50 dark:text-red-400 dark:hover:bg-red-500/10">再試験</button>
                        )}
                        {(taken || inProgress) && sess.examId ? (
                          <button onClick={() => router.push(`/exam/${sess.examId}`)} className="rounded-lg bg-red-600 px-5 py-1.5 text-sm font-semibold text-white hover:bg-red-500">{inProgress ? '続ける' : '結果'}</button>
                        ) : !taken && !inProgress ? (
                          <button disabled={pending} onClick={() => startSession(active.setNo, sess.session)} className="rounded-lg bg-red-600 px-7 py-1.5 text-sm font-semibold text-white hover:bg-red-500 disabled:opacity-50">開始</button>
                        ) : null}
                      </div>
                    </div>
                    <div className="mt-2 grid grid-cols-2 gap-2">
                      <div className="rounded-lg bg-zinc-50 px-3 py-2 dark:bg-white/[0.04]">
                        <p className="text-[11px] text-zinc-500 dark:text-zinc-400">制限時間</p>
                        <p className="text-sm font-semibold text-zinc-800 dark:text-zinc-200">{fmtLimit(sess.timeMin)}</p>
                      </div>
                      <div className={`rounded-lg px-3 py-2 ${inProgress ? 'bg-amber-500/5' : 'bg-zinc-50 dark:bg-white/[0.04]'}`}>
                        <p className="text-[11px] text-zinc-500 dark:text-zinc-400">{inProgress ? '残り問題数' : 'すべての問題数'}</p>
                        <p className={`text-sm font-semibold ${inProgress ? 'text-amber-600 dark:text-amber-400' : 'text-zinc-800 dark:text-zinc-200'}`}>{inProgress ? (sess.remaining ?? sess.qCount) : sess.qCount}問</p>
                      </div>
                    </div>
                  </div>
                )
              })}
            </div>

            <div className="px-5 pb-5">
              <button onClick={() => setActiveId(null)} className="block w-full rounded-lg border border-red-300 px-4 py-2 text-center text-sm font-medium text-red-600 hover:bg-red-50 dark:border-red-500/40 dark:text-red-400 dark:hover:bg-red-500/10">閉じる</button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
