'use client'

import { useState } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import { useRouter } from 'next/navigation'
import { updateUserRole, createUserAccount, updateMentorSpecialty, deleteUser, bulkDeleteUsers, assignMentor } from '@/app/actions/admin/users'
import { Trash2 } from 'lucide-react'
import NameRuby from '@/components/ui/NameRuby'
import EditUserModal from './EditUserModal'

interface User {
  id: string
  email: string
  full_name: string | null
  role: string
  mentor_specialty: string | null
  is_onboarded: boolean
  is_japanese: boolean
  created_at: string
  assigned_japanese_mentor_id: string | null
  assigned_tech_mentor_id: string | null
  target_certification: string | null
  jlpt_level: string | null
  it_certifications: string | null
}

interface Mentor {
  id: string
  full_name: string | null
  mentor_specialty: string | null
}

interface Props {
  users: User[]
  mentors: Mentor[]
}

export default function AdminUsersClient({ users, mentors }: Props) {
  const router = useRouter()
  const [showCreateForm, setShowCreateForm] = useState(false)
  const [search, setSearch] = useState('')
  const [pending, startTransition] = useLoadingTransition()
  const [message, setMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)
  const [deleteTarget, setDeleteTarget] = useState<User | null>(null)
  const [editTarget, setEditTarget] = useState<User | null>(null)
  const [selected, setSelected] = useState<Set<string>>(new Set())
  const [showBulkConfirm, setShowBulkConfirm] = useState(false)

  const roleOrder: Record<string, number> = { admin: 0, mentor: 1, mentee: 2 }
  const filtered = users
    .filter(u =>
      (u.full_name ?? '').toLowerCase().includes(search.toLowerCase()) ||
      u.email.toLowerCase().includes(search.toLowerCase())
    )
    .sort((a, b) => {
      const roleDiff = (roleOrder[a.role] ?? 99) - (roleOrder[b.role] ?? 99)
      if (roleDiff !== 0) return roleDiff
      return (a.full_name ?? '').localeCompare(b.full_name ?? '', 'ja')
    })

  // 전문(専門) 구분 폐지 — 모든 멘토를 일본어·기술 양쪽에 배정 가능
  const japaneseMentors = mentors
  const techMentors = mentors

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

  function handleSpecialtyChange(userId: string, specialty: string) {
    startTransition(async () => {
      const result = await updateMentorSpecialty(userId, specialty || null)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
        setTimeout(() => setMessage(null), 3000)
      } else {
        setMessage({ type: 'success', text: '専門分野が変更されました' })
        setTimeout(() => setMessage(null), 3000)
        router.refresh()
      }
    })
  }

  function handleMentorChange(menteeId: string, mentorId: string, specialty: 'japanese' | 'technical') {
    startTransition(async () => {
      const result = await assignMentor(menteeId, mentorId || null, specialty)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
        setTimeout(() => setMessage(null), 3000)
      } else {
        setMessage({ type: 'success', text: '担当メンターが変更されました' })
        setTimeout(() => setMessage(null), 3000)
        router.refresh()
      }
    })
  }

  function handleDelete() {
    if (!deleteTarget) return
    startTransition(async () => {
      const result = await deleteUser(deleteTarget.id)
      if (result.error) {
        setMessage({ type: 'error', text: result.error })
      } else {
        setMessage({ type: 'success', text: 'アカウントが削除されました' })
      }
      setDeleteTarget(null)
      setTimeout(() => setMessage(null), 3000)
      router.refresh()
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

  function toggleSelect(id: string) {
    setSelected(prev => {
      const n = new Set(prev)
      if (n.has(id)) n.delete(id); else n.add(id)
      return n
    })
  }
  const allSelected = filtered.length > 0 && filtered.every(u => selected.has(u.id))
  function toggleSelectAll() {
    setSelected(allSelected ? new Set() : new Set(filtered.map(u => u.id)))
  }
  function handleBulkDelete() {
    startTransition(async () => {
      const result = await bulkDeleteUsers([...selected])
      if ('error' in result) {
        setMessage({ type: 'error', text: result.error ?? 'エラーが発生しました' })
      } else {
        const errCount = result.errors.length
        setMessage({ type: errCount ? 'error' : 'success', text: `${result.deleted}件削除しました${errCount ? `（${errCount}件失敗）` : ''}` })
      }
      setSelected(new Set())
      setShowBulkConfirm(false)
      setTimeout(() => setMessage(null), 4000)
      router.refresh()
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

      <div className="flex items-center justify-between gap-4">
        <input
          type="text"
          placeholder="名前またはメールで検索..."
          value={search}
          onChange={e => setSearch(e.target.value)}
          className="w-full max-w-xs rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100 dark:placeholder-zinc-500"
        />
        <div className="flex shrink-0 items-center gap-2">
          {selected.size > 0 && (
            <button
              onClick={() => setShowBulkConfirm(true)}
              disabled={pending}
              className="flex items-center gap-1.5 rounded-xl bg-red-600 px-4 py-2 text-sm font-medium text-white hover:bg-red-500 disabled:opacity-50 transition-colors"
            >
              <Trash2 className="h-4 w-4" />
              選択削除 ({selected.size})
            </button>
          )}
          <button
            onClick={() => setShowCreateForm(!showCreateForm)}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
          >
            {showCreateForm ? 'キャンセル' : '+ アカウント作成'}
          </button>
        </div>
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
                className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100">
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
                <th className="px-3 py-3 text-center">
                  <input type="checkbox" checked={allSelected} onChange={toggleSelectAll} aria-label="全選択"
                    className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500" />
                </th>
                <th className="px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:text-zinc-400">名前</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">メール</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">日本語メンター</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">技術メンター</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">役割</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">登録日</th>
                <th className="border-l border-gray-200/40 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">操作</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-white/[0.06] dark:divide-white/[0.06] divide-gray-100">
              {filtered.map(user => {
                return (
                <tr key={user.id} className={`transition-colors has-[.row-trash:hover]:bg-red-50 dark:has-[.row-trash:hover]:bg-red-500/10 ${selected.has(user.id) ? 'bg-indigo-50/60 dark:bg-indigo-500/10' : ''}`}>
                  <td className="px-3 py-3 text-center">
                    <input type="checkbox" checked={selected.has(user.id)} onChange={() => toggleSelect(user.id)} aria-label="選択"
                      className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500" />
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 text-left">
                    <button
                      type="button"
                      onClick={() => setEditTarget(user)}
                      className="text-sm font-medium text-zinc-900 hover:text-indigo-600 hover:underline dark:text-zinc-100 dark:hover:text-indigo-400"
                      title="プロフィールを編集"
                    >
                      <NameRuby name={user.full_name} fallback="-" />
                    </button>
                    {!user.is_onboarded && (
                      <span className="ml-2 text-xs text-amber-400">(未オンボーディング)</span>
                    )}
                    {user.is_japanese && (
                      <span className="ml-1 inline-flex rounded-full bg-amber-500/10 px-1.5 py-0.5 text-[10px] font-medium text-amber-400 ring-1 ring-amber-500/20">JP</span>
                    )}
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-left text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">{user.email}</td>
                  {user.role === 'mentee' ? (
                    <>
                      <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                        <select
                          value={user.assigned_japanese_mentor_id ?? ''}
                          onChange={e => handleMentorChange(user.id, e.target.value, 'japanese')}
                          disabled={pending}
                          title="日本語メンター"
                          className="rounded-lg border border-gray-200 bg-white px-2 py-1 text-xs text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
                        >
                          <option value="">未指定</option>
                          {japaneseMentors.map(m => (
                            <option key={m.id} value={m.id}>{m.full_name ?? m.id}</option>
                          ))}
                        </select>
                      </td>
                      <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                        <select
                          value={user.assigned_tech_mentor_id ?? ''}
                          onChange={e => handleMentorChange(user.id, e.target.value, 'technical')}
                          disabled={pending}
                          title="技術メンター"
                          className="rounded-lg border border-gray-200 bg-white px-2 py-1 text-xs text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
                        >
                          <option value="">未指定</option>
                          {techMentors.map(m => (
                            <option key={m.id} value={m.id}>{m.full_name ?? m.id}</option>
                          ))}
                        </select>
                      </td>
                    </>
                  ) : user.role === 'mentor' ? (
                    <td colSpan={2} className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-500 dark:border-white/[0.06] dark:text-zinc-400">
                      日本語・技術
                    </td>
                  ) : (
                    <td colSpan={2} className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center dark:border-white/[0.06]">
                      <span className="text-xs text-zinc-400">—</span>
                    </td>
                  )}
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center dark:border-white/[0.06]">
                    <select
                      value={user.role}
                      onChange={e => handleRoleChange(user.id, e.target.value)}
                      disabled={pending}
                      className="rounded-lg border border-gray-200 bg-white px-2 py-1 text-xs text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
                    >
                      <option value="mentee">メンティー</option>
                      <option value="mentor">メンター</option>
                      <option value="admin">管理者</option>
                    </select>
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center text-sm text-zinc-700 dark:border-white/[0.06] dark:text-zinc-300">
                    {new Date(user.created_at).toLocaleDateString('ja-JP')}
                  </td>
                  <td className="whitespace-nowrap border-l border-gray-200/40 px-4 py-3 text-center dark:border-white/[0.06]">
                    <div className="flex items-center justify-center gap-1">
                      <button
                        onClick={() => setDeleteTarget(user)}
                        disabled={pending}
                        className="row-trash rounded-lg p-1.5 text-zinc-400 hover:bg-red-500/10 hover:text-red-400 disabled:opacity-50 transition-colors"
                        title="削除"
                      >
                        <Trash2 className="h-4 w-4" />
                      </button>
                    </div>
                  </td>
                </tr>
                )
              })}
            </tbody>
          </table>
        </div>
        {filtered.length === 0 && (
          <div className="py-8 text-center text-sm text-zinc-500">検索結果がありません</div>
        )}
      </div>
      {editTarget && (
        <EditUserModal
          user={editTarget}
          mentors={mentors}
          onClose={() => setEditTarget(null)}
          onSaved={(msg) => {
            setEditTarget(null)
            setMessage({ type: 'success', text: msg })
            setTimeout(() => setMessage(null), 3000)
            router.refresh()
          }}
        />
      )}
      {deleteTarget && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm" onClick={() => setDeleteTarget(null)}>
          <div className="mx-4 w-full max-w-md rounded-2xl border border-gray-200/60 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
            <h3 className="flex items-center gap-2 text-lg font-semibold text-zinc-900 dark:text-zinc-100">
              <span className="text-amber-500">⚠</span> アカウント削除
            </h3>
            <div className="mt-4 space-y-2 text-sm text-zinc-600 dark:text-zinc-400">
              <p>以下のアカウントを削除します。</p>
              <p className="font-medium text-red-500">この操作は取り消せません。</p>
              <p>関連する全てのデータ（試験結果、学習記録等）も削除されます。</p>
            </div>
            <div className="mt-4 rounded-xl bg-zinc-50 p-3 dark:bg-white/5">
              <p className="text-sm text-zinc-900 dark:text-zinc-100"><span className="text-zinc-500 dark:text-zinc-400">名前:</span> <NameRuby name={deleteTarget.full_name} fallback="-" /></p>
              <p className="text-sm text-zinc-900 dark:text-zinc-100"><span className="text-zinc-500 dark:text-zinc-400">メール:</span> {deleteTarget.email}</p>
            </div>
            <div className="mt-6 flex justify-end gap-3">
              <button
                onClick={() => setDeleteTarget(null)}
                disabled={pending}
                className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5 transition-colors"
              >
                キャンセル
              </button>
              <button
                onClick={handleDelete}
                disabled={pending}
                className="rounded-xl bg-red-600 px-4 py-2 text-sm font-medium text-white hover:bg-red-500 disabled:opacity-50 transition-colors"
              >
                {pending ? '削除中...' : '削除する'}
              </button>
            </div>
          </div>
        </div>
      )}
      {showBulkConfirm && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 backdrop-blur-sm" onClick={() => setShowBulkConfirm(false)}>
          <div className="mx-4 w-full max-w-md rounded-2xl border border-gray-200/60 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900" onClick={e => e.stopPropagation()}>
            <h3 className="flex items-center gap-2 text-lg font-semibold text-zinc-900 dark:text-zinc-100">
              <span className="text-amber-500">⚠</span> 選択したアカウントを一括削除
            </h3>
            <div className="mt-4 space-y-2 text-sm text-zinc-600 dark:text-zinc-400">
              <p><span className="font-semibold text-red-500">{selected.size}件</span> のアカウントを削除します。</p>
              <p className="font-medium text-red-500">この操作は取り消せません。</p>
              <p>関連する全てのデータ（試験結果、学習記録等）も削除されます。（自分のアカウントは除外）</p>
            </div>
            <div className="mt-6 flex justify-end gap-3">
              <button onClick={() => setShowBulkConfirm(false)} disabled={pending}
                className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5 transition-colors">
                キャンセル
              </button>
              <button onClick={handleBulkDelete} disabled={pending}
                className="rounded-xl bg-red-600 px-4 py-2 text-sm font-medium text-white hover:bg-red-500 disabled:opacity-50 transition-colors">
                {pending ? '削除中...' : `${selected.size}件を削除`}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
