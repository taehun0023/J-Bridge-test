'use server'

import { revalidatePath } from 'next/cache'
import { requireAuth, requireAdminOrJpMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { notifyMentorsAndAdmins, getUserDisplayName } from '@/lib/notification-helpers'
import { createNotification } from '@/app/actions/notifications'
import { logAuditEvent } from '@/app/actions/audit'
import { ERR } from '@/lib/action-types'
import { normalizeTerm } from '@/lib/normalize'

const VOCAB_PATH = '/japanese/business/shared-vocab'

export async function checkDuplicate(termJa: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase } = auth

  const normalized = normalizeTerm(termJa)
  if (!normalized) return { success: true, duplicates: [] }

  const { data } = await supabase
    .from('shared_vocab_submissions')
    .select('id, term_ja, status')
    .eq('term_normalized', normalized)
    .in('status', ['pending', 'approved'])

  return { success: true, duplicates: data ?? [] }
}

export async function submitVocab(formData: FormData) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { supabase, user } = auth

  const termJa = (formData.get('term_ja') as string)?.trim()
  const termReading = (formData.get('term_reading') as string)?.trim() || null
  const termKo = (formData.get('term_ko') as string)?.trim() || null
  const exampleSentence = (formData.get('example_sentence') as string)?.trim() || null
  const category = (formData.get('category') as string) || 'general'

  if (!termJa) return { error: ERR.REQUIRED_FIELDS }

  const normalized = normalizeTerm(termJa)

  // Check for duplicates (pending + approved)
  const { data: existing } = await supabase
    .from('shared_vocab_submissions')
    .select('id')
    .eq('term_normalized', normalized)
    .in('status', ['pending', 'approved'])
    .limit(1)

  if (existing && existing.length > 0) {
    return { error: '既に登録されている単語です' }
  }

  // Get role to determine status
  const { data: profile } = await supabase
    .from('profiles')
    .select('role')
    .eq('id', user.id)
    .single()

  const role = profile?.role ?? 'mentee'
  const status = (role === 'admin' || role === 'mentor') ? 'approved' : 'pending'

  const { error } = await supabase
    .from('shared_vocab_submissions')
    .insert({
      submitted_by: user.id,
      term_ja: termJa,
      term_reading: termReading,
      term_ko: termKo,
      example_sentence: exampleSentence,
      category,
      term_normalized: normalized,
      status,
    })

  if (error) return { error: error.message }

  // Mentee submission → notify mentors + admins
  if (status === 'pending') {
    const displayName = await getUserDisplayName(user.id)
    await notifyMentorsAndAdmins(
      user.id,
      'vocab_submitted',
      `${displayName}さんが単語を提出しました`,
      `「${termJa}」の承認をお願いします`,
      VOCAB_PATH
    )
  }

  revalidatePath(VOCAB_PATH)
  return { success: true, status }
}

export async function getSharedVocab(filters?: { search?: string; category?: string }) {
  const auth = await requireAuth()
  if ('error' in auth) return { items: [] }
  const { supabase } = auth

  let query = supabase
    .from('shared_vocab_submissions')
    .select('id, term_ja, term_reading, term_ko, term_en, example_sentence, category, submitted_by, created_at, profiles!shared_vocab_submissions_submitted_by_fkey(full_name)')
    .eq('status', 'approved')
    .order('created_at', { ascending: false })

  if (filters?.category && filters.category !== 'all') {
    query = query.eq('category', filters.category)
  }
  if (filters?.search) {
    query = query.or(`term_ja.ilike.%${filters.search}%,term_ko.ilike.%${filters.search}%,term_reading.ilike.%${filters.search}%`)
  }

  const { data } = await query
  return { items: data ?? [] }
}

export async function getMySubmissions() {
  const auth = await requireAuth()
  if ('error' in auth) return { items: [] }
  const { supabase, user } = auth

  const { data } = await supabase
    .from('shared_vocab_submissions')
    .select('id, term_ja, term_reading, term_ko, example_sentence, category, status, rejection_reason, created_at')
    .eq('submitted_by', user.id)
    .order('created_at', { ascending: false })

  return { items: data ?? [] }
}

export async function getPendingVocab() {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error, items: [] }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING, items: [] }

  const { data } = await serviceClient
    .from('shared_vocab_submissions')
    .select('id, term_ja, term_reading, term_ko, example_sentence, category, submitted_by, created_at, profiles!shared_vocab_submissions_submitted_by_fkey(full_name)')
    .eq('status', 'pending')
    .order('created_at', { ascending: false })

  return {
    items: (data ?? []).map(item => ({
      ...item,
      profiles: Array.isArray(item.profiles) ? item.profiles[0] ?? null : item.profiles,
    })),
  }
}

