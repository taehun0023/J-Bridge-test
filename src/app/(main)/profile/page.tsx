import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { Shield, GraduationCap, User } from 'lucide-react'
import ProfileForm from './ProfileForm'

const GREETINGS = [
  'ようこそ',
  'こんにちは',
  'お疲れ様です',
  'お元気ですか',
  'お会いできて嬉しいです',
  'いつもありがとうございます',
  '今日も頑張りましょう',
  '今日も素敵な一日を',
  'いらっしゃいませ',
] as const

function parseDisplayName(fullName: string): {
  lastName: string
  firstName: string
  katakanaLast: string
  katakanaFirst: string
} {
  const empty = { lastName: '', firstName: '', katakanaLast: '', katakanaFirst: '' }
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

const ROLE_META: Record<string, { label: string; classes: string; Icon: typeof Shield }> = {
  admin: {
    label: '管理者 (Admin)',
    classes: 'bg-red-100 text-red-700 ring-red-200 dark:bg-red-500/15 dark:text-red-300 dark:ring-red-500/30',
    Icon: Shield,
  },
  mentor: {
    label: 'メンター (Mentor)',
    classes: 'bg-indigo-100 text-indigo-700 ring-indigo-200 dark:bg-indigo-500/15 dark:text-indigo-300 dark:ring-indigo-500/30',
    Icon: GraduationCap,
  },
  mentee: {
    label: 'メンティ (Mentee)',
    classes: 'bg-emerald-100 text-emerald-700 ring-emerald-200 dark:bg-emerald-500/15 dark:text-emerald-300 dark:ring-emerald-500/30',
    Icon: User,
  },
}

export default async function ProfilePage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  const role = (profile?.role as keyof typeof ROLE_META) ?? 'mentee'
  const roleMeta = ROLE_META[role] ?? ROLE_META.mentee
  const { Icon } = roleMeta

  const rawName = profile?.full_name ?? ''
  const parsed = parseDisplayName(rawName)
  const hasName = parsed.lastName !== '' || parsed.firstName !== ''

  const greeting = GREETINGS[Math.floor(Math.random() * GREETINGS.length)]

  return (
    <div>
      <div className="flex flex-wrap items-center gap-3">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">プロフィール</h1>
        <span
          className={`inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-semibold ring-1 ${roleMeta.classes}`}
        >
          <Icon className="h-3.5 w-3.5" />
          {roleMeta.label}
        </span>
      </div>
      <p className="mt-1 text-gray-500 dark:text-gray-400">個人情報と学習状況を確認してください</p>

      <div className="mt-6 rounded-2xl border border-indigo-200/60 bg-gradient-to-r from-indigo-50 to-violet-50 px-5 py-4 dark:border-indigo-500/20 dark:from-indigo-500/10 dark:to-violet-500/10">
        <p className="text-base font-medium text-zinc-800 dark:text-zinc-100">
          {greeting}、
          {hasName ? (
            <span className="font-semibold text-indigo-600 dark:text-indigo-300">
              <ruby>
                {parsed.lastName}
                <rt className="pb-1 text-xs font-medium text-indigo-500/80 dark:text-indigo-300/80">{parsed.katakanaLast || ' '}</rt>
              </ruby>
              {parsed.firstName && (
                <>
                  {' '}
                  <ruby>
                    {parsed.firstName}
                    <rt className="pb-1 text-xs font-medium text-indigo-500/80 dark:text-indigo-300/80">{parsed.katakanaFirst || ' '}</rt>
                  </ruby>
                </>
              )}
            </span>
          ) : (
            <span className="font-semibold text-indigo-600 dark:text-indigo-300">ゲスト</span>
          )}
          さん！
        </p>
      </div>

      <div className="mt-6">
        <ProfileForm profile={profile} />
      </div>
    </div>
  )
}
