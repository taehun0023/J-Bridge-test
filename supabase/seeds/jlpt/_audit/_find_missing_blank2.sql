-- 클라이언트 포함 문제 찾기
SELECT ms.set_no, msq.sort_order, qq.id, qq.question_text
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND msq.section = 'gengo_chishiki'
  AND (qq.question_text LIKE '%納期%' OR qq.question_text LIKE '%感動%' OR qq.question_text LIKE '%ラスト%')
ORDER BY ms.set_no, msq.sort_order;
