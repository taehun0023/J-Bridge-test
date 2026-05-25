'use client'

import { useState, useTransition } from 'react'
import { useRouter } from 'next/navigation'
import { updateAnnouncement } from '@/app/actions/announcements'
import Card from '@/components/ui/Card'

interface Props {
  announcement: { id: string; title: string; body: string }
}

export default function EditAnnouncementForm({ announcement }: Props) {
  const router = useRouter()
  const [pending, startTransition] = useTransition()
  const [error, setError] = useState<string | null>(null)

  function handleSubmit(formData: FormData) {
    startTransition(async () => {
      const result = await updateAnnouncement(announcement.id, formData)
      if (result.error) {
        setError(result.error)
      } else {
        router.push(`/announcements/${announcement.id}`)
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
