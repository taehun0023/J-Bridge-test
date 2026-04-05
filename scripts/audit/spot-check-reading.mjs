#!/usr/bin/env node
/**
 * Spot-check 10 B8 translations + 10 B5 rebalance samples from the migration,
 * comparing before (DB) vs after (migration SQL).
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
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), { auth: { persistSession: false } });

const strLen = (s) => [...(s || '')].length;

const sql = fs.readFileSync(path.join(ROOT, 'supabase/migrations/00146_fix_jlpt_reading_quality.sql'), 'utf8');

// Parse block structure: comments starting with `-- Q-xxxxxxxx` followed by UPDATEs
const lines = sql.split('\n');
const blocks = []; // { qShort, header, updates: [{id, text}] }
let cur = null;
for (const line of lines) {
  const mHead = line.match(/^-- Q-([0-9a-f]{8})\s*(.*)/);
  if (mHead) {
    if (cur) blocks.push(cur);
    cur = { qShort: mHead[1], header: mHead[2], updates: [] };
    continue;
  }
  const mUp = line.match(/^UPDATE\s+quiz_question_options\s+SET\s+option_text\s*=\s*'((?:[^']|'')*)'\s+WHERE\s+id\s*=\s*'([0-9a-f-]{36})'/);
  if (mUp && cur) cur.updates.push({ id: mUp[2], text: mUp[1].replace(/''/g, "'") });
}
if (cur) blocks.push(cur);

// Identify B8 blocks (under "P0 Block 2 — B8") — naive section marker
const b8StartIdx = sql.indexOf('-- P0 Block 2');
const b8EndIdx = sql.indexOf('-- P1 Block');
const b8Sql = sql.slice(b8StartIdx, b8EndIdx);
const b8Shorts = new Set([...b8Sql.matchAll(/-- Q-([0-9a-f]{8})/g)].map(m => m[1]));

const p1Sql = sql.slice(sql.indexOf('-- P1 Block'), sql.indexOf('-- P2 Block'));
const p1Shorts = new Set([...p1Sql.matchAll(/-- Q-([0-9a-f]{8})/g)].map(m => m[1]));

console.log(`B8 blocks: ${b8Shorts.size}, P1 blocks: ${p1Shorts.size}`);

// Collect all Q-short → block
const blockByShort = new Map(blocks.map(b => [b.qShort, b]));

// Pseudo-random but deterministic sample (first 10 of each)
const b8Samples = [...b8Shorts].slice(0, 10);
const p1Samples = [...p1Shorts].slice(0, 10);

// Fetch all question IDs matching these short-ids
const allShorts = [...new Set([...b8Samples, ...p1Samples])];

// We need full question_id (uuid) per short. Fetch reading questions.
const CATEGORY_QUIZ_IDS = ['c0000001', 'c0000002', 'c0000003', 'c0000004', 'c0000005', 'a0000002'];
const { data: quizRows } = await supabase.from('quizzes').select('id').in('id', CATEGORY_QUIZ_IDS);
const quizIds = (quizRows || []).map(r => r.id);
const { data: questions } = await supabase.from('quiz_questions')
  .select('id, quiz_id, question_text, difficulty, question_category')
  .eq('question_category', 'reading');
const shortToQ = new Map();
for (const q of questions) shortToQ.set(q.id.slice(0, 8), q);

const targetQIds = allShorts.map(s => shortToQ.get(s)?.id).filter(Boolean);
const { data: opts } = await supabase.from('quiz_question_options').select('id, question_id, option_text, is_correct').in('question_id', targetQIds);
const optsByQ = new Map();
for (const o of opts) {
  if (!optsByQ.has(o.question_id)) optsByQ.set(o.question_id, []);
  optsByQ.get(o.question_id).push(o);
}

function sampleReport(shorts, label) {
  console.log(`\n=== ${label} ===`);
  for (const s of shorts) {
    const q = shortToQ.get(s);
    if (!q) { console.log(`[MISS] ${s}`); continue; }
    const oldOpts = optsByQ.get(q.id) || [];
    const blk = blockByShort.get(s);
    const patchMap = new Map((blk?.updates || []).map(u => [u.id, u.text]));
    const newOpts = oldOpts.map(o => ({ ...o, option_text: patchMap.get(o.id) ?? o.option_text }));
    const correctOld = oldOpts.find(o => o.is_correct);
    const correctNew = newOpts.find(o => o.is_correct);
    const oldLens = oldOpts.map(o => strLen(o.option_text));
    const newLens = newOpts.map(o => strLen(o.option_text));
    const oldRatio = (Math.max(...oldLens) / (Math.min(...oldLens) || 1)).toFixed(2);
    const newRatio = (Math.max(...newLens) / (Math.min(...newLens) || 1)).toFixed(2);
    const newCL = correctNew ? strLen(correctNew.option_text) : 0;
    const newMax = Math.max(...newLens), newMin = Math.min(...newLens);
    const pos = newCL === newMax ? 'LONGEST' : newCL === newMin ? 'SHORTEST' : 'middle';
    console.log(`\nQ-${s} (${q.difficulty}) header="${blk?.header || ''}"`);
    console.log(`  question: "${(q.question_text || '').slice(0, 80).replace(/\n/g, ' ')}..."`);
    console.log(`  ratio: ${oldRatio}x → ${newRatio}x | correct pos: ${pos} (${newCL} chars)`);
    console.log(`  OLD correct: "${correctOld?.option_text}" (${strLen(correctOld?.option_text)})`);
    console.log(`  NEW correct: "${correctNew?.option_text}" (${newCL})`);
    console.log(`  NEW options:`);
    for (const o of newOpts) {
      const mark = o.is_correct ? '[*]' : '   ';
      console.log(`    ${mark} "${o.option_text}" (${strLen(o.option_text)})`);
    }
  }
}

sampleReport(b8Samples, 'B8 TRANSLATION SAMPLES (10)');
sampleReport(p1Samples, 'B5 REBALANCE SAMPLES (10)');
