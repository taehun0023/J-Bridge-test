'use client'

import { useState, useTransition } from 'react'
import { assignMenteeToMentor, removeMenteeFromMentor } from '@/app/actions/mentor'
import { UserPlus, X } from 'lucide-react'

interface Mentor {
  id: string
  full_name: string | null
  email: string
}

interface MenteeInfo {
  id: string
  full_name: string | null
  email: string
  coding_rank?: string
  jlpt_level?: string | null
}

interface Assignment {
  id: string
  mentor_id: string
  mentee_id: string
  mentee: MenteeInfo | null
}

interface Props {
  mentors: Mentor[]
  mentorAssignments: Record<string, Assignment[]>
  allMentees: { id: string; full_name: string | null; email: string }[]
}

export default function AdminMentorsClient({ mentors, mentorAssignments, allMentees }: Props) {
  const [selectedMentee, setSelectedMentee] = useState<Record<string, string>>({})
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<{ text: string; type: 'success' | 'error' } | null>(null)

  function showMessage(text: string, type: 'success' | 'error' = 'success') {
    setMessage({ text, type })
    setTimeout(() => setMessage(null), 3000)
  }

  function handleAssign(mentorId: string) {
    const menteeId = selectedMentee[mentorId]
    if (!menteeId) return
    startTransition(async () => {
      try {
        const result = await assignMenteeToMentor(mentorId, menteeId)
        if (result.error) {
          showMessage(result.error, 'error')
        } else {
          showMessage('メンティーを追加しました')
          setSelectedMentee(prev => ({ ...prev, [mentorId]: '' }))
        }
      } catch {
        showMessage('追加に失敗しました', 'error')
      }
    })
  }

  function handleRemove(mentorId: string, menteeId: string) {
    if (!confirm('このメンティーの紐付けを解除しますか？')) return
    startTransition(async () => {
      try {
        const result = await removeMenteeFromMentor(mentorId, menteeId)
        if (result.error) {
          showMessage(result.error, 'error')
        } else {
          showMessage('紐付けを解除しました')
        }
      } catch {
        showMessage('解除に失敗しました', 'error')
      }
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className={`mb-4 rounded-lg px-4 py-3 text-sm ${
          message.type === 'success'
            ? 'bg-blue-50 text-blue-700 dark:bg-blue-900/30 dark:text-blue-300'
            : 'bg-red-50 text-red-700 dark:bg-red-900/30 dark:text-red-300'
        }`}>
          {message.text}
        </div>
      )}

      <div className="grid gap-6 lg:grid-cols-2">
        {mentors.map(mentor => {
          const assignments = mentorAssignments[mentor.id] ?? []
          const assignedMenteeIds = new Set(assignments.map(a => a.mentee_id))

          // Show all mentees except those already assigned to THIS mentor
          const availableMentees = allMentees.filter(m => !assignedMenteeIds.has(m.id))

          return (
            <div
              key={mentor.id}
              className="rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-700 dark:bg-gray-800"
            >
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="text-lg font-semibold text-gray-900 dark:text-white">
                    {mentor.full_name ?? mentor.email}
                  </h3>
                  <p className="text-sm text-gray-500 dark:text-gray-400">{mentor.email}</p>
                </div>
                <span className="rounded-full bg-indigo-100 px-3 py-1 text-xs font-medium text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-400">
                  {assignments.length}名
                </span>
              </div>

              {/* Mentee list */}
              <div className="mt-4 space-y-2">
                {assignments.length === 0 ? (
                  <p className="text-sm text-gray-400 dark:text-gray-500">担当メンティーなし</p>
                ) : (
                  assignments.map(a => {
                    const mentee = a.mentee as MenteeInfo | null
                    return (
                      <div key={a.id} className="flex items-center justify-between rounded-lg bg-gray-50 px-3 py-2 dark:bg-gray-700/50">
                        <div>
                          <p className="text-sm font-medium text-gray-900 dark:text-white">
                            {mentee?.full_name ?? 'Unknown'}
                          </p>
                          <p className="text-xs text-gray-500 dark:text-gray-400">
                            {mentee?.email}
                            {mentee?.jlpt_level && ` / ${mentee.jlpt_level}`}
                            {mentee?.coding_rank && ` / ${mentee.coding_rank}`}
                          </p>
                        </div>
                        <button
                          onClick={() => handleRemove(mentor.id, a.mentee_id)}
                          disabled={pending}
                          className="rounded p-1 text-gray-400 hover:bg-gray-200 hover:text-red-600 dark:hover:bg-gray-600 dark:hover:text-red-400 disabled:opacity-50"
                          title="紐付け解除"
                        >
                          <X className="h-4 w-4" />
                        </button>
                      </div>
                    )
                  })
                )}
              </div>

              {/* Add mentee */}
              <div className="mt-4 flex items-center gap-2">
                <select
                  value={selectedMentee[mentor.id] ?? ''}
                  onChange={e => setSelectedMentee(prev => ({ ...prev, [mentor.id]: e.target.value }))}
                  className="flex-1 rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-indigo-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                >
                  <option value="">メンティーを選択...</option>
                  {availableMentees.map(m => (
                    <option key={m.id} value={m.id}>{m.full_name ?? m.email}</option>
                  ))}
                </select>
                <button
                  onClick={() => handleAssign(mentor.id)}
                  disabled={pending || !selectedMentee[mentor.id]}
                  className="rounded-lg bg-indigo-600 p-2 text-white hover:bg-indigo-700 disabled:opacity-50 transition-colors"
                  title="メンティーを追加"
                >
                  <UserPlus className="h-4 w-4" />
                </button>
              </div>
            </div>
          )
        })}
      </div>

      {mentors.length === 0 && (
        <div className="mt-8 rounded-xl border border-gray-200 bg-white py-12 text-center dark:border-gray-700 dark:bg-gray-800">
          <p className="text-gray-500 dark:text-gray-400">メンターが登録されていません</p>
          <p className="mt-1 text-sm text-gray-400 dark:text-gray-500">ユーザー管理からメンターを追加してください</p>
        </div>
      )}
    </div>
  )
}
