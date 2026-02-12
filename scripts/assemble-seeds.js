const fs = require('fs');
const path = require('path');

const supabaseDir = path.join(__dirname, '..', 'supabase');
const partsDir = path.join(supabaseDir, 'seed_parts');
const outFile = path.join(supabaseDir, 'seed_assessment_quizzes.sql');

const header = `-- ============================================
-- J-Bridge Assessment Quiz Seed Data
-- 5 Assessment Quizzes for Onboarding
-- Total: 450 questions, 1800 options
-- ============================================

BEGIN;

-- ============================================
-- 0. Clean up existing assessment data
-- ============================================
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'a0000001-0000-0000-0000-000000000001',
    'a0000002-0000-0000-0000-000000000002',
    'a0000003-0000-0000-0000-000000000003',
    'a0000004-0000-0000-0000-000000000004',
    'a0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'a0000001-0000-0000-0000-000000000001',
  'a0000002-0000-0000-0000-000000000002',
  'a0000003-0000-0000-0000-000000000003',
  'a0000004-0000-0000-0000-000000000004',
  'a0000005-0000-0000-0000-000000000005'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'a0000001-0000-0000-0000-000000000001',
    'a0000002-0000-0000-0000-000000000002',
    'a0000003-0000-0000-0000-000000000003',
    'a0000004-0000-0000-0000-000000000004',
    'a0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'a0000001-0000-0000-0000-000000000001',
  'a0000002-0000-0000-0000-000000000002',
  'a0000003-0000-0000-0000-000000000003',
  'a0000004-0000-0000-0000-000000000004',
  'a0000005-0000-0000-0000-000000000005'
);
DELETE FROM quizzes WHERE id IN (
  'a0000001-0000-0000-0000-000000000001',
  'a0000002-0000-0000-0000-000000000002',
  'a0000003-0000-0000-0000-000000000003',
  'a0000004-0000-0000-0000-000000000004',
  'a0000005-0000-0000-0000-000000000005'
);

-- ============================================
-- 1. Assessment Quizzes (5)
-- ============================================
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt) VALUES
  ('a0000001-0000-0000-0000-000000000001', '\u751F\u6D3B\u65E5\u672C\u8A9E\u30E9\u30F3\u30AF\u8A66\u9A13', 'jlpt_vocab', 0, 25, TRUE, 30),
  ('a0000002-0000-0000-0000-000000000002', '\u30D3\u30B8\u30CD\u30B9\u65E5\u672C\u8A9E\u30E9\u30F3\u30AF\u8A66\u9A13', 'it_terminology', 0, 25, TRUE, 30),
  ('a0000003-0000-0000-0000-000000000003', 'CS\u77E5\u8B58\u30E9\u30F3\u30AF\u8A66\u9A13', 'core_programming', 0, 30, TRUE, 30),
  ('a0000004-0000-0000-0000-000000000004', '\u958B\u767A\u5B9F\u52D9\u80FD\u529B\u30E9\u30F3\u30AF\u8A66\u9A13', 'framework', 0, 30, TRUE, 30),
  ('a0000005-0000-0000-0000-000000000005', '\u30D3\u30B8\u30CD\u30B9\u30EA\u30C6\u30E9\u30B7\u30FC\u30E9\u30F3\u30AF\u8A66\u9A13', 'attitude_culture', 0, 25, TRUE, 30);`;

const parts = [
  'quiz1_jlpt.sql',
  'quiz2_it_japanese.sql',
  'quiz3_programming.sql',
  'quiz4_framework.sql',
  'quiz4_java_code.sql',
  'quiz4_javascript_code.sql',
  'quiz5_attitude.sql',
  'jlpt_grammar_content.sql',
  'jlpt_grammar_quizzes.sql',
  'jlpt_reading_content.sql',
  'jlpt_reading_quizzes.sql',
  'jlpt_listening_content.sql',
  'jlpt_listening_quizzes.sql',
];

let output = header + '\n';

for (const part of parts) {
  const content = fs.readFileSync(path.join(partsDir, part), 'utf8').trimEnd();
  output += '\n' + content + '\n';
}

output += '\nCOMMIT;\n';

fs.writeFileSync(outFile, output, 'utf8');

// Verify
const lines = fs.readFileSync(outFile, 'utf8').split('\n');
console.log(`Total lines: ${lines.length}`);

const quizHeaders = lines.filter(l => l.startsWith('-- Quiz '));
console.log(`Quiz sections: ${quizHeaders.length}`);
quizHeaders.forEach(h => console.log(`  ${h}`));

// Verify quiz titles are correct
const titleLine = lines.find(l => l.includes("'生活日本語ランク試験'"));
console.log(`\nJapanese titles OK: ${!!titleLine}`);
