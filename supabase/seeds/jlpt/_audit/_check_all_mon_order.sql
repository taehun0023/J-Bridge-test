-- 모든 N1 모의고사: 問N이 내장된 dokkai 문제 순서 확인
-- 問番号가 sort_order와 역순인 케이스 탐색
SELECT ms.set_no, msq.sort_order, msq.section,
       regexp_replace(qq.question_text, E'.*\\n\\n', '', 'g') AS prompt_last_line
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND msq.section = 'dokkai'
  AND qq.question_text ~ '問[0-9０-９１２３４][　：]'
ORDER BY ms.set_no, msq.sort_order;
