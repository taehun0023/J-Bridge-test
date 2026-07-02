import { createClient } from '@/lib/supabase/server'
import MainShell from '@/components/ui/MainShell'
import GlobalLoadingOverlay from '@/components/ui/GlobalLoadingOverlay'
import Providers from '@/app/providers'
import type { UserRole, JlptLevel } from '@/lib/supabase/types'
import { kanjiOnly } from '@/lib/name-format'
import { getSubcategorySettings } from '@/app/actions/admin/categories'

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
    userName = kanjiOnly(profile?.full_name) ?? user.email ?? null
    avatarUrl = profile?.avatar_url ?? null
    userRole = (profile?.role as UserRole) ?? 'mentee'
    jlptLevel = (profile?.jlpt_level as JlptLevel) ?? null
  }

  // 카테고리 관리에서 비활성화한 항목은 멘티 메뉴에서 숨김 (관리자·멘토는 전부 노출)
  let hiddenNav: string[] = []
  if (userRole === 'mentee') {
    const settings = await getSubcategorySettings()
    hiddenNav = Object.entries(settings).filter(([, active]) => !active).map(([href]) => href)
  }

  return (
    <Providers>
      <GlobalLoadingOverlay />
      <MainShell userName={userName} avatarUrl={avatarUrl} userRole={userRole} jlptLevel={jlptLevel} hiddenNav={hiddenNav}>{children}</MainShell>
    </Providers>
  )
}
