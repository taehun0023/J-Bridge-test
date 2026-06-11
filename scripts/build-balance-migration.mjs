/**
 * 보기 길이 밸런스 재작성안 검증 + 00179 마이그레이션 생성
 *
 * 입력: scripts/option-balance-targets.json (감사 대상 83건)
 *       scripts/rewrites-batch{1..4}.json   (에이전트 재작성안)
 * 검증: ① (question_id, option_id) 존재 ② old_text 정확 일치
 *       ③ 재작성 대상은 전부 오답(is_correct=false) ④ 같은 문제 내 보기 중복 없음
 *       ⑤ 적용 후 max(오답 길이) >= 정답 길이 - 1 (편향 해소)
 * 출력: supabase/migrations/00179_balance_option_lengths.sql
 */
import { readFileSync, writeFileSync } from 'node:fs'

const targets = JSON.parse(readFileSync('scripts/option-balance-targets.json', 'utf8'))
const targetByQ = new Map(targets.map(t => [t.question_id, t]))

const rewrites = []
for (let i = 1; i <= 4; i++) {
  const data = JSON.parse(readFileSync(`scripts/rewrites-batch${i}.json`, 'utf8'))
  for (const r of data.rewrites) rewrites.push({ ...r, batch: i })
  if (data.skipped?.length) console.log(`batch${i} skipped:`, JSON.stringify(data.skipped))
}

const len = s => [...(s ?? '')].length
const errors = []
const optionById = new Map()
for (const t of targets) for (const o of t.options) optionById.set(o.id, { ...o, question_id: t.question_id })

// ① ~ ④ 검증
for (const r of rewrites) {
  const opt = optionById.get(r.option_id)
  if (!opt) { errors.push(`[batch${r.batch}] unknown option_id ${r.option_id}`); continue }
  if (opt.question_id !== r.question_id) errors.push(`[batch${r.batch}] option ${r.option_id}: question_id mismatch`)
  if (opt.text !== r.old_text) errors.push(`[batch${r.batch}] option ${r.option_id}: old_text mismatch\n  DB : ${opt.text}\n  json: ${r.old_text}`)
  if (opt.is_correct) errors.push(`[batch${r.batch}] option ${r.option_id}: 정답 보기를 수정하려 함 — 금지`)
  if (!r.new_text || r.new_text === r.old_text) errors.push(`[batch${r.batch}] option ${r.option_id}: new_text 비정상`)
}

// 같은 option을 두 번 수정하는 충돌 검사
const seen = new Set()
for (const r of rewrites) {
  if (seen.has(r.option_id)) errors.push(`duplicate rewrite for option ${r.option_id}`)
  seen.add(r.option_id)
}

// ⑤ 적용 후 마진 재계산 + 같은 문제 내 보기 텍스트 중복 검사
const newTextByOpt = new Map(rewrites.map(r => [r.option_id, r.new_text]))
let fixed = 0
const unfixed = []
for (const t of targets) {
  const applied = t.options.map(o => ({ ...o, text: newTextByOpt.get(o.id) ?? o.text }))
  const texts = applied.map(o => o.text)
  if (new Set(texts).size !== texts.length) errors.push(`question ${t.question_id}: 적용 후 보기 텍스트 중복 발생`)
  const correct = applied.find(o => o.is_correct)
  const maxWrong = Math.max(...applied.filter(o => !o.is_correct).map(o => len(o.text)))
  if (maxWrong >= len(correct.text) - 1) fixed++
  else unfixed.push({ question_id: t.question_id, correct_len: len(correct.text), max_wrong: maxWrong })
}

console.log(`rewrites: ${rewrites.length}, targets fixed: ${fixed}/${targets.length}`)
if (unfixed.length) console.log('UNFIXED:', JSON.stringify(unfixed, null, 2))
if (errors.length) {
  console.error(`VALIDATION ERRORS (${errors.length}):`)
  for (const e of errors) console.error(' -', e)
  process.exit(1)
}
if (unfixed.length) process.exit(1)

// 마이그레이션 생성
const esc = s => s.replace(/'/g, "''")
const lines = [
  '-- ============================================================',
  '-- 00179_balance_option_lengths.sql',
  '-- ============================================================',
  '-- 콘텐츠 수정: 종합시험(생활일본어) 독해/청해 풀에서 "정답 보기가 유일하게',
  '-- 가장 길다" 패턴(83문제, 정답이 최장 오답보다 3자 이상 긴 경우)을 해소.',
  '-- 오답 보기만 재작성(의미는 명백한 오답 유지, 길이 보강). 정답 보기는 불변.',
  `-- 대상: 마스터 퀴즈 a0000001 + jlpt_reading/jlpt_listening 풀, UPDATE ${rewrites.length}건.`,
  '-- 생성: scripts/build-balance-migration.mjs (감사: scripts/audit-option-balance.mjs)',
  '-- 주의: WHERE에 기존 option_text를 포함해 멱등 적용 (이미 적용된 행은 0건 매치).',
  '',
  'BEGIN;',
  '',
]
for (const r of rewrites) {
  lines.push(`UPDATE quiz_question_options SET option_text = '${esc(r.new_text)}' WHERE id = '${r.option_id}' AND option_text = '${esc(r.old_text)}';`)
}
lines.push('', 'COMMIT;', '')
lines.push('-- 적용 후 확인용 (정답=유일최장 & 마진>=3 인 문제 수가 0이어야 함):')
lines.push('-- scripts/audit-option-balance.mjs 재실행으로 확인 가능')
writeFileSync('supabase/migrations/00179_balance_option_lengths.sql', lines.join('\n'), 'utf8')
console.log(`migration written: supabase/migrations/00179_balance_option_lengths.sql (${rewrites.length} UPDATEs)`)
