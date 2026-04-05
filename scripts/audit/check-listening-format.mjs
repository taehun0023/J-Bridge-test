#!/usr/bin/env node
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const { data } = await supabase
  .from('quiz_questions')
  .select('id, question_text')
  .eq('question_category', 'listening')
  .limit(3);

for (const q of data) {
  console.log(`\n=== ${q.id} ===`);
  console.log(JSON.stringify(q.question_text));
  console.log('---');
  console.log(`Has \\n\\n: ${q.question_text.includes('\n\n')}`);
  console.log(`Has \\n: ${q.question_text.includes('\n')}`);
  console.log(`Has literal \\\\n: ${q.question_text.includes('\\n')}`);
}
