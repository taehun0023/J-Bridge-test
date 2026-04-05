#!/usr/bin/env node
// Simulate P5 REPLACE operations against live DB content
import fs from 'node:fs';
import { createClient } from '@supabase/supabase-js';

const envText = fs.readFileSync(new URL('../../.env.local', import.meta.url), 'utf8');
const getEnv = (key) => envText.match(new RegExp(`^${key}=(.+)$`, 'm'))?.[1]?.trim();
const supabase = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const ops = [
  ['78f46ba3-ffe3-4553-b357-05f40ed02a1b', (t) => t.replaceAll('行きたい','いきたい').replaceAll('行った','いった').replaceAll('行く','いく')],
  ['ee5d705e-d1d1-4414-bd06-1ca04fe0b6c4', (t) => t.replaceAll('行って','いって').replaceAll('行く','いく')],
  ['468443f9-d7a1-41b2-9d51-98a8cea29361', (t) => t.replaceAll('行ける','いける').replaceAll('行く','いく')],
  ['b4cc6603-8425-432f-9aa1-1fed5f2b7eee', (t) => t.replaceAll('行って','いって')],
  ['09f6b408-54d5-439f-b823-e29fa1312632', (t) => t.replaceAll('行かない','いかない').replaceAll('行きたい','いきたい')],
  ['bfaaff28-839a-4c96-baca-50f7d6805411', (t) => t.replaceAll('行けば','いけば').replaceAll('行って','いって')],
  ['5cb9e50f-1b71-49d1-acbc-e066500f2927', (t) => t.replaceAll('行かない','いかない')],
  ['471286ec-ac13-4e54-a57f-6c75e9b582f0', (t) => t.replaceAll('行こう','いこう')],
  ['7cc378d1-62fc-46dc-82bf-26e5eda66f33', (t) => t.replaceAll('行って','いって').replaceAll('まっすぐ行く','まっすぐいく').replaceAll('駅に行く','駅にいく')],
];

const { data } = await supabase
  .from('quiz_questions')
  .select('id, question_text')
  .in('id', ops.map(([id]) => id));

const byId = new Map(data.map((q) => [q.id, q.question_text]));

for (const [id, fn] of ops) {
  const before = byId.get(id);
  if (!before) { console.log(`MISSING: ${id}`); continue; }
  const after = fn(before);
  const changed = before !== after;
  // Count remaining 行 kanji
  const remaining = (after.match(/行/g) || []).length;
  const remainingCompounds = (after.match(/通行|銀行|旅行|飛行|歩行|施行|直行|急行|夜行|進行|一行|施行|流行/g) || []).length;
  const orphanKanji = remaining - remainingCompounds;
  console.log(`${id.slice(0,8)}: changed=${changed} remaining 行=${remaining} (compound=${remainingCompounds}, orphan=${orphanKanji})`);
  if (orphanKanji > 0) {
    // Show context around orphan
    console.log(`  after: ${after.replace(/\n/g,' ').slice(0,200)}`);
  }
}
