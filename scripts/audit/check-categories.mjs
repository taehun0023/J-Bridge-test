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

const { data } = await sb
  .from('quiz_questions')
  .select('quiz_id, question_category, difficulty')
  .eq('question_category', 'listening');
const counts = {};
for (const r of data) {
  const k = `${r.quiz_id} | ${r.difficulty}`;
  counts[k] = (counts[k] || 0) + 1;
}
console.log(counts);
console.log('total', data.length);
