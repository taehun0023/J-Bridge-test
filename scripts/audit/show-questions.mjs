#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createClient } from '@supabase/supabase-js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..', '..');
const envText = fs.readFileSync(path.join(ROOT, '.env.local'), 'utf8');
const getEnv = (k) => envText.match(new RegExp(`^${k}=(.+)$`, 'm'))?.[1]?.trim();
const sb = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const ids = process.argv.slice(2);
if (ids.length === 0) {
  console.error('Usage: node show-questions.mjs <uuid1> <uuid2> ...');
  process.exit(1);
}

const { data: qs } = await sb
  .from('quiz_questions')
  .select('id, question_text, explanation, difficulty, question_category')
  .in('id', ids);

const { data: opts } = await sb
  .from('quiz_question_options')
  .select('id, question_id, option_text, is_correct, sort_order')
  .in('question_id', ids);

const optsByQ = new Map();
for (const o of opts) {
  if (!optsByQ.has(o.question_id)) optsByQ.set(o.question_id, []);
  optsByQ.get(o.question_id).push(o);
}
for (const arr of optsByQ.values()) arr.sort((a, b) => a.sort_order - b.sort_order);

for (const q of qs) {
  console.log(`\n### Q-${q.id.slice(0, 8)} (${q.difficulty})`);
  console.log(`Q: ${q.question_text}`);
  const os = optsByQ.get(q.id) || [];
  os.forEach((o, i) => {
    const mark = o.is_correct ? '✓' : ' ';
    console.log(`  ${mark} ${i + 1}. ${o.option_text}`);
  });
  if (q.explanation) console.log(`  解説: ${q.explanation.slice(0, 200)}`);
}
