#!/usr/bin/env node
/**
 * Fetch claim_reason for High priority JLPT grammar questions.
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

const HIGH_QIDS = [
  '959d3860-38a2-40b4-b8eb-ecaaba3d988f',
  '81b9352b-c869-49f2-84a6-66dcbcbd50c9',
  'ddf2bddc-6634-40c6-a9a0-d0b27f0d196e',
  '3515e6ad-73da-4749-a0a5-75cf782501bf',
  '4ea13622-4999-423c-a796-6ea5f28c27cb',
  '693a9fff-4f27-4189-9bc9-2d861743c477',
  '751cbcbe-ec25-4b5d-b87b-6c7e9a22fdf5',
  'f9cc7799-de82-4030-87fa-f091bb91b5ec',
  '569bc54e-d634-4493-899f-c72fd28f921a',
  'cae27d0d-4fa8-49e1-b8f7-5b0ca1870929',
  'efc5488a-a8c7-40f2-be1f-bb2136872ff8',
  'fc76935a-41ea-4b0d-a293-10206006424e',
  '1f5e156f-7bc3-4583-bd85-04920d4714ea',
  '2f86478f-9206-44ef-b960-189b4f2ad815',
  '313037a2-4af4-48c4-a4ab-13c36843dea1',
  '2ebfa80f-0dbe-4c38-85a7-92a95986ab09',
  '1be35558-bc6b-4e5b-8d57-276e7ad07b48',
];

const { data, error } = await supabase
  .from('question_claims')
  .select('*')
  .in('question_id', HIGH_QIDS)
  .order('created_at', { ascending: true });

if (error) { console.error(error); process.exit(1); }

const byQ = {};
for (const r of data) {
  if (!byQ[r.question_id]) byQ[r.question_id] = [];
  byQ[r.question_id].push(r);
}

console.log(JSON.stringify(byQ, null, 2));
console.log('\n---Summary---');
console.log(`Questions with claims: ${Object.keys(byQ).length}/${HIGH_QIDS.length}`);
for (const qid of HIGH_QIDS) {
  const claims = byQ[qid];
  if (!claims) {
    console.log(`  ${qid}: NO CLAIM`);
  }
}
