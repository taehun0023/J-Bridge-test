// Insert assignment_overdue notifications for the May overdue rungs — mirrors the
// mentee notification in updateItemAssignmentStatuses (item-assignments.ts:262-266).
// Skips (user, assignment) pairs that already have one. Run: node scripts/seed-overdue-notifications.mjs [--commit]
import { createClient } from '@supabase/supabase-js'

// 시크릿 하드코딩 금지 — 환경변수로만 주입 (이전 하드코딩 키는 노출되어 회전 필요)
const SB_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || ''
const SB_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY || ''
if (!SB_URL || !SB_KEY) { console.error('NEXT_PUBLIC_SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY 환경변수가 필요합니다'); process.exit(1) }
const db = createClient(SB_URL, SB_KEY, { auth: { persistSession: false } })
const COMMIT = process.argv.includes('--commit')
const STALL_DAYS = 7

const { data: overdue, error } = await db.from('learning_assignments')
  .select('id, assigned_to, title, created_at, status')
  .eq('status', 'overdue')
  .in('category', ['seikatsu', 'business-jp', 'seikatsu-quiz', 'business-jp-quiz'])
if (error) { console.error(error); process.exit(1) }

const may = overdue.filter(a => a.created_at.slice(0, 7) === '2026-05')
console.log(`overdue May rungs: ${may.length}`)

// existing assignment_overdue notifications keyed by related_id (avoid dupes)
const { data: existing } = await db.from('notifications')
  .select('related_id').eq('type', 'assignment_overdue')
const seen = new Set((existing ?? []).map(n => String(n.related_id)))

const rows = may
  .filter(a => !seen.has(String(a.id)))
  .map(a => ({
    user_id: a.assigned_to,
    type: 'assignment_overdue',
    title: `学習課題「${a.title}」が${STALL_DAYS}日間進捗していません`,
    message: '学習を進めてください',
    link: '/dashboard/assignments',
    related_id: a.id,
  }))

console.log(`to insert: ${rows.length} (skipped ${may.length - rows.length} already-notified)`)
if (rows.length) console.log('sample:', rows[0].title)

if (!COMMIT) { console.log('\n[DRY RUN] pass --commit to insert.'); process.exit(0) }

const { data: ins, error: e2 } = await db.from('notifications').insert(rows).select('id')
if (e2) { console.error(e2); process.exit(1) }
console.log(`inserted ${ins.length} notifications`)

const { count } = await db.from('notifications').select('*', { count: 'exact', head: true }).eq('type', 'assignment_overdue')
console.log(`total assignment_overdue notifications now: ${count}`)
