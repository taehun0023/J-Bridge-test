// One-off: promote LEE GYUJIN to admin role in TEST DB
// Target: profiles.id = 52f591d4-2415-427c-af81-7bae7a12f927
// Run: node scripts/promote-lee-gyujin-admin.mjs

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'node:fs'
import { resolve } from 'node:path'

const TARGET_ID = '52f591d4-2415-427c-af81-7bae7a12f927'
const TARGET_EMAIL = 'yunjm0710@weavus-group.com'
const NEW_ROLE = 'admin'

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
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local')
  process.exit(1)
}

// Safety: ensure we are NOT pointing at prod
if (url.includes('wxhyczlwdmeelcshqgci')) {
  console.error('ABORT: this script targets TEST DB only. URL points at PROD.')
  process.exit(1)
}

console.log('Target Supabase URL:', url)

const supabase = createClient(url, key, { auth: { persistSession: false } })

const { data: before, error: readErr } = await supabase
  .from('profiles')
  .select('id, email, full_name, role')
  .eq('id', TARGET_ID)
  .single()

if (readErr || !before) {
  console.error('Cannot read target profile:', readErr)
  process.exit(1)
}

if (before.email !== TARGET_EMAIL) {
  console.error(`ABORT: email mismatch. Expected ${TARGET_EMAIL}, got ${before.email}`)
  process.exit(1)
}

console.log('Before:', before)

const { data: after, error: updateErr } = await supabase
  .from('profiles')
  .update({ role: NEW_ROLE, updated_at: new Date().toISOString() })
  .eq('id', TARGET_ID)
  .select('id, email, full_name, role')
  .single()

if (updateErr) {
  console.error('Update failed:', updateErr)
  process.exit(1)
}

console.log('After:', after)
console.log('OK: role updated.')
