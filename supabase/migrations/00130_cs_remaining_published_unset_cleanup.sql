-- Finalize the remaining published CS difficulty-null rows.
-- Rule:
-- 1. Questions unrelated to understanding-test pools move into the comprehensive track.
-- 2. Only clear category-drift rows stay excluded, but still get explicit difficulty.

-- basic_theory -> comprehensive_only
UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  'd26d06f9-644e-4dc6-9299-82a2536ea288',
  'd72790df-21ad-482b-b3ee-c86fea3ce9ad',
  '8b463bf0-dddc-439d-bd1e-414e8a2ea6fc',
  '64b60cb1-7842-431b-aae9-4a0f5eb29153',
  '439f0467-ba6c-4772-9f71-57964f6b2849',
  '21e286a8-e6ef-4c2b-a9cb-8b6327c15ed6',
  '36d95ad4-54b4-4527-88b7-64d72ce8486b',
  '0c56564b-33b7-4bb1-8307-0c096c826c77',
  '2095d558-7ff1-4d26-a905-a6aedfc7f5ac',
  'c67b80a7-a638-4d2f-aae0-720adb6968d4',
  '66ee5a44-2476-4988-89b7-9cc72d208c80',
  '82bd9c7b-699f-42ec-917d-e10a9d0e1a12',
  '0337b18c-cdee-42d7-a2cc-6a4f4f8377ab',
  'fe46d70d-535a-4111-8a6a-816d2dc877f2'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  '204f8eb2-d46b-4c4c-90d6-951efd01f333',
  '8e45c7af-f720-4347-99f4-f41ff9e35374',
  'c1a7574e-21c9-4f9c-a806-70e66179e4aa',
  '681ea76d-6057-4906-a463-3462f9d16252',
  '8d11029c-4937-47cf-b923-e6bd9c11079b',
  'a1ad5301-2c99-40bb-b7d0-5ac169fba845',
  '4ab0d494-2c72-49a6-8218-a60026475d60',
  'be355a8b-0194-4c81-9168-32806fe06bc7',
  '1e0725d7-ea3a-4faa-a68b-92be9abb9ea8'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    difficulty = 'medium'
WHERE id IN (
  '2c1e4c0d-75be-4d35-a8f3-fa84f8b002b0',
  '143e7810-7e86-40af-811e-52bf78cb9183'
);

-- data_structure -> comprehensive_only
UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  '82ff5c04-ea86-4fd6-b597-ac13a8a8ac14',
  '248deab1-9e65-4829-8adc-f2af2965bd2c',
  '1424846f-27dd-4183-ad88-e8004332934a',
  'da34469b-bfea-463d-ae59-4f0254523a50'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  '4f4db782-5129-4c29-8264-600445cf8aee',
  'a9934097-e42f-4efb-8602-ceda08fead77',
  '4ca917cb-a7ba-4136-988d-fd1f72afa12e',
  '3f49c18b-4213-4a1c-80a8-115a74908236',
  '32f9f115-fd68-4406-9cd0-38c376a175ea',
  '05f4ef1b-4af0-464c-9f4f-79424d0d9374',
  'f0af6dc3-da27-4773-91ae-7a5ae4bb1693'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'hard'
WHERE id IN (
  'e414959b-be30-4067-93e8-240d6599a249'
);

-- algorithm -> comprehensive_only
UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  '3c729280-7160-4ca5-9df2-570b4f6b44fa',
  'b7506d1c-5af2-439e-95c7-2bd226d95325',
  '5d3b00fa-69f3-405d-a36d-eb9f262a6c95',
  '64552869-8b9a-4b9d-b90c-fcad62fc4bf1',
  'a430f0d3-f63b-402e-9538-563b6566b9c0',
  'abf27c25-5626-4262-8701-adbad5cdbb66',
  '43be2ff9-0767-4185-a0d8-a03b63611f61',
  '19518630-a555-4fab-80c9-9b8eba042e41'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  '9e585d1f-e66d-446e-829f-d0c25f0d07ce',
  '3b4784f1-9b83-4de9-8c4b-bca33b38143b',
  'dc759bc0-0a20-497b-840b-a8e397fa2475',
  'd806b454-8901-415a-a9ff-1a2ff5320cdb',
  '70bc61cb-71ef-4d18-99da-ee528a5ecbec',
  '239e9278-3aaa-4fb5-bc58-1c946e9c2642',
  '34292346-d8b6-48a1-b0f9-2eb339dbeaf8',
  '257ed618-8fe6-487e-9d0f-797e4deb2bdb',
  'cdd983b9-664c-4a7e-9204-dce0ebf6ad36',
  'eab8af73-f1f8-457b-98b4-87ac9a18b538'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'hard'
WHERE id IN (
  '8dd383be-c9bb-4d9c-8921-c669e0843213',
  '6fb0cbb9-b3cb-41ef-b0fe-34bc66a6e78d',
  '75b39115-ca15-433e-955b-0ae0d7981178',
  '0e11e446-d114-4510-80fb-64693c391701',
  '7b3aefe5-a0f8-43f1-9fa7-30c3b8211df0',
  '6bda5314-7118-4e22-9e14-d9a84d4e3e3d',
  '35b6187b-988b-4c0b-8211-3e23a62fd41b',
  'e4346c46-5772-4a06-a668-36cdf019c128'
);

