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
  is_japanese: boolean
}

export default function ProfileForm({ profile }: { profile: Profile | null }) {
  const [fullName, setFullName] = useState(profile?.full_name ?? '')
  const [bio, setBio] = useState(profile?.bio ?? '')
  const [targetJlpt, setTargetJlpt] = useState(profile?.target_jlpt_level ?? '')
  const [targetCoding, setTargetCoding] = useState(profile?.target_coding_area ?? '')
  const [isJapanese, setIsJapanese] = useState(profile?.is_japanese ?? false)
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
        is_japanese: isJapanese,
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
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">名前</label>
          <input
            type="text"
            value={fullName}
            onChange={(e) => setFullName(e.target.value)}
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">自己紹介</label>
          <textarea
            value={bio}
            onChange={(e) => setBio(e.target.value)}
            rows={3}
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">日本人ですか？</label>
          <div className="mt-1 flex gap-3">
            {[
              { value: true, label: 'はい（日本語テスト省略）' },
              { value: false, label: 'いいえ（全テスト受験）' },
            ].map((opt) => (
              <label
                key={String(opt.value)}
                className={`flex-1 cursor-pointer rounded-xl border-2 px-3 py-2 text-center text-sm transition-colors ${
                  isJapanese === opt.value
                    ? 'border-indigo-500 bg-indigo-500/5 text-indigo-400 dark:bg-indigo-500/10 dark:text-indigo-400'
                    : 'border-gray-200 dark:border-white/[0.08] text-zinc-700 dark:text-zinc-300 hover:border-gray-300 dark:hover:border-white/[0.15]'
                }`}
              >
                <input
                  type="radio"
                  name="is_japanese"
                  checked={isJapanese === opt.value}
                  onChange={() => setIsJapanese(opt.value)}
                  className="sr-only"
                />
                {opt.label}
              </label>
            ))}
          </div>
        </div>

        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">目標JLPT</label>
            <select
              value={targetJlpt}
              onChange={(e) => setTargetJlpt(e.target.value)}
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
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
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">開発言語</label>
            <select
              value={targetCoding}
              onChange={(e) => setTargetCoding(e.target.value)}
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            >
              <option value="">選択</option>
              <option value="java">Java</option>
              <option value="javascript">JavaScript</option>
            </select>
          </div>
        </div>

        <div className="flex items-center gap-3">
          <button
            type="submit"
            disabled={saving}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            {saving ? '保存中...' : '保存'}
          </button>
          {saved && <span className="text-sm text-emerald-400">保存しました</span>}
        </div>
      </form>
    </Card>
  )
}
