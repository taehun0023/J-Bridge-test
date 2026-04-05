#!/usr/bin/env node
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

// Fetch all grammar + vocab questions
const allQs = [];
let offset = 0;
while (true) {
  const { data } = await supabase
    .from('quiz_questions')
    .select('id, question_text, question_category, difficulty, quiz_id, explanation')
    .in('question_category', ['grammar', 'vocab'])
    .order('id')
    .range(offset, offset + 999);
  if (!data || data.length === 0) break;
  allQs.push(...data);
  if (data.length < 1000) break;
  offset += data.length;
}
console.log(`Fetched ${allQs.length} grammar+vocab questions`);

// Fetch options
const optsByQ = new Map();
const qIds = allQs.map(q => q.id);
for (let i = 0; i < qIds.length; i += 200) {
  const chunk = qIds.slice(i, i + 200);
  let innerOffset = 0;
  while (true) {
    const { data: opts } = await supabase
      .from('quiz_question_options')
      .select('id, question_id, option_text, is_correct, sort_order')
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

// Find leaks
for (const q of allQs) {
  const opts = optsByQ.get(q.id) || [];
  const correct = opts.find(o => o.is_correct);
  if (!correct) continue;
  const ans = (correct.option_text || '').trim();
  if (ans.length < 4) continue;
  if (!q.question_text.includes(ans)) continue;

  console.log(`\n=== ${q.id} [${q.question_category}/${q.difficulty}] quiz=${q.quiz_id?.slice(0,8)} ===`);
  console.log(`Q: "${q.question_text}"`);
  console.log(`Options:`);
  const sortedOpts = opts.sort((a,b) => (a.sort_order||0)-(b.sort_order||0));
  for (const o of sortedOpts) {
    console.log(`  ${o.is_correct ? '[*]' : '   '} ${o.id} "${o.option_text}"`);
  }
  console.log(`Explanation: "${(q.explanation || '').slice(0, 200)}"`);
}
