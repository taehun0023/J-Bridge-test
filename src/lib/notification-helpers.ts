import { createServiceRoleClient } from '@/lib/supabase/server'
import { createNotification } from '@/app/actions/notifications'
import type { NotificationType } from '@/lib/supabase/types'
import type { SupabaseClient } from '@supabase/supabase-js'

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

  for (const assignment of mentorAssignments ?? []) {
    await createNotification(
      assignment.mentor_id,
      type,
      title,
      message,
      link,
      relatedId
    )
  }
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

  for (const admin of admins ?? []) {
    await createNotification(
      admin.id,
      type,
      title,
      message,
      link,
      relatedId
    )
  }
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
