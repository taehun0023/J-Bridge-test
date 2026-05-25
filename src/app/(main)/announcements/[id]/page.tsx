import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import AnnouncementDetail from './AnnouncementDetail'

export default async function AnnouncementDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()

  const { data: announcement } = await supabase
    .from('announcements')
    .select('*, author:profiles!announcements_author_id_fkey(full_name)')
    .eq('id', id)
    .single()

  if (!announcement) redirect('/announcements')

  const { data: attachments } = await supabase
    .from('announcement_attachments')
    .select('*')
    .eq('announcement_id', id)
    .order('created_at')

  const { data: readRecord } = await supabase
    .from('announcement_reads')
    .select('read_at')
    .eq('announcement_id', id)
    .eq('user_id', user.id)
    .maybeSingle()

  const author = Array.isArray(announcement.author) ? announcement.author[0] : announcement.author

  return (
    <AnnouncementDetail
      announcement={{
        ...announcement,
        author_name: (author as { full_name: string | null } | null)?.full_name ?? '管理者',
      }}
      attachments={attachments ?? []}
      isRead={!!readRecord}
      isAdmin={profile?.role === 'admin'}
    />
  )
}
