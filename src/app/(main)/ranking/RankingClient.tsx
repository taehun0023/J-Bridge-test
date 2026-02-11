'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import { Crown, Medal, Award } from 'lucide-react'
import TabBar from '@/components/ui/TabBar'
import Badge from '@/components/ui/Badge'

interface RankingEntry {
  id: string
  user_id: string
  overall_score: number
  jlpt_score: number
  coding_score: number
  attitude_score: number
  coding_rank: string
  overall_rank: number | null
  profiles: { full_name: string | null; coding_rank: string } | null
}

interface Props {
  rankings: RankingEntry[]
  category: string
  currentUserId: string
}

const tabs = [
  { key: 'overall', label: '総合' },
  { key: 'jlpt', label: '生活日本語' },
  { key: 'coding', label: 'CS知識/開発' },
  { key: 'attitude', label: 'ビジネスリテラシー' },
]

function RankIcon({ rank }: { rank: number }) {
  if (rank === 1) return <Crown className="h-5 w-5 text-amber-400" />
  if (rank === 2) return <Medal className="h-5 w-5 text-zinc-400" />
  if (rank === 3) return <Award className="h-5 w-5 text-amber-600" />
  return <span className="text-sm font-mono font-bold text-zinc-500 dark:text-zinc-400">{rank}</span>
}

export default function RankingClient({ rankings, category, currentUserId }: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()

  function getScore(entry: RankingEntry) {
    switch (category) {
      case 'jlpt': return entry.jlpt_score
      case 'coding': return entry.coding_score
      case 'attitude': return entry.attitude_score
      default: return entry.overall_score
    }
  }

  return (
    <div>
      <TabBar
        tabs={tabs}
        activeKey={category}
        onChange={(key) => {
          const params = new URLSearchParams(searchParams.toString())
          params.set('category', key)
          router.push(`/ranking?${params.toString()}`)
        }}
      />

      <div className="mt-4 rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03]">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-200">
            <thead>
              <tr className="bg-white/[0.02] dark:bg-white/[0.02]">
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">順位</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">名前</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">コーディング等級</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">スコア</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {rankings.map((entry, i) => {
                const isMe = entry.user_id === currentUserId
                return (
                  <tr key={entry.id} className={isMe ? 'bg-indigo-500/5 dark:bg-indigo-500/5' : ''}>
                    <td className="whitespace-nowrap px-4 py-3">
                      <div className="flex items-center justify-center w-8">
                        <RankIcon rank={i + 1} />
                      </div>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      <span className={`text-sm ${isMe ? 'font-bold text-indigo-400' : 'text-zinc-900 dark:text-zinc-100'}`}>
                        {(entry.profiles as { full_name: string | null } | null)?.full_name ?? 'ユーザー'}
                        {isMe && ' (自分)'}
                      </span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      <Badge
                        label={(entry.profiles as { coding_rank: string } | null)?.coding_rank ?? entry.coding_rank}
                        variant="coding_rank"
                      />
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right">
                      <span className="text-sm font-mono font-semibold text-zinc-900 dark:text-zinc-100">{getScore(entry)}</span>
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
        {rankings.length === 0 && (
          <div className="py-8 text-center text-sm text-zinc-500">
            まだランキングデータがありません
          </div>
        )}
      </div>
    </div>
  )
}
