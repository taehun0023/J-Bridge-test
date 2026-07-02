import { NextResponse } from 'next/server'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { buildXlsx } from '@/lib/xlsx-lite'

// 매일 08:00 KST(=23:00 UTC) 실행 → 실행 시점(= 대시보드 실시간값) 멘티별 "부여과제 진행률"을
// 그 달 JSON에 일자별로 누적하고 엑셀(xlsx)로 렌더. Synology Chat 전송은 매주 목요일에만.
// 각 영역 = 이번달완료/이번달부여(+지난24h 증분), 지연 = 지난달까지 부여분 중 미완(과제 안 한 것).
// 대상 = 멘토 배정된 모든 멘티(과제 유무 무관). 정렬 = 날짜(최신순) → 멘토, 멘토/날짜 바뀌면 빈 줄.
export const dynamic = 'force-dynamic'

const AREAS = [
  { key: 'vocabulary', label: '어휘', itemType: 'jlpt_vocabulary', table: 'jlpt_vocabulary' },
  { key: 'grammar', label: '문법', itemType: 'jlpt_grammar', table: 'jlpt_grammar' },
  { key: 'reading', label: '독해', itemType: 'jlpt_reading', table: 'jlpt_reading_passages' },
  { key: 'listening', label: '청해', itemType: 'jlpt_listening', table: 'jlpt_listening_scripts' },
] as const

