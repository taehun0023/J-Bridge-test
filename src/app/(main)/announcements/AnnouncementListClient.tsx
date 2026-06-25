'use client'

import { useState } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { Paperclip } from 'lucide-react'
import { getAttachmentUrl, deleteAnnouncement } from '@/app/actions/announcements'

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

export default function AnnouncementListClient({ rows, isAdmin = false }: { rows: Row[]; isAdmin?: boolean }) {
  const router = useRouter()
  const [selected, setSelected] = useState<Set<string>>(new Set())
  const [pending, startTransition] = useLoadingTransition()

  const allSelected = rows.length > 0 && selected.size === rows.length

  function toggleAll() {
    setSelected(allSelected ? new Set() : new Set(rows.map(r => r.id)))
  }

  function toggleOne(id: string) {
    setSelected(prev => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })
  }

  function handleBulkDelete() {
    if (selected.size === 0) return
    if (!confirm(`${selected.size}件のお知らせを削除しますか？`)) return
    startTransition(async () => {
      for (const id of selected) {
        await deleteAnnouncement(id)
      }
      setSelected(new Set())
      router.refresh()
    })
  }

  async function handleDownload(att: AttachmentInfo) {
    const url = await getAttachmentUrl(att.file_path, att.file_name)
    if (url) window.open(url, '_blank')
  }

  return (
    <div>
      {isAdmin && selected.size > 0 && (
        <div className="mb-3 flex items-center gap-3">
          <span className="text-sm text-zinc-500 dark:text-zinc-400">{selected.size}件選択中</span>
          <button
            onClick={handleBulkDelete}
            disabled={pending}
            className="rounded-lg bg-red-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-red-500 disabled:opacity-50 transition-colors"
          >
            {pending ? '削除中...' : '選択した項目を削除'}
          </button>
        </div>
      )}
      <div className="rounded-2xl border border-gray-200/60 bg-white/80 backdrop-blur-md dark:border-white/[0.08] dark:bg-white/[0.03]">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200 dark:divide-white/[0.06]">
            <thead>
              <tr className="bg-white/[0.02] dark:bg-white/[0.02]">
                {isAdmin && (
                  <th className="w-10 px-4 py-3">
                    <input
                      type="checkbox"
                      checked={allSelected}
                      onChange={toggleAll}
                      className="h-3.5 w-3.5 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500 cursor-pointer"
                    />
                  </th>
                )}
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
                  {isAdmin && (
                    <td className="whitespace-nowrap px-4 py-3">
                      <input
                        type="checkbox"
                        checked={selected.has(a.id)}
                        onChange={() => toggleOne(a.id)}
                        className="h-3.5 w-3.5 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500 cursor-pointer"
                      />
                    </td>
                  )}
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
                            className="cursor-pointer rounded p-1 text-indigo-500 hover:bg-indigo-500/10 transition-colors"
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
    </div>
  )
}
