-- Set 1/3 問題3 言い換え類義: 예문과 질문 사이 줄바꿈 추가
-- 패턴: 。「 또는 。下線部 → 。\n「 / 。\n下線部

UPDATE quiz_questions
SET question_text = regexp_replace(
  question_text,
  E'。(「|下線部)',
  E'。\n\\1'
)
WHERE id IN (
  SELECT qq.id
  FROM jlpt_mock_sets ms
  JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
  JOIN quiz_questions qq ON msq.question_id = qq.id
  WHERE ms.level = 'N1' AND ms.set_no IN (1, 3)
    AND msq.section = 'gengo_chishiki' AND msq.daimon = 3
)
AND question_text NOT LIKE '%' || chr(10) || '%';

-- 결과 확인
SELECT ms.set_no, msq.sort_order,
  replace(replace(qq.question_text, '\\n', chr(10)), '\n', chr(10)) AS qt
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no IN (1, 2, 3)
  AND msq.section = 'gengo_chishiki' AND msq.daimon = 3
ORDER BY ms.set_no, msq.sort_order;
