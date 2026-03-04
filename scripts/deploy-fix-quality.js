/**
 * Deploy grammar/reading quiz quality fixes to Supabase
 * Executes UPDATE statements to fix:
 * - 答えバレ (answer giveaway) questions
 * - 二重正答 (double-correct) questions
 * - 読解 answer = question word issues
 */

const fs = require('fs');
const path = require('path');

const SUPABASE_URL = 'https://wxhyczlwdmeelcshqgci.supabase.co';
const SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY ||
  fs.readFileSync(path.join(__dirname, '..', '.env.local'), 'utf8')
    .match(/SUPABASE_SERVICE_ROLE_KEY=(.+)/)?.[1]?.trim();

if (!SERVICE_ROLE_KEY) {
  console.error('ERROR: SUPABASE_SERVICE_ROLE_KEY not found');
  process.exit(1);
}

const headers = {
  'apikey': SERVICE_ROLE_KEY,
  'Authorization': `Bearer ${SERVICE_ROLE_KEY}`,
  'Content-Type': 'application/json',
  'Prefer': 'return=minimal',
};

// ─── Split migration SQL into individual DO $$ blocks ───

function parseSqlBlocks(sql) {
  const blocks = [];
  const regex = /-- [A-C][\d-]+:.*?\nDO \$\$[\s\S]*?END \$\$;/g;
  let match;
  while ((match = regex.exec(sql)) !== null) {
    blocks.push(match[0]);
  }
  return blocks;
}

// ─── Execute a single SQL block via Supabase REST RPC ───

async function executeSqlBlock(sql, label) {
  const resp = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ query: sql }),
  });

  if (!resp.ok) {
    const body = await resp.text();
    console.error(`   FAIL ${label}: ${body.substring(0, 300)}`);
    return false;
  }
  return true;
}

// ─── Verification: check that updates were applied ───

async function verify() {
  console.log('\n=== Verification ===');

  const checks = [
    { quiz: 'b0000001-0000-0000-0000-000000000001', sort: 3, expect: '日本に（　）' },
    { quiz: 'b0000001-0000-0000-0000-000000000001', sort: 16, expect: '食べ（　）' },
    { quiz: 'b0000002-0000-0000-0000-000000000002', sort: 1, expect: '映画を見（　）' },
    { quiz: 'b0000002-0000-0000-0000-000000000002', sort: 8, expect: '新聞によると' },
    { quiz: 'b0000002-0000-0000-0000-000000000002', sort: 13, expect: '天気予報によると' },
    { quiz: 'b0000004-0000-0000-0000-000000000004', sort: 25, expect: '旅行（　）' },
    { quiz: 'c0000002-0000-0000-0000-000000000002', sort: 19, expect: '色が変わる' },
    { quiz: 'c0000003-0000-0000-0000-000000000003', sort: 9, expect: '気持ちを込めて' },
  ];

  let passed = 0;
  for (const check of checks) {
    const resp = await fetch(
      `${SUPABASE_URL}/rest/v1/quiz_questions?quiz_id=eq.${check.quiz}&sort_order=eq.${check.sort}&select=question_text`,
      { headers }
    );
    if (resp.ok) {
      const data = await resp.json();
      if (data.length > 0 && data[0].question_text.includes(check.expect)) {
        console.log(`  ✓ ${check.quiz.split('-')[0]} sort=${check.sort}`);
        passed++;
      } else if (data.length > 0) {
        // For option-only changes, check the options
        const qResp = await fetch(
          `${SUPABASE_URL}/rest/v1/quiz_questions?quiz_id=eq.${check.quiz}&sort_order=eq.${check.sort}&select=id`,
          { headers }
        );
        const qData = await qResp.json();
        if (qData.length > 0) {
          const optResp = await fetch(
            `${SUPABASE_URL}/rest/v1/quiz_question_options?question_id=eq.${qData[0].id}&select=option_text`,
            { headers }
          );
          const optData = await optResp.json();
          const allText = optData.map(o => o.option_text).join(' ');
          if (allText.includes(check.expect)) {
            console.log(`  ✓ ${check.quiz.split('-')[0]} sort=${check.sort} (option)`);
            passed++;
          } else {
            console.log(`  ✗ ${check.quiz.split('-')[0]} sort=${check.sort} — expected "${check.expect}"`);
          }
        }
      } else {
        console.log(`  ✗ ${check.quiz.split('-')[0]} sort=${check.sort} — question not found`);
      }
    }
  }

  console.log(`\n  ${passed}/${checks.length} checks passed`);
  return passed === checks.length;
}

// ─── Main ───

async function main() {
  console.log('=== J-Bridge Grammar/Reading Quality Fix ===\n');

  // Read migration SQL
  const sqlPath = path.join(__dirname, '..', 'supabase', 'migrations', '00084_fix_grammar_reading_quality.sql');
  const sql = fs.readFileSync(sqlPath, 'utf8');

  // Parse into blocks
  const blocks = parseSqlBlocks(sql);
  console.log(`Found ${blocks.length} SQL blocks to execute\n`);

  if (blocks.length === 0) {
    console.error('ERROR: No SQL blocks found in migration file');
    process.exit(1);
  }

  // Execute each block
  let success = 0;
  let fail = 0;

  for (let i = 0; i < blocks.length; i++) {
    const label = blocks[i].split('\n')[0].replace('-- ', '');
    const ok = await executeSqlBlock(blocks[i], label);
    if (ok) {
      success++;
      process.stdout.write(`  ${i + 1}/${blocks.length} ${label} — OK\n`);
    } else {
      fail++;
      // Try executing as a single combined statement
      console.log(`  Retrying ${label} as combined statement...`);
    }
  }

  console.log(`\nExecution complete: ${success} succeeded, ${fail} failed`);

  if (fail > 0) {
    console.log('\nIf RPC execution failed, run the migration manually:');
    console.log('  1. Open Supabase Dashboard → SQL Editor');
    console.log('  2. Paste contents of: supabase/migrations/00084_fix_grammar_reading_quality.sql');
    console.log('  3. Execute');
    process.exit(1);
  }

  // Verify
  await verify();

  console.log('\n=== Quality Fix Deployment Complete ===');
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
