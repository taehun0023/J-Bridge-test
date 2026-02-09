'use client'

import { useRouter, useSearchParams } from 'next/navigation'
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
  { key: 'overall', label: '종합' },
  { key: 'jlpt', label: 'JLPT' },
  { key: 'coding', label: '코딩' },
  { key: 'attitude', label: '태도/문화' },
]

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

      <div className="mt-4 rounded-xl border border-gray-200 bg-white">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">순위</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">이름</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">코딩 등급</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-gray-500">점수</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {rankings.map((entry, i) => {
                const isMe = entry.user_id === currentUserId
                return (
                  <tr key={entry.id} className={isMe ? 'bg-blue-50' : ''}>
                    <td className="whitespace-nowrap px-4 py-3">
                      <span className={`text-sm font-bold ${
                        i === 0 ? 'text-yellow-500' : i === 1 ? 'text-gray-400' : i === 2 ? 'text-amber-600' : 'text-gray-600'
                      }`}>
                        {i + 1}
                      </span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      <span className={`text-sm ${isMe ? 'font-bold text-blue-700' : 'text-gray-900'}`}>
                        {(entry.profiles as { full_name: string | null } | null)?.full_name ?? '사용자'}
                        {isMe && ' (나)'}
                      </span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      <Badge
                        label={(entry.profiles as { coding_rank: string } | null)?.coding_rank ?? entry.coding_rank}
                        variant="coding_rank"
                      />
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right">
                      <span className="text-sm font-semibold text-gray-900">{getScore(entry)}</span>
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
        {rankings.length === 0 && (
          <div className="py-8 text-center text-sm text-gray-400">
            아직 랭킹 데이터가 없습니다
          </div>
        )}
      </div>
    </div>
  )
}
