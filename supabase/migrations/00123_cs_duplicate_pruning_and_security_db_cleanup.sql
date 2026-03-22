-- Duplicate pruning and targeted cleanup for high-volume remaining unset banks.
-- Focus:
-- 1. exact duplicate quarantine where a stronger canonical row already exists
-- 2. database / security governance cleanup after shortage closure

UPDATE quiz_questions
SET question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  -- computer_architecture duplicates
  'b37ca75a-8e13-4301-93ce-095dbb8111eb',
  '7ddc89bb-d749-4513-b313-b1a22d2c51af',
  '0118cfb6-e174-4fa4-805c-2d8e12673f25',
  '42b4a9c4-db49-46b4-b6ed-acf3b090d13e',
  -- network duplicate
  '6637de53-593c-4282-82ae-cd19190032bd',
  -- os duplicates
  'dd996a7e-3fc3-4ff1-8a50-abfabc02eaba',
  '50bba785-d14f-4526-a80c-9380918ef2fc',
  'a4659253-e40e-4e39-b40f-3757a5d1a81d',
  -- algorithm duplicates
  'b7506d1c-5af2-439e-95c7-2bd226d95325',
  '3c729280-7160-4ca5-9df2-570b4f6b44fa',
  -- database duplicate
  '21e6ec52-718c-4af8-84b5-9deede0bcaa7',
  -- security duplicates
  '5f0a7731-4c7e-4c6e-aa09-7e67b31d0684',
  '896270d4-c380-4530-af66-e9a45dfc1b0a',
  '1e97a90c-19ff-4c9a-a4c4-8c3e8c0dd642'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-02',
    difficulty = 'easy'
