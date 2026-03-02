import Link from 'next/link'
import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import ProfileForm from './ProfileForm'
import { MessageSquare } from 'lucide-react'

export default async function ProfilePage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) redirect('/login')

  const { data: profile } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', user.id)
    .single()

  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">プロフィール</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">個人情報と学習状況を確認してください</p>

      <Link
        href="/profile/feedback"
        className="mt-4 inline-flex items-center gap-2 rounded-lg border border-indigo-200 bg-indigo-50/50 px-4 py-2.5 text-sm font-medium text-indigo-600 hover:bg-indigo-100 dark:border-indigo-800 dark:bg-indigo-900/10 dark:text-indigo-400 dark:hover:bg-indigo-900/20 transition-colors"
      >
        <MessageSquare className="h-4 w-4" />
        フィードバック履歴を確認
      </Link>

      <div className="mt-6">
        <ProfileForm profile={profile} />
      </div>
    </div>
  )
}
