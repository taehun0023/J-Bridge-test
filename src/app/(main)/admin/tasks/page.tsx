import { createClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminTasksClient from './AdminTasksClient'

export default async function AdminTasksPage() {
  const supabase = await createClient()

  const { data: tasks } = await supabase
    .from('task_assignments')
    .select('*, assignee:profiles!task_assignments_assigned_to_fkey(full_name, email)')
    .order('created_at', { ascending: false })
    .limit(100)

  const { data: users } = await supabase
    .from('profiles')
    .select('id, full_name, email, role')
    .in('role', ['mentee', 'mentor'])
    .order('full_name')

  const stats = {
    total: tasks?.length ?? 0,
    pending: tasks?.filter(t => t.status === 'pending').length ?? 0,
    inProgress: tasks?.filter(t => t.status === 'in_progress').length ?? 0,
    completed: tasks?.filter(t => t.status === 'completed').length ?? 0,
    overdue: tasks?.filter(t => t.status === 'overdue').length ?? 0,
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">課題配分</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">課題作成及び進捗状況管理</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-5">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全体</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{stats.total}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">待機</p>
          <p className="text-2xl font-bold text-yellow-600">{stats.pending}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">進行中</p>
          <p className="text-2xl font-bold text-blue-600">{stats.inProgress}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">完了</p>
          <p className="text-2xl font-bold text-green-600">{stats.completed}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">期限超過</p>
          <p className="text-2xl font-bold text-red-600">{stats.overdue}</p>
        </Card>
      </div>

      <AdminTasksClient tasks={tasks ?? []} users={users ?? []} />
    </div>
  )
}
