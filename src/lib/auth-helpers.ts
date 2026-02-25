import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { ERR } from '@/lib/action-types'

export type MentorSpecialty = 'japanese' | 'technical'

export async function requireAuth() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: ERR.AUTH_REQUIRED } as const
  return { supabase, user } as const
}

export async function requireAdmin() {
  const result = await requireAuth()
  if ('error' in result) return { error: result.error } as const
  const { supabase, user } = result

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') return { error: ERR.FORBIDDEN } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING } as const

  return { supabase, serviceClient, user } as const
}

export async function requireAdminOrMentor() {
  const result = await requireAuth()
  if ('error' in result) return { error: result.error } as const
  const { supabase, user } = result

  const { data: profile } = await supabase
    .from('profiles')
    .select('role, mentor_specialty')
    .eq('id', user.id)
    .single()

  if (!profile || (profile.role !== 'admin' && profile.role !== 'mentor'))
    return { error: ERR.FORBIDDEN } as const

  return { supabase, user, profile: profile as { role: string; mentor_specialty: MentorSpecialty | null } } as const
}

export async function requireAdminOrJpMentor() {
  const result = await requireAdminOrMentor()
  if ('error' in result) return result

  const { profile } = result
  // Admin always has access. Mentor needs japanese specialty (or unset = all access)
  if (profile.role === 'mentor' && profile.mentor_specialty !== null && profile.mentor_specialty !== 'japanese') {
    return { error: ERR.FORBIDDEN } as const
  }

  return result
}

export async function requireAdminOrTechMentor() {
  const result = await requireAdminOrMentor()
  if ('error' in result) return result

  const { profile } = result
  // Admin always has access. Mentor needs technical specialty (or unset = all access)
  if (profile.role === 'mentor' && profile.mentor_specialty !== null && profile.mentor_specialty !== 'technical') {
    return { error: ERR.FORBIDDEN } as const
  }

  return result
}
