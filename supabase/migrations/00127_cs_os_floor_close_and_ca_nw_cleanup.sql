-- Close the remaining OS medium floor gap and continue CA/NW general-pool cleanup.

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-OS-01-03',
    difficulty = 'medium'
WHERE id = '79569b91-c76a-40c3-9591-9bf2c62f3bd5';

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'easy'
WHERE id IN (
  'aec67b25-04c9-425a-b246-b1b09374ab18',
  '96e64e09-5c20-45e8-b1a0-668a04cc195f'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-CA-01-01',
    difficulty = 'medium'
WHERE id IN (
  '1a5013b6-bfd6-4fb7-b959-d4308a67fa81',
  '6b959763-5536-4a5a-bb9e-fc59a89b06e3',
  'ebf6ea9e-4933-4029-9d2f-4bbf4574db61'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '1f3c5959-f4a0-4d35-8af8-59136db213a1',
  '2b2962e5-0528-47e7-b8ff-3d3d8d70c81a',
  '3ad0845d-82f1-435c-bfe4-f46445f4f1b8',
  '3c71da54-8e0e-43e3-ac3b-39e3be275246',
  '3d87ed0e-f7e2-4e89-833a-a817bd3ebd4a',
  '64e82a5a-1fd7-43ff-aec0-d48da3f1b4f5',
  '8ffce741-09a4-459e-9cda-7dc0ad2a72c0',
  'bbbdc219-4fc3-4a35-a5ff-53af32a86672',
  'ca7fc87f-7746-4720-bcab-ec5f3e5d22be',
  'cf2ac45b-9f0b-47d1-ba8d-becb675ede27',
  'db25d877-9646-453d-86d0-7726c27f9caa',
  'dcf1ef95-9184-4728-98a1-757d473da89b'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-NW-01-02',
    difficulty = 'easy'
WHERE id IN (
  '23ea8a00-4d1c-4c63-a683-00b0f4c1f880',
  '95979ec3-4aa8-4f4e-88b1-b17b139c58c1',
  '9b8bf101-92b0-4586-8331-713cf5e54d14',
  'f121718d-b935-4c10-adbf-ee050aee5e1b'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-NW-01-01',
    difficulty = 'medium'
WHERE id IN (
  '086abc3a-129a-44c6-bc0c-b717da9af233',
  '6f4a80f1-3061-4642-b546-2542a7e0707f'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-NW-01-04',
    difficulty = 'medium'
WHERE id IN (
  '7e946e3c-ae03-4a7e-ae2e-8d4a38408327',
  '79b2103d-eedc-4008-940d-84fbfcf4057a'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '4c9943f6-3c8c-4ef1-8576-fac3f9faf845',
  '564ee84f-7eda-46f8-823d-35ede3a0ae81',
  '677eb171-baf0-4cf1-a455-cde153753bdd',
  '67b6cd95-374b-4d37-91ac-c217446f61b9',
  '6bdd9f99-7f68-48fc-b678-ae0f13f736f9',
  '6ef7f54c-d8d6-4ee4-8aa1-4e4de03c78ff',
  '7fe9fe81-c3d5-4175-97c6-d06ae4435dcf',
  '84c46c73-4fb6-42d0-aabf-185ea81703e3',
  '9b1f5681-c4a5-404b-a06b-3ebab582ccfb',
  '9cbc0f0a-8ffb-4537-b563-f49fdad4f726',
  'a039e8a3-6b1f-4f10-9dea-9f1f4c3390ae',
  'a0680096-be57-4aa8-86a1-2f00b6aab104',
  'a7a798cd-4762-495e-8462-c78f52ba8c50',
  'b646f91a-8893-49f6-afa5-0510a6175c81',
  'baad3bcc-79c8-47d0-ba04-1cca3936ce93',
  'd7cb21cc-4ae3-4e5a-99e5-d721f2f87e8a',
  'd9c0a8b0-2776-46c7-b2db-949230322a36',
  'e3ceb76a-7771-4742-86e7-29dc8ccba12d',
  'e45c27b9-a481-4b1d-acfb-a2a810ce48d4',
  'eef3affa-b6ac-4ea4-bc17-55ce3169947f',
  'ff73e900-f80e-44bb-887b-79eec1b4c0a7'
);

NOTIFY pgrst, 'reload schema';
