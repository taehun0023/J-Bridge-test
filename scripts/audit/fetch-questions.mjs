#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createClient } from '@supabase/supabase-js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, '..', '..');

const QUESTION_IDS = [
  '21bfd1e6-633e-41f6-8266-dd239df78849',
  '5c4e9b76-c5c9-4a33-826e-38dbf08801fb',
  'e54f82dc-4134-47d9-bd38-a7628fea4075',
  '3d4a0758-eb97-4c37-ada8-4dbbb61cf404',
  '0c55e93c-5435-4179-9855-eb1bf7640f4c',
  '94e43820-fde2-478c-8a46-47cb77cced0c',
  '7e8bec44-cdf2-4e6d-88d8-7b921cf0ef44',
  '36d95ad4-54b4-4527-88b7-64d72ce8486b',
  'c67b80a7-a638-4d2f-aae0-720adb6968d4',
];

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

async function main() {
  const { data: questions, error: qErr } = await supabase
    .from('quiz_questions')
    .select('id, quiz_id, question_text, difficulty, question_category')
    .in('id', QUESTION_IDS);

  if (qErr) { console.error('quiz_questions error:', qErr); process.exit(1); }

  const { data: options, error: oErr } = await supabase
    .from('quiz_question_options')
    .select('id, question_id, option_text, is_correct, sort_order')
    .in('question_id', QUESTION_IDS)
    .order('sort_order', { ascending: true });

  if (oErr) { console.error('quiz_question_options error:', oErr); process.exit(1); }

  const optionsByQ = {};
  for (const o of options) {
    if (!optionsByQ[o.question_id]) optionsByQ[o.question_id] = [];
    optionsByQ[o.question_id].push({
      option_id: o.id,
      option_text: o.option_text,
      is_correct: o.is_correct,
      sort_order: o.sort_order,
    });
  }

  const result = questions.map(q => ({
    question_id: q.id,
    quiz_id: q.quiz_id,
    question_text: q.question_text,
    difficulty: q.difficulty,
    question_category: q.question_category,
    options: optionsByQ[q.id] || [],
  }));

  // Sort by input order
  const idOrder = new Map(QUESTION_IDS.map((id, i) => [id, i]));
  result.sort((a, b) => (idOrder.get(a.question_id) ?? 99) - (idOrder.get(b.question_id) ?? 99));

  console.log(JSON.stringify(result, null, 2));
}

main();
