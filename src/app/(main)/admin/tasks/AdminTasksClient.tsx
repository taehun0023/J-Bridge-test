'use client'

import { useState, useTransition } from 'react'
import { createTaskAssignment, deleteTaskAssignment } from '@/app/actions/admin'

interface Task {
  id: string
  assigned_to: string
  target_type: string
  target_id: string
  title: string | null
  description: string | null
  due_date: string | null
  status: string
  created_at: string
  assignee: { full_name: string | null; email: string } | null
}

interface User {
  id: string
  full_name: string | null
  email: string
  role: string
}

const statusColors: Record<string, string> = {
  pending: 'bg-yellow-100 text-yellow-700',
  in_progress: 'bg-blue-100 text-blue-700',
  completed: 'bg-green-100 text-green-700',
  overdue: 'bg-red-100 text-red-700',
}

const statusLabels: Record<string, string> = {
  pending: '대기',
  in_progress: '진행중',
  completed: '완료',
  overdue: '기한초과',
}

const targetTypeLabels: Record<string, string> = {
  quiz: '퀴즈',
  coding_problem: '코딩 문제',
  coding_exam: '코딩 시험',
  project: '프로젝트',
}

export default function AdminTasksClient({ tasks, users }: { tasks: Task[]; users: User[] }) {
  const [showForm, setShowForm] = useState(false)
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<string | null>(null)

  async function handleCreate(formData: FormData) {
    startTransition(async () => {
      const result = await createTaskAssignment(formData)
      if (result.error) setMessage(result.error)
      else {
        setMessage('과제가 배정되었습니다')
        setShowForm(false)
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleDelete(taskId: string) {
    if (!confirm('과제를 삭제하시겠습니까?')) return
    startTransition(async () => {
      const result = await deleteTaskAssignment(taskId)
      if (result.error) setMessage(result.error)
      else setMessage('삭제되었습니다')
      setTimeout(() => setMessage(null), 3000)
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700">{message}</div>
      )}

      <button
        onClick={() => setShowForm(!showForm)}
        className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
      >
        {showForm ? '취소' : '+ 과제 배정'}
      </button>

      {showForm && (
        <form action={handleCreate} className="mt-4 rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
          <h3 className="mb-4 text-lg font-semibold text-gray-900">새 과제 배정</h3>
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700">배정 대상 *</label>
              <select name="assigned_to" required
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none">
                <option value="">선택...</option>
                {users.map(u => (
                  <option key={u.id} value={u.id}>{u.full_name ?? u.email}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700">과제 유형 *</label>
              <select name="target_type" required
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none">
                <option value="quiz">퀴즈</option>
                <option value="coding_problem">코딩 문제</option>
                <option value="coding_exam">코딩 시험</option>
                <option value="project">프로젝트</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700">제목 *</label>
              <input name="title" required
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700">마감일</label>
              <input name="due_date" type="date"
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none" />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700">설명</label>
              <textarea name="description" rows={2}
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none" />
            </div>
            <input type="hidden" name="target_id" value="00000000-0000-0000-0000-000000000000" />
          </div>
          <button type="submit" disabled={pending}
            className="mt-4 rounded-lg bg-blue-600 px-6 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50">
            {pending ? '배정 중...' : '배정'}
          </button>
        </form>
      )}

      <div className="mt-4 rounded-xl border border-gray-200 bg-white">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">제목</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">대상자</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">유형</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">상태</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">마감일</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-gray-500">작업</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {tasks.map(task => (
                <tr key={task.id}>
                  <td className="px-4 py-3 text-sm font-medium text-gray-900">{task.title ?? '-'}</td>
                  <td className="px-4 py-3 text-sm text-gray-600">
                    {(task.assignee as { full_name: string | null } | null)?.full_name ?? '-'}
                  </td>
                  <td className="px-4 py-3 text-sm text-gray-600">
                    {targetTypeLabels[task.target_type] ?? task.target_type}
                  </td>
                  <td className="px-4 py-3">
                    <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${statusColors[task.status] ?? 'bg-gray-100 text-gray-600'}`}>
                      {statusLabels[task.status] ?? task.status}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-sm text-gray-500">
                    {task.due_date ? new Date(task.due_date).toLocaleDateString('ko-KR') : '-'}
                  </td>
                  <td className="px-4 py-3 text-right">
                    <button
                      onClick={() => handleDelete(task.id)}
                      disabled={pending}
                      className="text-xs text-red-600 hover:underline disabled:opacity-50"
                    >
                      삭제
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {tasks.length === 0 && (
          <div className="py-8 text-center text-sm text-gray-400">배정된 과제가 없습니다</div>
        )}
      </div>
    </div>
  )
}
