import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import AdminMentorsClient from './AdminMentorsClient'

export default async function AdminMentorsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') redirect('/dashboard')

  // Fetch mentors (admin has full SELECT access via RLS)
  const { data: mentors } = await supabase
    .from('profiles')
    .select('id, full_name, email')
    .eq('role', 'mentor')
    .order('full_name')

  // Fetch all assignments (admin has full access via RLS)
  const { data: assignments } = await supabase
    .from('mentor_mentee_assignments')
    .select('id, mentor_id, mentee_id, mentee:profiles!mentor_mentee_assignments_mentee_id_fkey(id, full_name, email, coding_rank, jlpt_level)')

  // Fetch ALL mentees (for dropdown — can be assigned to multiple mentors)
  const { data: allMentees } = await supabase
    .from('profiles')
    .select('id, full_name, email')
    .eq('role', 'mentee')
    .order('full_name')

  // Group assignments by mentor (unwrap FK join arrays to single objects)
  const assignmentList = (assignments ?? []).map(a => ({
    ...a,
    mentee: Array.isArray(a.mentee) ? a.mentee[0] ?? null : a.mentee,
  }))
  const mentorAssignments: Record<string, typeof assignmentList> = {}
  for (const a of assignmentList) {
    if (!mentorAssignments[a.mentor_id]) mentorAssignments[a.mentor_id] = []
    mentorAssignments[a.mentor_id]!.push(a)
  }

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">メンター管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">メンターとメンティーの紐付けを管理します</p>

      <AdminMentorsClient
        mentors={mentors ?? []}
        mentorAssignments={mentorAssignments}
        allMentees={allMentees ?? []}
      />
    </div>
  )
}
