import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import AnnouncementForm from './AnnouncementForm'

export default async function NewAnnouncementPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  if (profile?.role !== 'admin') redirect('/dashboard')

  return (
    <div className="mx-auto max-w-3xl">
      <h1 className="mb-6 text-2xl font-bold text-gray-900 dark:text-white">お知らせ作成</h1>
      <AnnouncementForm />
    </div>
  )
}
