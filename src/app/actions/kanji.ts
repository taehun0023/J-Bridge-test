'use server'

import { requireAuth } from '@/lib/auth-helpers'

export async function getKanjiList(level: string, search?: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { items: [] }
  const { supabase } = auth

  let query = supabase
    .from('jlpt_kanji')
    .select('*')
    .eq('jlpt_level', level)
    .order('sort_order', { ascending: true })

  if (search) {
    query = query.or(`kanji.ilike.%${search}%,meaning_ko.ilike.%${search}%,reading_on.ilike.%${search}%,reading_kun.ilike.%${search}%`)
  }

  const { data } = await query
  return { items: data ?? [] }
}

export async function getKanjiCount(level: string): Promise<number> {
  const auth = await requireAuth()
  if ('error' in auth) return 0
  const { supabase } = auth

  const { count } = await supabase
    .from('jlpt_kanji')
    .select('id', { count: 'exact', head: true })
    .eq('jlpt_level', level)

  return count ?? 0
}
