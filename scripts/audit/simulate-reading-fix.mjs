#!/usr/bin/env node
/**
 * Simulates the effect of migration 00146_fix_jlpt_reading_quality.sql
 * on the reading category, WITHOUT writing to DB.
 *
 * Parses UPDATE statements in the migration, applies them in-memory
 * to a snapshot of current DB state, then re-runs the rubric checks
 * (A2/B5/B6/B8) used by investigate.mjs and prints before/after counts.
 *
 * Read-only: no DB writes.
 */

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createClient } from '@supabase/supabase-js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, '..', '..');

const envPath = path.join(ROOT, '.env.local');
const envText = fs.readFileSync(envPath, 'utf8');
const getEnv = (k) => envText.match(new RegExp(`^${k}=(.+)$`, 'm'))?.[1]?.trim();
const SUPABASE_URL = getEnv('NEXT_PUBLIC_SUPABASE_URL');
const SERVICE_ROLE_KEY = getEnv('SUPABASE_SERVICE_ROLE_KEY');
const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, { auth: { persistSession: false } });

const HANGUL_RE = /[\uAC00-\uD7A3]/;
const BLANK_RE = /（　*）|\(\s*\)|＿＿+|___+|（\s*）/;
const strLen = (s) => [...(s || '')].length;

function bigrams(s) {
  const c = [...(s || '').replace(/\s+/g, '')];
  const out = new Set();
  for (let i = 0; i < c.length - 1; i++) out.add(c[i] + c[i + 1]);
  return out;
}
function answerLeakRatio(q, a) {
  const bg = bigrams(a); if (!bg.size) return 0;
  const qb = bigrams(q);
  let hit = 0; for (const b of bg) if (qb.has(b)) hit++;
  return hit / bg.size;
}

const MIG_PATH = path.join(ROOT, 'supabase/migrations/00146_fix_jlpt_reading_quality.sql');
const sql = fs.readFileSync(MIG_PATH, 'utf8');

// Parse: UPDATE quiz_question_options SET option_text = '...' WHERE id = '<uuid>';
const optUpdates = new Map();
const optRe = /UPDATE\s+quiz_question_options\s+SET\s+option_text\s*=\s*'((?:[^']|'')*)'\s+WHERE\s+id\s*=\s*'([0-9a-f-]{36})'/g;
let m;
while ((m = optRe.exec(sql))) {
  const text = m[1].replace(/''/g, "'");
  optUpdates.set(m[2], text);
}

