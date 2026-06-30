-- 問題3 言い換え類義: 단일 \n → \n\n (박스 렌더링 활성화용)
-- 대상: N1 모의고사 Set 1/2/3 모두

UPDATE quiz_questions
SET question_text = replace(question_text, chr(10), chr(10)||chr(10))
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level = 'N1' AND ms.set_no IN (1, 2, 3)
    AND msq.section = 'gengo_chishiki' AND msq.daimon = 3
)
AND question_text LIKE '%' || chr(10) || '%'
AND question_text NOT LIKE '%' || chr(10) || chr(10) || '%';

-- 결과 확인 (이중개행 포함 여부)
SELECT ms.set_no, msq.sort_order,
  length(qq.question_text) - length(replace(qq.question_text, chr(10)||chr(10), '')) AS double_newlines
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no IN (1,2,3)
  AND msq.section = 'gengo_chishiki' AND msq.daimon = 3
ORDER BY ms.set_no, msq.sort_order;
