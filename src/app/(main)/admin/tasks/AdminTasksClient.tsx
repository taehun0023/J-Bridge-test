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
  pending: 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400',
  in_progress: 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400',
  completed: 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400',
  overdue: 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400',
}

const statusLabels: Record<string, string> = {
  pending: '待機',
  in_progress: '進行中',
  completed: '完了',
  overdue: '期限超過',
}

const targetTypeLabels: Record<string, string> = {
  quiz: 'クイズ',
  coding_problem: 'コーディング問題',
  coding_exam: 'コーディング試験',
  project: 'プロジェクト',
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
        setMessage('課題が配分されました')
        setShowForm(false)
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleDelete(taskId: string) {
    if (!confirm('課題を削除しますか？')) return
    startTransition(async () => {
      const result = await deleteTaskAssignment(taskId)
      if (result.error) setMessage(result.error)
      else setMessage('削除されました')
      setTimeout(() => setMessage(null), 3000)
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className="mb-4 rounded-lg bg-blue-50 px-4 py-3 text-sm text-blue-700 dark:bg-blue-900/30 dark:text-blue-300">{message}</div>
      )}

      <button
        onClick={() => setShowForm(!showForm)}
        className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
      >
        {showForm ? 'キャンセル' : '+ 課題配分'}
      </button>

      {showForm && (
        <form action={handleCreate} className="mt-4 rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-700 dark:bg-gray-800">
          <h3 className="mb-4 text-lg font-semibold text-gray-900 dark:text-white">新規課題配分</h3>
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">配分対象 *</label>
              <select name="assigned_to" required
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                <option value="">選択...</option>
                {users.map(u => (
                  <option key={u.id} value={u.id}>{u.full_name ?? u.email}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">課題種類 *</label>
              <select name="target_type" required
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                <option value="quiz">クイズ</option>
                <option value="coding_problem">コーディング問題</option>
                <option value="coding_exam">コーディング試験</option>
                <option value="project">プロジェクト</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">タイトル *</label>
              <input name="title" required
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">期限</label>
              <input name="due_date" type="date"
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <div className="sm:col-span-2">
              <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">説明</label>
              <textarea name="description" rows={2}
                className="mt-1 w-full rounded-lg border border-gray-300 bg-white px-3 py-2 text-sm text-gray-900 focus:border-blue-500 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-white" />
            </div>
            <input type="hidden" name="target_id" value="00000000-0000-0000-0000-000000000000" />
          </div>
          <button type="submit" disabled={pending}
            className="mt-4 rounded-lg bg-blue-600 px-6 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50">
            {pending ? '配分中...' : '配分'}
          </button>
        </form>
      )}

      <div className="mt-4 rounded-xl border border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-800">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
            <thead className="bg-gray-50 dark:bg-gray-700">
              <tr>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">タイトル</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">対象者</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">種類</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">状態</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400">期限</th>
                <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 dark:text-gray-400">操作</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-gray-700">
              {tasks.map(task => (
                <tr key={task.id}>
                  <td className="px-4 py-3 text-sm font-medium text-gray-900 dark:text-white">{task.title ?? '-'}</td>
                  <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                    {(task.assignee as { full_name: string | null } | null)?.full_name ?? '-'}
                  </td>
                  <td className="px-4 py-3 text-sm text-gray-600 dark:text-gray-400">
                    {targetTypeLabels[task.target_type] ?? task.target_type}
                  </td>
                  <td className="px-4 py-3">
                    <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ${statusColors[task.status] ?? 'bg-gray-100 text-gray-600 dark:bg-gray-600 dark:text-gray-300'}`}>
                      {statusLabels[task.status] ?? task.status}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-sm text-gray-500 dark:text-gray-400">
                    {task.due_date ? new Date(task.due_date).toLocaleDateString('ja-JP') : '-'}
                  </td>
                  <td className="px-4 py-3 text-right">
                    <button
                      onClick={() => handleDelete(task.id)}
                      disabled={pending}
                      className="text-xs text-red-600 hover:underline disabled:opacity-50 dark:text-red-400"
                    >
                      削除
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {tasks.length === 0 && (
          <div className="py-8 text-center text-sm text-gray-400 dark:text-gray-500">配分された課題がありません</div>
        )}
      </div>
    </div>
  )
}
