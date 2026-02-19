'use client'

import { useState, useTransition } from 'react'
import dynamic from 'next/dynamic'
import Badge from '@/components/ui/Badge'
import Card from '@/components/ui/Card'
import { createFeedback } from '@/app/actions/admin/feedback'
import { recalculateAllScores } from '@/app/actions/scores'
import { getRelevantAxes, AXIS_DISPLAY_LABELS } from '@/lib/assessment-config'
import type { AxisKey } from '@/lib/assessment-config'

const RadarChart = dynamic(() => import('@/components/dashboard/RadarChart'), { ssr: false })

interface User {
  id: string
  full_name: string | null
  email: string
  role: string
  coding_rank: string
  jlpt_level: string | null
  is_japanese: boolean
}

interface SkillData {
  jlpt: number
  itJapanese: number
  core: number
  framework: number
  attitude: number
  isJapanese: boolean
}

interface Feedback {
  id: string
  user_id: string
  category: string
  content: string
  created_at: string
  user: { full_name: string | null } | null
}

const categoryLabels: Record<string, string> = {
  seikatsu: '生活日本語',
  business_jp: 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  business_lit: 'ビジネスリテラシー',
}

export default function AdminReportsClient({
  users,
  skillMap,
  feedbacks,
  userRole,
}: {
  users: User[]
  skillMap: Record<string, SkillData>
  feedbacks: Feedback[]
  userRole: string
}) {
  const [selectedUserId, setSelectedUserId] = useState<string | null>(null)
  const [showFeedbackForm, setShowFeedbackForm] = useState(false)
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)
  const selectedUser = users.find(u => u.id === selectedUserId)
  const selectedSkills = selectedUserId ? skillMap[selectedUserId] : null
  const userFeedbacks = feedbacks.filter(f => f.user_id === selectedUserId)

  const isJapanese = selectedSkills?.isJapanese ?? false
  const relevantAxes = getRelevantAxes(isJapanese)
  const axisCount = relevantAxes.length

  function handleFeedback(formData: FormData) {
    startTransition(async () => {
      try {
        const result = await createFeedback(formData)
        if ('error' in result) setMessage(result.error ?? 'エラーが発生しました')
        else {
          setMessage('フィードバックが登録されました')
          setShowFeedbackForm(false)
        }
      } catch (e) {
        console.error('[handleFeedback] Error:', e)
        setMessage('フィードバック登録中にエラーが発生しました')
      }
      setTimeout(() => setMessage(null), 5000)
    })
  }

  function handleRecalcAll() {
    startTransition(async () => {
      const result = await recalculateAllScores()
      if (result.error) setMessage(result.error)
      else setMessage(`${result.processed}名のスコアを再計算しました`)
      setTimeout(() => setMessage(null), 5000)
    })
  }

  const radarScores: Record<AxisKey, number> = selectedSkills
    ? {
        jlpt: selectedSkills.jlpt,
        itJapanese: selectedSkills.itJapanese,
        coreProgramming: selectedSkills.core,
        framework: selectedSkills.framework,
        attitudeCulture: selectedSkills.attitude,
      }
    : { jlpt: 0, itJapanese: 0, coreProgramming: 0, framework: 0, attitudeCulture: 0 }

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-xl bg-indigo-500/10 px-4 py-3 text-sm text-indigo-400 ring-1 ring-indigo-500/20">{message}</div>
      )}

      <div className="mb-4">
        <button
          onClick={handleRecalcAll}
          disabled={pending}
          className="rounded-xl border border-gray-200 dark:border-white/[0.08] px-4 py-2 text-sm font-medium text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 disabled:opacity-50 transition-colors"
        >
          {pending ? '再計算中...' : '全体スコア再計算'}
        </button>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        {/* User list */}
        <div className="lg:col-span-1">
          <Card title={userRole === 'mentor' ? 'メンティー一覧' : '社員一覧'}>
            <div className="max-h-[600px] space-y-1 overflow-y-auto">
              {users.map(user => (
                <button
                  key={user.id}
                  onClick={() => setSelectedUserId(user.id)}
                  className={`w-full rounded-xl px-3 py-2.5 text-left transition-colors ${
                    selectedUserId === user.id
                      ? 'bg-indigo-500/10 text-indigo-400'
                      : 'hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50'
                  }`}
                >
                  <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100">
                    {user.full_name ?? user.email}
                  </p>
                  <div className="mt-0.5 flex items-center gap-2">
                    <Badge label={user.coding_rank} variant="coding_rank" />
                    {user.jlpt_level && <Badge label={user.jlpt_level} variant="jlpt" />}
                    {user.is_japanese && (
                      <span className="text-xs text-amber-400">JP</span>
                    )}
                    <span className="text-xs text-zinc-500">{user.role}</span>
                  </div>
                </button>
              ))}
              {users.length === 0 && (
                <p className="py-4 text-center text-sm text-zinc-500">
                  {userRole === 'mentor' ? 'メンティーがいません' : '社員がいません'}
                </p>
              )}
            </div>
          </Card>
        </div>

        {/* Detail view */}
        <div className="lg:col-span-2 space-y-6">
          {selectedUser && selectedSkills ? (
            <>
              <Card title={`${selectedUser.full_name ?? selectedUser.email} - ${axisCount}軸チャート`}>
                <div className="mx-auto max-w-md">
                  <RadarChart scores={radarScores} isJapanese={isJapanese} />
                </div>
                <div className={`mt-4 grid grid-cols-${axisCount} gap-2 text-center`}>
                  {relevantAxes.map((key) => {
                    const scoreVal = radarScores[key]
                    return (
                      <div key={key}>
                        <p className="text-xs text-zinc-500 dark:text-zinc-400">{AXIS_DISPLAY_LABELS[key]}</p>
                        <p className="text-sm font-mono font-bold text-zinc-900 dark:text-zinc-100">{scoreVal}</p>
                      </div>
                    )
                  })}
                </div>
              </Card>

              {/* Feedback */}
              <Card title="フィードバック">
                <div className="mb-4">
                  <button
                    onClick={() => setShowFeedbackForm(!showFeedbackForm)}
                    className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
                  >
                    {showFeedbackForm ? 'キャンセル' : '+ フィードバック作成'}
                  </button>
                </div>

                {showFeedbackForm && (
                  <form action={handleFeedback} className="mb-4 rounded-xl border border-white/[0.08] dark:border-white/[0.08] border-gray-200 p-4">
                    <input type="hidden" name="user_id" value={selectedUserId ?? ''} />
                    <div className="grid gap-3 sm:grid-cols-2">
                      <div>
                        <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">カテゴリ</label>
                        <select name="category"
                          className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white">
                          {Object.entries(categoryLabels).map(([key, label]) => (
                            <option key={key} value={key} className="bg-white dark:bg-gray-700 text-gray-900 dark:text-white">{label}</option>
                          ))}
                        </select>
                      </div>
                    </div>
                    <div className="mt-3">
                      <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">内容 *</label>
                      <textarea name="content" required rows={3}
                        className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white" />
                    </div>
                    <button type="submit" disabled={pending}
                      className="mt-3 rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors">
                      {pending ? '登録中...' : '登録'}
                    </button>
                  </form>
                )}

                <div className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
                  {userFeedbacks.map(fb => (
                    <div key={fb.id} className="py-3">
                      <div className="flex items-center gap-2">
                        <span className="inline-flex rounded-full bg-zinc-500/10 px-2 py-0.5 text-xs font-medium text-zinc-400 ring-1 ring-zinc-500/20">
                          {categoryLabels[fb.category] ?? fb.category}
                        </span>
                        <span className="text-xs text-zinc-500">
                          {new Date(fb.created_at).toLocaleDateString('ja-JP')}
                        </span>
                      </div>
                      <p className="mt-1 text-sm text-zinc-700 dark:text-zinc-300">{fb.content}</p>
                    </div>
                  ))}
                  {userFeedbacks.length === 0 && (
                    <p className="py-4 text-center text-sm text-zinc-500">フィードバックがありません</p>
                  )}
                </div>
              </Card>
            </>
          ) : (
            <Card>
              <div className="py-12 text-center text-sm text-zinc-500">
                {userRole === 'mentor' ? '左の一覧からメンティーを選択してください' : '左の一覧から社員を選択してください'}
              </div>
            </Card>
          )}
        </div>
      </div>

    </div>
  )
}
