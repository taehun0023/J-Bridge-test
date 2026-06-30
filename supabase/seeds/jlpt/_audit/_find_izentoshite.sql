\encoding UTF8
-- 依然として 위치 (모든 N1 세트)
SELECT ms.set_no, msq.sort_order, msq.daimon, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
WHERE ms.level='N1' AND qq.question_text LIKE '依然として%'
ORDER BY ms.set_no, msq.sort_order;

-- 各 세트 用法(daimon=4) 첫 문항 question_text 앞부분 (안내문 내장 여부 확인)
SELECT ms.set_no, msq.sort_order, left(qq.question_text, 60) AS qt
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id=msq.set_id
JOIN quiz_questions qq ON msq.question_id=qq.id
WHERE ms.level='N1' AND msq.section='gengo_chishiki' AND msq.daimon=4
ORDER BY ms.set_no, msq.sort_order;
