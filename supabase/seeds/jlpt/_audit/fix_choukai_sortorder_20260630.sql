-- Sets 2/3/4 청해 sort_order 충돌 수정
-- 問題4(17→19~29) 問題5(28→30~32) +2 시프트
-- → 새 概要理解 sort_order 17,18이 충돌 없이 정렬됨
DO $$
DECLARE
  set_id_var UUID;
BEGIN
  FOR set_id_var IN
    SELECT id FROM jlpt_mock_sets WHERE level='N1' AND set_no IN (2,3,4)
  LOOP
    -- 問題5 먼저 시프트 (28~30 → 30~32), 충돌 방지
    UPDATE jlpt_mock_set_questions
      SET sort_order = sort_order + 2
      WHERE set_id = set_id_var AND section = 'choukai' AND daimon = 5;

    -- 問題4 시프트 (17~27 → 19~29)
    UPDATE jlpt_mock_set_questions
      SET sort_order = sort_order + 2
      WHERE set_id = set_id_var AND section = 'choukai' AND daimon = 4;
  END LOOP;
END$$;

-- 확인
SELECT ms.set_no, msq.daimon, MIN(msq.sort_order) AS min_so, MAX(msq.sort_order) AS max_so, COUNT(*) AS cnt
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level='N1' AND ms.set_no IN (2,3,4) AND msq.section='choukai'
GROUP BY ms.set_no, msq.daimon
ORDER BY ms.set_no, msq.daimon;
