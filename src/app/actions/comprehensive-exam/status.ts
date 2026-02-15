'use server'

import { requireAuth } from '@/lib/auth-helpers'

export async function getExamStatus(examId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  const { data, error } = await supabase
    .from('comprehensive_exams')
    .select('*')
    .eq('id', examId)
    .single()

  if (error) return { error: error.message }
  return { exam: data }
}
