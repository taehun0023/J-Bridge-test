'use client'

import { useEffect, useMemo, useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { createItemAssignments, getMenteeItemStatus, type ItemStatusRow } from '@/app/actions/item-assignments'
import { ITEM_CATEGORIES, areaKeys, areaLabel, JLPT_LEVELS, type ItemCategory } from '@/lib/item-assignments'

export interface AssignableMentee {
  id: string
  full_name: string | null
  email: string
  /** 목표 자격증(목표 JLPT 레벨). 목표레벨 기반 일괄 선택에 사용 */
  target?: string | null
}

interface Props {
  open: boolean
  onClose: () => void
  mentees: AssignableMentee[]
  initialMenteeIds?: string[]
  /** 표시할 카테고리 (課題=항목 / 理解テスト=퀴즈) */
  categories?: ItemCategory[]
  heading?: string
}

function displayName(m: AssignableMentee): string {
  if (!m.full_name) return m.email
  return m.full_name.replace(/\s*\([^()]*\)\s*$/, '').trim()
}

const fmtRange = (a: number, b: number) => (a === b ? `${a}` : `${a}〜${b}`)

export default function ItemAssignModal({ open, onClose, mentees, initialMenteeIds, categories = ['seikatsu', 'business-jp'], heading = '項目課題を割り当てる（増分）' }: Props) {
  const router = useRouter()
  const [selected, setSelected] = useState<Set<string>>(new Set())
  const [category, setCategory] = useState<ItemCategory>(categories[0])
  const [level, setLevel] = useState<string>('N5')
  const [counts, setCounts] = useState<Record<string, string>>({})
  const [statusRows, setStatusRows] = useState<ItemStatusRow[]>([])
  const [loadingStatus, setLoadingStatus] = useState(false)
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  const catSpec = ITEM_CATEGORIES[category]
  const areas = useMemo(() => areaKeys(category), [category])

  useEffect(() => {
    if (open) {
      setSelected(new Set(initialMenteeIds ?? []))
      setCounts({})
      setMessage(null)
    }
  }, [open, initialMenteeIds])

  const selectedIds = useMemo(() => [...selected], [selected])
  const effectiveLevel = catSpec.hasLevel ? level : ''

  // 선택 멘티 + 레벨/카테고리 변경 시 현황 로드
  useEffect(() => {
    if (!open || selectedIds.length === 0) { setStatusRows([]); return }
    let cancelled = false
    setLoadingStatus(true)
    getMenteeItemStatus(selectedIds, category, effectiveLevel)
      .then(res => { if (!cancelled) setStatusRows(res.rows) })
      .finally(() => { if (!cancelled) setLoadingStatus(false) })
    return () => { cancelled = true }
  }, [open, category, effectiveLevel, selectedIds])

  // 목표 레벨 기반 선택용: 멘티들이 가진 목표 레벨 목록
  const targetLevelsPresent = useMemo(() => {
    const set = new Set<string>()
    for (const m of mentees) if (m.target && (JLPT_LEVELS as readonly string[]).includes(m.target)) set.add(m.target)
    return (JLPT_LEVELS as readonly string[]).filter(l => set.has(l))
  }, [mentees])

  // 통일 패널: 영역별 (선택 멘티 기준) 풀 / 현재부여 min〜max
  const areaStats = useMemo(() => {
    const m: Record<string, { pool: number; curMin: number; curMax: number }> = {}
    for (const area of areas) {
      const rows = statusRows.filter(r => r.area === area)
      const pool = rows[0]?.pool ?? 0
      const cumuls = rows.map(r => r.assignedCumulative)
      m[area] = {
        pool,
        curMin: cumuls.length ? Math.min(...cumuls) : 0,
        curMax: cumuls.length ? Math.max(...cumuls) : 0,
      }
    }
    return m
  }, [areas, statusRows])

  // 멘티별 미리보기 (증분 결과)
  const preview = useMemo(() => {
    const inputAreas = areas.filter(a => parseInt(counts[a] || '0', 10) > 0)
    if (!inputAreas.length || selectedIds.length === 0) return []
    return selectedIds.map(id => {
      const m = mentees.find(x => x.id === id)
      const deltas = inputAreas.map(area => {
        const row = statusRows.find(r => r.menteeId === id && r.area === area)
        const cur = row?.assignedCumulative ?? 0
        const pool = row?.pool ?? areaStats[area]?.pool ?? 0
        const want = parseInt(counts[area] || '0', 10)
        const add = Math.max(0, Math.min(want, pool - cur))
        return { area, add, cur, next: cur + add }
      })
      return { id, name: m ? displayName(m) : id, deltas }
    })
  }, [areas, counts, selectedIds, statusRows, mentees, areaStats])

  function toggleMentee(id: string) {
    setSelected(prev => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id); else next.add(id)
      return next
    })
  }
  function toggleAll() {
    if (selected.size === mentees.length) setSelected(new Set())
    else setSelected(new Set(mentees.map(m => m.id)))
  }
  function selectByTarget(lvl: string) {
    setSelected(new Set(mentees.filter(m => m.target === lvl).map(m => m.id)))
    setLevel(lvl)
  }

  function handleClose() {
    setSelected(new Set()); setCategory(categories[0]); setLevel('N5'); setCounts({}); setMessage(null); setStatusRows([])
    onClose()
  }

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    if (selected.size === 0) { setMessage({ type: 'error', text: 'メンティーを1名以上選択してください' }); return }
    const hasCount = areas.some(a => parseInt(counts[a] || '0', 10) > 0)
    if (!hasCount) { setMessage({ type: 'error', text: '配布する項目数を1つ以上入力してください' }); return }

    startTransition(async () => {
      const fd = new FormData()
      for (const id of selected) fd.append('assigned_to', id)
      fd.set('category', category)
      if (catSpec.hasLevel) fd.set('content_level', level)
      for (const a of areas) {
        const n = parseInt(counts[a] || '0', 10)
        if (n > 0) fd.set(`count_${a}`, String(n))
      }
      const res = await createItemAssignments(fd)
      if ('error' in res && res.error) {
        setMessage({ type: 'error', text: res.error })
      } else {
        const skipped = 'skipped' in res ? res.skipped : 0
        setMessage({ type: 'success', text: `${res.created}件を配布しました${skipped ? `（${skipped}件は上限でスキップ）` : ''}` })
        setCounts({})
        router.refresh()
        if (selectedIds.length) getMenteeItemStatus(selectedIds, category, effectiveLevel).then(r => setStatusRows(r.rows))
      }
    })
  }

  if (!open) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm" onClick={handleClose}>
      <div
        className="mx-4 max-h-[90vh] w-full max-w-3xl overflow-y-auto rounded-2xl border border-gray-200/60 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center justify-between">
          <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">{heading}</h3>
          <button onClick={handleClose} className="rounded-lg p-1.5 text-zinc-400 hover:bg-zinc-100 dark:hover:bg-white/5" aria-label="閉じる">×</button>
        </div>

        <form onSubmit={handleSubmit} className="mt-4 space-y-4">
          {/* 카테고리 토글 */}
          <div className="flex gap-1.5">
            {categories.map(c => (
              <button
                key={c}
                type="button"
                onClick={() => { setCategory(c); setCounts({}) }}
                className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${
                  category === c ? 'bg-violet-600 text-white' : 'bg-gray-100 text-zinc-600 hover:bg-gray-200 dark:bg-white/5 dark:text-zinc-300 dark:hover:bg-white/10'
                }`}
              >{ITEM_CATEGORIES[c].label}</button>
            ))}
          </div>

          {/* 멘티 선택 */}
          <div>
            <div className="flex items-center justify-between">
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">対象メンティー <span className="text-red-400">*</span></label>
              <div className="flex items-center gap-3">
                {catSpec.hasLevel && targetLevelsPresent.map(lvl => (
                  <button key={lvl} type="button" onClick={() => selectByTarget(lvl)} className="text-xs font-medium text-violet-500 hover:text-violet-400">
                    目標{lvl}（{mentees.filter(m => m.target === lvl).length}）
                  </button>
                ))}
                <button type="button" onClick={toggleAll} className="text-xs text-indigo-500 hover:text-indigo-400">
                  {selected.size === mentees.length ? '全解除' : '全選択'}
                </button>
              </div>
            </div>
            <div className="mt-1 max-h-24 overflow-y-auto rounded-xl border border-gray-200 bg-white p-2 dark:border-white/[0.08] dark:bg-white/5">
              {mentees.length === 0 ? (
                <p className="text-xs text-zinc-400">対象メンティーがいません</p>
              ) : (
                <div className="grid grid-cols-2 gap-1 sm:grid-cols-3">
                  {mentees.map(m => (
                    <label key={m.id} className="flex cursor-pointer items-center gap-2 rounded-lg px-2 py-1 text-sm text-zinc-800 hover:bg-indigo-50 dark:text-zinc-200 dark:hover:bg-white/5">
                      <input type="checkbox" checked={selected.has(m.id)} onChange={() => toggleMentee(m.id)} className="rounded border-gray-300 text-indigo-600 focus:ring-indigo-500" />
                      <span className="truncate">{displayName(m)}</span>
                      {m.target && <span className="ml-auto shrink-0 rounded bg-violet-100 px-1 text-[10px] font-semibold text-violet-700 dark:bg-violet-900/40 dark:text-violet-300">{m.target}</span>}
                    </label>
                  ))}
                </div>
              )}
            </div>
            <p className="mt-1 text-xs text-zinc-500 dark:text-zinc-400">{selected.size}名 選択中</p>
          </div>

          {/* 레벨 (생활일본어만) */}
          {catSpec.hasLevel && (
            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">レベル <span className="text-red-400">*</span></label>
              <div className="mt-1 flex gap-1.5">
                {JLPT_LEVELS.map(l => (
                  <button
                    key={l}
                    type="button"
                    onClick={() => setLevel(l)}
                    className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${
                      level === l ? 'bg-indigo-600 text-white' : 'bg-gray-100 text-zinc-600 hover:bg-gray-200 dark:bg-white/5 dark:text-zinc-300 dark:hover:bg-white/10'
                    }`}
                  >{l}</button>
                ))}
              </div>
            </div>
          )}

          {/* 통일 패널: 영역별 현황 + 증분 입력 */}
          <div className="overflow-hidden rounded-xl border border-gray-200 dark:border-white/[0.08]">
            <table className="min-w-full text-sm">
              <thead className="bg-gray-50 dark:bg-white/5">
                <tr className="text-xs text-zinc-500 dark:text-zinc-400">
                  <th className="px-3 py-2 text-left font-medium">領域</th>
                  <th className="px-3 py-2 text-center font-medium">プール</th>
                  <th className="px-3 py-2 text-center font-medium">現在付与</th>
                  <th className="px-3 py-2 text-right font-medium">+追加</th>
                  <th className="px-3 py-2 text-center font-medium">配布後</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
                {areas.map(area => {
                  const s = areaStats[area] ?? { pool: 0, curMin: 0, curMax: 0 }
                  const input = parseInt(counts[area] || '0', 10) || 0
                  const afterMin = Math.min(s.curMin + input, s.pool)
                  const afterMax = Math.min(s.curMax + input, s.pool)
                  const remainingMax = Math.max(0, s.pool - s.curMin)
                  return (
                    <tr key={area}>
                      <td className="px-3 py-2 font-medium text-zinc-800 dark:text-zinc-200">{areaLabel(category, area)}</td>
                      <td className="px-3 py-2 text-center text-zinc-500 dark:text-zinc-400">{loadingStatus ? '…' : s.pool || '—'}</td>
                      <td className="px-3 py-2 text-center text-zinc-600 dark:text-zinc-300">{selectedIds.length ? fmtRange(s.curMin, s.curMax) : '—'}</td>
                      <td className="px-3 py-2 text-right">
                        <input
                          type="number" min={0} max={remainingMax || undefined}
                          value={counts[area] ?? ''}
                          onChange={e => setCounts(prev => ({ ...prev, [area]: e.target.value }))}
                          placeholder="0"
                          className="w-20 rounded-lg border border-gray-200 bg-white px-2 py-1 text-right text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                        />
                      </td>
                      <td className="px-3 py-2 text-center font-medium text-violet-600 dark:text-violet-300">{input > 0 && selectedIds.length ? fmtRange(afterMin, afterMax) : '—'}</td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>

          {/* 멘티별 미리보기 */}
          {preview.length > 0 && (
            <div className="rounded-xl border border-violet-200 bg-violet-50/50 p-3 dark:border-violet-500/20 dark:bg-violet-500/5">
              <p className="mb-1.5 text-xs font-semibold text-violet-700 dark:text-violet-300">配布プレビュー（{preview.length}名）</p>
              <div className="max-h-32 space-y-1 overflow-y-auto">
                {preview.map(p => (
                  <div key={p.id} className="flex items-baseline gap-2 text-xs">
                    <span className="shrink-0 font-medium text-zinc-700 dark:text-zinc-200">{p.name}</span>
                    <span className="text-zinc-500 dark:text-zinc-400">
                      {p.deltas.map(d => d.add > 0
                        ? `${areaLabel(category, d.area)} +${d.add}(${d.cur}→${d.next})`
                        : `${areaLabel(category, d.area)} 上限`
                      ).join(' ・ ')}
                    </span>
                  </div>
                ))}
              </div>
            </div>
          )}

          {message && (
            <div className={`rounded-xl px-3 py-2 text-sm ${
              message.type === 'success' ? 'bg-emerald-500/10 text-emerald-500 ring-1 ring-emerald-500/20' : 'bg-red-500/10 text-red-500 ring-1 ring-red-500/20'
            }`}>{message.text}</div>
          )}

          <div className="flex justify-end gap-2 border-t border-gray-200 pt-4 dark:border-white/[0.08]">
            <button type="button" onClick={handleClose} disabled={pending} className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5">キャンセル</button>
            <button type="submit" disabled={pending} className="rounded-xl bg-violet-600 px-4 py-2 text-sm font-medium text-white hover:bg-violet-500 disabled:opacity-50">{pending ? '配布中...' : '配布'}</button>
          </div>
        </form>
      </div>
    </div>
  )
}
