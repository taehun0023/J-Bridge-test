-- Final cleanup for CS question_usage_scope.
-- Keep only the three operational scopes:
-- - comprehensive_only
-- - shared
-- - understanding_only
--
-- Remaining CS null-scope rows in the actual CS comprehensive path are legacy
-- rows inside the Step 3 assessment quiz (and a small computer architecture
-- source batch). They are not understanding-test questions, so they move into
-- the comprehensive track.

UPDATE quiz_questions
SET curriculum_status = COALESCE(curriculum_status, 'aligned'),
    question_usage_scope = 'comprehensive_only'
WHERE is_published = true
  AND question_usage_scope IS NULL
  AND question_category IN (
    'basic_theory',
    'data_structure',
    'algorithm',
    'computer_architecture',
    'database',
    'network',
    'os',
    'security'
  )
  AND quiz_id IN (
    'a0000003-0000-0000-0000-000000000003', -- CS knowledge comprehensive assessment
    '61000001-0000-0000-0000-000000000006'  -- computer architecture final source leftovers
  );

NOTIFY pgrst, 'reload schema';
