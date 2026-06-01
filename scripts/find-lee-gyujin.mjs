// One-off: find LEE GYUJIN profile in TEST DB (read-only)
// Run: node scripts/find-lee-gyujin.mjs

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
if (!url || !key) {
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local')
  process.exit(1)
}

console.log('Target Supabase URL:', url)

const supabase = createClient(url, key, { auth: { persistSession: false } })

const { data, error } = await supabase
  .from('profiles')
  .select('id, email, full_name, role, is_japanese, created_at')
  .or('full_name.ilike.%LEE%GYUJIN%,full_name.ilike.%이규진%,full_name.ilike.%리규진%,email.ilike.%gyujin%,email.ilike.%kyujin%')

if (error) {
  console.error('Query error:', error)
  process.exit(1)
}

console.log('Matched profiles:')
console.dir(data, { depth: null })
