#!/usr/bin/env node
// Parse jlpt_reading_issues.md and fetch random samples per category
import fs from 'node:fs';
import path from 'node:path';
import { createClient } from '@supabase/supabase-js';

const ROOT = '/Users/kato/Desktop/Project/edu_cha';
const envText = fs.readFileSync(path.join(ROOT, '.env.local'), 'utf8');
const getEnv = (k) => envText.match(new RegExp(`^${k}=(.+)$`, 'm'))?.[1]?.trim();
const sb = createClient(getEnv('NEXT_PUBLIC_SUPABASE_URL'), getEnv('SUPABASE_SERVICE_ROLE_KEY'), {
  auth: { persistSession: false },
});

const text = fs.readFileSync(path.join(ROOT, 'docs/audit/jlpt_reading_issues.md'), 'utf8');
const blocks = text.split(/^---$/m).map(b => b.trim()).filter(Boolean);

const items = [];
for (const b of blocks) {
  const idMatch = b.match(/### Q-([0-9a-f-]+)/);
  if (!idMatch) continue;
  const quizIdM = b.match(/quiz_id: ([0-9a-f-]+)/);
  const diffM = b.match(/difficulty: (\S+)/);
  const violM = b.match(/위반 항목: \[([^\]]+)\]/);
  const claimM = b.match(/클레임: 있음/);
  const hasB8 = /\*\*B8\*\*/.test(b);
  const hasB5 = /\*\*B5\*\*/.test(b);
  const b5count = (b.match(/\*\*B5\*\*/g) || []).length;
  items.push({
    id: idMatch[1],
    quiz_id: quizIdM?.[1],
    difficulty: diffM?.[1],
    viol: violM?.[1],
    hasClaim: !!claimM,
    hasB8, hasB5, b5count,
    block: b,
  });
}

console.log(`Total parsed: ${items.length}`);
console.log(`B8 items: ${items.filter(i => i.hasB8).length}`);
console.log(`a0000002 items: ${items.filter(i => i.quiz_id?.startsWith('a0000002')).length}`);
console.log(`B8 AND a0000002: ${items.filter(i => i.hasB8 && i.quiz_id?.startsWith('a0000002')).length}`);
console.log(`B8 NOT a0000002: ${items.filter(i => i.hasB8 && !i.quiz_id?.startsWith('a0000002')).length}`);

// Difficulty breakdown of B8 items
const b8Diff = {};
for (const i of items.filter(x => x.hasB8)) {
  b8Diff[i.difficulty] = (b8Diff[i.difficulty] || 0) + 1;
}
console.log('B8 difficulty dist:', b8Diff);

// B8 NOT in a0000002
console.log('\n--- B8 NOT in a0000002 ---');
items.filter(i => i.hasB8 && !i.quiz_id?.startsWith('a0000002')).forEach(i => {
  console.log(`  ${i.id.slice(0,8)} quiz=${i.quiz_id.slice(0,8)} diff=${i.difficulty}`);
});

// Random seed-deterministic
function seeded(seed) {
  let s = seed;
  return () => { s = (s * 1103515245 + 12345) & 0x7fffffff; return s / 0x7fffffff; };
}

// Sample 5 B8 items across difficulties (initial/mid/advanced)
const b8Items = items.filter(i => i.hasB8);
const rng1 = seeded(42);
const pick = (arr, n) => {
  const copy = [...arr];
  const picked = [];
  for (let i = 0; i < n && copy.length; i++) {
    const idx = Math.floor(rng1() * copy.length);
    picked.push(copy.splice(idx, 1)[0]);
  }
  return picked;
};

const difGroups = {};
for (const it of b8Items) {
  difGroups[it.difficulty] = difGroups[it.difficulty] || [];
  difGroups[it.difficulty].push(it);
}
console.log('\n--- B8 SAMPLES (5 across difficulty) ---');
const b8Samples = [];
for (const d of Object.keys(difGroups)) {
  const n = d === '初級' ? 2 : d === '中級' ? 2 : 1;
  b8Samples.push(...pick(difGroups[d], n));
}
console.log(`Picked ${b8Samples.length} B8 samples`);

// Sample 20 B5-only or [B5,B5] items
const b5OnlyItems = items.filter(i => i.hasB5 && !i.hasB8 && !i.hasClaim);
console.log(`\nB5-only candidates: ${b5OnlyItems.length}`);
const rng2 = seeded(99);
const b5Samples = [];
const copy = [...b5OnlyItems];
for (let i = 0; i < 20 && copy.length; i++) {
  const idx = Math.floor(rng2() * copy.length);
  b5Samples.push(copy.splice(idx, 1)[0]);
}

// Sample 10 random reading Q from ALL questions (for manual rubric review)
// reuse B5 list since nearly all reading Qs have issues; choose diverse difficulty
const allIds = items.map(i => i.id);
const rng3 = seeded(7);
const copy2 = [...items];
const manualSamples = [];
for (let i = 0; i < 10 && copy2.length; i++) {
  const idx = Math.floor(rng3() * copy2.length);
  manualSamples.push(copy2.splice(idx, 1)[0]);
}

const outputIds = {
  b8: b8Samples.map(i => i.id),
  b5: b5Samples.map(i => i.id),
  manual: manualSamples.map(i => i.id),
};
fs.writeFileSync('/tmp/reading_sample_ids.json', JSON.stringify(outputIds, null, 2));
console.log('\nSample IDs written to /tmp/reading_sample_ids.json');

// Print each sample's block so we can judge
console.log('\n========== B8 SAMPLES ==========');
for (const i of b8Samples) {
  console.log(`\n${i.block}\n---`);
}
console.log('\n========== B5 SAMPLES (20) ==========');
for (const i of b5Samples) {
  console.log(`\n${i.block}\n---`);
}
console.log('\n========== MANUAL 10 SAMPLES ==========');
for (const i of manualSamples) {
  console.log(`\n${i.block}\n---`);
}
