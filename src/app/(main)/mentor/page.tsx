import { redirect } from 'next/navigation'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { getMentorDashboardData } from '@/app/actions/mentor'
import MentorDashboardClient from '@/components/dashboard/MentorDashboardClient'

export default async function MentorPage() {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) redirect('/dashboard')

  const { supabase } = auth

  const { data: profile } = await supabase
    .from('profiles')
    .select('mentor_specialty')
    .eq('id', auth.user.id)
    .single()

  const result = await getMentorDashboardData()
  const mentees = result.mentees ?? []

  return (
    <MentorDashboardClient
      mentees={mentees}
      mentorSpecialty={profile?.mentor_specialty ?? null}
    />
  )
}
