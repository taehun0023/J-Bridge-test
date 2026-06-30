-- Set 5 청해 배분 수정: 問題1(6→5) / 問題2(7→6) / 問題3(3→5)
-- 問題4/5 sort_order +2 시프트 후 問題1/2 마지막 문항 삭제
DO $$
DECLARE
  set_id_var UUID;
  qid UUID;
BEGIN
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level='N1' AND set_no=5;

  -- 問題5 먼저 시프트 (28-30 → 30-32)
  UPDATE jlpt_mock_set_questions
    SET sort_order = sort_order + 2
    WHERE set_id=set_id_var AND section='choukai' AND daimon=5;

  -- 問題4 시프트 (17-27 → 19-29)
  UPDATE jlpt_mock_set_questions
    SET sort_order = sort_order + 2
    WHERE set_id=set_id_var AND section='choukai' AND daimon=4;

  -- 問題1 sort_order=6 삭제
  SELECT question_id INTO qid FROM jlpt_mock_set_questions
    WHERE set_id=set_id_var AND section='choukai' AND daimon=1
    ORDER BY sort_order DESC LIMIT 1;
  DELETE FROM jlpt_mock_set_questions WHERE set_id=set_id_var AND question_id=qid;
  DELETE FROM quiz_question_options WHERE question_id=qid;
  DELETE FROM quiz_questions WHERE id=qid;

  -- 問題2 sort_order=13 삭제
  SELECT question_id INTO qid FROM jlpt_mock_set_questions
    WHERE set_id=set_id_var AND section='choukai' AND daimon=2
    ORDER BY sort_order DESC LIMIT 1;
  DELETE FROM jlpt_mock_set_questions WHERE set_id=set_id_var AND question_id=qid;
  DELETE FROM quiz_question_options WHERE question_id=qid;
  DELETE FROM quiz_questions WHERE id=qid;

END$$;

-- 확인
SELECT msq.daimon, msq.subtype, MIN(msq.sort_order) AS min_so, MAX(msq.sort_order) AS max_so, COUNT(*) AS cnt
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
WHERE ms.level='N1' AND ms.set_no=5 AND msq.section='choukai'
GROUP BY msq.daimon, msq.subtype ORDER BY msq.daimon;
