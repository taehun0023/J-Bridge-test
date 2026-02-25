'use client'

import Link from 'next/link'
import Card from '@/components/ui/Card'
import MenteeProgressCard from './MenteeProgressCard'
import type { MenteeOverview } from '@/app/actions/mentor'

interface Props {
  mentees: MenteeOverview[]
  pendingVocabCount: number
  mentorSpecialty: string | null
}

export default function MentorDashboardClient({ mentees, pendingVocabCount, mentorSpecialty }: Props) {
  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">メンターダッシュボード</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">
          担当メンティの学習状況を確認しましょう
          {mentorSpecialty === 'japanese' && ' (日本語メンター)'}
          {mentorSpecialty === 'technical' && ' (技術メンター)'}
        </p>
      </div>

      {/* Pending actions */}
      {pendingVocabCount > 0 && (mentorSpecialty === null || mentorSpecialty === 'japanese') && (
        <Card className="mb-6 border-amber-200 bg-amber-50/50 dark:border-amber-800 dark:bg-amber-900/20">
          <div className="flex items-center justify-between">
            <div>
              <h3 className="font-semibold text-amber-900 dark:text-amber-200">承認待ちアクション</h3>
              <p className="mt-1 text-sm text-amber-700 dark:text-amber-300">
                みんなの単語帳: {pendingVocabCount}件の承認待ち
              </p>
            </div>
            <Link
              href="/japanese/business/shared-vocab"
              className="rounded-xl bg-amber-600 px-4 py-2 text-sm font-medium text-white hover:bg-amber-500 transition-colors"
            >
              確認する
            </Link>
          </div>
        </Card>
      )}

      {/* Mentee list */}
      {mentees.length === 0 ? (
        <Card>
          <div className="py-8 text-center text-sm text-zinc-500">
            担当メンティがまだ割り当てられていません
          </div>
        </Card>
      ) : (
        <>
          <h2 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">
            担当メンティ一覧 ({mentees.length}名)
          </h2>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {mentees.map(mentee => (
              <MenteeProgressCard key={mentee.id} mentee={mentee} />
            ))}
          </div>
        </>
      )}
    </div>
  )
}
