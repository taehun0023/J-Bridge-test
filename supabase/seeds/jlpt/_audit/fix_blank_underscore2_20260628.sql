-- 빈칸 표기 재수정 (2026-06-28): 띄엄띄엄한 전각 밑줄 → 끊김 없는 반각 긴 밑줄
-- 전각 밑줄 4개 이상 연속(＿＿＿＿…=문법형식 단일 빈칸)만 반각 _ 10개로.
-- 문장배열의 ＿＿＿(3개씩 칸 구분)은 4개 미만이라 제외 → 그대로 유지.
UPDATE quiz_questions q
SET question_text = regexp_replace(q.question_text, '＿{4,}', '__________', 'g')
FROM jlpt_mock_set_questions msq
JOIN jlpt_mock_sets ms ON ms.id=msq.set_id
WHERE msq.question_id=q.id AND ms.level='N1'
  AND q.question_text LIKE '%＿＿＿＿%';

-- 28번(sort_order=28) 확인
SELECT msq.sort_order, left(q.question_text,55) AS q
FROM jlpt_mock_set_questions msq
JOIN quiz_questions q ON q.id=msq.question_id
WHERE msq.set_id='aa000001-0000-0000-0000-000000000011' AND msq.sort_order IN (26,27,28,29,30);
