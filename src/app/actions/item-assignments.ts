'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdminOrMentor } from '@/lib/auth-helpers'
import { createNotification } from './notifications'
import { getUserDisplayName } from '@/lib/notification-helpers'
import { logAuditEvent } from '@/app/actions/audit'
import { ERR } from '@/lib/action-types'
import {
  ITEM_CATEGORIES, areaKeys, areaSpec, STALL_DAYS,
  isItemCategory, isJlptLevel, type ItemCategory, type AreaSpec,
} from '@/lib/item-assignments'

type DbClient =
  | Awaited<ReturnType<typeof createClient>>
  | NonNullable<ReturnType<typeof createServiceRoleClient>>

const STALL_MS = STALL_DAYS * 86_400_000

// ─── 공용 헬퍼 ───

/** 영역+레벨에 해당하는 콘텐츠 항목 id 집합 (= 풀) */
async function getPoolIds(client: DbClient, spec: AreaSpec, level: string | null): Promise<Set<string>> {
  let q = client.from(spec.table).select('id')
  if (spec.levelColumn && level) q = q.eq(spec.levelColumn, level)
  if (spec.filter) q = q.in(spec.filter.column, spec.filter.values)
  const { data } = await q.limit(10000)
  return new Set((data ?? []).map((r: { id: string }) => String(r.id)))
}

async function getMasteredIds(client: DbClient, userId: string, itemType: string): Promise<Set<string>> {
  const { data } = await client
    .from('user_mastered_items')
    .select('item_id')
    .eq('user_id', userId)
    .eq('item_type', itemType)
  return new Set((data ?? []).map((r: { item_id: string }) => String(r.item_id)))
}

function intersectCount(a: Set<string>, b: Set<string>): number {
  const [small, big] = a.size < b.size ? [a, b] : [b, a]
  let n = 0
  for (const x of small) if (big.has(x)) n++
  return n
}

// 누적 사다리 조회용: content_level 이 null 일 수 있어 분기
function ladderQuery(service: DbClient, menteeId: string, category: string, area: string, level: string | null) {
  let q = service
    .from('learning_assignments')
    .select('cumulative_target')
    .eq('assigned_to', menteeId)
    .eq('category', category)
    .eq('subcategory', area)
    .not('target_count', 'is', null)
    .order('cumulative_target', { ascending: false })
    .limit(1)
  q = level ? q.eq('content_level', level) : q.is('content_level', null)
  return q
}

// ─── 과제 부여 (개별 + 일괄, 생활/비즈니스 공통) ───

