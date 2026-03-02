-- Extend quiz_questions.difficulty to support JLPT N-levels (N5~N1) alongside existing easy/medium/hard
ALTER TABLE quiz_questions DROP CONSTRAINT IF EXISTS quiz_questions_difficulty_check;
ALTER TABLE quiz_questions ADD CONSTRAINT quiz_questions_difficulty_check
  CHECK (difficulty IN ('easy','medium','hard','N5','N4','N3','N2','N1'));
