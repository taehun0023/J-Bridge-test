-- Fix option length bias: remove parenthesized content from BJ vocabulary options
-- Full option text rebalancing is in the seed files (requires db reset for complete fix)

-- 1. Remove fullwidth parenthesized content （...） from BJ vocab options
UPDATE quiz_question_options
SET option_text = regexp_replace(option_text, '（[^）]*）', '', 'g')
WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    SELECT id FROM quizzes WHERE quiz_type = 'it_terminology' AND is_assessment = false AND is_pool = false
  )
) AND option_text ~ '（';

-- 2. Remove halfwidth parenthesized content (...) from BJ vocab options
UPDATE quiz_question_options
SET option_text = regexp_replace(option_text, '\([^)]*\)', '', 'g')
WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    SELECT id FROM quizzes WHERE quiz_type = 'it_terminology' AND is_assessment = false AND is_pool = false
  )
) AND option_text ~ '\(';
