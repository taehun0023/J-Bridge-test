#!/usr/bin/env node
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const { data: q } = await supabase
  .from('quiz_questions')
  .select('id, question_text, question_category')
  .eq('id', '647ab6eb-...')
  .maybeSingle();

// try by ilike
const { data: candidates } = await supabase
  .from('quiz_questions')
  .select('id, question_text, question_category')
  .ilike('question_text', '%日本語を話すことができます%');

for (const c of candidates) {
  console.log(`id: ${c.id}`);
  console.log(`category: ${c.question_category}`);
  console.log(`qtext bytes:`, Buffer.from(c.question_text).slice(0, 100));
  console.log(`qtext string: ${c.question_text}`);

  const { data: opts } = await supabase
    .from('quiz_question_options')
    .select('option_text, is_correct')
    .eq('question_id', c.id);
  const correct = opts.find(o => o.is_correct);
  console.log(`correct: ${correct.option_text}`);
  console.log(`correct bytes:`, Buffer.from(correct.option_text).slice(0, 100));
  console.log(`includes? ${c.question_text.includes(correct.option_text)}`);
  // Char-by-char compare
  const ans = correct.option_text.trim();
  console.log(`ans length: ${ans.length}, codes: ${[...ans].map(c => c.charCodeAt(0).toString(16)).join(' ')}`);
  console.log(`qtext: "${c.question_text}"`);
  console.log(`qtext includes ans (strict): ${c.question_text.indexOf(ans) >= 0}`);
  console.log(`qtext index: ${c.question_text.indexOf(ans)}`);
  console.log('');
}
