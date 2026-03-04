-- Step 1A: Add is_pool column to quizzes
ALTER TABLE quizzes ADD COLUMN IF NOT EXISTS is_pool BOOLEAN NOT NULL DEFAULT FALSE;

-- Step 1B: Backfill vocab question difficulty/question_category from quiz title
UPDATE quiz_questions SET difficulty = sub.n_level, question_category = 'vocab'
FROM (
  SELECT qq.id AS question_id,
    CASE WHEN q.title LIKE 'N5%' THEN 'N5'
         WHEN q.title LIKE 'N4%' THEN 'N4'
         WHEN q.title LIKE 'N3%' THEN 'N3'
         WHEN q.title LIKE 'N2%' THEN 'N2'
         WHEN q.title LIKE 'N1%' THEN 'N1' END AS n_level
  FROM quiz_questions qq
  JOIN quizzes q ON qq.quiz_id = q.id
  WHERE q.quiz_type = 'jlpt_vocab' AND q.is_assessment = false
) sub
WHERE quiz_questions.id = sub.question_id
  AND (quiz_questions.difficulty IS NULL OR quiz_questions.question_category IS NULL);

-- Step 1C: Create 4 pool quizzes (one per category)
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('e0000001-0000-0000-0000-000000000001', '語彙テスト', 'jlpt_vocab', 70, 30, false, true, 100),
  ('e0000001-0000-0000-0000-000000000002', '文法テスト', 'jlpt_grammar', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000003', '読解テスト', 'jlpt_reading', 70, 20, false, true, 20),
  ('e0000001-0000-0000-0000-000000000004', '聴解テスト', 'jlpt_listening', 70, 25, false, true, 20)
ON CONFLICT (id) DO NOTHING;
