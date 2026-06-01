'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import Card from '@/components/ui/Card'
import type { JlptLevel } from '@/lib/supabase/types'

const JLPT_LEVELS: JlptLevel[] = ['N1', 'N2', 'N3', 'N4', 'N5']

interface Profile {
  id: string
  full_name: string | null
  target_coding_area: string | null
  is_japanese: boolean
  jlpt_level: JlptLevel | null
  it_certifications: string | null
}

export default function ProfileForm({ profile }: { profile: Profile | null }) {
  const router = useRouter()
  const [fullName, setFullName] = useState(profile?.full_name ?? '')
  const [targetCoding, setTargetCoding] = useState(profile?.target_coding_area ?? '')
  const [isJapanese, setIsJapanese] = useState(profile?.is_japanese ?? false)
  const [jlptLevel, setJlptLevel] = useState<JlptLevel | ''>(profile?.jlpt_level ?? '')
  const [itCertifications, setItCertifications] = useState(profile?.it_certifications ?? '')
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)
  const [saveError, setSaveError] = useState<string | null>(null)
  const [savingCerts, setSavingCerts] = useState(false)
  const [savedCerts, setSavedCerts] = useState(false)
  const [certError, setCertError] = useState<string | null>(null)
  const [newPassword, setNewPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [passwordSaving, setPasswordSaving] = useState(false)
  const [passwordMessage, setPasswordMessage] = useState<{ type: 'success' | 'error'; text: string } | null>(null)

  async function handleSave(e: React.FormEvent) {
    e.preventDefault()
    setSaving(true)
    setSaved(false)
    setSaveError(null)

    const supabase = createClient()
    const { error } = await supabase
      .from('profiles')
      .update({
        full_name: fullName || null,
        target_coding_area: targetCoding || null,
        is_japanese: isJapanese,
        updated_at: new Date().toISOString(),
      })
      .eq('id', profile?.id ?? '')

    setSaving(false)
    if (error) {
      setSaveError(error.message)
    } else {
      setSaved(true)
      router.refresh()
      setTimeout(() => setSaved(false), 2000)
    }
  }

  async function handleSaveCerts(e: React.FormEvent) {
    e.preventDefault()
    setSavingCerts(true)
    setSavedCerts(false)
    setCertError(null)

    const supabase = createClient()
    const { error } = await supabase
      .from('profiles')
      .update({
        jlpt_level: jlptLevel || null,
        it_certifications: itCertifications || null,
        updated_at: new Date().toISOString(),
      })
      .eq('id', profile?.id ?? '')

    setSavingCerts(false)
    if (error) {
      setCertError(error.message)
    } else {
      setSavedCerts(true)
      router.refresh()
      setTimeout(() => setSavedCerts(false), 2000)
    }
  }

  async function handlePasswordChange(e: React.FormEvent) {
    e.preventDefault()
    setPasswordMessage(null)

    if (newPassword.length < 6) {
      setPasswordMessage({ type: 'error', text: 'パスワードは6文字以上必要です' })
      return
    }
    if (newPassword !== confirmPassword) {
      setPasswordMessage({ type: 'error', text: 'パスワードが一致しません' })
      return
    }

    setPasswordSaving(true)
    const supabase = createClient()
    const { error } = await supabase.auth.updateUser({ password: newPassword })

    if (error) {
      setPasswordMessage({ type: 'error', text: error.message })
    } else {
      setPasswordMessage({ type: 'success', text: 'パスワードを変更しました' })
      setNewPassword('')
      setConfirmPassword('')
    }
    setPasswordSaving(false)
  }

  return (
    <div className="space-y-6">
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

        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">開発言語</label>
          <select
            value={targetCoding}
            onChange={(e) => setTargetCoding(e.target.value)}
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
          >
            <option value="">選択</option>
            <option value="java">Java</option>
            <option value="javascript">JavaScript</option>
          </select>
        </div>

        {saveError && (
          <div className="rounded-xl px-3 py-2 text-sm bg-red-500/10 text-red-400 ring-1 ring-red-500/20">
            {saveError}
          </div>
        )}

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

    <Card title="資格証明">
      <form onSubmit={handleSaveCerts} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">日本語資格 (JLPT)</label>
          <select
            value={jlptLevel}
            onChange={(e) => setJlptLevel(e.target.value as JlptLevel | '')}
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
          >
            <option value="">未選択</option>
            {JLPT_LEVELS.map((level) => (
              <option key={level} value={level}>{level}</option>
            ))}
          </select>
        </div>

        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">IT関連資格</label>
          <textarea
            value={itCertifications}
            onChange={(e) => setItCertifications(e.target.value)}
            rows={3}
            placeholder="例: 基本情報技術者、AWS SAA、정보처리기사"
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>

        {certError && (
          <div className="rounded-xl px-3 py-2 text-sm bg-red-500/10 text-red-400 ring-1 ring-red-500/20">
            {certError}
          </div>
        )}

        <div className="flex items-center gap-3">
          <button
            type="submit"
            disabled={savingCerts}
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
          >
            {savingCerts ? '保存中...' : '保存'}
          </button>
          {savedCerts && <span className="text-sm text-emerald-400">保存しました</span>}
        </div>
      </form>
    </Card>

    <Card title="パスワード変更">
      <form onSubmit={handlePasswordChange} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">新しいパスワード</label>
          <input
            type="password"
            value={newPassword}
            onChange={(e) => setNewPassword(e.target.value)}
            minLength={6}
            required
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>

        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">パスワード確認</label>
          <input
            type="password"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            minLength={6}
            required
            className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
          />
        </div>

        {passwordMessage && (
          <div className={`rounded-xl px-3 py-2 text-sm ${
            passwordMessage.type === 'success'
              ? 'bg-emerald-500/10 text-emerald-400 ring-1 ring-emerald-500/20'
              : 'bg-red-500/10 text-red-400 ring-1 ring-red-500/20'
          }`}>
            {passwordMessage.text}
          </div>
        )}

        <button
          type="submit"
          disabled={passwordSaving}
          className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
        >
          {passwordSaving ? '変更中...' : 'パスワード変更'}
        </button>
      </form>
    </Card>
    </div>
  )
}
