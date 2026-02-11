-- ============================================
-- Quiz 2: IT 일본어 능력 평가 (90 questions)
-- question_category: 'vocab', 'reading', 'fill_blank'
-- Each category: 30 questions (easy 10, medium 10, hard 10)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- ==========================================
  -- VOCAB category (30 questions, sort_order 1-30)
  -- ==========================================

  -- vocab easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「実装する」(じっそうする) の意味は？', '実装する(じっそうする)は「구현하다」という意味のIT用語です。', 1, 1, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설계하다', FALSE, 1),
    (gen_random_uuid(), q_id, '구현하다', TRUE, 2),
    (gen_random_uuid(), q_id, '배포하다', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「環境構築」の意味は？', '環境構築(かんきょうこうちく)は「환경 구축」という意味です。開発環境のセットアップを指します。', 1, 2, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '환경 구축', TRUE, 1),
    (gen_random_uuid(), q_id, '환경 설정', FALSE, 2),
    (gen_random_uuid(), q_id, '환경 변수', FALSE, 3),
    (gen_random_uuid(), q_id, '환경 테스트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「画面」(がめん) の意味は？', '画面(がめん)は「화면」という意味のIT基本用語です。', 1, 3, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기능', FALSE, 1),
    (gen_random_uuid(), q_id, '항목', FALSE, 2),
    (gen_random_uuid(), q_id, '화상', FALSE, 3),
    (gen_random_uuid(), q_id, '화면', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「修正」(しゅうせい) の意味は？', '修正(しゅうせい)は「수정」という意味です。バグ修正などで使います。', 1, 4, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '삭제', FALSE, 1),
    (gen_random_uuid(), q_id, '작성', FALSE, 2),
    (gen_random_uuid(), q_id, '추가', FALSE, 3),
    (gen_random_uuid(), q_id, '수정', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「不具合」(ふぐあい) の意味は？', '不具合(ふぐあい)は「버그/결함」という意味です。ソフトウェアの問題を指します。', 1, 5, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 1),
    (gen_random_uuid(), q_id, '버그 / 결함', TRUE, 2),
    (gen_random_uuid(), q_id, '기능 추가', FALSE, 3),
    (gen_random_uuid(), q_id, '업데이트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「仕様」(しよう) の意味は？', '仕様(しよう)は「사양/스펙」という意味のIT用語です。', 1, 6, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양 / 스펙', TRUE, 1),
    (gen_random_uuid(), q_id, '사용 방법', FALSE, 2),
    (gen_random_uuid(), q_id, '설정 항목', FALSE, 3),
    (gen_random_uuid(), q_id, '시험 계획', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「テスト」の意味は？', 'テストはソフトウェアの「테스트」を意味します。', 1, 7, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배포 작업', FALSE, 1),
    (gen_random_uuid(), q_id, '설계 작업', FALSE, 2),
    (gen_random_uuid(), q_id, '분석 작업', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「データベース」の意味は？', 'データベースは「데이터베이스」を意味するIT基本用語です。', 1, 8, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 분석', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터 센터', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 전송', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「設計」(せっけい) の意味は？', '設計(せっけい)は「설계」という意味のIT用語です。', 1, 9, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설치', FALSE, 1),
    (gen_random_uuid(), q_id, '설계', TRUE, 2),
    (gen_random_uuid(), q_id, '설정', FALSE, 3),
    (gen_random_uuid(), q_id, '설명', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「開発」(かいはつ) の意味は？', '開発(かいはつ)は「개발」という意味です。ソフトウェア開発の基本用語です。', 1, 10, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개선', FALSE, 1),
    (gen_random_uuid(), q_id, '개시', FALSE, 2),
    (gen_random_uuid(), q_id, '개발', TRUE, 3),
    (gen_random_uuid(), q_id, '개요', FALSE, 4);

  -- vocab medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「結合テスト」(けつごうテスト) の意味は？', '結合テストは「결합 테스트/통합 테스트」で、モジュール間の連携を確認するテストです。', 1, 11, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '단위 테스트 / 유닛 테스트', FALSE, 1),
    (gen_random_uuid(), q_id, '성능 테스트 / 부하 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '결합 테스트 / 통합 테스트', TRUE, 3),
    (gen_random_uuid(), q_id, '회귀 테스트 / 리그레션 테스트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「要件定義」(ようけんていぎ) の意味は？', '要件定義は「요건 정의」で、システム開発の最初の工程です。', 1, 12, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요건 정의', TRUE, 1),
    (gen_random_uuid(), q_id, '기본 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '상세 설계', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 리뷰', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「排他制御」(はいたせいぎょ) の意味は？', '排他制御は「배타 제어」で、同時アクセスを制御する仕組みです。', 1, 13, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '접근 권한 제어 (인가 처리)', FALSE, 1),
    (gen_random_uuid(), q_id, '배타 제어 (동시 접근 제어)', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터 암호화 (보안 처리)', FALSE, 3),
    (gen_random_uuid(), q_id, '캐시 무효화 (갱신 처리)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「冗長化」(じょうちょうか) の意味は？', '冗長化は「이중화/다중화」で、システムの可用性を高める手法です。', 1, 14, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '최적화 / 튜닝', FALSE, 1),
    (gen_random_uuid(), q_id, '간소화 / 경량화', FALSE, 2),
    (gen_random_uuid(), q_id, '자동화 / 스크립트화', FALSE, 3),
    (gen_random_uuid(), q_id, '이중화 / 다중화', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「脆弱性」(ぜいじゃくせい) の意味は？', '脆弱性は「취약성」で、セキュリティの弱点を指します。', 1, 15, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취약성', TRUE, 1),
    (gen_random_uuid(), q_id, '안전성', FALSE, 2),
    (gen_random_uuid(), q_id, '신뢰성', FALSE, 3),
    (gen_random_uuid(), q_id, '확장성', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「納品」(のうひん) の意味は？', '納品は「납품」で、成果物を顧客に引き渡すことです。', 1, 16, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '발주', FALSE, 1),
    (gen_random_uuid(), q_id, '수주', FALSE, 2),
    (gen_random_uuid(), q_id, '견적', FALSE, 3),
    (gen_random_uuid(), q_id, '납품', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「工数」(こうすう) の意味は？', '工数は「공수/인건비」で、作業にかかる人月を表します。', 1, 17, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공정 (작업 단계/절차)', FALSE, 1),
    (gen_random_uuid(), q_id, '공수 (작업량/인월)', TRUE, 2),
    (gen_random_uuid(), q_id, '공통 (공유 모듈/라이브러리)', FALSE, 3),
    (gen_random_uuid(), q_id, '공개 (외부 공개/릴리스)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「外部設計」(がいぶせっけい) の意味は？', '外部設計は「외부 설계」で、ユーザーインターフェースの設計を指します。', 1, 18, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '외부 설계 (UI/UX 설계)', TRUE, 1),
    (gen_random_uuid(), q_id, '내부 설계 (모듈 상세 설계)', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 설계 (ER 설계)', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크 설계 (인프라 설계)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「進捗」(しんちょく) の意味は？', '進捗は「진척」で、プロジェクトの進行状況を指します。', 1, 19, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '완료 / 종료 처리', FALSE, 1),
    (gen_random_uuid(), q_id, '지연 / 일정 초과', FALSE, 2),
    (gen_random_uuid(), q_id, '진척 / 진행 상황', TRUE, 3),
    (gen_random_uuid(), q_id, '보류 / 대기 상태', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「見積もり」(みつもり) の意味は？', '見積もりは「견적」で、費用や工数の概算を指します。', 1, 20, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '청구', FALSE, 1),
    (gen_random_uuid(), q_id, '계약', FALSE, 2),
    (gen_random_uuid(), q_id, '발주', FALSE, 3),
    (gen_random_uuid(), q_id, '견적', TRUE, 4);

  -- vocab hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「可用性」(かようせい) の意味は？', '可用性は「가용성」で、システムが利用可能な状態を維持する度合いです。', 1, 21, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '확장성 (Scalability)', FALSE, 1),
    (gen_random_uuid(), q_id, '가용성 (Availability)', TRUE, 2),
    (gen_random_uuid(), q_id, '보안성 (Security)', FALSE, 3),
    (gen_random_uuid(), q_id, '이식성 (Portability)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「疎結合」(そけつごう) の意味は？', '疎結合は「느슨한 결합(Loose Coupling)」で、モジュール間の依存度が低い設計を指します。', 1, 22, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '긴밀한 결합 (Tight Coupling)', FALSE, 1),
    (gen_random_uuid(), q_id, '의존성 주입 (Dependency Injection)', FALSE, 2),
    (gen_random_uuid(), q_id, '느슨한 결합 (Loose Coupling)', TRUE, 3),
    (gen_random_uuid(), q_id, '데이터 바인딩 (Data Binding)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「非機能要件」(ひきのうようけん) の意味は？', '非機能要件は「비기능 요건」で、性能、セキュリティ、可用性などシステムの品質に関する要件です。', 1, 23, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비기능 요건 (성능/보안/가용성 등)', TRUE, 1),
    (gen_random_uuid(), q_id, '기능 요건 (업무 로직/화면 요건)', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 설계서 (UI 레이아웃 정의)', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 계획서 (검증 절차 정의)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「デグレード」(デグレ) の意味は？', 'デグレードは「디그레이드/기능 퇴행」で、修正により他の機能が壊れることです。', 1, 24, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '업그레이드 (기능 개선/버전 향상)', FALSE, 1),
    (gen_random_uuid(), q_id, '다운그레이드 (이전 버전 복원)', FALSE, 2),
    (gen_random_uuid(), q_id, '리팩토링 (코드 구조 개선/정리)', FALSE, 3),
    (gen_random_uuid(), q_id, '디그레이드 (수정으로 인한 기능 퇴행)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「方式設計」(ほうしきせっけい) の意味は？', '方式設計は「방식 설계」で、システムの技術的なアーキテクチャを決定する設計工程です。', 1, 25, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방식 설계 (아키텍처 설계)', TRUE, 1),
    (gen_random_uuid(), q_id, '화면 설계 (UI 레이아웃 설계)', FALSE, 2),
    (gen_random_uuid(), q_id, 'DB 설계 (테이블 정규화 설계)', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크 설계 (통신 구성 설계)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「回帰テスト」(かいきテスト) の意味は？', '回帰テストは「회귀 테스트(Regression Test)」で、修正後に既存機能が正常か確認するテストです。', 1, 26, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '단위 테스트 (Unit Test)', FALSE, 1),
    (gen_random_uuid(), q_id, '부하 테스트 (Load Test)', FALSE, 2),
    (gen_random_uuid(), q_id, '회귀 테스트 (Regression Test)', TRUE, 3),
    (gen_random_uuid(), q_id, '인수 테스트 (Acceptance Test)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「死活監視」(しかつかんし) の意味は？', '死活監視は「생사 감시/헬스 체크」で、サーバーが稼働中かを確認する監視です。', 1, 27, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '성능 모니터링 (리소스 감시)', FALSE, 1),
    (gen_random_uuid(), q_id, '로그 분석 (이벤트 추적 감시)', FALSE, 2),
    (gen_random_uuid(), q_id, '보안 감사 (취약점 탐지 감시)', FALSE, 3),
    (gen_random_uuid(), q_id, '생사 감시 / 헬스 체크', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「負荷分散」(ふかぶんさん) の意味は？', '負荷分散は「부하 분산(Load Balancing)」で、トラフィックを複数サーバーに分散する技術です。', 1, 28, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부하 분산 (Load Balancing)', TRUE, 1),
    (gen_random_uuid(), q_id, '부하 테스트 (Load Testing)', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 분산 (Data Sharding)', FALSE, 3),
    (gen_random_uuid(), q_id, '캐시 분산 (Cache Distribution)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「暫定対応」(ざんていたいおう) の意味は？', '暫定対応は「임시 대응/워크어라운드」で、恒久対応までの一時的な対処を指します。', 1, 29, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영구 대응 / 근본적 해결 조치', FALSE, 1),
    (gen_random_uuid(), q_id, '임시 대응 / 워크어라운드', TRUE, 2),
    (gen_random_uuid(), q_id, '긴급 배포 / 핫픽스 적용', FALSE, 3),
    (gen_random_uuid(), q_id, '롤백 처리 / 이전 버전 복원', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「恒久対応」(こうきゅうたいおう) の意味は？', '恒久対応は「영구 대응/근본 해결」で、根本的な問題解決を指します。', 1, 30, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '임시 대응 / 워크어라운드 적용', FALSE, 1),
    (gen_random_uuid(), q_id, '긴급 패치 / 핫픽스 배포', FALSE, 2),
    (gen_random_uuid(), q_id, '영구 대응 / 근본 해결', TRUE, 3),
    (gen_random_uuid(), q_id, '장애 전파 / 에스컬레이션 처리', FALSE, 4);

  -- ==========================================
  -- READING category (30 questions, sort_order 31-60)
  -- ==========================================

  -- reading easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「ログイン画面でユーザーIDとパスワードを入力し、ログインボタンを押してください。」\nこの文は何の説明ですか？', 'ログイン手順の説明文です。', 1, 31, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비밀번호 재설정 방법에 대한 설명', FALSE, 1),
    (gen_random_uuid(), q_id, '로그인 방법에 대한 설명', TRUE, 2),
    (gen_random_uuid(), q_id, '회원가입 절차에 대한 설명', FALSE, 3),
    (gen_random_uuid(), q_id, '로그아웃 절차에 대한 설명', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「このボタンをクリックすると、データが保存されます。保存が完了すると、確認メッセージが表示されます。」\nボタンをクリックすると何が起きますか？', 'ボタンクリック後の動作説明を読み取る問題です。', 1, 32, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터가 저장되고 확인 메시지가 표시된다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터가 삭제되고 경고 메시지가 표시된다', FALSE, 2),
    (gen_random_uuid(), q_id, '화면이 닫히고 메인 화면으로 이동한다', FALSE, 3),
    (gen_random_uuid(), q_id, '에러가 발생하고 재시도 메시지가 표시된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「エラーが発生した場合は、画面に表示されるエラーメッセージを確認し、担当者に連絡してください。」\nエラーが発生したらどうすればいいですか？', 'エラー発生時の対応手順を読み取る問題です。', 1, 33, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시스템을 재시작하고 다시 작업을 수행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '에러를 무시하고 다음 작업을 계속 진행한다', FALSE, 2),
    (gen_random_uuid(), q_id, '에러 메시지를 확인하고 담당자에게 연락한다', TRUE, 3),
    (gen_random_uuid(), q_id, '브라우저를 닫고 새로운 세션을 시작한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「毎日9時から18時まで、サーバーのバックアップを取ります。バックアップ中は処理が遅くなる場合があります。」\nバックアップについて正しいのは？', 'バックアップのスケジュールと影響についての文章です。', 1, 34, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매일 9시부터 18시까지 백업하며 처리가 느려질 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '주 1회 야간에만 백업하며 서비스에 영향이 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '백업 중에는 시스템을 전혀 사용할 수 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '백업 완료 후 데이터가 자동으로 삭제 처리된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「新しいバージョンをリリースしました。アップデート内容は以下の通りです。\n・ログイン機能の不具合を修正\n・検索速度を改善」\n今回のアップデートで行われたことは？', 'リリースノートの内容を読み取る問題です。', 1, 35, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새로운 결제 기능을 추가하고 UI를 변경함', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스를 이관하고 서버를 교체함', FALSE, 2),
    (gen_random_uuid(), q_id, '보안 패치를 적용하고 디자인을 변경함', FALSE, 3),
    (gen_random_uuid(), q_id, '로그인 버그를 수정하고 검색 속도를 개선함', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「パスワードは8文字以上で、英数字と記号を含めてください。」\nパスワードの条件は？', 'パスワードポリシーを読み取る問題です。', 1, 36, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4자 이상, 숫자만 포함하면 됨', FALSE, 1),
    (gen_random_uuid(), q_id, '6자 이상, 영문자만 포함하면 됨', FALSE, 2),
    (gen_random_uuid(), q_id, '8자 이상, 영문자+숫자+기호 포함', TRUE, 3),
    (gen_random_uuid(), q_id, '10자 이상, 대문자만 포함하면 됨', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のメールを読んでください。\n「お疲れ様です。明日のミーティングの時間が10時から14時に変更になりました。ご確認ください。」\nメールの内容は？', 'ミーティング時間の変更連絡メールです。', 1, 37, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내일 미팅 시간이 10시에서 14시로 변경됨', TRUE, 1),
    (gen_random_uuid(), q_id, '내일 미팅 장소가 회의실 A로 변경됨', FALSE, 2),
    (gen_random_uuid(), q_id, '내일 미팅 참석자가 추가로 변경됨', FALSE, 3),
    (gen_random_uuid(), q_id, '내일 미팅 안건이 다른 주제로 변경됨', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「テスト環境にデプロイが完了しました。動作確認をお願いします。問題があれば、チケットを作成してください。」\nこの文の依頼事項は？', 'テスト環境デプロイ後の確認依頼です。', 1, 38, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '본번 환경에 즉시 배포를 진행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 코드를 새로 작성한다', FALSE, 2),
    (gen_random_uuid(), q_id, '코드 리뷰를 실시하고 승인한다', FALSE, 3),
    (gen_random_uuid(), q_id, '동작 확인 후 문제가 있으면 티켓을 생성한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「本日のリリースは、サーバーメンテナンスのため、明日に延期します。」\nどういう意味ですか？', 'リリース延期の連絡文です。', 1, 39, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 유지보수가 완료되어 릴리스를 진행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버 유지보수 때문에 릴리스가 내일로 연기된다', TRUE, 2),
    (gen_random_uuid(), q_id, '릴리스가 취소되어 다음 주로 재조정된다', FALSE, 3),
    (gen_random_uuid(), q_id, '릴리스가 오늘 예정대로 정상 진행된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「ファイルをアップロードする前に、ファイルサイズが10MB以下であることを確認してください。」\nアップロード前に確認すべきことは？', 'ファイルアップロードの制限に関する文章です。', 1, 40, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '파일 이름이 규칙에 맞는지 확인한다', FALSE, 1),
    (gen_random_uuid(), q_id, '파일 형식이 지원되는 포맷인지 확인한다', FALSE, 2),
    (gen_random_uuid(), q_id, '파일을 ZIP으로 압축해서 준비한다', FALSE, 3),
    (gen_random_uuid(), q_id, '파일 크기가 10MB 이하인지 확인한다', TRUE, 4);

  -- reading medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の仕様書を読んでください。\n「ユーザーがログインに3回連続で失敗した場合、アカウントを30分間ロックする。ロック解除後、再度ログインが可能となる。」\nこの仕様の条件は？', 'ログインセキュリティの仕様を読み取る問題です。', 1, 41, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3회 연속 로그인 실패 시 30분간 계정 잠금', TRUE, 1),
    (gen_random_uuid(), q_id, '5회 연속 로그인 실패 시 영구적 계정 잠금', FALSE, 2),
    (gen_random_uuid(), q_id, '1회 로그인 실패 시 10분간 계정 잠금', FALSE, 3),
    (gen_random_uuid(), q_id, '3회 연속 로그인 실패 시 비밀번호 초기화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のチケットを読んでください。\n「【不具合】商品検索画面で、カテゴリーフィルターを選択した状態でページネーションを操作すると、フィルターがリセットされる。\n【再現手順】1.カテゴリーを選択 2.次のページへ移動 3.フィルターが解除される\n【期待動作】ページ遷移後もフィルターが維持される」\nこの不具合は？', 'バグチケットの内容を理解する問題です。', 1, 42, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '검색 기능 자체가 전혀 작동하지 않는 버그', FALSE, 1),
    (gen_random_uuid(), q_id, '페이지 이동 시 카테고리 필터가 초기화되는 버그', TRUE, 2),
    (gen_random_uuid(), q_id, '페이지네이션 버튼이 표시되지 않는 버그', FALSE, 3),
    (gen_random_uuid(), q_id, '카테고리 목록이 데이터베이스에서 로드 안 되는 버그', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「今回の改修では、APIのレスポンスタイムを現状の平均500msから200ms以下に短縮することを目標とする。そのため、データベースクエリの最適化とキャッシュの導入を検討する。」\n改修の目標は？', 'パフォーマンス改善の目標と方法を読み取る問題です。', 1, 43, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새로운 API 엔드포인트를 추가하여 기능을 확장', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스를 다른 제품으로 완전히 교체', FALSE, 2),
    (gen_random_uuid(), q_id, 'API 응답 시간을 500ms에서 200ms 이하로 단축', TRUE, 3),
    (gen_random_uuid(), q_id, '서버 대수를 늘려서 트래픽 분산을 최적화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の会議メモを読んでください。\n「【決定事項】\n・リリース日は来週金曜日に確定\n・テスト期間は水曜日まで延長\n・本番デプロイは田中さんが担当\n【宿題】\n・山田さん：テストケースの追加\n・鈴木さん：障害対応手順書の作成」\n田中さんの担当は？', '会議メモから担当者の役割を読み取る問題です。', 1, 44, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트 케이스를 추가 작성하는 담당', FALSE, 1),
    (gen_random_uuid(), q_id, '장애 대응 절차서를 작성하는 담당', FALSE, 2),
    (gen_random_uuid(), q_id, '릴리스 일정을 조정하고 관리하는 담당', FALSE, 3),
    (gen_random_uuid(), q_id, '본번 환경에 배포를 실행하는 담당', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の仕様を読んでください。\n「注文データのCSVエクスポート機能を実装する。出力項目は注文番号、注文日、顧客名、金額の4項目とし、文字コードはUTF-8、区切り文字はカンマとする。」\nCSVの文字コードは？', 'CSV出力仕様を読み取る問題です。', 1, 45, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Shift_JIS', FALSE, 1),
    (gen_random_uuid(), q_id, 'UTF-8', TRUE, 2),
    (gen_random_uuid(), q_id, 'EUC-JP', FALSE, 3),
    (gen_random_uuid(), q_id, 'ISO-8859-1', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のコードレビューコメントを読んでください。\n「この処理ではN+1問題が発生しています。ループ内でDBクエリを実行するのではなく、一括取得してからループ処理を行うようにリファクタリングしてください。」\n指摘されている問題は？', 'コードレビューの指摘内容を理解する問題です。', 1, 46, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SQL 인젝션에 의한 보안 취약점 문제', FALSE, 1),
    (gen_random_uuid(), q_id, '메모리 누수에 의한 리소스 고갈 문제', FALSE, 2),
    (gen_random_uuid(), q_id, 'N+1 문제 (루프 내 DB 쿼리 반복 실행)', TRUE, 3),
    (gen_random_uuid(), q_id, '무한 루프에 의한 프로세스 정지 문제', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の障害報告を読んでください。\n「14時30分にWebサーバーのCPU使用率が100%に達し、応答不能となった。原因はバッチ処理の実行タイミングがピーク時間と重なったためと判明。暫定対応としてバッチ処理を停止し、15時に復旧した。」\n障害の原因は？', '障害報告書から原因を読み取る問題です。', 1, 47, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하드디스크 용량 부족으로 인한 디스크 I/O 에러', FALSE, 1),
    (gen_random_uuid(), q_id, '네트워크 장비 고장으로 인한 통신 두절 장애', FALSE, 2),
    (gen_random_uuid(), q_id, '메모리 부족으로 인한 Out of Memory 에러', FALSE, 3),
    (gen_random_uuid(), q_id, '배치 처리가 피크 시간과 겹쳐서 CPU 사용률 100%', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「本システムはマイクロサービスアーキテクチャを採用し、各サービスはREST APIで通信する。認証にはJWTトークンを使用し、トークンの有効期限は1時間とする。」\n認証方式は？', 'システム仕様から認証方式を読み取る問題です。', 1, 48, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Session 기반 인증 (서버 측 상태 관리)', FALSE, 1),
    (gen_random_uuid(), q_id, 'OAuth 2.0 인증 (외부 프로바이더 연계)', FALSE, 2),
    (gen_random_uuid(), q_id, 'JWT 토큰 인증 (유효기간 1시간 설정)', TRUE, 3),
    (gen_random_uuid(), q_id, 'Basic 인증 (ID/패스워드 직접 전송)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のプルリクエストの説明を読んでください。\n「【変更内容】\nユーザー一覧画面のページネーションを実装しました。\n1ページあたりの表示件数は20件で、総件数も表示します。\n【テスト】\n・0件の場合の表示確認\n・1ページ以下の場合にページネーションが表示されないことを確認」\nテストで確認したことは？', 'PRの説明からテスト内容を読み取る問題です。', 1, 49, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '동시 접속 1000명 시의 응답 속도를 확인', FALSE, 1),
    (gen_random_uuid(), q_id, '0건일 때의 표시와 1페이지 이하일 때 페이지네이션 비표시 확인', TRUE, 2),
    (gen_random_uuid(), q_id, 'XSS 및 SQL 인젝션에 대한 보안 검증을 실시', FALSE, 3),
    (gen_random_uuid(), q_id, '대량 데이터 10만 건 이상에서의 부하 테스트 실시', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「Git運用ルール：developブランチから作業ブランチを切り、作業完了後にdevelopへマージする。mainブランチへのマージはリリース時のみとし、必ずタグを付ける。」\nmainブランチへのマージはいつ行いますか？', 'Git運用ルールを読み取る問題です。', 1, 50, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '작업 완료 시마다 수시로 머지를 실행', FALSE, 1),
    (gen_random_uuid(), q_id, '코드 리뷰가 완료된 직후에 머지 실행', FALSE, 2),
    (gen_random_uuid(), q_id, '매일 정해진 시간에 자동으로 머지 실행', FALSE, 3),
    (gen_random_uuid(), q_id, '릴리스 시에만 머지하고 반드시 태그 부여', TRUE, 4);

  -- reading hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の設計書を読んでください。\n「本システムのデータベース設計において、ユーザーテーブルと注文テーブルは1対多の関係とする。注文テーブルにはuser_idを外部キーとして持ち、CASCADE削除を設定する。これにより、ユーザーが削除された場合、関連する注文データも自動的に削除される。」\nCASCADE削除の意味は？', 'データベース設計のCASCADE削除の仕様を理解する問題です。', 1, 51, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주문 삭제 시 관련 사용자 데이터도 자동으로 삭제된다', FALSE, 1),
    (gen_random_uuid(), q_id, '사용자 삭제 시 관련 주문 데이터도 자동으로 삭제된다', TRUE, 2),
    (gen_random_uuid(), q_id, '외부 키 제약으로 인해 사용자 삭제 자체가 불가능하다', FALSE, 3),
    (gen_random_uuid(), q_id, '주문 데이터는 별도의 배치 처리로 수동 삭제해야 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のアーキテクチャ文書を読んでください。\n「本システムではCQRSパターンを採用する。書き込み操作はCommand側で処理し、RDBMSに永続化する。読み取り操作はQuery側で処理し、読み取り専用のNoSQLデータベースから取得する。データの同期はイベント駆動で非同期に行う。」\nCQRSパターンの特徴として正しいのは？', 'CQRSアーキテクチャパターンの理解を問う問題です。', 1, 52, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '쓰기와 읽기를 분리하고 이벤트 기반으로 비동기 동기화', TRUE, 1),
    (gen_random_uuid(), q_id, '쓰기와 읽기를 같은 DB에서 동기 방식으로 일괄 처리', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 데이터를 NoSQL에만 저장하여 성능을 최적화', FALSE, 3),
    (gen_random_uuid(), q_id, '동기 방식의 2PC 트랜잭션으로 데이터를 동기화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の障害分析レポートを読んでください。\n「根本原因分析（RCA）の結果、今回の障害はデプロイスクリプトにおけるロールバック手順の不備に起因するものと判明した。具体的には、データベースマイグレーションの巻き戻し処理が未実装であったため、デプロイ失敗時にデータの整合性が崩れた。再発防止策として、全マイグレーションにロールバックスクリプトの実装を必須とする。」\n再発防止策は？', '障害分析レポートの再発防止策を読み取る問題です。', 1, 53, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 배포 작업을 당분간 중단하고 재검토한다', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스를 다른 제품으로 전면 교체한다', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 마이그레이션에 롤백 스크립트 구현을 필수화', TRUE, 3),
    (gen_random_uuid(), q_id, '마이그레이션 사용을 중지하고 수동 SQL로 전환', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のSLA文書を読んでください。\n「サービスレベル目標：\n・可用性：99.9%（年間ダウンタイム8.76時間以内）\n・平均応答時間：200ms以下\n・インシデント対応：重大障害は30分以内に一次対応開始\n目標未達の場合、月額利用料の10%を返金する。」\n年間許容ダウンタイムは？', 'SLA文書の可用性指標を読み取る問題です。', 1, 54, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '24시간 이내 (99.7% 가용성 기준)', FALSE, 1),
    (gen_random_uuid(), q_id, '1시간 이내 (99.99% 가용성 기준)', FALSE, 2),
    (gen_random_uuid(), q_id, '8.76시간 이내 (99.9% 가용성 기준)', TRUE, 3),
    (gen_random_uuid(), q_id, '0시간 (100% 가용성, 다운타임 불허)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の技術文書を読んでください。\n「コンテナオーケストレーションにはKubernetesを使用する。Podの水平スケーリングはHPAにより、CPU使用率が70%を超えた場合に自動的にレプリカ数を増加させる。最小レプリカ数は2、最大レプリカ数は10とする。」\nスケーリングの条件は？', 'Kubernetes HPAの設定を読み取る問題です。', 1, 55, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPU 사용률 70% 초과 시 자동 스케일링 (최소2, 최대10)', TRUE, 1),
    (gen_random_uuid(), q_id, '메모리 사용률 80% 초과 시 자동 스케일링 (최소1, 최대5)', FALSE, 2),
    (gen_random_uuid(), q_id, '관리자가 수동으로 레플리카 수를 조정 (최소1, 최대10)', FALSE, 3),
    (gen_random_uuid(), q_id, '시간 기반 스케줄링으로 피크 시간에 자동 확장 (최소2, 최대8)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のCI/CDパイプライン設計書を読んでください。\n「パイプラインは以下の段階で構成する：\n1. ソースコードチェックアウト\n2. 静的解析（SonarQube）\n3. 単体テスト実行\n4. ビルド\n5. 結合テスト実行\n6. ステージング環境デプロイ\n7. 承認ゲート\n8. 本番デプロイ\nいずれかのステージが失敗した場合、パイプラインは停止し、担当者に通知する。」\n承認ゲートはどの段階で行われますか？', 'CI/CDパイプラインの設計を読み取る問題です。', 1, 56, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소스 코드 체크아웃 직후에 승인 게이트를 실행', FALSE, 1),
    (gen_random_uuid(), q_id, '스테이징 환경 배포 후, 본번 배포 전에 승인 게이트 실행', TRUE, 2),
    (gen_random_uuid(), q_id, '단위 테스트 실행 전에 승인 게이트를 실행', FALSE, 3),
    (gen_random_uuid(), q_id, '본번 배포가 완료된 후에 승인 게이트를 실행', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のセキュリティレビュー結果を読んでください。\n「1. SQLインジェクション対策：パラメータバインドが未実装の箇所が3件あり。至急対応が必要。\n2. XSS対策：出力時のエスケープ処理は全画面で実装済み。\n3. CSRF対策：トークン検証が一部のフォームで欠落。中優先度で対応。\n4. 認証・認可：適切に実装されている。」\n至急対応が必要な項目は？', 'セキュリティレビュー結果から優先度を読み取る問題です。', 1, 57, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'XSS 대책 (출력 시 이스케이프 처리 관련)', FALSE, 1),
    (gen_random_uuid(), q_id, 'CSRF 대책 (토큰 검증 누락 관련 항목)', FALSE, 2),
    (gen_random_uuid(), q_id, '인증/인가 (권한 관리 및 접근 제어)', FALSE, 3),
    (gen_random_uuid(), q_id, 'SQL 인젝션 대책 (파라미터 바인딩 미구현 3건)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の性能テスト結果を読んでください。\n「同時接続数1000ユーザーの負荷テストを実施した結果、95パーセンタイルの応答時間は800msで、目標の500msを超過している。ボトルネック分析の結果、データベースの接続プール枯渇が原因と特定された。接続プールのサイズを現状の50から100に拡張することを推奨する。」\nボトルネックの原因は？', '性能テスト結果の分析を読み取る問題です。', 1, 58, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스 커넥션 풀 고갈이 원인으로 특정됨', TRUE, 1),
    (gen_random_uuid(), q_id, 'CPU 사용률 과다로 인한 처리 지연이 원인임', FALSE, 2),
    (gen_random_uuid(), q_id, '네트워크 대역폭 부족으로 인한 패킷 손실이 원인', FALSE, 3),
    (gen_random_uuid(), q_id, '디스크 I/O 병목으로 인한 읽기/쓰기 지연이 원인', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の技術提案書を読んでください。\n「現行システムのモノリシックアーキテクチャをマイクロサービスに移行することを提案する。移行にあたっては、ストラングラーフィグパターンを採用し、段階的に機能を切り出す。まず認証サービスを分離し、次にユーザー管理、最後に注文管理を移行する。各フェーズ間のデータ整合性はSagaパターンで担保する。」\n移行の順序として正しいのは？', 'マイクロサービス移行提案書の理解を問う問題です。', 1, 59, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주문 관리 → 사용자 관리 → 인증 서비스 순서', FALSE, 1),
    (gen_random_uuid(), q_id, '사용자 관리 → 인증 서비스 → 주문 관리 순서', FALSE, 2),
    (gen_random_uuid(), q_id, '인증 서비스 → 사용자 관리 → 주문 관리 순서', TRUE, 3),
    (gen_random_uuid(), q_id, '모든 서비스를 동시에 일괄적으로 이관하는 방식', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の運用設計書を読んでください。\n「監視設計：\n・インフラ監視：Prometheusでメトリクスを収集し、Grafanaで可視化\n・アプリケーション監視：分散トレーシングにJaegerを使用\n・ログ管理：ELKスタック（Elasticsearch, Logstash, Kibana）で集約\n・アラート：PagerDutyと連携し、重要度に応じてエスカレーション\nログの保持期間は90日とし、その後アーカイブストレージに移動する。」\nログの保持期間は？', '運用設計書からログ保持期間を読み取る問題です。', 1, 60, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30일간 보관 후 완전 삭제 처리', FALSE, 1),
    (gen_random_uuid(), q_id, '90일간 보관 후 아카이브 스토리지로 이동', TRUE, 2),
    (gen_random_uuid(), q_id, '365일간 보관 후 아카이브 스토리지로 이동', FALSE, 3),
    (gen_random_uuid(), q_id, '무기한 보관하며 자동 삭제 없이 유지', FALSE, 4);

  -- ==========================================
  -- FILL_BLANK category (30 questions, sort_order 61-90)
  -- ==========================================

  -- fill_blank easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「サーバーに___を送信します。」', '「リクエスト(Request)」はサーバーへの要求を意味するIT基本用語です。', 1, 61, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レスポンス', FALSE, 1),
    (gen_random_uuid(), q_id, 'リクエスト', TRUE, 2),
    (gen_random_uuid(), q_id, 'パケット', FALSE, 3),
    (gen_random_uuid(), q_id, 'セッション', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___を修正してから、もう一度テストしてください。」', '「バグ(Bug)」はプログラムの不具合を意味するIT用語です。', 1, 62, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ログ', FALSE, 2),
    (gen_random_uuid(), q_id, 'スペック', FALSE, 3),
    (gen_random_uuid(), q_id, 'チケット', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「コードの変更を___にコミットしてください。」', '「リポジトリ(Repository)」はソースコードの保管場所です。', 1, 63, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブランチ', FALSE, 1),
    (gen_random_uuid(), q_id, 'クラウド', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンテナ', FALSE, 3),
    (gen_random_uuid(), q_id, 'リポジトリ', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「新しい機能を追加するために、___を作成しました。」', '「ブランチ(Branch)」は独立した開発ラインを作るGitの機能です。', 1, 64, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンテナ', FALSE, 1),
    (gen_random_uuid(), q_id, 'モジュール', FALSE, 2),
    (gen_random_uuid(), q_id, 'ブランチ', TRUE, 3),
    (gen_random_uuid(), q_id, 'パッケージ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___が完了したら、本番環境にデプロイします。」', '「テスト」は本番環境へのデプロイ前に行う品質確認です。', 1, 65, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト', TRUE, 1),
    (gen_random_uuid(), q_id, 'レビュー', FALSE, 2),
    (gen_random_uuid(), q_id, 'コーディング', FALSE, 3),
    (gen_random_uuid(), q_id, '要件定義', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「データを___に保存してください。」', '「データベース」はデータを構造的に保存・管理するシステムです。', 1, 66, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キャッシュ', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ログ', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベース', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「この___は、ユーザー情報を管理する画面です。」', '「画面」はUIの表示領域を指すIT用語です。', 1, 67, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバー', FALSE, 1),
    (gen_random_uuid(), q_id, '画面', TRUE, 2),
    (gen_random_uuid(), q_id, 'モジュール', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「プルリクエストの___が完了しました。マージしてください。」', '「レビュー(Review)」はコードの品質チェックを意味します。', 1, 68, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レビュー', TRUE, 1),
    (gen_random_uuid(), q_id, 'ビルド', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___エラーが発生しました。ステータスコードは404です。」', 'ステータスコード404は「ページが見つからない」エラーです。', 1, 69, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Bad Request', FALSE, 1),
    (gen_random_uuid(), q_id, 'Unauthorized', FALSE, 2),
    (gen_random_uuid(), q_id, 'Internal Server', FALSE, 3),
    (gen_random_uuid(), q_id, 'Not Found', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「アプリケーションを___にデプロイしました。」', '「サーバー」はアプリケーションを実行するコンピュータです。', 1, 70, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブラウザ', FALSE, 1),
    (gen_random_uuid(), q_id, 'クライアント', FALSE, 2),
    (gen_random_uuid(), q_id, 'エディタ', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバー', TRUE, 4);

  -- fill_blank medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___テストでは、モジュール間のインターフェースが正しく動作するか確認します。」', '結合テストはモジュール間の連携を確認するテストです。', 1, 71, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '単体', FALSE, 1),
    (gen_random_uuid(), q_id, '結合', TRUE, 2),
    (gen_random_uuid(), q_id, '負荷', FALSE, 3),
    (gen_random_uuid(), q_id, '受入', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「データベースの___を最適化することで、検索速度が向上しました。」', 'インデックスはデータベースの検索性能を向上させる仕組みです。', 1, 72, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブル', FALSE, 1),
    (gen_random_uuid(), q_id, 'スキーマ', FALSE, 2),
    (gen_random_uuid(), q_id, 'インデックス', TRUE, 3),
    (gen_random_uuid(), q_id, 'パーティション', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「APIの___にはJSON形式を使用します。」', 'レスポンスはAPIがクライアントに返す応答データです。', 1, 73, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエスト', FALSE, 1),
    (gen_random_uuid(), q_id, 'ヘッダー', FALSE, 2),
    (gen_random_uuid(), q_id, 'パラメータ', FALSE, 3),
    (gen_random_uuid(), q_id, 'レスポンス', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___管理にはGitHubのIssue機能を使用しています。」', 'タスク管理はプロジェクトの作業を追跡・管理する活動です。', 1, 74, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'タスク', TRUE, 1),
    (gen_random_uuid(), q_id, 'バージョン', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソースコード', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「セキュリティ対策として、パスワードは___化して保存します。」', 'ハッシュ化はパスワードを不可逆に変換するセキュリティ手法です。', 1, 75, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '暗号', FALSE, 1),
    (gen_random_uuid(), q_id, 'エンコード', FALSE, 2),
    (gen_random_uuid(), q_id, 'ハッシュ', TRUE, 3),
    (gen_random_uuid(), q_id, '圧縮', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___駆動開発では、先にテストコードを書いてから実装を行います。」', 'テスト駆動開発(TDD)はテストファーストのプラクティスです。', 1, 76, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン', FALSE, 1),
    (gen_random_uuid(), q_id, 'イベント', FALSE, 2),
    (gen_random_uuid(), q_id, 'データ', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「コードの品質を保つために、定期的に___を実施しています。」', 'コードレビューはコード品質を維持するためのレビュープロセスです。', 1, 77, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードレビュー', TRUE, 1),
    (gen_random_uuid(), q_id, 'リファクタリング', FALSE, 2),
    (gen_random_uuid(), q_id, 'デバッグ', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロファイリング', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「この機能は次の___で対応する予定です。」', 'スプリントはアジャイル開発の反復的な開発サイクルです。', 1, 78, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ミーティング', FALSE, 1),
    (gen_random_uuid(), q_id, 'スプリント', TRUE, 2),
    (gen_random_uuid(), q_id, 'リリース', FALSE, 3),
    (gen_random_uuid(), q_id, 'イテレーション', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「本番障害の___として、サーバーを再起動しました。」', '暫定対応は恒久対応までの一時的な対処です。', 1, 79, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '原因調査', FALSE, 1),
    (gen_random_uuid(), q_id, '影響調査', FALSE, 2),
    (gen_random_uuid(), q_id, '暫定対応', TRUE, 3),
    (gen_random_uuid(), q_id, '恒久対応', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___パターンを適用して、オブジェクトの生成ロジックをカプセル化しました。」', 'ファクトリーパターンはオブジェクト生成をカプセル化するデザインパターンです。', 1, 80, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'シングルトン', FALSE, 1),
    (gen_random_uuid(), q_id, 'オブザーバー', FALSE, 2),
    (gen_random_uuid(), q_id, 'ストラテジー', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファクトリー', TRUE, 4);

  -- fill_blank hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「マイクロサービス間のデータ整合性を保つために、___パターンを採用しました。」', 'Sagaパターンは分散トランザクションを管理するパターンです。', 1, 81, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CQRS', FALSE, 1),
    (gen_random_uuid(), q_id, 'Saga', TRUE, 2),
    (gen_random_uuid(), q_id, 'Bulkhead', FALSE, 3),
    (gen_random_uuid(), q_id, 'Circuit Breaker', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「外部サービスの障害が伝播しないように、___パターンを導入しました。」', 'サーキットブレーカーパターンは障害の伝播を防ぐパターンです。', 1, 82, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーキットブレーカー', TRUE, 1),
    (gen_random_uuid(), q_id, 'フォールバック', FALSE, 2),
    (gen_random_uuid(), q_id, 'バルクヘッド', FALSE, 3),
    (gen_random_uuid(), q_id, 'リトライ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「データベースの___レベルをREAD COMMITTEDに設定しています。」', 'トランザクション分離レベルはデータの一貫性を制御する設定です。', 1, 83, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '接続（コネクション）', FALSE, 1),
    (gen_random_uuid(), q_id, 'セキュリティ', FALSE, 2),
    (gen_random_uuid(), q_id, '分離（アイソレーション）', TRUE, 3),
    (gen_random_uuid(), q_id, 'パフォーマンス', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「コンテナの___にはDockerfileを使用し、マルチステージビルドで最終イメージのサイズを削減しています。」', 'ビルドはDockerイメージを作成するプロセスです。', 1, 84, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 1),
    (gen_random_uuid(), q_id, 'オーケストレーション', FALSE, 2),
    (gen_random_uuid(), q_id, 'モニタリング', FALSE, 3),
    (gen_random_uuid(), q_id, 'ビルド', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___原則に従い、クラスは変更の理由がただ一つだけであるべきです。」', '単一責任の原則(SRP)はSOLID原則の一つです。', 1, 85, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '単一責任', TRUE, 1),
    (gen_random_uuid(), q_id, 'オープン・クローズド', FALSE, 2),
    (gen_random_uuid(), q_id, 'リスコフ置換', FALSE, 3),
    (gen_random_uuid(), q_id, 'インターフェース分離', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「認証情報を安全に管理するため、___管理ツールとしてVaultを導入しました。」', 'シークレット管理はAPI鍵やパスワードを安全に扱う仕組みです。', 1, 86, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンフィグ', FALSE, 1),
    (gen_random_uuid(), q_id, 'シークレット', TRUE, 2),
    (gen_random_uuid(), q_id, 'バージョン', FALSE, 3),
    (gen_random_uuid(), q_id, 'パッケージ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___テストでは、同時に1000ユーザーがアクセスした場合のシステムの挙動を確認します。」', '負荷テストはシステムの性能限界を確認するテストです。', 1, 87, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '結合', FALSE, 1),
    (gen_random_uuid(), q_id, '回帰', FALSE, 2),
    (gen_random_uuid(), q_id, '負荷', TRUE, 3),
    (gen_random_uuid(), q_id, '受入', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「本番環境へのデプロイは___デプロイ方式を採用し、ダウンタイムゼロでリリースします。」', 'ブルーグリーンデプロイはダウンタイムなしでリリースする方式です。', 1, 88, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ローリング', FALSE, 1),
    (gen_random_uuid(), q_id, 'カナリア', FALSE, 2),
    (gen_random_uuid(), q_id, 'ブルーグリーン', TRUE, 3),
    (gen_random_uuid(), q_id, 'インプレース', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___の原則に基づき、上位モジュールは下位モジュールに依存すべきではなく、両者とも抽象に依存すべきです。」', '依存性逆転の原則(DIP)はSOLID原則のDです。', 1, 89, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '依存性逆転', TRUE, 1),
    (gen_random_uuid(), q_id, 'インターフェース分離', FALSE, 2),
    (gen_random_uuid(), q_id, 'リスコフ置換', FALSE, 3),
    (gen_random_uuid(), q_id, 'オープン・クローズド', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「分散システムにおいて、___定理により、一貫性、可用性、分断耐性の3つを同時に満たすことはできない。」', 'CAP定理は分散システムの基本的な制約を示す定理です。', 1, 90, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ACID', FALSE, 1),
    (gen_random_uuid(), q_id, 'BASE', FALSE, 2),
    (gen_random_uuid(), q_id, 'CAP', TRUE, 3),
    (gen_random_uuid(), q_id, 'SOLID', FALSE, 4);

END $$;
