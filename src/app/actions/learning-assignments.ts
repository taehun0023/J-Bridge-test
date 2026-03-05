'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth, requireAdminOrMentor } from '@/lib/auth-helpers'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'
import { createNotification } from './notifications'
import { getUserDisplayName } from '@/lib/notification-helpers'
import { logAuditEvent } from '@/app/actions/audit'
import { ERR } from '@/lib/action-types'
import { getCoursesWithProgress } from '@/lib/course-progress'

/**
 * Dynamically resolve quiz IDs for a given assignment's category/subcategory/level.
 * Always queries the quizzes table for the latest state.
 */
export async function resolveQuizIdsForAssignment(
  category: string,
  subcategory: string,
  contentLevel: string | null,
  client: Awaited<ReturnType<typeof createClient>> | NonNullable<ReturnType<typeof createServiceRoleClient>>,
): Promise<string[]> {
  const catConfig = ASSIGNMENT_CATEGORIES[category]
  if (!catConfig) return []

  const isLevelOnly = catConfig.levelOnly === true

  if (isLevelOnly && catConfig.quizTypes) {
    let query = client
      .from('quizzes')
      .select('id')
      .in('quiz_type', catConfig.quizTypes)
      .eq('is_pool', true)

    if (contentLevel) {
      query = query.ilike('title', `${contentLevel}%`)
    }

    const { data } = await query.order('created_at')
    return (data ?? []).map(q => q.id)
  }

  const subcatConfig = catConfig.subcategories[subcategory]
  if (!subcatConfig) return []

  if (subcatConfig.courseSubcategory && contentLevel) {
    const { data: courses } = await client
      .from('courses')
      .select('id')
      .eq('subcategory', subcatConfig.courseSubcategory)
      .eq('difficulty', contentLevel)
      .eq('is_published', true)

    if (courses?.length) {
      const courseIds = courses.map(c => c.id)
      const { data: lessons } = await client
        .from('lessons')
        .select('id')
        .in('course_id', courseIds)

      if (lessons?.length) {
        const lessonIds = lessons.map(l => l.id)
        const { data: quizzes } = await client
          .from('quizzes')
          .select('id')
          .in('lesson_id', lessonIds)
          .order('created_at')

        return (quizzes ?? []).map(q => q.id)
      }
    }
    return []
  }

  if (subcatConfig.quizType) {
    let query = client
      .from('quizzes')
      .select('id')
      .eq('quiz_type', subcatConfig.quizType)

    if (category === 'business-jp') {
      query = query.eq('is_pool', true)
    }

    if (contentLevel) {
      query = query.eq('content_level', contentLevel)
    }

    if (subcatConfig.titlePatterns?.length) {
      const orFilter = subcatConfig.titlePatterns
        .map(p => `title.ilike.${p}`)
        .join(',')
      query = query.or(orFilter)
    }

    const { data } = await query.order('created_at')
    return (data ?? []).map(q => q.id)
  }

  return []
}

