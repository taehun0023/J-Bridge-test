import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminUsersClient from './AdminUsersClient'

export default async function AdminUsersPage() {
  const supabase = await createClient()

  const { data: users } = await supabase
    .from('profiles')
    .select('*')
    .order('created_at', { ascending: false })

  // Fetch pending retake requests (graceful fallback if retake columns not yet migrated)
  const retakeRes = await supabase
    .from('quiz_attempts')
    .select('id, user_id, retake_requested_at, quizzes(title), profiles:user_id(full_name)')
    .eq('retake_request_status', 'requested')
    .order('retake_requested_at', { ascending: false })
  const retakeAttempts = retakeRes.error ? null : retakeRes.data

  const retakeRequests = (retakeAttempts ?? []).map(a => ({
    attempt_id: a.id,
    user_id: a.user_id,
    user_name: (a.profiles as unknown as { full_name: string | null } | null)?.full_name ?? null,
    quiz_title: (a.quizzes as unknown as { title: string } | null)?.title ?? null,
    retake_requested_at: a.retake_requested_at,
  }))

  const stats = {
    total: users?.length ?? 0,
    admin: users?.filter(u => u.role === 'admin').length ?? 0,
    mentor: users?.filter(u => u.role === 'mentor').length ?? 0,
    mentee: users?.filter(u => u.role === 'mentee').length ?? 0,
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ユーザー管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">アカウント作成及び役割管理</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-4">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全体</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{stats.total}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">管理者</p>
          <p className="text-2xl font-bold text-red-600">{stats.admin}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">メンター</p>
          <p className="text-2xl font-bold text-blue-600">{stats.mentor}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">メンティー</p>
          <p className="text-2xl font-bold text-green-600">{stats.mentee}</p>
        </Card>
      </div>

      <AdminUsersClient users={users ?? []} retakeRequests={retakeRequests} />
    </div>
  )
}