WHERE id IN (
  '1833c5be-ffe5-4809-9a27-42785e45df6f',
  '629bbcac-1d0c-4b3a-9fe3-0c7133b58e30',
  'cb2a06ec-aee8-4c9b-b30f-7527346798b9'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DB-01-02',
    difficulty = 'medium'
WHERE id IN (
  '1cfb75bc-dbbc-467a-ba3c-c376cf8f8567',
  '796fdcf5-824d-4897-9f92-b75c0aaade69'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-DB-01-01',
    difficulty = 'medium'
WHERE id = '07584d8a-6ce0-470a-a52c-7020a0eab51b';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-DB-01-03',
    difficulty = 'medium'
WHERE id = '2b5cac44-6a92-4d26-bde2-f19fe25abf06';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '0f2afa04-2f24-442c-87c9-80f9646e2e01',
  '10f7e87c-2916-4a75-b9fe-2699b8461faf',
  '16604894-477a-4ffa-9793-0b233a716cac',
  '1893de19-ef11-466b-9e84-a5ece87054c4',
  '3290312f-a4ab-4b97-ac4c-7799cbd5ad91',
  '3326e74e-edaa-4e3c-8bdc-4889f71d72b0',
  '5229f0fb-e78e-4332-8dc4-073f1a3dd275',
  '5638d061-57f1-487e-95f2-770e508b6dda',
  '5af87677-c63b-4acb-b0a6-7875729f37d5',
  '5f7efa04-3212-4683-9078-10cfd627efaa',
  '654e0427-d22c-4bf6-a833-7e0438dfc3b0',
  '660bc9ed-d8ab-433c-af37-a36bfb37267c',
  '6fb7a53d-9bc7-4c74-888d-de9cd8d7d553',
  '705e1061-2fed-4942-a9bf-6ab54c79063c',
  '7236f099-4945-483d-8fb7-668f004623ad',
  '79b6c58a-96f8-4460-98f1-9c99cc87ea2c',
  '87b1cb20-f875-4dc5-a513-e0428ef87727',
  '8cefc3cf-ffa4-4bff-b181-8778c9932b63',
  '94b6bae9-00c7-487b-bff9-1742711f625a',
  'a1d1e1c7-e746-4016-b6de-a3822ba94402',
  'a82cbd81-893e-40fa-b075-3ca9a9c57375',
  'b951374a-7136-4903-b782-6b82bd38d1c6',
  'bfff1ab2-8dac-46f3-89a0-9f79b9e15c01',
  'c5ba65ff-692f-4327-896e-a73fbf474320',
  'c9dd6414-7e80-409e-9908-73016442b448',
  'cb3c466b-5b2c-4cc9-828b-d5e528f634a5',
  'd10a8984-8f6d-478e-a203-21369e49033b',
  'd2d04afb-fb4c-4240-b3c1-86cbe48321f1',
  'd54c38e8-1cd4-4247-b9b1-1e7d55c5cb13',
  'dab80a3d-5ff4-4834-84db-5b651e46d5ab',
  'dbccd74f-75e8-4704-bf42-ff7c969e2b01',
  'e3df37ee-7f89-4384-b3d8-40d33036f830',
  'e9b83c3d-14ab-44e0-93b4-eae0fb29d4b6',
  'ec0e87f1-f2a3-4af2-b4c7-daad0986a714',
  'ed2b4706-f0ad-4318-8392-42d2147c80d9',
  'eea7cb24-1363-43a1-9990-e2520d1eecca'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-SC-01-02',
    difficulty = 'easy'
WHERE id IN (
  '12e83a12-f2fb-43c8-bf73-b07e676dfede',
  'e8d9ea22-9a9d-4887-85b4-8e7576382cee'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-SC-01-01',
    difficulty = 'easy'
WHERE id IN (
  '57e29061-5343-40ec-ab68-506747a494f9',
  'a70355ca-383a-400f-adbc-25b4758c061f',
  'b2cd85ba-3b74-4f8e-aa89-e872d29c521f'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-SC-01-03',
    difficulty = 'medium'
WHERE id IN (
  '58d639e2-5d6b-41ba-9530-010191ad4265',
  'bb973153-42bf-481f-afe7-028376eb4643',
  'c0d9eec2-a7db-4080-be59-21e7cdcea40d'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'understanding_only',
    lesson_mapping = 'CSK-SC-01-04',
    difficulty = 'easy'
WHERE id = '0a324bcd-96fc-4dee-9d50-1f778f7b304f';

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    lesson_mapping = 'CSK-SC-01-03',
    difficulty = 'medium'
WHERE id = '283e8893-597e-436d-bea3-97dfc5b362d5';

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '0909aee6-e229-487d-89e6-ce7db0524f08',
  '09f21c86-464d-489e-afa2-bb5dc0ec4025',
  '17689073-dd5e-4643-89fa-4dc0fc7be96f',
  '1ad64e11-5311-41f8-9343-2dde578f9227',
  '1e200014-e752-4437-97fb-b34b19d5f9c9',
  '2881d971-0dc6-4983-9d61-72b25475c5e7',
  '3fe46a92-541c-47e1-8031-694c8ac99c44',
  '4777a3e5-a2c1-49e6-ae2c-f69133be3e55',
  '50993547-3ca3-4e44-8cef-95eb95c18255',
  '50f3c0f0-ff30-49aa-9990-124e31b69af5',
  '5190d26a-f2e3-448a-ac41-859caddf1226',
  '559e6d30-63af-41ba-ad25-343f5febeec5',
  '5f414647-8e1d-4bc3-89e8-911f7298c9e6',
  '665d43f9-b190-4637-bbdf-854c0a75761e',
  '67d77013-e876-4fb6-b1a7-b7e4b7ce2a49',
  '6c79e7bf-dc03-4dab-bbb6-72cc9087e89f',
  '77949c87-0a67-4ace-8798-1376d1f2d5ad',
  '829ec65f-7be5-4e11-a261-9fa19b555541',
  '8a8df579-b18c-4bc5-957e-c32c0d900b67',
  '8b19f193-eeed-4c0f-9788-96f832eed1ba',
  '900d752c-7787-459f-b23a-fe073975b7c8',
  'a2bf76e6-db83-4afb-9790-8077751e5d73',
  'af76b081-b6c2-4843-9498-b85c1f1907d6',
  'b30fae2a-28ac-4962-b270-1ae43b5173e7',
  'c20c8110-5eb8-48e5-8bce-f6978c6be3e4',
  'd8d4b83b-a5d9-4fa9-94f8-6a24624f311b',
  'e40a6bcb-50b1-4bd0-b881-f3ee632a09ea',
  'e4d2a050-4c7c-40e9-8ef0-79c24f9e3e82',
  'e82bacc7-216d-4bfc-a3a1-03d6c12c0a84',
  'f4cae4c3-e722-44b7-92ee-36e1cd3f20d0'
);

NOTIFY pgrst, 'reload schema';
