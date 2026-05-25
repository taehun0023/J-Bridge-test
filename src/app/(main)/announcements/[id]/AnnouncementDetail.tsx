'use client'

import { useEffect, useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import ReactMarkdown from 'react-markdown'
import Card from '@/components/ui/Card'
import { markAnnouncementRead, deleteAnnouncement, getAttachmentUrl } from '@/app/actions/announcements'
import { ArrowLeft, Paperclip, Trash2, Download, Pencil } from 'lucide-react'

interface Attachment {
  id: string
  file_path: string
  file_name: string
  file_size: number
  mime_type: string | null
}

interface Props {
  announcement: {
    id: string
    title: string
    body: string
    author_name: string
    created_at: string
    updated_at: string
  }
  attachments: Attachment[]
  isRead: boolean
  isAdmin: boolean
}

function formatBytes(bytes: number) {
  if (bytes < 1024) return `${bytes} B`
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`
}

export default function AnnouncementDetail({ announcement, attachments, isRead, isAdmin }: Props) {
  const router = useRouter()
  const [pending, startTransition] = useTransition()

  useEffect(() => {
    if (!isRead) {
      markAnnouncementRead(announcement.id)
    }
  }, [announcement.id, isRead])

  function handleDelete() {
    if (!confirm('このお知らせを削除しますか？添付ファイルも削除されます。')) return
    startTransition(async () => {
      const result = await deleteAnnouncement(announcement.id)
      if (result.error) alert(result.error)
      else router.push('/announcements')
    })
  }

  async function handleDownload(attachment: Attachment) {
    const url = await getAttachmentUrl(attachment.file_path)
    if (url) window.open(url, '_blank')
  }

  return (
    <div className="mx-auto max-w-3xl">
      <Link href="/announcements" className="mb-4 inline-flex items-center gap-1.5 text-sm text-indigo-500 hover:text-indigo-400">
        <ArrowLeft className="h-4 w-4" />
        お知らせ一覧
      </Link>

      <Card>
        <div className="flex items-start justify-between gap-3">
          <div>
            <h1 className="text-xl font-bold text-zinc-900 dark:text-zinc-100">{announcement.title}</h1>
            <div className="mt-2 flex items-center gap-3 text-xs text-zinc-400">
              <span>{announcement.author_name}</span>
              <span>{new Date(announcement.created_at).toLocaleDateString('ja-JP')}</span>
            </div>
          </div>
          {isAdmin && (
            <div className="flex items-center gap-1">
              <Link
                href={`/admin/announcements/${announcement.id}/edit`}
                className="shrink-0 rounded-lg p-2 text-zinc-400 hover:bg-indigo-500/10 hover:text-indigo-400 transition-colors"
                title="編集"
              >
                <Pencil className="h-4 w-4" />
              </Link>
              <button
                onClick={handleDelete}
                disabled={pending}
                className="shrink-0 rounded-lg p-2 text-zinc-400 hover:bg-red-500/10 hover:text-red-400 disabled:opacity-50 transition-colors"
                title="削除"
              >
                <Trash2 className="h-4 w-4" />
              </button>
            </div>
          )}
        </div>

        <div className="mt-6 prose prose-sm prose-zinc dark:prose-invert max-w-none">
          <ReactMarkdown>{announcement.body}</ReactMarkdown>
        </div>

        {attachments.length > 0 && (
          <div className="mt-6 border-t border-gray-200 pt-4 dark:border-white/[0.08]">
            <h3 className="mb-3 flex items-center gap-1.5 text-sm font-medium text-zinc-700 dark:text-zinc-300">
              <Paperclip className="h-4 w-4" />
              添付ファイル ({attachments.length})
            </h3>
            <div className="space-y-2">
              {attachments.map(a => (
                <button
                  key={a.id}
                  onClick={() => handleDownload(a)}
                  className="flex w-full items-center gap-3 rounded-lg border border-gray-200 px-3 py-2.5 text-left hover:bg-gray-50 dark:border-white/[0.08] dark:hover:bg-white/[0.03] transition-colors"
                >
                  <Download className="h-4 w-4 shrink-0 text-indigo-500" />
                  <span className="min-w-0 flex-1 truncate text-sm text-zinc-900 dark:text-zinc-100">{a.file_name}</span>
                  <span className="shrink-0 text-xs text-zinc-400">{formatBytes(a.file_size)}</span>
                </button>
              ))}
            </div>
          </div>
        )}
      </Card>
    </div>
  )
}
