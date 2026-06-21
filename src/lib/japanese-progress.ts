/**
 * 멘토/관리자 대시보드용 일본어 학습 진척률 집계.
 *
 * 일본어 과제만 집계 대상 (生活日本語 / ビジネス日本語).
 * 카테고리 값 호환:
 *   seikatsu | 生活日本語  → seikatsu
 *   business-jp | business_jp | ビジネス日本語  → businessJp
 */

export interface JapaneseAssignmentRow {
  assigned_to: string
  category: string
  status: string
  due_date: string | null
  created_at: string | null
  completed_at: string | null
  target_count: number | null
}

export interface CountPair {
  completed: number
  total: number
}

export interface JapaneseProgressStat {
  seikatsu: CountPair            // 今月課題(이번 달 부여분) — override 후 채워짐
  seikatsuCumulative: CountPair  // 完了(누적 완료/누적 부여) — override 후 채워짐
  businessJp: CountPair
  incomplete: number
  overdue: number
  all: CountPair
}

const SEIKATSU_KEYS = new Set(['seikatsu', '生活日本語'])
const BUSINESS_JP_KEYS = new Set(['business-jp', 'business_jp', 'ビジネス日本語'])

export function isJapaneseCategory(category: string): boolean {
  return SEIKATSU_KEYS.has(category) || BUSINESS_JP_KEYS.has(category)
}

export function normalizeJapaneseCategory(
  category: string,
): 'seikatsu' | 'businessJp' | null {
  if (SEIKATSU_KEYS.has(category)) return 'seikatsu'
  if (BUSINESS_JP_KEYS.has(category)) return 'businessJp'
  return null
}

function emptyStat(): JapaneseProgressStat {
  return {
    seikatsu: { completed: 0, total: 0 },
    seikatsuCumulative: { completed: 0, total: 0 },
    businessJp: { completed: 0, total: 0 },
    incomplete: 0,
    overdue: 0,
    all: { completed: 0, total: 0 },
  }
}

/**
 * mentee 별 일본어 과제 통계.
 * - menteeIds 에 포함되지만 과제가 없는 mentee 도 결과에 포함 (0 카운트).
 * - 과제는 미리 일본어 카테고리로 필터된 입력이 권장되지만, 안전을 위해 내부에서도 한번 더 거른다.
 */
export function aggregateJapaneseProgress(
  rows: JapaneseAssignmentRow[],
  menteeIds: string[],
  now: Date = new Date(),
): Map<string, JapaneseProgressStat> {
  const result = new Map<string, JapaneseProgressStat>()
  for (const id of menteeIds) result.set(id, emptyStat())

  const nowMs = now.getTime()

  for (const row of rows) {
    const bucket = normalizeJapaneseCategory(row.category)
    if (!bucket) continue
    const stat = result.get(row.assigned_to)
    if (!stat) continue // mentor 가 담당하지 않는 mentee 의 row 는 무시

    const isCompleted = row.status === 'completed'
    const dueMs = row.due_date ? new Date(row.due_date).getTime() : null
    const isOverdue =
      !isCompleted &&
      (row.status === 'overdue' || (dueMs !== null && dueMs < nowMs))

    // 누적 카테고리별
    if (bucket === 'seikatsu') {
      stat.seikatsu.total++
      if (isCompleted) stat.seikatsu.completed++
    } else {
      stat.businessJp.total++
      if (isCompleted) stat.businessJp.completed++
    }

    // 전체 일본어
    stat.all.total++
    if (isCompleted) stat.all.completed++

    // 미완료 / 지연 (지연은 항목 수(target_count) 합산 — rung 행 수가 아니라 실제 항목 수)
    if (!isCompleted) stat.incomplete++
    if (isOverdue) stat.overdue += row.target_count ?? 0
  }

  return result
}