export async function approveVocab(id: string) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Get submission info for notification
  const { data: submission } = await serviceClient
    .from('shared_vocab_submissions')
    .select('submitted_by, term_ja')
    .eq('id', id)
    .single()

  if (!submission) return { error: ERR.NOT_FOUND }

  const { error } = await serviceClient
    .from('shared_vocab_submissions')
    .update({ status: 'approved', updated_at: new Date().toISOString() })
    .eq('id', id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'approve', 'shared_vocab_submissions', id, { status: 'pending' }, { status: 'approved' })

  // Notify the submitter
  await createNotification(
    submission.submitted_by,
    'vocab_approved',
    '単語が承認されました',
    `「${submission.term_ja}」が承認され、公開されました`,
    VOCAB_PATH,
    id
  )

  revalidatePath(VOCAB_PATH)
  return { success: true }
}

export async function rejectVocab(id: string, reason?: string) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Get submission info for notification
  const { data: submission } = await serviceClient
    .from('shared_vocab_submissions')
    .select('submitted_by, term_ja')
    .eq('id', id)
    .single()

  if (!submission) return { error: ERR.NOT_FOUND }

  const { error } = await serviceClient
    .from('shared_vocab_submissions')
    .update({ status: 'rejected', rejection_reason: reason || null, updated_at: new Date().toISOString() })
    .eq('id', id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'reject', 'shared_vocab_submissions', id, { status: 'pending' }, { status: 'rejected', rejection_reason: reason || null })

  // Notify the submitter
  const msg = reason
    ? `「${submission.term_ja}」が却下されました。理由: ${reason}`
    : `「${submission.term_ja}」が却下されました`
  await createNotification(
    submission.submitted_by,
    'vocab_rejected',
    '単語が却下されました',
    msg,
    VOCAB_PATH,
    id
  )

  revalidatePath(VOCAB_PATH)
  return { success: true }
}

export async function updateSharedVocab(
  id: string,
  data: { term_ja: string; term_reading: string | null; term_ko: string | null; example_sentence: string | null; category: string }
) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const termJa = data.term_ja?.trim()
  if (!termJa) return { error: ERR.REQUIRED_FIELDS }

  const normalized = normalizeTerm(termJa)

  // Fetch old data for audit
  const { data: oldVocab } = await serviceClient
    .from('shared_vocab_submissions')
    .select('term_ja, term_reading, term_ko, example_sentence, category')
    .eq('id', id)
    .single()

  // Check for duplicates (exclude self)
  const { data: existing } = await serviceClient
    .from('shared_vocab_submissions')
    .select('id')
    .eq('term_normalized', normalized)
    .in('status', ['pending', 'approved'])
    .neq('id', id)
    .limit(1)

  if (existing && existing.length > 0) {
    return { error: '既に登録されている単語です' }
  }

  const { error } = await serviceClient
    .from('shared_vocab_submissions')
    .update({
      term_ja: termJa,
      term_reading: data.term_reading?.trim() || null,
      term_ko: data.term_ko?.trim() || null,
      example_sentence: data.example_sentence?.trim() || null,
      category: data.category || 'general',
      term_normalized: normalized,
      updated_at: new Date().toISOString(),
    })
    .eq('id', id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'shared_vocab_submissions', id, oldVocab, { ...data, term_ja: termJa })

  revalidatePath(VOCAB_PATH)
  return { success: true }
}

export async function deleteMySubmission(id: string) {
  const auth = await requireAuth()
  if ('error' in auth) return { error: auth.error }
  const { user } = auth

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Verify ownership + rejected status
  const { data: submission } = await serviceClient
    .from('shared_vocab_submissions')
    .select('submitted_by, status')
    .eq('id', id)
    .single()

  if (!submission) return { error: ERR.NOT_FOUND }
  if (submission.submitted_by !== user.id) return { error: ERR.FORBIDDEN }
  if (submission.status !== 'rejected') return { error: '却下された提出のみ削除できます' }

  const { error } = await serviceClient
    .from('shared_vocab_submissions')
    .delete()
    .eq('id', id)

  if (error) return { error: error.message }
  revalidatePath(VOCAB_PATH)
  return { success: true }
}

export async function deleteSharedVocab(id: string) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error }

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Fetch old data for audit
  const { data: oldData } = await serviceClient
    .from('shared_vocab_submissions')
    .select('*')
    .eq('id', id)
    .single()

  const { error } = await serviceClient
    .from('shared_vocab_submissions')
    .delete()
    .eq('id', id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'delete', 'shared_vocab_submissions', id, oldData, null)

  revalidatePath(VOCAB_PATH)
  return { success: true }
}
