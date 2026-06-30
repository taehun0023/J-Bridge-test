-- N1 모의고사 전체 구조 (세트별 섹션별 문제수)
SELECT ms.set_no, msq.section, COUNT(*) as cnt, MIN(msq.sort_order) as min_so, MAX(msq.sort_order) as max_so
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1'
GROUP BY ms.set_no, msq.section
ORDER BY ms.set_no, msq.section;

-- dokkai 중 질문 prompt에 問 이미 포함된 것들
SELECT ms.set_no, msq.sort_order,
       RIGHT(qq.question_text, 200) AS q_tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1'
  AND msq.section = 'dokkai'
  AND (qq.question_text ~ '\n問[0-9１２３]：' OR qq.question_text ~ '\n問い[0-9]')
ORDER BY ms.set_no, msq.sort_order;
