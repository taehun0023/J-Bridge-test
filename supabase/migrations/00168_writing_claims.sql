-- 00168_writing_quiz_questions.sql
-- 작문 문제를 quiz_questions に登録 (admin/courses コンテンツ管理対応)
-- writing_exercises.self_result 削除
-- 생성일: 2026-04-13

BEGIN;

-- 1. writing_exercises から self_result 削除
ALTER TABLE writing_exercises DROP COLUMN IF EXISTS self_result;

-- 2. quizzes の quiz_type CHECK に 'writing' 追加
ALTER TABLE quizzes DROP CONSTRAINT IF EXISTS quizzes_quiz_type_check;
ALTER TABLE quizzes ADD CONSTRAINT quizzes_quiz_type_check
  CHECK (quiz_type IN (
    'jlpt_vocab', 'jlpt_grammar', 'jlpt_reading', 'jlpt_listening', 'jlpt_kanji',
    'it_terminology', 'role_play_scenario', 'attitude_culture',
    'core_programming', 'framework', 'sentence_pattern', 'business_expression',
    'cs_knowledge', 'keigo', 'writing'
  ));

-- 3. 作文用プールクイズ作成
INSERT INTO quizzes (id, title, quiz_type, is_pool, is_assessment, passing_score, questions_per_attempt, time_limit_minutes, created_at)
VALUES (
  'f0000001-0000-0000-0000-000000000005',
  '作文練習',
  'writing',
  true,
  false,
  70,
  20,
  null,
  NOW()
) ON CONFLICT (id) DO NOTHING;

-- 4. quiz_questions の question_type CHECK に 'writing' 追加
ALTER TABLE quiz_questions DROP CONSTRAINT IF EXISTS quiz_questions_question_type_check;
ALTER TABLE quiz_questions ADD CONSTRAINT quiz_questions_question_type_check
  CHECK (question_type IN (
    'multiple_choice', 'fill_in_blank', 'audio_listening', 'ordering', 'writing'
  ));

-- 5. it_glossary から quiz_questions へ一括登録
INSERT INTO quiz_questions (quiz_id, question_text, explanation, question_type, difficulty, question_category, is_published, points, sort_order)
SELECT
  'f0000001-0000-0000-0000-000000000005'::uuid,
  COALESCE(example_sentence_ko, term_ko),
  example_sentence,
  'writing',
  CASE category
    WHEN 'expression' THEN '初級'
    WHEN 'sentence_pattern' THEN '中級'
    WHEN 'keigo' THEN '上級'
  END,
  'writing',
  true,
  1,
  ROW_NUMBER() OVER (ORDER BY created_at)
FROM it_glossary
WHERE category IN ('expression', 'sentence_pattern', 'keigo')
  AND example_sentence IS NOT NULL;

COMMIT;
