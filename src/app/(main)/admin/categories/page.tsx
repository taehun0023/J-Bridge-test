import { categoryChildren, mainNavItems } from '@/lib/navigation'
import { getCategoryOverrides } from '@/app/actions/admin/categories'
import AdminCategoriesClient from './AdminCategoriesClient'

export default async function AdminCategoriesPage() {
  const overrides = await getCategoryOverrides()
  const categories = Object.entries(categoryChildren).map(([key, cfg]) => ({
    key,
    title: cfg.title,
    children: cfg.children.map(c => ({ href: c.href, label: c.label, description: c.description })),
  }))
  // 최상위 카테고리(대분류) — 사이드바 항목 (대시보드 제외). 설명은 카테고리 설정에서 가져온다.
  const topCategories = mainNavItems
    .filter(i => i.key !== 'dashboard')
    .map(i => ({ href: i.href, label: i.label, description: categoryChildren[i.key]?.description ?? '' }))

  return (
    <div>
      <div>
        <h1 className="text-2xl font-bold text-gray-900 dark:text-white">カテゴリ管理</h1>
        <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
          カテゴリ・サブカテゴリの表示名と説明を編集したり、メニューから削除できます。無効化はメンティーのみ非表示、削除は全員に非表示になります（表示名・説明はコードの初期値を基に上書きされ、いつでも元に戻せます）。
        </p>
      </div>
      <AdminCategoriesClient categories={categories} topCategories={topCategories} overrides={overrides} />
    </div>
  )
}
