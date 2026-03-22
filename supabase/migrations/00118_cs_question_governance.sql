-- Add governance metadata to quiz_questions so CS understanding-test and comprehensive pools
-- can be split without relying on category names alone.

ALTER TABLE quiz_questions
ADD COLUMN curriculum_status TEXT
CHECK (curriculum_status IN ('aligned', 'adaptable', 'out_of_scope'));

ALTER TABLE quiz_questions
ADD COLUMN question_usage_scope TEXT
CHECK (question_usage_scope IN ('understanding_only', 'shared', 'comprehensive_only', 'exclude'));

ALTER TABLE quiz_questions
ADD COLUMN lesson_mapping TEXT;

CREATE INDEX idx_quiz_questions_curriculum_status
  ON quiz_questions(curriculum_status);

CREATE INDEX idx_quiz_questions_usage_scope
  ON quiz_questions(question_usage_scope);

CREATE INDEX idx_quiz_questions_lesson_mapping
  ON quiz_questions(lesson_mapping);

NOTIFY pgrst, 'reload schema';
