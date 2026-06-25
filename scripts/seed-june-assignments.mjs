// One-off seed: replicate runMonthlyAutoAssignment (item-assignments.ts:713-796) for June 2026.
// Adds the June ladder rung per mentee/area on top of the existing May rungs.
// Run from project root:  node scripts/seed-june-assignments.mjs [--commit]
import { createClient } from '@supabase/supabase-js'

const URL = 'https://jpjvzlmwzeiyukqqbdit.supabase.co'
const SERVICE_KEY = 'sb_secret_REDACTED'
const CURRENT_MONTH = '2026-06'
const COMMIT = process.argv.includes('--commit')

const db = createClient(URL, SERVICE_KEY, { auth: { persistSession: false } })

// seikatsu areas — mirror ITEM_CATEGORIES.seikatsu (item-assignments.ts:48-54)
const AREAS = [
  { area: 'vocabulary', label: '語彙', itemType: 'jlpt_vocabulary', table: 'jlpt_vocabulary' },
  { area: 'grammar',    label: '文法', itemType: 'jlpt_grammar',    table: 'jlpt_grammar' },
  { area: 'reading',    label: '読解', itemType: 'jlpt_reading',    table: 'jlpt_reading_passages' },
  { area: 'listening',  label: '聴解', itemType: 'jlpt_listening',  table: 'jlpt_listening_scripts' },
  { area: 'kanji',      label: '漢字', itemType: 'jlpt_kanji',      table: 'jlpt_kanji' },
]
const DEFAULT_COUNTS = { vocabulary: 100, grammar: 10, reading: 10, listening: 10, kanji: 170 }

async function getPoolIds(table, level) {
  const { data, error } = await db.from(table).select('id').eq('jlpt_level', level).limit(10000)
  if (error) throw error
  return new Set((data ?? []).map(r => String(r.id)))
}
async function getMasteredIds(userId, itemType) {
  const { data, error } = await db.from('user_mastered_items').select('item_id').eq('user_id', userId).eq('item_type', itemType)
  if (error) throw error
  return new Set((data ?? []).map(r => String(r.item_id)))
}
function intersectCount(a, b) {
  const [s, big] = a.size < b.size ? [a, b] : [b, a]
  let n = 0; for (const x of s) if (big.has(x)) n++; return n
}

async function main() {
  // monthly config
  const { data: cfg } = await db.from('monthly_assignment_config')
    .select('vocabulary, grammar, reading, listening, kanji').eq('id', true).maybeSingle()
  const counts = cfg ?? DEFAULT_COUNTS
  console.log('monthly counts:', counts)

  const { data: adminRow } = await db.from('profiles').select('id').eq('role', 'admin').limit(1).maybeSingle()
  const assignedByFallback = adminRow?.id

  const { data: mentees } = await db.from('profiles')
    .select('id, target_certification, last_auto_assign_month')
    .eq('role', 'mentee').not('target_certification', 'is', null)
  console.log(`mentees: ${mentees.length}`)

  const nowIso = new Date().toISOString()
  const poolCache = new Map()
  const rows = []
  let skipped = 0

  for (const m of mentees) {
    const level = m.target_certification
    if (!['N5', 'N4', 'N3', 'N2', 'N1'].includes(level)) { skipped++; continue }
    const assignedBy = assignedByFallback ?? m.id

    for (const spec of AREAS) {
      const want = counts[spec.area] ?? 0
      if (want <= 0) continue

      const poolKey = `${level}::${spec.area}`
      if (!poolCache.has(poolKey)) poolCache.set(poolKey, await getPoolIds(spec.table, level))
      const poolIds = poolCache.get(poolKey)

      // prev = max existing cumulative for this ladder (item-assignments.ts:761-767)
      const { data: prevRows } = await db.from('learning_assignments')
        .select('cumulative_target')
        .eq('assigned_to', m.id).eq('category', 'seikatsu').eq('subcategory', spec.area).eq('content_level', level)
        .not('target_count', 'is', null)
        .order('cumulative_target', { ascending: false }).limit(1)
      const prev = prevRows?.[0]?.cumulative_target ?? 0

      const remaining = poolIds.size - prev
      if (remaining <= 0) { skipped++; continue }
      const capped = Math.min(want, remaining)
      const cumulative = prev + capped

      const mastered = intersectCount(poolIds, await getMasteredIds(m.id, spec.itemType))
      const status = mastered >= cumulative ? 'completed' : (mastered > prev ? 'in_progress' : 'pending')

      rows.push({
        assigned_by: assignedBy,
        assigned_to: m.id,
        category: 'seikatsu',
        subcategory: spec.area,
        content_level: level,
        title: `${level} ${spec.label} ${capped}項目`,
        target_count: capped,
        cumulative_target: cumulative,
        mastered_snapshot: mastered,
        last_progress_at: nowIso,
        status,
        completed_at: status === 'completed' ? nowIso : null,
      })
    }
  }

  // summary
  const byKey = {}
  for (const r of rows) {
    const k = `${r.content_level} ${r.subcategory}`
    byKey[k] = byKey[k] || { n: 0, target: r.target_count, cum: r.cumulative_target }
    byKey[k].n++
  }
  console.log(`\nJune rows to insert: ${rows.length} (skipped areas: ${skipped})`)
  for (const [k, v] of Object.entries(byKey).sort()) console.log(`  ${k}: ${v.n} mentees, +${v.target} → cumulative ${v.cum}`)

  if (!COMMIT) {
    console.log('\n[DRY RUN] pass --commit to insert. No notifications are created (test seed).')
    return
  }

  const { data: ins, error } = await db.from('learning_assignments').insert(rows).select('id')
  if (error) { console.error('INSERT FAILED:', error); process.exit(1) }
  console.log(`\nInserted ${ins.length} June assignments.`)

  // mark month claimed so the app stays idempotent (mirror the dedup flag)
  const { error: upErr } = await db.from('profiles')
    .update({ last_auto_assign_month: CURRENT_MONTH })
    .in('id', mentees.map(m => m.id))
  if (upErr) console.error('flag update failed:', upErr)
  else console.log(`Set last_auto_assign_month=${CURRENT_MONTH} for ${mentees.length} mentees.`)
}

main().catch(e => { console.error(e); process.exit(1) })
