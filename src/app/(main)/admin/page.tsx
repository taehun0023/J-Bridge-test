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

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">システム管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">システム全体の統計と管理ツール</p>

      <div className="mt-6">
        <AdminDashboardClient />
      </div>
    </div>
  )
}
