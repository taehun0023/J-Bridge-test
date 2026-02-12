/**
 * Deploy JLPT grammar content and quizzes to Supabase
 * 1. Creates jlpt_grammar table if not exists (migration)
 * 2. Inserts grammar content (130 items)
 * 3. Inserts grammar quizzes (5 quizzes, 100 questions)
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

// ─── Step 1: Apply migration (create table if not exists) ───

async function applyMigration() {
  console.log('1. Checking/creating jlpt_grammar table...');

  // Try to query the table first
  const checkResp = await fetch(
    `${SUPABASE_URL}/rest/v1/jlpt_grammar?select=id&limit=0`,
    { headers }
  );

  if (checkResp.ok) {
    console.log('   Table already exists');
    return true;
  }

  // Table doesn't exist - create it via SQL
  const migrationSql = fs.readFileSync(
    path.join(__dirname, '..', 'supabase', 'migrations', '00031_jlpt_grammar_table.sql'),
    'utf8'
  );

  const resp = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ query: migrationSql }),
  });

  if (!resp.ok) {
    const body = await resp.text();
    console.error(`   FAIL creating table: ${body.substring(0, 300)}`);
    console.error('   Please run the migration manually via Supabase Dashboard SQL Editor');
    console.error('   File: supabase/migrations/00031_jlpt_grammar_table.sql');
    return false;
  }

  console.log('   Table created successfully');
  return true;
}

// ─── Step 2: Parse and insert grammar content ───

function parseGrammarContent() {
  const content = fs.readFileSync(
    path.join(__dirname, '..', 'supabase', 'seed_parts', 'jlpt_grammar_content.sql'),
    'utf8'
  );

  const items = [];
  // Match each INSERT INTO jlpt_grammar block
  const insertRegex = /INSERT INTO jlpt_grammar \([^)]+\)\s*VALUES \(\s*([\s\S]*?)\);/g;
  let match;

  while ((match = insertRegex.exec(content)) !== null) {
    const valuesStr = match[1];
    items.push(parseGrammarValues(valuesStr));
  }

  return items;
}

function parseGrammarValues(valuesStr) {
  // Parse the VALUES clause into individual fields
  const tokens = [];
  let current = '';
  let inString = false;
  let inArray = false;
  let depth = 0;

  for (let i = 0; i < valuesStr.length; i++) {
    const ch = valuesStr[i];

    if (ch === "'" && !inArray) {
      if (inString && valuesStr[i + 1] === "'") {
        current += "'";
        i++; // skip escaped quote
        continue;
      }
      inString = !inString;
      current += ch;
      continue;
    }

    if (!inString) {
      if (ch === '[') { depth++; inArray = true; }
      if (ch === ']') { depth--; if (depth === 0) inArray = false; }
      if (ch === 'A' && valuesStr.substring(i, i + 5) === 'ARRAY') {
        // ARRAY[...] block
        current += ch;
        continue;
      }
    }

    if (ch === ',' && !inString && !inArray && depth === 0) {
      tokens.push(current.trim());
      current = '';
      continue;
    }

    current += ch;
  }
  tokens.push(current.trim());

  // Parse tokens into object
  const unquote = (s) => {
    s = s.trim();
    if (s.startsWith("'") && (s.endsWith("'") || s.endsWith("'::jsonb"))) {
      s = s.replace(/::jsonb$/, '');
      s = s.slice(1, -1);
      s = s.replace(/''/g, "'");
    }
    return s;
  };

  const parseArray = (s) => {
    s = s.trim();
    if (s === 'NULL') return null;
    // ARRAY['a', 'b'] -> ['a', 'b']
    const match = s.match(/ARRAY\[(.*)\]/s);
    if (!match) return null;
    const items = [];
    let inner = match[1];
    let cur = '';
    let inStr = false;
    for (let i = 0; i < inner.length; i++) {
      if (inner[i] === "'" && !inStr) { inStr = true; continue; }
      if (inner[i] === "'" && inStr) {
        if (inner[i + 1] === "'") { cur += "'"; i++; continue; }
        inStr = false;
        items.push(cur);
        cur = '';
        continue;
      }
      if (inStr) cur += inner[i];
    }
    return items;
  };

  const parseNull = (s) => {
    s = s.trim();
    return s === 'NULL' ? null : unquote(s);
  };

  const pattern = unquote(tokens[0]);
  const meaning_ko = unquote(tokens[1]);
  const meaning_ja = unquote(tokens[2]);
  const jlpt_level = unquote(tokens[3]);
  const formation = unquote(tokens[4]);
  const formation_detail = parseNull(tokens[5]);
  const category = parseNull(tokens[6]);

  // Parse JSONB
  let example_sentences = [];
  try {
    const jsonStr = unquote(tokens[7]);
    example_sentences = JSON.parse(jsonStr);
  } catch (e) {
    console.warn(`  Warning: Failed to parse example_sentences for ${pattern}`);
  }

  const related_patterns = parseArray(tokens[8]);
  const common_mistakes = parseNull(tokens[9]);
  const usage_notes = parseNull(tokens[10]);
  const sort_order = parseInt(tokens[11]);

  return {
    pattern,
    meaning_ko,
    meaning_ja,
    jlpt_level,
    formation,
    formation_detail,
    category,
    example_sentences,
    related_patterns,
    common_mistakes,
    usage_notes,
    sort_order,
  };
}

async function insertGrammarContent(items) {
  console.log(`\n2. Inserting grammar content (${items.length} items)...`);

  // Delete existing
  await fetch(`${SUPABASE_URL}/rest/v1/jlpt_grammar?id=not.is.null`, {
    method: 'DELETE',
    headers,
  });
  console.log('   Cleared existing grammar data');

  // Insert in batches of 10
  const batchSize = 10;
  for (let i = 0; i < items.length; i += batchSize) {
    const batch = items.slice(i, i + batchSize);
    const resp = await fetch(`${SUPABASE_URL}/rest/v1/jlpt_grammar`, {
      method: 'POST',
      headers: { ...headers, 'Prefer': 'return=minimal' },
      body: JSON.stringify(batch),
    });

    if (!resp.ok) {
      const body = await resp.text();
      console.error(`   FAIL batch ${i}-${i + batch.length}: ${body.substring(0, 300)}`);
      return false;
    }
    process.stdout.write(`   Batch ${Math.floor(i / batchSize) + 1}/${Math.ceil(items.length / batchSize)} OK\r`);
  }

  console.log(`   Done: ${items.length} grammar items inserted`);
  return true;
}

// ─── Step 3: Insert grammar quizzes ───

const QUIZ_IDS = [
  'b0000001-0000-0000-0000-000000000001',
  'b0000002-0000-0000-0000-000000000002',
  'b0000003-0000-0000-0000-000000000003',
  'b0000004-0000-0000-0000-000000000004',
  'b0000005-0000-0000-0000-000000000005',
];

async function deleteExistingQuizData() {
  console.log('\n3. Deleting existing grammar quiz data...');
  const filter = `in.(${QUIZ_IDS.join(',')})`;

  // Delete quiz_answers
  const attemptsResp = await fetch(
    `${SUPABASE_URL}/rest/v1/quiz_attempts?quiz_id=${filter}&select=id`,
    { headers }
  );
  if (attemptsResp.ok) {
    const attempts = await attemptsResp.json();
    if (attempts.length > 0) {
      const attemptIds = attempts.map(a => a.id);
      for (let i = 0; i < attemptIds.length; i += 50) {
        const batch = attemptIds.slice(i, i + 50);
        await fetch(
          `${SUPABASE_URL}/rest/v1/quiz_answers?attempt_id=in.(${batch.join(',')})`,
          { method: 'DELETE', headers }
        );
      }
      await fetch(
        `${SUPABASE_URL}/rest/v1/quiz_attempts?quiz_id=${filter}`,
        { method: 'DELETE', headers }
      );
    }
  }

  // Delete options -> questions -> quizzes
  const questionsResp = await fetch(
    `${SUPABASE_URL}/rest/v1/quiz_questions?quiz_id=${filter}&select=id`,
    { headers: { ...headers, 'Range': '0-999' } }
  );
  if (questionsResp.ok) {
    const questions = await questionsResp.json();
    if (questions.length > 0) {
      const questionIds = questions.map(q => q.id);
      for (let i = 0; i < questionIds.length; i += 50) {
        const batch = questionIds.slice(i, i + 50);
        await fetch(
          `${SUPABASE_URL}/rest/v1/quiz_question_options?question_id=in.(${batch.join(',')})`,
          { method: 'DELETE', headers }
        );
      }
      await fetch(
        `${SUPABASE_URL}/rest/v1/quiz_questions?quiz_id=${filter}`,
        { method: 'DELETE', headers }
      );
    }
  }

  await fetch(
    `${SUPABASE_URL}/rest/v1/quizzes?id=${filter}`,
    { method: 'DELETE', headers }
  );
  console.log('   Cleared existing grammar quiz data');
}

async function insertGrammarQuizzes() {
  console.log('\n4. Inserting grammar quiz definitions...');
  const quizzes = [
    { id: QUIZ_IDS[0], title: 'N5 文法クイズ', quiz_type: 'jlpt_grammar', passing_score: 70, time_limit_minutes: 10, is_assessment: false },
    { id: QUIZ_IDS[1], title: 'N4 文法クイズ', quiz_type: 'jlpt_grammar', passing_score: 70, time_limit_minutes: 12, is_assessment: false },
    { id: QUIZ_IDS[2], title: 'N3 文法クイズ', quiz_type: 'jlpt_grammar', passing_score: 70, time_limit_minutes: 15, is_assessment: false },
    { id: QUIZ_IDS[3], title: 'N2 文法クイズ', quiz_type: 'jlpt_grammar', passing_score: 70, time_limit_minutes: 15, is_assessment: false },
    { id: QUIZ_IDS[4], title: 'N1 文法クイズ', quiz_type: 'jlpt_grammar', passing_score: 70, time_limit_minutes: 20, is_assessment: false },
  ];

  const resp = await fetch(`${SUPABASE_URL}/rest/v1/quizzes`, {
    method: 'POST',
    headers: { ...headers, 'Prefer': 'return=minimal' },
    body: JSON.stringify(quizzes),
  });

  if (!resp.ok) {
    const body = await resp.text();
    console.error(`   FAIL: ${body.substring(0, 300)}`);
    return false;
  }
  console.log('   OK - 5 grammar quizzes inserted');
  return true;
}

function parseQuizQuestions() {
  const content = fs.readFileSync(
    path.join(__dirname, '..', 'supabase', 'seed_parts', 'jlpt_grammar_quizzes.sql'),
    'utf8'
  );

  const questions = [];
  let currentQuestion = null;

  const lines = content.split('\n');
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Match question INSERT
    const qMatch = line.match(/VALUES \(q_id, '([^']+)', 'multiple_choice', (E?'.*'), (E?'.*'), (\d+), (\d+), '(\w+)', (\w+|NULL|'[^']*')\)/);
    if (qMatch) {
      let questionText = qMatch[2].replace(/^E?'/, '').replace(/'$/, '').replace(/\\n/g, '\n').replace(/''/g, "'");
      let explanation = qMatch[3].replace(/^E?'/, '').replace(/'$/, '').replace(/\\n/g, '\n').replace(/''/g, "'");

      const categoryRaw = qMatch[7];
      const category = categoryRaw === 'NULL' ? null : categoryRaw.replace(/'/g, '');

      currentQuestion = {
        quiz_id: qMatch[1],
        question_type: 'multiple_choice',
        question_text: questionText,
        explanation: explanation,
        points: parseInt(qMatch[4]),
        sort_order: parseInt(qMatch[5]),
        difficulty: qMatch[6],
        question_category: category,
        options: [],
      };
      questions.push(currentQuestion);
      continue;
    }

    // Match option INSERT
    const optMatch = line.match(/gen_random_uuid\(\), q_id, '((?:[^']|'')*)', (TRUE|FALSE), (\d+)\)/);
    if (optMatch && currentQuestion) {
      currentQuestion.options.push({
        option_text: optMatch[1].replace(/''/g, "'"),
        is_correct: optMatch[2] === 'TRUE',
        sort_order: parseInt(optMatch[3]),
      });
    }
  }

  return questions;
}

async function insertQuizQuestions(questions) {
  console.log(`\n5. Inserting quiz questions (${questions.length} questions)...`);

  const batchSize = 10;
  let totalOptions = 0;

  for (let i = 0; i < questions.length; i += batchSize) {
    const batch = questions.slice(i, i + batchSize);

    const questionRows = batch.map(q => ({
      quiz_id: q.quiz_id,
      question_type: q.question_type,
      question_text: q.question_text,
      explanation: q.explanation,
      points: q.points,
      sort_order: q.sort_order,
      difficulty: q.difficulty,
      question_category: q.question_category,
    }));

    const qResp = await fetch(`${SUPABASE_URL}/rest/v1/quiz_questions`, {
      method: 'POST',
      headers: { ...headers, 'Prefer': 'return=representation' },
      body: JSON.stringify(questionRows),
    });

    if (!qResp.ok) {
      const body = await qResp.text();
      console.error(`   FAIL questions batch ${i}: ${body.substring(0, 300)}`);
      return false;
    }

    const insertedQuestions = await qResp.json();

    const allOptions = [];
    for (let j = 0; j < insertedQuestions.length; j++) {
      const qId = insertedQuestions[j].id;
      const opts = batch[j].options.map(o => ({
        question_id: qId,
        option_text: o.option_text,
        is_correct: o.is_correct,
        sort_order: o.sort_order,
      }));
      allOptions.push(...opts);
    }

    const oResp = await fetch(`${SUPABASE_URL}/rest/v1/quiz_question_options`, {
      method: 'POST',
      headers: { ...headers, 'Prefer': 'return=minimal' },
      body: JSON.stringify(allOptions),
    });

    if (!oResp.ok) {
      const body = await oResp.text();
      console.error(`   FAIL options batch ${i}: ${body.substring(0, 300)}`);
      return false;
    }

    totalOptions += allOptions.length;
    process.stdout.write(`   Batch ${Math.floor(i / batchSize) + 1}/${Math.ceil(questions.length / batchSize)} OK (${i + batch.length}/${questions.length} questions, ${totalOptions} options)\r`);
  }

  console.log(`\n   Done: ${questions.length} questions, ${totalOptions} options`);
  return true;
}

// ─── Main ───

async function main() {
  console.log('=== J-Bridge Grammar Content Deployment ===\n');

  // Step 1: Ensure table exists
  const tableOk = await applyMigration();
  if (!tableOk) {
    console.log('\n   Continuing anyway (table may already exist)...');
  }

  // Step 2: Insert grammar content
  const grammarItems = parseGrammarContent();
  console.log(`   Parsed ${grammarItems.length} grammar items from seed file`);
  const contentOk = await insertGrammarContent(grammarItems);
  if (!contentOk) {
    console.error('\nFailed to insert grammar content.');
    process.exit(1);
  }

  // Step 3: Delete existing quiz data
  await deleteExistingQuizData();

  // Step 4: Insert quiz definitions
  const quizzesOk = await insertGrammarQuizzes();
  if (!quizzesOk) {
    console.error('\nFailed to insert grammar quizzes.');
    process.exit(1);
  }

  // Step 5: Insert quiz questions
  const questions = parseQuizQuestions();
  console.log(`   Parsed ${questions.length} questions from seed file`);
  const questionsOk = await insertQuizQuestions(questions);
  if (!questionsOk) {
    console.error('\nFailed to insert quiz questions.');
    process.exit(1);
  }

  // Verification
  console.log('\n=== Verification ===');

  // Check grammar content count
  const grammarResp = await fetch(
    `${SUPABASE_URL}/rest/v1/jlpt_grammar?select=jlpt_level`,
    { headers: { ...headers, 'Range': '0-999' } }
  );
  if (grammarResp.ok) {
    const grammar = await grammarResp.json();
    const byLevel = {};
    grammar.forEach(g => { byLevel[g.jlpt_level] = (byLevel[g.jlpt_level] || 0) + 1; });
    console.log(`  Grammar items: ${grammar.length} total`);
    Object.entries(byLevel).sort().forEach(([level, count]) => {
      console.log(`    ${level}: ${count}`);
    });
  }

  // Check quiz question counts
  for (const qid of QUIZ_IDS) {
    const resp = await fetch(
      `${SUPABASE_URL}/rest/v1/quiz_questions?quiz_id=eq.${qid}&select=id`,
      { headers: { ...headers, 'Prefer': 'count=exact' }, method: 'HEAD' }
    );
    const range = resp.headers.get('content-range');
    const count = range?.split('/')[1] || '?';
    const quizResp = await fetch(
      `${SUPABASE_URL}/rest/v1/quizzes?id=eq.${qid}&select=title`,
      { headers }
    );
    const quiz = await quizResp.json();
    console.log(`  ${quiz[0]?.title}: ${count} questions`);
  }

  console.log('\n=== Deployment Complete ===');
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
