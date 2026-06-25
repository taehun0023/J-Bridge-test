'use client'

import { useState, useRef } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import { useRouter } from 'next/navigation'
import { updateAnnouncement, deleteAttachment } from '@/app/actions/announcements'
import Card from '@/components/ui/Card'
import { Paperclip, X } from 'lucide-react'

interface ExistingAttachment {
  id: string
  file_name: string
  file_size: number
  file_path: string
}

interface Props {
  announcement: { id: string; title: string; body: string }
  existingAttachments: ExistingAttachment[]
}

function formatBytes(bytes: number) {
  if (bytes < 1024) return `${bytes} B`
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`
}

export default function EditAnnouncementForm({ announcement, existingAttachments }: Props) {
  const router = useRouter()
  const [pending, startTransition] = useLoadingTransition()
  const [error, setError] = useState<string | null>(null)
  const [newFiles, setNewFiles] = useState<File[]>([])
  const [removedAttachments, setRemovedAttachments] = useState<Set<string>>(new Set())
  const fileInputRef = useRef<HTMLInputElement>(null)

  const visibleAttachments = existingAttachments.filter(a => !removedAttachments.has(a.id))

  function handleRemoveExisting(attachmentId: string) {
    setRemovedAttachments(prev => new Set(prev).add(attachmentId))
  }

  function handleFileChange(e: React.ChangeEvent<HTMLInputElement>) {
    const added = Array.from(e.target.files ?? [])
    setNewFiles(prev => [...prev, ...added].slice(0, 5))
    if (fileInputRef.current) fileInputRef.current.value = ''
  }

  function handleSubmit(formData: FormData) {
    for (const f of newFiles) {
      formData.append('new_files', f)
    }
    startTransition(async () => {
      for (const id of removedAttachments) {
        await deleteAttachment(id)
      }
      const result = await updateAnnouncement(announcement.id, formData)
      if (result.error) {
        setError(result.error)
      } else {
        router.push('/announcements')
      }
    })
  }

  return (
    <Card>
      <form action={handleSubmit}>
        {error && (
          <div className="mb-4 rounded-lg bg-red-500/10 px-4 py-3 text-sm text-red-400 ring-1 ring-red-500/20">
            {error}
          </div>
        )}
        <div className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">タイトル *</label>
            <input
              name="title"
              required
              defaultValue={announcement.title}
              className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">本文 * (Markdown対応)</label>
            <textarea
              name="body"
              required
              rows={12}
              defaultValue={announcement.body}
              className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>

          {visibleAttachments.length > 0 && (
            <div>
              <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">既存の添付ファイル</label>
              <div className="mt-1 space-y-1.5">
                {visibleAttachments.map(a => (
                  <div key={a.id} className="flex items-center gap-2 rounded-lg border border-gray-200 px-3 py-2 dark:border-white/[0.08]">
                    <Paperclip className="h-3.5 w-3.5 shrink-0 text-zinc-400" />
                    <span className="min-w-0 flex-1 truncate text-sm text-zinc-700 dark:text-zinc-300">{a.file_name}</span>
                    <span className="shrink-0 text-xs text-zinc-400">{formatBytes(a.file_size)}</span>
                    <button type="button" onClick={() => handleRemoveExisting(a.id)} className="shrink-0 text-zinc-400 hover:text-red-400">
                      <X className="h-3.5 w-3.5" />
                    </button>
                  </div>
                ))}
              </div>
            </div>
          )}

          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
              新規添付ファイル (最大5個、各25MBまで)
            </label>
            <div className="mt-1">
              <button
                type="button"
                onClick={() => fileInputRef.current?.click()}
                disabled={newFiles.length >= 5}
                className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-700 hover:bg-gray-50 disabled:opacity-50 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-300 dark:hover:bg-white/[0.08] transition-colors"
              >
                <Paperclip className="h-4 w-4" />
                ファイルを追加
              </button>
              <input ref={fileInputRef} type="file" multiple onChange={handleFileChange} className="hidden" />
            </div>
            {newFiles.length > 0 && (
              <div className="mt-2 space-y-1.5">
                {newFiles.map((f, i) => (
                  <div key={i} className="flex items-center gap-2 rounded-lg border border-gray-200 px-3 py-2 dark:border-white/[0.08]">
                    <Paperclip className="h-3.5 w-3.5 shrink-0 text-zinc-400" />
                    <span className="min-w-0 flex-1 truncate text-sm text-zinc-700 dark:text-zinc-300">{f.name}</span>
                    <span className="shrink-0 text-xs text-zinc-400">{(f.size / 1024).toFixed(0)} KB</span>
                    <button type="button" onClick={() => setNewFiles(prev => prev.filter((_, j) => j !== i))} className="shrink-0 text-zinc-400 hover:text-red-400">
                      <X className="h-3.5 w-3.5" />
                    </button>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
        <div className="mt-6 flex justify-end gap-3">
          <button
            type="button"
            onClick={() => router.back()}
            className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5 transition-colors"
          >
            キャンセル
          </button>
          <button
            type="submit"
            disabled={pending}
            className="rounded-xl bg-indigo-600 px-6 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            {pending ? '保存中...' : '保存する'}
          </button>
        </div>
      </form>
    </Card>
  )
}
