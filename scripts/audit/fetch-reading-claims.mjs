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

const QIDS = [
  '0a49374b-9079-4f5b-a84c-17ee6b952ec4',
  'd52572dc-eff7-4be3-ad30-5f356c064d87',
  'b5614289-a3a8-45c0-8259-7f1cbf3916e8',
  '3e99aa2c-ba25-404a-b961-34558452e1f5',
  '4c5311f4-0a70-421f-a575-eae658784e9d',
  'ffeb9909-ed89-429e-9b3d-cc8d5c5d40d0',
  '15572e16-9daa-4a81-a145-b1997f945ca2',
];

const { data, error } = await sb
  .from('question_claims')
  .select('*')
  .in('question_id', QIDS)
  .order('created_at', { ascending: true });
if (error) { console.error(error); process.exit(1); }

for (const c of data) {
  console.log(`\n=== Q-${c.question_id.slice(0,8)} claim_id=${c.id.slice(0,8)} status=${c.status} ===`);
  console.log(`reason: ${c.reason || c.claim_reason || JSON.stringify(c)}`);
  if (c.admin_response) console.log(`admin: ${c.admin_response}`);
}
console.log(`\nTotal claims: ${data.length}`);
