#!/usr/bin/env node
// Find questions where the correct answer appears verbatim in question_text
// Excludes reading/listening (structurally inherent per R1/L4 rubric)
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

// Find the 日本語を話すことができます question first
console.log('=== Searching for the reported question ===\n');
const { data: reported } = await supabase
  .from('quiz_questions')
  .select('id, question_text, question_category, difficulty, quiz_id')
  .ilike('question_text', '%日本語を話すことができます%');

if (reported) {
  for (const q of reported) {
    const { data: opts } = await supabase
      .from('quiz_question_options')
      .select('option_text, is_correct, sort_order')
      .eq('question_id', q.id)
      .order('sort_order');
    console.log(`Q-${q.id.slice(0,8)} [${q.question_category}/${q.difficulty}] quiz=${q.quiz_id?.slice(0,8)}`);
    console.log(`  Q: "${q.question_text.replace(/\n/g,' ').slice(0,200)}"`);
    for (const o of opts || []) {
      console.log(`  ${o.is_correct ? '[*]' : '   '} "${o.option_text}"`);
    }
    console.log('');
  }
}

// Now find ALL questions where correct option_text appears verbatim in question_text
console.log('\n=== Scanning full DB for verbatim answer-leak ===\n');
const allQs = [];
let offset = 0;
const PAGE = 1000;
while (true) {
  const { data } = await supabase
    .from('quiz_questions')
    .select('id, question_text, question_category, difficulty, quiz_id')
    .order('id')
    .range(offset, offset + PAGE - 1);
  if (!data || data.length === 0) break;
  allQs.push(...data);
  if (data.length < PAGE) break;
  offset += data.length;
}
console.log(`Fetched ${allQs.length} questions total`);

// Batch fetch options
const qIds = allQs.map(q => q.id);
const optsByQ = new Map();
for (let i = 0; i < qIds.length; i += 200) {
  const chunk = qIds.slice(i, i + 200);
  // Paginate within chunk (each question ~4 opts, so 200 qs = ~800 opts)
  let innerOffset = 0;
  while (true) {
    const { data: opts } = await supabase
      .from('quiz_question_options')
      .select('question_id, option_text, is_correct, sort_order')
      .in('question_id', chunk)
      .order('id')
      .range(innerOffset, innerOffset + 999);
    if (!opts || opts.length === 0) break;
    for (const o of opts) {
      if (!optsByQ.has(o.question_id)) optsByQ.set(o.question_id, []);
      optsByQ.get(o.question_id).push(o);
    }
    if (opts.length < 1000) break;
    innerOffset += opts.length;
  }
}
console.log(`Loaded options for ${optsByQ.size} questions`);

const leaks = [];
const debugId = '647ab6eb-fabe-46d5-85dc-ede28319d6be';
for (const q of allQs) {
  if (q.id === debugId) console.log(`DEBUG ${q.id}: category=${q.question_category}, opts in map: ${(optsByQ.get(q.id) || []).length}`);
  // Skip reading/listening (R1/L4 exempt - structurally inherent)
  if (q.question_category === 'reading' || q.question_category === 'listening') continue;
  const opts = optsByQ.get(q.id) || [];
  const correct = opts.find(o => o.is_correct);
  if (q.id === debugId) console.log(`DEBUG correct=${correct?.option_text}, ans length=${correct?.option_text?.trim()?.length}, includes=${q.question_text.includes((correct?.option_text || '').trim())}`);
  if (!correct || !correct.option_text) continue;
  const ans = correct.option_text.trim();
  if (ans.length < 4) continue; // too short = coincidental
  const qtext = q.question_text || '';
  if (qtext.includes(ans)) {
    // Verify it's not trivial — check if any DISTRACTOR is also in question text
    const distractors = opts.filter(o => !o.is_correct).map(o => (o.option_text || '').trim());
    const distractorsInQ = distractors.filter(d => d.length >= 4 && qtext.includes(d)).length;
    leaks.push({
      id: q.id,
      category: q.question_category,
      difficulty: q.difficulty,
      quiz: q.quiz_id?.slice(0,8),
      answer: ans,
      answerLen: ans.length,
      distractorsAlsoInQ: distractorsInQ,
      qtext: qtext.replace(/\n/g,' ').slice(0, 200),
      options: opts.sort((a,b)=> (a.sort_order||0)-(b.sort_order||0)),
    });
  }
}

console.log(`Total leaks (answer verbatim in question): ${leaks.length}\n`);

// Categorize
const byCategory = new Map();
for (const l of leaks) {
  if (!byCategory.has(l.category)) byCategory.set(l.category, []);
  byCategory.get(l.category).push(l);
}

console.log('By category:');
for (const [cat, arr] of [...byCategory.entries()].sort((a,b)=> b[1].length - a[1].length)) {
  const pureLeaks = arr.filter(l => l.distractorsAlsoInQ === 0).length;
  console.log(`  ${cat}: ${arr.length} (pure leaks: ${pureLeaks} — distractor not in Q)`);
}

// Show top 20 pure leaks
console.log('\n=== Top 30 pure leaks (where NO distractor appears in question) ===\n');
const pure = leaks.filter(l => l.distractorsAlsoInQ === 0).sort((a,b)=> b.answerLen - a.answerLen);
for (let i = 0; i < Math.min(30, pure.length); i++) {
  const l = pure[i];
  console.log(`${i+1}. Q-${l.id.slice(0,8)} [${l.category}/${l.difficulty}] (ans ${l.answerLen}자)`);
  console.log(`   Q: ${l.qtext}`);
  console.log(`   A: "${l.answer}"`);
  console.log('');
}
