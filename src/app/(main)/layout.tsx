import { createClient } from '@/lib/supabase/server'
import MainShell from '@/components/ui/MainShell'
import Providers from '@/app/providers'
import type { UserRole } from '@/lib/supabase/types'

export default async function MainLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  let userName: string | null = null
  let userRole: UserRole = 'mentee'
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('full_name, role')
      .eq('id', user.id)
      .single()
    userName = profile?.full_name ?? user.email ?? null
    userRole = (profile?.role as UserRole) ?? 'mentee'
  }

  return (
    <Providers>
      <MainShell userName={userName} userRole={userRole}>{children}</MainShell>
    </Providers>
  )
}
