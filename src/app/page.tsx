import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'

export default async function Home() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  // 認証済みユーザーはダッシュボードへ、未認証ユーザーはログインページへリダイレクト
  if (user) {
    redirect('/dashboard')
  } else {
    redirect('/login')
  }
}
