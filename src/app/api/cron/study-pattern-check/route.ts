import { NextResponse } from 'next/server'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { notifyMentorsAndAdmins, getUserDisplayName } from '@/lib/notification-helpers'

// 매일 07:00 KST(22:00 UTC) 실행. 전날 학습에서 "내용 안 보고 정답 찍기" 의심 패턴을 가진
// 멘티를 찾아 담당 멘토/관리자에게 알림. (Vercel Cron → vercel.json 참조)
export const dynamic = 'force-dynamic'

const WINDOW_HOURS = 28          // 전날 활동 커버
const FAST_CORRECT_MS = 5000     // 독해/청해를 5초 안에 정답 = 지문 안 읽음(찍기) 의심
const MULTI_WRONG = 2            // 한 문제에서 오답 2회 이상 = 보기 클릭 돌리기
const FLAG_THRESHOLD = 3         // 하루 의심 문제 3건 이상이면 알림

export async function GET(request: Request) {
  const secret = process.env.CRON_SECRET
  if (secret) {
    const auth = request.headers.get('authorization')
    if (auth !== `Bearer ${secret}`) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  }

  const service = createServiceRoleClient()
  if (!service) return NextResponse.json({ error: 'service unavailable' }, { status: 500 })

  const since = new Date(Date.now() - WINDOW_HOURS * 3600 * 1000).toISOString()
  const { data: attempts } = await service
    .from('study_attempts')
    .select('user_id, content_type, item_id, is_correct, wrong_count, duration_ms')
    .gte('created_at', since)
    .in('content_type', ['jlpt_reading', 'jlpt_listening'])

  // user → item → { wrong, fastCorrect }
  const byUser = new Map<string, Map<string, { wrong: number; fast: boolean }>>()
  for (const a of attempts ?? []) {
    if (!byUser.has(a.user_id)) byUser.set(a.user_id, new Map())
    const items = byUser.get(a.user_id)!
    const cur = items.get(a.item_id) ?? { wrong: 0, fast: false }
    if (!a.is_correct) cur.wrong += 1
    if (a.is_correct && a.duration_ms != null && a.duration_ms < FAST_CORRECT_MS) cur.fast = true
    items.set(a.item_id, cur)
  }

  const flagged: { userId: string; count: number }[] = []
  for (const [userId, items] of byUser) {
    let guessy = 0
    for (const v of items.values()) if (v.fast || v.wrong >= MULTI_WRONG) guessy += 1
    if (guessy >= FLAG_THRESHOLD) flagged.push({ userId, count: guessy })
  }

  for (const f of flagged) {
    const name = await getUserDisplayName(f.userId, service)
    await notifyMentorsAndAdmins(
      f.userId,
      'study_pattern_alert',
      `${name} さんの学習に不審なパターン`,
      `昨日、内容を読まずに解答した疑いのある問題が ${f.count} 件ありました。レポートで確認してください。`,
      `/admin/reports?mentee=${f.userId}`,
      f.userId,
      service,
    )
  }

  return NextResponse.json({ ok: true, flagged: flagged.length, detail: flagged })
}
