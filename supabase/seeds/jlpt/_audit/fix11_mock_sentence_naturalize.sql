-- 並べ替え 완성문 부자연 교정(user 지적)
-- #10 aee20038-...002: 고정부 「成功は」 제거(成否와 의미중복) → 완성문 「成否はともかく、最後までやり抜くことが大切だ」
--   보기 4개·정답(最後まで, sort_order 4)은 그대로 유지.
UPDATE quiz_questions
SET question_text = replace(question_text, '成功は　', '')
WHERE id = 'aee20038-0000-0000-0000-000000000002';
