import { createServiceRoleClient } from '@/lib/supabase/server'
import { requireAuth } from '@/lib/auth-helpers'
import type { NotificationType } from '@/lib/supabase/types'
import type { SupabaseClient } from '@supabase/supabase-js'

// createNotification / deleteNotificationsByRelatedId live here (NOT in a
// 'use server' module) on purpose: they write to arbitrary user_ids via the
// service-role client, so they must never be exposed as callable server actions.

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

/**
 * Delete all notifications matching a given type and related_id.
 * Used to clean up request notifications sent to other admins/mentors
 * after one of them has already approved/denied.
 */
export async function deleteNotificationsByRelatedId(
  relatedId: string,
  type: NotificationType
) {
  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return

  await serviceClient
    .from('notifications')
    .delete()
    .eq('related_id', relatedId)
    .eq('type', type)
}

/**
 * Notify all mentors assigned to a given mentee.
 * Falls back to provided client if service role is unavailable.
 */
export async function notifyMentorsOf(
  menteeId: string,
  type: NotificationType,
  title: string,
  message?: string,
  link?: string,
  relatedId?: string,
  fallbackClient?: SupabaseClient
) {
  const client = createServiceRoleClient() ?? fallbackClient
  if (!client) return

  const { data: mentorAssignments } = await client
    .from('mentor_mentee_assignments')
    .select('mentor_id')
    .eq('mentee_id', menteeId)

  const rows = (mentorAssignments ?? []).map(assignment => ({
    user_id: assignment.mentor_id,
    type,
    title,
    message: message ?? null,
    link: link ?? null,
    related_id: relatedId ?? null,
  }))
  if (rows.length === 0) return

  const { error } = await client.from('notifications').insert(rows)
  if (error) console.error('[notifyMentorsOf] bulk insert failed:', error.message)
}

/**
 * Notify all admin users.
 * Falls back to provided client if service role is unavailable.
 */
export async function notifyAdmins(
  type: NotificationType,
  title: string,
  message?: string,
  link?: string,
  relatedId?: string,
  fallbackClient?: SupabaseClient
) {
  const client = createServiceRoleClient() ?? fallbackClient
  if (!client) return

  const { data: admins } = await client
    .from('profiles')
    .select('id')
    .eq('role', 'admin')

  const rows = (admins ?? []).map(admin => ({
    user_id: admin.id,
    type,
    title,
    message: message ?? null,
    link: link ?? null,
    related_id: relatedId ?? null,
  }))
  if (rows.length === 0) return

  const { error } = await client.from('notifications').insert(rows)
  if (error) console.error('[notifyAdmins] bulk insert failed:', error.message)
}

/**
 * Notify both mentors (of a mentee) and all admins.
 * Convenience wrapper used for exam requests, retake requests, etc.
 */
export async function notifyMentorsAndAdmins(
  menteeId: string,
  type: NotificationType,
  title: string,
  message?: string,
  link?: string,
  relatedId?: string,
  fallbackClient?: SupabaseClient
) {
  await Promise.all([
    notifyMentorsOf(menteeId, type, title, message, link, relatedId, fallbackClient),
    notifyAdmins(type, title, message, link, relatedId, fallbackClient),
  ])
}

/**
 * Get a user's display name for notification messages.
 * Returns 'メンティー' as fallback.
 */
export async function getUserDisplayName(
  userId: string,
  fallbackClient?: SupabaseClient
): Promise<string> {
  const client = createServiceRoleClient() ?? fallbackClient
  if (!client) return 'メンティー'

  const { data } = await client
    .from('profiles')
    .select('full_name')
    .eq('id', userId)
    .single()

  return data?.full_name ?? 'メンティー'
}
