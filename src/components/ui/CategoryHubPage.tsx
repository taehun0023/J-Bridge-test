import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren, mainNavItems } from '@/lib/navigation'
import { createClient } from '@/lib/supabase/server'
import { getCategoryOverrides } from '@/app/actions/admin/categories'

export default async function CategoryHubPage({ categoryKey }: { categoryKey: string }) {
  const config = categoryChildren[categoryKey]
  if (!config) return null

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  let role = 'mentee'
  if (user) {
    const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    role = profile?.role ?? 'mentee'
  }

  // 카테고리 관리 오버라이드: 이름·설명 덮어쓰기 + 삭제(전체 숨김) + 비활성(멘티 숨김)
  const overrides = await getCategoryOverrides()
  const topHref = mainNavItems.find((i) => i.key === categoryKey)?.href
  const topOv = topHref ? overrides[topHref] : undefined
  const title = topOv?.label_override ?? config.title
  const description = topOv?.description_override ?? config.description

  const children = config.children
    .filter((c) => {
      const ov = overrides[c.href]
      if (!ov) return true
      if (ov.deleted) return false
      if (role === 'mentee' && ov.is_active === false) return false
      return true
    })
    .map((c) => {
      const ov = overrides[c.href]
      return {
        href: c.href,
        label: ov?.label_override ?? c.label,
        description: ov?.description_override ?? c.description,
      }
    })

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{description}</p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {children.map((child) => (
          <Link key={child.href} href={child.href}>
            <Card className="h-full transition-shadow hover:shadow-md">
              <h3 className="font-semibold text-gray-900 dark:text-white">{child.label}</h3>
              <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">{child.description}</p>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  )
}
