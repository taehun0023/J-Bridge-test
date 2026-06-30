-- 問題3 \n\n → \n 되돌리기 (잘못된 수정 revert)
UPDATE quiz_questions
SET question_text = replace(question_text, chr(10)||chr(10), chr(10))
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level = 'N1' AND ms.set_no IN (1, 2, 3)
    AND msq.section = 'gengo_chishiki' AND msq.daimon = 3
)
AND question_text LIKE '%' || chr(10) || chr(10) || '%';
