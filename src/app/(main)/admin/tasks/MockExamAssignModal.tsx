'use client'

import { useEffect, useState } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import { getPublishedMockSets, assignMockExam } from '@/app/actions/comprehensive-exam'

interface Mentee { id: string; full_name: string | null; email: string }
interface MockSet { id: string; level: string; set_no: number; title: string }
interface Props {
  open: boolean
  onClose: () => void
  mentees: Mentee[]
}

const LEVEL_ORDER = ['N1', 'N2', 'N3', 'N4', 'N5']

export default function MockExamAssignModal({ open, onClose, mentees }: Props) {
  const [sets, setSets] = useState<MockSet[]>([])
  const [menteeId, setMenteeId] = useState('')
  const [level, setLevel] = useState('')
  const [setNo, setSetNo] = useState<number | null>(null)
  const [pending, startTransition] = useLoadingTransition()
  const [msg, setMsg] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  useEffect(() => {
    if (!open) return
    setMsg(null)
    getPublishedMockSets().then(res => {
      if ('sets' in res) setSets(res.sets as MockSet[])
    })
  }, [open])

  if (!open) return null

  const levels = LEVEL_ORDER.filter(l => sets.some(s => s.level === l))
  const levelSets = sets.filter(s => s.level === level).sort((a, b) => a.set_no - b.set_no)

  function handleAssign() {
    if (!menteeId || !level || setNo == null) {
      setMsg({ type: 'error', text: 'メンティー・レベル・模試を選択してください' })
      return
    }
    startTransition(async () => {
      const res = await assignMockExam(menteeId, level, setNo)
      setMsg('error' in res && res.error
        ? { type: 'error', text: res.error }
        : { type: 'success', text: '模擬試験を割り当てました（通知を送信）' })
    })
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm" onClick={onClose}>
      <div className="mx-4 w-full max-w-md rounded-2xl border border-gray-200/60 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
        <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">JLPT模擬試験を割り当てる</h3>

        {msg && (
          <div className={`mt-3 rounded-lg px-3 py-2 text-sm ${msg.type === 'success' ? 'bg-emerald-500/10 text-emerald-500' : 'bg-red-500/10 text-red-500'}`}>{msg.text}</div>
        )}

        {sets.length === 0 ? (
          <p className="mt-4 text-sm text-amber-500">公開された模擬試験がありません。先に模擬試験を作成・公開してください。</p>
        ) : (
          <div className="mt-4 space-y-3">
            <div>
              <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">メンティー</label>
              <select value={menteeId} onChange={e => setMenteeId(e.target.value)}
                className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100">
                <option value="">選択...</option>
                {mentees.map(m => <option key={m.id} value={m.id}>{m.full_name ?? m.email}</option>)}
              </select>
            </div>
            <div>
              <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">レベル</label>
              <select value={level} onChange={e => { setLevel(e.target.value); setSetNo(null) }}
                className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100">
                <option value="">選択...</option>
                {levels.map(l => <option key={l} value={l}>{l}</option>)}
              </select>
            </div>
            <div>
              <label className="block text-xs font-medium text-zinc-500 dark:text-zinc-400">模試</label>
              <select value={setNo ?? ''} onChange={e => setSetNo(e.target.value === '' ? null : Number(e.target.value))} disabled={!level}
                className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none disabled:opacity-50 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100">
                <option value="">選択...</option>
                {levelSets.map(s => <option key={s.id} value={s.set_no}>{s.title}</option>)}
              </select>
            </div>
          </div>
        )}

        <div className="mt-6 flex justify-end gap-3">
          <button onClick={onClose} className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5">閉じる</button>
          <button onClick={handleAssign} disabled={pending || sets.length === 0}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50">
            {pending ? '割り当て中...' : '割り当て'}
          </button>
        </div>
      </div>
    </div>
  )
}
