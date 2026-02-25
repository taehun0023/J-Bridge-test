'use server'

import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdmin, requireAdminOrMentor } from '@/lib/auth-helpers'

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

export interface MenteeOverview {
  id: string
  full_name: string | null
  avatar_url: string | null
  // Category progress (percentage)
  jlptProgress: number
  itJapaneseProgress: number
  csProgress: number
  devProgress: number
  businessLitProgress: number
  // Assignment stats
  assignmentsInProgress: number
  assignmentsCompleted: number
  assignmentsOverdue: number
  // Recent exam
  recentExamTitle: string | null
  recentExamScore: number | null
  recentExamPassed: boolean | null
}

export async function getMentorDashboardData() {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error, mentees: [] as MenteeOverview[], pendingVocabCount: 0 }
  const { supabase, user } = auth

  // Get assigned mentees
  const { data: assignments } = await supabase
    .from('mentor_mentee_assignments')
    .select('mentee_id')
    .eq('mentor_id', user.id)

  const menteeIds = assignments?.map(a => a.mentee_id) ?? []
  if (menteeIds.length === 0) return { mentees: [], pendingVocabCount: 0 }

  // Fetch mentee profiles
  const { data: profiles } = await supabase
    .from('profiles')
    .select(`
      id, full_name, avatar_url,
      japanese_skills(jlpt_normalized, it_japanese_normalized),
      coding_skills(core_normalized, framework_normalized),
      attitude_culture_skills(attitude_normalized)
    `)
    .in('id', menteeIds)

  // Fetch learning assignments for all mentees
  const { data: learningAssignments } = await supabase
    .from('learning_assignments')
    .select('assigned_to, status')
    .in('assigned_to', menteeIds)

  // Fetch recent exams for all mentees
  const { data: recentExams } = await supabase
    .from('quiz_attempts')
    .select('user_id, score, passed, completed_at, quizzes(title)')
    .in('user_id', menteeIds)
    .not('completed_at', 'is', null)
    .order('completed_at', { ascending: false })
    .limit(menteeIds.length * 2)

  // Build mentee overviews
  const mentees: MenteeOverview[] = (profiles ?? []).map(p => {
    const jpRaw = p.japanese_skills as unknown
    const jp = (Array.isArray(jpRaw) ? jpRaw[0] : jpRaw) as { jlpt_normalized: number; it_japanese_normalized: number } | null
    const csRaw = p.coding_skills as unknown
    const cs = (Array.isArray(csRaw) ? csRaw[0] : csRaw) as { core_normalized: number; framework_normalized: number } | null
    const attRaw = p.attitude_culture_skills as unknown
    const att = (Array.isArray(attRaw) ? attRaw[0] : attRaw) as { attitude_normalized: number } | null

    const userAssignments = learningAssignments?.filter(a => a.assigned_to === p.id) ?? []
    const recentExam = recentExams?.find(e => e.user_id === p.id)

    return {
      id: p.id,
      full_name: p.full_name,
      avatar_url: p.avatar_url,
      jlptProgress: jp?.jlpt_normalized ?? 0,
      itJapaneseProgress: jp?.it_japanese_normalized ?? 0,
      csProgress: cs?.core_normalized ?? 0,
      devProgress: cs?.framework_normalized ?? 0,
      businessLitProgress: att?.attitude_normalized ?? 0,
      assignmentsInProgress: userAssignments.filter(a => a.status === 'in_progress').length,
      assignmentsCompleted: userAssignments.filter(a => a.status === 'completed').length,
      assignmentsOverdue: userAssignments.filter(a => a.status === 'overdue').length,
      recentExamTitle: recentExam ? (((Array.isArray(recentExam.quizzes) ? recentExam.quizzes[0] : recentExam.quizzes) as { title: string } | null)?.title ?? null) : null,
      recentExamScore: recentExam?.score ?? null,
      recentExamPassed: recentExam?.passed ?? null,
    }
  })

  // Count pending shared vocab (for jp mentors)
  const { count: pendingVocabCount } = await supabase
    .from('shared_vocab_submissions')
    .select('id', { count: 'exact', head: true })
    .eq('status', 'pending')

  return { mentees, pendingVocabCount: pendingVocabCount ?? 0 }
}
