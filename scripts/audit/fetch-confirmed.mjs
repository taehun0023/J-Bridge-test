#!/usr/bin/env node
/**
 * Fetch full option data for CONFIRMED B5-a questions to prepare Fixer migration.
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

// Map short IDs to full UUIDs from the audit reports
const FULL_IDS = {};
for (const fname of ['bj_sentence_pattern_issues.md','bj_business_expression_issues.md','bj_keigo_issues.md']) {
  const text = fs.readFileSync(path.join(ROOT, 'docs', 'audit', fname), 'utf8');
  for (const m of text.matchAll(/Q-([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})/g)) {
    FULL_IDS[m[1].slice(0, 8)] = m[1];
  }
}

async function fetchQ(qidShort) {
  const fullId = FULL_IDS[qidShort];
  if (!fullId) { console.error(`No full UUID for ${qidShort}`); return null; }
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

const CONFIRMED = {
  sentence_pattern: ['b4fe906c','07900db5','d25fa6d9','64e474e8','e6ef6d36','aef6b750','cac7f957','ba51f2d8','a794b14f','27eaa5f3','e52e99bb','b7af762c','3408b50e','ee0b52b7'],
  business_expression: ['ffa59c38','73619ca3','9fbf22b0','72f6eb31','203e35d7','12d7e4c0','54a89ffa','fe7dcf76','7e3e90cf','4a7cb3b2','e7e66fbd','e6a95afb','9d32d09c'],
  keigo: ['23cbb68f','27d8ca2e','3a8d0adb','cd449cbc','0d1d7d0c','995d09a3','6f915355','323d2841','31d4db5e','01937a63','12884872','d97673f0','02611999','904c5fd5','473fd455','ea2958d0','98a9d727','24a4aca3','db5c5de0'],
};

const results = {};
for (const [cat, ids] of Object.entries(CONFIRMED)) {
  results[cat] = [];
  for (const id of ids) {
    const q = await fetchQ(id);
    if (q) {
      const opts = q.options.map(o => ({
        id: o.id,
        text: o.option_text,
        len: [...(o.option_text || '')].length,
        correct: o.is_correct,
        sort: o.sort_order,
      }));
      const correctOpt = opts.find(o => o.correct);
      const maxLen = Math.max(...opts.map(o => o.len));
      const minLen = Math.min(...opts.map(o => o.len));
      results[cat].push({
        qid: q.id,
        cat: q.question_category,
        diff: q.difficulty,
        qtext: (q.question_text || '').slice(0, 100),
        correctLen: correctOpt?.len,
        correctIsLongest: correctOpt?.len === maxLen,
        correctIsShortest: correctOpt?.len === minLen,
        ratio: (maxLen / (minLen || 1)).toFixed(2),
        opts,
      });
    }
  }
}

const outPath = path.join(ROOT, 'docs', 'audit', 'bj_confirmed_data.json');
fs.writeFileSync(outPath, JSON.stringify(results, null, 2), 'utf8');
console.log(`Written ${outPath}`);
for (const [cat, items] of Object.entries(results)) {
  console.log(`  ${cat}: ${items.length} questions`);
}
