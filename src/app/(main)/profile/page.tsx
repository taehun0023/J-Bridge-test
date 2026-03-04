import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'
import ProfileForm from './ProfileForm'

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

      <div className="mt-6">
        <ProfileForm profile={profile} />
      </div>
    </div>
  )
}
