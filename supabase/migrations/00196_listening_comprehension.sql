-- 청해 스크립트에 "들었나/이해했나 확인용" 객관식 1문항 추가.
-- comprehension = { "question": "...", "options": ["..",".."], "answer": 0 }
ALTER TABLE jlpt_listening_scripts ADD COLUMN IF NOT EXISTS comprehension JSONB;

NOTIFY pgrst, 'reload schema';
