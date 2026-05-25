import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import Card from '@/components/ui/Card'

export default async function AnnouncementsPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  const isAdmin = profile?.role === 'admin'

  const { data: announcements } = await supabase
    .from('announcements')
    .select('id, title, created_at, author:profiles!announcements_author_id_fkey(full_name)')
    .order('created_at', { ascending: false })

  const { data: reads } = await supabase
    .from('announcement_reads')
    .select('announcement_id')
    .eq('user_id', user.id)

  const readSet = new Set((reads ?? []).map(r => r.announcement_id))

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">お知らせ</h1>
          <p className="mt-1 text-sm text-zinc-500 dark:text-zinc-400">社内のお知らせ一覧</p>
        </div>
        {isAdmin && (
          <Link
            href="/admin/announcements/new"
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
          >
            + 新規作成
          </Link>
        )}
      </div>

      <div className="space-y-3">
        {(announcements ?? []).map(a => {
          const isRead = readSet.has(a.id)
          const author = Array.isArray(a.author) ? a.author[0] : a.author
          return (
            <Link key={a.id} href={`/announcements/${a.id}`}>
              <Card>
                <div className="flex items-start gap-3">
                  {!isRead && (
                    <span className="mt-1.5 h-2 w-2 shrink-0 rounded-full bg-red-500" />
                  )}
                  <div className="min-w-0 flex-1">
                    <h3 className={`text-sm font-medium ${isRead ? 'text-zinc-500 dark:text-zinc-400' : 'text-zinc-900 dark:text-zinc-100'}`}>
                      {a.title}
                    </h3>
                    <div className="mt-1 flex items-center gap-3 text-xs text-zinc-400">
                      <span>{(author as { full_name: string | null } | null)?.full_name ?? '管理者'}</span>
                      <span>{new Date(a.created_at).toLocaleDateString('ja-JP')}</span>
                    </div>
                  </div>
                </div>
              </Card>
            </Link>
          )
        })}
        {(announcements ?? []).length === 0 && (
          <div className="py-12 text-center text-sm text-zinc-500">お知らせはありません</div>
        )}
      </div>
    </div>
  )
}
