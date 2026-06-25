// Test DB only: 멘토 1명 + 한자+카타카나 이름을 가진 멘티 5명을 만들고 mentor_mentee_assignments 등록
//
// 안전 가드:
//   - 테스트 DB (nyymasirfrawsxobmfwi) 전용. 다른 프로젝트 URL이면 즉시 중단.
//   - 동일 email이 이미 있으면 createUser가 실패 → 그 계정은 skip하고 기존 id 재사용.
//
// 사용:  node scripts/seed-mentor-mentee-test.mjs

import { createClient } from '@supabase/supabase-js'
import fs from 'node:fs'

// --- env 로드 ---
const envText = fs.readFileSync('.env.local', 'utf-8')
const env = Object.fromEntries(
  envText.split('\n').filter(l => l.includes('=') && !l.trim().startsWith('#'))
    .map(l => { const [k, ...rest] = l.split('='); return [k.trim(), rest.join('=').trim()] })
)
const url = env.NEXT_PUBLIC_SUPABASE_URL
const key = env.SUPABASE_SERVICE_ROLE_KEY
if (!url || !key) { console.error('missing env'); process.exit(1) }
if (!url.includes('nyymasirfrawsxobmfwi')) {
  console.error('SAFETY GUARD: this script must run only against the test DB (nyymasirfrawsxobmfwi)')
  process.exit(1)
}

const supabase = createClient(url, key, { auth: { persistSession: false } })

// --- 시드 데이터 ---
const MENTOR = {
  email: 'mentor.taro@jbridge.test',
  password: 'Mentor123!',
  full_name: '鈴木太郎 (スズキタロウ)',
  role: 'mentor',
  mentor_specialty: 'japanese',
}

const MENTEES = [
  { email: 'mentee.hanako@jbridge.test', password: 'Mentee123!', full_name: '山田花子 (ヤマダハナコ)' },
  { email: 'mentee.ken@jbridge.test',    password: 'Mentee123!', full_name: '佐藤健 (サトウケン)' },
  { email: 'mentee.misaki@jbridge.test', password: 'Mentee123!', full_name: '田中美咲 (タナカミサキ)' },
  { email: 'mentee.sho@jbridge.test',    password: 'Mentee123!', full_name: '高橋翔 (タカハシショウ)' },
  { email: 'mentee.ai@jbridge.test',     password: 'Mentee123!', full_name: '渡辺愛 (ワタナベアイ)' },
]

// --- helper: 계정 생성 (중복이면 기존 id 재사용) ---
async function ensureUser({ email, password, full_name }) {
  // 기존 계정 확인
  const { data: existing } = await supabase
    .from('profiles')
    .select('id, email, full_name, role')
    .eq('email', email)
    .maybeSingle()
  if (existing) {
    console.log(`  ↻ exists: ${email} (${existing.id})`)
    return { id: existing.id, created: false }
  }

  const { data, error } = await supabase.auth.admin.createUser({
    email, password, email_confirm: true, user_metadata: { full_name },
  })
  if (error) {
    console.error(`  ✗ createUser failed for ${email}:`, error.message)
    return null
  }
  console.log(`  + created: ${email} (${data.user.id})`)
  return { id: data.user.id, created: true }
}

async function updateProfile(id, patch) {
  const { error } = await supabase.from('profiles').update(patch).eq('id', id)
  if (error) {
    console.error(`  ✗ updateProfile failed (${id}):`, error.message)
    return false
  }
  return true
}

// --- 1) 멘토 생성 ---
console.log('--- Step 1: create mentor ---')
const mentor = await ensureUser(MENTOR)
if (!mentor) { console.error('mentor creation failed; abort.'); process.exit(1) }
await updateProfile(mentor.id, {
  full_name: MENTOR.full_name,
  role: MENTOR.role,
  mentor_specialty: MENTOR.mentor_specialty,
  is_onboarded: true,
})

// --- 2) 멘티 5명 생성 ---
console.log('--- Step 2: create 5 mentees ---')
const menteeIds = []
for (const m of MENTEES) {
  const r = await ensureUser(m)
  if (!r) continue
  await updateProfile(r.id, {
    full_name: m.full_name,
    role: 'mentee',
    is_onboarded: true,
  })
  menteeIds.push(r.id)
}
if (menteeIds.length !== 5) {
  console.error(`expected 5 mentees, got ${menteeIds.length}; continuing with available`)
}

// --- 3) assigned_by 후보: 기존 admin 한 명 ---
console.log('--- Step 3: pick admin for assigned_by ---')
const { data: admins, error: adminErr } = await supabase
  .from('profiles')
  .select('id, email, full_name')
  .eq('role', 'admin')
  .limit(1)
if (adminErr || !admins?.length) {
  console.error('no admin found; abort assignment step', adminErr)
  process.exit(1)
}
const adminId = admins[0].id
console.log(`  using admin: ${admins[0].email} (${adminId})`)

// --- 4) mentor_mentee_assignments 등록 ---
console.log('--- Step 4: create mentor_mentee_assignments ---')
for (const menteeId of menteeIds) {
  const { error } = await supabase
    .from('mentor_mentee_assignments')
    .upsert(
      { mentor_id: mentor.id, mentee_id: menteeId, assigned_by: adminId },
      { onConflict: 'mentor_id,mentee_id', ignoreDuplicates: true },
    )
  if (error) {
    console.error(`  ✗ assignment failed for mentee ${menteeId}:`, error.message)
  } else {
    console.log(`  + assigned: ${menteeId}`)
  }
}

// --- 5) 검증: 결과 출력 ---
console.log('--- Step 5: verify ---')
const { data: verifyProfiles } = await supabase
  .from('profiles')
  .select('id, email, full_name, role, mentor_specialty')
  .in('id', [mentor.id, ...menteeIds])
console.table(verifyProfiles)

const { data: verifyAssigns } = await supabase
  .from('mentor_mentee_assignments')
  .select('mentor_id, mentee_id, assigned_by, created_at')
  .eq('mentor_id', mentor.id)
console.table(verifyAssigns)

console.log('\n--- Login info ---')
console.log(`Mentor:  ${MENTOR.email} / ${MENTOR.password}`)
MENTEES.forEach(m => console.log(`Mentee:  ${m.email} / ${m.password}`))
console.log('\ndone.')
