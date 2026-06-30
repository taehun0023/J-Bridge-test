-- 59번 = dokkai sort_order 14 (45 gengo + 14번째 dokkai)
SELECT ms.set_no, msq.sort_order, msq.section, qq.id, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND msq.section = 'dokkai'
  AND msq.sort_order BETWEEN 12 AND 16
ORDER BY ms.set_no, msq.sort_order;
