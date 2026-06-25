// TEST DB: find 共通管理者 account
//
// Read-only: searches profiles by full_name / email patterns and prints matches.
// Run: node scripts/find-common-admin.mjs

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
const serviceKey = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !serviceKey) {
  console.error('Missing env')
  process.exit(1)
}
if (!url.includes('nyymasirfrawsxobmfwi')) {
  console.error('ABORT: not TEST URL')
  process.exit(1)
}

console.log('TEST Supabase URL:', url)

const admin = createClient(url, serviceKey, { auth: { persistSession: false } })

const { data: matches, error } = await admin
  .from('profiles')
  .select('id, email, full_name, role, created_at')
  .or('full_name.ilike.%共通管理%,full_name.ilike.%共通%,email.ilike.%common%,email.ilike.%admin%')
  .order('created_at', { ascending: true })

if (error) {
  console.error('Read failed:', error)
  process.exit(1)
}

console.log(`\nMatches: ${matches?.length ?? 0}\n`)
for (const m of matches ?? []) {
  console.log(`  id        = ${m.id}`)
  console.log(`  email     = ${m.email}`)
  console.log(`  full_name = ${m.full_name}`)
  console.log(`  role      = ${m.role}`)
  console.log(`  created   = ${m.created_at}`)
  console.log('')
}
