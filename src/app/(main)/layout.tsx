import { createClient } from '@/lib/supabase/server'
import MainShell from '@/components/ui/MainShell'
import Providers from '@/app/providers'
import type { UserRole, JlptLevel } from '@/lib/supabase/types'

export default async function MainLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  let userName: string | null = null
  let avatarUrl: string | null = null
  let userRole: UserRole = 'mentee'
  let jlptLevel: JlptLevel | null = null
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('full_name, role, avatar_url, jlpt_level')
      .eq('id', user.id)
      .single()
    const rawName = profile?.full_name ?? user.email ?? null
    userName = rawName ? rawName.replace(/\s*\([^()]*\)\s*$/, '').trim() : null
    avatarUrl = profile?.avatar_url ?? null
    userRole = (profile?.role as UserRole) ?? 'mentee'
    jlptLevel = (profile?.jlpt_level as JlptLevel) ?? null
  }

  return (
    <Providers>
      <MainShell userName={userName} avatarUrl={avatarUrl} userRole={userRole} jlptLevel={jlptLevel}>{children}</MainShell>
    </Providers>
  )
}
