import { redirect } from 'next/navigation'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import MentorDashboardClient from '@/components/dashboard/MentorDashboardClient'

export default async function MentorPage() {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) redirect('/dashboard')

  return <MentorDashboardClient />
}
