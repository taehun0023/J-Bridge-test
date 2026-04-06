-- 00152_fix_bj_vocab_slash.sql
-- ビジネス日本語 語彙カテゴリ B6 슬래시 수정
-- 생성일: 2026-04-06
-- 근거: docs/audit/bj_vocabulary_issues.md
-- Rubric: docs/exam_quality_rubric.md B6
-- 방침: UPDATE only. "/" → 한쪽 용어만 남기기 또는 "·" 치환.
--
-- DISMISSED (1건): SSL/TLS — 기술 용어 (option 196d9e97)
--
-- CONFIRMED: 83건 (59문제에서 슬래시 보기 총 84개, DISMISSED 1건 제외)

BEGIN;

-- ============================================================
-- 1. 「案件」 → 안건/프로젝트 (4건: 2 questions × 2 quizzes)
-- ============================================================

-- "안건/프로젝트" → "안건"
UPDATE quiz_question_options SET option_text = '안건' WHERE id = '5d8e8db0-474c-42e5-a12a-bbd16848130d'; -- correct
UPDATE quiz_question_options SET option_text = '안건' WHERE id = 'fe54cf66-1d59-4ed0-abaf-300110bcd997'; -- correct (dup)
UPDATE quiz_question_options SET option_text = '안건' WHERE id = 'e68b7c3c-0100-4813-bf5a-847180a2c063'; -- distractor in 上映
UPDATE quiz_question_options SET option_text = '안건' WHERE id = '38b1231d-be88-49e9-8adc-bff31f1fe310'; -- distractor in 上映 (dup)

-- ============================================================
-- 2. 「有給休暇」 → 지급/긴급 distractor (2건)
-- ============================================================

-- "지급/긴급" → "긴급"
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = '9b4efbe1-53d3-4f12-926e-d0f3c32a3e03';
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = '3e914d0d-cf7f-4c4e-9d77-9880c4cb0d45';

-- ============================================================
-- 3. 「残業」 → 잔업/야근 (2건)
-- ============================================================

-- "잔업/야근" → "야근"
UPDATE quiz_question_options SET option_text = '야근' WHERE id = 'e39f7268-d786-423f-8e87-66c4989e17e2'; -- correct
UPDATE quiz_question_options SET option_text = '야근' WHERE id = 'fb3d251e-a88d-431b-a7fe-5d907c4d90de'; -- correct (dup)

-- ============================================================
-- 4. 「追加開発」 → 중요함 / 핵심 distractor (2건)
-- ============================================================

-- "중요함 / 핵심" → "핵심"
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '89990eee-154a-45bc-9e1c-0fdec11cb2df';
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '77e39e1c-76b5-4efc-ac57-aaf5668928af';

-- ============================================================
-- 5. 「報連相」 → 보고/연락/상담 (2건, horenso compound)
-- ============================================================

-- "보고/연락/상담" → "보고·연락·상담"
UPDATE quiz_question_options SET option_text = '보고·연락·상담' WHERE id = '34cc3b6b-cabb-477d-b2e5-f621e0c9ba17'; -- correct
UPDATE quiz_question_options SET option_text = '보고·연락·상담' WHERE id = '7a43e175-13ba-448b-8769-f4ebe487c97e'; -- correct (dup)

-- ============================================================
-- 6. 「ご査収」 → 검수/수령 확인 (2건 correct + 10건 distractor)
-- ============================================================

-- "검수/수령 확인" → "검수 확인"
-- correct options
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '8e4d77bf-93b0-4f3c-8eff-6fe872d9f75c';
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '9b2401a4-86aa-4344-aa20-88a609459df6';
-- distractors (案件 question)
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = 'df21c72c-f7fd-4267-b659-d3f287ad1d19';
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '61b446cc-3127-421e-8ddb-cd8e889903a2';
-- distractors (ER図 question)
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '26bd4747-55ff-498f-b4f2-b4de5bb0ce70';
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = 'ae739ba1-a42a-41a9-b8d9-b491026d29be';
-- distractors (レビュー会 question)
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = 'b28c7a63-580b-48e7-a995-90c194a46bd9';
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '25cd33b0-b3f8-4dba-9ec5-2fa6bd51ad89';
-- distractors (圧迫 question)
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = 'bb91142f-5517-48e5-bdc0-54d3d3decfd5';
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '3a13b6c4-4189-4ee5-a09f-904e59b59275';
-- distractors (心掛ける question)
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '00c970ca-a628-494d-b2a7-fa589f3ca6c1';
UPDATE quiz_question_options SET option_text = '검수 확인' WHERE id = '5af5c7cc-3df8-4492-9e82-beea7212b07f';

