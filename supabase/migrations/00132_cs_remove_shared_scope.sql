-- Simplify CS question usage to two operational scopes:
-- - understanding_only
-- - comprehensive_only
--
-- Existing CS shared rows become understanding_only.

UPDATE quiz_questions
SET question_usage_scope = 'understanding_only'
WHERE question_usage_scope = 'shared'
  AND question_category IN (
    'basic_theory',
    'data_structure',
    'algorithm',
    'computer_architecture',
    'database',
    'network',
    'os',
    'security',
    'basic_theory_check_1',
    'basic_theory_check_2',
    'basic_theory_final',
    'data_structure_check_1',
    'data_structure_check_2',
    'data_structure_final',
    'algorithm_check_1',
    'algorithm_check_2',
    'algorithm_final',
    'computer_architecture_check_1',
    'computer_architecture_check_2',
    'computer_architecture_final',
    'database_check_1',
    'database_check_2',
    'database_final',
    'network_check_1',
    'network_check_2',
    'network_final',
    'os_check_1',
    'os_check_2',
    'os_final',
    'security_check_1',
    'security_check_2',
    'security_final'
  );

ALTER TABLE quiz_questions
DROP CONSTRAINT IF EXISTS quiz_questions_question_usage_scope_check;

ALTER TABLE quiz_questions
ADD CONSTRAINT quiz_questions_question_usage_scope_check
CHECK (question_usage_scope IN ('understanding_only', 'comprehensive_only', 'exclude'));

NOTIFY pgrst, 'reload schema';
