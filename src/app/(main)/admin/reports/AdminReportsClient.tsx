'use client'

import { useState, useTransition } from 'react'
import dynamic from 'next/dynamic'
import Badge from '@/components/ui/Badge'
import Card from '@/components/ui/Card'
import { createFeedback } from '@/app/actions/admin'
import { recalculateAllScores } from '@/app/actions/scores'

const RadarChart = dynamic(() => import('@/components/dashboard/RadarChart'), { ssr: false })

interface User {
  id: string
  full_name: string | null
  email: string
  role: string
  coding_rank: string
  jlpt_level: string | null
}

interface SkillData {
  jlpt: number
  itJapanese: number
  core: number
  framework: number
  attitude: number
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
  general: '一般',
  japanese: '日本語',
  coding: 'コーディング',
  attitude: '態度',
  assignment: '課題',
  dispatch_readiness: '派遣準備度',
}

export default function AdminReportsClient({
  users,
  skillMap,
  feedbacks,
}: {
  users: User[]
  skillMap: Record<string, SkillData>
  feedbacks: Feedback[]
}) {
  const [selectedUserId, setSelectedUserId] = useState<string | null>(null)
  const [showFeedbackForm, setShowFeedbackForm] = useState(false)
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)

  const selectedUser = users.find(u => u.id === selectedUserId)
  const selectedSkills = selectedUserId ? skillMap[selectedUserId] : null
  const userFeedbacks = feedbacks.filter(f => f.user_id === selectedUserId)

  function handleFeedback(formData: FormData) {
    startTransition(async () => {
      const result = await createFeedback(formData)
      if (result.error) setMessage(result.error)
      else {
        setMessage('フィードバックが登録されました')
        setShowFeedbackForm(false)
      }
      setTimeout(() => setMessage(null), 3000)
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

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">{message}</div>
      )}

      <div className="mb-4">
        <button
          onClick={handleRecalcAll}
          disabled={pending}
          className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700"
        >
          {pending ? '再計算中...' : '全体スコア再計算'}
        </button>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        {/* User list */}
        <div className="lg:col-span-1">
          <Card title="社員一覧">
            <div className="max-h-[600px] space-y-1 overflow-y-auto">
              {users.map(user => (
                <button
                  key={user.id}
                  onClick={() => setSelectedUserId(user.id)}
                  className={`w-full rounded-lg px-3 py-2.5 text-left transition-colors ${
                    selectedUserId === user.id
                      ? 'bg-blue-50 text-blue-700 dark:bg-blue-900/20 dark:text-blue-400'
                      : 'hover:bg-gray-50 dark:hover:bg-gray-700'
                  }`}
                >
                  <p className="text-sm font-medium text-gray-900 dark:text-white">
                    {user.full_name ?? user.email}
                  </p>
                  <div className="mt-0.5 flex items-center gap-2">
                    <Badge label={user.coding_rank} variant="coding_rank" />
                    {user.jlpt_level && <Badge label={user.jlpt_level} variant="jlpt" />}
                    <span className="text-xs text-gray-400 dark:text-gray-500">{user.role}</span>
                  </div>
                </button>
              ))}
              {users.length === 0 && (
                <p className="py-4 text-center text-sm text-gray-400 dark:text-gray-500">社員がいません</p>
              )}
            </div>
          </Card>
        </div>

        {/* Detail view */}
        <div className="lg:col-span-2 space-y-6">
          {selectedUser && selectedSkills ? (
            <>
              <Card title={`${selectedUser.full_name ?? selectedUser.email} - 5軸チャート`}>
                <div className="mx-auto max-w-md">
                  <RadarChart
                    scores={{
                      jlpt: selectedSkills.jlpt,
                      itJapanese: selectedSkills.itJapanese,
                      coreProgramming: selectedSkills.core,
                      framework: selectedSkills.framework,
                      attitudeCulture: selectedSkills.attitude,
                    }}
                  />
                </div>
                <div className="mt-4 grid grid-cols-5 gap-2 text-center">
                  <div>
                    <p className="text-xs text-gray-500 dark:text-gray-400">JLPT</p>
                    <p className="text-sm font-bold text-gray-900 dark:text-white">{selectedSkills.jlpt}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500 dark:text-gray-400">IT日本語</p>
                    <p className="text-sm font-bold text-gray-900 dark:text-white">{selectedSkills.itJapanese}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500 dark:text-gray-400">プログラミング</p>
                    <p className="text-sm font-bold text-gray-900 dark:text-white">{selectedSkills.core}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500 dark:text-gray-400">フレームワーク</p>
                    <p className="text-sm font-bold text-gray-900 dark:text-white">{selectedSkills.framework}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500 dark:text-gray-400">態度・文化</p>
                    <p className="text-sm font-bold text-gray-900 dark:text-white">{selectedSkills.attitude}</p>
                  </div>
                </div>
              </Card>

              {/* Feedback section */}
              <Card title="フィードバック">
                <div className="mb-4">
                  <button
                    onClick={() => setShowFeedbackForm(!showFeedbackForm)}
                    className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
                  >
                    {showFeedbackForm ? 'キャンセル' : '+ フィードバック作成'}
                  </button>
                </div>

                {showFeedbackForm && (
                  <form action={handleFeedback} className="mb-4 rounded-lg border border-gray-200 p-4 dark:border-gray-700">
                    <input type="hidden" name="user_id" value={selectedUserId ?? ''} />
                    <div className="grid gap-3 sm:grid-cols-2">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">カテゴリ</label>
                        <select name="category"
                          className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                          {Object.entries(categoryLabels).map(([key, label]) => (
                            <option key={key} value={key}>{label}</option>
                          ))}
                        </select>
                      </div>
                    </div>
                    <div className="mt-3">
                      <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">内容 *</label>
                      <textarea name="content" required rows={3}
                        className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
                    </div>
                    <button type="submit" disabled={pending}
                      className="mt-3 rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50">
                      {pending ? '登録中...' : '登録'}
                    </button>
                  </form>
                )}

                <div className="divide-y divide-gray-100 dark:divide-gray-700">
                  {userFeedbacks.map(fb => (
                    <div key={fb.id} className="py-3">
                      <div className="flex items-center gap-2">
                        <span className="inline-flex rounded-full bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-600 dark:bg-gray-700 dark:text-gray-400">
                          {categoryLabels[fb.category] ?? fb.category}
                        </span>
                        <span className="text-xs text-gray-400 dark:text-gray-500">
                          {new Date(fb.created_at).toLocaleDateString('ja-JP')}
                        </span>
                      </div>
                      <p className="mt-1 text-sm text-gray-700 dark:text-gray-300">{fb.content}</p>
                    </div>
                  ))}
                  {userFeedbacks.length === 0 && (
                    <p className="py-4 text-center text-sm text-gray-400 dark:text-gray-500">フィードバックがありません</p>
                  )}
                </div>
              </Card>
            </>
          ) : (
            <Card>
              <div className="py-12 text-center text-sm text-gray-400 dark:text-gray-500">
                左の一覧から社員を選択してください
              </div>
            </Card>
          )}
        </div>
      </div>
    </div>
  )
}
