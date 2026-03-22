import Link from 'next/link'
import { redirect } from 'next/navigation'
import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import AdminReportsClient from './AdminReportsClient'

interface Props {
  searchParams: Promise<{ mentee?: string }>
}

export default async function AdminReportsPage({ searchParams }: Props) {
  const params = await searchParams
  const supabase = await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const { data: myProfile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const myRole = myProfile?.role
  if (myRole !== 'admin' && myRole !== 'mentor') redirect('/dashboard')

  const serviceClient = createServiceRoleClient()
  let users: { id: string; full_name: string | null; email: string }[] = []

  if (myRole === 'mentor' && serviceClient) {
    const { data: menteeAssignments } = await serviceClient
      .from('mentor_mentee_assignments')
      .select('mentee:profiles!mentor_mentee_assignments_mentee_id_fkey(id, full_name, email)')
      .eq('mentor_id', user.id)

    users = (menteeAssignments ?? [])
      .map(a => a.mentee as unknown as { id: string; full_name: string | null; email: string })
      .filter(Boolean)
  } else {
    const { data } = await supabase
      .from('profiles')
      .select('id, full_name, email')
      .in('role', ['mentee', 'mentor'])
      .order('full_name')

    users = data ?? []
  }

  return (
    <div>
      <div className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">Admin Reports</h1>
          <p className="mt-1 text-gray-500 dark:text-gray-400">
            {myRole === 'mentor'
              ? 'Review reports for your assigned mentees.'
              : 'Review user-level reports and governance summaries.'}
          </p>
        </div>

        <Link
          href="/admin/reports/cs-governance"
          className="inline-flex items-center rounded-lg border border-gray-300 px-3 py-2 text-sm font-medium text-gray-700 transition hover:bg-gray-50 dark:border-gray-700 dark:text-gray-200 dark:hover:bg-gray-800"
        >
          CS Governance Report
        </Link>
      </div>

      <div className="mt-6">
        <AdminReportsClient
          users={users}
          userRole={myRole ?? 'admin'}
          initialUserId={params.mentee}
        />
      </div>
    </div>
  )
}
