-- Remove old BJ practice quizzes (is_pool=false, non-assessment)
-- These are replaced by pool quizzes (is_pool=true) at /japanese/business/quiz/tests
-- Quiz IDs: b1000001~05 (vocabulary), b2000001~03 (patterns), b3000001~03 (expressions), b4000001~03 (keigo)

-- Delete quiz_answers referencing these quizzes' questions (via quiz_attempts)
DELETE FROM quiz_answers
WHERE attempt_id IN (
  SELECT qa.id FROM quiz_attempts qa
  JOIN quizzes q ON qa.quiz_id = q.id
  WHERE q.quiz_type IN ('it_terminology', 'sentence_pattern', 'business_expression', 'keigo')
    AND q.is_pool = false
    AND q.is_assessment = false
);

-- Delete quiz_attempts for these quizzes
DELETE FROM quiz_attempts
WHERE quiz_id IN (
  SELECT id FROM quizzes
  WHERE quiz_type IN ('it_terminology', 'sentence_pattern', 'business_expression', 'keigo')
    AND is_pool = false
    AND is_assessment = false
);

-- Delete question claims
DELETE FROM question_claims
WHERE question_id IN (
  SELECT qq.id FROM quiz_questions qq
  JOIN quizzes q ON qq.quiz_id = q.id
  WHERE q.quiz_type IN ('it_terminology', 'sentence_pattern', 'business_expression', 'keigo')
    AND q.is_pool = false
    AND q.is_assessment = false
);

-- Delete quiz_question_options (cascades from quiz_questions, but explicit for clarity)
DELETE FROM quiz_question_options
WHERE question_id IN (
  SELECT qq.id FROM quiz_questions qq
  JOIN quizzes q ON qq.quiz_id = q.id
  WHERE q.quiz_type IN ('it_terminology', 'sentence_pattern', 'business_expression', 'keigo')
    AND q.is_pool = false
    AND q.is_assessment = false
);

-- Delete quiz_questions
DELETE FROM quiz_questions
WHERE quiz_id IN (
  SELECT id FROM quizzes
  WHERE quiz_type IN ('it_terminology', 'sentence_pattern', 'business_expression', 'keigo')
    AND is_pool = false
    AND is_assessment = false
);

-- Delete the quizzes themselves
DELETE FROM quizzes
WHERE quiz_type IN ('it_terminology', 'sentence_pattern', 'business_expression', 'keigo')
  AND is_pool = false
  AND is_assessment = false;
