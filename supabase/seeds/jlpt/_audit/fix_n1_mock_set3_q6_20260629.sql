-- SET3 6번 矜持→逡巡 선택지 교체 (정답 순서 보정)
BEGIN;

-- 기존 정답(sort_order 4, きょうじ) 먼저 false
UPDATE quiz_question_options SET option_text = 'じゅんじん', is_correct = false
WHERE id = '64f11e40-e567-45d1-ba16-67f0f5d5ed43';

-- 나머지 오답 교체
UPDATE quiz_question_options SET option_text = 'しゅんじゅん', is_correct = true
WHERE id = 'da31faf9-fcea-4605-ae23-ff8bd92eec69';

UPDATE quiz_question_options SET option_text = 'じゅんしゅん', is_correct = false
WHERE id = '895a883c-bdf0-4541-9f7b-24415efcf46e';

UPDATE quiz_question_options SET option_text = 'しゅんじん', is_correct = false
WHERE id = 'b6d766da-d576-47fb-a0ba-12a071f809d3';

COMMIT;
