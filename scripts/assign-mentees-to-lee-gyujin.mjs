// One-off: assign 5 unassigned mentees to LEE GYUJIN in TEST DB
// Run: node scripts/assign-mentees-to-lee-gyujin.mjs

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

const MENTOR_ID = '52f591d4-2415-427c-af81-7bae7a12f927' // LEE GYUJIN
const COUNT = 5

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

const [{ data: mentor, error: mentorErr }, { data: mentees }, { data: existingAssignments }, { data: admins }] = await Promise.all([
  supabase.from('profiles').select('id, email, role').eq('id', MENTOR_ID).single(),
  supabase.from('profiles').select('id, email, full_name').eq('role', 'mentee').order('created_at', { ascending: true }),
  supabase.from('mentor_mentee_assignments').select('mentor_id, mentee_id'),
  supabase.from('profiles').select('id').eq('role', 'admin').limit(1),
])

if (mentorErr || !mentor) {
  console.error('Cannot find mentor:', mentorErr)
  process.exit(1)
}
if (mentor.role !== 'mentor' && mentor.role !== 'admin') {
  console.error(`ABORT: target is role=${mentor.role}; must be mentor or admin`)
  process.exit(1)
}

const assignedSet = new Set((existingAssignments ?? []).map((a) => a.mentee_id))
const alreadyMine = new Set((existingAssignments ?? []).filter((a) => a.mentor_id === MENTOR_ID).map((a) => a.mentee_id))

const unassigned = (mentees ?? []).filter((m) => !assignedSet.has(m.id))
console.log(`Total mentees: ${mentees?.length ?? 0}`)
console.log(`Already assigned to LEE GYUJIN: ${alreadyMine.size}`)
console.log(`Unassigned mentees available: ${unassigned.length}`)

if (unassigned.length < COUNT) {
  console.error(`ABORT: need ${COUNT} unassigned mentees, only ${unassigned.length} available`)
  process.exit(1)
}

const targets = unassigned.slice(0, COUNT)
console.log(`\nAssigning ${COUNT} mentees to LEE GYUJIN:`)
for (const m of targets) console.log(`  - ${m.email}  ${m.full_name ?? '-'}`)

const assignedBy = admins?.[0]?.id ?? MENTOR_ID
console.log(`\nassigned_by: ${assignedBy}`)

const rows = targets.map((m) => ({
  mentor_id: MENTOR_ID,
  mentee_id: m.id,
  assigned_by: assignedBy,
}))

const { data: inserted, error: insertErr } = await supabase
  .from('mentor_mentee_assignments')
  .insert(rows)
  .select('id, mentor_id, mentee_id')

if (insertErr) {
  console.error('Insert failed:', insertErr)
  process.exit(1)
}

console.log(`\nOK: inserted ${inserted?.length ?? 0} rows`)
console.dir(inserted, { depth: null })
