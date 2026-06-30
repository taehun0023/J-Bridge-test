\encoding UTF8
SELECT
  msq.sort_order,
  qq.id AS question_id,
  qq.question_text,
  qo.id AS option_id,
  qo.sort_order AS opt_order,
  qo.option_text,
  qo.is_correct
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
JOIN quiz_question_options qo ON qo.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 3
  AND qq.question_text LIKE '%幼い子供たちが難民%'
ORDER BY qo.sort_order;
