'use server'

import { createClient } from '@/lib/supabase/server'

export async function getUnreadTaskCount() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) {
    return { count: 0 }
  }

  const { count, error } = await supabase
    .from('task_assignments')
    .select('*', { count: 'exact', head: true })
    .eq('assigned_to', user.id)
    .eq('status', 'pending')

  if (error) {
    return { count: 0 }
  }

  return { count: count ?? 0 }
}

export async function getTaskNotifications() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) {
    return { notifications: [] }
  }

  const { data: tasks, error } = await supabase
    .from('task_assignments')
    .select('*, profiles!task_assignments_assigned_by_fkey(full_name)')
    .eq('assigned_to', user.id)
    .in('status', ['pending', 'in_progress'])
    .order('created_at', { ascending: false })
    .limit(10)

  if (error) {
    return { notifications: [] }
  }

  const notifications = (tasks || []).map((task) => ({
    id: task.id,
    title: task.title || '新しい課題が割り当てられました',
    description: task.description,
    assignedBy: (task.profiles as { full_name: string } | null)?.full_name || '管理者',
    status: task.status,
    dueDate: task.due_date,
    createdAt: task.created_at,
  }))

  return { notifications }
}