-- ============================================================
-- 7. 「暫定対応」 → 지급/긴급 distractor (2건)
-- ============================================================

-- "지급/긴급" → "긴급"
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = 'b74b8cd7-0a77-4f5f-b77b-6eb31cfcb19b';
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = 'a931ab43-f6d8-4661-9249-72ee82969cc8';

-- ============================================================
-- 8. 「至急」 → 지급/긴급 correct (2건)
-- ============================================================

-- "지급/긴급" → "긴급"
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = 'b8e322da-6942-462d-9d80-d8d997a59110'; -- correct
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = 'e1ad84c0-af29-4402-9e66-8ed3556879b1'; -- correct (dup)

-- ============================================================
-- 9. 「上映」 → 안건/프로젝트 distractor (handled above in section 1)
-- ============================================================

-- ============================================================
-- 10. 「最優先」 → 중요함 / 핵심 distractor (2건)
-- ============================================================

-- "중요함 / 핵심" → "핵심"
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '8b369f1b-7569-475f-bdab-cdfd96c292bb';
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '91afc871-f21e-40c9-af11-6a24d3800167';

-- ============================================================
-- 11. 「創出」 → 중요함 / 핵심 distractor (2건)
-- ============================================================

-- "중요함 / 핵심" → "핵심"
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '5fe46995-ba2d-4e00-af2a-eb26834eaf5d';
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = 'c2df73db-e747-404c-b3b5-1bdc032ff1ae';

-- ============================================================
-- 12. 「肝心」 → 중요함 / 핵심 correct (2건)
-- ============================================================

-- "중요함 / 핵심" → "핵심"
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '680316c2-5bc6-476e-b93b-7c14762d38d0'; -- correct
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '4d7a43c9-45a6-4953-8fa8-e2351bf016c3'; -- correct (dup)

-- ============================================================
-- 13. 「遠隔」 → 지급/긴급 distractor (2건)
-- ============================================================

-- "지급/긴급" → "긴급"
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = 'fca39bac-f2c0-4001-bacc-b0f4007894db';
UPDATE quiz_question_options SET option_text = '긴급' WHERE id = '074bb4ed-616c-4eb7-bfd5-31b3058f330d';

-- ============================================================
-- 14. 「障害」 → 잔업/야근 distractor (2건)
-- ============================================================

-- "잔업/야근" → "야근"
UPDATE quiz_question_options SET option_text = '야근' WHERE id = 'edfdbd83-02fd-4dfd-84de-52f4c441bb52';
UPDATE quiz_question_options SET option_text = '야근' WHERE id = 'b2f7fe2c-94f3-4882-9adb-fa0c1a1ebab8';

-- ============================================================
-- 15. 「一貫する」 → 중요함 / 핵심 distractor (2건)
-- ============================================================

-- "중요함 / 핵심" → "핵심"
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = 'bb03fa89-8100-4899-9508-fcc3bcc3ccd1';
UPDATE quiz_question_options SET option_text = '핵심' WHERE id = '442e6326-8a9d-4c2c-b4d5-f14368aba718';

-- ============================================================
-- 16. 「バックログ」 → 미착수 작업/요건 목록 (1건)
-- ============================================================

-- "미착수 작업/요건 목록" → "미착수 작업 목록"
UPDATE quiz_question_options SET option_text = '미착수 작업 목록' WHERE id = 'f3453cac-6b17-4ca4-9c19-2a3493711acb'; -- correct

-- ============================================================
-- 17. 「ミーティング」 → 4개 보기 전부 슬래시 (4건)
-- ============================================================

