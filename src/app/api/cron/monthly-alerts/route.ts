import { NextResponse } from 'next/server'
import { createServiceRoleClient } from '@/lib/supabase/server'
import { notifyMentorsAndAdmins, getUserDisplayName } from '@/lib/notification-helpers'

// 매일 07:05 KST 실행 → KST 날짜에 따라 분기:
//  - 1일: 지연(미완료) 과제 있는 멘티 알림
//  - 15일: 이번 달 진척률 낮은(30% 미만) 멘티 알림
//  - 말일: 이번 달 모의고사 미응시 멘티 알림
export const dynamic = 'force-dynamic'

const PROGRESS_LOW = 0.3

export async function GET(request: Request) {
  const secret = process.env.CRON_SECRET
  if (secret) {
    const a = request.headers.get('authorization')
    if (a !== `Bearer ${secret}`) return NextResponse.json({ error: 'unauthorized' }, { status: 401 })
  }
  const service = createServiceRoleClient()
  if (!service) return NextResponse.json({ error: 'service unavailable' }, { status: 500 })

  const kst = new Date(Date.now() + 9 * 3600 * 1000)
  const y = kst.getUTCFullYear(), m = kst.getUTCMonth(), day = kst.getUTCDate()
  const lastDay = new Date(Date.UTC(y, m + 1, 0)).getUTCDate()
  const monthStart = `${y}-${String(m + 1).padStart(2, '0')}-01`

  const mode = day === 1 ? 'overdue' : day === 15 ? 'progress' : day === lastDay ? 'mock' : null
  if (!mode) return NextResponse.json({ ok: true, skipped: true, day })

  const flagged: string[] = []

  if (mode === 'overdue') {
    const { data } = await service.from('learning_assignments').select('assigned_to').eq('status', 'overdue')
    const byUser = new Map<string, number>()
    for (const r of data ?? []) byUser.set(r.assigned_to, (byUser.get(r.assigned_to) ?? 0) + 1)
    for (const [uid, cnt] of byUser) {
      const name = await getUserDisplayName(uid, service)
      await notifyMentorsAndAdmins(uid, 'monthly_overdue_alert', `${name} さんに遅延課題`, `遅延中の課題が ${cnt} 件あります。`, `/admin/reports?mentee=${uid}`, uid, service)
      flagged.push(uid)
    }
  } else if (mode === 'progress') {
    const { data } = await service.from('learning_assignments')
      .select('assigned_to, target_count, mastered_snapshot, cumulative_target')
      .gte('created_at', monthStart)
    const agg = new Map<string, { target: number; done: number }>()
    for (const r of data ?? []) {
      const tc = r.target_count ?? 0
      if (tc <= 0) continue
      const prevCum = (r.cumulative_target ?? tc) - tc
      const done = Math.max(0, Math.min((r.mastered_snapshot ?? 0) - prevCum, tc))
      const a = agg.get(r.assigned_to) ?? { target: 0, done: 0 }
      a.target += tc; a.done += done; agg.set(r.assigned_to, a)
    }
    for (const [uid, a] of agg) {
      if (a.target <= 0) continue
      const ratio = a.done / a.target
      if (ratio < PROGRESS_LOW) {
        const name = await getUserDisplayName(uid, service)
        await notifyMentorsAndAdmins(uid, 'progress_low_alert', `${name} さんの今月の進捗が低調`, `今月の課題進捗が ${Math.round(ratio * 100)}% (${a.done}/${a.target}) です。`, `/admin/reports?mentee=${uid}`, uid, service)
        flagged.push(uid)
      }
    }
  } else {
    const { data: mentees } = await service.from('profiles').select('id').eq('role', 'mentee').not('target_certification', 'is', null)
    for (const me of mentees ?? []) {
      const { count } = await service.from('comprehensive_exams').select('id', { count: 'exact', head: true })
        .eq('user_id', me.id).eq('category', 'jlpt-mock').gte('completed_at', monthStart)
      if ((count ?? 0) === 0) {
        const name = await getUserDisplayName(me.id, service)
        await notifyMentorsAndAdmins(me.id, 'mock_not_taken_alert', `${name} さんは今月の模試 未受験`, `今月まだ模擬試験を受けていません。`, `/admin/reports?mentee=${me.id}`, me.id, service)
        flagged.push(me.id)
      }
    }
  }

  return NextResponse.json({ ok: true, mode, flagged: flagged.length })
}
