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
      <h1 className="text-2xl font-bold text-gray-900">과제 배정</h1>
      <p className="mt-1 text-gray-500">과제 생성 및 진행 상태 관리</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-5">
        <Card>
          <p className="text-sm text-gray-500">전체</p>
          <p className="text-2xl font-bold text-gray-900">{stats.total}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500">대기</p>
          <p className="text-2xl font-bold text-yellow-600">{stats.pending}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500">진행중</p>
          <p className="text-2xl font-bold text-blue-600">{stats.inProgress}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500">완료</p>
          <p className="text-2xl font-bold text-green-600">{stats.completed}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500">기한초과</p>
          <p className="text-2xl font-bold text-red-600">{stats.overdue}</p>
        </Card>
      </div>

      <AdminTasksClient tasks={tasks ?? []} users={users ?? []} />
    </div>
  )
}
