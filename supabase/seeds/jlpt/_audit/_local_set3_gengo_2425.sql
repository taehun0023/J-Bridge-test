-- 로컬 SET3 gengo_chishiki sort_order 24/25
SELECT msq.sort_order,
       qq.id,
       qq.question_text,
       qo.option_text,
       qo.is_correct,
       qo.sort_order as opt_order
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND msq.section = 'gengo_chishiki'
  AND msq.sort_order IN (24, 25)
ORDER BY msq.sort_order, qo.sort_order;
