-- Add CWF, Python, Next.js pool quizzes (empty pools — questions to be added later)
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('e0000001-0000-0000-0000-000000000007', '共通業務基礎 テスト', 'core_programming', 70, 25, false, true, 20),
  ('e0000001-0000-0000-0000-000000000008', 'Python テスト', 'core_programming', 70, 25, false, true, 20),
  ('e0000001-0000-0000-0000-000000000009', 'Next.js テスト', 'framework', 70, 25, false, true, 20)
ON CONFLICT (id) DO NOTHING;
