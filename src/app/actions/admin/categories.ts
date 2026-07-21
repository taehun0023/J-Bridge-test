'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'
import { createClient } from '@/lib/supabase/server'
import { logAuditEvent } from '@/app/actions/audit'

/** 네비게이션 관련 페이지 재검증 (카테고리 변경 시). */
const NAV_PATHS = ['/admin/categories', '/japanese/jlpt', '/japanese/business', '/cs', '/dev', '/business-literacy']
function revalidateNav() {
  for (const p of NAV_PATHS) revalidatePath(p)
  // 사이드바(루트 레이아웃)까지 갱신
  revalidatePath('/', 'layout')
}

/** subcat_key(href) → is_active 맵. 행이 없으면 활성(true)로 간주. */
export async function getSubcategorySettings(): Promise<Record<string, boolean>> {
  const supabase = await createClient()
  const { data } = await supabase.from('subcategory_settings').select('subcat_key, is_active')
  const map: Record<string, boolean> = {}
  for (const r of (data ?? []) as { subcat_key: string; is_active: boolean }[]) {
    map[r.subcat_key] = r.is_active
  }
  return map
}

export interface CategoryOverride {
  is_active: boolean
  label_override: string | null
  description_override: string | null
  deleted: boolean
}

/** subcat_key(href) → 전체 오버라이드(이름/설명/활성/삭제). 행이 없으면 기본값(활성·미삭제). */
export async function getCategoryOverrides(): Promise<Record<string, CategoryOverride>> {
  const supabase = await createClient()
  const { data } = await supabase
    .from('subcategory_settings')
    .select('subcat_key, is_active, label_override, description_override, deleted')
  const map: Record<string, CategoryOverride> = {}
  for (const r of (data ?? []) as (CategoryOverride & { subcat_key: string })[]) {
    map[r.subcat_key] = {
      is_active: r.is_active,
      label_override: r.label_override,
      description_override: r.description_override,
      deleted: r.deleted,
    }
  }
  return map
}

/**
 * 현재 역할 기준으로 "메뉴/허브에서 숨길 href 집합".
 * - deleted = true: 모든 사용자에게 숨김(삭제).
 * - is_active = false: 멘티에게만 숨김(비활성 토글).
 * 관리자·멘토는 삭제된 항목만 숨긴다.
 */
export async function getMenteeHiddenSubcats(): Promise<Set<string>> {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return new Set()
  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  const role = profile?.role ?? 'mentee'
  const { data } = await supabase.from('subcategory_settings').select('subcat_key, is_active, deleted')
  const hidden = new Set<string>()
  for (const r of (data ?? []) as { subcat_key: string; is_active: boolean; deleted: boolean }[]) {
    if (r.deleted || (role === 'mentee' && r.is_active === false)) hidden.add(r.subcat_key)
  }
  return hidden
}

export async function setSubcategoryActive(subcatKey: string, isActive: boolean) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.serviceClient
    .from('subcategory_settings')
    .upsert(
      { subcat_key: subcatKey, is_active: isActive, updated_at: new Date().toISOString(), updated_by: auth.user.id },
      { onConflict: 'subcat_key' },
    )
  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'subcategory_settings', subcatKey, null, { is_active: isActive })
  revalidateNav()
  return { success: true }
}

/** 카테고리/서브카테고리의 표시 이름·설명을 덮어쓴다. 빈 값이면 코드 기본값으로 되돌린다(NULL). */
export async function updateCategoryOverride(subcatKey: string, label: string | null, description: string | null) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const labelOverride = (label ?? '').trim() || null
  const descOverride = (description ?? '').trim() || null

  const { error } = await auth.serviceClient
    .from('subcategory_settings')
    .upsert(
      {
        subcat_key: subcatKey,
        label_override: labelOverride,
        description_override: descOverride,
        updated_at: new Date().toISOString(),
        updated_by: auth.user.id,
      },
      { onConflict: 'subcat_key' },
    )
  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'subcategory_settings', subcatKey, null, {
    label_override: labelOverride,
    description_override: descOverride,
  })
  revalidateNav()
  return { success: true }
}

/** 카테고리/서브카테고리를 메뉴에서 삭제(숨김)하거나 복원한다. */
export async function setCategoryDeleted(subcatKey: string, deleted: boolean) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const

  const { error } = await auth.serviceClient
    .from('subcategory_settings')
    .upsert(
      { subcat_key: subcatKey, deleted, updated_at: new Date().toISOString(), updated_by: auth.user.id },
      { onConflict: 'subcat_key' },
    )
  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, deleted ? 'delete' : 'update', 'subcategory_settings', subcatKey, null, { deleted })
  revalidateNav()
  return { success: true }
}
