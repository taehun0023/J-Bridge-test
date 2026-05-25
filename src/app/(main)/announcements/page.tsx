import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'

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

      <div className="rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03]">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200 dark:divide-white/[0.06]">
            <thead>
              <tr className="bg-white/[0.02] dark:bg-white/[0.02]">
                <th className="w-16 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:text-zinc-400">No.</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">タイトル</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">作成者</th>
                <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">作成日</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
              {(announcements ?? []).map((a, i) => {
                const isRead = readSet.has(a.id)
                const author = Array.isArray(a.author) ? a.author[0] : a.author
                return (
                  <tr key={a.id} className="hover:bg-gray-50 dark:hover:bg-white/[0.02] transition-colors">
                    <td className="whitespace-nowrap px-4 py-3 text-center text-sm text-zinc-500 dark:text-zinc-400">
                      {(announcements?.length ?? 0) - i}
                    </td>
                    <td className="px-4 py-3">
                      <Link href={`/announcements/${a.id}`} className="flex items-center gap-2">
                        {!isRead && (
                          <span className="inline-flex h-4 min-w-4 items-center justify-center rounded bg-red-500 text-[9px] font-bold text-white">
                            N
                          </span>
                        )}
                        <span className={`text-sm ${isRead ? 'text-zinc-500 dark:text-zinc-400' : 'font-medium text-zinc-900 dark:text-zinc-100'}`}>
                          {a.title}
                        </span>
                      </Link>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                      {(author as { full_name: string | null } | null)?.full_name ?? '管理者'}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                      {new Date(a.created_at).toLocaleDateString('ja-JP')}
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
        {(announcements ?? []).length === 0 && (
          <div className="py-12 text-center text-sm text-zinc-500">お知らせはありません</div>
        )}
      </div>
    </div>
  )
}
