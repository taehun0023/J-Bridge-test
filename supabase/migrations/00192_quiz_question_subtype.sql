-- JLPT 모의시험 問題유형(KANJI_READING, GRAMMAR_CHOICE, LISTENING_TASK 등) 태깅용 컬럼.
-- 가산적/non-destructive. 기존 문항은 NULL(영향 없음).
ALTER TABLE quiz_questions ADD COLUMN IF NOT EXISTS question_subtype TEXT;
COMMENT ON COLUMN quiz_questions.question_subtype IS 'JLPT 모의시험 問題유형 코드(KANJI_READING/CONTEXT_WORD/.../LISTENING_INTEGRATED). 일반 퀴즈는 NULL.';

NOTIFY pgrst, 'reload schema';
