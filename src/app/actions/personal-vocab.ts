'use server'

import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import { ERR } from '@/lib/action-types'

export async function addPersonalVocab(
  term: string,
  meaning: string | null,
  memo: string | null,
  sourceUrl: string | null,
  reading: string | null = null,
) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  if (!term.trim()) return { error: ERR.REQUIRED_FIELDS }

  const { data, error } = await supabase
    .from('personal_vocab')
    .insert({
      user_id: user.id,
      term: term.trim(),
      meaning: meaning?.trim() || null,
      memo: memo?.trim() || null,
      source_url: sourceUrl || null,
      reading: reading?.trim() || null,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }
  revalidatePath('/personal-vocab')
  return { success: true, id: data.id }
}

export async function getPersonalVocab(search?: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { items: [] }
  const { supabase, user } = auth

  let query = supabase
    .from('personal_vocab')
    .select('*')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })

  if (search) {
    query = query.or(`term.ilike.%${search}%,meaning.ilike.%${search}%,memo.ilike.%${search}%`)
  }

  const { data } = await query
  return { items: data ?? [] }
}

export async function updatePersonalVocab(
  id: string,
  updates: { term?: string; meaning?: string | null; memo?: string | null; reading?: string | null },
) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // Verify ownership
  const { data: existing } = await supabase
    .from('personal_vocab')
    .select('user_id')
    .eq('id', id)
    .single()

  if (!existing || existing.user_id !== user.id) return { error: ERR.FORBIDDEN }

  const updateData: Record<string, unknown> = { updated_at: new Date().toISOString() }
  if (updates.term !== undefined) updateData.term = updates.term.trim()
  if (updates.meaning !== undefined) updateData.meaning = updates.meaning?.trim() || null
  if (updates.memo !== undefined) updateData.memo = updates.memo?.trim() || null
  if (updates.reading !== undefined) updateData.reading = updates.reading?.trim() || null

  const { error } = await supabase
    .from('personal_vocab')
    .update(updateData)
    .eq('id', id)

  if (error) return { error: error.message }
  revalidatePath('/personal-vocab')
  return { success: true }
}

export async function deletePersonalVocab(id: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  // Verify ownership
  const { data: existing } = await supabase
    .from('personal_vocab')
    .select('user_id')
    .eq('id', id)
    .single()

  if (!existing || existing.user_id !== user.id) return { error: ERR.FORBIDDEN }

  const { error } = await supabase
    .from('personal_vocab')
    .delete()
    .eq('id', id)

  if (error) return { error: error.message }
  revalidatePath('/personal-vocab')
  return { success: true }
}
