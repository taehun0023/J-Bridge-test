-- Create 7 pool quizzes for CS Knowledge comprehension tests
-- Each category gets one pool quiz with 20 questions per attempt
-- Difficulty ratio: easy 20%, medium 40%, hard 40%

INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('g0000001-0000-0000-0000-000000000001', 'アルゴリズム テスト', 'cs_knowledge', 70, 20, false, true, 20),
  ('g0000001-0000-0000-0000-000000000002', 'データ構造 テスト', 'cs_knowledge', 70, 20, false, true, 20),
  ('g0000001-0000-0000-0000-000000000003', '基礎理論 テスト', 'cs_knowledge', 70, 20, false, true, 20),
  ('g0000001-0000-0000-0000-000000000004', 'データベース テスト', 'cs_knowledge', 70, 20, false, true, 20),
  ('g0000001-0000-0000-0000-000000000005', 'ネットワーク テスト', 'cs_knowledge', 70, 20, false, true, 20),
  ('g0000001-0000-0000-0000-000000000006', 'OS テスト', 'cs_knowledge', 70, 20, false, true, 20),
  ('g0000001-0000-0000-0000-000000000007', 'セキュリティ テスト', 'cs_knowledge', 70, 20, false, true, 20)
ON CONFLICT (id) DO NOTHING;
