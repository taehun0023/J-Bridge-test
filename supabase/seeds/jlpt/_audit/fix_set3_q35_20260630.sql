\encoding UTF8
-- Set3 Q35 (gengo 文法形式の判断): 오답 보기 교체 — 1번(が出てしまう)·4번(がこぼれそうだ)이
-- 涙が出てしまう/涙がこぼれそうだ로 자연스러워 복수정답이 됨. 명확한 오답으로 교체.
-- 정답 3번(を禁じえない) 유지.
BEGIN;

UPDATE quiz_question_options SET option_text = 'に暮れた'
 WHERE id = '73ec03d9-3358-4966-b39c-806ccf45945b';   -- opt1: が出てしまう → に暮れた

UPDATE quiz_question_options SET option_text = 'を流すまいとした'
 WHERE id = '7fb00a28-7344-4087-92b9-686fc29dae76';   -- opt2: を流すことにした → を流すまいとした

UPDATE quiz_question_options SET option_text = 'に値しなかった'
 WHERE id = '7b15fc85-c276-4f94-bede-94e767f3c577';   -- opt4: がこぼれそうだ → に値しなかった

COMMIT;

-- 검증
SELECT qo.sort_order, qo.option_text, qo.is_correct
FROM quiz_question_options qo
WHERE qo.question_id = '548f6d29-4121-4dd8-8fe2-866da74e550d'
ORDER BY qo.sort_order;
