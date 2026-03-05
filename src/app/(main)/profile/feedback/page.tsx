import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import FeedbackClient from './FeedbackClient'

interface FeedbackItem {
  id: string
  category: string
  content: string
  created_at: string
  admin: { id: string; full_name: string | null } | null
  user: { id: string; full_name: string | null } | null
  feedback_replies: {
    id: string
    user_id: string
    content: string
    created_at: string
    updated_at: string
    user: { full_name: string | null } | null
  }[]
}

export default async function FeedbackPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const role = profile?.role ?? 'mentee'

  // Auto-delete feedbacks older than 1 month
  const oneMonthAgo = new Date()
  oneMonthAgo.setMonth(oneMonthAgo.getMonth() - 1)
  const cleanupClient = createServiceRoleClient()
  if (cleanupClient) {
    await cleanupClient.from('admin_feedbacks').delete().lt('created_at', oneMonthAgo.toISOString())
  }

  const feedbackSelect = `
    id, category, content, created_at,
    admin:profiles!admin_feedbacks_admin_id_fkey(id, full_name),
    user:profiles!admin_feedbacks_user_id_fkey(id, full_name),
    feedback_replies(id, user_id, content, created_at, updated_at, user:profiles!feedback_replies_user_id_fkey(full_name))
  `

  // Fetch target users for feedback creation (admin/mentor only)
  let feedbackTargetUsers: { id: string; full_name: string | null; email: string }[] = []
  if (role === 'admin') {
    const { data: targets } = await supabase
      .from('profiles')
      .select('id, full_name, email')
      .in('role', ['mentee', 'mentor'])
      .order('full_name')
    feedbackTargetUsers = (targets ?? []).map(p => ({ id: p.id, full_name: p.full_name ?? null, email: p.email ?? '' }))
  } else if (role === 'mentor' && cleanupClient) {
    const { data: assignments } = await cleanupClient
      .from('mentor_mentee_assignments')
      .select('mentee:profiles!mentor_mentee_assignments_mentee_id_fkey(id, full_name, email)')
      .eq('mentor_id', user.id)
    feedbackTargetUsers = (assignments ?? [])
      .map(a => a.mentee as unknown as { id: string; full_name: string | null; email: string })
      .filter(Boolean)
  }

  let feedbacks
  if (role === 'mentee') {
    // Mentee: only received feedbacks
    const { data } = await supabase
      .from('admin_feedbacks')
      .select(feedbackSelect)
      .eq('user_id', user.id)
      .order('created_at', { ascending: false })
    feedbacks = data
  } else if (role === 'mentor') {
    // Mentor: own sent/received + mentees' feedbacks
    // Use serviceClient to bypass RLS/schema cache issues (same pattern as tasks page)
    let menteeIds: string[] = []
    if (cleanupClient) {
      const { data: assignments } = await cleanupClient
        .from('mentor_mentee_assignments')
        .select('mentee_id')
        .eq('mentor_id', user.id)
      menteeIds = (assignments ?? []).map(a => a.mentee_id)
    }

    const filterParts = [`admin_id.eq.${user.id}`, `user_id.eq.${user.id}`]
    if (menteeIds.length > 0) {
      filterParts.push(`user_id.in.(${menteeIds.join(',')})`)
    }

    const { data } = await supabase
      .from('admin_feedbacks')
      .select(feedbackSelect)
      .or(filterParts.join(','))
      .order('created_at', { ascending: false })
    feedbacks = data
  } else {
    // Admin: all feedbacks
    const { data } = await supabase
      .from('admin_feedbacks')
      .select(feedbackSelect)
      .order('created_at', { ascending: false })
    feedbacks = data
  }

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">フィードバック</h1>
        <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">フィードバック一覧</p>
      </div>
      <FeedbackClient
        feedbacks={(feedbacks ?? []).map(f => ({
          ...f,
          admin: Array.isArray(f.admin) ? f.admin[0] ?? null : f.admin,
          user: Array.isArray(f.user) ? f.user[0] ?? null : f.user,
          feedback_replies: (f.feedback_replies ?? []).map((r: Record<string, unknown>) => ({
            ...r,
            user: Array.isArray(r.user) ? (r.user as unknown[])[0] ?? null : r.user,
          })),
        })) as FeedbackItem[]}
        currentUserId={user.id}
        userRole={role}
        feedbackTargetUsers={feedbackTargetUsers}
      />
    </div>
  )
}