export async function createItemAssignments(formData: FormData) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase, user } = auth

  const assignedToList = formData.getAll('assigned_to').map(String).filter(Boolean)
  const category = String(formData.get('category') ?? '')
  const levelRaw = String(formData.get('content_level') ?? '')

  if (!assignedToList.length) return { error: 'メンティーを1名以上選択してください' }
  if (!isItemCategory(category)) return { error: 'カテゴリが不正です' }

  const catSpec = ITEM_CATEGORIES[category]
  const level = catSpec.hasLevel ? levelRaw : null
  if (catSpec.hasLevel && !isJlptLevel(levelRaw)) return { error: 'レベルを選択してください' }

  const requested: { area: string; count: number }[] = []
  for (const area of areaKeys(category)) {
    const raw = formData.get(`count_${area}`)
    const n = raw ? parseInt(String(raw), 10) : 0
    if (Number.isFinite(n) && n > 0) requested.push({ area, count: n })
  }
  if (requested.length === 0) return { error: '配布する項目数を1つ以上入力してください' }

  const service = createServiceRoleClient() ?? supabase
  const nowIso = new Date().toISOString()

  const poolCache = new Map<string, Set<string>>()
  for (const { area } of requested) {
    const spec = areaSpec(category, area)
    if (spec && !poolCache.has(area)) poolCache.set(area, await getPoolIds(service, spec, level))
  }

  type Row = Record<string, unknown>
  const rows: Row[] = []
  let skipped = 0

  for (const menteeId of assignedToList) {
    for (const { area, count } of requested) {
      const spec = areaSpec(category, area)
      if (!spec) continue
      const poolIds = poolCache.get(area)!
      const pool = poolIds.size

      const { data: prevRows } = await ladderQuery(service, menteeId, category, area, level)
      const prev: number = prevRows?.[0]?.cumulative_target ?? 0

      const remaining = pool - prev
      if (remaining <= 0) { skipped++; continue }
      const capped = Math.min(count, remaining)
      const cumulative = prev + capped

      const mastIds = await getMasteredIds(service, menteeId, spec.itemType)
      const mastered = intersectCount(poolIds, mastIds)
      const status = mastered >= cumulative ? 'completed' : (mastered > prev ? 'in_progress' : 'pending')

      const title = level
        ? `${level} ${spec.label} ${capped}項目`
        : `${spec.label} ${capped}項目`

      rows.push({
        assigned_by: user.id,
        assigned_to: menteeId,
        category,
        subcategory: area,
        content_level: level,
        title,
        target_count: capped,
        cumulative_target: cumulative,
        mastered_snapshot: mastered,
        last_progress_at: nowIso,
        status,
        completed_at: status === 'completed' ? nowIso : null,
      })
    }
  }

  if (rows.length === 0) {
    return { error: '対象全員がプール上限に達しており、配布できる項目がありません' }
  }

  const { data, error } = await supabase
    .from('learning_assignments')
    .insert(rows)
    .select('id, assigned_to, status, title')

  if (error) return { error: error.message }

  for (const row of data) {
    if (row.status === 'completed') continue
    await createNotification(
      row.assigned_to, 'task_assigned',
      `新しい学習課題: ${row.title}`, undefined, '/dashboard/assignments', row.id,
    )
  }

  await logAuditEvent(user.id, 'create', 'learning_assignments', data[0]?.id ?? '', null, {
    kind: 'item_count', category, level, areas: requested,
    assignee_count: assignedToList.length, created: data.length, skipped,
  })

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard')
  revalidatePath('/dashboard/assignments')
  return { success: true, created: data.length, skipped }
}

// ─── 완료/진전/지연 자동 판정 (페이지 로드 시 lazy 실행) ───

export async function updateItemAssignmentStatuses(userId: string) {
  const service = createServiceRoleClient()
  if (!service) return

  const { data: active } = await service
    .from('learning_assignments')
    .select('id, category, content_level, subcategory, target_count, cumulative_target, mastered_snapshot, last_progress_at, last_stall_notified_at, created_at, assigned_by, title, status')
    .eq('assigned_to', userId)
    .in('category', ['seikatsu', 'business-jp'])
    .not('target_count', 'is', null)
    .neq('status', 'completed')

  if (!active?.length) return

  const groups = new Map<string, typeof active>()
  for (const a of active) {
    const key = `${a.category}::${a.content_level ?? ''}::${a.subcategory}`
    if (!groups.has(key)) groups.set(key, [])
    groups.get(key)!.push(a)
  }

  const now = Date.now()
  const nowIso = new Date().toISOString()

  for (const [, list] of groups) {
    const first = list[0]
    if (!isItemCategory(first.category)) continue
    const spec = areaSpec(first.category, first.subcategory)
    if (!spec) continue

    const poolIds = await getPoolIds(service, spec, first.content_level)
    const mastIds = await getMasteredIds(service, userId, spec.itemType)
    const mastered = intersectCount(poolIds, mastIds)

    for (const a of list) {
      const update: Record<string, unknown> = {}
      let lastProgress = a.last_progress_at
        ? new Date(a.last_progress_at).getTime()
        : new Date(a.created_at).getTime()

      if (mastered > (a.mastered_snapshot ?? 0)) {
        update.mastered_snapshot = mastered
        update.last_progress_at = nowIso
        lastProgress = now
      }

      const cumulative = a.cumulative_target ?? 0
      const prev = cumulative - (a.target_count ?? 0)

      if (mastered >= cumulative) {
        update.status = 'completed'
        update.completed_at = nowIso
        if (a.status !== 'completed' && a.assigned_by) {
          const menteeName = await getUserDisplayName(userId)
          await createNotification(
            a.assigned_by, 'assignment_completed',
            `${menteeName}さんが学習課題を完了: ${a.title}`, undefined, '/admin/tasks', a.id,
          )
        }
      } else {
        const base = mastered > prev ? 'in_progress' : 'pending'
        const stalled = now - lastProgress >= STALL_MS
        update.status = stalled ? 'overdue' : base

        if (stalled) {
          const lastNotified = a.last_stall_notified_at ? new Date(a.last_stall_notified_at).getTime() : 0
          if (now - lastNotified >= STALL_MS) {
            update.last_stall_notified_at = nowIso
            await createNotification(
              userId, 'assignment_overdue',
              `学習課題「${a.title}」が${STALL_DAYS}日間進捗していません`,
              '学習を進めてください', '/dashboard/assignments', a.id,
            )
            if (a.assigned_by) {
              const menteeName = await getUserDisplayName(userId)
              await createNotification(
                a.assigned_by, 'assignment_overdue',
                `${menteeName}さんの課題「${a.title}」が停滞しています`, undefined, '/admin/tasks', a.id,
              )
            }
          }
        }
      }

      if (Object.keys(update).length) {
        await service.from('learning_assignments').update(update).eq('id', a.id)
      }
    }
  }
}

