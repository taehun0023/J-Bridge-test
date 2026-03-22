-- Repair batch after duplicate pruning reduced the comprehensive minimum floor.
-- Strategy:
-- 1. relabel remaining unique computer_architecture rows to recover easy/medium floor
-- 2. temporarily restore three in-scope OS duplicate rows to keep the 30-question floor

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'easy'
WHERE id IN (
  'ed21380a-f5d4-4bb8-ae1a-3e7a57c594d3',
  'ac5c08fc-c575-4606-96e1-56f5b0a09f36'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-03',
    difficulty = 'medium'
WHERE id = '528374e8-00db-44e0-939d-e0e020a5b114';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-01',
    difficulty = 'easy'
WHERE id = 'dd996a7e-3fc3-4ff1-8a50-abfabc02eaba';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-03',
    difficulty = 'medium'
WHERE id = '50bba785-d14f-4526-a80c-9380918ef2fc';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-04',
    difficulty = 'medium'
WHERE id = 'a4659253-e40e-4e39-b40f-3757a5d1a81d';

NOTIFY pgrst, 'reload schema';
