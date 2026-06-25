'use client'

import { useState } from 'react'
import { X } from 'lucide-react'
import type { MockWrongQ } from '@/app/actions/admin/weakness-report'

const ORDER = ['文字', '語彙', '文法', '読解', '聴解']

/** 한 회차의 틀린 문항 — 파트 칩(文字/語彙/…) 클릭 → 그 파트의 문항(번호순, 선택지·정답·선택). 読解/장문은 「本文を見る」팝업. */
export default function MockWrongList({ wrong }: { wrong: MockWrongQ[] }) {
  const [open, setOpen] = useState<string | null>(null)
  const [passage, setPassage] = useState<{ title: string; text: string } | null>(null)
  if (!wrong.length) return null

  const byPart = new Map<string, MockWrongQ[]>()
  for (const w of wrong) {
    if (!byPart.has(w.part)) byPart.set(w.part, [])
    byPart.get(w.part)!.push(w)
  }
  const parts = [...ORDER.filter(p => byPart.has(p)), ...[...byPart.keys()].filter(p => !ORDER.includes(p))]

  return (
    <div>
      <div className="flex flex-wrap gap-2">
        {parts.map(p => {
          const active = open === p
          return (
            <button key={p} onClick={() => setOpen(active ? null : p)}
              className={`rounded-lg px-3 py-1.5 text-sm font-medium transition-colors ${active ? 'bg-red-600 text-white' : 'bg-zinc-100 text-zinc-700 hover:bg-zinc-200 dark:bg-zinc-800 dark:text-zinc-200 dark:hover:bg-zinc-700'}`}>
              {p}（{byPart.get(p)!.length}）
            </button>
          )
        })}
      </div>

      {open && (
        <div className="mt-3 max-h-[34rem] space-y-3 overflow-y-auto pr-1">
          {[...byPart.get(open)!].sort((a, b) => a.number - b.number).map((w, i) => {
            const isLong = w.part === '読解' || w.question.length > 120
            return (
              <div key={i} className="rounded-lg border border-zinc-200 bg-zinc-50 p-3 text-sm dark:border-zinc-700 dark:bg-zinc-800/50">
                <div className="mb-1.5 flex items-center justify-between gap-2">
                  <span className="text-xs text-zinc-400">第{w.number}問{!w.answered && ' · 未回答'}</span>
                  {isLong && (
                    <button
                      onClick={() => setPassage({ title: `${w.setLabel} ${w.attemptLabel} · 第${w.number}問`, text: w.question })}
                      className="shrink-0 rounded-md bg-indigo-600 px-2 py-0.5 text-xs font-medium text-white hover:bg-indigo-500 transition-colors"
                    >本文を見る</button>
                  )}
                </div>
                <p className={`whitespace-pre-wrap text-zinc-800 dark:text-zinc-100 ${isLong ? 'line-clamp-2 text-zinc-500 dark:text-zinc-400' : ''}`}>{w.question}</p>
                <ul className="mt-2 space-y-1">
                  {w.options.map((o, j) => (
                    <li key={j} className={`flex items-start gap-1.5 rounded px-2 py-1 ${
                      o.correct ? 'bg-emerald-50 text-emerald-700 dark:bg-emerald-900/20 dark:text-emerald-300'
                      : o.selected ? 'bg-red-50 text-red-600 dark:bg-red-900/20 dark:text-red-400'
                      : 'text-zinc-600 dark:text-zinc-300'}`}>
                      <span className="shrink-0 font-bold">{o.correct ? '✓' : o.selected ? '✗' : '・'}</span>
                      <span className="whitespace-pre-wrap">{o.text}</span>
                      {o.selected && !o.correct && <span className="ml-1 shrink-0 text-[10px] text-red-400">選択</span>}
                    </li>
                  ))}
                </ul>
              </div>
            )
          })}
        </div>
      )}

      {passage && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/50 p-4 backdrop-blur-sm" onClick={() => setPassage(null)}>
          <div className="relative max-h-[80vh] w-full max-w-2xl overflow-y-auto rounded-2xl bg-white p-6 shadow-2xl dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
            <div className="mb-3 flex items-center justify-between gap-2">
              <h3 className="text-sm font-semibold text-zinc-900 dark:text-zinc-100">{passage.title}</h3>
              <button onClick={() => setPassage(null)} className="rounded-lg p-1 text-zinc-400 hover:bg-zinc-100 hover:text-zinc-600 dark:hover:bg-zinc-800">
                <X className="h-5 w-5" />
              </button>
            </div>
            <p className="whitespace-pre-wrap text-sm leading-relaxed text-zinc-800 dark:text-zinc-100">{passage.text}</p>
          </div>
        </div>
      )}
    </div>
  )
}