// ─── 멘토 수동 알림(독촉) ───

export async function nudgeItemAssignment(assignmentId: string) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const { supabase } = auth

  const { data: a } = await supabase
    .from('learning_assignments')
    .select('assigned_to, title, target_count')
    .eq('id', assignmentId)
    .single()

  if (!a || a.target_count == null) return { error: ERR.NOT_FOUND }

  await createNotification(
    a.assigned_to, 'assignment_overdue',
    `課題「${a.title}」のリマインドが届きました`, '担当者からの催促です', '/dashboard/assignments', assignmentId,
  )
  return { success: true }
}

// ─── 멘토 현황 조회 (부여 모달용) ───

export interface ItemStatusRow {
  menteeId: string
  area: string
  assignedCumulative: number
  completedCount: number
  mastered: number
  pool: number
  stalled: boolean
}

export async function getMenteeItemStatus(
  menteeIds: string[], category: string, level: string,
): Promise<{ rows: ItemStatusRow[] }> {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { rows: [] }
  const service = createServiceRoleClient() ?? auth.supabase

  const ids = menteeIds.map(String).filter(Boolean)
  if (!ids.length || !isItemCategory(category)) return { rows: [] }
  const catSpec = ITEM_CATEGORIES[category]
  const lvl = catSpec.hasLevel ? (isJlptLevel(level) ? level : null) : null
  if (catSpec.hasLevel && !lvl) return { rows: [] }

  const areas = areaKeys(category)

  const poolByArea = new Map<string, Set<string>>()
  for (const area of areas) {
    const spec = areaSpec(category, area)!
    poolByArea.set(area, await getPoolIds(service, spec, lvl))
  }

  // 마스터 집합: item_type별 1쿼리로 모든 멘티 일괄
  const itemTypes = [...new Set(areas.map(a => areaSpec(category, a)!.itemType))]
  const masteredByUserType = new Map<string, Set<string>>()
  for (const itemType of itemTypes) {
    const { data } = await service
      .from('user_mastered_items')
      .select('user_id, item_id')
      .eq('item_type', itemType)
      .in('user_id', ids)
    for (const r of data ?? []) {
      const k = `${r.user_id}::${itemType}`
      if (!masteredByUserType.has(k)) masteredByUserType.set(k, new Set())
      masteredByUserType.get(k)!.add(String(r.item_id))
    }
  }

  let aq = service
    .from('learning_assignments')
    .select('assigned_to, subcategory, target_count, cumulative_target, status')
    .in('assigned_to', ids)
    .eq('category', category)
    .not('target_count', 'is', null)
  aq = lvl ? aq.eq('content_level', lvl) : aq.is('content_level', null)
  const { data: assigns } = await aq

  const rows: ItemStatusRow[] = []
  for (const menteeId of ids) {
    for (const area of areas) {
      const spec = areaSpec(category, area)!
      const poolIds = poolByArea.get(area)!
      const mine = (assigns ?? []).filter(a => a.assigned_to === menteeId && a.subcategory === area)
      const assignedCumulative = mine.reduce((m, a) => Math.max(m, a.cumulative_target ?? 0), 0)
      const completedCount = mine
        .filter(a => a.status === 'completed')
        .reduce((s, a) => s + (a.target_count ?? 0), 0)
      const mastIds = masteredByUserType.get(`${menteeId}::${spec.itemType}`) ?? new Set<string>()
      const mastered = intersectCount(poolIds, mastIds)
      const stalled = mine.some(a => a.status === 'overdue')
      rows.push({ menteeId, area, assignedCumulative, completedCount, mastered, pool: poolIds.size, stalled })
    }
  }

  return { rows }
}

