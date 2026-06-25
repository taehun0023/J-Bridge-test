-- 모의고사 빈칸 표기 통일(user 지시): 전각 더블 언더스코어 ＿＿ → 단일 _ (헷갈림 방지)
-- 대상: quiz_questions.question_text 중 ＿＿ 포함 (모의고사 51문항 = 지시문 + 並べ替え 빈칸)
UPDATE quiz_questions
SET question_text = replace(question_text, '＿＿', '_')
WHERE question_text LIKE '%＿＿%';
