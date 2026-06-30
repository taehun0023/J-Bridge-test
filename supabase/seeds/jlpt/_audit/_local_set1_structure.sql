-- 로컬 DB Set1 전체 구조
SELECT msq.section, COUNT(*) as cnt, MIN(msq.sort_order) as min_so, MAX(msq.sort_order) as max_so
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
WHERE ms.level = 'N1' AND ms.set_no = 1
GROUP BY msq.section ORDER BY msq.section;

-- Set1 dokkai sort_order 12~20 → 공유 지문 그룹 확인
SELECT msq.sort_order, LEFT(qq.question_text, 60) as q_head, RIGHT(qq.question_text, 120) as q_tail
FROM jlpt_mock_sets ms
JOIN jlpt_mock_set_questions msq ON ms.id = msq.set_id
JOIN quiz_questions qq ON msq.question_id = qq.id
WHERE ms.level = 'N1' AND ms.set_no = 1 AND msq.section = 'dokkai'
  AND msq.sort_order BETWEEN 55 AND 65
ORDER BY msq.sort_order;
