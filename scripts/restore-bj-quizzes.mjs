#!/usr/bin/env node
/**
 * Parse BJ backup CSVs and generate a restoration SQL migration.
 * Skips assessment quiz a0000002 (still in DB with 150 questions).
 */
import { readFileSync, writeFileSync } from 'fs'
import { join } from 'path'

const BACKUP_DIR = 'C:/Users/zenoa/Downloads/jbridge_backup_2026-04-05/step2_business_jp'
const OUTPUT = 'supabase/migrations/00153_restore_bj_quiz_data.sql'

// Skip assessment quiz - still intact in DB
const SKIP_QUIZ_IDS = new Set(['a0000002-0000-0000-0000-000000000002'])

// ---- CSV parser (handles quoted fields with commas/newlines) ----
function parseCSV(text) {
  const rows = []
  let i = 0
  // Skip BOM
  if (text.charCodeAt(0) === 0xFEFF) i = 1

  const headers = []
  // Parse header row
  const headerRow = parseLine()
  headers.push(...headerRow)

  // Parse data rows
  while (i < text.length) {
    const row = parseLine()
    if (row && row.length > 0 && row.some(v => v !== '')) {
      const obj = {}
      for (let h = 0; h < headers.length; h++) {
        obj[headers[h]] = row[h] ?? ''
      }
      rows.push(obj)
    }
  }
  return rows

  function parseLine() {
    const fields = []
    while (i < text.length) {
      if (text[i] === '"') {
        // Quoted field
        i++ // skip opening quote
        let val = ''
        while (i < text.length) {
          if (text[i] === '"') {
            if (text[i + 1] === '"') {
              val += '"'
              i += 2
            } else {
              i++ // skip closing quote
              break
            }
          } else {
            val += text[i]
            i++
          }
        }
        fields.push(val)
        if (i < text.length && text[i] === ',') i++ // skip comma
        else if (i < text.length && (text[i] === '\n' || text[i] === '\r')) {
          if (text[i] === '\r' && text[i + 1] === '\n') i += 2
          else i++
          break
        }
      } else if (text[i] === '\n' || text[i] === '\r') {
        if (text[i] === '\r' && text[i + 1] === '\n') i += 2
        else i++
        break
      } else {
        // Unquoted field
        let val = ''
        while (i < text.length && text[i] !== ',' && text[i] !== '\n' && text[i] !== '\r') {
          val += text[i]
          i++
        }
        fields.push(val)
        if (i < text.length && text[i] === ',') i++
        else if (i < text.length && (text[i] === '\n' || text[i] === '\r')) {
          if (text[i] === '\r' && text[i + 1] === '\n') i += 2
          else i++
          break
        }
      }
    }
    return fields
  }
}

