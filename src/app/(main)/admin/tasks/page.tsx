import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import Card from '@/components/ui/Card'
import AdminTasksClient from './AdminTasksClient'

export default async function AdminTasksPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  const { data: currentProfile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user!.id)
    .single()

  const currentRole = currentProfile?.role ?? 'mentee'

  // Fetch learning assignments
  const { data: learningAssignments } = await supabase
    .from('learning_assignments')
    .select('*, assignee:profiles!learning_assignments_assigned_to_fkey(full_name, email)')
    .order('created_at', { ascending: false })
    .limit(100)

  // Fetch comprehensive exam requests
  const { data: examRequests } = await supabase
    .from('comprehensive_exams')
    .select('*, user:profiles!comprehensive_exams_user_id_fkey(full_name, email)')
    .in('status', ['requested', 'approved', 'in_progress'])
    .order('requested_at', { ascending: false })
    .limit(50)

  // Fetch pending retake requests
  let retakeRequests: { attempt_id: string; user_id: string; user_name: string | null; quiz_title: string | null; retake_requested_at: string | null }[] = []
  const serviceClient = createServiceRoleClient()
  if (serviceClient) {
    const { data: retakeAttempts } = await serviceClient
      .from('quiz_attempts')
      .select('id, user_id, retake_requested_at, quizzes(title), profiles:user_id(full_name)')
      .eq('retake_request_status', 'requested')
      .order('retake_requested_at', { ascending: false })

    retakeRequests = (retakeAttempts ?? []).map(a => ({
      attempt_id: a.id,
      user_id: a.user_id,
      user_name: (a.profiles as any)?.full_name ?? null,
      quiz_title: (a.quizzes as any)?.title ?? null,
      retake_requested_at: a.retake_requested_at,
    }))
  }

  // For mentors: only show their assigned mentees (use serviceClient to bypass RLS/schema cache issues)
  let users: { id: string; full_name: string | null; email: string; role: string }[] = []
  if (currentRole === 'mentor' && serviceClient) {
    const { data: menteeAssignments } = await serviceClient
      .from('mentor_mentee_assignments')
      .select('mentee:profiles!mentor_mentee_assignments_mentee_id_fkey(id, full_name, email, role)')
      .eq('mentor_id', user!.id)

    users = (menteeAssignments ?? [])
      .map(a => a.mentee as unknown as { id: string; full_name: string | null; email: string; role: string })
      .filter(Boolean)
  } else {
    const { data } = await supabase
      .from('profiles')
      .select('id, full_name, email, role')
      .in('role', ['mentee', 'mentor'])
      .order('full_name')
    users = data ?? []
  }

  const taskStats = {
    total: learningAssignments?.length ?? 0,
    pending: learningAssignments?.filter(t => t.status === 'pending').length ?? 0,
    inProgress: learningAssignments?.filter(t => t.status === 'in_progress').length ?? 0,
    completed: learningAssignments?.filter(t => t.status === 'completed').length ?? 0,
    approvals: retakeRequests.length + (examRequests?.filter(e => e.status === 'requested').length ?? 0),
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">課題配分</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">課題作成及び進捗状況管理</p>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-5">
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">全体</p>
          <p className="text-2xl font-bold text-gray-900 dark:text-white">{taskStats.total}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">待機</p>
          <p className="text-2xl font-bold text-yellow-600">{taskStats.pending}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">進行中</p>
          <p className="text-2xl font-bold text-blue-600">{taskStats.inProgress}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">完了</p>
          <p className="text-2xl font-bold text-green-600">{taskStats.completed}</p>
        </Card>
        <Card>
          <p className="text-sm text-gray-500 dark:text-gray-400">承認待ち</p>
          <p className="text-2xl font-bold text-red-600">{taskStats.approvals}</p>
        </Card>
      </div>

      <AdminTasksClient
        learningAssignments={learningAssignments ?? []}
        examRequests={examRequests ?? []}
        retakeRequests={retakeRequests}
        users={users}
        currentRole={currentRole}
      />
    </div>
  )
}
