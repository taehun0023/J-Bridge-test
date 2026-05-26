'use client'

import { useState, useTransition, useRef } from 'react'
import { useRouter } from 'next/navigation'
import { createAnnouncement } from '@/app/actions/announcements'
import Card from '@/components/ui/Card'
import { Paperclip, X } from 'lucide-react'

export default function AnnouncementForm() {
  const router = useRouter()
  const [pending, startTransition] = useTransition()
  const [error, setError] = useState<string | null>(null)
  const [files, setFiles] = useState<File[]>([])
  const fileInputRef = useRef<HTMLInputElement>(null)

  function handleFileChange(e: React.ChangeEvent<HTMLInputElement>) {
    const newFiles = Array.from(e.target.files ?? [])
    setFiles(prev => [...prev, ...newFiles].slice(0, 5))
    if (fileInputRef.current) fileInputRef.current.value = ''
  }

  function removeFile(index: number) {
    setFiles(prev => prev.filter((_, i) => i !== index))
  }

  function handleSubmit(formData: FormData) {
    for (const f of files) {
      formData.append('files', f)
    }
    startTransition(async () => {
      const result = await createAnnouncement(formData)
      if (result.error) {
        setError(result.error)
      } else if ('id' in result) {
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
              className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">本文 * (Markdown対応)</label>
            <textarea
              name="body"
              required
              rows={12}
              className="mt-1 w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
              添付ファイル (最大5個、各25MBまで)
            </label>
            <div className="mt-1">
              <button
                type="button"
                onClick={() => fileInputRef.current?.click()}
                disabled={files.length >= 5}
                className="inline-flex items-center gap-1.5 rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-700 hover:bg-gray-50 disabled:opacity-50 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-300 dark:hover:bg-white/[0.08] transition-colors"
              >
                <Paperclip className="h-4 w-4" />
                ファイルを追加
              </button>
              <input
                ref={fileInputRef}
                type="file"
                multiple
                onChange={handleFileChange}
                className="hidden"
              />
            </div>
            {files.length > 0 && (
              <div className="mt-2 space-y-1.5">
                {files.map((f, i) => (
                  <div key={i} className="flex items-center gap-2 rounded-lg border border-gray-200 px-3 py-2 dark:border-white/[0.08]">
                    <Paperclip className="h-3.5 w-3.5 shrink-0 text-zinc-400" />
                    <span className="min-w-0 flex-1 truncate text-sm text-zinc-700 dark:text-zinc-300">{f.name}</span>
                    <span className="shrink-0 text-xs text-zinc-400">{(f.size / 1024).toFixed(0)} KB</span>
                    <button type="button" onClick={() => removeFile(i)} className="shrink-0 text-zinc-400 hover:text-red-400">
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
            {pending ? '投稿中...' : '投稿する'}
          </button>
        </div>
      </form>
    </Card>
  )
}
