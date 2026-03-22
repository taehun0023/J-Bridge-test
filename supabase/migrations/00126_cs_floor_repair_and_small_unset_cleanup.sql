-- Floor repair and small unset cleanup after recounting 00124/00125.
-- Focus:
-- 1. restore computer_architecture and os minimum floor
-- 2. clear small remaining unset pockets in basic_theory / database / security

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'easy'
WHERE id IN (
  '3609487d-0af4-4c6a-a4a5-e109ceb52952',
  '9d9fe33e-dbe5-47a8-946d-9df7fe8abdc8'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-CA-01-03',
    difficulty = 'medium'
WHERE id = '04687441-2876-44a7-8f25-b55061330270';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-02',
    difficulty = 'medium'
WHERE id = 'b530ec76-d8b0-4044-b7cf-38ea4cda2d54';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-BT-01-02',
    difficulty = 'medium'
WHERE id = '1b2e3149-beec-4026-bcdd-9ca597ed07ca';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-01',
    difficulty = 'easy'
WHERE id = '3a3bbd78-5b2c-40f4-9a6c-ca3cd7bdf33f';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-04',
    difficulty = 'medium'
WHERE id = '55999ca6-81d3-4643-ba6f-ae4aa3668c76';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-03',
    difficulty = 'medium'
WHERE id = '60a3b184-f68c-4e97-b557-decb5c748b42';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-02',
    difficulty = 'easy'
WHERE id = '1d5c7995-c7a7-4fbb-8d44-9ec75dd14b24';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-02',
    difficulty = 'medium'
WHERE id = '69b0cd82-b205-42c6-9581-7db9a6d2f8e2';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-DB-01-01',
    difficulty = 'medium'
WHERE id = '4dcd913d-1115-481d-8ac2-5283e177bc43';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '2fb8ea21-70ae-4bca-93b4-8437b461fa2e',
  'ae006e3a-9421-41d3-b13d-257e182469d0'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id = 'e2c26b96-ff3f-4132-8d31-bb5cde7d9c22';

NOTIFY pgrst, 'reload schema';
