import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminUsersClient from './AdminUsersClient'

export default async function AdminUsersPage() {
  const supabase = await createClient()

  const { data: rawUsers } = await supabase
    .from('profiles')
    .select(`
      *,
      japanese_skills(jlpt_normalized, it_japanese_normalized),
      coding_skills(core_normalized, framework_normalized)
    `)
    .order('created_at', { ascending: false })

  const users = (rawUsers ?? []).map((u) => {
    const jp = u.japanese_skills as { jlpt_normalized: number; it_japanese_normalized: number } | null
    const cs = u.coding_skills as { core_normalized: number; framework_normalized: number } | null
    const jpScore = u.is_japanese ? 200 : ((jp?.jlpt_normalized ?? 0) + (jp?.it_japanese_normalized ?? 0))
    const progScore = (cs?.core_normalized ?? 0) + (cs?.framework_normalized ?? 0)
    return { ...u, japanese_score: jpScore, programming_score: progScore }
  })

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

      <AdminUsersClient users={users ?? []} />
    </div>
  )
}
