INSERT INTO quizzes (id, title, quiz_type)
VALUES
  ('ad000001-0000-0000-0000-000000000151', 'N1 模試(本番) 言語知識 Set5', 'mock_exam'),
  ('ad000001-0000-0000-0000-000000000152', 'N1 模試(本番) 読解 Set5',    'mock_exam'),
  ('ad000001-0000-0000-0000-000000000153', 'N1 模試(本番) 聴解 Set5',    'mock_exam')
ON CONFLICT (id) DO NOTHING;

SELECT id, title FROM quizzes WHERE id::text LIKE 'ad000001-0000-0000-0000-00000000015%';
