import { createClient } from '@/lib/supabase/server'
import MainShell from '@/components/ui/MainShell'
import GlobalLoadingOverlay from '@/components/ui/GlobalLoadingOverlay'
import Providers from '@/app/providers'
import type { UserRole, JlptLevel } from '@/lib/supabase/types'
import { kanjiOnly } from '@/lib/name-format'
import { getCategoryOverrides } from '@/app/actions/admin/categories'

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

  // 카테고리 관리 오버라이드 적용:
  //  - 삭제(deleted)된 항목은 전체 메뉴에서 숨김, 비활성(is_active=false)은 멘티 메뉴에서만 숨김
  //  - 이름(label_override)은 사이드바 상단 카테고리에 반영
  const overrides = user ? await getCategoryOverrides() : {}
  const hiddenNav: string[] = []
  const navOverrides: Record<string, string> = {}
  for (const [href, ov] of Object.entries(overrides)) {
    if (ov.deleted || (userRole === 'mentee' && ov.is_active === false)) hiddenNav.push(href)
    if (ov.label_override) navOverrides[href] = ov.label_override
  }

  return (
    <Providers>
      <GlobalLoadingOverlay />
      <MainShell userName={userName} avatarUrl={avatarUrl} userRole={userRole} jlptLevel={jlptLevel} hiddenNav={hiddenNav} navOverrides={navOverrides}>{children}</MainShell>
    </Providers>
  )
}