// Parse: UPDATE quiz_questions SET question_text = '...' [, explanation='...'] WHERE id='<uuid>'
const qUpdates = new Map();
const qRe = /UPDATE\s+quiz_questions\s+SET\s+question_text\s*=\s*'((?:[^']|'')*)'(?:,\s*explanation\s*=\s*'((?:[^']|'')*)')?\s+WHERE\s+id\s*=\s*'([0-9a-f-]{36})'/gs;
while ((m = qRe.exec(sql))) {
  qUpdates.set(m[3], { question_text: m[1].replace(/''/g, "'"), explanation: m[2] ? m[2].replace(/''/g, "'") : null });
}

console.log(`Parsed ${optUpdates.size} option UPDATEs, ${qUpdates.size} question UPDATEs`);

// Fetch current reading questions + options
const CATEGORY_QUIZ_IDS = ['c0000001', 'c0000002', 'c0000003', 'c0000004', 'c0000005'];
const { data: quizRows } = await supabase.from('quizzes').select('id').in('id', CATEGORY_QUIZ_IDS);
const quizIds = (quizRows || []).map(r => r.id);

let query = supabase.from('quiz_questions').select('id, quiz_id, question_text, difficulty, question_category');
if (quizIds.length) {
  const inList = quizIds.map(id => `"${id}"`).join(',');
  query = query.or(`question_category.eq.reading,quiz_id.in.(${inList})`);
} else {
  query = query.eq('question_category', 'reading');
}
const { data: questions, error } = await query;
if (error) throw error;

const qIds = questions.map(q => q.id);
const options = [];
for (let i = 0; i < qIds.length; i += 100) {
  const chunk = qIds.slice(i, i + 100);
  const { data: opts } = await supabase.from('quiz_question_options')
    .select('id, question_id, option_text, is_correct').in('question_id', chunk);
  options.push(...opts);
}

console.log(`Fetched ${questions.length} questions, ${options.length} options`);

// Validate: check that all UPDATE target IDs exist in DB
const optIdSet = new Set(options.map(o => o.id));
const qIdSet = new Set(questions.map(q => q.id));
const unknownOptIds = [...optUpdates.keys()].filter(id => !optIdSet.has(id));
const unknownQIds = [...qUpdates.keys()].filter(id => !qIdSet.has(id));
console.log(`Unknown option IDs in migration: ${unknownOptIds.length}`);
console.log(`Unknown question IDs in migration: ${unknownQIds.length}`);
if (unknownOptIds.length > 0) console.log('  UNKNOWN_OPTS:', unknownOptIds.slice(0, 5));
if (unknownQIds.length > 0) console.log('  UNKNOWN_QS:', unknownQIds);

function runChecks(qs, opts) {
  const optByQ = new Map();
  for (const o of opts) {
    if (!optByQ.has(o.question_id)) optByQ.set(o.question_id, []);
    optByQ.get(o.question_id).push(o);
  }
  let high = 0, medium = 0;
  const hiRecords = [], medRecords = [];
  const byCode = { A2: 0, B5_ratio: 0, B5_correct: 0, B6: 0, B8: 0 };
  for (const q of qs) {
    const os = optByQ.get(q.id) || [];
    let hitHigh = false, hitMed = false;
    const correct = os.find(o => o.is_correct);
    if (os.length) {
      const lens = os.map(o => strLen(o.option_text));
      const maxL = Math.max(...lens), minL = Math.min(...lens) || 1;
      const UNIT_RE = /[0-9０-９%％円時人回分秒時間日月年歳件個本枚]/;
      const isNumShort = lens.every(l => l <= 4) && os.some(o => UNIT_RE.test(o.option_text || ''));
      if (!isNumShort) {
        if (maxL / minL > 1.5) { byCode.B5_ratio++; hitMed = true; }
        if (correct) {
          const cL = strLen(correct.option_text);
          if ((cL === maxL || cL === minL) && maxL !== minL) { byCode.B5_correct++; hitMed = true; }
        }
      }
      for (const o of os) if ((o.option_text || '').includes('/')) { byCode.B6++; hitMed = true; break; }
      for (const o of os) if (HANGUL_RE.test(o.option_text || '')) { byCode.B8++; hitMed = true; break; }
      if (HANGUL_RE.test(q.question_text || '')) { byCode.B8++; hitMed = true; }

      // A2 check - reading is R1 exempt, so skip (match investigator behavior)
      const isReading = (q.question_category || '').toLowerCase() === 'reading';
      if (correct && !isReading) {
        const leak = answerLeakRatio(q.question_text || '', correct.option_text || '');
        if (leak > 0.5) { byCode.A2++; hitHigh = true; }
      }
    }
    if (hitHigh) { high++; hiRecords.push(q.id); }
    else if (hitMed) { medium++; medRecords.push(q.id); }
  }
  return { high, medium, byCode, hiRecords, medRecords };
}

const before = runChecks(questions, options);

// Apply in-memory patches
const patchedOptions = options.map(o => optUpdates.has(o.id) ? { ...o, option_text: optUpdates.get(o.id) } : o);
const patchedQuestions = questions.map(q => qUpdates.has(q.id) ? { ...q, question_text: qUpdates.get(q.id).question_text } : q);

const after = runChecks(patchedQuestions, patchedOptions);

console.log('\n=== BEFORE ===');
console.log(`High: ${before.high}, Medium: ${before.medium}`);
console.log('By code:', before.byCode);
console.log('\n=== AFTER (simulated) ===');
console.log(`High: ${after.high}, Medium: ${after.medium}`);
console.log('By code:', after.byCode);

console.log('\n=== DELTA ===');
console.log(`High: ${before.high} → ${after.high} (${after.high - before.high})`);
console.log(`Medium: ${before.medium} → ${after.medium} (${after.medium - before.medium})`);
for (const k of Object.keys(before.byCode)) {
  console.log(`${k}: ${before.byCode[k]} → ${after.byCode[k]}`);
}

// Identify regressions (new violations)
const beforeHi = new Set(before.hiRecords);
const beforeMed = new Set(before.medRecords);
const newHi = after.hiRecords.filter(id => !beforeHi.has(id) && !beforeMed.has(id));
const newMed = after.medRecords.filter(id => !beforeMed.has(id) && !beforeHi.has(id));
console.log(`\nRegressions introduced:`);
console.log(`  New High: ${newHi.length}`, newHi.slice(0,10));
console.log(`  New Medium: ${newMed.length}`, newMed.slice(0,10));
