'use server'

import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'

type ItemType = 'it_glossary' | 'jlpt_vocabulary' | 'jlpt_grammar' | 'cs_term' | 'security_manual' | 'attitude_manual' | 'culture_manual' | 'jlpt_kanji' | 'jlpt_reading' | 'jlpt_listening'

/** 습득 변경이 반영돼야 하는 카운트 화면들 (서버 렌더 → 재검증 필요) */
function revalidateMasteryCounts() {
  revalidatePath('/dashboard')
  revalidatePath('/admin/tasks')
  revalidatePath('/admin/reports')
  revalidatePath('/dashboard/assignments')
}

export async function toggleMastery(itemType: ItemType, itemId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Check if already mastered
  const { data: existing } = await supabase
    .from('user_mastered_items')
    .select('id')
    .eq('user_id', user.id)
    .eq('item_type', itemType)
    .eq('item_id', itemId)
    .single()

  if (existing) {
    // Remove mastery
    await supabase
      .from('user_mastered_items')
      .delete()
      .eq('id', existing.id)
    revalidateMasteryCounts()
    return { mastered: false }
  } else {
    // Add mastery
    const { error } = await supabase
      .from('user_mastered_items')
      .insert({ user_id: user.id, item_type: itemType, item_id: itemId })
    if (error) return { error: '保存に失敗しました' }
    revalidateMasteryCounts()
    return { mastered: true }
  }
}

export async function getMasteredIds(itemType: ItemType): Promise<string[]> {
  const auth = await requireAuth()
  if ('error' in auth) return []
  const { supabase, user } = auth

  // 페이지네이션 — 1000행 기본 제한 회피 (N1 어휘 등 1000개 초과 습득 시 누락 방지)
  const ids: string[] = []
  const PAGE = 1000
  for (let offset = 0; ; offset += PAGE) {
    const { data } = await supabase
      .from('user_mastered_items')
      .select('item_id')
      .eq('user_id', user.id)
      .eq('item_type', itemType)
      .range(offset, offset + PAGE - 1)
    if (!data || data.length === 0) break
    ids.push(...data.map(d => d.item_id))
    if (data.length < PAGE) break
  }
  return ids
}

export async function getMasteredIdsMultiple(itemTypes: ItemType[]): Promise<string[]> {
  const auth = await requireAuth()
  if ('error' in auth) return []
  const { supabase, user } = auth

  const ids: string[] = []
  const PAGE = 1000
  for (let offset = 0; ; offset += PAGE) {
    const { data } = await supabase
      .from('user_mastered_items')
      .select('item_id')
      .eq('user_id', user.id)
      .in('item_type', itemTypes)
      .range(offset, offset + PAGE - 1)
    if (!data || data.length === 0) break
    ids.push(...data.map(d => d.item_id))
    if (data.length < PAGE) break
  }
  return ids
}
