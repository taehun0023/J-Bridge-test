import type { createClient, createServiceRoleClient } from '@/lib/supabase/server'

type DbClient =
  | Awaited<ReturnType<typeof createClient>>
  | NonNullable<ReturnType<typeof createServiceRoleClient>>

/**
 * 주어진 레벨에 속하는 "마스터한 항목 id"만 추려서 반환.
 * `.in('id', masteredIds)` 에 수백 개 id를 한 번에 넣으면 요청 URL 길이 초과로 실패(→0)하므로,
 * 청크(150개)로 나눠 조회한 뒤 합친다.
 */
export async function getMasteredLevelIds(
  client: DbClient,
  table: string,
  level: string,
  masteredIds: string[],
): Promise<string[]> {
  if (!masteredIds.length) return []
  const out: string[] = []
  for (let i = 0; i < masteredIds.length; i += 150) {
    const { data } = await client.from(table).select('id')
      .eq('jlpt_level', level).in('id', masteredIds.slice(i, i + 150))
    for (const r of (data ?? []) as { id: string }[]) out.push(String(r.id))
  }
  return out
}

/**
 * 레벨 내 항목의 "고정 순번" 맵(id → 1-based 번호). created_at 오름차순 기준이라
 * 필터(未暗記 등)·페이지와 무관하게 항목마다 번호가 항상 같다.
 */
export async function getLevelSeqMap(
  client: DbClient,
  table: string,
  level: string,
  opts?: { orderByPriority?: boolean },
): Promise<Record<string, number>> {
  const map: Record<string, number> = {}

  if (opts?.orderByPriority) {
    // 통일 순번: DB의 display_seq(우선순위 비율 인터리빙 기준 1,2,3…)를 그대로 사용
    // 화면 출력·화면 번호·과제 범위·범위 퀴즈·대시보드 점프가 모두 이 번호로 일치
    for (let from = 0; ; from += 1000) {
      const { data } = await client.from(table).select('id, display_seq')
        .eq('jlpt_level', level)
        .order('display_seq', { ascending: true })
        .range(from, from + 999)
      const rows = (data ?? []) as { id: string; display_seq: number | null }[]
      for (const r of rows) map[String(r.id)] = r.display_seq ?? 0
      if (rows.length < 1000) break
    }
    return map
  }

  // 기본: 고정 seq 컬럼(본방 항목 먼저, 로컬 추가분 뒤)을 그대로 사용 → 화면 번호 = 영구 고정
  for (let from = 0; ; from += 1000) {
    const { data } = await client.from(table).select('id, seq')
      .eq('jlpt_level', level).order('seq', { ascending: true }).range(from, from + 999)
    const rows = (data ?? []) as { id: string; seq: number | null }[]
    for (const r of rows) map[String(r.id)] = r.seq ?? 0
    if (rows.length < 1000) break
  }
  return map
}
