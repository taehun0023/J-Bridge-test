import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import AnnouncementListClient from './AnnouncementListClient'

const PAGE_SIZE = 10

export default async function AnnouncementsPage({ searchParams }: { searchParams: Promise<{ page?: string }> }) {
  const params = await searchParams
  const currentPage = Math.max(1, parseInt(params.page ?? '1', 10) || 1)

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login')

  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  const isAdmin = profile?.role === 'admin'

  const { count: totalCount } = await supabase
    .from('announcements')
    .select('id', { count: 'exact', head: true })

  const total = totalCount ?? 0
  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE))
  const from = (currentPage - 1) * PAGE_SIZE
  const to = from + PAGE_SIZE - 1

  const { data: announcements } = await supabase
    .from('announcements')
    .select('id, title, created_at, author:profiles!announcements_author_id_fkey(full_name)')
    .order('created_at', { ascending: false })
    .range(from, to)

  const announcementIds = (announcements ?? []).map(a => a.id)

  const [{ data: reads }, { data: attachments }] = await Promise.all([
    supabase.from('announcement_reads').select('announcement_id').eq('user_id', user.id),
    announcementIds.length > 0
      ? supabase.from('announcement_attachments').select('announcement_id, id, file_name, file_path, file_size').in('announcement_id', announcementIds)
      : Promise.resolve({ data: [] }),
  ])

  const readSet = new Set((reads ?? []).map(r => r.announcement_id))
  const attachmentMap = new Map<string, { id: string; file_name: string; file_path: string; file_size: number }[]>()
  for (const att of attachments ?? []) {
    const list = attachmentMap.get(att.announcement_id) ?? []
    list.push({ id: att.id, file_name: att.file_name, file_path: att.file_path, file_size: att.file_size })
    attachmentMap.set(att.announcement_id, list)
  }

  const rows = (announcements ?? []).map((a, i) => {
    const author = Array.isArray(a.author) ? a.author[0] : a.author
    return {
      id: a.id,
      rowNum: total - from - i,
      title: a.title,
      authorName: (author as { full_name: string | null } | null)?.full_name ?? '管理者',
      createdAt: a.created_at,
      isRead: readSet.has(a.id),
      attachments: attachmentMap.get(a.id) ?? [],
    }
  })

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

      <AnnouncementListClient rows={rows} isAdmin={isAdmin} />

      {totalPages > 1 && (
        <div className="mt-4 flex items-center justify-center gap-2">
          {currentPage > 1 && (
            <Link
              href={`/announcements?page=${currentPage - 1}`}
              className="rounded-lg border border-gray-200 px-3 py-1.5 text-sm text-zinc-700 hover:bg-gray-50 dark:border-white/[0.08] dark:text-zinc-300 dark:hover:bg-white/[0.03]"
            >
              前へ
            </Link>
          )}
          {Array.from({ length: totalPages }, (_, i) => i + 1).map(p => (
            <Link
              key={p}
              href={`/announcements?page=${p}`}
              className={`rounded-lg px-3 py-1.5 text-sm font-medium ${
                p === currentPage
                  ? 'bg-indigo-600 text-white'
                  : 'border border-gray-200 text-zinc-700 hover:bg-gray-50 dark:border-white/[0.08] dark:text-zinc-300 dark:hover:bg-white/[0.03]'
              }`}
            >
              {p}
            </Link>
          ))}
          {currentPage < totalPages && (
            <Link
              href={`/announcements?page=${currentPage + 1}`}
              className="rounded-lg border border-gray-200 px-3 py-1.5 text-sm text-zinc-700 hover:bg-gray-50 dark:border-white/[0.08] dark:text-zinc-300 dark:hover:bg-white/[0.03]"
            >
              次へ
            </Link>
          )}
        </div>
      )}
    </div>
  )
}
