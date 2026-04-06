#!/usr/bin/env node
/**
 * Apply BJ quiz restoration via Supabase REST API (batch upserts).
 * Bypasses SQL Editor size limit by using PostgREST bulk inserts.
 */
import { readFileSync } from 'fs'
import { join } from 'path'

const BACKUP_DIR = 'C:/Users/zenoa/Downloads/jbridge_backup_2026-04-05/step2_business_jp'
const SB_URL = 'https://wxhyczlwdmeelcshqgci.supabase.co'
const SB_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind4aHljemx3ZG1lZWxjc2hxZ2NpIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MDU1NjQ0NCwiZXhwIjoyMDg2MTMyNDQ0fQ.BnCrF1EjFTGrCyv86-z_bSi-NPJFg1S-R9RK1rQFfrI'

const SKIP_QUIZ_IDS = new Set(['a0000002-0000-0000-0000-000000000002'])

// ---- CSV parser ----
function parseCSV(text) {
  const rows = []
  let i = 0
  if (text.charCodeAt(0) === 0xFEFF) i = 1
  const headers = parseLine()
  while (i < text.length) {
    const row = parseLine()
    if (row && row.length > 0 && row.some(v => v !== '')) {
      const obj = {}
      for (let h = 0; h < headers.length; h++) obj[headers[h]] = row[h] ?? ''
      rows.push(obj)
    }
  }
  return rows

  function parseLine() {
    const fields = []
    while (i < text.length) {
      if (text[i] === '"') {
        i++
        let val = ''
        while (i < text.length) {
          if (text[i] === '"') {
            if (text[i + 1] === '"') { val += '"'; i += 2 }
            else { i++; break }
          } else { val += text[i]; i++ }
        }
        fields.push(val)
        if (i < text.length && text[i] === ',') i++
        else if (i < text.length && (text[i] === '\n' || text[i] === '\r')) {
          if (text[i] === '\r' && text[i + 1] === '\n') i += 2; else i++; break
        }
      } else if (text[i] === '\n' || text[i] === '\r') {
        if (text[i] === '\r' && text[i + 1] === '\n') i += 2; else i++; break
      } else {
        let val = ''
        while (i < text.length && text[i] !== ',' && text[i] !== '\n' && text[i] !== '\r') { val += text[i]; i++ }
        fields.push(val)
        if (i < text.length && text[i] === ',') i++
        else if (i < text.length && (text[i] === '\n' || text[i] === '\r')) {
          if (text[i] === '\r' && text[i + 1] === '\n') i += 2; else i++; break
        }
      }
    }
    return fields
  }
}

async function upsert(table, rows, batchSize = 100) {
  let total = 0
  for (let i = 0; i < rows.length; i += batchSize) {
    const batch = rows.slice(i, i + batchSize)
    const resp = await fetch(`${SB_URL}/rest/v1/${table}`, {
      method: 'POST',
      headers: {
        'apikey': SB_KEY,
        'Authorization': `Bearer ${SB_KEY}`,
        'Content-Type': 'application/json',
        'Prefer': 'resolution=ignore-duplicates',
      },
      body: JSON.stringify(batch),
    })
    if (!resp.ok) {
      const err = await resp.text()
      console.error(`❌ ${table} batch ${i}~${i + batch.length}: ${resp.status} ${err}`)
      throw new Error(`Failed at ${table} batch ${i}`)
    }
    total += batch.length
    process.stdout.write(`\r  ${table}: ${total}/${rows.length}`)
  }
  console.log()
}

