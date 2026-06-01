import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import { Shield, GraduationCap, User } from 'lucide-react'
import ProfileForm from './ProfileForm'

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

      <div className="mt-6">
        <ProfileForm profile={profile} />
      </div>
    </div>
  )
}
