-- Second-pass governance seed focused on the highest-priority shortage categories.
-- Purpose:
-- 1. reduce approved unset-difficulty rows in computer_architecture / network / os
-- 2. close easy / medium shortages with relabeling before bulk new writing
-- 3. add one missing OS medium question to reach the 30-question floor

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'easy'
WHERE id IN (
  '526c7b50-e02b-4ecb-8d10-a11ce0e406d2',
  '8a255413-7fe6-42d6-b260-7f1d07dca3d1',
  'edc585a4-671d-421d-8718-dcc4e0a18b3e'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-04',
    difficulty = 'medium'
WHERE id IN (
  '21a5ccb3-15b4-4f90-8023-5b5e1668f89c',
  'a64176d4-88ae-4d09-a4b4-f629c9adb091'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-02',
    difficulty = 'medium'
WHERE id IN (
  '90a027db-9c4b-417a-a830-0cd79a865dec',
  '8a5bbd14-94d0-4245-b2e4-0451faf40f55',
  'f010b201-616c-441a-b54d-e74893505978'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-CA-01-03',
    difficulty = 'medium'
WHERE id = 'eb8f1ffe-23d1-48c6-a2de-e344e068d1d3';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'medium'
WHERE id = 'af02fa89-dc6c-46d2-bf47-c8dc9d72fd68';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'medium'
WHERE id = 'fe2f52de-429c-4cd8-9f8b-11d2dc3ecb96';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-NW-01-01',
    difficulty = 'medium'
WHERE id IN (
  '239b75a0-c08d-4495-abb8-2d05a56135a0',
  '756081f1-d881-4ef9-9018-ec54c5b0ee85',
  'e6aff7fb-345f-4101-9524-ca36db01eb4e',
  'd0f60cdb-29c9-494c-a9e4-88e4afbfe895',
  '77e0e177-ab1f-4bcf-b8bd-1c4044dcd2af'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-NW-01-02',
    difficulty = 'medium'
WHERE id IN (
  '7c07a22d-3e8a-4517-afd4-e3c510838f99',
  '4e8ef81a-454b-4479-8b1e-17c6e1a50d4f',
  'd35d0f8e-ec0f-4e5d-916c-3ec0285d89d2'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-NW-01-01',
    difficulty = 'medium'
WHERE id IN (
  '677e3af3-2cef-4c9e-9394-29d3322522dc',
  '6ab8f9ee-b97a-4181-aef1-2af1cf0c43e1'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-NW-01-04',
    difficulty = 'medium'
WHERE id = '411961f3-62fa-4249-ab46-016917e511f4';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-03',
    difficulty = 'easy'
WHERE id IN (
  '24ac73b6-aa51-451c-a9a9-dacc4154e48a',
  '72000263-5fa1-449b-ae5b-416d7c030087'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-03',
    difficulty = 'medium'
WHERE id IN (
  '29063da6-e6f0-4714-8181-c0be4984111a'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-04',
    difficulty = 'medium'
WHERE id IN (
  '41ddb427-9b7f-49d2-8c0a-96c4698996ba',
  'a4659253-e40e-4e39-b40f-3757a5d1a81d'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-01',
    difficulty = 'medium'
WHERE id = 'dd996a7e-3fc3-4ff1-8a50-abfabc02eaba';

INSERT INTO quiz_questions (
  id,
  quiz_id,
  question_type,
  question_text,
  explanation,
  points,
  sort_order,
  difficulty,
  question_category,
  is_published,
  curriculum_status,
  question_usage_scope,
  lesson_mapping
)
VALUES (
  'f1000001-0000-4000-a000-000000000121',
  '60000001-0000-0000-0000-000000000006',
  'multiple_choice',
  'ページフォールトが発生するのはどのようなときか。',
  'ページフォールトは、参照したページが主記憶に存在せず、補助記憶から読み込む必要があるときに発生する。',
  1,
  999,
  'medium',
  'os',
  true,
  'aligned',
  'shared',
  'CSK-OS-01-03'
)
ON CONFLICT (id) DO UPDATE SET
  question_text = EXCLUDED.question_text,
  explanation = EXCLUDED.explanation,
  difficulty = EXCLUDED.difficulty,
  question_category = EXCLUDED.question_category,
  is_published = EXCLUDED.is_published,
  curriculum_status = EXCLUDED.curriculum_status,
  question_usage_scope = EXCLUDED.question_usage_scope,
  lesson_mapping = EXCLUDED.lesson_mapping;

INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order)
VALUES
  ('f1000001-0000-4000-b000-000000000121', 'f1000001-0000-4000-a000-000000000121', '必要なページが主記憶に存在しないとき', true, 1),
  ('f1000001-0000-4000-b000-000000000122', 'f1000001-0000-4000-a000-000000000121', 'CPUのクロック周波数が低下したとき', false, 2),
  ('f1000001-0000-4000-b000-000000000123', 'f1000001-0000-4000-a000-000000000121', '同じロックを二重に取得したとき', false, 3),
  ('f1000001-0000-4000-b000-000000000124', 'f1000001-0000-4000-a000-000000000121', 'ファイル名が重複したとき', false, 4)
ON CONFLICT (id) DO UPDATE SET
  option_text = EXCLUDED.option_text,
  is_correct = EXCLUDED.is_correct,
  sort_order = EXCLUDED.sort_order;

NOTIFY pgrst, 'reload schema';
