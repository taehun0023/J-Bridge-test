'use server'

import { createClient } from '@/lib/supabase/server'

type ItemType = 'it_glossary' | 'jlpt_vocabulary' | 'jlpt_grammar' | 'cs_term'

export async function toggleMastery(itemType: ItemType, itemId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

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
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return []

  const { data } = await supabase
    .from('user_mastered_items')
    .select('item_id')
    .eq('user_id', user.id)
    .eq('item_type', itemType)

  return data?.map(d => d.item_id) ?? []
}