// ─── 대시보드 집계 (완료항목 / 부여항목, 멘티별 카테고리별) ───

export interface ItemProgressPair { assigned: number; completed: number }
export interface MenteeItemProgress { seikatsu: ItemProgressPair; businessJp: ItemProgressPair }

/**
 * 멘티별 (생활/비즈니스) 항목 집계.
 * 부여항목 = 각 사다리(카테고리·레벨·영역)의 MAX cumulative_target 합.
 * 완료항목 = min(마스터 수, 부여누적) 합 (실제 학습 완료 항목).
 */
export async function aggregateItemProgress(menteeIds: string[]): Promise<Record<string, MenteeItemProgress>> {
  const result: Record<string, MenteeItemProgress> = {}
  for (const id of menteeIds) {
    result[id] = { seikatsu: { assigned: 0, completed: 0 }, businessJp: { assigned: 0, completed: 0 } }
  }
  const ids = menteeIds.map(String).filter(Boolean)
  if (!ids.length) return result

  const service = createServiceRoleClient()
  if (!service) return result

  const { data: assigns } = await service
    .from('learning_assignments')
    .select('assigned_to, category, subcategory, content_level, cumulative_target')
    .in('assigned_to', ids)
    .in('category', ['seikatsu', 'business-jp'])
    .not('target_count', 'is', null)

  if (!assigns?.length) return result

  // 사다리별 최대 누적 (mentee, category, level, area)
  const ladderMax = new Map<string, { menteeId: string; category: ItemCategory; level: string | null; area: string; cum: number }>()
  for (const a of assigns) {
    if (!isItemCategory(a.category)) continue
    const key = `${a.assigned_to}::${a.category}::${a.content_level ?? ''}::${a.subcategory}`
    const cur = ladderMax.get(key)
    const cum = a.cumulative_target ?? 0
    if (!cur || cum > cur.cum) {
      ladderMax.set(key, { menteeId: a.assigned_to, category: a.category, level: a.content_level, area: a.subcategory, cum })
    }
  }

  // 풀 캐시 (category::level::area)
  const poolCache = new Map<string, Set<string>>()
  // 마스터 캐시 (userId::itemType)
  const masteredCache = new Map<string, Set<string>>()

  for (const L of ladderMax.values()) {
    const spec = areaSpec(L.category, L.area)
    if (!spec) continue

    const poolKey = `${L.category}::${L.level ?? ''}::${L.area}`
    let poolIds = poolCache.get(poolKey)
    if (!poolIds) { poolIds = await getPoolIds(service, spec, L.level); poolCache.set(poolKey, poolIds) }

    const mKey = `${L.menteeId}::${spec.itemType}`
    let mastIds = masteredCache.get(mKey)
    if (!mastIds) { mastIds = await getMasteredIds(service, L.menteeId, spec.itemType); masteredCache.set(mKey, mastIds) }

    const mastered = Math.min(intersectCount(poolIds, mastIds), L.cum)
    const bucket = L.category === 'seikatsu' ? result[L.menteeId].seikatsu : result[L.menteeId].businessJp
    bucket.assigned += L.cum
    bucket.completed += mastered
  }

  return result
}
