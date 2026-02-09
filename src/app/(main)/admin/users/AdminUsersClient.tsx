'use client'

import { useState, useTransition } from 'react'
import Badge from '@/components/ui/Badge'
import { updateUserRole, createUserAccount } from '@/app/actions/admin'

interface User {
  id: string
  email: string
  full_name: string | null
  role: string
  coding_rank: string
  jlpt_level: string | null
  is_onboarded: boolean
  created_at: string
}

export default function AdminUsersClient({ users }: { users: User[] }) {
  const [showCreateForm, setShowCreateForm] = useState(false)
  const [search, setSearch] = useState('')
  const [pending, startTransition] = useTransition()
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  const filtered = users.filter(u =>
    (u.full_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
    u.email.toLowerCase().includes(search.toLowerCase())
  )

  function handleRoleChange(userId: string, newRole: string) {
    startTransition(async () => {
      const result = await updateUserRole(userId, newRole)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '역할이 변경되었습니다' })
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  async function handleCreate(formData: FormData) {
    startTransition(async () => {
      const result = await createUserAccount(formData)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '계정이 생성되었습니다' })
        setShowCreateForm(false)
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className={`mb-4 rounded-lg px-4 py-3 text-sm ${
          message.type === 'success' ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-700'
        }`}>
          {message.text}
        </div>
      )}

      <div className="flex items-center justify-between gap-4">
        <input
          type="text"
          placeholder="이름 또는 이메일로 검색..."
          value={search}
          onChange={e => setSearch(e.target.value)}
          className="w-full max-w-xs rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none"
        />
        <button
          onClick={() => setShowCreateForm(!showCreateForm)}
          className="shrink-0 rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700"
        >
          {showCreateForm ? '취소' : '+ 계정 생성'}
        </button>
      </div>

      {showCreateForm && (
        <form action={handleCreate} className="mt-4 rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
          <h3 className="mb-4 text-lg font-semibold text-gray-900">새 계정 생성</h3>
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-gray-700">이메일 *</label>
              <input name="email" type="email" required
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700">비밀번호 *</label>
              <input name="password" type="password" required minLength={6}
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700">이름 *</label>
              <input name="full_name" required
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700">역할</label>
              <select name="role" defaultValue="mentee"
                className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none">
                <option value="mentee">멘티</option>
                <option value="mentor">멘토</option>
                <option value="admin">관리자</option>
              </select>
            </div>
          </div>
          <button type="submit" disabled={pending}
            className="mt-4 rounded-lg bg-blue-600 px-6 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50">
            {pending ? '생성 중...' : '생성'}
          </button>
        </form>
      )}

      <div className="mt-4 rounded-xl border border-gray-200 bg-white">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">이름</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">이메일</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">역할</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">코딩 등급</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">JLPT</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-gray-500">가입일</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100">
              {filtered.map(user => (
                <tr key={user.id}>
                  <td className="whitespace-nowrap px-4 py-3">
                    <span className="text-sm font-medium text-gray-900">{user.full_name ?? '-'}</span>
                    {!user.is_onboarded && (
                      <span className="ml-2 text-xs text-orange-500">(미온보딩)</span>
                    )}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-gray-600">{user.email}</td>
                  <td className="whitespace-nowrap px-4 py-3">
                    <select
                      value={user.role}
                      onChange={e => handleRoleChange(user.id, e.target.value)}
                      disabled={pending}
                      className="rounded border border-gray-300 px-2 py-1 text-xs focus:border-blue-500 focus:outline-none"
                    >
                      <option value="mentee">멘티</option>
                      <option value="mentor">멘토</option>
                      <option value="admin">관리자</option>
                    </select>
                  </td>
                  <td className="whitespace-nowrap px-4 py-3">
                    <Badge label={user.coding_rank} variant="coding_rank" />
                  </td>
                  <td className="whitespace-nowrap px-4 py-3">
                    {user.jlpt_level ? (
                      <Badge label={user.jlpt_level} variant="jlpt" />
                    ) : (
                      <span className="text-xs text-gray-400">미정</span>
                    )}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-gray-500">
                    {new Date(user.created_at).toLocaleDateString('ko-KR')}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {filtered.length === 0 && (
          <div className="py-8 text-center text-sm text-gray-400">검색 결과가 없습니다</div>
        )}
      </div>
    </div>
  )
}
