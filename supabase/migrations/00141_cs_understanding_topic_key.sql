ALTER TABLE quiz_questions
ADD COLUMN IF NOT EXISTS topic_key TEXT;

CREATE INDEX IF NOT EXISTS idx_quiz_questions_topic_key
ON quiz_questions(topic_key)
WHERE topic_key IS NOT NULL;
