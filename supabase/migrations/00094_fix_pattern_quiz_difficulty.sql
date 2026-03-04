-- Fix NULL difficulty on sentence_pattern quiz questions (Quiz 3 Q11-Q15)
-- Previous seed UPDATE only covered sort_order 1-10, leaving Q11-Q15 with NULL difficulty
UPDATE quiz_questions SET difficulty = '中級'
WHERE difficulty IS NULL
  AND quiz_id IN (
    SELECT id FROM quizzes
    WHERE quiz_type = 'sentence_pattern'
      AND is_assessment = false
      AND is_pool = false
  );
