#!/usr/bin/env node
// Find N5/N4 listening questions with 行く/行って/行きます in script body (not question-frame)
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const { data } = await supabase
  .from('quiz_questions')
  .select('id, question_text, difficulty')
  .eq('question_category', 'listening')
  .in('difficulty', ['N5', 'N4']);

// Patterns: 行く/行って/行き/行きます/行った/行かない/行こう
// Note: 銀行/旅行/飛行機/発行/進行 etc are okay (as compounds).
// Risky: standalone 行く/行って (movement verb, read as いく)
const riskPatterns = [
  /行く/g, /行って/g, /行きます/g, /行った/g,
  /行かない/g, /行こう/g, /行き方/g, /行けば/g, /行ける/g,
];

const candidates = [];
for (const q of data) {
  const text = q.question_text;
  const hits = [];
  for (const re of riskPatterns) {
    const matches = text.match(re);
    if (matches) hits.push(...matches);
  }
  // Exclude if only compound-word context (銀行/旅行/飛行/発行/進行/歩行/一行/施行)
  const compoundRe = /(?:銀行|旅行|飛行|発行|進行|歩行|一行|施行|流行|直行|急行|出行|現行|執行)/g;
  const compoundHits = (text.match(compoundRe) || []).length;
  const standaloneHits = hits.length - compoundHits;
  if (standaloneHits > 0) {
    candidates.push({
      id: q.id,
      difficulty: q.difficulty,
      hits,
      standaloneCount: standaloneHits,
      text: text.replace(/\n/g, ' ').slice(0, 200),
    });
  }
}

console.log(`=== N5/N4 listening with standalone 行 verbs ===`);
console.log(`Total candidates: ${candidates.length}\n`);
for (const c of candidates) {
  console.log(`${c.id} (${c.difficulty}): [${c.hits.join(', ')}] standalone=${c.standaloneCount}`);
  console.log(`  ${c.text}`);
  console.log('');
}
