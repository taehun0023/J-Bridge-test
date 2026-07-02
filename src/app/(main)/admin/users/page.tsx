import { createClient } from '@/lib/supabase/server'
import Link from 'next/link'
import Card from '@/components/ui/Card'
import AdminUsersClient from './AdminUsersClient'
import { getMenteeMentorsMap } from '@/lib/mentor-helpers'

export default async function AdminUsersPage() {
  const supabase = await createClient()

  const [
    { data: rawUsers },
    { data: mentorList },
  ] = await Promise.all([
    supabase
      .from('profiles')
      .select('id, email, full_name, role, mentor_specialty, is_onboarded, is_japanese, created_at, target_certification, jlpt_level, it_certifications')
      .neq('email', 'admin@admin.com') // 편의용 관리자 계정은 목록에서 숨김
      .order('created_at', { ascending: false }),
    supabase
      .from('profiles')
      .select('id, full_name, mentor_specialty')
      .eq('role', 'mentor')
      .order('full_name'),
  ])

  const menteeIds = (rawUsers ?? []).filter(u => u.role === 'mentee').map(u => u.id)
  const mentorsMap = await getMenteeMentorsMap(supabase, menteeIds)

  const users = (rawUsers ?? []).map((u) => ({
    ...u,
    assigned_japanese_mentor_id: mentorsMap[u.id]?.japanese?.id ?? null,
    assigned_tech_mentor_id: mentorsMap[u.id]?.technical?.id ?? null,
  }))

  const stats = {
    total: users?.length ?? 0,
    admin: users?.filter(u => u.role === 'admin').length ?? 0,
    mentor: users?.filter(u => u.role === 'mentor').length ?? 0,
    mentee: users?.filter(u => u.role === 'mentee').length ?? 0,
  }

  return (
    <div>
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">ユーザー管理</h1>
        </div>
        <Link
          href="/admin/mentors"
          className="rounded-xl bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-500 transition-colors"
        >
          メンター管理
        </Link>
      </div>

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

      <AdminUsersClient users={users ?? []} mentors={mentorList ?? []} />
    </div>
  )
}
