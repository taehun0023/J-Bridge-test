-- 문법 퀴즈에서 _ 블랭크 사용하는 문제 찾기 (（　）가 없고 _ 또는 ＿ 있는 것)
SELECT qq.id, qq.question_text
FROM quiz_questions qq
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE (qq.question_text LIKE '%___%' OR qq.question_text LIKE '%＿＿%')
  AND qq.question_text NOT LIKE '%（　%'
  AND qq.question_text NOT LIKE '%＿＿★＿＿%'
ORDER BY qq.id
LIMIT 30;
