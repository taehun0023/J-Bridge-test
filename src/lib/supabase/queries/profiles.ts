import { createClient } from '@/lib/supabase/server'

export async function fetchProfile(userId: string) {
  const supabase = await createClient()
  return supabase
    .from('profiles')
    .select('*')
    .eq('id', userId)
    .single()
}

export async function fetchJapaneseSkills(userId: string) {
  const supabase = await createClient()
  return supabase
    .from('japanese_skills')
    .select('*')
    .eq('user_id', userId)
    .single()
}

export async function fetchCodingSkills(userId: string) {
  const supabase = await createClient()
  return supabase
    .from('coding_skills')
    .select('*')
    .eq('user_id', userId)
    .single()
}

export async function fetchAttitudeCultureSkills(userId: string) {
  const supabase = await createClient()
  return supabase
    .from('attitude_culture_skills')
    .select('*')
    .eq('user_id', userId)
    .single()
}

export async function fetchDispatchReadiness(userId: string) {
  const supabase = await createClient()
  return supabase
    .from('dispatch_readiness_scores')
    .select('*')
    .eq('user_id', userId)
    .order('recorded_at', { ascending: false })
    .limit(1)
    .single()
}
