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
  .select('question_category, difficulty, quiz_id')
  .limit(10000);

// category x difficulty x quiz_id counts
const byCat = new Map();
for (const q of data) {
  const cat = q.question_category || '(null)';
  if (!byCat.has(cat)) byCat.set(cat, { total: 0, byDiff: new Map(), byQuiz: new Map() });
  const c = byCat.get(cat);
  c.total++;
  const d = q.difficulty || '(null)';
  c.byDiff.set(d, (c.byDiff.get(d) || 0) + 1);
  const qid = (q.quiz_id || '').slice(0, 8);
  c.byQuiz.set(qid, (c.byQuiz.get(qid) || 0) + 1);
}

console.log('=== Category distribution ===\n');
const sorted = [...byCat.entries()].sort((a, b) => b[1].total - a[1].total);
for (const [cat, info] of sorted) {
  console.log(`${cat}: ${info.total} total`);
  const diffs = [...info.byDiff.entries()].sort((a, b) => b[1] - a[1]);
  console.log(`  difficulties: ${diffs.map(([d, n]) => `${d}=${n}`).join(', ')}`);
  const quizzes = [...info.byQuiz.entries()].sort((a, b) => b[1] - a[1]).slice(0, 5);
  console.log(`  top quizzes: ${quizzes.map(([q, n]) => `${q}=${n}`).join(', ')}`);
  console.log('');
}