-- computer_architecture -> comprehensive_only
UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  'cf2ac45b-9f0b-47d1-ba8d-becb675ede27',
  'dcf1ef95-9184-4728-98a1-757d473da89b',
  '3c71da54-8e0e-43e3-ac3b-39e3be275246',
  '3ad0845d-82f1-435c-bfe4-f46445f4f1b8',
  '0e6d3ea6-a8bb-4f3a-b34d-51c965fb5072',
  'bbbdc219-4fc3-4a35-a5ff-53af32a86672'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  '1f3c5959-f4a0-4d35-8af8-59136db213a1',
  '2b2962e5-0528-47e7-b8ff-3d3d8d70c81a',
  '055d36e7-4f6c-4b30-b61e-5c26ca7951fe',
  'ca7fc87f-7746-4720-bcab-ec5f3e5d22be',
  '0d54e583-c7e0-4695-b5fd-b1d6c8b62fbf',
  '8ffce741-09a4-459e-9cda-7dc0ad2a72c0',
  '64e82a5a-1fd7-43ff-aec0-d48da3f1b4f5',
  'db25d877-9646-453d-86d0-7726c27f9caa'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'hard'
WHERE id IN (
  '095bfc34-3d01-4054-8080-c3b307d0825b',
  '3d87ed0e-f7e2-4e89-833a-a817bd3ebd4a'
);

-- database -> comprehensive_only where category-relevant
UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  'cb3c466b-5b2c-4cc9-828b-d5e528f634a5',
  'bfff1ab2-8dac-46f3-89a0-9f79b9e15c01',
  '1893de19-ef11-466b-9e84-a5ece87054c4',
  'c5ba65ff-692f-4327-896e-a73fbf474320',
  '94b6bae9-00c7-487b-bff9-1742711f625a',
  '5f7efa04-3212-4683-9078-10cfd627efaa',
  '87b1cb20-f875-4dc5-a513-e0428ef87727',
  'e3df37ee-7f89-4384-b3d8-40d33036f830',
  '16604894-477a-4ffa-9793-0b233a716cac',
  'e9b83c3d-14ab-44e0-93b4-eae0fb29d4b6',
  'c9dd6414-7e80-409e-9908-73016442b448',
  '8cefc3cf-ffa4-4bff-b181-8778c9932b63',
  '2fb8ea21-70ae-4bca-93b4-8437b461fa2e'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  'dbccd74f-75e8-4704-bf42-ff7c969e2b01',
  'ae006e3a-9421-41d3-b13d-257e182469d0',
  '00f25bd9-b6d1-4203-8bb6-644286cbf24f',
  'd2d04afb-fb4c-4240-b3c1-86cbe48321f1',
  '705e1061-2fed-4942-a9bf-6ab54c79063c',
  'b951374a-7136-4903-b782-6b82bd38d1c6',
  'dab80a3d-5ff4-4834-84db-5b651e46d5ab',
  '3290312f-a4ab-4b97-ac4c-7799cbd5ad91',
  'd54c38e8-1cd4-4247-b9b1-1e7d55c5cb13',
  '79b6c58a-96f8-4460-98f1-9c99cc87ea2c',
  '3326e74e-edaa-4e3c-8bdc-4889f71d72b0',
  '7236f099-4945-483d-8fb7-668f004623ad',
  'd10a8984-8f6d-478e-a203-21369e49033b',
  '21e6ec52-718c-4af8-84b5-9deede0bcaa7',
  '0f2afa04-2f24-442c-87c9-80f9646e2e01',
  '10f7e87c-2916-4a75-b9fe-2699b8461faf',
  '5229f0fb-e78e-4332-8dc4-073f1a3dd275'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'hard'
