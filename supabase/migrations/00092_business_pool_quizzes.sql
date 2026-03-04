-- Create 3 pool quizzes for Business Japanese comprehension tests
-- Vocabulary: 100 questions from 250 pool, 30 min
-- Sentence patterns: 20 questions from 30 pool, 20 min
-- Business expressions: 20 questions from 60 pool, 20 min
-- Each uses difficulty ratio: 初級 20%, 中級 40%, 上級 40%

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('f0000001-0000-0000-0000-000000000001', 'ビジネス語彙テスト', 'it_terminology', 70, 30, false, true, 100),
  ('f0000001-0000-0000-0000-000000000002', '文章パターンテスト', 'sentence_pattern', 70, 20, false, true, 20),
  ('f0000001-0000-0000-0000-000000000003', 'ビジネス表現テスト', 'business_expression', 70, 20, false, true, 20)
ON CONFLICT (id) DO NOTHING;
