'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { recalculateUserScores } from '@/modules/scoring'
import { notifyMentorsOf, notifyAdmins, getUserDisplayName } from '@/lib/notification-helpers'
import { COMP_EXAM_CATEGORY_TO_STEP, ASSESSMENT_TIME_LIMITS, ASSESSMENT_TOTAL_QUESTIONS } from '@/lib/assessment-config'

/** Categories for comprehensive exam cycles */
const JAPANESE_EXAM_CATEGORIES = ['cs', 'dev', 'business-lit'] as const
/** First cycle for non-Japanese: only Japanese language exams are mandatory */
const FIRST_CYCLE_NON_JAPANESE = ['seikatsu', 'business-jp'] as const

/** Cycle deadline: 14 days from scheduled date */
const CYCLE_INTERVAL_DAYS = 14

export interface ExamCycleInfo {
  id: string
  cycleNumber: number
  status: string
  scheduledAt: string
  deadlineAt: string
  exams: CycleExam[]
}

export interface CycleExam {
  id: string
  category: string
  subcategory: string
  status: string
  score: number | null
  passed: boolean | null
}

/**
 * Check for active exam cycle or create one if needed.
 * Called from dashboard page for mentees.
 *
 * Returns null if no exam is needed (dashboard can be shown).
 * Returns ExamCycleInfo if an exam gate should be displayed.
 */
