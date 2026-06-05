'use client'

import { useState } from 'react'
import { ChevronDown } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import Card from '@/components/ui/Card'
import type { JlptLevel } from '@/lib/supabase/types'
import { IT_CERTIFICATIONS, parseCertifications, buildCertifications } from '@/lib/certifications'

const JLPT_BAR: { value: JlptLevel; label: string; fill: string }[] = [
  { value: 'N5', label: '初級', fill: 'bg-emerald-500' },
  { value: 'N4', label: '初中級', fill: 'bg-lime-500' },
  { value: 'N3', label: '中級', fill: 'bg-amber-500' },
  { value: 'N2', label: '中上級', fill: 'bg-orange-500' },
  { value: 'N1', label: '上級', fill: 'bg-rose-500' },
]

const KANJI_ONLY_RE = /^[一-鿿㐀-䶿々〆〇]+$/

interface Profile {
  id: string
  email: string
  full_name: string | null
  jlpt_level: JlptLevel | null
  it_certifications: string | null
  target_certification: string | null
}

interface NameParts {
  lastName: string
  firstName: string
  katakanaLast: string
  katakanaFirst: string
}

function parseFullName(fullName: string | null): NameParts {
  const empty: NameParts = { lastName: '', firstName: '', katakanaLast: '', katakanaFirst: '' }
  if (!fullName) return empty
  const trimmed = fullName.trim()
  const withKana = trimmed.match(/^(\S+)\s+(\S+)\s*\((\S+)\s+(\S+)\)\s*$/)
  if (withKana) {
    return {
      lastName: withKana[1],
      firstName: withKana[2],
      katakanaLast: withKana[3],
      katakanaFirst: withKana[4],
    }
  }
  const twoTokens = trimmed.match(/^(\S+)\s+(\S+)\s*$/)
  if (twoTokens) {
    return { lastName: twoTokens[1], firstName: twoTokens[2], katakanaLast: '', katakanaFirst: '' }
  }
  return { ...empty, lastName: trimmed }
}

function buildFullName(parts: NameParts): string {
  const kanji = [parts.lastName.trim(), parts.firstName.trim()].filter(Boolean).join(' ')
  const katakana = [parts.katakanaLast.trim(), parts.katakanaFirst.trim()].filter(Boolean).join(' ')
  if (!kanji) return ''
  return katakana ? `${kanji} (${katakana})` : kanji
}

