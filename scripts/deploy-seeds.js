/**
 * Deploy assessment quiz seeds to Supabase via REST API (pg_net/rpc)
 * Splits the SQL into chunks and executes via Supabase Management API
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

async function executeSql(sql, label) {
  const resp = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ query: sql }),
  });

  if (!resp.ok) {
    const body = await resp.text();
    // If exec_sql doesn't exist, we need to create it first
    if (body.includes('Could not find the function')) {
      return { ok: false, needsFunction: true, body };
    }
    console.error(`  FAIL [${label}]: ${resp.status} - ${body.substring(0, 200)}`);
    return { ok: false, body };
  }
  console.log(`  OK [${label}]`);
  return { ok: true };
}

async function createExecSqlFunction() {
  console.log('Creating exec_sql helper function...');
  // Use the Supabase SQL endpoint via pg-meta
  const projectRef = SUPABASE_URL.match(/https:\/\/(.+)\.supabase\.co/)[1];

  // Try using the query endpoint
  const resp = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ query: 'SELECT 1' }),
  });

  if (resp.ok) return true;

  console.log('exec_sql function not available. Using alternative approach...');
  return false;
}

// Alternative: Use Supabase's REST API to do DELETE + INSERT directly
async function deleteExistingData() {
  const quizIds = [
    'a0000001-0000-0000-0000-000000000001',
    'a0000002-0000-0000-0000-000000000002',
    'a0000003-0000-0000-0000-000000000003',
    'a0000004-0000-0000-0000-000000000004',
    'a0000005-0000-0000-0000-000000000005',
  ];
  const filter = `in.(${quizIds.join(',')})`;

  console.log('\n1. Deleting existing assessment data...');

  // Delete quiz_answers for these quizzes
  const attemptsResp = await fetch(
    `${SUPABASE_URL}/rest/v1/quiz_attempts?quiz_id=${filter}&select=id`,
    { headers }
  );
  const attempts = await attemptsResp.json();
  if (attempts.length > 0) {
    const attemptIds = attempts.map(a => a.id);
    // Delete in batches
    for (let i = 0; i < attemptIds.length; i += 50) {
      const batch = attemptIds.slice(i, i + 50);
      await fetch(
        `${SUPABASE_URL}/rest/v1/quiz_answers?attempt_id=in.(${batch.join(',')})`,
        { method: 'DELETE', headers }
      );
    }
    console.log(`  Deleted answers for ${attempts.length} attempts`);

    await fetch(
      `${SUPABASE_URL}/rest/v1/quiz_attempts?quiz_id=${filter}`,
      { method: 'DELETE', headers }
    );
    console.log('  Deleted attempts');
  } else {
    console.log('  No attempts to delete');
  }

  // Get question IDs for these quizzes
  const questionsResp = await fetch(
    `${SUPABASE_URL}/rest/v1/quiz_questions?quiz_id=${filter}&select=id`,
    { headers: { ...headers, 'Range': '0-999' } }
  );
  const questions = await questionsResp.json();

  if (questions.length > 0) {
    // Delete options in batches
    const questionIds = questions.map(q => q.id);
    for (let i = 0; i < questionIds.length; i += 50) {
      const batch = questionIds.slice(i, i + 50);
      await fetch(
        `${SUPABASE_URL}/rest/v1/quiz_question_options?question_id=in.(${batch.join(',')})`,
        { method: 'DELETE', headers }
      );
    }
    console.log(`  Deleted options for ${questions.length} questions`);

    // Delete questions
    await fetch(
      `${SUPABASE_URL}/rest/v1/quiz_questions?quiz_id=${filter}`,
      { method: 'DELETE', headers }
    );
    console.log('  Deleted questions');
  } else {
    console.log('  No questions to delete');
  }

  // Delete quizzes
  await fetch(
    `${SUPABASE_URL}/rest/v1/quizzes?id=${filter}`,
    { method: 'DELETE', headers }
  );
  console.log('  Deleted quizzes');
}

async function insertQuizzes() {
  console.log('\n2. Inserting quiz definitions...');
  const quizzes = [
    { id: 'a0000001-0000-0000-0000-000000000001', title: '生活日本語総合試験', quiz_type: 'jlpt_vocab', passing_score: 0, time_limit_minutes: 25, is_assessment: true, questions_per_attempt: 30 },
    { id: 'a0000002-0000-0000-0000-000000000002', title: 'ビジネス日本語総合試験', quiz_type: 'it_terminology', passing_score: 0, time_limit_minutes: 25, is_assessment: true, questions_per_attempt: 30 },
    { id: 'a0000003-0000-0000-0000-000000000003', title: 'CS知識総合試験', quiz_type: 'core_programming', passing_score: 0, time_limit_minutes: 30, is_assessment: true, questions_per_attempt: 30 },
    { id: 'a0000004-0000-0000-0000-000000000004', title: '開発実務能力総合試験', quiz_type: 'framework', passing_score: 0, time_limit_minutes: 30, is_assessment: true, questions_per_attempt: 30 },
    { id: 'a0000005-0000-0000-0000-000000000005', title: 'ビジネスリテラシー総合試験', quiz_type: 'attitude_culture', passing_score: 0, time_limit_minutes: 25, is_assessment: true, questions_per_attempt: 30 },
  ];

  const resp = await fetch(`${SUPABASE_URL}/rest/v1/quizzes`, {
    method: 'POST',
    headers: { ...headers, 'Prefer': 'return=minimal' },
    body: JSON.stringify(quizzes),
  });

  if (!resp.ok) {
    const body = await resp.text();
    console.error(`  FAIL: ${resp.status} - ${body.substring(0, 300)}`);
    return false;
  }
  console.log('  OK - 5 quizzes inserted');
  return true;
}

function parseSeedPart(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  const questions = [];
  let currentQuestion = null;

  const lines = content.split('\n');
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];

    // Match question INSERT
    const qMatch = line.match(/VALUES \(q_id, '([^']+)', 'multiple_choice', (E?'.*'), (E?'.*'), (\d+), (\d+), '(\w+)', (\w+|NULL|'[^']*')\)/);
    if (qMatch) {
      // Extract strings properly handling E'' syntax
      let questionText = qMatch[2];
      let explanation = qMatch[3];

      // Remove E prefix and quotes
      questionText = questionText.replace(/^E?'/, '').replace(/'$/, '');
      explanation = explanation.replace(/^E?'/, '').replace(/'$/, '');

      // Convert \n to actual newlines (for both E'' and regular strings)
      questionText = questionText.replace(/\\n/g, '\n');
      explanation = explanation.replace(/\\n/g, '\n');

      // Unescape SQL single quotes
      questionText = questionText.replace(/''/g, "'");
      explanation = explanation.replace(/''/g, "'");

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

async function insertQuestionsAndOptions(questions, quizLabel) {
  console.log(`\n3. Inserting ${quizLabel}: ${questions.length} questions...`);

  // Insert questions in batches of 10
  const batchSize = 10;
  let totalOptions = 0;

  for (let i = 0; i < questions.length; i += batchSize) {
    const batch = questions.slice(i, i + batchSize);

    // Insert questions (without options)
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
      console.error(`  FAIL questions batch ${i}-${i + batch.length}: ${body.substring(0, 300)}`);
      return false;
    }

    const insertedQuestions = await qResp.json();

    // Now insert options for each question
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
      console.error(`  FAIL options batch ${i}-${i + batch.length}: ${body.substring(0, 300)}`);
      return false;
    }

    totalOptions += allOptions.length;
    process.stdout.write(`  Batch ${Math.floor(i / batchSize) + 1}/${Math.ceil(questions.length / batchSize)} OK (${i + batch.length}/${questions.length} questions, ${totalOptions} options)\r`);
  }

  console.log(`\n  Done: ${questions.length} questions, ${totalOptions} options`);
  return true;
}

async function main() {
  console.log('=== J-Bridge Assessment Quiz Seed Deployment ===\n');

  // Step 1: Delete existing data
  await deleteExistingData();

  // Step 2: Insert quiz definitions
  const quizzesOk = await insertQuizzes();
  if (!quizzesOk) {
    console.error('\nFailed to insert quizzes. Aborting.');
    process.exit(1);
  }

  // Step 3: Parse and insert each quiz's questions
  const quizFiles = [
    { file: 'quiz1_jlpt.sql', label: 'Quiz 1 (生活日本語)' },
    { file: 'quiz2_it_japanese.sql', label: 'Quiz 2 (ビジネス日本語)' },
    { file: 'quiz3_programming.sql', label: 'Quiz 3 (CS知識)' },
    { file: 'quiz4_framework.sql', label: 'Quiz 4 (開発実務能力)' },
    { file: 'quiz4_java_code.sql', label: 'Quiz 4+ (Javaコード)' },
    { file: 'quiz4_javascript_code.sql', label: 'Quiz 4+ (JSコード)' },
    { file: 'quiz5_attitude.sql', label: 'Quiz 5 (ビジネスリテラシー)' },
  ];

  let totalQuestions = 0;
  let totalOptions = 0;

  for (const { file, label } of quizFiles) {
    const filePath = path.join(__dirname, '..', 'supabase', 'seed_parts', file);
    const questions = parseSeedPart(filePath);
    totalQuestions += questions.length;
    totalOptions += questions.reduce((sum, q) => sum + q.options.length, 0);

    const ok = await insertQuestionsAndOptions(questions, label);
    if (!ok) {
      console.error(`\nFailed at ${label}. Partial data may exist.`);
      process.exit(1);
    }
  }

  console.log(`\n=== Deployment Complete ===`);
  console.log(`Total: ${totalQuestions} questions, ${totalOptions} options`);

  // Verify
  console.log('\n--- Verification ---');
  for (const qid of [
    'a0000001-0000-0000-0000-000000000001',
    'a0000002-0000-0000-0000-000000000002',
    'a0000003-0000-0000-0000-000000000003',
    'a0000004-0000-0000-0000-000000000004',
    'a0000005-0000-0000-0000-000000000005',
  ]) {
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
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
