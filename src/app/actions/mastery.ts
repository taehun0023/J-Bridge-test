'use server'

import { requireAuth } from '@/lib/auth-helpers'

type ItemType = 'it_glossary' | 'jlpt_vocabulary' | 'jlpt_grammar' | 'cs_term' | 'security_manual' | 'attitude_manual' | 'culture_manual' | 'jlpt_kanji' | 'jlpt_reading' | 'jlpt_listening'

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
    return { mastered: false }
  } else {
    // Add mastery
    const { error } = await supabase
      .from('user_mastered_items')
      .insert({ user_id: user.id, item_type: itemType, item_id: itemId })
    if (error) return { error: '保存に失敗しました' }
    return { mastered: true }
  }
}

export async function getMasteredIds(itemType: ItemType): Promise<string[]> {
  const auth = await requireAuth()
  if ('error' in auth) return []
  const { supabase, user } = auth

  const { data } = await supabase
    .from('user_mastered_items')
    .select('item_id')
    .eq('user_id', user.id)
    .eq('item_type', itemType)

  return data?.map(d => d.item_id) ?? []
}

export async function getMasteredIdsMultiple(itemTypes: ItemType[]): Promise<string[]> {
  const auth = await requireAuth()
  if ('error' in auth) return []
  const { supabase, user } = auth

  const { data } = await supabase
    .from('user_mastered_items')
    .select('item_id')
    .eq('user_id', user.id)
    .in('item_type', itemTypes)

  return data?.map(d => d.item_id) ?? []
}
