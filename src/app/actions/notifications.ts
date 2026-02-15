'use server'

import { createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAuth } from '@/lib/auth-helpers'
import type { NotificationType } from '@/lib/supabase/types'

export async function getUnreadNotificationCount() {
  const auth = await requireAuth()
  if ('error' in auth) return { count: 0 }
  const { supabase, user } = auth

  const { count, error } = await supabase
    .from('notifications')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', user.id)
    .eq('is_read', false)

  if (error) return { count: 0 }
  return { count: count ?? 0 }
}

export async function getNotifications(limit = 20) {
  const auth = await requireAuth()
  if ('error' in auth) return { notifications: [] }
  const { supabase, user } = auth

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
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const { error } = await supabase
    .from('notifications')
    .update({ is_read: true })
    .eq('id', notificationId)
    .eq('user_id', user.id)

  if (error) return { error: error.message }
  return { success: true }
}

export async function markAllAsRead() {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

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
  // Try service role client first (bypasses RLS, works for any caller)
  const serviceClient = createServiceRoleClient()
  if (serviceClient) {
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

  // Fallback: use regular client (works if caller is admin/mentor via RLS INSERT policy)
  try {
    const auth = await requireAuth()
    if ('error' in auth) return { error: auth.error } as const
    const { supabase } = auth

    const { error } = await supabase
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
  } catch {
    return { error: 'Notification creation failed: no service role key and insufficient permissions' }
  }
}
