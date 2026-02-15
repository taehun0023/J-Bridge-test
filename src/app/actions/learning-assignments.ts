'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth, requireAdminOrMentor } from '@/lib/auth-helpers'
import { ASSIGNMENT_CATEGORIES } from '@/lib/assignment-categories'
import { createNotification } from './notifications'

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
  let requiredQuizIds: string[] = []
  const serviceClient = createServiceRoleClient()
  if (serviceClient) {
    if (isLevelOnly && catConfig?.quizTypes) {
      // levelOnly: search all quiz types for this category
      let query = serviceClient
        .from('quizzes')
        .select('id')
        .in('quiz_type', catConfig.quizTypes)

      if (contentLevel) {
        query = query.eq('content_level', contentLevel)
      }

      const { data: quizzes } = await query.order('created_at')
      requiredQuizIds = (quizzes ?? []).map(q => q.id)
    } else {
      // Normal: search by single quiz type
      const subcatConfig = catConfig?.subcategories[subcategory]
      const quizType = subcatConfig?.quizType

      if (quizType) {
        let query = serviceClient
          .from('quizzes')
          .select('id')
          .eq('quiz_type', quizType)

        if (contentLevel) {
          query = query.eq('content_level', contentLevel)
        }

        const { data: quizzes } = await query.order('created_at')
        requiredQuizIds = (quizzes ?? []).map(q => q.id)
      }
    }
  }

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
  if (!serviceClient) return

  // Find assignments that include this quiz in required_quiz_ids
  const { data: assignments } = await serviceClient
    .from('learning_assignments')
    .select('*')
    .eq('assigned_to', userId)
    .neq('status', 'completed')
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
  }
}

export async function deleteLearningAssignment(assignmentId: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  const { error } = await supabase
    .from('learning_assignments')
    .delete()
    .eq('id', assignmentId)

  if (error) return { error: error.message }
  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard/assignments')
  return { success: true }
}
