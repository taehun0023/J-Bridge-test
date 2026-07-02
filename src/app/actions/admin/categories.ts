'use server'

import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'
import { createClient } from '@/lib/supabase/server'
import { logAuditEvent } from '@/app/actions/audit'

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

/** 현재 사용자가 멘티일 때만 "비활성 서브카테고리 href 집합" 반환 (관리자·멘토는 빈 집합=전부 노출). 허브에서 숨김용. */
export async function getMenteeHiddenSubcats(): Promise<Set<string>> {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return new Set()
  const { data: profile } = await supabase.from('profiles').select('role').eq('id', user.id).single()
  if (profile?.role !== 'mentee') return new Set()
  const { data } = await supabase.from('subcategory_settings').select('subcat_key').eq('is_active', false)
  return new Set((data ?? []).map((r: { subcat_key: string }) => r.subcat_key))
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

  revalidatePath('/admin/categories')
  for (const p of ['/japanese/jlpt', '/japanese/business', '/cs', '/dev', '/business-literacy']) {
    revalidatePath(p)
  }
  return { success: true }
}
