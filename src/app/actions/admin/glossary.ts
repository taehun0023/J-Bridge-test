'use server'

import { revalidatePath } from 'next/cache'
import { requireAdminOrJpMentor } from '@/lib/auth-helpers'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { logAuditEvent } from '@/app/actions/audit'
import { ERR } from '@/lib/action-types'

interface GlossaryFormData {
  term_ja: string
  reading: string | null
  term_ko: string
  term_en: string | null
  category: string
  subcategory: string | null
  description: string | null
  example_sentence: string | null
}

export async function createGlossaryItem(data: GlossaryFormData) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  if (!data.term_ja || !data.term_ko || !data.category) {
    return { error: ERR.REQUIRED_FIELDS }
  }

  const { data: item, error } = await serviceClient
    .from('it_glossary')
    .insert({
      term_ja: data.term_ja,
      reading: data.reading,
      term_ko: data.term_ko,
      term_en: data.term_en,
      category: data.category,
      subcategory: data.subcategory,
      description: data.description,
      example_sentence: data.example_sentence,
    })
    .select('id')
    .single()

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'create', 'it_glossary', item.id, null, { ...data })

  revalidatePath('/japanese/business/glossary')
  revalidatePath('/japanese/business/expressions')
  revalidatePath('/japanese/business/sentence-patterns')
  revalidatePath('/japanese/business/keigo')
  return { success: true }
}

export async function updateGlossaryItem(id: string, data: GlossaryFormData) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  if (!data.term_ja || !data.term_ko || !data.category) {
    return { error: ERR.REQUIRED_FIELDS }
  }

  // Fetch old data for audit
  const { data: oldData } = await serviceClient
    .from('it_glossary')
    .select('*')
    .eq('id', id)
    .single()

  const { error } = await serviceClient
    .from('it_glossary')
    .update({
      term_ja: data.term_ja,
      reading: data.reading,
      term_ko: data.term_ko,
      term_en: data.term_en,
      category: data.category,
      subcategory: data.subcategory,
      description: data.description,
      example_sentence: data.example_sentence,
    })
    .eq('id', id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'update', 'it_glossary', id, oldData as Record<string, unknown> | null, { ...data })

  revalidatePath('/japanese/business/glossary')
  revalidatePath('/japanese/business/expressions')
  revalidatePath('/japanese/business/sentence-patterns')
  revalidatePath('/japanese/business/keigo')
  return { success: true }
}

export interface GlossaryLogEntry {
  id: string
  actor_id: string
  action: string
  resource_type: string
  resource_id: string
  old_data: Record<string, unknown> | null
  new_data: Record<string, unknown> | null
  metadata: Record<string, unknown> | null
  created_at: string
  profiles: { full_name: string | null; email: string } | null
}

export async function getGlossaryLog(filters?: {
  action?: string
  dateFrom?: string
  dateTo?: string
  page?: number
}) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { items: [] as GlossaryLogEntry[], total: 0 }
  const { supabase } = auth

  const page = filters?.page ?? 1
  const limit = 50
  const offset = (page - 1) * limit

  let query = supabase
    .from('audit_log')
    .select('*, profiles!audit_log_actor_id_fkey(full_name, email)', { count: 'exact' })
    .eq('resource_type', 'it_glossary')
    .order('created_at', { ascending: false })
    .range(offset, offset + limit - 1)

  if (filters?.action && filters.action !== 'all') {
    query = query.eq('action', filters.action)
  }
  if (filters?.dateFrom) {
    query = query.gte('created_at', filters.dateFrom)
  }
  if (filters?.dateTo) {
    query = query.lte('created_at', `${filters.dateTo}T23:59:59`)
  }

  const { data, count } = await query
  return { items: (data ?? []) as GlossaryLogEntry[], total: count ?? 0 }
}

export async function revertGlossaryChange(auditLogId: string) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  const { data: logEntry } = await serviceClient
    .from('audit_log')
    .select('*')
    .eq('id', auditLogId)
    .single()

  if (!logEntry) return { error: '監査ログが見つかりません' }
  if (!logEntry.old_data) return { error: '復元データがありません' }

  const oldData = logEntry.old_data as Record<string, unknown>

  if (logEntry.action === 'delete') {
    // Delete revert: re-insert with created_at removed → DB DEFAULT NOW() → list end
    delete oldData.created_at
    const { error } = await serviceClient
      .from('it_glossary')
      .upsert(oldData)

    if (error) return { error: `復元に失敗しました: ${error.message}` }
  } else if (logEntry.action === 'update') {
    // Update revert: restore old values, keep original created_at (original index)
    const { error } = await serviceClient
      .from('it_glossary')
      .update({
        term_ja: oldData.term_ja,
        reading: oldData.reading,
        term_ko: oldData.term_ko,
        term_en: oldData.term_en,
        category: oldData.category,
        subcategory: oldData.subcategory,
        description: oldData.description,
        example_sentence: oldData.example_sentence,
      })
      .eq('id', logEntry.resource_id)

    if (error) return { error: `復元に失敗しました: ${error.message}` }
  } else {
    return { error: '更新・削除操作のみ復元できます' }
  }

  await logAuditEvent(auth.user.id, 'restore', 'it_glossary', logEntry.resource_id, null, oldData)

  revalidatePath('/japanese/business/glossary')
  revalidatePath('/japanese/business/expressions')
  revalidatePath('/japanese/business/sentence-patterns')
  revalidatePath('/japanese/business/keigo')
  return { success: true }
}

export async function deleteGlossaryItem(id: string) {
  const auth = await requireAdminOrJpMentor()
  if ('error' in auth) return { error: auth.error } as const

  const serviceClient = createServiceRoleClient()
  if (!serviceClient) return { error: ERR.SERVICE_KEY_MISSING }

  // Fetch old data for audit
  const { data: oldData } = await serviceClient
    .from('it_glossary')
    .select('*')
    .eq('id', id)
    .single()

  const { error } = await serviceClient
    .from('it_glossary')
    .delete()
    .eq('id', id)

  if (error) return { error: error.message }

  await logAuditEvent(auth.user.id, 'delete', 'it_glossary', id, oldData as Record<string, unknown> | null, null)

  revalidatePath('/japanese/business/glossary')
  revalidatePath('/japanese/business/expressions')
  revalidatePath('/japanese/business/sentence-patterns')
  revalidatePath('/japanese/business/keigo')
  return { success: true }
}
