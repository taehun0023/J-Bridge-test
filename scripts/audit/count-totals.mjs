#!/usr/bin/env node
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const { count: total } = await supabase.from('quiz_questions').select('*', { count: 'exact', head: true });
console.log(`Total quiz_questions: ${total}`);

for (const cat of ['grammar', 'reading', 'listening', 'vocabulary', 'vocab', 'sentence_pattern', 'business_expression', 'keigo', 'business_manner']) {
  const { count } = await supabase.from('quiz_questions').select('*', { count: 'exact', head: true }).eq('question_category', cat);
  console.log(`  ${cat}: ${count}`);
}
