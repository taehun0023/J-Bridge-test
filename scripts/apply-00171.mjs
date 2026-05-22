// One-off: apply 00171 migration (move misplaced code_reading questions
// from Step 1 to Step 4). Uses service_role key from .env.local.
// Run with: node scripts/apply-00171.mjs

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

const envText = readFileSync(resolve(process.cwd(), '.env.local'), 'utf8')
const env = Object.fromEntries(
  envText
    .split(/\r?\n/)
    .filter((l) => l && !l.startsWith('#'))
    .map((l) => {
      const i = l.indexOf('=')
      return [l.slice(0, i).trim(), l.slice(i + 1).trim()]
    })
)

const url = env.NEXT_PUBLIC_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) {
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local')
  process.exit(1)
}

const supabase = createClient(url, key, { auth: { persistSession: false } })

const STEP1_IDS = [
  'a0000001-0000-0000-0000-000000000001',
  'a0000001-0000-0000-0000-000000000002',
  'a0000001-0000-0000-0000-000000000003',
]
const STEP4_ID = 'a0000004-0000-0000-0000-000000000004'
const DEV_CATEGORIES = ['java', 'javascript', 'sql', 'spring_boot', 'react', 'cwf', 'python', 'nextjs']

async function main() {
  // ── 1. Pre-check: find target rows ──
  const { data: targets, error: e1 } = await supabase
    .from('quiz_questions')
    .select('id, quiz_id, question_type, question_category, difficulty, sort_order')
    .in('quiz_id', STEP1_IDS)
    .eq('question_type', 'code_reading')
    .in('question_category', DEV_CATEGORIES)
    .order('quiz_id')
    .order('sort_order')

  if (e1) {
    console.error('Pre-check failed:', e1.message)
    process.exit(1)
  }

  console.log(`\n[Pre-check] Misplaced rows: ${targets.length}`)
  const byCat = {}
  for (const r of targets) byCat[r.question_category] = (byCat[r.question_category] ?? 0) + 1
  console.log('  By category:', byCat)

  if (targets.length === 0) {
    console.log('Nothing to migrate (idempotent — already applied or never broken). Exiting.')
    return
  }

  // ── 2. Pre-check: existing attempts on these rows ──
  const ids = targets.map((r) => r.id)
  const [{ count: ceqCount }, { count: qaCount }] = await Promise.all([
    supabase.from('comprehensive_exam_questions').select('id', { count: 'exact', head: true }).in('question_id', ids),
    supabase.from('quiz_answers').select('id', { count: 'exact', head: true }).in('question_id', ids),
  ])
  console.log(`  comprehensive_exam_questions referencing these: ${ceqCount}`)
  console.log(`  quiz_answers referencing these: ${qaCount}`)

  // ── 3. Compute new sort_order base from Step 4 ──
  const { data: maxRow } = await supabase
    .from('quiz_questions')
    .select('sort_order')
    .eq('quiz_id', STEP4_ID)
    .order('sort_order', { ascending: false })
    .limit(1)
  const base = maxRow && maxRow[0] && typeof maxRow[0].sort_order === 'number' ? maxRow[0].sort_order : 0
  console.log(`\n[Plan] Step 4 max sort_order = ${base} → new rows will start at ${base + 1}`)

  // ── 4. Backup ──
  const backup = targets.map((r) => ({ id: r.id, original_quiz_id: r.quiz_id, original_sort_order: r.sort_order }))
  console.log('\n[Backup] (in-memory) sample:', backup.slice(0, 3))

  // ── 5. Perform updates (one row at a time to avoid sort_order collisions and keep deterministic ordering) ──
  console.log('\n[Apply] Moving rows to Step 4...')
  for (let i = 0; i < targets.length; i++) {
    const r = targets[i]
    const newSort = base + i + 1
    const { error } = await supabase
      .from('quiz_questions')
      .update({ quiz_id: STEP4_ID, sort_order: newSort })
      .eq('id', r.id)
    if (error) {
      console.error(`  FAIL on id=${r.id}: ${error.message}`)
      console.error('  Backup snapshot saved to .backup-00171.json — restore manually if needed.')
      const fs = await import('node:fs')
      fs.writeFileSync('.backup-00171.json', JSON.stringify(backup, null, 2))
      process.exit(1)
    }
  }
  console.log(`  Moved ${targets.length} row(s).`)

  // ── 6. Post-check ──
  const { count: remaining } = await supabase
    .from('quiz_questions')
    .select('id', { count: 'exact', head: true })
    .in('quiz_id', STEP1_IDS)
    .eq('question_type', 'code_reading')
  const { count: step4New } = await supabase
    .from('quiz_questions')
    .select('id', { count: 'exact', head: true })
    .eq('quiz_id', STEP4_ID)
    .eq('question_type', 'code_reading')
  console.log(`\n[Post-check] Step 1 code_reading remaining: ${remaining} (expect 0)`)
  console.log(`[Post-check] Step 4 code_reading total: ${step4New}`)

  // Save backup to file for safety
  const fs = await import('node:fs')
  fs.writeFileSync('.backup-00171.json', JSON.stringify(backup, null, 2))
  console.log(`\nBackup of original (id, quiz_id, sort_order) saved to .backup-00171.json`)

  if (remaining !== 0) {
    console.error('FAILED — rows remain in Step 1.')
    process.exit(1)
  }
  console.log('\nDone.')
}

main().catch((e) => {
  console.error(e)
  process.exit(1)
})
