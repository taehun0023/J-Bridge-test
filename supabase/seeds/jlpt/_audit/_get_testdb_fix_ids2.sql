-- 테스트 DB: gengo_chishiki sort_order 13,16,26,28,29,31,35,39
SELECT msq.sort_order, msq.section, qq.id as q_id, LEFT(qq.question_text,60) as q_head,
       qo.id as opt_id, qo.sort_order as opt_ord, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 1
  AND msq.section = 'gengo_chishiki'
  AND msq.sort_order IN (13,16,26,28,29,31,35,39)
ORDER BY msq.sort_order, qo.sort_order;

-- 테스트 DB: choukai sort_order 18(=88-70), 26(=96-70)
SELECT msq.sort_order, msq.section, qq.id as q_id, LEFT(qq.question_text,60) as q_head,
       qo.id as opt_id, qo.sort_order as opt_ord, qo.option_text, qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 1
  AND msq.section = 'choukai'
  AND msq.sort_order IN (18,26)
ORDER BY msq.sort_order, qo.sort_order;
