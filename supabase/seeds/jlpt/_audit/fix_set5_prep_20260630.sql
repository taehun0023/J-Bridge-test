-- Set 5 준비: stub 링크 제거 + quiz 레코드 생성

-- 1. Set 5에 링크된 stub jlpt_mock_set_questions 전체 삭제
DELETE FROM jlpt_mock_set_questions
WHERE set_id = 'aa000001-0000-0000-0000-000000000015';

-- 2. Set 5 전용 quiz 레코드 생성 (없으면)
INSERT INTO quizzes (id, title, description)
VALUES
  ('ad000001-0000-0000-0000-000000000151', 'N1 模試(本番) 言語知識 Set5', 'N1模擬試験 Set5 言語知識'),
  ('ad000001-0000-0000-0000-000000000152', 'N1 模試(本番) 読解 Set5',    'N1模擬試験 Set5 読解'),
  ('ad000001-0000-0000-0000-000000000153', 'N1 模試(本番) 聴解 Set5',    'N1模擬試験 Set5 聴解')
ON CONFLICT (id) DO NOTHING;

-- 확인
SELECT COUNT(*) AS remaining_links FROM jlpt_mock_set_questions
WHERE set_id='aa000001-0000-0000-0000-000000000015';

SELECT id, title FROM quizzes WHERE id IN (
  'ad000001-0000-0000-0000-000000000151',
  'ad000001-0000-0000-0000-000000000152',
  'ad000001-0000-0000-0000-000000000153'
);