WHERE id IN (
  '660bc9ed-d8ab-433c-af37-a36bfb37267c',
  'a82cbd81-893e-40fa-b075-3ca9a9c57375',
  'eea7cb24-1363-43a1-9990-e2520d1eecca',
  '654e0427-d22c-4bf6-a833-7e0438dfc3b0',
  '2600ac0d-c805-4d24-a1b6-e6625c8cd55f',
  'ec0e87f1-f2a3-4af2-b4c7-daad0986a714'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    difficulty = 'easy'
WHERE id IN (
  '6fb7a53d-9bc7-4c74-888d-de9cd8d7d553',
  'ed2b4706-f0ad-4318-8392-42d2147c80d9',
  '5638d061-57f1-487e-95f2-770e508b6dda'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    difficulty = 'medium'
WHERE id IN (
  '5af87677-c63b-4acb-b0a6-7875729f37d5',
  'a1d1e1c7-e746-4016-b6de-a3822ba94402'
);

-- network -> comprehensive_only
UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  '4c9943f6-3c8c-4ef1-8576-fac3f9faf845',
  '67b6cd95-374b-4d37-91ac-c217446f61b9',
  '84c46c73-4fb6-42d0-aabf-185ea81703e3',
  '677eb171-baf0-4cf1-a455-cde153753bdd',
  '4facfa87-5d0a-4f40-b57d-f1ecb5a2572f',
  '2e509566-eacf-4451-80b4-6877a7c5739a',
  'a0680096-be57-4aa8-86a1-2f00b6aab104',
  'b646f91a-8893-49f6-afa5-0510a6175c81',
  'a039e8a3-6b1f-4f10-9dea-9f1f4c3390ae',
  'd9c0a8b0-2776-46c7-b2db-949230322a36',
  'a7a798cd-4762-495e-8462-c78f52ba8c50',
  '6bdd9f99-7f68-48fc-b678-ae0f13f736f9'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  '15a20286-3641-45e8-a2c6-f89c10bb4fdc',
  '9cbc0f0a-8ffb-4537-b563-f49fdad4f726',
  '9b1f5681-c4a5-404b-a06b-3ebab582ccfb',
  'ff73e900-f80e-44bb-887b-79eec1b4c0a7',
  '564ee84f-7eda-46f8-823d-35ede3a0ae81',
  'baad3bcc-79c8-47d0-ba04-1cca3936ce93',
  'd7cb21cc-4ae3-4e5a-99e5-d721f2f87e8a',
  'eef3affa-b6ac-4ea4-bc17-55ce3169947f',
  'e45c27b9-a481-4b1d-acfb-a2a810ce48d4',
  'e3ceb76a-7771-4742-86e7-29dc8ccba12d',
  '7fe9fe81-c3d5-4175-97c6-d06ae4435dcf'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    difficulty = 'medium'
WHERE id IN (
  '6ef7f54c-d8d6-4ee4-8aa1-4e4de03c78ff'
);

-- os -> clear drift stays excluded but gets difficulty
UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    difficulty = 'easy'
WHERE id IN (
  'ef47d31a-9cd7-4dab-9b93-2653f0c995dd'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    difficulty = 'medium'
WHERE id IN (
  '6f913e4a-8c11-48d8-819b-3b52b4814389'
);

-- security -> comprehensive_only where category-relevant
UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  'b30fae2a-28ac-4962-b270-1ae43b5173e7',
  '2881d971-0dc6-4983-9d61-72b25475c5e7',
  '6c79e7bf-dc03-4dab-bbb6-72cc9087e89f',
  '3fe46a92-541c-47e1-8031-694c8ac99c44',
  '17689073-dd5e-4643-89fa-4dc0fc7be96f',
  '1ad64e11-5311-41f8-9343-2dde578f9227',
  '4777a3e5-a2c1-49e6-ae2c-f69133be3e55',
  '0909aee6-e229-487d-89e6-ce7db0524f08',
  '50f3c0f0-ff30-49aa-9990-124e31b69af5',
  '559e6d30-63af-41ba-ad25-343f5febeec5',
  '09f21c86-464d-489e-afa2-bb5dc0ec4025',
  '665d43f9-b190-4637-bbdf-854c0a75761e',
  '829ec65f-7be5-4e11-a261-9fa19b555541',
  '8a8df579-b18c-4bc5-957e-c32c0d900b67',
  '67d77013-e876-4fb6-b1a7-b7e4b7ce2a49',
  '900d752c-7787-459f-b23a-fe073975b7c8'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  'c20c8110-5eb8-48e5-8bce-f6978c6be3e4',
  'e82bacc7-216d-4bfc-a3a1-03d6c12c0a84',
  '8b19f193-eeed-4c0f-9788-96f832eed1ba',
  '5f414647-8e1d-4bc3-89e8-911f7298c9e6',
  '1e97a90c-19ff-4c9a-a4c4-8c3e8c0dd642',
  '5190d26a-f2e3-448a-ac41-859caddf1226',
  '77949c87-0a67-4ace-8798-1376d1f2d5ad',
  'e40a6bcb-50b1-4bd0-b881-f3ee632a09ea',
  'a2bf76e6-db83-4afb-9790-8077751e5d73',
  'f4cae4c3-e722-44b7-92ee-36e1cd3f20d0',
  '5f0a7731-4c7e-4c6e-aa09-7e67b31d0684'
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'hard'
WHERE id IN (
  '1e200014-e752-4437-97fb-b34b19d5f9c9',
  'd8d4b83b-a5d9-4fa9-94f8-6a24624f311b',
  'af76b081-b6c2-4843-9498-b85c1f1907d6',
  '072a76df-e7c2-40da-b5fb-297869e83481',
  '158ddbe8-e11a-4731-b6ee-9cd706b2d4fa',
  'e4d2a050-4c7c-40e9-8ef0-79c24f9e3e82',
  '896270d4-c380-4530-af66-e9a45dfc1b0a'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    difficulty = 'medium'
WHERE id IN (
  'e2c26b96-ff3f-4132-8d31-bb5cde7d9c22',
  '50993547-3ca3-4e44-8cef-95eb95c18255'
);

NOTIFY pgrst, 'reload schema';
