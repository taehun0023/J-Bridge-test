-- N1 세트1 言語知識 大問 배치·순서 정리 (2026-06-28)
-- 기존 재활용 27문에 daimon/subtype 부여, 제외분 삭제, 신규18 포함 전체 sort_order 재계산
BEGIN;

-- 問題1 漢字読み (6)
UPDATE jlpt_mock_set_questions SET daimon=1, subtype='漢字読み'
WHERE id IN ('f7a444ff-4b95-4fa5-b829-7ed6c577668b','29cdccfb-4864-4eb9-a76c-61140f2c4cb8',
  '0af64945-7d22-41e6-bff7-c90d96dade93','b7239398-23db-4a02-827f-3c924632e163',
  '3f9acc50-0c97-445c-89ee-f959baf816a7','1ff29e6d-1226-4b65-96f6-1a4c72dacd38');

-- 問題2 文脈規定 (기존 2)
UPDATE jlpt_mock_set_questions SET daimon=2, subtype='文脈規定'
WHERE id IN ('c44d369b-92fe-42c1-a70f-15d888398dcd','e68ee33e-783b-48d9-ab4a-27f6cd9bc1e8');

-- 問題3 言い換え類義 (기존 4)
UPDATE jlpt_mock_set_questions SET daimon=3, subtype='言い換え類義'
WHERE id IN ('67a16b43-a813-409d-80cb-1e67a74dc387','f32ee747-dfce-40e5-9b86-058fe3cdd198',
  '4d4aed4c-fb93-4bf2-b637-1b413654bca4','230e8f06-f240-481a-8fd8-6eaf652d9851');

-- 問題4 用法 (기존 5)
UPDATE jlpt_mock_set_questions SET daimon=4, subtype='用法'
WHERE id IN ('51ec24fc-234d-4959-8057-6ca9cacdff0d','39314684-4af5-4d94-9c37-8eda55458695',
  '78edd4a4-282b-467d-b422-c64a72af1856','99032969-ce99-44ca-8e58-4527776f5a50',
  '1d8e43f8-0778-4e76-8408-4e011ed7ceb2');

-- 問題5 文法形式の判断 (기존 10)
UPDATE jlpt_mock_set_questions SET daimon=5, subtype='文法形式の判断'
WHERE id IN ('77691047-213e-49c2-9d8d-0d16a37cf009','d332e269-6671-43b4-a2aa-c735c1079a94',
  '147300d9-d8b3-40f5-baf0-bb9f7d6b0853','2b2802c2-ba16-4c4c-8416-4f0ba3c76d26',
  '127b0300-65c9-4488-ae95-4a8d6abf7305','974ad630-1d56-40b0-8857-3dd7cae538e1',
  '791f186f-aa94-49ce-90e3-66857da584c7','def493c3-ce54-4210-acdf-12b62724aa7e',
  '0e3a3494-66ad-4052-bdec-2305c56a0ec7','7386a080-701a-4037-aeaa-6ca65d7df778');

-- 제외분(표기·초과·의미설명형) = daimon 미부여 gengo_chishiki junction 삭제
DELETE FROM jlpt_mock_set_questions
WHERE set_id='aa000001-0000-0000-0000-000000000011'
  AND section='gengo_chishiki' AND daimon IS NULL;

-- 전체 sort_order 재계산 (大問 순)
UPDATE jlpt_mock_set_questions m SET sort_order = s.rn
FROM (
  SELECT id, row_number() OVER (ORDER BY daimon, id) AS rn
  FROM jlpt_mock_set_questions
  WHERE set_id='aa000001-0000-0000-0000-000000000011' AND section='gengo_chishiki'
) s WHERE m.id=s.id;

-- 확인
SELECT daimon, subtype, count(*) FROM jlpt_mock_set_questions
WHERE set_id='aa000001-0000-0000-0000-000000000011' AND section='gengo_chishiki'
GROUP BY daimon, subtype ORDER BY daimon;

COMMIT;
