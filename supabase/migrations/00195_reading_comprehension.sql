-- 독해 학습 지문에 "읽었나 확인용" 객관식 1문항 추가.
-- comprehension = { "question": "...", "options": ["..",".."], "answer": 0 }  (answer = 정답 옵션 index)
ALTER TABLE jlpt_reading_passages ADD COLUMN IF NOT EXISTS comprehension JSONB;

NOTIFY pgrst, 'reload schema';
