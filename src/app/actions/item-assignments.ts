'use server'

import { createClient, createServiceRoleClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { requireAdminOrMentor, requireAuth } from '@/lib/auth-helpers'
import { createNotification } from './notifications'
import { getUserDisplayName } from '@/lib/notification-helpers'
import { logAuditEvent } from '@/app/actions/audit'
import { ERR } from '@/lib/action-types'
import {
  ITEM_CATEGORIES, QUIZ_CATEGORIES, areaKeys, areaSpec, areaLabel, STALL_DAYS,
  isItemCategory, isJlptLevel, type ItemCategory, type AreaSpec,
} from '@/lib/item-assignments'
import { getLevelSeqMap } from '@/lib/jlpt-mastery'

type DbClient =
  | Awaited<ReturnType<typeof createClient>>
  | NonNullable<ReturnType<typeof createServiceRoleClient>>

const STALL_MS = STALL_DAYS * 86_400_000

// ─── 공용 헬퍼 ───

/** 영역+레벨에 해당하는 콘텐츠 항목 id 집합 (= 풀) */
async function getPoolIds(client: DbClient, spec: AreaSpec, level: string | null): Promise<Set<string>> {
  // Supabase는 요청당 최대 1,000행으로 강제 제한하므로 range로 페이지네이션해 전체 id를 수집한다
  // (N1 어휘처럼 1,000개 초과 영역이 잘려 全体進捗 총합이 작게 나오는 버그 방지).
  const all = new Set<string>()
  for (let from = 0; ; from += 1000) {
    let q = spec.quizType
      ? client.from('quizzes').select('id').eq('quiz_type', spec.quizType).eq('is_pool', true)
      : client.from(spec.table).select('id')
    if (spec.quizType) {
      if (spec.levelByTitle && level) q = q.ilike('title', `${level}%`)
    } else {
      if (spec.levelColumn && level) q = q.eq(spec.levelColumn, level)
      if (spec.filter) q = q.in(spec.filter.column, spec.filter.values)
    }
    const { data } = await q.range(from, from + 999)
    const rows = data ?? []
    for (const r of rows as { id: string }[]) all.add(String(r.id))
    if (rows.length < 1000) break
  }
  return all
}

async function getMasteredIds(client: DbClient, userId: string, itemType: string): Promise<Set<string>> {
  // 페이지네이션 — 1000행 기본 제한 회피
  const out = new Set<string>()
  const PAGE = 1000
  for (let offset = 0; ; offset += PAGE) {
    const { data } = await client
      .from('user_mastered_items')
      .select('item_id')
      .eq('user_id', userId)
      .eq('item_type', itemType)
      .range(offset, offset + PAGE - 1)
    if (!data || data.length === 0) break
    for (const r of data as { item_id: string }[]) out.add(String(r.item_id))
    if (data.length < PAGE) break
  }
  return out
}

/** 완료 집합: 퀴즈형이면 합격한 quiz_id, 아니면 마스터한 item_id */
async function getCompletedIds(client: DbClient, userId: string, spec: AreaSpec): Promise<Set<string>> {
  if (spec.quizType) {
    const { data } = await client
      .from('quiz_attempts')
      .select('quiz_id')
      .eq('user_id', userId)
      .eq('passed', true)
    return new Set((data ?? []).map((r: { quiz_id: string }) => String(r.quiz_id)))
  }
  return getMasteredIds(client, userId, spec.itemType ?? '')
}

function intersectCount(a: Set<string>, b: Set<string>): number {
  const [small, big] = a.size < b.size ? [a, b] : [b, a]
  let n = 0
  for (const x of small) if (big.has(x)) n++
  return n
}

/**
 * 진도를 "번호(통일순번) 범위"로 세는 영역인지 여부.
 * 레벨 있는 항목형(JLPT: 語彙/文法/読解/聴解)만 해당. 퀴즈형·레벨없음(비즈니스)은 총합 방식 유지.
 */
function isRangeArea(spec: AreaSpec, level: string | null): boolean {
  return !spec.quizType && !!spec.levelColumn && !!level
}

/** rung 범위 [prev+1, cumulative] 안에서 마스터한 항목 수 (통일순번: 語彙=display_seq, 그 외=seq) */
function rangeMasteredCount(
  seqMap: Record<string, number>, mastIds: Set<string>, prev: number, cumulative: number,
): number {
  let c = 0
  for (const id of mastIds) {
    const n = seqMap[id]
    if (n && n > prev && n <= cumulative) c++
  }
  return c
}

// 누적 사다리 조회용: content_level 이 null 일 수 있어 분기
function ladderQuery(service: DbClient, menteeId: string, category: string, area: string, level: string | null) {
  let q = service
    .from('learning_assignments')
    .select('id, cumulative_target, target_count, created_at')
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
  const seqCache = new Map<string, Record<string, number>>()
  for (const { area } of requested) {
    const spec = areaSpec(category, area)
    if (spec && !poolCache.has(area)) poolCache.set(area, await getPoolIds(service, spec, level))
  }

  type Row = Record<string, unknown>
  const rows: Row[] = []
  let skipped = 0
  let merged = 0 // 같은 달 기존 rung에 합산한 건수
  const currentMonth = nowIso.slice(0, 7) // YYYY-MM

  for (const menteeId of assignedToList) {
    for (const { area, count } of requested) {
      const spec = areaSpec(category, area)
      if (!spec) continue
      const poolIds = poolCache.get(area)!
      const pool = poolIds.size

      const { data: prevRows } = await ladderQuery(service, menteeId, category, area, level)
      const latest = prevRows?.[0] as { id: string; cumulative_target: number | null; target_count: number | null; created_at: string | null } | undefined
      const prev: number = latest?.cumulative_target ?? 0

      const remaining = pool - prev
      if (remaining <= 0) { skipped++; continue }
      const capped = Math.min(count, remaining)
      const cumulative = prev + capped

      const mastIds = await getCompletedIds(service, menteeId, spec)
      let mastered: number
      if (isRangeArea(spec, level)) {
        const sk = `${level}::${area}`
        let seqMap = seqCache.get(sk)
        if (!seqMap) {
          seqMap = await getLevelSeqMap(service, spec.table, level!, { orderByPriority: spec.table === 'jlpt_vocabulary' })
          seqCache.set(sk, seqMap)
        }
        mastered = prev + rangeMasteredCount(seqMap, mastIds, prev, cumulative)
      } else {
        mastered = intersectCount(poolIds, mastIds)
      }
      const status = mastered >= cumulative ? 'completed' : (mastered > prev ? 'in_progress' : 'pending')

      // 같은 달의 최신 rung이 있으면 새 카드 대신 그 rung에 합산
      const latestIsThisMonth = latest && String(latest.created_at ?? '').slice(0, 7) === currentMonth
      if (latestIsThisMonth) {
        const newTc = (latest!.target_count ?? 0) + capped
        const title = level ? `${level} ${spec.label} ${newTc}項目` : `${spec.label} ${newTc}項目`
        await service.from('learning_assignments').update({
          target_count: newTc,
          cumulative_target: cumulative,
          mastered_snapshot: mastered,
          last_progress_at: nowIso,
          status,
          completed_at: status === 'completed' ? nowIso : null,
          title,
        }).eq('id', latest!.id)
        merged++
        continue
      }

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

  if (rows.length === 0 && merged === 0) {
    return { error: '対象全員がプール上限に達しており、配布できる項目がありません' }
  }

  let insertedCount = 0
  let firstId = ''
  if (rows.length > 0) {
    const { data, error } = await supabase
      .from('learning_assignments')
      .insert(rows)
      .select('id, assigned_to, status, title')
    if (error) return { error: error.message }
    insertedCount = data.length
    firstId = data[0]?.id ?? ''
    for (const row of data) {
      if (row.status === 'completed') continue
      await createNotification(
        row.assigned_to, 'task_assigned',
        `新しい学習課題: ${row.title}`, undefined, '/dashboard/assignments', row.id,
      )
    }
  }

  await logAuditEvent(user.id, 'create', 'learning_assignments', firstId, null, {
    kind: 'item_count', category, level, areas: requested,
    assignee_count: assignedToList.length, created: insertedCount, merged, skipped,
  })

  revalidatePath('/admin/tasks')
  revalidatePath('/dashboard')
  revalidatePath('/dashboard/assignments')
  revalidatePath('/admin/reports')
  return { success: true, created: insertedCount + merged, skipped }
}

// ─── 완료/진전/지연 자동 판정 (페이지 로드 시 lazy 실행) ───

export async function updateItemAssignmentStatuses(userId: string) {
  const service = createServiceRoleClient()
  if (!service) return

  const { data: active } = await service
    .from('learning_assignments')
    .select('id, category, content_level, subcategory, target_count, cumulative_target, mastered_snapshot, last_progress_at, last_stall_notified_at, created_at, assigned_by, title, status')
    .eq('assigned_to', userId)
    .in('category', ['seikatsu', 'business-jp', 'seikatsu-quiz', 'business-jp-quiz'])
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

    const level = first.content_level
    const mastIds = await getCompletedIds(service, userId, spec)
    const rangeMode = isRangeArea(spec, level)
    const seqMap = rangeMode
      ? await getLevelSeqMap(service, spec.table, level!, { orderByPriority: spec.table === 'jlpt_vocabulary' })
      : null
    const totalMastered = rangeMode ? 0 : intersectCount(await getPoolIds(service, spec, level), mastIds)

    for (const a of list) {
      const update: Record<string, unknown> = {}
      const cumulative = a.cumulative_target ?? 0
      const prev = cumulative - (a.target_count ?? 0)
      const mastered = rangeMode
        ? prev + rangeMasteredCount(seqMap!, mastIds, prev, cumulative)
        : totalMastered

      let lastProgress = a.last_progress_at
        ? new Date(a.last_progress_at).getTime()
        : new Date(a.created_at).getTime()

      const prevSnap = a.mastered_snapshot ?? 0
      if (mastered !== prevSnap) update.mastered_snapshot = mastered
      if (mastered > prevSnap) {
        update.last_progress_at = nowIso
        lastProgress = now
      }

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

  // 완료 집합: 퀴즈형이면 합격 quiz_id(영역 무관), 아니면 item_type별 — 전 멘티 일괄
  const catIsQuiz = (QUIZ_CATEGORIES as readonly string[]).includes(category)
  const masteredByUserType = new Map<string, Set<string>>()
  if (catIsQuiz) {
    const { data } = await service
      .from('quiz_attempts')
      .select('user_id, quiz_id')
      .eq('passed', true)
      .in('user_id', ids)
    for (const r of data ?? []) {
      const k = `${r.user_id}::quiz`
      if (!masteredByUserType.has(k)) masteredByUserType.set(k, new Set())
      masteredByUserType.get(k)!.add(String(r.quiz_id))
    }
  } else {
    const itemTypes = [...new Set(areas.map(a => areaSpec(category, a)!.itemType))]
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
      const mastIds = masteredByUserType.get(catIsQuiz ? `${menteeId}::quiz` : `${menteeId}::${spec.itemType}`) ?? new Set<string>()
      const mastered = intersectCount(poolIds, mastIds)
      const stalled = mine.some(a => a.status === 'overdue')
      rows.push({ menteeId, area, assignedCumulative, completedCount, mastered, pool: poolIds.size, stalled })
    }
  }

  return { rows }
}

// ─── 대시보드 집계 (완료항목 / 부여항목, 멘티별 카테고리별) ───

export interface ItemProgressPair { assigned: number; completed: number }
export interface MenteeItemProgress {
  seikatsu: ItemProgressPair            // 누적(完了 컬럼용): 전체 부여 누적 / 누적 완료
  businessJp: ItemProgressPair
  seikatsuThisMonth: ItemProgressPair   // 이번 달 부여분(今月課題 컬럼용)
  businessJpThisMonth: ItemProgressPair
  overall: ItemProgressPair             // 목표레벨 전체 풀(全体進捗 컬럼용)
  overdueItems: number                  // 遅延(항목 기준): 기한 지난(이전 달) 누적목표 − 습득항목
}

export interface QuizProgress { total: number; passed: number; attempted: number }

/**
 * 멘티별 理解度テスト(퀴즈형: seikatsu-quiz / business-jp-quiz) 부여분 집계.
 * total    = 각 사다리(카테고리·레벨·영역) MAX cumulative_target 합 (부여 개수)
 * passed   = min(풀 내 합격 퀴즈 수, 부여 개수) 합
 * attempted= min(풀 내 응시 퀴즈 수, 부여 개수) 합
 */
export async function aggregateQuizProgress(menteeIds: string[]): Promise<Record<string, QuizProgress>> {
  const result: Record<string, QuizProgress> = {}
  for (const id of menteeIds) result[id] = { total: 0, passed: 0, attempted: 0 }
  const ids = menteeIds.map(String).filter(Boolean)
  if (!ids.length) return result

  const service = createServiceRoleClient()
  if (!service) return result

  const { data: assigns } = await service
    .from('learning_assignments')
    .select('assigned_to, category, subcategory, content_level, cumulative_target')
    .in('assigned_to', ids)
    .in('category', QUIZ_CATEGORIES as unknown as string[])
    .not('target_count', 'is', null)

  // 사다리별 최대 누적 (mentee, category, level, area)
  const ladderMax = new Map<string, { menteeId: string; category: ItemCategory; level: string | null; area: string; cum: number }>()
  for (const a of assigns ?? []) {
    if (!isItemCategory(a.category)) continue
    const key = `${a.assigned_to}::${a.category}::${a.content_level ?? ''}::${a.subcategory}`
    const cur = ladderMax.get(key)
    const cum = a.cumulative_target ?? 0
    if (!cur || cum > cur.cum) ladderMax.set(key, { menteeId: a.assigned_to, category: a.category, level: a.content_level, area: a.subcategory, cum })
  }
  if (ladderMax.size === 0) return result

  // 풀 캐시 (category::level::area → quizId 집합)
  const poolCache = new Map<string, Set<string>>()
  for (const L of ladderMax.values()) {
    const spec = areaSpec(L.category, L.area)
    if (!spec) continue
    const poolKey = `${L.category}::${L.level ?? ''}::${L.area}`
    if (!poolCache.has(poolKey)) poolCache.set(poolKey, await getPoolIds(service, spec, L.level))
  }

  // 합격 점수 + 최고 점수 조회
  const allQuizIds = new Set<string>()
  for (const s of poolCache.values()) s.forEach(i => allQuizIds.add(i))
  const passingByQuiz = new Map<string, number>()
  const bestScore = new Map<string, number>() // `${userId}::${quizId}` → best score
  if (allQuizIds.size) {
    const idList = [...allQuizIds]
    const [{ data: qz }, { data: att }] = await Promise.all([
      service.from('quizzes').select('id, passing_score').in('id', idList),
      service.from('quiz_attempts').select('user_id, quiz_id, score').in('user_id', ids).in('quiz_id', idList).not('score', 'is', null),
    ])
    for (const q of qz ?? []) passingByQuiz.set(String(q.id), q.passing_score ?? 70)
    for (const a of att ?? []) {
      const k = `${a.user_id}::${a.quiz_id}`
      const cur = bestScore.get(k)
      if (cur == null || a.score > cur) bestScore.set(k, a.score)
    }
  }

  for (const L of ladderMax.values()) {
    const pool = poolCache.get(`${L.category}::${L.level ?? ''}::${L.area}`) ?? new Set<string>()
    let passedInPool = 0, attemptedInPool = 0
    for (const qid of pool) {
      const score = bestScore.get(`${L.menteeId}::${qid}`)
      if (score != null) {
        attemptedInPool++
        if (score >= (passingByQuiz.get(qid) ?? 70)) passedInPool++
      }
    }
    const r = result[L.menteeId]
    r.total += L.cum
    r.passed += Math.min(passedInPool, L.cum)
    r.attempted += Math.min(attemptedInPool, L.cum)
  }
  return result
}

/**
 * 멘티별 全体テスト 집계 = 부여와 무관하게 "목표 자격증 레벨의 生活 理解度テスト 전체 풀".
 * total = 목표레벨 seikatsu-quiz 5영역 풀 합, passed = 그중 합격 수.
 * (全体進捗(항목)의 테스트 버전 — 부여 안 받아도 풀 전체가 분모)
 */
export async function aggregateTestPoolProgress(menteeIds: string[]): Promise<Record<string, QuizProgress>> {
  const result: Record<string, QuizProgress> = {}
  for (const id of menteeIds) result[id] = { total: 0, passed: 0, attempted: 0 }
  const ids = menteeIds.map(String).filter(Boolean)
  if (!ids.length) return result

  const service = createServiceRoleClient()
  if (!service) return result

  const { data: profs } = await service.from('profiles').select('id, target_certification').in('id', ids)
  const targetById = new Map((profs ?? []).map(p => [String(p.id), p.target_certification as string | null]))
  const targetLevels = [...new Set([...targetById.values()].filter((v): v is string => !!v))]
  if (!targetLevels.length) return result

  const quizAreas = areaKeys('seikatsu-quiz')
  // 레벨×영역 풀 + 전체 quizId
  const lvlAreaPool = new Map<string, Set<string>>()
  const allQuizIds = new Set<string>()
  for (const lvl of targetLevels) {
    for (const area of quizAreas) {
      const spec = areaSpec('seikatsu-quiz', area)!
      const pool = await getPoolIds(service, spec, lvl)
      lvlAreaPool.set(`${lvl}::${area}`, pool)
      pool.forEach(i => allQuizIds.add(i))
    }
  }

  const passingByQuiz = new Map<string, number>()
  const bestScore = new Map<string, number>() // `${userId}::${quizId}` → best score
  if (allQuizIds.size) {
    const idList = [...allQuizIds]
    const [{ data: qz }, { data: att }] = await Promise.all([
      service.from('quizzes').select('id, passing_score').in('id', idList),
      service.from('quiz_attempts').select('user_id, quiz_id, score').in('user_id', ids).in('quiz_id', idList).not('score', 'is', null),
    ])
    for (const q of qz ?? []) passingByQuiz.set(String(q.id), q.passing_score ?? 70)
    for (const a of att ?? []) {
      const k = `${a.user_id}::${a.quiz_id}`
      const cur = bestScore.get(k)
      if (cur == null || a.score > cur) bestScore.set(k, a.score)
    }
  }

  for (const id of ids) {
    const lvl = targetById.get(id)
    if (!lvl) continue
    let total = 0, passed = 0, attempted = 0
    for (const area of quizAreas) {
      const pool = lvlAreaPool.get(`${lvl}::${area}`)
      if (!pool) continue
      total += pool.size
      for (const qid of pool) {
        const score = bestScore.get(`${id}::${qid}`)
        if (score != null) {
          attempted++
          if (score >= (passingByQuiz.get(qid) ?? 70)) passed++
        }
      }
    }
    result[id] = { total, passed, attempted }
  }
  return result
}

/**
 * 멘티별 (생활/비즈니스) 항목 집계.
 * 부여항목 = 각 사다리(카테고리·레벨·영역)의 MAX cumulative_target 합.
 * 완료항목 = min(마스터 수, 부여누적) 합 (실제 학습 완료 항목).
 */
export async function aggregateItemProgress(menteeIds: string[]): Promise<Record<string, MenteeItemProgress>> {
  const result: Record<string, MenteeItemProgress> = {}
  for (const id of menteeIds) {
    result[id] = {
      seikatsu: { assigned: 0, completed: 0 }, businessJp: { assigned: 0, completed: 0 },
      seikatsuThisMonth: { assigned: 0, completed: 0 }, businessJpThisMonth: { assigned: 0, completed: 0 },
      overall: { assigned: 0, completed: 0 }, overdueItems: 0,
    }
  }
  const ids = menteeIds.map(String).filter(Boolean)
  if (!ids.length) return result

  const service = createServiceRoleClient()
  if (!service) return result

  const { data: assigns } = await service
    .from('learning_assignments')
    .select('assigned_to, category, subcategory, content_level, cumulative_target, target_count, created_at')
    .in('assigned_to', ids)
    .in('category', ['seikatsu', 'business-jp'])
    .not('target_count', 'is', null)

  // 사다리별(mentee, category, level, area):
  //   maxCum          = 누적목표(cumulative_target) 최댓값      → 完了(누적) 분모
  //   prevCum         = 이번 달 이전까지의 누적목표 최댓값
  //   thisMonthTarget = 이번 달 생성 rung의 target_count 합     → 今月課題 분모
  const nowMonth = new Date().toISOString().slice(0, 7) // 'YYYY-MM' (UTC)
  const ladders = new Map<string, { menteeId: string; category: ItemCategory; level: string | null; area: string; maxCum: number; prevCum: number; thisMonthTarget: number }>()
  for (const a of (assigns ?? [])) {
    if (!isItemCategory(a.category)) continue
    const key = `${a.assigned_to}::${a.category}::${a.content_level ?? ''}::${a.subcategory}`
    let L = ladders.get(key)
    if (!L) { L = { menteeId: a.assigned_to, category: a.category, level: a.content_level, area: a.subcategory, maxCum: 0, prevCum: 0, thisMonthTarget: 0 }; ladders.set(key, L) }
    const cum = a.cumulative_target ?? 0
    L.maxCum = Math.max(L.maxCum, cum)
    if (String(a.created_at ?? '').slice(0, 7) === nowMonth) L.thisMonthTarget += a.target_count ?? 0
    else L.prevCum = Math.max(L.prevCum, cum)
  }

  // 풀 캐시 (category::level::area)
  const poolCache = new Map<string, Set<string>>()
  // 마스터 캐시 (userId::itemType)
  const masteredCache = new Map<string, Set<string>>()

  for (const L of ladders.values()) {
    const spec = areaSpec(L.category, L.area)
    if (!spec) continue

    const poolKey = `${L.category}::${L.level ?? ''}::${L.area}`
    let poolIds = poolCache.get(poolKey)
    if (!poolIds) { poolIds = await getPoolIds(service, spec, L.level); poolCache.set(poolKey, poolIds) }

    const mKey = `${L.menteeId}::${spec.itemType}`
    let mastIds = masteredCache.get(mKey)
    if (!mastIds) { mastIds = await getMasteredIds(service, L.menteeId, spec.itemType); masteredCache.set(mKey, mastIds) }

    const rawMastered = intersectCount(poolIds, mastIds)
    const isSeikatsu = L.category === 'seikatsu'

    // 完了(누적): 부여 누적까지의 완료
    const cumBucket = isSeikatsu ? result[L.menteeId].seikatsu : result[L.menteeId].businessJp
    cumBucket.assigned += L.maxCum
    cumBucket.completed += Math.min(rawMastered, L.maxCum)

    // 今月課題: (습득 − 이전달까지 누적목표)를 이번 달 부여분으로 캡
    const tmBucket = isSeikatsu ? result[L.menteeId].seikatsuThisMonth : result[L.menteeId].businessJpThisMonth
    tmBucket.assigned += L.thisMonthTarget
    tmBucket.completed += Math.max(0, Math.min(rawMastered - L.prevCum, L.thisMonthTarget))

    // 遅延(항목 기준): 이전 달까지 누적목표 중 아직 습득 못한 수 (이번 달분은 기한 전이라 제외)
    result[L.menteeId].overdueItems += Math.max(0, L.prevCum - rawMastered)
  }

  // ── 全体進捗 = 목표 레벨의 生活日本語 전 영역: 마스터(실제·상한없음) / 전체 풀 ──
  // 과제 부여와 무관하게 항상 계산 (부여보다 더 진행한 것도 포함)
  const { data: profs } = await service.from('profiles').select('id, target_certification').in('id', ids)
  const targetById = new Map((profs ?? []).map(p => [p.id, p.target_certification as string | null]))
  const seikatsuAreas = areaKeys('seikatsu')
  const targetLevels = [...new Set([...targetById.values()].filter((v): v is string => !!v))]
  const lvlAreaPool = new Map<string, Set<string>>()
  for (const lvl of targetLevels) {
    for (const area of seikatsuAreas) {
      const spec = areaSpec('seikatsu', area)!
      lvlAreaPool.set(`${lvl}::${area}`, await getPoolIds(service, spec, lvl))
    }
  }
  const seikatsuItemTypes = [...new Set(seikatsuAreas.map(a => areaSpec('seikatsu', a)!.itemType))]
  const masteredAll = new Map<string, Set<string>>()
  for (const itemType of seikatsuItemTypes) {
    for (let offset = 0; ; offset += 1000) {
      const { data } = await service.from('user_mastered_items').select('user_id, item_id').eq('item_type', itemType).in('user_id', ids).range(offset, offset + 999)
      if (!data || data.length === 0) break
      for (const r of data) {
        const k = `${r.user_id}::${itemType}`
        if (!masteredAll.has(k)) masteredAll.set(k, new Set())
        masteredAll.get(k)!.add(String(r.item_id))
      }
      if (data.length < 1000) break
    }
  }
  for (const id of ids) {
    const tgt = targetById.get(id)
    if (!tgt) { result[id].overall = { assigned: 0, completed: 0 }; continue }
    let completed = 0, total = 0
    for (const area of seikatsuAreas) {
      const spec = areaSpec('seikatsu', area)!
      const pool = lvlAreaPool.get(`${tgt}::${area}`)
      if (!pool) continue
      total += pool.size
      completed += intersectCount(pool, masteredAll.get(`${id}::${spec.itemType}`) ?? new Set<string>())
    }
    result[id].overall = { assigned: total, completed }
  }

  return result
}

// ─── JLPT 파트별 습득 현황 (목표레벨 기준) — 대시보드 공지 하단, 개개인별 표시용 ───

export interface JlptPartProgress {
  level: string
  parts: { area: string; areaLabel: string; done: number; total: number }[]
  /** JLPT模試: total=공개된 전체 세트 수(레벨별), done=응시(완료/불합격)한 세트 수 */
  mock: { done: number; total: number }
}

/**
 * 멘티별 목표 JLPT 레벨의 영역(語彙/文法/読解/聴解)별 습득 수 / 전체 수.
 * 과제 부여 여부와 무관하게 목표 레벨 풀 전체를 분모로 한다(예: 4/3200).
 * 목표 레벨이 JLPT(N1~N5)가 아닌 멘티는 결과에서 제외.
 */
export async function aggregateJlptPartProgress(menteeIds: string[]): Promise<Record<string, JlptPartProgress>> {
  const result: Record<string, JlptPartProgress> = {}
  const ids = menteeIds.map(String).filter(Boolean)
  if (!ids.length) return result

  const service = createServiceRoleClient()
  if (!service) return result

  const { data: profs } = await service.from('profiles').select('id, target_certification').in('id', ids)
  const targetById = new Map((profs ?? []).map(p => [p.id, p.target_certification as string | null]))
  const seikatsuAreas = areaKeys('seikatsu')
  const targetLevels = [...new Set([...targetById.values()].filter((v): v is string => !!v && isJlptLevel(v)))]
  if (!targetLevels.length) return result

  // 레벨·영역별 항목 풀 (레벨당 1회 조회, getPoolIds 는 1000행 페이지네이션 내장)
  const lvlAreaPool = new Map<string, Set<string>>()
  for (const lvl of targetLevels) {
    for (const area of seikatsuAreas) {
      const spec = areaSpec('seikatsu', area)!
      lvlAreaPool.set(`${lvl}::${area}`, await getPoolIds(service, spec, lvl))
    }
  }

  // 멘티별 마스터 항목 (item_type별)
  const seikatsuItemTypes = [...new Set(seikatsuAreas.map(a => areaSpec('seikatsu', a)!.itemType))]
  const masteredAll = new Map<string, Set<string>>()
  for (const itemType of seikatsuItemTypes) {
    for (let offset = 0; ; offset += 1000) {
      const { data } = await service.from('user_mastered_items').select('user_id, item_id').eq('item_type', itemType).in('user_id', ids).range(offset, offset + 999)
      if (!data || data.length === 0) break
      for (const r of data) {
        const k = `${r.user_id}::${itemType}`
        if (!masteredAll.has(k)) masteredAll.set(k, new Set())
        masteredAll.get(k)!.add(String(r.item_id))
      }
      if (data.length < 1000) break
    }
  }

  // 이번달 JLPT模試: total=이번달 부여되면 1, done=가장 최근 부여 인스턴스를 풀었으면(완료/불합격) 1
  // 模試는 다른 영역처럼 "전체 세트 수" 기준 — total=공개된 레벨별 세트 수, done=응시(완료/불합격)한 세트 수
  const { data: mockSets } = await service
    .from('jlpt_mock_sets')
    .select('level, set_no')
    .eq('is_published', true)
  const setsCountByLevel = new Map<string, number>()
  for (const s of mockSets ?? []) setsCountByLevel.set(s.level, (setsCountByLevel.get(s.level) ?? 0) + 1)

  const { data: mocks } = await service
    .from('comprehensive_exams')
    .select('user_id, content_level, mock_set_no, mock_session, status')
    .in('user_id', ids)
    .eq('category', 'jlpt-mock')
    .in('status', ['completed', 'failed'])
  // user → 응시한 세트 집합 (level::set). 1교시 placeholder(session=1) 제외
  const takenSetsByUser = new Map<string, Set<string>>()
  for (const m of mocks ?? []) {
    if (m.mock_session === 1) continue
    let s = takenSetsByUser.get(m.user_id)
    if (!s) { s = new Set(); takenSetsByUser.set(m.user_id, s) }
    s.add(`${m.content_level}::${m.mock_set_no}`)
  }

  for (const id of ids) {
    const tgt = targetById.get(id)
    if (!tgt || !isJlptLevel(tgt)) continue
    const parts = seikatsuAreas.map(area => {
      const spec = areaSpec('seikatsu', area)!
      const pool = lvlAreaPool.get(`${tgt}::${area}`) ?? new Set<string>()
      const done = intersectCount(pool, masteredAll.get(`${id}::${spec.itemType}`) ?? new Set<string>())
      return { area, areaLabel: areaLabel('seikatsu', area), done, total: pool.size }
    })
    const mockTotal = setsCountByLevel.get(tgt) ?? 0
    const taken = takenSetsByUser.get(id)
    const mockDone = taken ? [...taken].filter(k => k.startsWith(`${tgt}::`)).length : 0
    result[id] = { level: tgt, parts, mock: { done: mockDone, total: mockTotal } }
  }

  return result
}

// ─── 멘티 본인 항목 과제 진척 (대시보드용) ───

export interface MyItemRow {
  level: string
  area: string
  areaLabel: string
  assigned: number   // 부여 누적
  mastered: number   // 내가 마스터(완료)한 수 (초과분 포함)
  pool: number       // 해당 레벨·영역 전체
}

export async function getMyItemAssignmentProgress(): Promise<MyItemRow[]> {
  const auth = await requireAuth()
  if ('error' in auth) return []
  const { supabase, user } = auth

  const { data: assigns } = await supabase
    .from('learning_assignments')
    .select('subcategory, content_level, cumulative_target')
    .eq('assigned_to', user.id)
    .eq('category', 'seikatsu')
    .not('target_count', 'is', null)

  if (!assigns?.length) return []

  // (레벨·영역)별 최대 누적
  const ladder = new Map<string, { level: string; area: string; cum: number }>()
  for (const a of assigns) {
    if (!a.content_level) continue
    const key = `${a.content_level}::${a.subcategory}`
    const cum = a.cumulative_target ?? 0
    const cur = ladder.get(key)
    if (!cur || cum > cur.cum) ladder.set(key, { level: a.content_level, area: a.subcategory, cum })
  }

  const rows: MyItemRow[] = []
  for (const L of ladder.values()) {
    const spec = areaSpec('seikatsu', L.area)
    if (!spec) continue
    const poolIds = await getPoolIds(supabase, spec, L.level)
    const mastIds = await getMasteredIds(supabase, user.id, spec.itemType)
    rows.push({
      level: L.level, area: L.area, areaLabel: spec.label,
      assigned: L.cum, mastered: intersectCount(poolIds, mastIds), pool: poolIds.size,
    })
  }

  const areaOrder = areaKeys('seikatsu')
  rows.sort((a, b) => (a.level === b.level ? areaOrder.indexOf(a.area) - areaOrder.indexOf(b.area) : a.level.localeCompare(b.level)))
  return rows
}

/**
 * 단일 과제(項目/理解テスト)의 진척 — 멘토/관리자 리포트 카드용.
 * mastered = 풀 ∩ 완료(마스ター item 또는 합격 quiz), 부여 누적 상한 캡.
 * total    = 부여 누적(cumulative_target). 항목/퀴즈형 공통, 한자 포함.
 * item 카테고리가 아니면 null → 호출측에서 별도 처리(business-lit 등).
 */
export async function getReportItemProgress(
  service: DbClient,
  userId: string,
  category: string,
  subcategory: string,
  contentLevel: string | null,
  cumulativeTarget: number | null,
): Promise<{ mastered: number; total: number } | null> {
  if (!isItemCategory(category)) return null
  const spec = areaSpec(category, subcategory)
  if (!spec) return null
  const [pool, completed] = await Promise.all([
    getPoolIds(service, spec, contentLevel),
    getCompletedIds(service, userId, spec),
  ])
  const total = cumulativeTarget && cumulativeTarget > 0 ? cumulativeTarget : pool.size
  const mastered = Math.min(intersectCount(pool, completed), total)
  return { mastered, total }
}

// ─── 월간 자동 부여 (매달 1회, lazy: 달 바뀐 뒤 첫 접근 시 실행) ───

export interface MonthlyAssignConfig {
  vocabulary: number; grammar: number; reading: number; listening: number
}
const DEFAULT_MONTHLY_COUNTS: MonthlyAssignConfig = { vocabulary: 100, grammar: 10, reading: 10, listening: 10 }
const MONTHLY_CONFIG_LEVELS = ['N1', 'N2', 'N3', 'N4', 'N5'] as const

function parseMonthlyCfg(raw: unknown): MonthlyAssignConfig {
  const o = (raw ?? {}) as Partial<Record<keyof MonthlyAssignConfig, unknown>>
  const num = (v: unknown, d: number) => { const n = Math.floor(Number(v)); return Number.isFinite(n) && n >= 0 ? n : d }
  return {
    vocabulary: num(o.vocabulary, DEFAULT_MONTHLY_COUNTS.vocabulary),
    grammar: num(o.grammar, DEFAULT_MONTHLY_COUNTS.grammar),
    reading: num(o.reading, DEFAULT_MONTHLY_COUNTS.reading),
    listening: num(o.listening, DEFAULT_MONTHLY_COUNTS.listening),
  }
}

/** 특정 레벨의 월별 자동부여 개수 (per_level 우선, 없으면 레거시 플랫 컬럼/기본값) */
export async function getMonthlyAssignmentConfig(level: string = 'N1'): Promise<MonthlyAssignConfig> {
  const service = createServiceRoleClient()
  if (!service) return DEFAULT_MONTHLY_COUNTS
  const { data } = await service
    .from('monthly_assignment_config')
    .select('vocabulary, grammar, reading, listening, per_level')
    .eq('id', true)
    .maybeSingle()
  if (!data) return DEFAULT_MONTHLY_COUNTS
  const perLevel = (data.per_level ?? {}) as Record<string, unknown>
  if (perLevel[level]) return parseMonthlyCfg(perLevel[level])
  return parseMonthlyCfg({ vocabulary: data.vocabulary, grammar: data.grammar, reading: data.reading, listening: data.listening })
}

/** N1~N5 전 레벨 설정 (관리 UI용) */
export async function getAllMonthlyAssignmentConfigs(): Promise<Record<string, MonthlyAssignConfig>> {
  const out: Record<string, MonthlyAssignConfig> = {}
  const service = createServiceRoleClient()
  if (!service) { for (const l of MONTHLY_CONFIG_LEVELS) out[l] = DEFAULT_MONTHLY_COUNTS; return out }
  const { data } = await service
    .from('monthly_assignment_config')
    .select('vocabulary, grammar, reading, listening, per_level')
    .eq('id', true)
    .maybeSingle()
  const perLevel = (data?.per_level ?? {}) as Record<string, unknown>
  const legacy = data ? parseMonthlyCfg({ vocabulary: data.vocabulary, grammar: data.grammar, reading: data.reading, listening: data.listening }) : DEFAULT_MONTHLY_COUNTS
  for (const l of MONTHLY_CONFIG_LEVELS) out[l] = perLevel[l] ? parseMonthlyCfg(perLevel[l]) : legacy
  return out
}

/** 특정 레벨의 월별 자동부여 개수 수정 (관리자 전용) */
export async function updateMonthlyAssignmentConfig(level: string, counts: MonthlyAssignConfig) {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error } as const
  const service = createServiceRoleClient()
  if (!service) return { error: 'サービスが利用できません' }
  const clean = (n: unknown) => Math.max(0, Math.floor(Number(n) || 0))
  const cfg = { vocabulary: clean(counts.vocabulary), grammar: clean(counts.grammar), reading: clean(counts.reading), listening: clean(counts.listening) }
  const { data: row } = await service.from('monthly_assignment_config').select('per_level').eq('id', true).maybeSingle()
  const perLevel = { ...((row?.per_level ?? {}) as Record<string, unknown>), [level]: cfg }
  const { error } = await service
    .from('monthly_assignment_config')
    .update({
      per_level: perLevel,
      updated_at: new Date().toISOString(), updated_by: auth.user.id,
    })
    .eq('id', true)
  if (error) return { error: error.message }
  revalidatePath('/admin/tasks')
  return { success: true }
}

/**
 * 목표 레벨이 설정된 멘티 전원에게 그 달 1회 항목과제를 자동 부여한다.
 * 영역별 개수는 monthly_assignment_config(관리자 설정)에서 읽음, 각자 잔량까지만 캡·누적.
 * dedup: profiles.last_auto_assign_month. 크론 없이 대시보드 로드 시 호출.
 */
/** 멘티의 월자동부여 옵트인 토글. 해제 시 월자동부여 제외(멘토가 課題 버튼으로 개별 부여). */
export async function setMenteeAutoAssign(menteeId: string, enabled: boolean): Promise<{ ok: true } | { error: string }> {
  const auth = await requireAdminOrMentor()
  if ('error' in auth) return { error: auth.error ?? '権限がありません' }
  const service = createServiceRoleClient() ?? auth.supabase
  const { error } = await service.from('profiles').update({ monthly_auto_assign: enabled }).eq('id', menteeId).eq('role', 'mentee')
  if (error) return { error: error.message }
  return { ok: true }
}

export async function runMonthlyAutoAssignment(): Promise<void> {
  const service = createServiceRoleClient()
  if (!service) return

  const cfgByLevel = new Map<string, MonthlyAssignConfig>()
  const now = new Date()
  const currentMonth = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`
  const monthStart = `${currentMonth}-01`

  const { data: mentees } = await service
    .from('profiles')
    .select('id, target_certification, last_auto_assign_month')
    .eq('role', 'mentee')
    .eq('monthly_auto_assign', true)
    .not('target_certification', 'is', null)
    .or(`last_auto_assign_month.is.null,last_auto_assign_month.neq.${currentMonth}`)

  if (!mentees?.length) return

  const { data: adminRow } = await service.from('profiles').select('id').eq('role', 'admin').limit(1).maybeSingle()
  const nowIso = now.toISOString()
  const areas = areaKeys('seikatsu')
  const poolCache = new Map<string, Set<string>>()
  const seqCache = new Map<string, Record<string, number>>()

  for (const m of mentees) {
    const level = m.target_certification as string
    if (!isJlptLevel(level)) continue
    const assignedBy = adminRow?.id ?? m.id
    let monthlyCounts = cfgByLevel.get(level)
    if (!monthlyCounts) { monthlyCounts = await getMonthlyAssignmentConfig(level); cfgByLevel.set(level, monthlyCounts) }

    // Atomically claim this month for this mentee BEFORE inserting, so concurrent
    // dashboard-triggered runs can't each pass the stale guard and insert duplicates.
    // Only the invocation that actually flips the flag proceeds; the rest skip.
    const { data: claimed } = await service
      .from('profiles')
      .update({ last_auto_assign_month: currentMonth })
      .eq('id', m.id)
      .or(`last_auto_assign_month.is.null,last_auto_assign_month.neq.${currentMonth}`)
      .select('id')
    if (!claimed || claimed.length === 0) continue

    let failedAny = false
    for (const area of areas) {
      const want = monthlyCounts[area as keyof MonthlyAssignConfig] ?? 0
      if (want <= 0) continue
      const spec = areaSpec('seikatsu', area)
      if (!spec) continue

      // 재시도 안전(멱등): 이번 달 이 영역 rung이 이미 있으면 스킵 (부분실패 재시도 시 중복 방지)
      const { data: existThisMonth } = await service
        .from('learning_assignments')
        .select('id')
        .eq('assigned_to', m.id).eq('category', 'seikatsu').eq('subcategory', area).eq('content_level', level)
        .gte('created_at', monthStart).limit(1)
      if (existThisMonth && existThisMonth.length > 0) continue

      const poolKey = `${level}::${area}`
      let poolIds = poolCache.get(poolKey)
      if (!poolIds) { poolIds = await getPoolIds(service, spec, level); poolCache.set(poolKey, poolIds) }

      const { data: prevRows } = await service
        .from('learning_assignments')
        .select('cumulative_target')
        .eq('assigned_to', m.id).eq('category', 'seikatsu').eq('subcategory', area).eq('content_level', level)
        .not('target_count', 'is', null)
        .order('cumulative_target', { ascending: false }).limit(1)
      const prev: number = prevRows?.[0]?.cumulative_target ?? 0
      const remaining = poolIds.size - prev
      if (remaining <= 0) continue
      const capped = Math.min(want, remaining)
      const cumulative = prev + capped

      const mastIds = await getCompletedIds(service, m.id, spec)
      let mastered: number
      if (isRangeArea(spec, level)) {
        const sk = `${level}::${area}`
        let seqMap = seqCache.get(sk)
        if (!seqMap) {
          seqMap = await getLevelSeqMap(service, spec.table, level, { orderByPriority: spec.table === 'jlpt_vocabulary' })
          seqCache.set(sk, seqMap)
        }
        mastered = prev + rangeMasteredCount(seqMap, mastIds, prev, cumulative)
      } else {
        mastered = intersectCount(poolIds, mastIds)
      }
      const status = mastered >= cumulative ? 'completed' : (mastered > prev ? 'in_progress' : 'pending')

      const { data: ins, error: insErr } = await service.from('learning_assignments').insert({
        assigned_by: assignedBy,
        assigned_to: m.id,
        category: 'seikatsu',
        subcategory: area,
        content_level: level,
        title: `${level} ${spec.label} ${capped}項目`,
        target_count: capped,
        cumulative_target: cumulative,
        mastered_snapshot: mastered,
        last_progress_at: nowIso,
        status,
        completed_at: status === 'completed' ? nowIso : null,
      }).select('id').single()

      if (insErr) {
        console.error('[monthly-auto-assign] insert failed', m.id, area, insErr.message)
        failedAny = true
        continue
      }

      if (ins && status !== 'completed') {
        await createNotification(m.id, 'task_assigned', `今月の学習課題: ${level} ${spec.label} ${capped}項目`, undefined, '/dashboard/assignments', ins.id)
      }
    }

    // 삽입 실패가 하나라도 있으면 이번 달 claim 해제 → 다음 로드에서 재시도(위 멱등 스킵으로 중복 없음)
    if (failedAny) {
      await service.from('profiles').update({ last_auto_assign_month: null }).eq('id', m.id)
    }
  }
}
