'use client'

import { useState } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import { getStudyHistoryForAdmin, type StudyHistoryRow } from '@/app/actions/study-log'

const TYPE_LABEL: Record<string, string> = { jlpt_vocab: '語彙', jlpt_grammar: '文法', jlpt_reading: '読解', jlpt_listening: '聴解' }
const TYPES = ['', 'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening']

export default function StudyHistoryPanel({ mentees }: { mentees: { id: string; name: string }[] }) {
  const [menteeId, setMenteeId] = useState('')
  const [type, setType] = useState('')
  const [rows, setRows] = useState<StudyHistoryRow[]>([])
  const [loaded, setLoaded] = useState(false)
  const [pending, start] = useLoadingTransition()

  function load(mid: string, t: string) {
    setMenteeId(mid); setType(t)
    if (!mid) { setRows([]); setLoaded(false); return }
    start(async () => {
      const res = await getStudyHistoryForAdmin(mid, t || undefined)
      setRows('rows' in res ? res.rows : [])
      setLoaded(true)
    })
  }

  // 찍기 의심: 독해/청해를 5초 안에 정답 OR 오답 2회 이상
  const isSuspicious = (r: StudyHistoryRow) =>
    (r.contentType === 'jlpt_reading' || r.contentType === 'jlpt_listening') &&
    ((r.isCorrect && r.durationMs != null && r.durationMs < 5000) || r.wrongCount >= 2)

  const selCls = 'rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white'

  return (
    <div className="mt-8 rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-700 dark:bg-gray-800">
      <h2 className="text-lg font-semibold text-gray-900 dark:text-white">学習履歴（暗記・テスト 正誤）</h2>
      <div className="mt-3 flex flex-wrap gap-2">
        <select value={menteeId} onChange={e => load(e.target.value, type)} className={selCls}>
          <option value="">メンティーを選択…</option>
          {mentees.map(m => <option key={m.id} value={m.id}>{m.name}</option>)}
        </select>
        <select value={type} onChange={e => load(menteeId, e.target.value)} className={selCls}>
          {TYPES.map(t => <option key={t} value={t}>{t ? TYPE_LABEL[t] : '全領域'}</option>)}
        </select>
      </div>

      {pending ? (
        <div className="py-10 text-center text-sm text-gray-400">読み込み中...</div>
      ) : !menteeId ? (
        <div className="py-10 text-center text-sm text-gray-400">メンティーを選択してください</div>
      ) : !loaded || rows.length === 0 ? (
        <div className="py-10 text-center text-sm text-gray-400">学習履歴がありません</div>
      ) : (
        <div className="mt-3 max-h-[32rem] overflow-y-auto">
          <table className="w-full text-sm">
            <thead className="sticky top-0 bg-gray-50 text-xs text-gray-500 dark:bg-gray-900 dark:text-gray-400">
              <tr>
                <th className="px-2 py-2 text-left">日時</th>
                <th className="px-2 py-2 text-left">領域</th>
                <th className="px-2 py-2 text-left">問題</th>
                <th className="px-2 py-2 text-left">回答</th>
                <th className="px-2 py-2 text-center">結果</th>
                <th className="px-2 py-2 text-center">誤答</th>
                <th className="px-2 py-2 text-center">所要</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
              {rows.map((r, i) => (
                <tr key={i} className={isSuspicious(r) ? 'bg-red-50 dark:bg-red-900/15' : ''}>
                  <td className="whitespace-nowrap px-2 py-1.5 text-xs text-gray-400">{new Date(r.createdAt).toLocaleString('ja-JP')}</td>
                  <td className="whitespace-nowrap px-2 py-1.5 text-gray-500 dark:text-gray-400">{TYPE_LABEL[r.contentType] ?? r.contentType}</td>
                  <td className="px-2 py-1.5 text-gray-900 dark:text-gray-100">{r.label}{isSuspicious(r) && <span className="ml-1 text-[10px] font-bold text-red-500">⚠ 찍기의심</span>}</td>
                  <td className="px-2 py-1.5 text-gray-600 dark:text-gray-400">{r.answerText ?? '—'}</td>
                  <td className="px-2 py-1.5 text-center">{r.isCorrect ? <span className="text-emerald-600 dark:text-emerald-400">正</span> : <span className="text-red-500">誤</span>}</td>
                  <td className="px-2 py-1.5 text-center text-gray-500">{r.wrongCount || ''}</td>
                  <td className="px-2 py-1.5 text-center text-gray-500">{r.durationMs != null ? `${(r.durationMs / 1000).toFixed(1)}s` : ''}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
