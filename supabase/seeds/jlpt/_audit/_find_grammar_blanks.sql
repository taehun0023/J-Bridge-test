-- JLPT 문법 퀴즈 문제에서 블랭크 형식 확인
-- jlpt_grammar와 연결된 quiz_questions 중 빈칸 표현 방식 샘플
SELECT DISTINCT
  qq.id,
  qq.question_text
FROM quiz_questions qq
WHERE qq.id IN (
  SELECT DISTINCT msq2.question_id
  FROM jlpt_mock_set_questions msq2
  JOIN jlpt_mock_sets ms2 ON ms2.id = msq2.set_id
  WHERE ms2.level = 'N1' AND msq2.section = 'gengo_chishiki'
    AND msq2.sort_order BETWEEN 26 AND 35
)
  AND (
    qq.question_text NOT LIKE '%（　%'
    OR qq.question_text LIKE '%____%'
  )
LIMIT 20;
