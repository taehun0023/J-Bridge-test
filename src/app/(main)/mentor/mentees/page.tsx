import { redirect } from 'next/navigation'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { getMentorDashboardData } from '@/app/actions/mentor'
import MenteeListClient from './MenteeListClient'

export default async function MentorMenteesPage() {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) redirect('/dashboard')

  const result = await getMentorDashboardData()
  const mentees = result.mentees ?? []

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">メンティ管理</h1>
      </div>
      <MenteeListClient mentees={mentees} />
    </div>
  )
}