export async function checkAndCreateExamCycle(
  userId: string,
  isJapanese: boolean
): Promise<ExamCycleInfo | null> {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return null

  // Japanese users skip the exam gate entirely — go straight to dashboard
  if (isJapanese) return null

  // 1. Check for active (pending/in_progress) cycle
  const { data: activeCycle } = await serviceClient
    .from('exam_cycles')
    .select('*')
    .eq('user_id', userId)
    .in('status', ['pending', 'in_progress'])
    .order('cycle_number', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (activeCycle) {
    // Find cycle exams by user_id + subcategory + timestamp (NOT by exam_cycle_id FK).
    // PostgREST schema cache may not recognize exam_cycle_id column, causing FK queries
    // to silently return 0 results and triggering infinite self-healing loops.
    const { data: allExams } = await serviceClient
      .from('comprehensive_exams')
      .select('id, category, subcategory, status, score, passed')
      .eq('user_id', userId)
      .eq('subcategory', 'comprehensive')
      .gte('requested_at', activeCycle.created_at)
      .order('requested_at', { ascending: true })

    // Deduplicate by category: if self-healing previously created duplicates,
    // keep the exam with the highest-priority status per category.
    const STATUS_PRIORITY: Record<string, number> = { completed: 5, failed: 4, in_progress: 3, approved: 2, requested: 1 }
    const byCategory = new Map<string, NonNullable<typeof allExams>[number]>()
    for (const e of allExams ?? []) {
      const existing = byCategory.get(e.category)
      if (!existing || (STATUS_PRIORITY[e.status] ?? 0) > (STATUS_PRIORITY[existing.status] ?? 0)) {
        byCategory.set(e.category, e)
      }
    }
    let exams = Array.from(byCategory.values())

    // If truly no exams found (first insert failed), recreate
    if (exams.length === 0) {
      const newExams = await createCycleExams(serviceClient, userId, activeCycle.id, isJapanese, activeCycle.cycle_number)
      return {
        id: activeCycle.id,
        cycleNumber: activeCycle.cycle_number,
        status: activeCycle.status,
        scheduledAt: activeCycle.scheduled_at,
        deadlineAt: activeCycle.deadline_at,
        exams: newExams,
      }
    }

    return {
      id: activeCycle.id,
      cycleNumber: activeCycle.cycle_number,
      status: activeCycle.status,
      scheduledAt: activeCycle.scheduled_at,
      deadlineAt: activeCycle.deadline_at,
      exams: exams.map(e => ({
        id: e.id,
        category: e.category,
        subcategory: e.subcategory,
        status: e.status,
        score: e.score,
        passed: e.passed,
      })),
    }
  }

  // 2. Check last completed cycle
  const { data: lastCompleted } = await serviceClient
    .from('exam_cycles')
    .select('*')
    .eq('user_id', userId)
    .eq('status', 'completed')
    .order('cycle_number', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (!lastCompleted) {
    // No cycle at all — create first one (cycle_number=1)
    return await createExamCycle(serviceClient, userId, 1, isJapanese)
  }

  // Check if 14 days have passed since last completion (date-only comparison, ignoring time)
  const completedAt = new Date(lastCompleted.completed_at ?? lastCompleted.created_at)
  const completedDateOnly = new Date(completedAt.getFullYear(), completedAt.getMonth(), completedAt.getDate())
  const todayDateOnly = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate())
  const daysSinceCompletion = (todayDateOnly.getTime() - completedDateOnly.getTime()) / (1000 * 60 * 60 * 24)

  if (daysSinceCompletion >= CYCLE_INTERVAL_DAYS) {
    // Time for a new cycle
    const newCycleNumber = lastCompleted.cycle_number + 1
    return await createExamCycle(serviceClient, userId, newCycleNumber, isJapanese)
  }

  // Not time yet — no gate needed
  return null
}

/**
 * Create comprehensive_exam records for a cycle.
 */
async function createCycleExams(
  serviceClient: ReturnType<typeof createServiceRoleClient> & object,
  userId: string,
  cycleId: string,
  isJapanese: boolean,
  cycleNumber: number = 1
): Promise<CycleExam[]> {
  // Japanese users never reach here (gated in checkAndCreateExamCycle).
  // Non-Japanese: seikatsu + business-jp only (all cycles).
  const categories = isJapanese
    ? JAPANESE_EXAM_CATEGORIES
    : FIRST_CYCLE_NON_JAPANESE

  const examInserts = categories.map(category => {
    const step = COMP_EXAM_CATEGORY_TO_STEP[category]
    return {
      user_id: userId,
      category,
      subcategory: 'comprehensive',
      status: 'requested',
      exam_cycle_id: cycleId,
      time_limit_minutes: step ? ASSESSMENT_TIME_LIMITS[step] : 30,
      total_questions: step ? ASSESSMENT_TOTAL_QUESTIONS[step] : 30,
      passing_score: 70,
    }
  })

  const { data: exams } = await serviceClient
    .from('comprehensive_exams')
    .insert(examInserts)
    .select('id, category, subcategory, status, score, passed')

  // Notify mentors/admins about pending exam approval
  const userName = await getUserDisplayName(userId)
  await Promise.all([
    notifyMentorsOf(
      userId,
      'exam_requested',
      `${userName}さんが総合試験（第${cycleNumber}回）の承認を待っています`,
      undefined,
      '/admin/tasks'
    ),
    notifyAdmins(
      'exam_requested',
      `${userName}さんが総合試験（第${cycleNumber}回）の承認を待っています`,
      undefined,
      '/admin/tasks'
    ),
  ])

  return (exams ?? []).map(e => ({
    id: e.id,
    category: e.category,
    subcategory: e.subcategory,
    status: e.status,
    score: e.score,
    passed: e.passed,
  }))
}

/**
 * Create a new exam cycle with all category exams.
 */
async function createExamCycle(
  serviceClient: ReturnType<typeof createServiceRoleClient> & object,
  userId: string,
  cycleNumber: number,
  isJapanese: boolean
): Promise<ExamCycleInfo | null> {
  const now = new Date()
  const deadline = new Date(now.getTime() + CYCLE_INTERVAL_DAYS * 24 * 60 * 60 * 1000)

  // Create cycle
  const { data: cycle } = await serviceClient
    .from('exam_cycles')
    .insert({
      user_id: userId,
      cycle_number: cycleNumber,
      status: 'pending',
      scheduled_at: now.toISOString(),
      deadline_at: deadline.toISOString(),
    })
    .select('*')
    .single()

  if (!cycle) {
    return null
  }

  // Create comprehensive_exam records
  const exams = await createCycleExams(serviceClient, userId, cycle.id, isJapanese, cycleNumber)

  return {
    id: cycle.id,
    cycleNumber: cycle.cycle_number,
    status: cycle.status,
    scheduledAt: cycle.scheduled_at,
    deadlineAt: cycle.deadline_at,
    exams,
  }
}

/**
 * Check if all exams in a cycle are done, and if so mark cycle as completed.
 * Uses timestamp-based query (not exam_cycle_id FK) for reliability.
 */
async function completeExamCycle(cycleId: string, userId: string, cycleCreatedAt: string): Promise<boolean> {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return false

  // Find cycle exams by timestamp (not FK — PostgREST schema cache issue)
  const { data: allExams } = await serviceClient
    .from('comprehensive_exams')
    .select('id, category, status')
    .eq('user_id', userId)
    .eq('subcategory', 'comprehensive')
    .gte('requested_at', cycleCreatedAt)
    .order('requested_at', { ascending: true })

  // Deduplicate by category (keep highest-priority status)
  const STATUS_PRIORITY: Record<string, number> = { completed: 4, failed: 3, in_progress: 2, approved: 1 }
  const byCategory = new Map<string, NonNullable<typeof allExams>[number]>()
  for (const e of allExams ?? []) {
    const existing = byCategory.get(e.category)
    if (!existing || (STATUS_PRIORITY[e.status] ?? 0) > (STATUS_PRIORITY[existing.status] ?? 0)) {
      byCategory.set(e.category, e)
    }
  }
  const exams = Array.from(byCategory.values())

  if (exams.length === 0) return false

  // Check if all exams are completed or failed
  const allDone = exams.every(e => e.status === 'completed' || e.status === 'failed')
  if (!allDone) return false

  // Mark cycle as completed
  await serviceClient
    .from('exam_cycles')
    .update({
      status: 'completed',
      completed_at: new Date().toISOString(),
    })
    .eq('id', cycleId)

  await recalculateUserScores(userId)

  // NOTE: No revalidatePath here — it would cause the calling page's server component
  // to re-render. Dashboard gets fresh data via full page navigation.
  return true
}

/**
 * Find the active cycle for a user and check if it's complete.
 * Called from submitExam — doesn't rely on exam.exam_cycle_id.
 */
export async function tryCompleteActiveCycle(userId: string): Promise<boolean> {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return false

  const { data: activeCycle } = await serviceClient
    .from('exam_cycles')
    .select('id, user_id, created_at')
    .eq('user_id', userId)
    .in('status', ['pending', 'in_progress'])
    .order('cycle_number', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (!activeCycle) return false

  return completeExamCycle(activeCycle.id, userId, activeCycle.created_at)
}

/**
 * Reset the last completed cycle's completed_at to now.
 * Called when a retake exam is completed outside of a cycle,
 * so the next auto-cycle starts 14 days from the retake date.
 */
export async function resetCycleCompletedAt(userId: string): Promise<void> {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return

  // Only update if there's no active cycle (retake happened outside a cycle)
  const { data: activeCycle } = await serviceClient
    .from('exam_cycles')
    .select('id')
    .eq('user_id', userId)
    .in('status', ['pending', 'in_progress'])
    .limit(1)
    .maybeSingle()

  if (activeCycle) return // Active cycle exists, don't reset

  const { data: lastCompleted } = await serviceClient
    .from('exam_cycles')
    .select('id')
    .eq('user_id', userId)
    .eq('status', 'completed')
    .order('cycle_number', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (!lastCompleted) return

  await serviceClient
    .from('exam_cycles')
    .update({ completed_at: new Date().toISOString() })
    .eq('id', lastCompleted.id)
}

/**
 * Get the next scheduled exam date for a user.
 */
export async function getNextExamDate(userId: string): Promise<string | null> {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return null

  const { data: lastCompleted } = await serviceClient
    .from('exam_cycles')
    .select('completed_at')
    .eq('user_id', userId)
    .eq('status', 'completed')
    .order('cycle_number', { ascending: false })
    .limit(1)
    .maybeSingle()

  if (!lastCompleted?.completed_at) return null

  // Date-only calculation: next exam available at the start of the day, 14 days after completion date
  const completedDate = new Date(lastCompleted.completed_at)
  const nextDateOnly = new Date(completedDate.getFullYear(), completedDate.getMonth(), completedDate.getDate() + CYCLE_INTERVAL_DAYS)
  return nextDateOnly.toISOString()
}
