import { createClient } from '@/lib/supabase/server'
import type { JlptLevel } from '@/lib/supabase/types'

export async function fetchJlptVocabulary(
  level: JlptLevel,
  options?: { search?: string; partOfSpeech?: string; limit?: number; offset?: number }
) {
  const supabase = await createClient()
  let query = supabase
    .from('jlpt_vocabulary')
    .select('*', { count: 'exact' })
    .eq('jlpt_level', level)
    .order('created_at', { ascending: true })

  if (options?.search) {
    query = query.or(`word.ilike.%${options.search}%,reading.ilike.%${options.search}%,meaning_ko.ilike.%${options.search}%`)
  }
  if (options?.partOfSpeech) {
    query = query.eq('part_of_speech', options.partOfSpeech)
  }
  if (options?.limit) {
    query = query.limit(options.limit)
  }
  if (options?.offset) {
    query = query.range(options.offset, options.offset + (options.limit ?? 20) - 1)
  }

  return query
}

export async function fetchItGlossary(
  category?: string,
  options?: { search?: string; limit?: number; offset?: number }
) {
  const supabase = await createClient()
  let query = supabase
    .from('it_glossary')
    .select('*', { count: 'exact' })
    .order('term_ja', { ascending: true })

  if (category) {
    query = query.eq('category', category)
  }
  if (options?.search) {
    query = query.or(`term_ja.ilike.%${options.search}%,term_ko.ilike.%${options.search}%,term_en.ilike.%${options.search}%`)
  }
  if (options?.limit) {
    query = query.limit(options.limit)
  }
  if (options?.offset) {
    query = query.range(options.offset, options.offset + (options.limit ?? 20) - 1)
  }

  return query
}
