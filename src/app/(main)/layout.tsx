import { createClient } from '@/lib/supabase/server'
import MainShell from '@/components/ui/MainShell'
import Providers from '@/app/providers'

export default async function MainLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  let userName: string | null = null
  if (user) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('full_name')
      .eq('id', user.id)
      .single()
    userName = profile?.full_name ?? user.email ?? null
  }

  return (
    <Providers>
      <MainShell userName={userName}>{children}</MainShell>
    </Providers>
  )
}