-- "회의 / 미팅" → "회의"
UPDATE quiz_question_options SET option_text = '회의' WHERE id = '34be843d-1cec-44ef-b1f6-f78a1b17780a'; -- correct
-- "면접 / 인터뷰" → "면접"
UPDATE quiz_question_options SET option_text = '면접' WHERE id = '87512174-1c44-4ba5-a9e2-7b9247f542e8';
-- "발표 / 프레젠테이션" → "발표"
UPDATE quiz_question_options SET option_text = '발표' WHERE id = 'e9786033-1cf0-494c-873d-f78c4e727b46';
-- "연수 / 트레이닝" → "연수"
UPDATE quiz_question_options SET option_text = '연수' WHERE id = '9b3e6702-45bc-4f33-84ab-a9c68d548178';

-- ============================================================
-- 18. 「不具合」 → 버그 / 결함 (1건)
-- ============================================================

-- "버그 / 결함" → "버그"
UPDATE quiz_question_options SET option_text = '버그' WHERE id = 'df684e18-45ad-43fd-b915-3ef724e3eeb4'; -- correct

-- ============================================================
-- 19. 「仕様」 → 사양 / 스펙 (1건)
-- ============================================================

-- "사양 / 스펙" → "사양"
UPDATE quiz_question_options SET option_text = '사양' WHERE id = 'c45691ac-bb17-4588-8e5c-0436ac4d72e5'; -- correct

-- ============================================================
-- 20. 「マイグレーション」 → DB 스키마 변경 / 시스템 이행 관리 (1건)
-- ============================================================

-- "DB 스키마 변경 / 시스템 이행 관리" → "DB 스키마 변경·시스템 이행 관리"
UPDATE quiz_question_options SET option_text = 'DB 스키마 변경·시스템 이행 관리' WHERE id = 'c942414b-e923-4a64-9d78-e5cdaed7b3c3'; -- correct

-- ============================================================
-- 21. 「リソース」 → 자원 (인력/시간/예산/서버 등) (1건)
-- ============================================================

-- "자원 (인력/시간/예산/서버 등)" → "자원 (인력·시간·예산·서버 등)"
UPDATE quiz_question_options SET option_text = '자원 (인력·시간·예산·서버 등)' WHERE id = '9ba90d42-c4ff-41c6-a9b9-3c9f6ce35f58'; -- correct

-- ============================================================
-- 22. 「マイルストーン」 → 주요 이정표 / 목표 지점 (1건)
-- ============================================================

-- "프로젝트의 주요 이정표 / 목표 지점" → "프로젝트의 주요 이정표"
UPDATE quiz_question_options SET option_text = '프로젝트의 주요 이정표' WHERE id = '230cb22b-2eb8-47a5-8424-2efc7b30b682'; -- correct

-- ============================================================
-- 23. 「エスカレーション」 → 보고/인계 (1건)
-- ============================================================

-- "문제를 상위자에게 보고/인계하는 것" → "문제를 상위자에게 보고·인계하는 것"
UPDATE quiz_question_options SET option_text = '문제를 상위자에게 보고·인계하는 것' WHERE id = '005318e4-cb6e-4afc-9c7a-b281c237dad9'; -- correct

-- ============================================================
-- 24. 「結合テスト」 → 4개 보기 전부 슬래시 (4건)
-- ============================================================

-- "단위 테스트 / 유닛 테스트" → "단위 테스트"
UPDATE quiz_question_options SET option_text = '단위 테스트' WHERE id = '7d88206e-d2ae-4e80-85aa-7a51726c7af1';
-- "성능 테스트 / 부하 테스트" → "성능 테스트"
UPDATE quiz_question_options SET option_text = '성능 테스트' WHERE id = 'd3e52385-4f6d-440a-a78a-b8ebcb2cae5b';
-- "결합 테스트 / 통합 테스트" → "결합 테스트"
UPDATE quiz_question_options SET option_text = '결합 테스트' WHERE id = '24270bc2-8815-4473-ac5a-24b65e3e5ec6'; -- correct
-- "회귀 테스트 / 리그레션 테스트" → "회귀 테스트"
UPDATE quiz_question_options SET option_text = '회귀 테스트' WHERE id = '9cabcb67-e007-4748-9898-8b29f5b60cef';

-- ============================================================
-- 25. 「冗長化」 → 4개 보기 전부 슬래시 (4건)
-- ============================================================

