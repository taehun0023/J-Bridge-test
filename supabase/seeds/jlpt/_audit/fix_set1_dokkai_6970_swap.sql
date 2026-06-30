-- Set1 dokkai sort_order 69(問２) ↔ 70(問１) 교체
-- 問１(チェさん scenario)이 먼저 와야 함
BEGIN;

UPDATE jlpt_mock_set_questions
SET sort_order = 999
WHERE set_id = 'aa000001-0000-0000-0000-000000000011'
  AND section = 'dokkai' AND sort_order = 69;

UPDATE jlpt_mock_set_questions
SET sort_order = 69
WHERE set_id = 'aa000001-0000-0000-0000-000000000011'
  AND section = 'dokkai' AND sort_order = 70;

UPDATE jlpt_mock_set_questions
SET sort_order = 70
WHERE set_id = 'aa000001-0000-0000-0000-000000000011'
  AND section = 'dokkai' AND sort_order = 999;

COMMIT;
