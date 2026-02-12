'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import type { NotificationType } from '@/lib/supabase/types'

export async function getUnreadNotificationCount() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { count: 0 }

  const { count, error } = await supabase
    .from('notifications')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .eq('is_read', false)

  if (error) return { count: 0 }
  return { count: count ?? 0 }
}

export async function getNotifications(limit = 20) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()

  if (!user) return { notifications: [] }

  const { data, error } = await supabase
    .from('notifications')
    .select('*')
    .eq('user_id', user.id)
    .order('created_at', { ascending: false })
    .limit(limit)

  if (error) return { notifications: [] }
  return { notifications: data ?? [] }
}

export async function markAsRead(notificationId: string) {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { error } = await supabase
    .from('notifications')
    .update({ is_read: true })
    .eq('id', notificationId)
    .eq('user_id', user.id)

  if (error) return { error: error.message }
  return { success: true }
}

export async function markAllAsRead() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: '認証が必要です' }

  const { error } = await supabase
    .from('notifications')
    .update({ is_read: true })
    .eq('user_id', user.id)
    .eq('is_read', false)

  if (error) return { error: error.message }
  revalidatePath('/')
  return { success: true }
}

export async function createNotification(
  userId: string,
  type: NotificationType,
  title: string,
  message?: string,
  link?: string,
  relatedId?: string
) {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: 'Service role key not configured' }

  const { error } = await serviceClient
    .from('notifications')
    .insert({
      user_id: userId,
      type,
      title,
      message: message ?? null,
      link: link ?? null,
      related_id: relatedId ?? null,
    })

  if (error) return { error: error.message }
  return { success: true }
}

// Keep legacy functions for backward compatibility with existing Sidebar
export async function getUnreadTaskCount() {
  return getUnreadNotificationCount()
}

export async function getTaskNotifications() {
  const result = await getNotifications(10)
  return {
    notifications: result.notifications.map(n => ({
      id: n.id,
      title: n.title,
      description: n.message,
      assignedBy: '',
      status: n.is_read ? 'read' : 'unread',
      dueDate: null,
      createdAt: n.created_at,
    })),
  }
}
