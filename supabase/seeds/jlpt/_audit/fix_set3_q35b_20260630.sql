\encoding UTF8
-- Set3 Q35: 보기1 涙に暮れた도 '눈물에 잠기다' 계열로 성립 가능 → 복수정답 이의 여지.
-- 涙に反した로 교체해 명확한 오답으로 만들고 정답(を禁じえない)만 남김.
BEGIN;

UPDATE quiz_question_options SET option_text = 'に反した'
 WHERE id = '73ec03d9-3358-4966-b39c-806ccf45945b';   -- opt1: に暮れた → に反した

COMMIT;

SELECT qo.sort_order, qo.option_text, qo.is_correct
FROM quiz_question_options qo
WHERE qo.question_id = '548f6d29-4121-4dd8-8fe2-866da74e550d'
ORDER BY qo.sort_order;
