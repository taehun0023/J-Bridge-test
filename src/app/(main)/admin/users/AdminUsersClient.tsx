'use client'

import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import Badge from '@/components/ui/Badge'
import { updateUserRole, createUserAccount, approveRetakeRequest, denyRetakeRequest } from '@/app/actions/admin'

interface User {
  id: string
  email: string
  full_name: string | null
  role: string
  coding_rank: string
  jlpt_level: string | null
  is_onboarded: boolean
  is_japanese: boolean
  created_at: string
}

interface RetakeRequest {
  attempt_id: string
  user_id: string
  user_name: string | null
  quiz_title: string | null
  retake_requested_at: string | null
}

interface Props {
  users: User[]
  retakeRequests?: RetakeRequest[]
}

export default function AdminUsersClient({ users, retakeRequests = [] }: Props) {
  const router = useRouter()
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
        setTimeout(() => setMessage(null), 3000)
      } else {
        setMessage({ type: 'success', text: '役割が変更されました' })
        setTimeout(() => setMessage(null), 3000)
        router.refresh()
      }
    })
  }

  async function handleCreate(formData: FormData) {
    startTransition(async () => {
      const result = await createUserAccount(formData)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
        setTimeout(() => setMessage(null), 3000)
      } else {
        setMessage({ type: 'success', text: 'アカウントが作成されました' })
        setShowCreateForm(false)
        setTimeout(() => setMessage(null), 3000)
        router.refresh()
      }
    })
  }

  function handleApproveRetake(attemptId: string) {
    startTransition(async () => {
      const result = await approveRetakeRequest(attemptId)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '再試験を承認しました' })
        router.refresh()
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  function handleDenyRetake(attemptId: string) {
    startTransition(async () => {
      const result = await denyRetakeRequest(attemptId)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: '再試験を拒否しました' })
        router.refresh()
      }
      setTimeout(() => setMessage(null), 3000)
    })
  }

  return (
    <div className="mt-6">
      {message && (
        <div className={`mb-4 rounded-xl px-4 py-3 text-sm ${
          message.type === 'success'
            ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
            : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
        }`}>
          {message.text}
        </div>
      )}

      {/* Retake requests */}
      {retakeRequests.length > 0 && (
        <div className="mb-6 rounded-2xl border border-amber-500/20 bg-amber-500/5 p-4 backdrop-blur-md">
          <h3 className="text-sm font-semibold text-amber-400 mb-3">
            再試験リクエスト ({retakeRequests.length}件)
          </h3>
          <div className="space-y-2">
            {retakeRequests.map(req => (
              <div key={req.attempt_id} className="flex items-center justify-between rounded-xl bg-white/[0.03] dark:bg-white/[0.03] bg-white p-3 border border-white/[0.08] dark:border-white/[0.08] border-gray-200/60">
                <div>
                  <p className="text-sm font-medium text-zinc-900 dark:text-zinc-100">
                    {req.user_name ?? 'ユーザー'}
                  </p>
                  <p className="text-xs text-zinc-500 dark:text-zinc-400">
                    {req.quiz_title ?? 'テスト'} — {req.retake_requested_at ? new Date(req.retake_requested_at).toLocaleDateString('ja-JP') : ''}
                  </p>
                </div>
                <div className="flex gap-2">
                  <button
                    onClick={() => handleApproveRetake(req.attempt_id)}
                    disabled={pending}
                    className="rounded-lg bg-emerald-600 px-3 py-1 text-xs font-medium text-white hover:bg-emerald-500 disabled:opacity-50 transition-colors"
                  >
                    承認
                  </button>
                  <button
                    onClick={() => handleDenyRetake(req.attempt_id)}
                    disabled={pending}
                    className="rounded-lg bg-red-600 px-3 py-1 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-50 transition-colors"
                  >
                    拒否
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      <div className="flex items-center justify-between gap-4">
        <input
          type="text"
          placeholder="名前またはメールで検索..."
          value={search}
          onChange={e => setSearch(e.target.value)}
          className="w-full max-w-xs rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100 dark:placeholder-zinc-500"
        />
        <button
          onClick={() => setShowCreateForm(!showCreateForm)}
          className="shrink-0 rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
        >
          {showCreateForm ? 'キャンセル' : '+ アカウント作成'}
        </button>
      </div>

      {showCreateForm && (
        <form action={handleCreate} className="mt-4 rounded-2xl border border-white/[0.08] bg-white/[0.03] p-6 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03] border-gray-200/60 bg-white/80">
          <h3 className="mb-4 text-lg font-semibold text-zinc-900 dark:text-zinc-100">新規アカウント作成</h3>
          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">メール *</label>
              <input name="email" type="email" required
                className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100" />
            </div>
            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">パスワード *</label>
              <input name="password" type="password" required minLength={6}
                className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100" />
            </div>
            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">名前 *</label>
              <input name="full_name" required
                className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100" />
            </div>
            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">役割</label>
              <select name="role" defaultValue="mentee"
                className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100">
                <option value="mentee">メンティー</option>
                <option value="mentor">メンター</option>
                <option value="admin">管理者</option>
              </select>
            </div>
          </div>
          <button type="submit" disabled={pending}
            className="mt-4 rounded-xl bg-indigo-600 px-6 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors">
            {pending ? '作成中...' : '作成'}
          </button>
        </form>
      )}

      <div className="mt-4 rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03]">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-200">
            <thead>
              <tr className="bg-white/[0.02] dark:bg-white/[0.02]">
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">名前</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">メール</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">役割</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">コーディングランク</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">JLPT</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">登録日</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {filtered.map(user => (
                <tr key={user.id}>
                  <td className="whitespace-nowrap px-4 py-3">
                    <span className="text-sm font-medium text-zinc-900 dark:text-zinc-100">{user.full_name ?? '-'}</span>
                    {!user.is_onboarded && (
                      <span className="ml-2 text-xs text-amber-400">(未オンボーディング)</span>
                    )}
                    {user.is_japanese && (
                      <span className="ml-1 inline-flex rounded-full bg-amber-500/10 px-1.5 py-0.5 text-[10px] font-medium text-amber-400 ring-1 ring-amber-500/20">JP</span>
                    )}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">{user.email}</td>
                  <td className="whitespace-nowrap px-4 py-3">
                    <select
                      value={user.role}
                      onChange={e => handleRoleChange(user.id, e.target.value)}
                      disabled={pending}
                      className="rounded-lg border border-gray-200 bg-white px-2 py-1 text-xs text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
                    >
                      <option value="mentee">メンティー</option>
                      <option value="mentor">メンター</option>
                      <option value="admin">管理者</option>
                    </select>
                  </td>
                  <td className="whitespace-nowrap px-4 py-3">
                    <Badge label={user.coding_rank} variant="coding_rank" />
                  </td>
                  <td className="whitespace-nowrap px-4 py-3">
                    {user.jlpt_level ? (
                      <Badge label={user.jlpt_level} variant="jlpt" />
                    ) : (
                      <span className="text-xs text-zinc-500">未定</span>
                    )}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                    {new Date(user.created_at).toLocaleDateString('ja-JP')}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        {filtered.length === 0 && (
          <div className="py-8 text-center text-sm text-zinc-500">検索結果がありません</div>
        )}
      </div>
    </div>
  )
}