-- "최적화 / 튜닝" → "최적화"
UPDATE quiz_question_options SET option_text = '최적화' WHERE id = '5450fa76-e0ef-4b42-9b2d-9f9ea7fa7be7';
-- "간소화 / 경량화" → "간소화"
UPDATE quiz_question_options SET option_text = '간소화' WHERE id = 'ccdbf402-624b-4f5c-9880-da26bad0e3f4';
-- "자동화 / 스크립트화" → "자동화"
UPDATE quiz_question_options SET option_text = '자동화' WHERE id = '3947d2f5-5429-4afb-b4af-a88d6c7a0b09';
-- "이중화 / 다중화" → "이중화"
UPDATE quiz_question_options SET option_text = '이중화' WHERE id = '6ba6a089-5445-4020-b1fc-c82e4934ace8'; -- correct

-- ============================================================
-- 26. 「工数」 → 4개 보기 전부 슬래시: parenthetical enumerations (4건)
-- ============================================================

-- "공정 (작업 단계/절차)" → "공정 (작업 단계·절차)"
UPDATE quiz_question_options SET option_text = '공정 (작업 단계·절차)' WHERE id = 'ac88da85-c911-4120-bf5e-f16e714219bb';
-- "공수 (작업량/인월)" → "공수 (작업량·인월)"
UPDATE quiz_question_options SET option_text = '공수 (작업량·인월)' WHERE id = '655c9942-7706-420e-ae84-cdf48d713b36'; -- correct
-- "공통 (공유 모듈/라이브러리)" → "공통 (공유 모듈·라이브러리)"
UPDATE quiz_question_options SET option_text = '공통 (공유 모듈·라이브러리)' WHERE id = 'cd836b2b-d5a8-405f-b59a-456c96fcaa15';
-- "공개 (외부 공개/릴리스)" → "공개 (외부 공개·릴리스)"
UPDATE quiz_question_options SET option_text = '공개 (외부 공개·릴리스)' WHERE id = '16c4a30d-e7ea-4c2c-8818-dc91aa7a7318';

-- ============================================================
-- 27. 「外部設計」 → UI/UX 설계 (1건)
-- ============================================================

-- "외부 설계 (UI/UX 설계)" → "외부 설계 (UI·UX 설계)"
UPDATE quiz_question_options SET option_text = '외부 설계 (UI·UX 설계)' WHERE id = '73b570df-337c-429e-9991-dd072c50b6b0'; -- correct

-- ============================================================
-- 28. 「進捗」 → 4개 보기 전부 슬래시 (4건)
-- ============================================================

-- "완료 / 종료 처리" → "완료 처리"
UPDATE quiz_question_options SET option_text = '완료 처리' WHERE id = '63214c74-891e-456a-9e12-4efe8ba5aa91';
-- "지연 / 일정 초과" → "지연"
UPDATE quiz_question_options SET option_text = '지연' WHERE id = '4c096644-7394-475b-81da-21eecbe60a6b';
-- "진척 / 진행 상황" → "진척"
UPDATE quiz_question_options SET option_text = '진척' WHERE id = 'c50cfa0e-ac9d-4fb9-abbe-86f7958e329a'; -- correct
-- "보류 / 대기 상태" → "보류"
UPDATE quiz_question_options SET option_text = '보류' WHERE id = 'b44e4889-2723-4309-a642-f3c8df4ff8e4';

-- ============================================================
-- 29. 「ポストモーテム」 → 장애/프로젝트 후... (1건)
-- ============================================================

-- "장애/프로젝트 후 원인 분석 및 재발 방지 회고" → "장애·프로젝트 후 원인 분석 및 재발 방지 회고"
UPDATE quiz_question_options SET option_text = '장애·프로젝트 후 원인 분석 및 재발 방지 회고' WHERE id = '268b5895-a57d-4599-b2e0-73065eaca32d'; -- correct

-- ============================================================
-- 30. 「デプロイパイプライン」 → 빌드/테스트/배포... (1건)
-- ============================================================

-- "빌드/테스트/배포를 자동화한 일련의 프로세스" → "빌드·테스트·배포를 자동화한 일련의 프로세스"
UPDATE quiz_question_options SET option_text = '빌드·테스트·배포를 자동화한 일련의 프로세스' WHERE id = '3b1a30d6-0a3d-43af-8b7f-8f34e9104230'; -- correct

