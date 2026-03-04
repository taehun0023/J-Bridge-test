-- Fix listening quiz questions: 読んで → 聴いて
-- These are audio-based questions, so the instruction should say "listen" not "read"

UPDATE quiz_questions
SET question_text = REPLACE(question_text, '次の会話を読んで', '次の会話を聴いて')
WHERE question_category = 'listening'
  AND question_text LIKE '%次の会話を読んで%';

UPDATE quiz_questions
SET question_text = REPLACE(question_text, '次の文を読んで', '次の文を聴いて')
WHERE question_category = 'listening'
  AND question_text LIKE '%次の文を読んで%';
