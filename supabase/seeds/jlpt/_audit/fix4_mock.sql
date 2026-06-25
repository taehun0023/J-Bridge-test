-- 전수검토 4차: 모의고사 오류 2건
-- A-1: set2 dokkai 社会関係資本 정답 ①→② (단일 정답 제약 위해 전부 false 후 ②만 true)
UPDATE quiz_question_options SET is_correct=false WHERE question_id='add20009-0000-0000-0000-000000000099';
UPDATE quiz_question_options SET is_correct=true  WHERE question_id='add20009-0000-0000-0000-000000000099' AND sort_order=2;

-- A-2: set2 SENTENCE_ORDER 語群 중복 손상 복구 (①言われる→ ①言われる … → ①言われる …)
UPDATE quiz_questions SET question_text = regexp_replace(question_text, '①言われる[^①]*①言われる', '①言われる')
WHERE id='aee20039-0000-0000-0000-000000000002';
