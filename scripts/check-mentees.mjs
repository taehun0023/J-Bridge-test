// Read-only: list mentees and existing mentor assignments in TEST DB
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
    }),
)

const url = env.NEXT_PUBLIC_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
const supabase = createClient(url, key, { auth: { persistSession: false } })

const TARGET_ID = '52f591d4-2415-427c-af81-7bae7a12f927' // LEE GYUJIN

const [{ data: target }, { data: mentees }, { data: existing }] = await Promise.all([
  supabase.from('profiles').select('id, email, full_name, role').eq('id', TARGET_ID).single(),
  supabase.from('profiles').select('id, email, full_name, role, is_japanese').eq('role', 'mentee').order('created_at', { ascending: false }),
  supabase.from('mentor_mentee_assignments').select('mentor_id, mentee_id'),
])

const mentorBy = new Map()
for (const a of existing ?? []) mentorBy.set(a.mentee_id, a.mentor_id)

console.log('Target:', target)
console.log(`Mentee count: ${mentees?.length ?? 0}`)
console.log(`Existing assignments for LEE GYUJIN: ${(existing ?? []).filter((a) => a.mentor_id === TARGET_ID).length}`)
console.log('\nFirst 15 mentees (with current mentor):')
for (const m of (mentees ?? []).slice(0, 15)) {
  const mentorId = mentorBy.get(m.id)
  console.log(`  ${m.id}  ${m.email.padEnd(40)} ${(m.full_name ?? '-').padEnd(35)} mentor=${mentorId ?? '(none)'}`)
}

const unassigned = (mentees ?? []).filter((m) => !mentorBy.has(m.id))
console.log(`\nUnassigned mentees: ${unassigned.length}`)
