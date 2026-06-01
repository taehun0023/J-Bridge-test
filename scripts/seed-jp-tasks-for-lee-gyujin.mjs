// One-off: seed Japanese learning_assignments for LEE GYUJIN's 5 mentees in TEST DB
//
// Pattern per mentee (5 tasks each):
//   - 2 completed (seikatsu vocabulary, business-jp vocabulary)
//   - 2 in_progress, future due  (seikatsu grammar, business-jp listening)
//   - 1 in_progress, past due → counted as overdue (seikatsu reading)
//
// Run: node scripts/seed-jp-tasks-for-lee-gyujin.mjs

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

const MENTOR_ID = '52f591d4-2415-427c-af81-7bae7a12f927' // LEE GYUJIN

const envText = readFileSync(resolve(process.cwd(), '.env.local'), 'utf8')
const env = Object.fromEntries(
  envText
    .split(/\r?\n/)
    .filter((l) => l && !l.startsWith('#'))
    .map((l) => {
      const i = l.indexOf('=')
      return [l.slice(0, i).trim(), l.slice(i + 1).trim()]
    }),
)

const url = env.NEXT_PUBLIC_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) {
  console.error('Missing env')
  process.exit(1)
}
if (url.includes('wxhyczlwdmeelcshqgci')) {
  console.error('ABORT: targets PROD. TEST only.')
  process.exit(1)
}

const supabase = createClient(url, key, { auth: { persistSession: false } })

// 担当メンティー一覧
const { data: links, error: linkErr } = await supabase
  .from('mentor_mentee_assignments')
  .select('mentee_id, profiles!mentor_mentee_assignments_mentee_id_fkey(email, full_name)')
  .eq('mentor_id', MENTOR_ID)

if (linkErr) {
  console.error('Read failed:', linkErr)
  process.exit(1)
}

const mentees = (links ?? []).map((l) => ({
  id: l.mentee_id,
  email: l.profiles?.email ?? '?',
  name: l.profiles?.full_name ?? '?',
}))

console.log(`Target mentor: LEE GYUJIN (${MENTOR_ID})`)
console.log(`Mentees: ${mentees.length}`)
for (const m of mentees) console.log(`  - ${m.email}  ${m.name}`)

if (mentees.length === 0) {
  console.error('No mentees found.')
  process.exit(1)
}

// 既存の学習過題で「LEE GYUJIN が assigned_by」のものがあるかチェック → あれば中断
const { data: existing } = await supabase
  .from('learning_assignments')
  .select('id')
  .in('assigned_to', mentees.map((m) => m.id))
  .eq('assigned_by', MENTOR_ID)
  .limit(1)

if ((existing ?? []).length > 0) {
  console.error('ABORT: there are already tasks assigned by LEE GYUJIN to these mentees.')
  console.error('Delete them first if you want to reseed.')
  process.exit(1)
}

// 日付計算
const now = new Date()
const completedAt = new Date(now.getTime() - 7 * 86400_000).toISOString() // 1週間前
const completedCreated = new Date(now.getTime() - 14 * 86400_000).toISOString() // 2週間前 → 今月境界に依存しないよう、created も基準にする
const futureDue = new Date(now.getTime() + 14 * 86400_000).toISOString() // 2週間後
const pastDue = new Date(now.getTime() - 5 * 86400_000).toISOString() // 5日前 (overdue)
const createdNow = now.toISOString()

const TEMPLATE = [
  // 完了 ①
  {
    label: 'completed-seikatsu',
    category: 'seikatsu',
    subcategory: 'vocabulary',
    content_level: 'N4',
    title: '【生活】N4 単語復習',
    description: 'N4 レベル基礎単語の復習課題',
    due_date: completedAt,
    status: 'completed',
    created_at: completedCreated,
    completed_at: completedAt,
  },
  // 完了 ②
  {
    label: 'completed-businessJp',
    category: 'business-jp',
    subcategory: 'vocabulary',
    content_level: 'N3',
    title: '【ビジネス】用語と表現 vol.1',
    description: 'メール/会議で使う基礎ビジネス用語',
    due_date: completedAt,
    status: 'completed',
    created_at: completedCreated,
    completed_at: completedAt,
  },
  // 未完了 ① (期限内)
  {
    label: 'inprogress-seikatsu',
    category: 'seikatsu',
    subcategory: 'grammar',
    content_level: 'N4',
    title: '【生活】N4 文法 重要パターン',
    description: '日常会話に頻出の文法パターン演習',
    due_date: futureDue,
    status: 'in_progress',
    created_at: createdNow,
    completed_at: null,
  },
  // 未完了 ② (期限内)
  {
    label: 'inprogress-businessJp',
    category: 'business-jp',
    subcategory: 'listening',
    content_level: 'N3',
    title: '【ビジネス】電話応対 聴解',
    description: '電話応対シナリオの聴き取り課題',
    due_date: futureDue,
    status: 'in_progress',
    created_at: createdNow,
    completed_at: null,
  },
  // 遅延 (生活, 期限切れ)
  {
    label: 'overdue-seikatsu',
    category: 'seikatsu',
    subcategory: 'reading',
    content_level: 'N3',
    title: '【生活】N3 短文読解',
    description: '日常生活シーンの短文読解',
    due_date: pastDue,
    status: 'in_progress',
    created_at: createdNow,
    completed_at: null,
  },
]

const rows = []
for (const m of mentees) {
  for (const t of TEMPLATE) {
    rows.push({
      assigned_by: MENTOR_ID,
      assigned_to: m.id,
      category: t.category,
      subcategory: t.subcategory,
      content_level: t.content_level,
      title: t.title,
      description: t.description,
      due_date: t.due_date,
      status: t.status,
      created_at: t.created_at,
      completed_at: t.completed_at,
    })
  }
}

console.log(`\nInserting ${rows.length} learning_assignments (${TEMPLATE.length} × ${mentees.length} mentees)...`)

const { data: inserted, error: insErr } = await supabase
  .from('learning_assignments')
  .insert(rows)
  .select('id, assigned_to, category, status, due_date')

if (insErr) {
  console.error('Insert failed:', insErr)
  process.exit(1)
}

console.log(`OK: inserted ${inserted?.length ?? 0} rows`)

// サマリ表示
const byStatus = {}
for (const r of inserted ?? []) byStatus[r.status] = (byStatus[r.status] ?? 0) + 1
console.log('By status:', byStatus)
