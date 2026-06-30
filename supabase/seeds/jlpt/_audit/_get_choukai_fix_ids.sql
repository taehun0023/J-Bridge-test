SELECT msq.sort_order, msq.section, qq.id as q_id, LEFT(qq.question_text,80) as q_head,
       qo.id as opt_id, qo.sort_order as opt_ord, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 1
  AND msq.sort_order IN (87,88,90,91,92,97)
ORDER BY msq.sort_order, qo.sort_order;
