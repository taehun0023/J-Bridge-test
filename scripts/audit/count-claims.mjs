#!/usr/bin/env node
/**
 * Quick one-off: count question_claims across Step1 (生活日本語) categories.
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createClient } from '@supabase/supabase-js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..', '..');
const envText = fs.readFileSync(path.join(ROOT, '.env.local'), 'utf8');
const getEnv = (k) => envText.match(new RegExp(`^${k}=(.+)$`, 'm'))?.[1]?.trim();

const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const { data, error } = await supabase
  .from('question_claims')
  .select('id, question_id, quiz_questions!inner(question_category)')
  .in('quiz_questions.question_category', ['grammar', 'reading', 'listening']);

if (error) { console.error(error); process.exit(1); }

const byCat = {};
const uniqueQ = new Set();
for (const r of data) {
  const c = r.quiz_questions.question_category;
  byCat[c] = (byCat[c] || 0) + 1;
  uniqueQ.add(r.question_id);
}

console.log('Total Step1 (生活日本語) claims:', data.length);
console.log('Unique questions claimed:', uniqueQ.size);
console.log('By category:', byCat);

// Also check columns of question_claims
const { data: sample } = await supabase.from('question_claims').select('*').limit(1);
console.log('\nquestion_claims columns:', sample?.[0] ? Object.keys(sample[0]) : 'empty');
