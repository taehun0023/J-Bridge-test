// One-off: revert LEE GYUJIN in TEST DB
//   1. remove all mentor_mentee_assignments rows where mentor_id = LEE GYUJIN
//   2. switch role mentor → admin
//
// Note: learning_assignments rows assigned_by=LEE GYUJIN to mentees are LEFT INTACT
// (they are mentee task records, not personal data for the mentor).
//
// Run: node scripts/revert-lee-gyujin.mjs

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

const TARGET_ID = '52f591d4-2415-427c-af81-7bae7a12f927'
const TARGET_EMAIL = 'yunjm0710@weavus-group.com'

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

// 0. Verify target
const { data: before, error: readErr } = await supabase
  .from('profiles')
  .select('id, email, full_name, role')
  .eq('id', TARGET_ID)
  .single()

if (readErr || !before) {
  console.error('Cannot read target:', readErr)
  process.exit(1)
}
if (before.email !== TARGET_EMAIL) {
  console.error(`ABORT: email mismatch. Expected ${TARGET_EMAIL}, got ${before.email}`)
  process.exit(1)
}

console.log('Target before:', before)

// 1. Delete mentor_mentee_assignments
const { data: existingLinks } = await supabase
  .from('mentor_mentee_assignments')
  .select('mentee_id')
  .eq('mentor_id', TARGET_ID)

console.log(`\nExisting mentor_mentee links to delete: ${existingLinks?.length ?? 0}`)
for (const l of existingLinks ?? []) console.log(`  mentee_id=${l.mentee_id}`)

if ((existingLinks ?? []).length > 0) {
  const { error: delErr } = await supabase
    .from('mentor_mentee_assignments')
    .delete()
    .eq('mentor_id', TARGET_ID)

  if (delErr) {
    console.error('Delete failed:', delErr)
    process.exit(1)
  }
  console.log('Deleted.')
}

// 2. Update role mentor → admin
const { data: after, error: updErr } = await supabase
  .from('profiles')
  .update({ role: 'admin', updated_at: new Date().toISOString() })
  .eq('id', TARGET_ID)
  .select('id, email, full_name, role')
  .single()

if (updErr) {
  console.error('Update failed:', updErr)
  process.exit(1)
}

console.log('\nTarget after:', after)
console.log('OK: revert complete.')
