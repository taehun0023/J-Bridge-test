SELECT msq.sort_order,
       RIGHT(qq.question_text, 250) AS q_tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 1 AND msq.section = 'dokkai'
  AND msq.sort_order BETWEEN 63 AND 70
ORDER BY msq.sort_order;
