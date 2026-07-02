import { categoryChildren, mainNavItems } from '@/lib/navigation'
import { getSubcategorySettings } from '@/app/actions/admin/categories'
import AdminCategoriesClient from './AdminCategoriesClient'

export default async function AdminCategoriesPage() {
  const settings = await getSubcategorySettings()
  const categories = Object.entries(categoryChildren).map(([key, cfg]) => ({
    key,
    title: cfg.title,
    children: cfg.children.map(c => ({ href: c.href, label: c.label, description: c.description })),
  }))
  // 최상위 카테고리(대분류) — 사이드바 항목 (대시보드 제외)
  const topCategories = mainNavItems
    .filter(i => i.key !== 'dashboard')
    .map(i => ({ href: i.href, label: i.label }))

  return (
    <div>
      <div>
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">カテゴリ管理</h1>
        <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
          サブカテゴリの有効・無効を切り替えます。無効にすると、メンティーにはメニューから非表示になり、ページへの直接アクセスもブロックされます（管理者・メンターは影響を受けません）。
        </p>
      </div>
      <AdminCategoriesClient categories={categories} topCategories={topCategories} settings={settings} />
    </div>
  )
}
