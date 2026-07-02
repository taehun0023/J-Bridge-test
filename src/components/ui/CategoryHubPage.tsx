import Link from 'next/link'
import Card from '@/components/ui/Card'
import { categoryChildren } from '@/lib/navigation'
import { createClient } from '@/lib/supabase/server'
import { getSubcategorySettings } from '@/app/actions/admin/categories'

export default async function CategoryHubPage({ categoryKey }: { categoryKey: string }) {
  const config = categoryChildren[categoryKey]
  if (!config) return null

  // 비활성 서브카테고리는 멘티에게 숨김 (관리자·멘토는 전부 표시)
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  let role = 'mentee'
  if (user) {
    const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
    role = profile?.role ?? 'mentee'
  }
  const settings = await getSubcategorySettings()
  const children = role === 'mentee'
    ? config.children.filter(c => settings[c.href] !== false)
    : config.children

  return (
    <div>
      <div className="mb-6">
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">{config.title}</h1>
        <p className="mt-1 text-gray-500 dark:text-gray-400">{config.description}</p>
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
