import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import AdminDashboardClient from './AdminDashboardClient'

export default async function AdminDashboardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: currentProfile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (currentProfile?.role !== 'admin') redirect('/dashboard')

  // --- Admin: full stats ---
  const fourWeeksAgo = new Date()
  fourWeeksAgo.setDate(fourWeeksAgo.getDate() - 28)
  const fourWeeksAgoISO = fourWeeksAgo.toISOString()

  const [
    profilesRes,
    examCyclesRes,
    quizAttemptsRes,
    codeSubmissionsRes,
    learningAssignmentsRes,
    auditLogRes,
    mentorMenteeRes,
    coursesRes,
    questionsRes,
    glossaryRes,
    notificationsRes,
  ] = await Promise.all([
    supabase.from('profiles').select('id, role, is_japanese, created_at'),
    supabase.from('exam_cycles').select('id, status, deadline_at, completed_at'),
    supabase
      .from('quiz_attempts')
      .select('id, completed_at')
      .not('completed_at', 'is', null)
      .gte('completed_at', fourWeeksAgoISO),
    supabase
      .from('code_submissions')
      .select('id, created_at')
      .gte('created_at', fourWeeksAgoISO),
    supabase.from('learning_assignments').select('id, status'),
    supabase
      .from('audit_log')
      .select('id, action, resource_type, created_at, actor_id, profiles!audit_log_actor_id_fkey(full_name, email)')
      .order('created_at', { ascending: false })
      .limit(10),
    supabase
      .from('mentor_mentee_assignments')
      .select('mentor_id, profiles!mentor_mentee_assignments_mentor_id_fkey(full_name)'),
    supabase.from('courses').select('id, is_published'),
    supabase.from('quiz_questions').select('id', { count: 'exact', head: true }),
    supabase.from('it_glossary').select('id', { count: 'exact', head: true }),
    supabase.from('notifications').select('id', { count: 'exact', head: true }).eq('is_read', false),
  ])

  const profiles = profilesRes.data ?? []
  const examCycles = examCyclesRes.data ?? []
  const quizAttempts = quizAttemptsRes.data ?? []
  const codeSubmissions = codeSubmissionsRes.data ?? []
  const learningAssignments = learningAssignmentsRes.data ?? []
  const auditLogData = auditLogRes.data ?? []
  const mentorMenteeData = mentorMenteeRes.data ?? []
  const courses = coursesRes.data ?? []

  // --- Server-side aggregation ---
  const now = new Date()
  const sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)
  const userStats = {
    total: profiles.length,
    admin: profiles.filter(p => p.role === 'admin').length,
    mentor: profiles.filter(p => p.role === 'mentor').length,
    mentee: profiles.filter(p => p.role === 'mentee').length,
    japanese: profiles.filter(p => p.is_japanese === true).length,
    korean: profiles.filter(p => p.is_japanese === false).length,
    recentSignups: profiles.filter(p => new Date(p.created_at) >= sevenDaysAgo).length,
  }

  const examHealth = {
    active: examCycles.filter(e => e.status === 'active').length,
    pending: examCycles.filter(e => e.status === 'pending').length,
    completed: examCycles.filter(e => e.status === 'completed').length,
    overdue: examCycles.filter(e =>
      e.status !== 'completed' && e.deadline_at && new Date(e.deadline_at) < now
    ).length,
    total: examCycles.length,
  }

  const weeklyActivity: { week: string; quizAttempts: number; codeSubmissions: number }[] = []
  for (let i = 3; i >= 0; i--) {
    const weekStart = new Date(now)
    weekStart.setDate(weekStart.getDate() - (i + 1) * 7)
    const weekEnd = new Date(now)
    weekEnd.setDate(weekEnd.getDate() - i * 7)

    const startMonth = weekStart.getMonth() + 1
    const startDay = weekStart.getDate()
    const endMonth = weekEnd.getMonth() + 1
    const endDay = weekEnd.getDate()
    const label = `${startMonth}/${startDay}~${endMonth}/${endDay}`

    const quizCount = quizAttempts.filter(q => {
      const d = new Date(q.completed_at!)
      return d >= weekStart && d < weekEnd
    }).length

    const codeCount = codeSubmissions.filter(c => {
      const d = new Date(c.created_at)
      return d >= weekStart && d < weekEnd
    }).length

    weeklyActivity.push({ week: label, quizAttempts: quizCount, codeSubmissions: codeCount })
  }

  const contentMetrics = {
    coursesTotal: courses.length,
    coursesPublished: courses.filter(c => c.is_published).length,
    questions: questionsRes.count ?? 0,
    glossary: glossaryRes.count ?? 0,
  }

  const taskOverview = {
    pending: learningAssignments.filter(t => t.status === 'pending').length,
    inProgress: learningAssignments.filter(t => t.status === 'in_progress').length,
    completed: learningAssignments.filter(t => t.status === 'completed').length,
    overdue: learningAssignments.filter(t => t.status === 'overdue').length,
  }

  const mentorMap = new Map<string, { name: string; count: number }>()
  for (const row of mentorMenteeData) {
    const profile = row.profiles as unknown as { full_name: string | null } | null
    const name = profile?.full_name ?? row.mentor_id
    const existing = mentorMap.get(row.mentor_id)
    if (existing) {
      existing.count++
    } else {
      mentorMap.set(row.mentor_id, { name, count: 1 })
    }
  }
  const mentorWorkload = [...mentorMap.values()]
    .map(m => ({ mentorName: m.name, menteeCount: m.count }))
    .sort((a, b) => b.menteeCount - a.menteeCount)

  const recentAuditLog = auditLogData.map(entry => {
    const profile = entry.profiles as unknown as { full_name: string | null; email: string } | null
    return {
      id: entry.id,
      action: entry.action,
      resource_type: entry.resource_type,
      created_at: entry.created_at,
      actorName: profile?.full_name ?? profile?.email ?? entry.actor_id,
      actorFullName: profile?.full_name ?? null,
    }
  })

  const unreadNotifications = notificationsRes.count ?? 0

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">システム管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">システム全体の統計と管理ツール</p>

      <div className="mt-6">
        <AdminDashboardClient
          userStats={userStats}
          examHealth={examHealth}
          weeklyActivity={weeklyActivity}
          contentMetrics={contentMetrics}
          taskOverview={taskOverview}
          mentorWorkload={mentorWorkload}
          recentAuditLog={recentAuditLog}
          unreadNotifications={unreadNotifications}
        />
      </div>
    </div>
  )
}
