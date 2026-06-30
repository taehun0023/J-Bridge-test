-- 人間の知性 포함 문제 찾기
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND qq.question_text LIKE '%人間の知性%'
ORDER BY ms.set_no, msq.sort_order;
