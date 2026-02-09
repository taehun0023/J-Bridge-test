import { createClient } from '@/lib/supabase/server'
import AdminReportsClient from './AdminReportsClient'

export default async function AdminReportsPage() {
  const supabase = await createClient()

  // Get all mentee/mentor users with their skills
  const { data: users } = await supabase
    .from('profiles')
    .select('id, full_name, email, role, coding_rank, jlpt_level')
    .in('role', ['mentee', 'mentor'])
    .order('full_name')

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

  // Get recent feedbacks
  const { data: feedbacks } = await supabase
    .from('admin_feedbacks')
    .select('*, user:profiles!admin_feedbacks_user_id_fkey(full_name)')
    .order('created_at', { ascending: false })
    .limit(50)

  // Build skill map per user
  const skillMap: Record<string, {
    jlpt: number; itJapanese: number; core: number; framework: number; attitude: number
  }> = {}

  for (const u of users ?? []) {
    const js = japaneseSkills?.find(s => s.user_id === u.id)
    const cs = codingSkills?.find(s => s.user_id === u.id)
    const as_ = attitudeSkills?.find(s => s.user_id === u.id)

    // Check dispatch readiness first (most recent snapshot)
    const dr = readinessScores?.find(s => s.user_id === u.id)

    skillMap[u.id] = {
      jlpt: dr?.jlpt_score ?? js?.jlpt_normalized ?? 0,
      itJapanese: dr?.it_japanese_score ?? js?.it_japanese_normalized ?? 0,
      core: dr?.core_programming_score ?? cs?.core_normalized ?? 0,
      framework: dr?.framework_score ?? cs?.framework_normalized ?? 0,
      attitude: dr?.attitude_culture_score ?? as_?.attitude_normalized ?? 0,
    }
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900">리포트</h1>
      <p className="mt-1 text-gray-500">전 사원 5축 차트 및 피드백 관리</p>

      <AdminReportsClient
        users={users ?? []}
        skillMap={skillMap}
        feedbacks={feedbacks ?? []}
      />
    </div>
  )
}