const kanjiName = (s: string | null) => (s || '').replace(/\s*[(（].*$/, '').trim()

type Svc = NonNullable<ReturnType<typeof createServiceRoleClient>>

async function getPool(service: Svc, table: string, level: string): Promise<Set<string>> {
  const ids = new Set<string>()
  for (let from = 0; ; from += 1000) {
    const { data } = await service.from(table).select('id').eq('jlpt_level', level).range(from, from + 999)
    const rows = data ?? []
    for (const r of rows as { id: string }[]) ids.add(String(r.id))
    if (rows.length < 1000) break
  }
  return ids
}

export async function GET(request: Request) {
  const secret = process.env.CRON_SECRET
  if (secret) {
    const a = request.headers.get('authorization')
    if (a !== `Bearer ${secret}`) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  }
  const webhook = process.env.SYNOLOGY_WEBHOOK_URL
  // Synology 전송 비활성화(본방): env 미설정이면 아무 것도 안 하고 종료 (준비되면 env 설정 + 아래 전송 블록 주석 해제)
  if (!webhook) return NextResponse.json({ ok: true, disabled: 'SYNOLOGY_WEBHOOK_URL 미설정' })
  const service = createServiceRoleClient()
  if (!service) return NextResponse.json({ error: 'service unavailable' }, { status: 500 })

  // 실행 시점(08:00 KST) 스냅샷 = 대시보드 실시간값과 동일. 행 날짜 = 실행일(오늘 KST).
  const nowMs = Date.now()
  const startMs = nowMs - 24 * 3600 * 1000 // 전날 리포트(≈어제 8시) — 증분(+n) 기준선
  const nowKst = new Date(nowMs + 9 * 3600 * 1000)
  const dateLabel = `${nowKst.getUTCFullYear()}-${String(nowKst.getUTCMonth() + 1).padStart(2, '0')}-${String(nowKst.getUTCDate()).padStart(2, '0')}`
  const monthKey = dateLabel.slice(0, 7)

  const rows = await computeEntries(service, dateLabel, monthKey, startMs)
  const { displayXlsx } = await renderAndStore(service, monthKey, dateLabel, nowKst, rows)

  // ── Synology 전송 비활성화(본방) ──
  // 준비되면 아래 블록 주석 해제(+ renderAndStore 반환에서 fileUrl 구조분해) → 매주 목요일 08:00 KST 전송
  // const fileUrl = ...(renderAndStore 반환)
  // const isThursday = nowKst.getUTCDay() === 4
  // if (isThursday) {
  //   const text = `📊 J-Bridge 주간 학습 현황 (${dateLabel} 시점)\n대상 ${rows.today.length}명 · 최근 진행 ${rows.progressed}명\n📎 ${displayXlsx} — 이번 달 일별 진행 누적`
  //   await fetch(webhook, {
  //     method: 'POST',
  //     headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
  //     body: 'payload=' + encodeURIComponent(JSON.stringify({ text, file_url: fileUrl })),
  //   })
  // }

  return NextResponse.json({ ok: true, date: dateLabel, file: displayXlsx, users: rows.today.length, progressed: rows.progressed, sent: false, synology: 'disabled' })
}

export interface SummaryEntry {
  date: string; mentor: string; name: string; cert: string
  vocab: string; grammar: string; reading: string; listening: string; overdue: number
}

type Ladder = { menteeId: string; level: string; area: string; prevCum: number; tmTarget: number }

// 실행 시점 스냅샷으로 오늘분 엔트리 계산 (대상 = 멘토 배정된 모든 멘티)
export async function computeEntries(
  service: Svc, dateLabel: string, monthKey: string, startMs: number,
): Promise<{ today: SummaryEntry[]; progressed: number }> {
  const [{ data: mentees }, { data: assigns }, { data: mentorRows }] = await Promise.all([
    service.from('profiles').select('id, full_name, target_certification').eq('role', 'mentee'),
    service.from('learning_assignments')
      .select('assigned_to, subcategory, content_level, cumulative_target, target_count, created_at')
      .eq('category', 'seikatsu').not('target_count', 'is', null),
    service.from('mentor_mentee_assignments').select('mentee_id, mentor:profiles!mentor_mentee_assignments_mentor_id_fkey(full_name)'),
  ])

  const ladders = new Map<string, Ladder>()
  for (const a of assigns ?? []) {
    if (a.content_level == null) continue
    const key = `${a.assigned_to}::${a.content_level}::${a.subcategory}`
    let L = ladders.get(key)
    if (!L) { L = { menteeId: a.assigned_to, level: a.content_level, area: a.subcategory, prevCum: 0, tmTarget: 0 }; ladders.set(key, L) }
    const cum = a.cumulative_target ?? 0
    if (String(a.created_at ?? '').slice(0, 7) === monthKey) L.tmTarget += a.target_count ?? 0
    else L.prevCum = Math.max(L.prevCum, cum)
  }

  const poolCache = new Map<string, Set<string>>()
  for (const L of ladders.values()) {
    const spec = AREAS.find(x => x.key === L.area)
    if (!spec) continue
    const pk = `${L.level}::${L.area}`
    if (!poolCache.has(pk)) poolCache.set(pk, await getPool(service, spec.table, L.level))
  }

  const menteeIds = [...new Set([...ladders.values()].map(L => L.menteeId))]
  const mastered = new Map<string, { id: string; at: number }[]>()
  if (menteeIds.length) {
    for (const spec of AREAS) {
      for (let off = 0; ; off += 1000) {
        const { data } = await service.from('user_mastered_items')
          .select('user_id, item_id, created_at')
          .eq('item_type', spec.itemType).in('user_id', menteeIds).range(off, off + 999)
        if (!data || data.length === 0) break
        for (const r of data as { user_id: string; item_id: string; created_at: string }[]) {
          const k = `${r.user_id}::${spec.itemType}`
          if (!mastered.has(k)) mastered.set(k, [])
          mastered.get(k)!.push({ id: String(r.item_id), at: new Date(r.created_at).getTime() })
        }
        if (data.length < 1000) break
      }
    }
  }

  const byId = new Map((mentees ?? []).map(m => [m.id, m]))
  const mentorByMentee = new Map<string, string>()
  for (const r of (mentorRows ?? []) as Array<{ mentee_id: string; mentor: { full_name: string | null } | { full_name: string | null }[] | null }>) {
    const mm = Array.isArray(r.mentor) ? r.mentor[0] : r.mentor
    if (r.mentee_id && mm?.full_name) mentorByMentee.set(r.mentee_id, kanjiName(mm.full_name))
  }
  const laddersByMentee = new Map<string, Ladder[]>()
  for (const L of ladders.values()) {
    if (!laddersByMentee.has(L.menteeId)) laddersByMentee.set(L.menteeId, [])
    laddersByMentee.get(L.menteeId)!.push(L)
  }

  const today: SummaryEntry[] = []
  let progressed = 0
  for (const [menteeId, mentor] of mentorByMentee) { // 멘토 배정된 모든 멘티
    const m = byId.get(menteeId)
    if (!m) continue
    const Ls = laddersByMentee.get(menteeId) ?? []
    const cells: Record<string, string> = {}
    let overdue = 0, anyProgress = false
    for (const spec of AREAS) {
      const L = Ls.find(x => x.area === spec.key)
      if (!L) { cells[spec.key] = '-'; continue }
      const pool = poolCache.get(`${L.level}::${L.area}`) ?? new Set<string>()
      const list = (mastered.get(`${menteeId}::${spec.itemType}`) ?? []).filter(x => pool.has(x.id))
      const endCount = list.length // 실행 시점까지 습득(현재) = 대시보드와 동일
      const startCount = list.filter(x => x.at < startMs).length // 전날 리포트 시점 기준선
      const X = Math.max(0, Math.min(endCount - L.prevCum, L.tmTarget))
      const Xp = Math.max(0, Math.min(startCount - L.prevCum, L.tmTarget))
      const d = X - Xp
      if (d > 0) anyProgress = true
      overdue += Math.max(0, L.prevCum - endCount)
      cells[spec.key] = L.tmTarget > 0 ? `${X}/${L.tmTarget}(+${d})` : '-'
    }
    if (anyProgress) progressed++
    today.push({ date: dateLabel, mentor, name: kanjiName(m.full_name), cert: m.target_certification ?? '', vocab: cells.vocabulary, grammar: cells.grammar, reading: cells.reading, listening: cells.listening, overdue })
  }
  today.sort((a, b) => a.mentor.localeCompare(b.mentor, 'ja') || a.name.localeCompare(b.name, 'ja'))
  return { today, progressed }
}

// JSON 소스 누적(날짜 최신순) + xlsx 렌더/업로드. 반환: 공개 URL + 표시 파일명
export async function renderAndStore(
  service: Svc, monthKey: string, dateLabel: string, nowKst: Date,
  rows: { today: SummaryEntry[] },
): Promise<{ fileUrl: string; displayXlsx: string }> {
  const srcPath = `monthly/${monthKey}.json`
  let kept: SummaryEntry[] = []
  const dlj = await service.storage.from('study-reports').download(srcPath)
  if (dlj.data) {
    try { kept = (JSON.parse(await dlj.data.text()) as SummaryEntry[]).filter(e => e.date !== dateLabel) } catch { kept = [] }
  }
  const all = [...rows.today, ...kept] // 오늘분 prepend = 날짜 최신순
  await service.storage.from('study-reports')
    .upload(srcPath, new Blob([JSON.stringify(all)], { type: 'application/json' }), { upsert: true, contentType: 'application/json' })

  const header = ['날짜', '멘토', '이름', '자격증', '어휘', '문법', '독해', '청해', '지연']
  const sheet: (string | number | null)[][] = [header]
  let prev: SummaryEntry | null = null
  for (const e of all) {
    if (prev && (prev.date !== e.date || prev.mentor !== e.mentor)) sheet.push([]) // 멘토/날짜 바뀌면 빈 줄
    sheet.push([e.date, e.mentor, e.name, e.cert, e.vocab, e.grammar, e.reading, e.listening, e.overdue])
    prev = e
  }
  const xlsx = await buildXlsx('学習状況', sheet)
  const xlsxPath = `monthly/${monthKey}.xlsx`
  const displayXlsx = `${nowKst.getUTCFullYear()}年${nowKst.getUTCMonth() + 1}月 学習状況.xlsx`
  await service.storage.from('study-reports')
    .upload(xlsxPath, new Blob([xlsx as BlobPart], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' }),
      { upsert: true, contentType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
  const fileUrl = service.storage.from('study-reports').getPublicUrl(xlsxPath, { download: displayXlsx }).data.publicUrl
  return { fileUrl, displayXlsx }
}
