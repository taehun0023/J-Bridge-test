'use client'

import { useState } from 'react'
import { createClient } from '@/lib/supabase/client'
import { useRouter } from 'next/navigation'
import Card from '@/components/ui/Card'
import type { JlptLevel } from '@/lib/supabase/types'

const JLPT_LEVELS: JlptLevel[] = ['N1', 'N2', 'N3', 'N4', 'N5']

const ALPHABET_RE = /[A-Za-z]/

const IT_CERTIFICATIONS: Record<string, readonly string[]> = {
  '情報処理 (IPA)': [
    'ITパスポート',
    '情報セキュリティマネジメント',
    '基本情報技術者',
    '応用情報技術者',
    'ネットワークスペシャリスト',
    'データベーススペシャリスト',
    '情報処理安全確保支援士',
    'システムアーキテクト',
    'ITストラテジスト',
    'プロジェクトマネージャ',
    'ITサービスマネージャ',
    'システム監査技術者',
    'エンベデッドシステムスペシャリスト',
  ],
  'AWS': [
    'AWS Cloud Practitioner (Foundational)',
    'AWS AI Practitioner (Foundational)',
    'AWS Solutions Architect Associate (SAA)',
    'AWS Developer Associate (DVA)',
    'AWS SysOps Administrator Associate (SOA)',
    'AWS Data Engineer Associate (DEA)',
    'AWS Machine Learning Engineer Associate (MLA)',
    'AWS Solutions Architect Professional (SAP)',
    'AWS DevOps Engineer Professional (DOP)',
    'AWS Advanced Networking Specialty',
    'AWS Security Specialty',
    'AWS Machine Learning Specialty',
  ],
  'Microsoft Azure': [
    'Azure Fundamentals (AZ-900)',
    'Azure Administrator Associate (AZ-104)',
    'Azure Developer Associate (AZ-204)',
    'Azure Solutions Architect Expert (AZ-305)',
    'Azure DevOps Engineer Expert (AZ-400)',
    'Azure Security Engineer Associate (AZ-500)',
    'Azure Data Engineer Associate (DP-203)',
    'Azure Database Administrator Associate (DP-300)',
  ],
  'Google Cloud': [
    'Google Cloud Digital Leader',
    'Google Cloud Associate Cloud Engineer',
    'Google Cloud Professional Cloud Architect',
    'Google Cloud Professional Data Engineer',
    'Google Cloud Professional DevOps Engineer',
    'Google Cloud Professional Cloud Security Engineer',
    'Google Cloud Professional ML Engineer',
  ],
  'Oracle / Java': [
    'Oracle Certified Java Programmer Bronze (OCJP Bronze)',
    'Oracle Certified Java Programmer Silver (OCJP Silver)',
    'Oracle Certified Java Programmer Gold (OCJP Gold)',
    'Oracle Master Bronze (DB)',
    'Oracle Master Silver (DB)',
    'Oracle Master Gold (DB)',
    'Oracle Master Platinum (DB)',
    'Oracle Cloud Infrastructure Foundations (OCI)',
  ],
  'ネットワーク / Linux': [
    'CCNA (Cisco)',
    'CCNP (Cisco)',
    'CCIE (Cisco)',
    'LPIC-1',
    'LPIC-2',
    'LPIC-3',
    'RHCSA (Red Hat)',
    'RHCE (Red Hat)',
    'CompTIA Network+',
  ],
  'セキュリティ': [
    'CISSP',
    'CEH (Certified Ethical Hacker)',
    'CompTIA Security+',
    'CompTIA CySA+',
  ],
  'プロジェクト管理 / ITIL': [
    'PMP',
    'PRINCE2',
    'ITIL Foundation',
    'Scrum Master (CSM)',
    'Scrum Master (PSM)',
  ],
  '韓国国家資格': [
    '정보처리기사',
    '정보처리산업기사',
    '정보보안기사',
    '정보보안산업기사',
    'SQLD',
    'SQLP',
    'ADsP',
    'ADP',
    '빅데이터분석기사',
  ],
}

const ALL_CERT_VALUES: ReadonlySet<string> = new Set(
  Object.values(IT_CERTIFICATIONS).flat(),
)

function parseCertifications(raw: string | null): string[] {
  if (!raw) return []
  return raw
    .split(/[、,]/)
    .map((s) => s.trim())
    .filter((s) => s && ALL_CERT_VALUES.has(s))
}

function buildCertifications(known: string[]): string {
  return known.join('、')
}

