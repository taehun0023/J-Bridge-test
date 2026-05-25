import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import EditAnnouncementForm from './EditAnnouncementForm'

export default async function EditAnnouncementPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  if (profile?.role !== 'admin') redirect('/dashboard')

  const [{ data: announcement }, { data: attachments }] = await Promise.all([
    supabase.from('announcements').select('id, title, body').eq('id', id).single(),
    supabase.from('announcement_attachments').select('id, file_name, file_size, file_path').eq('announcement_id', id).order('created_at'),
  ])

  if (!announcement) redirect('/announcements')

  return (
    <div className="mx-auto max-w-3xl">
      <h1 className="mb-6 text-2xl font-bold text-gray-900 dark:text-white">お知らせ編集</h1>
      <EditAnnouncementForm announcement={announcement} existingAttachments={attachments ?? []} />
    </div>
  )
}
