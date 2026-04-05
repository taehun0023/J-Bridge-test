#!/usr/bin/env node
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const ids = [
  'b7b54fcf-e5ed-40c4-853f-b66bf6c899e4',  // N-2 check
];

const { data: opts } = await supabase
  .from('quiz_question_options')
  .select('id, question_id, option_text, is_correct')
  .in('question_id', ids);

for (const o of opts) {
  console.log(`  ${o.id} ${o.is_correct ? '[*]' : '   '} "${o.option_text}"`);
}
