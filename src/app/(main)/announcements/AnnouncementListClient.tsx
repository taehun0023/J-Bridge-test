'use client'

import Link from 'next/link'
import { Paperclip } from 'lucide-react'
import { getAttachmentUrl } from '@/app/actions/announcements'

interface AttachmentInfo {
  id: string
  file_name: string
  file_path: string
  file_size: number
}

interface Row {
  id: string
  rowNum: number
  title: string
  authorName: string
  createdAt: string
  isRead: boolean
  attachments: AttachmentInfo[]
}

export default function AnnouncementListClient({ rows }: { rows: Row[] }) {
  async function handleDownload(att: AttachmentInfo) {
    const url = await getAttachmentUrl(att.file_path, att.file_name)
    if (url) window.open(url, '_blank')
  }

  return (
    <div className="rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03]">
      <div className="overflow-x-auto">
        <table className="min-w-full divide-y divide-gray-200 dark:divide-white/[0.06]">
          <thead>
            <tr className="bg-white/[0.02] dark:bg-white/[0.02]">
              <th className="w-16 px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:text-zinc-400">No.</th>
              <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">タイトル</th>
              <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">作成者</th>
              <th className="px-4 py-3 text-left text-xs font-medium text-zinc-500 dark:text-zinc-400">作成日</th>
              <th className="px-4 py-3 text-center text-xs font-medium text-zinc-500 dark:text-zinc-400">添付</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-100 dark:divide-white/[0.06]">
            {rows.map(a => (
              <tr key={a.id} className="hover:bg-gray-50 dark:hover:bg-white/[0.02] transition-colors">
                <td className="whitespace-nowrap px-4 py-3 text-center text-sm text-zinc-500 dark:text-zinc-400">
                  {a.rowNum}
                </td>
                <td className="px-4 py-3">
                  <Link href={`/announcements/${a.id}`} className="flex items-center gap-2">
                    {!a.isRead && (
                      <span className="inline-flex h-4 min-w-4 items-center justify-center rounded bg-red-500 text-[9px] font-bold text-white">
                        N
                      </span>
                    )}
                    <span className={`text-sm ${a.isRead ? 'text-zinc-500 dark:text-zinc-400' : 'font-medium text-zinc-900 dark:text-zinc-100'}`}>
                      {a.title}
                    </span>
                  </Link>
                </td>
                <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                  {a.authorName}
                </td>
                <td className="whitespace-nowrap px-4 py-3 text-sm text-zinc-500 dark:text-zinc-400">
                  {new Date(a.createdAt).toLocaleDateString('ja-JP')}
                </td>
                <td className="whitespace-nowrap px-4 py-3 text-center">
                  {a.attachments.length > 0 ? (
                    <div className="flex items-center justify-center gap-1">
                      {a.attachments.map(att => (
                        <button
                          key={att.id}
                          onClick={() => handleDownload(att)}
                          title={att.file_name}
                          className="rounded p-1 text-indigo-500 hover:bg-indigo-500/10 transition-colors"
                        >
                          <Paperclip className="h-4 w-4" />
                        </button>
                      ))}
                    </div>
                  ) : (
                    <span className="text-xs text-zinc-400">—</span>
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      {rows.length === 0 && (
        <div className="py-12 text-center text-sm text-zinc-500">お知らせはありません</div>
      )}
    </div>
  )
}
