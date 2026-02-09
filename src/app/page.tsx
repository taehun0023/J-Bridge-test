import { createClient } from '@/lib/supabase/server'
import { redirect } from 'next/navigation'

export default async function Home() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  // 인증된 사용자는 대시보드로, 미인증 사용자는 로그인 페이지로 리다이렉트
  if (user) {
    redirect('/dashboard')
  } else {
    redirect('/login')
  }
}
