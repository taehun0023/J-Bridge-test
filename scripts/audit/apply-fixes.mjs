#!/usr/bin/env node
/**
 * Apply 00153 migration via Supabase REST API (bypasses SQL Editor size limit).
 * Parses the SQL file and executes UPDATEs via PostgREST PATCH calls.
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.resolve(__dirname, '..', '..');

const envText = fs.readFileSync(path.join(ROOT, '.env.local'), 'utf8');
const getEnv = (k) => envText.match(new RegExp(`^${k}=(.+)$`, 'm'))?.[1]?.trim();
const SB_URL = getEnv('NEXT_PUBLIC_SUPABASE_URL');
const SB_KEY = getEnv('SUPABASE_SERVICE_ROLE_KEY');

const sql = fs.readFileSync(path.join(ROOT, 'supabase/migrations/00153_fix_bj_quality_audit.sql'), 'utf8');

// Parse UPDATE statements
const updates = [];
for (const line of sql.split('\n')) {
  const trimmed = line.trim();
  if (!trimmed.startsWith('UPDATE quiz_question_options')) continue;

  // Type 1: WHERE id = 'uuid'
  const byId = trimmed.match(/SET option_text = '(.+?)' WHERE id = '([0-9a-f-]+)'/);
  if (byId) {
    updates.push({ type: 'id', text: byId[1].replace(/''/g, "'"), id: byId[2] });
    continue;
  }

  // Type 2: WHERE option_text = 'old_text' (bulk)
  const byText = trimmed.match(/SET option_text = '(.+?)' WHERE option_text = '(.+?)'/);
  if (byText) {
    updates.push({ type: 'text', newText: byText[1].replace(/''/g, "'"), oldText: byText[2].replace(/''/g, "'") });
    continue;
  }
}

console.log(`Parsed ${updates.length} UPDATE statements`);

let success = 0;
let fail = 0;

for (let i = 0; i < updates.length; i++) {
  const u = updates[i];
  let url, body;

  if (u.type === 'id') {
    url = `${SB_URL}/rest/v1/quiz_question_options?id=eq.${u.id}`;
    body = { option_text: u.text };
  } else {
    url = `${SB_URL}/rest/v1/quiz_question_options?option_text=eq.${encodeURIComponent(u.oldText)}`;
    body = { option_text: u.newText };
  }

  const resp = await fetch(url, {
    method: 'PATCH',
    headers: {
      'apikey': SB_KEY,
      'Authorization': `Bearer ${SB_KEY}`,
      'Content-Type': 'application/json',
      'Prefer': 'return=representation',
    },
    body: JSON.stringify(body),
  });

  if (!resp.ok) {
    const err = await resp.text();
    console.error(`❌ [${i + 1}] FAILED: ${err}`);
    fail++;
  } else {
    const rows = await resp.json();
    success++;
    if (u.type === 'text') {
      process.stdout.write(`\r  [${i + 1}/${updates.length}] bulk: "${u.oldText.slice(0, 20)}..." → ${rows.length} rows`);
    } else {
      process.stdout.write(`\r  [${i + 1}/${updates.length}] id: ${u.id.slice(0, 8)}...`);
    }
  }
}

console.log(`\n\n✅ Done: ${success} success, ${fail} fail`);