export default function ProfileForm({ profile }: { profile: Profile | null }) {
  const router = useRouter()
  const initialParts = parseFullName(profile?.full_name ?? null)
  const [lastName, setLastName] = useState(initialParts.lastName)
  const [firstName, setFirstName] = useState(initialParts.firstName)
  const [katakanaLast, setKatakanaLast] = useState(initialParts.katakanaLast)
  const [katakanaFirst, setKatakanaFirst] = useState(initialParts.katakanaFirst)
  const [jlptLevel, setJlptLevel] = useState<JlptLevel | ''>(profile?.jlpt_level ?? '')
  const [selectedCerts, setSelectedCerts] = useState<string[]>(
    parseCertifications(profile?.it_certifications ?? null),
  )
  const [expandedCategory, setExpandedCategory] = useState<string | null>(null)
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

    const trimmedLast = lastName.trim()
    const trimmedFirst = firstName.trim()
    const hasName = trimmedLast !== '' || trimmedFirst !== ''

    if (hasName && (!KANJI_ONLY_RE.test(trimmedLast) || !KANJI_ONLY_RE.test(trimmedFirst))) {
      setSaveError('名前は漢字のみ入力できます。カタカナは下の欄に入力してください。')
      setSaving(false)
      return
    }

    if (hasName && (katakanaLast.trim() === '' || katakanaFirst.trim() === '')) {
      setSaveError('カタカナ名（セイ・メイ）は必須です')
      setSaving(false)
      return
    }

    const fullName = buildFullName({ lastName, firstName, katakanaLast, katakanaFirst })

    const supabase = createClient()
    const { error } = await supabase
      .from('profiles')
      .update({
        full_name: fullName || null,
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
    const combinedCerts = buildCertifications(selectedCerts)
    const { error } = await supabase
      .from('profiles')
      .update({
        jlpt_level: jlptLevel || null,
        it_certifications: combinedCerts || null,
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
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">ID（メールアドレス）</label>
          <input
            type="text"
            value={profile?.email ?? ''}
            readOnly
            disabled
            className="mt-1 w-full cursor-not-allowed rounded-xl border border-gray-200 bg-gray-50 px-3 py-2 text-sm text-zinc-500 dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-400"
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
            名前（漢字）<span className="text-red-400">*</span>
          </label>
          <div className="mt-1 grid grid-cols-2 gap-2">
            <input
              type="text"
              value={lastName}
              onChange={(e) => setLastName(e.target.value)}
              placeholder="姓"
              className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
            <input
              type="text"
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
              placeholder="名"
              className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
            カタカナ名 <span className="text-red-400">*</span>
          </label>
          <div className="mt-1 grid grid-cols-2 gap-2">
            <input
              type="text"
              value={katakanaLast}
              onChange={(e) => setKatakanaLast(e.target.value)}
              placeholder="セイ"
              className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
            <input
              type="text"
              value={katakanaFirst}
              onChange={(e) => setKatakanaFirst(e.target.value)}
              placeholder="メイ"
              className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
            />
          </div>
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
            className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:cursor-not-allowed disabled:opacity-50 transition-colors"
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
          <div className="flex items-baseline justify-between">
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">日本語資格 (JLPT)</label>
            {jlptLevel && (
              <button
                type="button"
                onClick={() => setJlptLevel('')}
                className="text-xs text-zinc-500 hover:text-zinc-700 dark:text-zinc-400 dark:hover:text-zinc-200"
              >
                解除
              </button>
            )}
          </div>

          <div className="mt-2 flex overflow-hidden rounded-2xl ring-1 ring-gray-200 dark:ring-white/[0.08]">
            <button
              type="button"
              onClick={() => setJlptLevel('')}
              aria-pressed={jlptLevel === ''}
              className={`relative flex flex-1 flex-col items-center justify-center gap-0.5 border-r border-gray-200 px-2 py-3 text-sm font-bold transition-colors dark:border-white/[0.08] ${
                jlptLevel === ''
                  ? 'bg-zinc-400 text-white ring-2 ring-inset ring-zinc-900/20 dark:bg-zinc-600 dark:ring-white/30'
                  : 'bg-white text-zinc-400 hover:bg-zinc-50 dark:bg-white/[0.02] dark:text-zinc-500 dark:hover:bg-white/[0.05]'
              }`}
            >
              <span>なし</span>
              <span className={`text-[10px] font-normal ${jlptLevel === '' ? 'text-white/90' : 'text-zinc-400 dark:text-zinc-500'}`}>
                無資格
              </span>
            </button>
            {JLPT_BAR.map((seg, idx) => {
              const selectedIdx = JLPT_BAR.findIndex((s) => s.value === jlptLevel)
              const filled = selectedIdx >= 0 && idx <= selectedIdx
              const isCurrent = jlptLevel === seg.value
              return (
                <button
                  key={seg.value}
                  type="button"
                  onClick={() => setJlptLevel(isCurrent ? '' : seg.value)}
                  aria-pressed={isCurrent}
                  className={`relative flex flex-1 flex-col items-center justify-center gap-0.5 px-2 py-3 text-sm font-bold transition-colors ${
                    filled
                      ? `${seg.fill} text-white`
                      : 'bg-white text-zinc-400 hover:bg-zinc-50 dark:bg-white/[0.02] dark:text-zinc-500 dark:hover:bg-white/[0.05]'
                  } ${isCurrent ? 'ring-2 ring-inset ring-zinc-900/20 dark:ring-white/30' : ''}`}
                >
                  <span>{seg.value}</span>
                  <span className={`text-[10px] font-normal ${filled ? 'text-white/90' : 'text-zinc-400 dark:text-zinc-500'}`}>
                    {seg.label}
                  </span>
                </button>
              )
            })}
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">目標資格</label>
          <div className="mt-2">
            {profile?.target_certification ? (
              <span className="inline-flex items-center rounded-lg bg-indigo-50 px-3 py-1.5 text-sm font-semibold text-indigo-700 dark:bg-indigo-900/30 dark:text-indigo-300">
                {profile.target_certification}
              </span>
            ) : (
              <span className="text-sm text-zinc-400">未設定</span>
            )}
          </div>
          <p className="mt-1.5 text-[10px] text-zinc-500 dark:text-zinc-400">
            管理者・メンターが設定します（課題付与の基準）。
          </p>
        </div>

        <div>
          <div className="flex items-baseline justify-between">
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">IT関連資格</label>
            <span className="text-xs text-zinc-500 dark:text-zinc-400">
              選択中 <span className="font-semibold text-indigo-600 dark:text-indigo-300">{selectedCerts.length}</span> 件
            </span>
          </div>
          <p className="mt-1 text-xs text-zinc-500 dark:text-zinc-400">
            該当する資格をクリックして選択してください（複数選択可）。
          </p>

          <div className="mt-3 space-y-2">
            {Object.entries(IT_CERTIFICATIONS).map(([category, items]) => {
              const selectedInCat = items.filter((item) => selectedCerts.includes(item)).length
              const isOpen = expandedCategory === category
              const hasSelection = selectedInCat > 0
              return (
                <div
                  key={category}
                  className={`overflow-hidden rounded-2xl ring-1 transition-colors ${
                    hasSelection
                      ? 'bg-indigo-50/40 ring-indigo-200 dark:bg-indigo-500/5 dark:ring-indigo-500/30'
                      : 'bg-white ring-gray-200 dark:bg-white/[0.02] dark:ring-white/[0.08]'
                  }`}
                >
                  <button
                    type="button"
                    onClick={() => setExpandedCategory(isOpen ? null : category)}
                    aria-expanded={isOpen}
                    className="flex w-full items-center justify-between px-4 py-3 text-left transition-colors hover:bg-zinc-50/60 dark:hover:bg-white/[0.04]"
                  >
                    <div className="flex items-center gap-2.5">
                      <span
                        className={`inline-flex h-7 min-w-7 items-center justify-center rounded-full px-2 text-xs font-semibold ${
                          hasSelection
                            ? 'bg-indigo-600 text-white dark:bg-indigo-500'
                            : 'bg-zinc-100 text-zinc-500 dark:bg-white/[0.08] dark:text-zinc-400'
                        }`}
                      >
                        {selectedInCat}
                      </span>
                      <span className="text-sm font-medium text-zinc-800 dark:text-zinc-100">
                        {category}
                      </span>
                      <span className="text-xs text-zinc-400 dark:text-zinc-500">
                        全{items.length}件
                      </span>
                    </div>
                    <ChevronDown
                      className={`h-4 w-4 text-zinc-400 transition-transform dark:text-zinc-500 ${
                        isOpen ? 'rotate-180' : ''
                      }`}
                      aria-hidden
                    />
                  </button>

                  {isOpen && (
                    <div className="border-t border-zinc-200/70 px-4 py-3 dark:border-white/[0.06]">
                      <div className="flex flex-wrap gap-2">
                        {items.map((item) => {
                          const active = selectedCerts.includes(item)
                          return (
                            <button
                              key={item}
                              type="button"
                              onClick={() =>
                                setSelectedCerts((prev) =>
                                  active ? prev.filter((c) => c !== item) : [...prev, item],
                                )
                              }
                              aria-pressed={active}
                              className={`inline-flex items-center gap-1 rounded-full px-3 py-1.5 text-xs font-medium ring-1 transition-colors ${
                                active
                                  ? 'bg-indigo-600 text-white ring-indigo-600 hover:bg-indigo-500 dark:bg-indigo-500 dark:ring-indigo-500'
                                  : 'bg-white text-zinc-700 ring-gray-200 hover:bg-indigo-50 hover:text-indigo-700 hover:ring-indigo-200 dark:bg-white/[0.04] dark:text-zinc-300 dark:ring-white/[0.08] dark:hover:bg-indigo-500/10 dark:hover:text-indigo-300 dark:hover:ring-indigo-500/30'
                              }`}
                            >
                              <span
                                className={`inline-block h-2 w-2 rounded-full ${
                                  active ? 'bg-white' : 'bg-zinc-300 dark:bg-white/20'
                                }`}
                                aria-hidden
                              />
                              {item}
                            </button>
                          )
                        })}
                      </div>
                    </div>
                  )}
                </div>
              )
            })}
          </div>
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
