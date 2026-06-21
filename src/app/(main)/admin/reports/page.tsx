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
      .eq('role', 'mentee')
      .order('full_name')

    users = data ?? []
  }

  return (
    <div>
      <div>
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">レポート</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">
          {myRole === 'mentor'
            ? '担当メンティーのレポートを確認できます。'
            : 'ユーザーごとの成績レポートを確認できます。'}
        </p>
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
