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
  general: '일반',
  japanese: '일본어',
  coding: '코딩',
  attitude: '태도',
  assignment: '과제',
  dispatch_readiness: '파견준비도',
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
        setMessage('피드백이 등록되었습니다')
        setShowFeedbackForm(false)
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleRecalcAll() {
    startTransition(async () => {
      const result = await recalculateAllScores()
      if (result.error) setMessage(result.error)
      else setMessage(`${result.processed}명의 점수를 재계산했습니다`)
      setTimeout(() => setMessage(null), 5000)
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700">{message}</div>
      )}

      <div className="mb-4">
        <button
          onClick={handleRecalcAll}
          disabled={pending}
          className="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50"
        >
          {pending ? '재계산 중...' : '전체 점수 재계산'}
        </button>
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        {/* User list */}
        <div className="lg:col-span-1">
          <Card title="사원 목록">
            <div className="max-h-[600px] space-y-1 overflow-y-auto">
              {users.map(user => (
                <button
                  key={user.id}
                  onClick={() => setSelectedUserId(user.id)}
                  className={`w-full rounded-lg px-3 py-2.5 text-left transition-colors ${
                    selectedUserId === user.id
                      ? 'bg-blue-50 text-blue-700'
                      : 'hover:bg-gray-50'
                  }`}
                >
                  <p className="text-sm font-medium text-gray-900">
                    {user.full_name ?? user.email}
                  </p>
                  <div className="mt-0.5 flex items-center gap-2">
                    <Badge label={user.coding_rank} variant="coding_rank" />
                    {user.jlpt_level && <Badge label={user.jlpt_level} variant="jlpt" />}
                    <span className="text-xs text-gray-400">{user.role}</span>
                  </div>
                </button>
              ))}
              {users.length === 0 && (
                <p className="py-4 text-center text-sm text-gray-400">사원이 없습니다</p>
              )}
            </div>
          </Card>
        </div>

        {/* Detail view */}
        <div className="lg:col-span-2 space-y-6">
          {selectedUser && selectedSkills ? (
            <>
              <Card title={`${selectedUser.full_name ?? selectedUser.email} - 5축 차트`}>
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
                    <p className="text-xs text-gray-500">JLPT</p>
                    <p className="text-sm font-bold text-gray-900">{selectedSkills.jlpt}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500">IT 일본어</p>
                    <p className="text-sm font-bold text-gray-900">{selectedSkills.itJapanese}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500">프로그래밍</p>
                    <p className="text-sm font-bold text-gray-900">{selectedSkills.core}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500">프레임워크</p>
                    <p className="text-sm font-bold text-gray-900">{selectedSkills.framework}</p>
                  </div>
                  <div>
                    <p className="text-xs text-gray-500">태도/문화</p>
                    <p className="text-sm font-bold text-gray-900">{selectedSkills.attitude}</p>
                  </div>
                </div>
              </Card>

              {/* Feedback section */}
              <Card title="피드백">
                <div className="mb-4">
                  <button
                    onClick={() => setShowFeedbackForm(!showFeedbackForm)}
                    className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
                  >
                    {showFeedbackForm ? '취소' : '+ 피드백 작성'}
                  </button>
                </div>

                {showFeedbackForm && (
                  <form action={handleFeedback} className="mb-4 rounded-lg border border-gray-200 p-4">
                    <input type="hidden" name="user_id" value={selectedUserId ?? ''} />
                    <div className="grid gap-3 sm:grid-cols-2">
                      <div>
                        <label className="block text-sm font-medium text-gray-700">카테고리</label>
                        <select name="category"
                          className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none">
                          {Object.entries(categoryLabels).map(([key, label]) => (
                            <option key={key} value={key}>{label}</option>
                          ))}
                        </select>
                      </div>
                    </div>
                    <div className="mt-3">
                      <label className="block text-sm font-medium text-gray-700">내용 *</label>
                      <textarea name="content" required rows={3}
                        className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none" />
                    </div>
                    <button type="submit" disabled={pending}
                      className="mt-3 rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50">
                      {pending ? '등록 중...' : '등록'}
                    </button>
                  </form>
                )}

                <div className="divide-y divide-gray-100">
                  {userFeedbacks.map(fb => (
                    <div key={fb.id} className="py-3">
                      <div className="flex items-center gap-2">
                        <span className="inline-flex rounded-full bg-gray-100 px-2 py-0.5 text-xs font-medium text-gray-600">
                          {categoryLabels[fb.category] ?? fb.category}
                        </span>
                        <span className="text-xs text-gray-400">
                          {new Date(fb.created_at).toLocaleDateString('ko-KR')}
                        </span>
                      </div>
                      <p className="mt-1 text-sm text-gray-700">{fb.content}</p>
                    </div>
                  ))}
                  {userFeedbacks.length === 0 && (
                    <p className="py-4 text-center text-sm text-gray-400">피드백이 없습니다</p>
                  )}
                </div>
              </Card>
            </>
          ) : (
            <Card>
              <div className="py-12 text-center text-sm text-gray-400">
                왼쪽 목록에서 사원을 선택하세요
              </div>
            </Card>
          )}
        </div>
      </div>
    </div>
  )
}
