-- 빈칸 표기 통일: 끊겨 보이는 반각 ___ → 끊김 없는 긴 전각 밑줄 (2026-06-28)
-- N1 mock 전체 question_text의 연속 언더스코어를 전각 밑줄 8개로 치환
UPDATE quiz_questions q
SET question_text = regexp_replace(q.question_text, '_+', '＿＿＿＿＿＿＿＿', 'g')
FROM jlpt_mock_set_questions msq
JOIN jlpt_mock_sets ms ON ms.id=msq.set_id
WHERE msq.question_id=q.id AND ms.level='N1'
  AND q.question_text LIKE '%\_%' ESCAPE '\';

-- 확인
SELECT left(q.question_text, 50) AS sample
FROM jlpt_mock_set_questions msq
JOIN quiz_questions q ON q.id=msq.question_id
WHERE msq.set_id='aa000001-0000-0000-0000-000000000011'
  AND q.question_text LIKE '%＿%'
LIMIT 6;