function esc(str) {
  if (str === null || str === undefined || str === '') return 'NULL'
  return "'" + String(str).replace(/'/g, "''") + "'"
}

// ---- Quiz definitions (from seeds/migrations) ----
const QUIZ_DEFS = [
  // Vocabulary (it_terminology)
  { id: 'b1000001-0000-0000-0000-000000000006', title: 'IT語彙テスト 第6回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b1000001-0000-0000-0000-000000000007', title: 'IT語彙テスト 第7回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b1000001-0000-0000-0000-000000000008', title: 'IT語彙テスト 第8回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b1000001-0000-0000-0000-000000000009', title: 'IT語彙テスト 第9回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b1000001-0000-0000-0000-00000000000a', title: 'IT語彙テスト 第10回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b1000001-0000-0000-0000-00000000000b', title: 'IT語彙テスト 第11回', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 15 },
  // Sentence pattern
  { id: 'b2000001-0000-0000-0000-000000000001', title: '文章パターンテスト 第1回', quiz_type: 'sentence_pattern', passing_score: 70, time_limit_minutes: 10 },
  { id: 'b2000002-0000-0000-0000-000000000002', title: '文章パターンテスト 第2回', quiz_type: 'sentence_pattern', passing_score: 70, time_limit_minutes: 10 },
  { id: 'b2000003-0000-0000-0000-000000000003', title: '文章パターンテスト 第3回', quiz_type: 'sentence_pattern', passing_score: 70, time_limit_minutes: 10 },
  // Business expression
  { id: 'b3000001-0000-0000-0000-000000000001', title: 'ビジネス表現テスト 第1回', quiz_type: 'business_expression', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b3000002-0000-0000-0000-000000000002', title: 'ビジネス表現テスト 第2回', quiz_type: 'business_expression', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b3000003-0000-0000-0000-000000000003', title: 'ビジネス表現テスト 第3回', quiz_type: 'business_expression', passing_score: 70, time_limit_minutes: 15 },
  // Keigo
  { id: 'b4000001-0000-0000-0000-000000000001', title: '敬語変換規則テスト', quiz_type: 'keigo', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b4000002-0000-0000-0000-000000000002', title: 'よくある敬語の間違いテスト', quiz_type: 'keigo', passing_score: 70, time_limit_minutes: 15 },
  { id: 'b4000003-0000-0000-0000-000000000003', title: 'ウチ・ソト＋敬語総合テスト', quiz_type: 'keigo', passing_score: 70, time_limit_minutes: 15 },
  // Vocab expansion (glossary)
  { id: 'd0000001-0000-4000-a000-000000000001', title: 'IT 용어 테스트 - 개발 기초', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
  { id: 'd0000001-0000-4000-a000-000000000002', title: 'IT 용어 테스트 - 테스트/QA', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
  { id: 'd0000001-0000-4000-a000-000000000003', title: 'IT 용어 테스트 - 설계/문서', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
  { id: 'd0000001-0000-4000-a000-000000000004', title: 'IT 용어 테스트 - 인프라', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
  { id: 'd0000001-0000-4000-a000-000000000005', title: 'IT 용어 테스트 - PM/비즈니스', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
  // Vocab expansion 2 (passport)
  { id: 'd0000001-0000-4000-a000-000000000101', title: 'IT パスポート - セキュリティ・ネットワーク', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
  { id: 'd0000001-0000-4000-a000-000000000102', title: 'IT パスポート - 経営・戦略', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
  { id: 'd0000001-0000-4000-a000-000000000103', title: 'IT パスポート - データベース・開発基礎', quiz_type: 'it_terminology', passing_score: 70, time_limit_minutes: 10 },
]

const VALID_QUIZ_IDS = new Set(QUIZ_DEFS.map(q => q.id))

// ---- Main ----
const questionsCSV = readFileSync(join(BACKUP_DIR, 'quiz_questions.csv'), 'utf8')
const optionsCSV = readFileSync(join(BACKUP_DIR, 'quiz_question_options.csv'), 'utf8')

const allQuestions = parseCSV(questionsCSV)
const allOptions = parseCSV(optionsCSV)

// Filter: skip assessment quiz, only include questions belonging to known quiz IDs
const questions = allQuestions.filter(q => !SKIP_QUIZ_IDS.has(q.quiz_id) && VALID_QUIZ_IDS.has(q.quiz_id))
const questionIds = new Set(questions.map(q => q.id))
const options = allOptions.filter(o => questionIds.has(o.question_id))

// Stats
const quizIdCounts = {}
for (const q of questions) {
  quizIdCounts[q.quiz_id] = (quizIdCounts[q.quiz_id] || 0) + 1
}

console.log('=== Restoration Stats ===')
console.log(`Total questions in backup: ${allQuestions.length}`)
console.log(`Questions to restore (excl assessment): ${questions.length}`)
console.log(`Options to restore: ${options.length}`)
console.log('\nPer quiz:')
for (const [qid, count] of Object.entries(quizIdCounts).sort()) {
  const def = QUIZ_DEFS.find(d => d.id === qid)
  console.log(`  ${qid} (${def?.title}): ${count} questions`)
}

// Check for questions with unknown quiz_ids
const unknownQuestions = allQuestions.filter(q => !SKIP_QUIZ_IDS.has(q.quiz_id) && !VALID_QUIZ_IDS.has(q.quiz_id))
if (unknownQuestions.length > 0) {
  const unknownIds = new Set(unknownQuestions.map(q => q.quiz_id))
  console.log(`\n⚠ ${unknownQuestions.length} questions with unknown quiz_ids:`)
  for (const uid of unknownIds) {
    console.log(`  ${uid}: ${unknownQuestions.filter(q => q.quiz_id === uid).length} questions`)
  }
}

// ---- Generate SQL ----
const lines = []
lines.push('-- 00153_restore_bj_quiz_data.sql')
lines.push('-- Restore BJ quiz data from 2026-04-05 backup (deleted by 00144)')
lines.push('-- Quiz records + questions + options for vocabulary, sentence_pattern, expression, keigo')
lines.push(`-- Total: ${questions.length} questions, ${options.length} options`)
lines.push('')
lines.push('BEGIN;')
lines.push('')

// Step 1: Re-create quiz records
lines.push('-- ==========================================')
lines.push('-- Step 1: Restore quiz records')
lines.push('-- ==========================================')
for (const q of QUIZ_DEFS) {
  lines.push(`INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool)`)
  lines.push(`VALUES (${esc(q.id)}, ${esc(q.title)}, ${esc(q.quiz_type)}, ${q.passing_score}, ${q.time_limit_minutes}, false, false)`)
  lines.push(`ON CONFLICT (id) DO NOTHING;`)
}
lines.push('')

// Step 2: Insert questions
lines.push('-- ==========================================')
lines.push('-- Step 2: Restore quiz questions')
lines.push('-- ==========================================')
for (const q of questions) {
  const pts = q.points || '1'
  const so = q.sort_order || '1'
  const diff = q.difficulty || null
  const cat = q.question_category || null
  const pub = q.is_published === 'true' ? 'true' : 'false'
  lines.push(
    `INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category, is_published)` +
    ` VALUES (${esc(q.id)}, ${esc(q.quiz_id)}, ${esc(q.question_type)}, ${esc(q.question_text)}, ${esc(q.explanation)}, ${pts}, ${so}, ${esc(diff)}, ${esc(cat)}, ${pub})` +
    ` ON CONFLICT (id) DO NOTHING;`
  )
}
lines.push('')

// Step 3: Insert options
lines.push('-- ==========================================')
lines.push('-- Step 3: Restore quiz question options')
lines.push('-- ==========================================')
for (const o of options) {
  const correct = o.is_correct === 'true' ? 'true' : 'false'
  const so = o.sort_order || '1'
  lines.push(
    `INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)` +
    ` VALUES (${esc(o.id)}, ${esc(o.question_id)}, ${esc(o.option_text)}, ${correct}, ${so})` +
    ` ON CONFLICT (id) DO NOTHING;`
  )
}
lines.push('')
lines.push('COMMIT;')

const sql = lines.join('\n')
writeFileSync(OUTPUT, sql, 'utf8')
console.log(`\n✅ Generated ${OUTPUT} (${sql.length} bytes, ${lines.length} lines)`)
