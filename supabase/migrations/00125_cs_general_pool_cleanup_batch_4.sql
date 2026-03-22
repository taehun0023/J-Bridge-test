-- General pool cleanup batch 4.
-- Focus:
-- 1. basic_theory cleanup
-- 2. algorithm cleanup
-- 3. data_structure cleanup
-- No shortage-driven changes here; this is governance-completeness work.

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-01',
    difficulty = 'easy'
WHERE id IN (
  '1ce77ee1-1f22-4a9f-9323-783b83099e24',
  '8cf9a355-02e0-4cee-bbab-79628b5ce54d',
  'd5503e3d-db70-41a7-a617-0ea40f3463c3'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-02',
    difficulty = 'easy'
WHERE id IN (
  '6c4bac5c-b390-4599-aa0b-190cee700067',
  'f5548667-9877-4757-8137-1a5db7db21c5'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-03',
    difficulty = 'medium'
WHERE id IN (
  '11ea907a-9ad9-4a85-be3b-dd4408695c2e',
  '8b82586f-4896-48ac-884b-a29f449141b8',
  'ab9e90fd-318e-4e58-a29f-8f374e9bee81'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-BT-01-04',
    difficulty = 'medium'
WHERE id IN (
  '88bc1d58-e976-4a58-9a2e-b48a9e20ac90',
  'e58af6ac-5194-4a77-b121-57838777521d',
  'f8481931-9ea0-46af-9bcc-10d014b330fa'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '0c56564b-33b7-4bb1-8307-0c096c826c77',
  '204f8eb2-d46b-4c4c-90d6-951efd01f333',
  '2095d558-7ff1-4d26-a905-a6aedfc7f5ac',
  '21e286a8-e6ef-4c2b-a9cb-8b6327c15ed6',
  '2c1e4c0d-75be-4d35-a8f3-fa84f8b002b0',
  '36d95ad4-54b4-4527-88b7-64d72ce8486b',
  '439f0467-ba6c-4772-9f71-57964f6b2849',
  '4ab0d494-2c72-49a6-8218-a60026475d60',
  '64b60cb1-7842-431b-aae9-4a0f5eb29153',
  '66ee5a44-2476-4988-89b7-9cc72d208c80',
  '681ea76d-6057-4906-a463-3462f9d16252',
  '82bd9c7b-699f-42ec-917d-e10a9d0e1a12',
  '8b463bf0-dddc-439d-bd1e-414e8a2ea6fc',
  '8d11029c-4937-47cf-b923-e6bd9c11079b',
  '8e45c7af-f720-4347-99f4-f41ff9e35374',
  'a1ad5301-2c99-40bb-b7d0-5ac169fba845',
  'be355a8b-0194-4c81-9168-32806fe06bc7',
  'c1a7574e-21c9-4f9c-a806-70e66179e4aa',
  'c67b80a7-a638-4d2f-aae0-720adb6968d4',
  'd26d06f9-644e-4dc6-9299-82a2536ea288',
  'd72790df-21ad-482b-b3ee-c86fea3ce9ad',
  'fe46d70d-535a-4111-8a6a-816d2dc877f2'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-01',
    difficulty = 'easy'
WHERE id IN (
  '2f032201-b165-4f60-9126-c900995605f3',
  '6085dbaa-bf03-4258-ae32-46e77ee40dc5',
  'c3b97623-2bc3-4e83-8217-586bb474582a',
  'f29962c4-332a-456c-ae94-9f4e58a74452'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-02',
    difficulty = 'medium'
WHERE id IN (
  '723333db-d2cd-438b-bbfb-f414bffddcd7',
  'a24d898b-3eac-4681-a2a8-1ec811c7709d',
  'baf204b3-c334-47b0-bc2e-d744b01d2ac8',
  'e29f7e55-d041-4534-b8a5-fefbccf06487',
  'e82442a2-ae1f-4d8d-8240-03a4663d7ab4'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-AL-01-03',
    difficulty = 'medium'
WHERE id IN (
  '2407db83-2255-43b8-b50a-b70ce63743de',
  '60bc1b33-1aee-4765-bae5-ddb00d7e87da',
  'b136de12-4dcd-4f0a-9c8c-31815d810a79',
  'e95a5bc9-978a-48ac-b754-90e21c5ea073'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '0e11e446-d114-4510-80fb-64693c391701',
  '19518630-a555-4fab-80c9-9b8eba042e41',
  '257ed618-8fe6-487e-9d0f-797e4deb2bdb',
  '34292346-d8b6-48a1-b0f9-2eb339dbeaf8',
  '35b6187b-988b-4c0b-8211-3e23a62fd41b',
  '3b4784f1-9b83-4de9-8c4b-bca33b38143b',
  '43be2ff9-0767-4185-a0d8-a03b63611f61',
  '5d3b00fa-69f3-405d-a36d-eb9f262a6c95',
  '64552869-8b9a-4b9d-b90c-fcad62fc4bf1',
  '6bda5314-7118-4e22-9e14-d9a84d4e3e3d',
  '6fb0cbb9-b3cb-41ef-b0fe-34bc66a6e78d',
  '70bc61cb-71ef-4d18-99da-ee528a5ecbec',
  '75b39115-ca15-433e-955b-0ae0d7981178',
  '7b3aefe5-a0f8-43f1-9fa7-30c3b8211df0',
  '8dd383be-c9bb-4d9c-8921-c669e0843213',
  '9e585d1f-e66d-446e-829f-d0c25f0d07ce',
  'a430f0d3-f63b-402e-9538-563b6566b9c0',
  'abf27c25-5626-4262-8701-adbad5cdbb66',
  'cdd983b9-664c-4a7e-9204-dce0ebf6ad36',
  'd806b454-8901-415a-a9ff-1a2ff5320cdb',
  'dc759bc0-0a20-497b-840b-a8e397fa2475',
  'e4346c46-5772-4a06-a668-36cdf019c128',
  'eab8af73-f1f8-457b-98b4-87ac9a18b538'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-01',
    difficulty = 'easy'
WHERE id IN (
  'bbc11f05-a446-44a3-8275-9f81e313f3c1',
  'fb90d9d3-e1c9-4d5b-908b-3658ca1f95ad'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-02',
    difficulty = 'easy'
WHERE id IN (
  '0b2e3540-e45c-4592-9feb-afd967aa410b',
  '357d01f7-be9b-4321-990e-8f3e083da33d',
  '58a7faf7-a8ee-4732-8181-22a4f7b20bd8',
  '63818596-10ed-4c1b-a620-c3a6aa929d88',
  '891b66c6-b576-4e09-b82d-cd2eaf437123',
  '9a3f183c-c426-47a2-9c8d-e061033c31fd',
  'ab8c6de8-f18a-4354-acdc-b75fbe96a6fa',
  'acd3ecb2-daca-45e1-9766-e3f9a1d7f6df'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-03',
    difficulty = 'medium'
WHERE id IN (
  '0ce8ea73-5f95-4195-8a0b-6f1b61dd5307',
  '2bd78e93-797f-4e2c-a481-7246a2d87b7d',
  '5af22a30-fc19-4fcf-bc6f-aa11b6743b21',
  '5f399426-0614-4950-a174-ad213ee1ed60',
  'a79b66ab-7887-462c-8a78-0a88c1b65397',
  'd85f4ca7-a497-4128-adbc-0fb298c64529',
  'db116672-47f9-4eec-a176-c236d4a2dd5b',
  'f3f2125f-fcc0-4be6-b55a-be1a594b0d40'
);

UPDATE quiz_questions
SET curriculum_status = 'aligned',
    question_usage_scope = 'shared',
    lesson_mapping = 'CSK-DS-01-04',
    difficulty = 'medium'
WHERE id IN (
  '7c184a08-cca9-4f22-9c8b-e5f4883ead38',
  '95545151-c1dd-4b14-b2fd-1719b93303f5'
);

UPDATE quiz_questions
SET curriculum_status = 'out_of_scope',
    question_usage_scope = 'exclude',
    lesson_mapping = NULL
WHERE id IN (
  '05f4ef1b-4af0-464c-9f4f-79424d0d9374',
  '1424846f-27dd-4183-ad88-e8004332934a',
  '248deab1-9e65-4829-8adc-f2af2965bd2c',
  '32f9f115-fd68-4406-9cd0-38c376a175ea',
  '3f49c18b-4213-4a1c-80a8-115a74908236',
  '4f4db782-5129-4c29-8264-600445cf8aee',
  '82ff5c04-ea86-4fd6-b597-ac13a8a8ac14',
  'a9934097-e42f-4efb-8602-ceda08fead77',
  'da34469b-bfea-463d-ae59-4f0254523a50',
  'e414959b-be30-4067-93e8-240d6599a249',
  'e8a56169-d325-4e5a-894e-754e8b9ee201',
  'ee521026-bd56-45e6-9b2f-b9cbc55fca27',
  'f0af6dc3-da27-4773-91ae-7a5ae4bb1693'
);

NOTIFY pgrst, 'reload schema';
