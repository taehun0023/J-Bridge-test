-- Sets 2/3/4 청해 問題1/2 각 1문 삭제 (6→5, 7→6)
-- 官方基準: 問題1=5 / 問題2=6 / 問題3=5 / 問題4=11 / 問題5=3
DO $$
DECLARE
  set_id_var UUID;
  qid UUID;
BEGIN
  -- ── Set 2 ──────────────────────────────────────────
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level='N1' AND set_no=2;

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

  -- ── Set 3 ──────────────────────────────────────────
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level='N1' AND set_no=3;

  SELECT question_id INTO qid FROM jlpt_mock_set_questions
    WHERE set_id=set_id_var AND section='choukai' AND daimon=1
    ORDER BY sort_order DESC LIMIT 1;
  DELETE FROM jlpt_mock_set_questions WHERE set_id=set_id_var AND question_id=qid;
  DELETE FROM quiz_question_options WHERE question_id=qid;
  DELETE FROM quiz_questions WHERE id=qid;

  SELECT question_id INTO qid FROM jlpt_mock_set_questions
    WHERE set_id=set_id_var AND section='choukai' AND daimon=2
    ORDER BY sort_order DESC LIMIT 1;
  DELETE FROM jlpt_mock_set_questions WHERE set_id=set_id_var AND question_id=qid;
  DELETE FROM quiz_question_options WHERE question_id=qid;
  DELETE FROM quiz_questions WHERE id=qid;

  -- ── Set 4 ──────────────────────────────────────────
  SELECT id INTO set_id_var FROM jlpt_mock_sets WHERE level='N1' AND set_no=4;

  SELECT question_id INTO qid FROM jlpt_mock_set_questions
    WHERE set_id=set_id_var AND section='choukai' AND daimon=1
    ORDER BY sort_order DESC LIMIT 1;
  DELETE FROM jlpt_mock_set_questions WHERE set_id=set_id_var AND question_id=qid;
  DELETE FROM quiz_question_options WHERE question_id=qid;
  DELETE FROM quiz_questions WHERE id=qid;

  SELECT question_id INTO qid FROM jlpt_mock_set_questions
    WHERE set_id=set_id_var AND section='choukai' AND daimon=2
    ORDER BY sort_order DESC LIMIT 1;
  DELETE FROM jlpt_mock_set_questions WHERE set_id=set_id_var AND question_id=qid;
  DELETE FROM quiz_question_options WHERE question_id=qid;
  DELETE FROM quiz_questions WHERE id=qid;

END$$;

-- 확인
SELECT ms.set_no, msq.daimon, COUNT(*) AS cnt
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
WHERE ms.level='N1' AND ms.set_no IN (2,3,4) AND msq.section='choukai'
GROUP BY ms.set_no, msq.daimon ORDER BY ms.set_no, msq.daimon;
