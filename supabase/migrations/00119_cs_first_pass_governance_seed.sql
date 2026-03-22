-- First-pass governance updates from docs/cs-question-review-sheet.md
-- This is intentionally a seed-sized batch, not the final full-bank cleanup.

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'easy'
WHERE id = '03e72e6e-2031-4780-88f0-3474798b4721';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-03',
    difficulty = 'medium'
WHERE id = '151792e4-936a-4df6-a836-5bd2862ef8cd';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-04',
    difficulty = 'medium'
WHERE id = '24e4c27d-8945-4fa8-a6d3-557e512a2f41';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-CA-01-02'
WHERE id = '0fd26370-fd67-4c7a-a01d-259ddb57cc0f';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '055d36e7-4f6c-4b30-b61e-5c26ca7951fe',
  '095bfc34-3d01-4054-8080-c3b307d0825b',
  '0d54e583-c7e0-4695-b5fd-b1d6c8b62fbf',
  '0e6d3ea6-a8bb-4f3a-b34d-51c965fb5072'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-NW-01-02',
    difficulty = 'easy'
WHERE id IN (
  '16f95438-6778-43a0-86f3-ac93e96c52c4',
  '216a6a61-68a2-47ee-a22a-477539a26366'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-NW-01-03',
    difficulty = 'easy'
WHERE id = '6637de53-593c-4282-82ae-cd19190032bd';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-NW-01-04',
    difficulty = 'easy'
WHERE id = '89bf300a-a74b-414f-98c8-a2d8d0848cc5';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-NW-01-01'
WHERE id IN (
  '677e3af3-2cef-4c9e-9394-29d3322522dc',
  '6ab8f9ee-b97a-4181-aef1-2af1cf0c43e1'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '15a20286-3641-45e8-a2c6-f89c10bb4fdc',
  '2e509566-eacf-4451-80b4-6877a7c5739a',
  '4facfa87-5d0a-4f40-b57d-f1ecb5a2572f',
  '146b4e91-f8e5-44c5-9a4f-63395a01ea43'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-OS-01-04',
    difficulty = 'easy'
WHERE id = '032c0b44-1678-4962-8c01-228d5316f647';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-03',
    difficulty = 'medium'
WHERE id IN (
  '50bba785-d14f-4526-a80c-9380918ef2fc',
  '433a7e3c-9770-426f-9455-2eb547c19619'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-04',
    difficulty = 'medium'
WHERE id = '416543ee-3456-4134-819a-905828f72b35';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-02',
    difficulty = 'medium'
WHERE id = '8eed3b0e-44fb-479d-86d9-569cc8ca60b4';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-OS-01-04'
WHERE id = '92ff8bca-5a83-4b6c-af36-0b0e2dbfd61f';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '6f913e4a-8c11-48d8-819b-3b52b4814389',
  'ef47d31a-9cd7-4dab-9b93-2653f0c995dd'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-AL-01-02',
    difficulty = 'easy'
WHERE id = '0ab0963c-2991-4689-9110-ade27562b21a';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-01',
    difficulty = 'easy'
WHERE id = '18762e1c-81aa-4040-b4e6-13648c020f04';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-03',
    difficulty = 'medium'
WHERE id IN (
  '4e94611d-cc3c-4cee-b97b-ff208accc3c0',
  '546bda78-840e-40b5-8d2c-917e69f8e097',
  'a52b3363-2185-41b4-9ad1-0bb100b8a12c',
  '43a5e112-3ef5-443d-bfd6-360049eae6fc'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-AL-01-04'
WHERE id = '06a490a9-73a4-4ec9-b9e8-c35ef66ee630';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-AL-01-03'
WHERE id = '09f6329d-ebd5-4041-b7d5-fc30652dc5e1';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '239e9278-3aaa-4fb5-bc58-1c946e9c2642',
  '2cc4ffc2-3a06-4e95-b63f-8b9501349466',
  '49a2dcd9-c7cc-4451-88af-bb894fdc1436'
);

NOTIFY pgrst, 'reload schema';
