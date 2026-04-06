#!/usr/bin/env node
/**
 * Fetch CS quiz_questions with B5-a (length bias) issues.
 *
 * Usage:
 *   node scripts/audit/fetch-cs-b5a.mjs <category>
 * Example:
 *   node scripts/audit/fetch-cs-b5a.mjs algorithm
 *
 * Output: docs/audit/cs_<category>_b5a_data.json
 */

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createClient } from '@supabase/supabase-js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, '..', '..');

// ─── Config ──────────────────────────────────────────────────────────────────

const category = process.argv[2];
if (!category) {
  console.error('Usage: node scripts/audit/fetch-cs-b5a.mjs <category>');
  console.error('Example categories: algorithm, data_structure, network, os, database, security, etc.');
  process.exit(1);
}

// ─── Env loading ─────────────────────────────────────────────────────────────

const envPath = path.join(ROOT, '.env.local');
const envText = fs.readFileSync(envPath, 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();

const SUPABASE_URL = getEnv('NEXT_PUBLIC_SUPABASE_URL');
const SERVICE_ROLE_KEY = getEnv('SUPABASE_SERVICE_ROLE_KEY');

if (!SUPABASE_URL || !SERVICE_ROLE_KEY) {
  console.error('ERROR: Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local');
  process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
});

// ─── Helpers ─────────────────────────────────────────────────────────────────

function strLen(s) {
  return [...(s || '')].length;
}

// ─── Fetch ───────────────────────────────────────────────────────────────────

async function fetchAll() {
  // Paginate quiz_questions with matching question_category
  const questions = [];
  let offset = 0;
  const PAGE = 1000;
  while (true) {
    const { data, error } = await supabase
      .from('quiz_questions')
      .select('id, quiz_id, question_text, explanation, difficulty, question_category, question_subtype, points, sort_order')
      .eq('question_category', category)
      .range(offset, offset + PAGE - 1);
    if (error) throw error;
    if (!data || data.length === 0) break;
    questions.push(...data);
    if (data.length < PAGE) break;
    offset += data.length;
  }

  console.log(`Fetched ${questions.length} quiz_questions with category="${category}"`);

  if (questions.length === 0) return { questions: [], options: [] };

  const qIds = questions.map((q) => q.id);

  // Batch fetch options
  const options = [];
  for (let i = 0; i < qIds.length; i += 100) {
    const chunk = qIds.slice(i, i + 100);
    const { data: opts, error: oErr } = await supabase
      .from('quiz_question_options')
      .select('id, question_id, option_text, is_correct, sort_order')
      .in('question_id', chunk);
    if (oErr) throw oErr;
    options.push(...opts);
  }
  console.log(`Fetched ${options.length} quiz_question_options`);

  return { questions, options };
}

// ─── B5-a Filter ─────────────────────────────────────────────────────────────

function filterB5a({ questions, options }) {
  const optByQ = new Map();
  for (const o of options) {
    if (!optByQ.has(o.question_id)) optByQ.set(o.question_id, []);
    optByQ.get(o.question_id).push(o);
  }

  const results = [];

  for (const q of questions) {
    const opts = optByQ.get(q.id) || [];
    if (opts.length !== 4) continue;

    const lengths = opts.map((o) => strLen(o.option_text));
    const avgL = lengths.reduce((a, b) => a + b, 0) / lengths.length;

    // Skip word-level options (avg <= 8 chars)
    if (avgL <= 8) continue;

    const maxL = Math.max(...lengths);
    const minL = Math.min(...lengths) || 1;
    const ratio = maxL / minL;

    const correctOpts = opts.filter((o) => o.is_correct);
    if (correctOpts.length !== 1) continue;

    const correct = correctOpts[0];
    const correctLen = strLen(correct.option_text);
    const correctIsLongest = correctLen === maxL && maxL !== minL;
    const correctIsShortest = correctLen === minL && maxL !== minL;

    // B5-a criteria:
    //  1. correct answer is the longest OR shortest option
    //  2. OR max/min length ratio exceeds 1.2x
    const hasLengthBias = correctIsLongest || correctIsShortest || ratio > 1.2;
    if (!hasLengthBias) continue;

    const sortedOpts = [...opts].sort((a, b) => (a.sort_order || 0) - (b.sort_order || 0));

    results.push({
      qid: q.id,
      quizId: q.quiz_id,
      cat: q.question_category,
      diff: q.difficulty || null,
      qtext: q.question_text || '',
      correctLen,
      correctIsShortest,
      correctIsLongest,
      ratio: ratio.toFixed(2),
      opts: sortedOpts.map((o) => ({
        id: o.id,
        text: o.option_text || '',
        len: strLen(o.option_text),
        correct: !!o.is_correct,
        sort: o.sort_order || 0,
      })),
    });
  }

  return results;
}

// ─── Main ────────────────────────────────────────────────────────────────────

(async () => {
  console.log(`\n=== CS B5-a Fetch: category="${category}" ===\n`);
  const data = await fetchAll();

  if (data.questions.length === 0) {
    console.log('No questions found. Exiting.');
    process.exit(0);
  }

  const results = filterB5a(data);
  console.log(`\nFiltered ${results.length} / ${data.questions.length} questions with B5-a issues`);

  // Stats breakdown
  let longestCount = 0;
  let shortestCount = 0;
  let ratioOnlyCount = 0;
  const diffCounts = {};
  const quizCounts = {};

  for (const r of results) {
    if (r.correctIsLongest) longestCount++;
    else if (r.correctIsShortest) shortestCount++;
    else ratioOnlyCount++;

    const d = r.diff || 'NULL';
    diffCounts[d] = (diffCounts[d] || 0) + 1;

    const qShort = (r.quizId || '').slice(0, 8);
    quizCounts[qShort] = (quizCounts[qShort] || 0) + 1;
  }

  console.log(`\n--- Breakdown ---`);
  console.log(`  correct=longest:  ${longestCount}`);
  console.log(`  correct=shortest: ${shortestCount}`);
  console.log(`  ratio>1.2 only:   ${ratioOnlyCount}`);
  console.log(`\n--- By difficulty ---`);
  for (const [d, c] of Object.entries(diffCounts).sort((a, b) => b[1] - a[1])) {
    console.log(`  ${d}: ${c}`);
  }
  console.log(`\n--- By quiz (prefix) ---`);
  for (const [q, c] of Object.entries(quizCounts).sort((a, b) => b[1] - a[1])) {
    console.log(`  ${q}: ${c}`);
  }

  // Write output
  const outPath = path.join(ROOT, 'docs', 'audit', `cs_${category}_b5a_data.json`);
  fs.writeFileSync(outPath, JSON.stringify(results, null, 2), 'utf8');
  console.log(`\nOutput written to: ${outPath}`);
  console.log(`Total B5-a issues: ${results.length}`);
})().catch((e) => {
  console.error('FATAL:', e);
  process.exit(1);
});
