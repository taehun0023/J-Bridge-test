-- ① 포함 dokkai 문제 검색
SELECT ms.set_no, msq.sort_order, msq.section, qq.id,
       LEFT(qq.question_text, 300) AS qt_head
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND msq.section = 'dokkai'
  AND qq.question_text LIKE '%①%'
ORDER BY ms.set_no, msq.sort_order;
