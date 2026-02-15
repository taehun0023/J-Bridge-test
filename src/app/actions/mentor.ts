'use server'

import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdmin } from '@/lib/auth-helpers'

export async function assignMenteeToMentor(mentorId: string, menteeId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { error } = await supabase
    .from('mentor_mentee_assignments')
    .insert({
      mentor_id: mentorId,
      mentee_id: menteeId,
      assigned_by: user.id,
    })

  if (error) return { error: error.message }
  revalidatePath('/admin/mentors')
  return { success: true }
}

export async function removeMenteeFromMentor(mentorId: string, menteeId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  const { error } = await supabase
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
