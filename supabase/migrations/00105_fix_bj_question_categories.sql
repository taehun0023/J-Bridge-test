-- Fix question_category for business_expression and keigo practice quizzes
-- These may be NULL if seed data was not applied

-- business_expression questions (b3000001~03, pool f0000003)
UPDATE quiz_questions SET question_category = 'business_expression'
WHERE quiz_id IN (
  'b3000001-0000-0000-0000-000000000001',
  'b3000002-0000-0000-0000-000000000002',
  'b3000003-0000-0000-0000-000000000003',
  'f0000001-0000-0000-0000-000000000003'
) AND (question_category IS NULL OR question_category != 'business_expression');

-- keigo questions (b4000001~03, pool f0000004)
UPDATE quiz_questions SET question_category = 'keigo'
WHERE quiz_id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003',
  'f0000001-0000-0000-0000-000000000004'
) AND (question_category IS NULL OR question_category != 'keigo');
