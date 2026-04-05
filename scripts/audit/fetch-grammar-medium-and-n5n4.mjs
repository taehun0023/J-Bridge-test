#!/usr/bin/env node
/**
 * Fetch Medium confirmed 26 quiz questions + N5/N4 hiragana-only grammar questions
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

// Medium confirmed 24 + 2 additional (from uncertain)
const MEDIUM_IDS = [
  '2a867fde-e6af-4cd8-9e93-54ff5c2456a2',
  'd943a680-47c0-40e9-b0bd-1326f2cd79bf',
  '6efa2def-7bd4-49e9-b902-eea734133260',
  'd1a48ae1-fa6d-44ab-ab14-22b2f9ebf262',
  '6dc7b6c8-0e8d-4168-9f7d-76b344bdc553',
  '2292f361-915f-480e-a3dd-93632ff14782',
  '55bc8887-817f-400b-bfd8-b49c0f8379ba',
  '8b03de6c-ef45-49bf-a1b8-349a2e7083a2',
  '9271aa7b-b58f-4b56-935b-cb28b79c69a8',
  '165689c9-0bcb-4207-9e90-79353f7d28ae',
  '11939f02-23a7-458c-b6e1-8983f732b9c2',
  '47e3bda9-fc0c-4c5d-bfd0-d2dc4c2843ad',
  '3e2b874e-ae63-43dd-a867-82da6c05c525',
  '5875bc4e-7f34-445b-894b-3990e85b91ef',
  '8357953a-9754-4dc8-be17-cff9acf35c5c',
  'bf38471d-4b5e-4d52-8e75-fcbc5dce23ac',
  'fd8a43a1-87cf-4f36-81b8-55e9c1ed7d0c',
  'dc062b9e-68a6-4e5f-bd38-0a4bd726caef',
  '7fd50731-b748-4ff0-8667-74b7f571e9c1',
  '71dd5af6-5791-4f2f-85be-0a67d9f109ca',
  'd9efc57e-6e73-48f5-8653-8762489f0622',
  '2853200e-e82e-454c-baba-28435529342f',
  'd3aa5081-fea3-433c-bee8-73d51d55fd3a',
  '053f1bb3-6133-4626-914d-e186d40bf2ef',
  // Additional 2 from uncertain (upgraded to confirmed)
  '1a8470e1-dbf1-4add-a724-886327539d70',
  'f5d8e98f-9328-40de-8ac0-d1770ef4124b',
];

const { data: mediumQs, error: e1 } = await supabase
  .from('quiz_questions')
  .select('id, question_text, difficulty, question_category, explanation, quiz_question_options(id, option_text, is_correct)')
  .in('id', MEDIUM_IDS);

if (e1) { console.error(e1); process.exit(1); }

fs.writeFileSync(
  path.join(__dirname, 'medium-questions.json'),
  JSON.stringify(mediumQs, null, 2),
  'utf8'
);
console.log('Medium questions fetched:', mediumQs.length);

// Fetch all N5/N4 grammar questions
const { data: lowQs, error: e2 } = await supabase
  .from('quiz_questions')
  .select('id, question_text, difficulty, question_category, quiz_question_options(id, option_text, is_correct)')
  .eq('question_category', 'grammar')
  .in('difficulty', ['N5', 'N4']);

if (e2) { console.error(e2); process.exit(1); }

console.log('N5/N4 grammar questions total:', lowQs.length);

// Filter hiragana-only (no kanji in question_text or any option)
const HAS_KANJI = /[\u4E00-\u9FFF]/;
const hiraganaOnly = lowQs.filter(q => {
  if (HAS_KANJI.test(q.question_text)) return false;
  for (const opt of q.quiz_question_options) {
    if (HAS_KANJI.test(opt.option_text)) return false;
  }
  return true;
});

console.log('Hiragana-only N5/N4 grammar questions:', hiraganaOnly.length);

fs.writeFileSync(
  path.join(__dirname, 'n5n4-hiragana-only.json'),
  JSON.stringify(hiraganaOnly, null, 2),
  'utf8'
);

// Print summaries
console.log('\n--- Hiragana-only samples ---');
for (const q of hiraganaOnly.slice(0, 5)) {
  console.log(`[${q.difficulty}] ${q.id}: ${q.question_text}`);
  for (const o of q.quiz_question_options) {
    console.log(`  ${o.is_correct ? '*' : ' '} ${o.option_text}`);
  }
}
