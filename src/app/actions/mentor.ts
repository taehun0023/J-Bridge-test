'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdmin, requireAdminOrMentor } from '@/lib/auth-helpers'
import { parseFullName } from '@/lib/name-format'

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

export interface CompExamResult {
  id: string
  category: string
  contentLevel: string | null
  score: number | null
  passed: boolean | null
  status: string
  completedAt: string | null
}

export interface QuizAttemptSummary {
  quizTitle: string
  score: number
  passed: boolean
  completedAt: string
}

export interface MenteeOverview {
  id: string
  full_name: string | null
  avatar_url: string | null
  is_japanese: boolean
  // 5-axis radar scores (0~100)
  radarScores: { jlpt: number; itJapanese: number; coreProgramming: number; framework: number; attitudeCulture: number }
  // Assignment stats
  assignmentsTotal: number
  assignmentsInProgress: number
  assignmentsCompleted: number
  assignmentsOverdue: number
  // Comprehensive exam results (latest per category)
  compExamResults: CompExamResult[]
  // 生活日本語 (seikatsu) で応試した最高 N-level (N1>N5)
  seikatsuExamLevel: 'N1' | 'N2' | 'N3' | 'N4' | 'N5' | null
  // Next exam scheduled date
  nextExamDate: string | null
  // Recent quiz attempts (up to 5)
  recentQuizAttempts: QuizAttemptSummary[]
}

const CYCLE_INTERVAL_DAYS = 14

