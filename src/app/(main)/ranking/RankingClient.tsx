'use client'

import { useRouter, useSearchParams } from 'next/navigation'
import { Crown, Medal, Award } from 'lucide-react'
import TabBar from '@/components/ui/TabBar'
import type { ComputedRankingEntry, RankingCategory } from '@/lib/ranking'

interface Props {
  rankings: ComputedRankingEntry[]
  category: RankingCategory
  currentUserId: string
}

const tabs = [
  { key: 'overall', label: '全体' },
  { key: 'japanese', label: '日本語力' },
  { key: 'programming', label: 'プログラミング技術力' },
]

function RankIcon({ rank }: { rank: number }) {
  if (rank === 1) return <Crown className="h-5 w-5 text-amber-400" />
  if (rank === 2) return <Medal className="h-5 w-5 text-zinc-400" />
  if (rank === 3) return <Award className="h-5 w-5 text-amber-600" />
  return <span className="text-sm font-mono font-bold text-zinc-500 dark:text-zinc-400">{rank}</span>
}

function getColumnHeaders(category: RankingCategory) {
  switch (category) {
    case 'overall':
      return { total: '全体 /400', sub1: '日本語力', sub2: 'プログラミング技術力' }
    case 'japanese':
      return { total: '日本語力 /200', sub1: '生活日本語', sub2: 'ビジネス日本語' }
    case 'programming':
      return { total: 'プログラミング /200', sub1: 'CS知識', sub2: '開発実務能力' }
  }
}

function getScores(entry: ComputedRankingEntry, category: RankingCategory) {
  switch (category) {
    case 'overall':
      return { total: entry.overall_score, sub1: entry.japanese_score, sub2: entry.programming_score }
    case 'japanese':
      return { total: entry.japanese_score, sub1: entry.jlpt_normalized, sub2: entry.it_japanese_normalized }
    case 'programming':
      return { total: entry.programming_score, sub1: entry.core_normalized, sub2: entry.framework_normalized }
  }
}

export default function RankingClient({ rankings, category, currentUserId }: Props) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const headers = getColumnHeaders(category)

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
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">ユーザー</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">{headers.total}</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">{headers.sub1}</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">{headers.sub2}</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-zinc-500 dark:text-zinc-400">スコア更新日</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {rankings.map((entry, i) => {
                const isMe = entry.user_id === currentUserId
                const scores = getScores(entry, category)
                return (
                  <tr key={entry.user_id} className={isMe ? 'bg-indigo-500/5 dark:bg-indigo-500/5' : ''}>
                    <td className="whitespace-nowrap px-4 py-3">
                      <div className="flex items-center justify-center w-8">
                        <RankIcon rank={i + 1} />
                      </div>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      <div className="flex items-center gap-2.5">
                        {entry.avatar_url ? (
                          <img src={entry.avatar_url} alt="" className="h-8 w-8 rounded-full object-cover" />
                        ) : (
                          <div className="flex h-8 w-8 items-center justify-center rounded-full bg-indigo-600 text-white text-xs font-medium">
                            {(entry.full_name ?? 'U').charAt(0).toUpperCase()}
                          </div>
                        )}
                        <span className={`text-sm ${isMe ? 'font-bold text-indigo-400' : 'text-zinc-900 dark:text-zinc-100'}`}>
                          {entry.full_name ?? 'ユーザー'}
                          {isMe && ' (自分)'}
                        </span>
                      </div>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right">
                      <span className="text-sm font-mono font-semibold text-zinc-900 dark:text-zinc-100">{scores.total}</span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right">
                      <span className="text-sm font-mono text-zinc-600 dark:text-zinc-300">{scores.sub1}</span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right">
                      <span className="text-sm font-mono text-zinc-600 dark:text-zinc-300">{scores.sub2}</span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-right">
                      <span className="text-sm text-zinc-500 dark:text-zinc-400">
                        {entry.last_exam_date
                          ? new Date(entry.last_exam_date).toLocaleDateString('ja-JP')
                          : '—'}
                      </span>
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
