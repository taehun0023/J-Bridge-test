'use client'

import { useState, useTransition } from 'react'
import dynamic from 'next/dynamic'
import Card from '@/components/ui/Card'
import { getWeaknessReport, generateAIPrompt } from '@/app/actions/admin/weakness-report'
import type { ScoreTrendPoint, ErrorRateItem } from '@/app/actions/admin/weakness-report'
import { ClipboardCopy, Check, Sparkles } from 'lucide-react'

const ScoreTrendChart = dynamic(() => import('@/components/charts/ScoreTrendChart'), { ssr: false })
const ErrorRateChart = dynamic(() => import('@/components/charts/ErrorRateChart'), { ssr: false })

interface Mentee {
  id: string
  full_name: string | null
  email: string
}

export default function WeaknessReportClient({ mentees }: { mentees: Mentee[] }) {
  const [selectedId, setSelectedId] = useState<string | null>(null)
  const [scoreTrend, setScoreTrend] = useState<ScoreTrendPoint[]>([])
  const [errorRates, setErrorRates] = useState<ErrorRateItem[]>([])
  const [pending, startTransition] = useTransition()
  const [error, setError] = useState<string | null>(null)
  const [copied, setCopied] = useState(false)

  function handleSelect(userId: string) {
    setSelectedId(userId)
    setError(null)
    startTransition(async () => {
      const result = await getWeaknessReport(userId)
      if ('error' in result) {
        setError(result.error ?? 'エラーが発生しました')
        setScoreTrend([])
        setErrorRates([])
      } else {
        setScoreTrend(result.scoreTrend)
        setErrorRates(result.errorRates)
      }
    })
  }

  function handleCopyPrompt() {
    if (!selectedId) return
    startTransition(async () => {
      const result = await generateAIPrompt(selectedId)
      if ('error' in result) {
        setError(result.error ?? 'エラーが発生しました')
        return
      }
      await navigator.clipboard.writeText(result.prompt)
      setCopied(true)
      setTimeout(() => setCopied(false), 2000)
    })
  }

  const selectedMentee = mentees.find(m => m.id === selectedId)

  return (
    <div className="mt-6 grid gap-6 lg:grid-cols-4">
      {/* Mentee list */}
      <div className="lg:col-span-1">
        <Card title="メンティー一覧">
          <div className="max-h-[600px] space-y-1 overflow-y-auto">
            {mentees.map(m => (
              <button
                key={m.id}
                onClick={() => handleSelect(m.id)}
                className={`w-full rounded-xl px-3 py-2.5 text-left transition-colors ${
                  selectedId === m.id
                    ? 'bg-indigo-500/10 text-indigo-400'
                    : 'hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50'
                }`}
              >
                <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100">
                  {m.full_name ?? m.email}
                </p>
              </button>
            ))}
            {mentees.length === 0 && (
              <p className="py-4 text-center text-sm text-zinc-500">メンティーがいません</p>
            )}
          </div>
        </Card>
      </div>

      {/* Charts */}
      <div className="lg:col-span-3 space-y-6">
        {error && (
          <div className="rounded-xl bg-red-500/10 px-4 py-3 text-sm text-red-400 ring-1 ring-red-500/20">
            {error}
          </div>
        )}

        {pending && (
          <Card>
            <div className="py-12 text-center text-sm text-zinc-500">読み込み中...</div>
          </Card>
        )}

        {selectedMentee && !pending ? (
          <>
            <Card title={`${selectedMentee.full_name ?? selectedMentee.email} - スコア推移`}>
              <ScoreTrendChart data={scoreTrend} />
            </Card>

            <Card title="カテゴリ別誤答率">
              <ErrorRateChart data={errorRates} />
              {errorRates.length > 0 && (
                <div className="mt-4 grid grid-cols-3 gap-2">
                  <div className="flex items-center gap-1.5 text-xs text-zinc-500">
                    <span className="inline-block h-2.5 w-2.5 rounded-full bg-red-500" />
                    50%超
                  </div>
                  <div className="flex items-center gap-1.5 text-xs text-zinc-500">
                    <span className="inline-block h-2.5 w-2.5 rounded-full bg-amber-500" />
                    30-50%
                  </div>
                  <div className="flex items-center gap-1.5 text-xs text-zinc-500">
                    <span className="inline-block h-2.5 w-2.5 rounded-full bg-green-500" />
                    30%未満
                  </div>
                </div>
              )}
            </Card>

            <div className="flex justify-end">
              <button
                onClick={handleCopyPrompt}
                disabled={pending}
                className="inline-flex items-center gap-2 rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
              >
                {copied ? (
                  <>
                    <Check className="h-4 w-4" />
                    コピー完了
                  </>
                ) : (
                  <>
                    <Sparkles className="h-4 w-4" />
                    <ClipboardCopy className="h-4 w-4" />
                    AIプロンプトをコピー
                  </>
                )}
              </button>
            </div>
          </>
        ) : !pending && !selectedMentee ? (
          <Card>
            <div className="py-12 text-center text-sm text-zinc-500">
              左の一覧からメンティーを選択してください
            </div>
          </Card>
        ) : null}
      </div>
    </div>
  )
}
