-- 로컬 DB: 人間の知性 포함 + N1 mock 세트 목록
SELECT ms.set_no, ms.id, ms.level, ms.title FROM jlpt_mock_sets ms WHERE ms.level = 'N1' ORDER BY ms.set_no;

SELECT ms.set_no, msq.sort_order, msq.section,
       RIGHT(qq.question_text, 300) AS q_tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND (qq.question_text LIKE '%人間の知性%' OR qq.question_text LIKE '%情報処理能力%')
ORDER BY ms.set_no, msq.sort_order;
