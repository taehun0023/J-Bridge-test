-- JLPT 문법 퀴즈에서 ___ 블랭크 사용 문제 (모의고사 제외)
SELECT qq.id, qq.question_text
FROM quiz_questions qq
WHERE qq.question_text ~ '[_＿]{2,}'
  AND qq.question_text NOT LIKE '%（　%'
  AND qq.question_text NOT LIKE '%＿＿★%'
  AND qq.id NOT IN (
    SELECT question_id FROM jlpt_mock_set_questions
  )
ORDER BY qq.id
LIMIT 30;
