#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { createClient } from '@supabase/supabase-js';

const ROOT = '/Users/kato/Desktop/Project/edu_cha';
const envText = fs.readFileSync(path.join(ROOT, '.env.local'), 'utf8');
const getEnv = (k) => envText.match(new RegExp(`^${k}=(.+)$`, 'm'))?.[1]?.trim();
const sb = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const { data: questions, error: qerr } = await sb
  .from('quiz_questions')
  .select('id, quiz_id, difficulty, question_category, question_text, explanation')
  .eq('question_category', 'listening');
if (qerr) { console.error(qerr); process.exit(1); }

const qids = questions.map((q) => q.id);
const { data: options, error: oerr } = await sb
  .from('quiz_question_options')
  .select('id, question_id, option_text, is_correct, sort_order')
  .in('question_id', qids);
if (oerr) { console.error(oerr); process.exit(1); }

const byQ = new Map();
for (const q of questions) byQ.set(q.id, { ...q, options: [] });
for (const o of options) {
  const bucket = byQ.get(o.question_id);
  if (bucket) bucket.options.push(o);
}
for (const q of byQ.values()) q.options.sort((a, b) => a.sort_order - b.sort_order);

const out = Array.from(byQ.values());
fs.writeFileSync('/tmp/listening_all.json', JSON.stringify(out, null, 2));
console.log(`wrote ${out.length} listening questions to /tmp/listening_all.json`);