// ---- Quiz definitions ----
const QUIZ_DEFS = [
  { id: 'b1000001-0000-0000-0000-000000000006', title: 'IT語彙テスト 第6回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b1000001-0000-0000-0000-000000000007', title: 'IT語彙テスト 第7回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b1000001-0000-0000-0000-000000000008', title: 'IT語彙テスト 第8回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b1000001-0000-0000-0000-000000000009', title: 'IT語彙テスト 第9回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b1000001-0000-0000-0000-00000000000a', title: 'IT語彙テスト 第10回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b1000001-0000-0000-0000-00000000000b', title: 'IT語彙テスト 第11回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b2000001-0000-0000-0000-000000000001', title: '文章パターンテスト 第1回', quiz_type: 'sentence_pattern', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'b2000002-0000-0000-0000-000000000002', title: '文章パターンテスト 第2回', quiz_type: 'sentence_pattern', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'b2000003-0000-0000-0000-000000000003', title: '文章パターンテスト 第3回', quiz_type: 'sentence_pattern', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'b3000001-0000-0000-0000-000000000001', title: 'ビジネス表現テスト 第1回', quiz_type: 'business_expression', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b3000002-0000-0000-0000-000000000002', title: 'ビジネス表現テスト 第2回', quiz_type: 'business_expression', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b3000003-0000-0000-0000-000000000003', title: 'ビジネス表現テスト 第3回', quiz_type: 'business_expression', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b4000001-0000-0000-0000-000000000001', title: '敬語変換規則テスト', quiz_type: 'keigo', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b4000002-0000-0000-0000-000000000002', title: 'よくある敬語の間違いテスト', quiz_type: 'keigo', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'b4000003-0000-0000-0000-000000000003', title: 'ウチ・ソト＋敬語総合テスト', quiz_type: 'keigo', passing_score: 70, time_limit_minutes: 15, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000001', title: 'IT 용어 테스트 - 개발 기초', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000002', title: 'IT 용어 테스트 - 테스트/QA', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000003', title: 'IT 용어 테스트 - 설계/문서', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000004', title: 'IT 용어 테스트 - 인프라', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000005', title: 'IT 용어 테스트 - PM/비즈니스', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000101', title: 'IT パスポート - セキュリティ・ネットワーク', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000102', title: 'IT パスポート - 経営・戦略', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
  { id: 'd0000001-0000-4000-a000-000000000103', title: 'IT パスポート - データベース・開発基礎', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10, is_assessment: false, is_pool: false },
]

const VALID_QUIZ_IDS = new Set(QUIZ_DEFS.map(q => q.id))

// ---- Main ----
async function main() {
  console.log('Parsing backup CSVs...')
  const questionsCSV = readFileSync(join(BACKUP_DIR, 'quiz_questions.csv'), 'utf8')
  const optionsCSV = readFileSync(join(BACKUP_DIR, 'quiz_question_options.csv'), 'utf8')

  const allQuestions = parseCSV(questionsCSV)
  const allOptions = parseCSV(optionsCSV)

  const questions = allQuestions.filter(q => !SKIP_QUIZ_IDS.has(q.quiz_id) && VALID_QUIZ_IDS.has(q.quiz_id))
  const questionIds = new Set(questions.map(q => q.id))
  const options = allOptions.filter(o => questionIds.has(o.question_id))

  console.log(`Questions to restore: ${questions.length}`)
  console.log(`Options to restore: ${options.length}`)

  // Step 1: Upsert quizzes
  console.log('\n[1/3] Restoring quiz records...')
  await upsert('quizzes', QUIZ_DEFS)

  // Step 2: Upsert questions
  console.log('[2/3] Restoring quiz questions...')
  const questionRows = questions.map(q => ({
    id: q.id,
    quiz_id: q.quiz_id,
    question_type: q.question_type,
    question_text: q.question_text,
    explanation: q.explanation || null,
    points: parseInt(q.points) || 1,
    sort_order: parseInt(q.sort_order) || 1,
    difficulty: q.difficulty || null,
    question_category: q.question_category || null,
    is_published: q.is_published === 'true',
  }))
  await upsert('quiz_questions', questionRows)

  // Step 3: Upsert options
  console.log('[3/3] Restoring quiz question options...')
  const optionRows = options.map(o => ({
    id: o.id,
    question_id: o.question_id,
    option_text: o.option_text,
    is_correct: o.is_correct === 'true',
    sort_order: parseInt(o.sort_order) || 1,
  }))
  await upsert('quiz_question_options', optionRows)

  // Verify
  console.log('\n[Verify] Checking restored data...')
  for (const qt of ['it_terminology', 'sentence_pattern', 'business_expression', 'keigo']) {
    const resp = await fetch(
      `${SB_URL}/rest/v1/quizzes?quiz_type=eq.${qt}&is_pool=eq.false&is_assessment=eq.false&select=id,title`,
      { headers: { 'apikey': SB_KEY, 'Authorization': `Bearer ${SB_KEY}` } }
    )
    const quizzes = await resp.json()
    let totalQ = 0
    for (const quiz of quizzes) {
      const qResp = await fetch(
        `${SB_URL}/rest/v1/quiz_questions?quiz_id=eq.${quiz.id}&select=id`,
        { headers: { 'apikey': SB_KEY, 'Authorization': `Bearer ${SB_KEY}`, 'Prefer': 'count=exact' },
          method: 'HEAD' }
      )
      const range = qResp.headers.get('content-range')
      const count = range ? parseInt(range.split('/')[1]) : 0
      totalQ += count
    }
    console.log(`  ${qt}: ${quizzes.length} quizzes, ${totalQ} questions`)
  }

  console.log('\n✅ Restoration complete!')
}

main().catch(e => { console.error(e); process.exit(1) })
