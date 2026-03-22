-- Second-pass governance seed for the remaining counted shortages after 00121.
-- Goal: close the last easy/medium gaps without broad new writing.

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-01',
    difficulty = 'easy'
WHERE id IN (
  '09c44c88-8577-442f-9a4d-ca3d217452be',
  '77ebf44f-b8e0-4842-a0b4-da36e4c7c5a3'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-04',
    difficulty = 'medium'
WHERE id = 'bf37936c-74e8-4c90-a4f2-180285c9c603';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-01',
    difficulty = 'medium'
WHERE id = 'e310699c-ce1e-40f4-84cc-d544d7b73eff';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-03',
    difficulty = 'medium'
WHERE id IN (
  '7c184a08-cca9-4f22-9c8b-e5f4883ead38',
  'ee521026-bd56-45e6-9b2f-b9cbc55fca27'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-03',
    difficulty = 'medium'
WHERE id = 'e8a56169-d325-4e5a-894e-754e8b9ee201';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-01',
    difficulty = 'medium'
WHERE id = 'b7092e05-9625-4d31-b1a3-c7b5ae929343';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-02',
    difficulty = 'medium'
WHERE id = '7e5062bc-c784-4f1d-8fed-ed37312a0da4';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-03',
    difficulty = 'medium'
WHERE id = 'a15a7101-74c6-4e38-aa34-2bef6392bfbb';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-01',
    difficulty = 'easy'
WHERE id IN (
  '32f98074-6006-4e74-8214-0009521afc02',
  'f71f52ef-6dc6-42d2-a579-db3f5d864573'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-01',
    difficulty = 'medium'
WHERE id = 'c40a5c68-f357-4f3b-b4a5-a5292c314a4b';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-02',
    difficulty = 'medium'
WHERE id = '5491da64-df68-41af-b769-876422d03607';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-02',
    difficulty = 'medium'
WHERE id = '8fe9e9f4-956d-49bb-b0f5-f23c44bb2265';

NOTIFY pgrst, 'reload schema';
