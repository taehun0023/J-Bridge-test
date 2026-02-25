'use server'

import { createClient } from '@/lib/supabase/server'
import { requireAdmin } from '@/lib/auth-helpers'

/** Log an audit event (called internally from other server actions) */
export async function logAuditEvent(
  actorId: string,
  action: 'create' | 'update' | 'delete' | 'approve' | 'reject' | 'restore',
  resourceType: string,
  resourceId: string,
  oldData?: Record<string, unknown> | null,
  newData?: Record<string, unknown> | null,
  metadata?: Record<string, unknown> | null,
) {
  const supabase = await createClient()

  await supabase.from('audit_log').insert({
    actor_id: actorId,
    action,
    resource_type: resourceType,
    resource_id: resourceId,
    old_data: oldData ?? null,
    new_data: newData ?? null,
    metadata: metadata ?? null,
  })
}

export interface AuditLogEntry {
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

export async function getAuditLog(filters?: {
  action?: string
  resourceType?: string
  search?: string
  dateFrom?: string
  dateTo?: string
  page?: number
}) {
  const auth = await requireAdmin()
  if ('error' in auth) return { items: [], total: 0 }
  const { supabase } = auth

  const page = filters?.page ?? 1
  const limit = 50
  const offset = (page - 1) * limit

  let query = supabase
    .from('audit_log')
    .select('*, profiles!audit_log_actor_id_fkey(full_name, email)', { count: 'exact' })
    .order('created_at', { ascending: false })
    .range(offset, offset + limit - 1)

  if (filters?.action && filters.action !== 'all') {
    query = query.eq('action', filters.action)
  }
  if (filters?.resourceType && filters.resourceType !== 'all') {
    query = query.eq('resource_type', filters.resourceType)
  }
  if (filters?.dateFrom) {
    query = query.gte('created_at', filters.dateFrom)
  }
  if (filters?.dateTo) {
    query = query.lte('created_at', `${filters.dateTo}T23:59:59`)
  }

  const { data, count } = await query
  return { items: (data ?? []) as AuditLogEntry[], total: count ?? 0 }
}

export async function restoreResource(auditLogId: string) {
  const auth = await requireAdmin()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  // Fetch the audit log entry
  const { data: logEntry } = await supabase
    .from('audit_log')
    .select('*')
    .eq('id', auditLogId)
    .single()

  if (!logEntry) return { error: '監査ログが見つかりません' }
  if (logEntry.action !== 'delete') return { error: '削除操作のみ復元できます' }
  if (!logEntry.old_data) return { error: '復元データがありません' }

  const resourceType = logEntry.resource_type
  const oldData = logEntry.old_data as Record<string, unknown>

  // Remove timestamps that would conflict
  delete oldData.created_at
  delete oldData.updated_at

  // Attempt to re-insert
  const { error } = await supabase
    .from(resourceType)
    .upsert(oldData)

  if (error) return { error: `復元に失敗しました: ${error.message}` }

  // Log the restore action
  await logAuditEvent(user.id, 'restore', resourceType, logEntry.resource_id, null, oldData)

  return { success: true }
}

export async function exportAuditLogCsv(filters?: {
  action?: string
  resourceType?: string
  dateFrom?: string
  dateTo?: string
}) {
  const auth = await requireAdmin()
  if ('error' in auth) return { csv: '' }
  const { supabase } = auth

  let query = supabase
    .from('audit_log')
    .select('*, profiles!audit_log_actor_id_fkey(full_name, email)')
    .order('created_at', { ascending: false })
    .limit(5000)

  if (filters?.action && filters.action !== 'all') {
    query = query.eq('action', filters.action)
  }
  if (filters?.resourceType && filters.resourceType !== 'all') {
    query = query.eq('resource_type', filters.resourceType)
  }
  if (filters?.dateFrom) {
    query = query.gte('created_at', filters.dateFrom)
  }
  if (filters?.dateTo) {
    query = query.lte('created_at', `${filters.dateTo}T23:59:59`)
  }

  const { data } = await query

  if (!data || data.length === 0) return { csv: '' }

  const header = '日時,操作者,アクション,リソース種別,リソースID'
  const rows = data.map(row => {
    const profile = row.profiles as { full_name: string | null; email: string } | null
    const actor = profile?.full_name ?? profile?.email ?? row.actor_id
    const date = new Date(row.created_at).toLocaleString('ja-JP')
    return `"${date}","${actor}","${row.action}","${row.resource_type}","${row.resource_id}"`
  })

  return { csv: [header, ...rows].join('\n') }
}
