-- 모든 세트 dokkai: 問N 내장 문제 순서 전수 확인 (로컬 DB)
SELECT ms.set_no, msq.sort_order,
       RIGHT(qq.question_text, 150) AS prompt_tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND msq.section = 'dokkai'
  AND (
    qq.question_text ~ '問[0-9０-９][　：]'
    OR qq.question_text ~ '問い：'
    OR qq.question_text ~ '問：'
  )
ORDER BY ms.set_no, msq.sort_order;
