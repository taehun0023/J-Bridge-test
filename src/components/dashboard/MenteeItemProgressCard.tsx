import Card from '@/components/ui/Card'
import Link from 'next/link'
import type { MyItemRow } from '@/app/actions/item-assignments'

/**
 * 멘티 대시보드: 부여된 JLPT 항목 과제의 영역별 진척 (부여 N / 습득 N).
 * 멘티 본인이 "몇 개 부여됐고, 내가 몇 개 했는지" 파악.
 */
export default function MenteeItemProgressCard({ rows }: { rows: MyItemRow[] }) {
  if (!rows.length) return null
  return (
    <Card title="今月の日本語課題（JLPT）">
      <div className="space-y-4">
        {rows.map(r => {
          const pct = r.assigned > 0 ? Math.min(100, Math.round((r.mastered / r.assigned) * 100)) : 0
          const done = r.assigned > 0 && r.mastered >= r.assigned
          return (
            <div key={`${r.level}-${r.area}`}>
              <div className="mb-1 flex items-center justify-between">
                <span className="text-sm font-medium text-zinc-800 dark:text-zinc-200">
                  <span className="mr-1.5 rounded bg-violet-100 px-1.5 py-0.5 text-xs font-semibold text-violet-700 dark:bg-violet-900/40 dark:text-violet-300">{r.level}</span>
                  {r.areaLabel}
                  {done && <span className="ml-2 text-xs font-bold text-emerald-600 dark:text-emerald-400">✓ 達成</span>}
                </span>
                <Link
                  href={`/japanese/jlpt/${r.area}?level=${r.level}&mastery=unmastered`}
                  className="text-xs font-medium text-indigo-500 hover:text-indigo-400"
                >
                  続きを学ぶ →
                </Link>
              </div>
              <div className="flex items-center gap-3">
                <div className="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700">
                  <div
                    className={`h-2 rounded-full transition-all ${done ? 'bg-emerald-500' : 'bg-violet-500'}`}
                    style={{ width: `${pct}%` }}
                  />
                </div>
                <span className="shrink-0 text-xs text-zinc-500 dark:text-zinc-400">
                  付与 {r.assigned} / 習得 <span className="font-semibold text-zinc-700 dark:text-zinc-200">{r.mastered}</span>
                </span>
              </div>
            </div>
          )
        })}
      </div>
    </Card>
  )
}
