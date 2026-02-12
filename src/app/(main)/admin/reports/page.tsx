import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import AdminReportsClient from './AdminReportsClient'

export default async function AdminReportsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const { data: myProfile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const myRole = myProfile?.role
  const serviceClient = createServiceRoleClient()

  // Mentor: only show their mentees. Admin: show all mentee/mentor users.
  let users
  if (myRole === 'mentor' && serviceClient) {
    // Use serviceClient to bypass RLS/schema cache issues (same pattern as tasks page)
    const { data: menteeAssignments } = await serviceClient
      .from('mentor_mentee_assignments')
      .select('mentee:profiles!mentor_mentee_assignments_mentee_id_fkey(id, full_name, email, role, coding_rank, jlpt_level, is_japanese)')
      .eq('mentor_id', user.id)

    users = (menteeAssignments ?? [])
      .map(a => a.mentee as unknown as { id: string; full_name: string | null; email: string; role: string; coding_rank: string; jlpt_level: string | null; is_japanese: boolean })
      .filter(Boolean)
  } else {
    const { data } = await supabase.from('profiles').select('*').in('role', ['mentee', 'mentor']).order('full_name')
    users = data
  }

  const userIds = (users ?? []).map(u => u.id)

  // Get all dispatch readiness scores (latest per user)
  const { data: readinessScores } = await supabase
    .from('dispatch_readiness_scores')
    .select('*')
    .order('recorded_at', { ascending: false })

  // Get all japanese skills
  const { data: japaneseSkills } = await supabase
    .from('japanese_skills')
    .select('user_id, jlpt_normalized, it_japanese_normalized')

  // Get all coding skills
  const { data: codingSkills } = await supabase
    .from('coding_skills')
    .select('user_id, core_normalized, framework_normalized')

  // Get all attitude skills
  const { data: attitudeSkills } = await supabase
    .from('attitude_culture_skills')
    .select('user_id, attitude_normalized')

  // Get recent feedbacks — mentor sees only their mentees' feedbacks
  let feedbacks
  if (myRole === 'mentor' && userIds.length > 0) {
    const { data } = await supabase
      .from('admin_feedbacks')
      .select('*, user:profiles!admin_feedbacks_user_id_fkey(full_name)')
      .in('user_id', userIds)
      .order('created_at', { ascending: false })
      .limit(50)
    feedbacks = data
  } else if (myRole === 'mentor') {
    feedbacks = []
  } else {
    const { data } = await supabase
      .from('admin_feedbacks')
      .select('*, user:profiles!admin_feedbacks_user_id_fkey(full_name)')
      .order('created_at', { ascending: false })
      .limit(50)
    feedbacks = data
  }

  // Build skill map per user
  const skillMap: Record<string, {
    jlpt: number; itJapanese: number; core: number; framework: number; attitude: number; isJapanese: boolean
  }> = {}

  for (const u of users ?? []) {
    const js = japaneseSkills?.find(s => s.user_id === u.id)
    const cs = codingSkills?.find(s => s.user_id === u.id)
    const as_ = attitudeSkills?.find(s => s.user_id === u.id)

    const dr = readinessScores?.find(s => s.user_id === u.id)

    skillMap[u.id] = {
      jlpt: dr?.jlpt_score ?? js?.jlpt_normalized ?? 0,
      itJapanese: dr?.it_japanese_score ?? js?.it_japanese_normalized ?? 0,
      core: dr?.core_programming_score ?? cs?.core_normalized ?? 0,
      framework: dr?.framework_score ?? cs?.framework_normalized ?? 0,
      attitude: dr?.attitude_culture_score ?? as_?.attitude_normalized ?? 0,
      isJapanese: u.is_japanese ?? false,
    }
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">レポート</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">
        {myRole === 'mentor' ? 'メンティーチャート及びフィードバック管理' : '全社員チャート及びフィードバック管理'}
      </p>

      <AdminReportsClient
        users={users ?? []}
        skillMap={skillMap}
        feedbacks={feedbacks ?? []}
        userRole={myRole ?? 'admin'}
      />
    </div>
  )
}