export async function createLearningAssignment(formData: FormData) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const assignedTo = formData.get('assigned_to') as string
  const category = formData.get('category') as string
  const subcategory = formData.get('subcategory') as string
  const contentLevel = formData.get('content_level') as string || null
  const title = formData.get('title') as string
  const description = formData.get('description') as string || null
  const dueDate = formData.get('due_date') as string || null

  const catConfig = ASSIGNMENT_CATEGORIES[category]
  const isLevelOnly = catConfig?.levelOnly === true

  if (!assignedTo || !category || !title) {
    return { error: '必須フィールドをすべて入力してください' }
  }
  if (!isLevelOnly && !subcategory) {
    return { error: 'サブカテゴリを選択してください' }
  }
  if (isLevelOnly && !contentLevel) {
    return { error: 'レベルを選択してください' }
  }

  // Find matching quizzes based on category/subcategory/level
  const queryClient = createServiceRoleClient() ?? supabase
  const requiredQuizIds = await resolveQuizIdsForAssignment(category, subcategory, contentLevel, queryClient)

  const { data, error } = await supabase
    .from('learning_assignments')
    .insert({
      assigned_by: user.id,
      assigned_to: assignedTo,
      category,
      subcategory,
      content_level: contentLevel,
      title,
      description,
      due_date: dueDate ? new Date(dueDate).toISOString() : null,
      required_quiz_ids: requiredQuizIds,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  await logAuditEvent(user.id, 'create', 'learning_assignments', data.id, null, { assigned_to: assignedTo, title, category })

  // Send notification to assignee
  await createNotification(
    assignedTo,
    'task_assigned',
    `新しい学習課題: ${title}`,
    description ?? undefined,
    '/dashboard/assignments',
    data.id
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

export async function getLearningAssignments(userId?: string) {
  const supabase = await createClient()

  let query = supabase
    .from('learning_assignments')
    .select('*, assignee:profiles!learning_assignments_assigned_to_fkey(full_name, email)')
    .order('created_at', { ascending: false })

  if (userId) {
    query = query.eq('assigned_to', userId)
  }

  const { data, error } = await query.limit(100)

  if (error) return { assignments: [], error: error.message }
  return { assignments: data ?? [] }
}

export async function getMyLearningAssignments() {
  const auth = await requireAuth()
  if ('error' in auth) return { assignments: [] }
  const { supabase, user } = auth

  const { data, error } = await supabase
    .from('learning_assignments')
    .select('*')
    .eq('assigned_to', user.id)
    .order('created_at', { ascending: false })

  if (error) return { assignments: [], error: error.message }
  return { assignments: data ?? [] }
}

export async function checkAssignmentProgress(userId: string, quizId: string) {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) {
    console.warn('[checkAssignmentProgress] Service role client unavailable — assignment status will not be updated')
    return
  }

  // Find assignments that include this quiz in required_quiz_ids
  const { data: assignments } = await serviceClient
    .from('learning_assignments')
    .select('*')
    .eq('assigned_to', userId)
    .in('status', ['pending', 'in_progress'])
    .contains('required_quiz_ids', [quizId])

  if (!assignments || assignments.length === 0) return

  for (const assignment of assignments) {
    const passedIds = new Set(assignment.passed_quiz_ids ?? [])
    passedIds.add(quizId)
    const newPassedIds = Array.from(passedIds)

    const allCompleted = (assignment.required_quiz_ids ?? []).every(
      (id: string) => passedIds.has(id)
    )

    const updateData: Record<string, unknown> = {
      passed_quiz_ids: newPassedIds,
      status: allCompleted ? 'completed' : 'in_progress',
    }

    if (allCompleted) {
      updateData.completed_at = new Date().toISOString()
    }

    await serviceClient
      .from('learning_assignments')
      .update(updateData)
      .eq('id', assignment.id)

    if (allCompleted) {
      const userName = await getUserDisplayName(userId)
      await createNotification(
        assignment.assigned_by,
        'assignment_completed',
        `${userName}さんが学習課題を完了: ${assignment.title}`,
        undefined,
        '/admin/tasks',
        assignment.id
      )
    }
  }
}

export async function confirmAssignment(assignmentId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { data: assignment } = await supabase
    .from('learning_assignments')
    .select('assigned_to, title, status')
    .eq('id', assignmentId)
    .single()

  if (!assignment) return { error: '課題が見つかりません' }
  if (assignment.status !== 'awaiting_confirmation') return { error: 'この課題は確認待ち状態ではありません' }

  const { error } = await supabase
    .from('learning_assignments')
    .update({
      status: 'completed',
      confirmed_by: user.id,
      confirmed_at: new Date().toISOString(),
      completed_at: new Date().toISOString(),
    })
    .eq('id', assignmentId)

  if (error) return { error: error.message }

  await logAuditEvent(user.id, 'approve', 'learning_assignments', assignmentId, { status: assignment.status }, { status: 'completed' })

  // Notify the mentee that the assignment has been confirmed
  await createNotification(
    assignment.assigned_to,
    'assignment_confirmed',
    `学習課題「${assignment.title}」の完了が確認されました`,
    undefined,
    '/dashboard/assignments',
    assignmentId
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

export async function deleteLearningAssignment(assignmentId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Fetch old data for audit
  const { data: oldData } = await supabase
    .from('learning_assignments')
    .select('*')
    .eq('id', assignmentId)
    .single()

  const { error } = await supabase
    .from('learning_assignments')
    .delete()
    .eq('id', assignmentId)

  if (error) return { error: error.message }

  await logAuditEvent(user.id, 'delete', 'learning_assignments', assignmentId, oldData, null)

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

// ─── Overdue detection & actions ───

export async function detectAndMarkOverdue() {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return

  const now = new Date().toISOString()

  const { data: overdueAssignments } = await serviceClient
    .from('learning_assignments')
    .select('id, assigned_by, assigned_to, title')
    .in('status', ['pending', 'in_progress', 'awaiting_confirmation'])
    .lt('due_date', now)
    .not('due_date', 'is', null)

  if (!overdueAssignments?.length) return

  for (const assignment of overdueAssignments) {
    await serviceClient
      .from('learning_assignments')
      .update({ status: 'overdue' })
      .eq('id', assignment.id)

    const menteeName = await getUserDisplayName(assignment.assigned_to)

    // Notify assigner
    await createNotification(
      assignment.assigned_by,
      'assignment_overdue',
      `${menteeName}さんの課題「${assignment.title}」が期限超過`,
      undefined,
      '/admin/tasks',
      assignment.id
    )

    // Notify mentee
    await createNotification(
      assignment.assigned_to,
      'assignment_overdue',
      `学習課題「${assignment.title}」が期限を超過しました`,
      '遅延理由を提出してください',
      '/dashboard/assignments',
      assignment.id
    )
  }
}

export async function submitOverdueReason(assignmentId: string, reason: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  if (!reason.trim()) return { error: ERR.REQUIRED_FIELDS }

  const { data: assignment } = await supabase
    .from('learning_assignments')
    .select('assigned_to, assigned_by, title, status')
    .eq('id', assignmentId)
    .single()

  if (!assignment) return { error: ERR.NOT_FOUND }
  if (assignment.assigned_to !== user.id) return { error: ERR.FORBIDDEN }
  if (assignment.status !== 'overdue') return { error: 'この課題は期限超過状態ではありません' }

  // Use service role for UPDATE since mentee may lack UPDATE RLS policy
  const updateClient = createServiceRoleClient() ?? supabase
  const { error } = await updateClient
    .from('learning_assignments')
    .update({
      overdue_reason: reason.trim(),
      overdue_reason_at: new Date().toISOString(),
    })
    .eq('id', assignmentId)

  if (error) return { error: error.message }

  const userName = await getUserDisplayName(user.id)
  await createNotification(
    assignment.assigned_by,
    'assignment_overdue',
    `${userName}さんが遅延理由を提出: ${assignment.title}`,
    reason.trim(),
    '/admin/tasks',
    assignmentId
  )

  revalidatePath('/dashboard/assignments')
  revalidatePath('/admin/tasks')
  return { success: true }
}

export async function reassignAssignment(assignmentId: string, newDueDate: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  if (!newDueDate) return { error: ERR.REQUIRED_FIELDS }

  const { data: assignment } = await supabase
    .from('learning_assignments')
    .select('assigned_to, title, status, due_date')
    .eq('id', assignmentId)
    .single()

  if (!assignment) return { error: ERR.NOT_FOUND }

  const { error } = await supabase
    .from('learning_assignments')
    .update({
      status: 'in_progress',
      due_date: new Date(newDueDate).toISOString(),
      overdue_reason: null,
      overdue_reason_at: null,
    })
    .eq('id', assignmentId)

  if (error) return { error: error.message }

  await logAuditEvent(user.id, 'update', 'learning_assignments', assignmentId, { status: assignment.status, due_date: assignment.due_date }, { status: 'in_progress', due_date: newDueDate })

  await createNotification(
    assignment.assigned_to,
    'assignment_reassigned',
    `学習課題「${assignment.title}」が再配信されました`,
    `新しい期限: ${new Date(newDueDate).toLocaleDateString('ja-JP')}`,
    '/dashboard/assignments',
    assignmentId
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

export async function cancelAssignment(assignmentId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { data: assignment } = await supabase
    .from('learning_assignments')
    .select('assigned_to, title')
    .eq('id', assignmentId)
    .single()

  if (!assignment) return { error: ERR.NOT_FOUND }

  const { error } = await supabase
    .from('learning_assignments')
    .delete()
    .eq('id', assignmentId)

  if (error) return { error: error.message }

  await logAuditEvent(user.id, 'delete', 'learning_assignments', assignmentId, { title: assignment.title, assigned_to: assignment.assigned_to }, null)

  await createNotification(
    assignment.assigned_to,
    'assignment_cancelled',
    `学習課題「${assignment.title}」がキャンセルされました`,
    undefined,
    '/dashboard/assignments'
  )

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}

// ─── Auto-detect learning progress → update pending to in_progress ───

export async function updateLearningStatuses() {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return

  // Find all pending assignments
  const { data: pendingAssignments } = await serviceClient
    .from('learning_assignments')
    .select('id, assigned_to, category, subcategory, content_level')
    .eq('status', 'pending')

  if (!pendingAssignments?.length) return

  const userIds = [...new Set(pendingAssignments.map(a => a.assigned_to))]

  // Fetch all mastered items for these users
  const { data: allMastered } = await serviceClient
    .from('user_mastered_items')
    .select('user_id, item_type, item_id')
    .in('user_id', userIds)

  const userMastery = new Map<string, Set<string>>()
  for (const m of allMastered ?? []) {
    const key = `${m.user_id}:${m.item_type}`
    if (!userMastery.has(key)) userMastery.set(key, new Set())
    userMastery.get(key)!.add(m.item_id)
  }

  const JLPT_TYPES = ['jlpt_vocabulary', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening']

  for (const a of pendingAssignments) {
    let hasProgress = false

    if (a.category === 'seikatsu') {
      hasProgress = JLPT_TYPES.some(t => (userMastery.get(`${a.assigned_to}:${t}`)?.size ?? 0) > 0)
    } else if (a.category === 'business-jp') {
      hasProgress = (userMastery.get(`${a.assigned_to}:it_glossary`)?.size ?? 0) > 0
    } else if (a.category === 'business-lit') {
      const types = a.subcategory === 'attitude-culture'
        ? ['attitude_manual', 'culture_manual']
        : a.subcategory === 'security' ? ['security_manual'] : []
      hasProgress = types.some(t => (userMastery.get(`${a.assigned_to}:${t}`)?.size ?? 0) > 0)
    }

    if (hasProgress) {
      await serviceClient
        .from('learning_assignments')
        .update({ status: 'in_progress' })
        .eq('id', a.id)
    }
  }
}

// ─── Dev level unlock check ───

export async function getAssigneeUnlockedLevels(assigneeId: string, courseSubcategory: string) {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { levels: [] }

  const courses = await getCoursesWithProgress(serviceClient, assigneeId, courseSubcategory, false)

  return {
    levels: courses.map(c => ({
      difficulty: c.difficulty,
      isLocked: c.isLocked,
    })),
  }
}