export async function getMentorDashboardData() {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error, mentees: [] as MenteeOverview[] }
  const { supabase, user } = auth

  // Get assigned mentees
  const { data: assignments } = await supabase
    .from('mentor_mentee_assignments')
    .select('mentee_id')
    .eq('mentor_id', user.id)

  const menteeIds = assignments?.map(a => a.mentee_id) ?? []
  if (menteeIds.length === 0) return { mentees: [] }

  // Parallel queries
  const [
    { data: profiles },
    { data: learningAssignments },
    { data: compExams },
    { data: quizAttempts },
  ] = await Promise.all([
    // 1. Mentee profiles + skills + is_japanese
    supabase
      .from('profiles')
      .select(`
        id, full_name, avatar_url, is_japanese,
        japanese_skills(jlpt_normalized, it_japanese_normalized),
        coding_skills(core_normalized, framework_normalized),
        attitude_culture_skills(attitude_normalized)
      `)
      .in('id', menteeIds),
    // 2. Learning assignments
    supabase
      .from('learning_assignments')
      .select('assigned_to, status')
      .in('assigned_to', menteeIds),
    // 3. Comprehensive exams (completed/failed)
    supabase
      .from('comprehensive_exams')
      .select('id, user_id, category, content_level, score, passed, status, completed_at')
      .in('user_id', menteeIds)
      .in('status', ['completed', 'failed'])
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false }),
    // 4. Recent quiz attempts (latest 5 per mentee)
    supabase
      .from('quiz_attempts')
      .select('user_id, score, passed, completed_at, quizzes(title)')
      .in('user_id', menteeIds)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })
      .limit(menteeIds.length * 5),
  ])

  // Fetch exam cycles for next exam date (needs service role for exam_cycles)
  let examCycles: { user_id: string; completed_at: string | null }[] = []
  const serviceClient = createServiceRoleClient()
  if (serviceClient) {
    const { data } = await serviceClient
      .from('exam_cycles')
      .select('user_id, completed_at')
      .in('user_id', menteeIds)
      .eq('status', 'completed')
      .order('cycle_number', { ascending: false })
    examCycles = data ?? []
  }

  // Build mentee overviews
  const mentees: MenteeOverview[] = (profiles ?? []).map(p => {
    const jpRaw = p.japanese_skills as unknown
    const jp = (Array.isArray(jpRaw) ? jpRaw[0] : jpRaw) as { jlpt_normalized: number; it_japanese_normalized: number } | null
    const csRaw = p.coding_skills as unknown
    const cs = (Array.isArray(csRaw) ? csRaw[0] : csRaw) as { core_normalized: number; framework_normalized: number } | null
    const attRaw = p.attitude_culture_skills as unknown
    const att = (Array.isArray(attRaw) ? attRaw[0] : attRaw) as { attitude_normalized: number } | null

    const userAssignments = learningAssignments?.filter(a => a.assigned_to === p.id) ?? []

    // Comprehensive exam results: latest per category
    const userExams = compExams?.filter(e => e.user_id === p.id) ?? []
    const examByCategory = new Map<string, CompExamResult>()
    for (const e of userExams) {
      if (!examByCategory.has(e.category)) {
        examByCategory.set(e.category, {
          id: e.id,
          category: e.category,
          contentLevel: (e as { content_level?: string | null }).content_level ?? null,
          score: e.score,
          passed: e.passed,
          status: e.status,
          completedAt: e.completed_at,
        })
      }
    }

    // 生活日本語: 応試した最高 N-level (N1>N2>N3>N4>N5)
    const SEIKATSU_LEVEL_RANK: Record<string, number> = { N1: 5, N2: 4, N3: 3, N4: 2, N5: 1 }
    let seikatsuExamLevel: 'N1' | 'N2' | 'N3' | 'N4' | 'N5' | null = null
    let _bestSeikatsuRank = 0
    for (const e of userExams) {
      if (e.category !== 'seikatsu') continue
      const level = (e as { content_level?: string | null }).content_level ?? null
      const rank = SEIKATSU_LEVEL_RANK[level ?? ''] ?? 0
      if (rank > _bestSeikatsuRank) {
        _bestSeikatsuRank = rank
        seikatsuExamLevel = level as 'N1' | 'N2' | 'N3' | 'N4' | 'N5'
      }
    }

    // Next exam date: latest completed cycle's completed_at + 14 days
    const latestCycle = examCycles.find(c => c.user_id === p.id)
    let nextExamDate: string | null = null
    if (latestCycle?.completed_at) {
      const completedDate = new Date(latestCycle.completed_at)
      nextExamDate = new Date(completedDate.getTime() + CYCLE_INTERVAL_DAYS * 24 * 60 * 60 * 1000).toISOString()
    }

    // Recent quiz attempts (latest 5 for this user)
    const userQuizzes = (quizAttempts?.filter(q => q.user_id === p.id) ?? []).slice(0, 5)
    const recentQuizAttempts: QuizAttemptSummary[] = userQuizzes.map(q => ({
      quizTitle: ((Array.isArray(q.quizzes) ? q.quizzes[0] : q.quizzes) as { title: string } | null)?.title ?? 'クイズ',
      score: q.score as number,
      passed: q.passed as boolean,
      completedAt: q.completed_at as string,
    }))

    return {
      id: p.id,
      full_name: p.full_name,
      avatar_url: p.avatar_url,
      is_japanese: (p as unknown as { is_japanese: boolean }).is_japanese ?? false,
      radarScores: {
        jlpt: jp?.jlpt_normalized ?? 0,
        itJapanese: jp?.it_japanese_normalized ?? 0,
        coreProgramming: cs?.core_normalized ?? 0,
        framework: cs?.framework_normalized ?? 0,
        attitudeCulture: att?.attitude_normalized ?? 0,
      },
      assignmentsTotal: userAssignments.length,
      assignmentsInProgress: userAssignments.filter(a => a.status === 'in_progress').length,
      assignmentsCompleted: userAssignments.filter(a => a.status === 'completed').length,
      assignmentsOverdue: userAssignments.filter(a => a.status === 'overdue').length,
      compExamResults: Array.from(examByCategory.values()),
      seikatsuExamLevel,
      nextExamDate,
      recentQuizAttempts,
    }
  })

  // 멘티 이름순 정렬 (카타카나 후리가나 우선, 없으면 본명) — 아이우에오/가나다 빠른순
  mentees.sort((a, b) => {
    const an = parseFullName(a.full_name)
    const bn = parseFullName(b.full_name)
    return (an.kana ?? an.kanji).localeCompare(bn.kana ?? bn.kanji, 'ja')
  })

  return { mentees }
}
