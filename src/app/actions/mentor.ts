'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'

async function getAdminContext() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: 'Not authenticated' as const }

  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  if (profile?.role !== 'admin') return { error: 'Not authorized' as const }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' as const }

  return { supabase, serviceClient, adminId: user.id }
}

export async function assignMenteeToMentor(mentorId: string, menteeId: string) {
  const ctx = await getAdminContext()
  if ('error' in ctx) return { error: ctx.error }

  const { error } = await ctx.serviceClient
    .from('mentor_mentee_assignments')
    .insert({
      mentor_id: mentorId,
      mentee_id: menteeId,
      assigned_by: ctx.adminId,
    })

  if (error) return { error: error.message }
  revalidatePath('/admin/mentors')
  return { success: true }
}

export async function removeMenteeFromMentor(mentorId: string, menteeId: string) {
  const ctx = await getAdminContext()
  if ('error' in ctx) return { error: ctx.error }

  const { error } = await ctx.serviceClient
    .from('mentor_mentee_assignments')
    .delete()
    .eq('mentor_id', mentorId)
    .eq('mentee_id', menteeId)

  if (error) return { error: error.message }
  revalidatePath('/admin/mentors')
  return { success: true }
}

export async function getMenteeProgress(menteeId: string) {
  const supabase = await createClient()

  const { data } = await supabase
    .from('learning_assignments')
    .select('*')
    .eq('assigned_to', menteeId)
    .order('created_at', { ascending: false })

  return { assignments: data ?? [] }
}
