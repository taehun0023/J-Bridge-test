import Card from '@/components/ui/Card'
import type { MenteeOverview } from '@/app/actions/mentor'

interface Props {
  mentee: MenteeOverview
}

const progressItems = [
  { key: 'jlptProgress', label: 'JLPT' },
  { key: 'itJapaneseProgress', label: 'IT日本語' },
  { key: 'csProgress', label: 'CS知識' },
  { key: 'devProgress', label: '開発実務' },
  { key: 'businessLitProgress', label: 'ビジネス' },
] as const

function ProgressBar({ label, value }: { label: string; value: number }) {
  return (
    <div className="flex items-center gap-2">
      <span className="w-16 shrink-0 text-xs text-gray-500 dark:text-gray-400">{label}</span>
      <div className="h-2 flex-1 overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700">
        <div
          className="h-full rounded-full bg-indigo-500 transition-all"
          style={{ width: `${Math.min(value, 100)}%` }}
        />
      </div>
      <span className="w-10 shrink-0 text-right text-xs font-medium text-gray-600 dark:text-gray-300">{value}%</span>
    </div>
  )
}

export default function MenteeProgressCard({ mentee }: Props) {
  return (
    <Card>
      <div className="mb-3 flex items-center gap-3">
        {mentee.avatar_url ? (
          <img src={mentee.avatar_url} alt="" className="h-10 w-10 rounded-full object-cover" />
        ) : (
          <div className="flex h-10 w-10 items-center justify-center rounded-full bg-indigo-100 text-sm font-medium text-indigo-600 dark:bg-indigo-900 dark:text-indigo-300">
            {mentee.full_name?.charAt(0) ?? '?'}
          </div>
        )}
        <h3 className="font-semibold text-gray-900 dark:text-white">{mentee.full_name ?? '名前未設定'}</h3>
      </div>

      {/* Category progress */}
      <div className="space-y-1.5">
        {progressItems.map(item => (
          <ProgressBar key={item.key} label={item.label} value={mentee[item.key]} />
        ))}
      </div>

      {/* Assignment stats */}
      <div className="mt-3 flex items-center gap-4 text-xs text-gray-500 dark:text-gray-400">
        <span>課題: 進行中 <span className="font-medium text-blue-600">{mentee.assignmentsInProgress}</span></span>
        <span>完了 <span className="font-medium text-emerald-600">{mentee.assignmentsCompleted}</span></span>
        {mentee.assignmentsOverdue > 0 && (
          <span>超過 <span className="font-medium text-red-600">{mentee.assignmentsOverdue}</span></span>
        )}
      </div>

      {/* Recent exam */}
      {mentee.recentExamTitle && (
        <div className="mt-2 text-xs text-gray-500 dark:text-gray-400">
          最近の試験: {mentee.recentExamTitle}{' '}
          <span className={mentee.recentExamPassed ? 'font-medium text-emerald-600' : 'font-medium text-red-600'}>
            {mentee.recentExamScore}点 {mentee.recentExamPassed ? '合格' : '不合格'}
          </span>
        </div>
      )}
    </Card>
  )
}
