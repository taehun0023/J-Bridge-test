-- Migrate remaining unset database/security source-bank questions into the comprehensive track
-- and assign explicit difficulty. This follows the rule that these rows are not understanding-test
-- items; category-relevant rows should live in the comprehensive pool rather than stay difficulty-null.

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'easy'
WHERE id IN (
  -- database: broad concept / syntax-level but still category-relevant
  '1d5c7995-c7a7-4fbb-8d44-9ec75dd14b24', -- NULL
  '2fb8ea21-70ae-4bca-93b4-8437b461fa2e', -- relational db
  '16604894-477a-4ffa-9793-0b233a716cac', -- DELETE
  '1893de19-ef11-466b-9e84-a5ece87054c4', -- ORDER BY
  '5f7efa04-3212-4683-9078-10cfd627efaa', -- SELECT
  '87b1cb20-f875-4dc5-a513-e0428ef87727', -- INSERT
  '8cefc3cf-ffa4-4bff-b181-8778c9932b63', -- column
  '94b6bae9-00c7-487b-bff9-1742711f625a', -- foreign key
  'bfff1ab2-8dac-46f3-89a0-9f79b9e15c01', -- database
  'c9dd6414-7e80-409e-9908-73016442b448', -- row
  'cb3c466b-5b2c-4cc9-828b-d5e528f634a5', -- select command
  'e3df37ee-7f89-4384-b3d8-40d33036f830', -- update
  'e9b83c3d-14ab-44e0-93b4-eae0fb29d4b6', -- where
  -- security: broad category concepts
  '0909aee6-e229-487d-89e6-ce7db0524f08', -- unauthorized access law
  '09f21c86-464d-489e-afa2-bb5dc0ec4025', -- antivirus
  '17689073-dd5e-4643-89fa-4dc0fc7be96f', -- zero day
  '1ad64e11-5311-41f8-9343-2dde578f9227', -- patch
  '2881d971-0dc6-4983-9d61-72b25475c5e7', -- social engineering
  '559e6d30-63af-41ba-ad25-343f5febeec5', -- biometrics
  '67d77013-e876-4fb6-b1a7-b7e4b7ce2a49', -- security policy
  '829ec65f-7be5-4e11-a261-9fa19b555541', -- access rights
  '8a8df579-b18c-4bc5-957e-c32c0d900b67', -- CIA
  '900d752c-7787-459f-b23a-fe073975b7c8', -- spam
  'b30fae2a-28ac-4962-b270-1ae43b5173e7'  -- personal information law
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'medium'
WHERE id IN (
  -- database: concept/comparison/application
  '0f2afa04-2f24-442c-87c9-80f9646e2e01', -- inner join
  '10f7e87c-2916-4a75-b9fe-2699b8461faf', -- left join
  '21e6ec52-718c-4af8-84b5-9deede0bcaa7', -- NoSQL
  '3290312f-a4ab-4b97-ac4c-7799cbd5ad91', -- projection
  '3326e74e-edaa-4e3c-8bdc-4889f71d72b0', -- SQL injection
  '4dcd913d-1115-481d-8ac2-5283e177bc43', -- B+ tree advantage
  '5229f0fb-e78e-4332-8dc4-073f1a3dd275', -- WAL
  '69b0cd82-b205-42c6-9581-7db9a6d2f8e2', -- concurrency control
  '705e1061-2fed-4942-a9bf-6ab54c79063c', -- stored procedure
  '79b6c58a-96f8-4460-98f1-9c99cc87ea2c', -- SQL injection
  'ae006e3a-9421-41d3-b13d-257e182469d0', -- hash collision
  'b951374a-7136-4903-b782-6b82bd38d1c6', -- subquery
  'c5ba65ff-692f-4327-896e-a73fbf474320', -- group by
  'd2d04afb-fb4c-4240-b3c1-86cbe48321f1', -- backup
  'd54c38e8-1cd4-4247-b9b1-1e7d55c5cb13', -- selection
  'dab80a3d-5ff4-4834-84db-5b651e46d5ab', -- view
  'dbccd74f-75e8-4704-bf42-ff7c969e2b01', -- selection operator
  -- security: still category-relevant but beyond understanding lessons
  '1e97a90c-19ff-4c9a-a4c4-8c3e8c0dd642', -- digital signature
  '3fe46a92-541c-47e1-8031-694c8ac99c44', -- ransomware
  '4777a3e5-a2c1-49e6-ae2c-f69133be3e55', -- trojan
  '50993547-3ca3-4e44-8cef-95eb95c18255', -- collision
  '50f3c0f0-ff30-49aa-9990-124e31b69af5', -- certificate
  '5190d26a-f2e3-448a-ac41-859caddf1226', -- DDoS
  '5f0a7731-4c7e-4c6e-aa09-7e67b31d0684', -- symmetric crypto
  '5f414647-8e1d-4bc3-89e8-911f7298c9e6', -- VPN
  '665d43f9-b190-4637-bbdf-854c0a75761e', -- malware
  '6c79e7bf-dc03-4dab-bbb6-72cc9087e89f', -- zero-day exploit
  '77949c87-0a67-4ace-8798-1376d1f2d5ad', -- IDS
  '8b19f193-eeed-4c0f-9788-96f832eed1ba', -- pentest
  'a2bf76e6-db83-4afb-9790-8077751e5d73', -- session hijack
  'c20c8110-5eb8-48e5-8bce-f6978c6be3e4', -- firewall
  'e40a6bcb-50b1-4bd0-b881-f3ee632a09ea', -- brute force
  'e82bacc7-216d-4bfc-a3a1-03d6c12c0a84', -- ISMS
  'f4cae4c3-e722-44b7-92ee-36e1cd3f20d0'  -- ransomware
);

UPDATE quiz_questions
SET curriculum_status = 'adaptable',
    question_usage_scope = 'comprehensive_only',
    difficulty = 'hard'
WHERE id IN (
  -- database: advanced / theory-heavy
  '00f25bd9-b6d1-4203-8bb6-644286cbf24f', -- HAVING
  '2600ac0d-c805-4d24-a1b6-e6625c8cd55f', -- normalization
  '654e0427-d22c-4bf6-a833-7e0438dfc3b0', -- 2NF target
  '660bc9ed-d8ab-433c-af37-a36bfb37267c', -- 1NF
  '7236f099-4945-483d-8fb7-668f004623ad', -- hash avg lookup
  'a82cbd81-893e-40fa-b075-3ca9a9c57375', -- 2NF
  'd10a8984-8f6d-478e-a203-21369e49033b', -- open addressing
  'ec0e87f1-f2a3-4af2-b4c7-daad0986a714', -- 2PC
  'ed2b4706-f0ad-4318-8392-42d2147c80d9', -- array index
  'eea7cb24-1363-43a1-9990-e2520d1eecca', -- 3NF
  -- security: advanced crypto / infra
  '072a76df-e7c2-40da-b5fb-297869e83481', -- AES
  '158ddbe8-e11a-4731-b6ee-9cd706b2d4fa', -- RSA
  '1e200014-e752-4437-97fb-b34b19d5f9c9', -- asymmetric crypto
  '896270d4-c380-4530-af66-e9a45dfc1b0a', -- hash function
  'af76b081-b6c2-4843-9498-b85c1f1907d6', -- hybrid crypto
  'd8d4b83b-a5d9-4fa9-94f8-6a24624f311b', -- PKI
  'e2c26b96-ff3f-4132-8d31-bb5cde7d9c22', -- chaining
  'e4d2a050-4c7c-40e9-8ef0-79c24f9e3e82'  -- public-key crypto
);

NOTIFY pgrst, 'reload schema';