-- ============================================================
-- 31. 「非機能要件」 → 2개 보기 슬래시 (2건)
-- ============================================================

-- "비기능 요건 (성능/보안/가용성 등)" → "비기능 요건 (성능·보안·가용성 등)"
UPDATE quiz_question_options SET option_text = '비기능 요건 (성능·보안·가용성 등)' WHERE id = '4463d682-607e-4974-b58c-a200b209b5f4'; -- correct
-- "기능 요건 (업무 로직/화면 요건)" → "기능 요건 (업무 로직·화면 요건)"
UPDATE quiz_question_options SET option_text = '기능 요건 (업무 로직·화면 요건)' WHERE id = 'db6160c0-17f6-4e0c-b75d-6430b90a9989';

-- ============================================================
-- 32. 「デグレード」 → 2개 보기 슬래시 (2건)
-- ============================================================

-- "업그레이드 (기능 개선/버전 향상)" → "업그레이드 (기능 개선·버전 향상)"
UPDATE quiz_question_options SET option_text = '업그레이드 (기능 개선·버전 향상)' WHERE id = 'd2f210d5-8c87-4e02-ba4c-b1d973c02d73';
-- "리팩토링 (코드 구조 개선/정리)" → "리팩토링 (코드 구조 개선·정리)"
UPDATE quiz_question_options SET option_text = '리팩토링 (코드 구조 개선·정리)' WHERE id = '23334c50-d9dd-4823-afb2-7a4d8dbc5ded';

-- ============================================================
-- 33. 「死活監視」 → 생사 감시 / 헬스 체크 (1건)
-- ============================================================

-- "생사 감시 / 헬스 체크" → "생사 감시"
UPDATE quiz_question_options SET option_text = '생사 감시' WHERE id = '66bd43e6-85f6-408e-bd49-79d9012b20d0'; -- correct

-- ============================================================
-- 34. 「暫定対応」(上級 4-choice) → 4개 보기 전부 슬래시 (4건)
-- ============================================================

-- "영구 대응 / 근본적 해결 조치" → "영구 대응"
UPDATE quiz_question_options SET option_text = '영구 대응' WHERE id = 'dec0b793-0ba2-4f13-b48c-c1f738322f14';
-- "임시 대응 / 워크어라운드" → "임시 대응"
UPDATE quiz_question_options SET option_text = '임시 대응' WHERE id = '5938f749-2bb0-44f2-aed3-74e2e28b8d8a'; -- correct
-- "긴급 배포 / 핫픽스 적용" → "긴급 배포"
UPDATE quiz_question_options SET option_text = '긴급 배포' WHERE id = '3f085545-9469-4d39-80e0-87331f4bbeb6';
-- "롤백 처리 / 이전 버전 복원" → "롤백 처리"
UPDATE quiz_question_options SET option_text = '롤백 처리' WHERE id = 'af9d59b7-b101-47a9-8129-3d57d643d568';

-- ============================================================
-- 35. 「恒久対応」 → 4개 보기 전부 슬래시 (4건)
-- ============================================================

-- "임시 대응 / 워크어라운드 적용" → "임시 대응"
UPDATE quiz_question_options SET option_text = '임시 대응' WHERE id = 'b069b75b-a1b0-4a99-a73c-ff74cb97c3fc';
-- "긴급 패치 / 핫픽스 배포" → "긴급 패치"
UPDATE quiz_question_options SET option_text = '긴급 패치' WHERE id = '290e74b5-f7d8-4d02-8487-7416e31ab0fc';
-- "영구 대응 / 근본 해결" → "영구 대응"
UPDATE quiz_question_options SET option_text = '영구 대응' WHERE id = '12537b97-3f86-4350-a5ac-de43b814774a'; -- correct
-- "장애 전파 / 에스컬레이션 처리" → "장애 전파"
UPDATE quiz_question_options SET option_text = '장애 전파' WHERE id = '36bbbeac-c69e-44a3-899c-6f60ada000d3';

-- ============================================================
-- DISMISSED: 「HTTP」と「HTTPS」の違い — SSL/TLS は技術用語
-- option 196d9e97: "HTTPS는 HTTP에 SSL/TLS 암호화가 추가된 것이다" → skip
-- ============================================================

COMMIT;
