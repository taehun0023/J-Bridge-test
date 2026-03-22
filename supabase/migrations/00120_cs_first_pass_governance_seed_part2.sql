-- First-pass governance updates: remaining reviewed representative rows
-- Continues the work started in 00119_cs_first_pass_governance_seed.sql

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-01',
    difficulty = 'easy'
WHERE id = '039ebc96-91fb-4c33-a324-cf3ed7dba7cd';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-02',
    difficulty = 'medium'
WHERE id = '07c97caf-5d45-44b7-a89e-16d4ff35febf';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-03',
    difficulty = 'medium'
WHERE id = '0e0fb076-2dc8-4a5b-8777-a2cff715a534';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '0337b18c-cdee-42d7-a2cc-6a4f4f8377ab',
  '143e7810-7e86-40af-811e-52bf78cb9183',
  '1e0725d7-ea3a-4faa-a68b-92be9abb9ea8'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-02',
    difficulty = 'easy'
WHERE id = '1833c5be-ffe5-4809-9a27-42785e45df6f';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-02',
    difficulty = 'medium'
WHERE id = '1cfb75bc-dbbc-467a-ba3c-c376cf8f8567';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-DB-01-03'
WHERE id = '2b5cac44-6a92-4d26-bde2-f19fe25abf06';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-DB-01-01'
WHERE id = '07584d8a-6ce0-470a-a52c-7020a0eab51b';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '00f25bd9-b6d1-4203-8bb6-644286cbf24f',
  '2600ac0d-c805-4d24-a1b6-e6625c8cd55f'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-DS-01-02',
    difficulty = 'easy'
WHERE id = '01c5885c-31aa-416f-b801-09d73c63f347';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-03',
    difficulty = 'medium'
WHERE id IN (
  '0437cdd6-66c4-4d19-98e1-272334585dea',
  '3451d42b-ca79-4117-8534-5270b4b9f2e2'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '4ca917cb-a7ba-4136-988d-fd1f72afa12e',
  '0ff946b9-a5f9-4433-bdd6-fddb505d74f5'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-SC-01-04'
WHERE id = '0a324bcd-96fc-4dee-9d50-1f778f7b304f';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-SC-01-02',
    difficulty = 'easy'
WHERE id = '12e83a12-f2fb-43c8-bf73-b07e676dfede';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = NULL
WHERE id = '283e8893-597e-436d-bea3-97dfc5b362d5';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '072a76df-e7c2-40da-b5fb-297869e83481',
  '158ddbe8-e11a-4731-b6ee-9cd706b2d4fa'
);

NOTIFY pgrst, 'reload schema';
