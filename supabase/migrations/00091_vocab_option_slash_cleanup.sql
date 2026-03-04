-- Fix JLPT vocabulary quiz correct options: remove "A/B" format, keep first meaning only
-- Only correct answers had "/" which made them distinguishable as answers

UPDATE quiz_question_options
SET option_text = split_part(option_text, '/', 1)
WHERE is_correct = TRUE
  AND option_text LIKE '%/%'
  AND question_id IN (
    SELECT id FROM quiz_questions
    WHERE quiz_id IN (SELECT id FROM quizzes WHERE quiz_type = 'jlpt_vocab')
  );
