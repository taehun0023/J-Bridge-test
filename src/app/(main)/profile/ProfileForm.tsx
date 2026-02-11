'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import Card from '@/components/ui/Card'

interface Profile {
  id: string
  full_name: string | null
  bio: string | null
  target_jlpt_level: string | null
  target_coding_area: string | null
}

export default function ProfileForm({ profile }: { profile: Profile | null }) {
  const [fullName, setFullName] = useState(profile?.full_name ?? '')
  const [bio, setBio] = useState(profile?.bio ?? '')
  const [targetJlpt, setTargetJlpt] = useState(profile?.target_jlpt_level ?? '')
  const [targetCoding, setTargetCoding] = useState(profile?.target_coding_area ?? '')
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)

  async function handleSave(e: React.FormEvent) {
    e.preventDefault()
    setSaving(true)
    setSaved(false)

    const supabase = createClient()
    await supabase
      .from('profiles')
      .update({
        full_name: fullName || null,
        bio: bio || null,
        target_jlpt_level: targetJlpt || null,
        target_coding_area: targetCoding || null,
        updated_at: new Date().toISOString(),
      })
      .eq('id', profile?.id ?? '')

    setSaving(false)
    setSaved(true)
    setTimeout(() => setSaved(false), 2000)
  }

  return (
    <Card title="個人情報">
      <form onSubmit={handleSave} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">名前</label>
          <input
            type="text"
            value={fullName}
            onChange={(e) => setFullName(e.target.value)}
            className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 bg-white dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">自己紹介</label>
          <textarea
            value={bio}
            onChange={(e) => setBio(e.target.value)}
            rows={3}
            className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 bg-white dark:border-gray-600 dark:bg-gray-700 dark:text-white focus:border-blue-500 focus:outline-none"
          />
        </div>

        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">目標JLPT</label>
            <select
              value={targetJlpt}
              onChange={(e) => setTargetJlpt(e.target.value)}
              className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 bg-white dark:border-gray-600 dark:bg-gray-700 dark:text-white"
            >
              <option value="">選択</option>
              <option value="N5">N5</option>
              <option value="N4">N4</option>
              <option value="N3">N3</option>
              <option value="N2">N2</option>
              <option value="N1">N1</option>
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 dark:text-gray-300">コーディング分野</label>
            <select
              value={targetCoding}
              onChange={(e) => setTargetCoding(e.target.value)}
              className="mt-1 w-full rounded-lg border border-gray-300 px-3 py-2 text-sm text-gray-900 bg-white dark:border-gray-600 dark:bg-gray-700 dark:text-white"
            >
              <option value="">選択</option>
              <option value="java">Java</option>
              <option value="javascript">JavaScript</option>
              <option value="sql">SQL</option>
            </select>
          </div>
        </div>

        <div className="flex items-center gap-3">
          <button
            type="submit"
            disabled={saving}
            className="rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600 disabled:opacity-50"
          >
            {saving ? '保存中...' : '保存'}
          </button>
          {saved && <span className="text-sm text-green-600 dark:text-green-400">保存しました</span>}
        </div>
      </form>
    </Card>
  )
}
