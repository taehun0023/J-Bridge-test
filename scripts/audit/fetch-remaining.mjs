#!/usr/bin/env node
/**
 * Fetch remaining B5-a issues (previously DISMISSED, now needed for B5-b fix).
 * Only fetches "correct is shortest" items for FAIL quizzes.
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..', '..');

const envText = fs.readFileSync(path.join(ROOT, '.env.local'), 'utf8');
const getEnv = (k) => envText.match(new RegExp(`^${k}=(.+)$`, 'm'))?.[1]?.trim();
const SB_URL = getEnv('NEXT_PUBLIC_SUPABASE_URL');
const SB_KEY = getEnv('SUPABASE_SERVICE_ROLE_KEY');

// B5-b FAIL quizzes — need to reduce "correct=shortest" count
const FAIL_QUIZZES = {
  sentence_pattern: ['b2000001', 'b2000002', 'b2000003'],
  keigo: ['b4000001', 'b4000003'],
};

// Remaining "correct is shortest" question IDs (from audit report grep)
const REMAINING = {
  sentence_pattern: [
    // b2000001 (50% shortest: 5/10)
    '82f911c0', '26b33584',
    // b2000002 (50% shortest: 5/10)
    '3c51a221', '975ae5c6', '78e42eaf',
    // b2000003 (46.7% shortest: 7/15)
    '7068a5dd', 'b7d2a035', 'cb87dd48', '81069a9a',
    '24892f32', 'c061bb76', '63380dc1', '6dac5543', 'e6ef6d36',
    'b7af762c', // already fixed but still shortest
    '76853461',
  ],
  keigo: [
    // b4000001 (35.7% shortest: 5/14)
    '327aebb7', '5b962c24', '4b2fd683', '18b00feb',
    '995d09a3', '6f915355', '473fd455',
    // b4000003 (33.3% shortest: 4/12)
    'cd449cbc', 'e61c9966', 'd97673f0',
    '24a4aca3', '3a8d0adb',
  ],
};

// Build full UUID map from issues reports
const FULL_IDS = {};
for (const fname of ['bj_sentence_pattern_issues.md', 'bj_keigo_issues.md']) {
  const text = fs.readFileSync(path.join(ROOT, 'docs', 'audit', fname), 'utf8');
  for (const m of text.matchAll(/Q-([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})/g)) {
    FULL_IDS[m[1].slice(0, 8)] = m[1];
  }
}

async function fetchQ(fullId) {
  const resp = await fetch(
    `${SB_URL}/rest/v1/quiz_questions?id=eq.${fullId}&select=id,quiz_id,question_text,question_category,difficulty`,
    { headers: { apikey: SB_KEY, Authorization: `Bearer ${SB_KEY}` } }
  );
  const qs = await resp.json();
  if (!qs.length) return null;
  const q = qs[0];
  const oResp = await fetch(
    `${SB_URL}/rest/v1/quiz_question_options?question_id=eq.${q.id}&select=id,option_text,is_correct,sort_order&order=sort_order`,
    { headers: { apikey: SB_KEY, Authorization: `Bearer ${SB_KEY}` } }
  );
  q.options = await oResp.json();
  return q;
}

const results = {};
for (const [cat, ids] of Object.entries(REMAINING)) {
  results[cat] = [];
  for (const shortId of ids) {
    const fullId = FULL_IDS[shortId];
    if (!fullId) { console.error(`No UUID for ${shortId}`); continue; }
    const q = await fetchQ(fullId);
    if (!q) { console.error(`Not found: ${fullId}`); continue; }
    const opts = q.options.map(o => ({
      id: o.id, text: o.option_text,
      len: [...(o.option_text || '')].length,
      correct: o.is_correct, sort: o.sort_order,
    }));
    const correctOpt = opts.find(o => o.correct);
    const maxLen = Math.max(...opts.map(o => o.len));
    const minLen = Math.min(...opts.map(o => o.len));
    results[cat].push({
      qid: q.id, quizId: q.quiz_id?.slice(0, 8),
      cat: q.question_category, diff: q.difficulty,
      qtext: (q.question_text || '').slice(0, 80),
      correctLen: correctOpt?.len,
      correctIsShortest: correctOpt?.len === minLen,
      correctIsLongest: correctOpt?.len === maxLen,
      ratio: (maxLen / (minLen || 1)).toFixed(2),
      opts,
    });
  }
}

const outPath = path.join(ROOT, 'docs', 'audit', 'bj_remaining_data.json');
fs.writeFileSync(outPath, JSON.stringify(results, null, 2), 'utf8');
console.log(`Written ${outPath}`);
for (const [cat, items] of Object.entries(results)) {
  const shortest = items.filter(i => i.correctIsShortest).length;
  console.log(`  ${cat}: ${items.length} questions (${shortest} correct=shortest)`);
}
