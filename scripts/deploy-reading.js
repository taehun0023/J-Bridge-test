/**
 * Deploy JLPT reading content and quizzes to Supabase
 * 1. Creates jlpt_reading_passages table if not exists (migration)
 * 2. Inserts reading content (25 passages)
 * 3. Inserts reading quizzes (5 quizzes, 50 questions)
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

// ─── Step 1: Apply migration ───

async function applyMigration() {
  console.log('1. Checking/creating jlpt_reading_passages table...');

  const checkResp = await fetch(
    `${SUPABASE_URL}/rest/v1/jlpt_reading_passages?select=id&limit=0`,
    { headers }
  );

  if (checkResp.ok) {
    console.log('   Table already exists');
    return true;
  }

  const migrationSql = fs.readFileSync(
    path.join(__dirname, '..', 'supabase', 'migrations', '00032_jlpt_reading_passages.sql'),
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
    console.error('   File: supabase/migrations/00032_jlpt_reading_passages.sql');
    return false;
  }

  console.log('   Table created successfully');
  return true;
}

// ─── Step 2: Parse and insert reading content ───

function parseReadingContent() {
  const content = fs.readFileSync(
    path.join(__dirname, '..', 'supabase', 'seed_parts', 'jlpt_reading_content.sql'),
    'utf8'
  );

  const items = [];
  const insertRegex = /INSERT INTO jlpt_reading_passages \([^)]+\)\s*VALUES \(\s*([\s\S]*?)\);/g;
  let match;

  while ((match = insertRegex.exec(content)) !== null) {
    const valuesStr = match[1];
    items.push(parseReadingValues(valuesStr));
  }

  return items;
}

function parseReadingValues(valuesStr) {
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
        i++;
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

  const title = unquote(tokens[0]);
  const passage = unquote(tokens[1]);
  const passage_type = unquote(tokens[2]);
  const jlpt_level = unquote(tokens[3]);
  const word_count = parseInt(tokens[4]) || 0;
  const topic = parseNull(tokens[5]);

  let vocabulary_notes = [];
  try {
    const jsonStr = unquote(tokens[6]);
    vocabulary_notes = JSON.parse(jsonStr);
  } catch (e) {
    console.warn(`  Warning: Failed to parse vocabulary_notes for ${title}`);
  }

  const grammar_notes = parseArray(tokens[7]);
  const translation_ko = parseNull(tokens[8]);
  const sort_order = parseInt(tokens[9]);

  return {
    title,
    passage,
    passage_type,
    jlpt_level,
    word_count,
    topic,
    vocabulary_notes,
    grammar_notes,
    translation_ko,
    sort_order,
  };
}

async function insertReadingContent(items) {
  console.log(`\n2. Inserting reading content (${items.length} passages)...`);

  await fetch(`${SUPABASE_URL}/rest/v1/jlpt_reading_passages?id=not.is.null`, {
    method: 'DELETE',
    headers,
  });
  console.log('   Cleared existing reading data');

  const batchSize = 5;
  for (let i = 0; i < items.length; i += batchSize) {
    const batch = items.slice(i, i + batchSize);
    const resp = await fetch(`${SUPABASE_URL}/rest/v1/jlpt_reading_passages`, {
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

  console.log(`   Done: ${items.length} reading passages inserted`);
  return true;
}

// ─── Step 3: Insert reading quizzes ───

const QUIZ_IDS = [
  'c0000001-0000-0000-0000-000000000001',
  'c0000002-0000-0000-0000-000000000002',
  'c0000003-0000-0000-0000-000000000003',
  'c0000004-0000-0000-0000-000000000004',
  'c0000005-0000-0000-0000-000000000005',
];

async function deleteExistingQuizData() {
  console.log('\n3. Deleting existing reading quiz data...');
  const filter = `in.(${QUIZ_IDS.join(',')})`;

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
  console.log('   Cleared existing reading quiz data');
}

async function insertReadingQuizzes() {
  console.log('\n4. Inserting reading quiz definitions...');
  const quizzes = [
    { id: QUIZ_IDS[0], title: 'N5 読解クイズ', quiz_type: 'jlpt_reading', passing_score: 70, time_limit_minutes: 15, is_assessment: false },
    { id: QUIZ_IDS[1], title: 'N4 読解クイズ', quiz_type: 'jlpt_reading', passing_score: 70, time_limit_minutes: 20, is_assessment: false },
    { id: QUIZ_IDS[2], title: 'N3 読解クイズ', quiz_type: 'jlpt_reading', passing_score: 70, time_limit_minutes: 25, is_assessment: false },
    { id: QUIZ_IDS[3], title: 'N2 読解クイズ', quiz_type: 'jlpt_reading', passing_score: 70, time_limit_minutes: 30, is_assessment: false },
    { id: QUIZ_IDS[4], title: 'N1 読解クイズ', quiz_type: 'jlpt_reading', passing_score: 70, time_limit_minutes: 35, is_assessment: false },
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
  console.log('   OK - 5 reading quizzes inserted');
  return true;
}

function parseQuizQuestions() {
  const content = fs.readFileSync(
    path.join(__dirname, '..', 'supabase', 'seed_parts', 'jlpt_reading_quizzes.sql'),
    'utf8'
  );

  const questions = [];
  let currentQuestion = null;

  const lines = content.split('\n');
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

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
  console.log('=== J-Bridge Reading Content Deployment ===\n');

  const tableOk = await applyMigration();
  if (!tableOk) {
    console.log('\n   Continuing anyway (table may already exist)...');
  }

  const readingItems = parseReadingContent();
  console.log(`   Parsed ${readingItems.length} reading passages from seed file`);
  const contentOk = await insertReadingContent(readingItems);
  if (!contentOk) {
    console.error('\nFailed to insert reading content.');
    process.exit(1);
  }

  await deleteExistingQuizData();

  const quizzesOk = await insertReadingQuizzes();
  if (!quizzesOk) {
    console.error('\nFailed to insert reading quizzes.');
    process.exit(1);
  }

  const questions = parseQuizQuestions();
  console.log(`   Parsed ${questions.length} questions from seed file`);
  const questionsOk = await insertQuizQuestions(questions);
  if (!questionsOk) {
    console.error('\nFailed to insert quiz questions.');
    process.exit(1);
  }

  // Verification
  console.log('\n=== Verification ===');

  const readingResp = await fetch(
    `${SUPABASE_URL}/rest/v1/jlpt_reading_passages?select=jlpt_level`,
    { headers: { ...headers, 'Range': '0-999' } }
  );
  if (readingResp.ok) {
    const passages = await readingResp.json();
    const byLevel = {};
    passages.forEach(p => { byLevel[p.jlpt_level] = (byLevel[p.jlpt_level] || 0) + 1; });
    console.log(`  Reading passages: ${passages.length} total`);
    Object.entries(byLevel).sort().forEach(([level, count]) => {
      console.log(`    ${level}: ${count}`);
    });
  }

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