interface Profile {
  id: string
  full_name: string | null
  target_coding_area: string | null
  is_japanese: boolean
  jlpt_level: JlptLevel | null
  it_certifications: string | null
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
  const [targetCoding, setTargetCoding] = useState(profile?.target_coding_area ?? '')
  const [isJapanese, setIsJapanese] = useState<boolean | null>(null)
  const nationalitySelected = isJapanese !== null
  const [jlptLevel, setJlptLevel] = useState<JlptLevel | ''>(profile?.jlpt_level ?? '')
  const [selectedCerts, setSelectedCerts] = useState<string[]>(
    parseCertifications(profile?.it_certifications ?? null),
  )
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

  const nameLabelSuffix = isJapanese === false ? '（漢字/アルファベット）' : isJapanese === true ? '（漢字）' : ''

  async function handleSave(e: React.FormEvent) {
    e.preventDefault()
    setSaving(true)
    setSaved(false)
    setSaveError(null)

    if (isJapanese === null) {
      setSaveError('「日本人ですか？」を先に選択してください')
      setSaving(false)
      return
    }

    if (isJapanese && (ALPHABET_RE.test(lastName) || ALPHABET_RE.test(firstName))) {
      setSaveError('日本人の方は名前をアルファベットではなく日本語（漢字・カタカナ）で入力してください')
      setSaving(false)
      return
    }

    const hasName = lastName.trim() !== '' || firstName.trim() !== ''
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
          <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
            日本人ですか？ <span className="text-red-400">*</span>
          </label>
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
          {!nationalitySelected && (
            <p className="mt-2 text-xs text-amber-500 dark:text-amber-400">
              先に「日本人ですか？」を選択してください。選択するまで他の項目は入力できません。
            </p>
          )}
        </div>

        <fieldset disabled={!nationalitySelected} className="space-y-4 disabled:opacity-50">
          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">
              名前{nameLabelSuffix}
            </label>
            <div className="mt-1 grid grid-cols-2 gap-2">
              <input
                type="text"
                value={lastName}
                onChange={(e) => setLastName(e.target.value)}
                placeholder="姓 / Last Name"
                className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none disabled:cursor-not-allowed dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
              />
              <input
                type="text"
                value={firstName}
                onChange={(e) => setFirstName(e.target.value)}
                placeholder="名 / First Name"
                className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none disabled:cursor-not-allowed dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
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
                placeholder="セイ / Last Name (Katakana)"
                className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none disabled:cursor-not-allowed dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
              />
              <input
                type="text"
                value={katakanaFirst}
                onChange={(e) => setKatakanaFirst(e.target.value)}
                placeholder="メイ / First Name (Katakana)"
                className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none disabled:cursor-not-allowed dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">開発言語</label>
            <select
              value={targetCoding}
              onChange={(e) => setTargetCoding(e.target.value)}
              className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 disabled:cursor-not-allowed dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
            >
              <option value="">選択</option>
              <option value="java">Java</option>
              <option value="javascript">JavaScript</option>
            </select>
          </div>
        </fieldset>

        {saveError && (
          <div className="rounded-xl px-3 py-2 text-sm bg-red-500/10 text-red-400 ring-1 ring-red-500/20">
            {saveError}
          </div>
        )}

        <div className="flex items-center gap-3">
          <button
            type="submit"
            disabled={saving || !nationalitySelected}
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

          {selectedCerts.length > 0 && (
            <div className="mt-2 flex flex-wrap gap-2">
              {selectedCerts.map((cert) => (
                <span
                  key={cert}
                  className="inline-flex items-center gap-1 rounded-full bg-indigo-100 px-3 py-1 text-xs font-medium text-indigo-700 dark:bg-indigo-500/15 dark:text-indigo-300"
                >
                  {cert}
                  <button
                    type="button"
                    onClick={() => setSelectedCerts((prev) => prev.filter((c) => c !== cert))}
                    className="text-indigo-500 hover:text-indigo-700 dark:text-indigo-400 dark:hover:text-indigo-200"
                    aria-label={`${cert} を削除`}
                  >
                    ×
                  </button>
                </span>
              ))}
            </div>
          )}

          <select
            value=""
            onChange={(e) => {
              const v = e.target.value
              if (v && !selectedCerts.includes(v)) {
                setSelectedCerts((prev) => [...prev, v])
              }
            }}
            className="mt-2 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100"
          >
            <option value="">資格を選択して追加…</option>
            {Object.entries(IT_CERTIFICATIONS).map(([category, items]) => (
              <optgroup key={category} label={category}>
                {items.map((item) => (
                  <option key={item} value={item} disabled={selectedCerts.includes(item)}>
                    {item}
                  </option>
                ))}
              </optgroup>
            ))}
          </select>

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
