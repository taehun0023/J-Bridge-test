-- Create 6 pool quizzes for Development Skills comprehension tests
-- Java track: java_core, spring_boot, sql
-- JavaScript track: javascript_core, react, sql (shared)
-- Difficulty ratio: easy 20%, medium 40%, hard 40%

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('e0000001-0000-0000-0000-000000000001', 'Java基礎 テスト', 'core_programming', 70, 25, false, true, 20),
  ('e0000001-0000-0000-0000-000000000002', 'Spring Boot テスト', 'framework', 70, 25, false, true, 20),
  ('e0000001-0000-0000-0000-000000000003', 'SQL テスト', 'core_programming', 70, 25, false, true, 20),
  ('e0000001-0000-0000-0000-000000000004', 'JavaScript基礎 テスト', 'core_programming', 70, 25, false, true, 20),
  ('e0000001-0000-0000-0000-000000000005', 'React テスト', 'framework', 70, 25, false, true, 20),
  ('e0000001-0000-0000-0000-000000000006', 'SQL テスト (共通)', 'core_programming', 70, 25, false, true, 20)
ON CONFLICT (id) DO NOTHING;
