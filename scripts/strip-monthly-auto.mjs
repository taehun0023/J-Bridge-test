// 기존 learning_assignments.title 에서 '（月次自動）' 라벨만 제거하는 일회성 스크립트.
// .env.local 의 service role 키로 접속(=localhost dev 가 보는 DB).
import { readFileSync } from 'node:fs'
import { createClient } from '@supabase/supabase-js'

const envText = readFileSync(new URL('../.env.local', import.meta.url), 'utf8')
const env = {}
for (const line of envText.split(/\r?\n/)) {
  const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*?)\s*$/)
  if (!m) continue
  let v = m[2]
  if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) v = v.slice(1, -1)
  env[m[1]] = v
}

const url = env.NEXT_PUBLIC_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) { console.error('NEXT_PUBLIC_SUPABASE_URL / SUPABASE_SERVICE_ROLE_KEY 누락'); process.exit(1) }
console.log('DB URL:', url)

const sb = createClient(url, key, { auth: { persistSession: false } })
const MARK = '（月次自動）'

const { data, error } = await sb
  .from('learning_assignments')
  .select('id, title')
  .ilike('title', `%${MARK}%`)
if (error) { console.error('select error:', error.message); process.exit(1) }

console.log('対象件数:', data.length)
if (data.length === 0) { console.log('対象なし'); process.exit(0) }
console.log('例(最大5件):')
for (const r of data.slice(0, 5)) console.log('  -', JSON.stringify(r.title), '→', JSON.stringify(r.title.split(MARK).join('').trim()))

let updated = 0
for (const row of data) {
  const newTitle = row.title.split(MARK).join('').trim()
  const { error: e } = await sb.from('learning_assignments').update({ title: newTitle }).eq('id', row.id)
  if (e) { console.error('update fail', row.id, e.message); continue }
  updated++
}
console.log('更新完了:', updated, '/', data.length)
