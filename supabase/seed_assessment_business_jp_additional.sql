-- ============================================
-- J-Bridge Assessment Quiz: Business Japanese Additional Questions
-- Quiz: ビジネス日本語総合試験 (a0000002-0000-0000-0000-000000000002)
-- 60 additional questions (sort_order 91-150)
-- Categories: vocab (20), reading (20), fill_blank (20)
-- ============================================

-- ============================================
-- VOCAB category (20 questions, sort_order 91-110)
-- IT用語, プロジェクト管理, ビジネス用語
-- easy 4, medium 8, hard 8
-- Options in Korean
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ==========================================
  -- VOCAB - EASY (4 questions, sort_order 91-94)
  -- ==========================================

  -- Q91: IT用語 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「スプリント」の意味として正しいものは？', 'スプリントはアジャイル開発における短期間（通常1〜4週間）の開発サイクルを意味します。', 1, 91, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드 리뷰 기간', FALSE, 1),
    (gen_random_uuid(), q_id, '단기 개발 주기 (1~4주)', TRUE, 2),
    (gen_random_uuid(), q_id, '장기 프로젝트 계획', FALSE, 3),
    (gen_random_uuid(), q_id, '릴리스 배포 작업', FALSE, 4);

  -- Q92: プロジェクト管理 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「バックログ」の意味として正しいものは？', 'バックログは未着手のタスクや要件をまとめたリストで、優先順位をつけて管理します。', 1, 92, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '완료된 작업 목록', FALSE, 1),
    (gen_random_uuid(), q_id, '서버 로그 기록', FALSE, 2),
    (gen_random_uuid(), q_id, '미착수 작업/요건 목록', TRUE, 3),
    (gen_random_uuid(), q_id, '에러 보고서', FALSE, 4);

  -- Q93: ビジネス用語 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', 'IT業界で使われる「ミーティング」の意味は？', 'ミーティングは業務上の打ち合わせ・会議を意味するビジネス用語です。', 1, 93, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의 / 미팅', TRUE, 1),
    (gen_random_uuid(), q_id, '면접 / 인터뷰', FALSE, 2),
    (gen_random_uuid(), q_id, '발표 / 프레젠테이션', FALSE, 3),
    (gen_random_uuid(), q_id, '연수 / 트레이닝', FALSE, 4);

  -- Q94: IT用語 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「プルリクエスト」の意味として正しいものは？', 'プルリクエスト(PR)は変更したコードをレビューしてもらい、ブランチに統合するための要求です。', 1, 94, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버에 데이터를 요청하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '라이브러리를 다운로드하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '에러 수정을 의뢰하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 변경의 병합을 요청하는 것', TRUE, 4);

  -- ==========================================
  -- VOCAB - MEDIUM (8 questions, sort_order 95-102)
  -- ==========================================

  -- Q95: IT用語 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「マイグレーション」の意味として正しいものは？', 'マイグレーションはデータベースのスキーマ変更やシステム移行を管理する仕組みです。', 1, 95, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DB 스키마 변경 / 시스템 이행 관리', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터 백업 및 복원 작업', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 간 통신 프로토콜', FALSE, 3),
    (gen_random_uuid(), q_id, '소스코드 난독화 작업', FALSE, 4);

  -- Q96: プロジェクト管理 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「ステークホルダー」の意味として正しいものは？', 'ステークホルダーはプロジェクトに関わる利害関係者全般を指します。', 1, 96, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트 매니저', FALSE, 1),
    (gen_random_uuid(), q_id, '이해관계자', TRUE, 2),
    (gen_random_uuid(), q_id, '외부 감사인', FALSE, 3),
    (gen_random_uuid(), q_id, '시스템 관리자', FALSE, 4);

  -- Q97: ビジネス用語 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「リソース」の意味として正しいものは？', 'リソースはIT業界では人員、時間、予算、サーバーなどの資源を意味します。', 1, 97, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소스코드 저장소', FALSE, 1),
    (gen_random_uuid(), q_id, '개발 프레임워크', FALSE, 2),
    (gen_random_uuid(), q_id, '자원 (인력/시간/예산/서버 등)', TRUE, 3),
    (gen_random_uuid(), q_id, '테스트 결과 보고서', FALSE, 4);

  -- Q98: IT用語 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「コードレビュー」の意味として正しいものは？', 'コードレビューは他の開発者がソースコードを確認し、品質向上を図る作業です。', 1, 98, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드를 자동으로 최적화하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '코드를 컴파일하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '다른 개발자가 코드를 검토하는 것', TRUE, 3),
    (gen_random_uuid(), q_id, '코드를 리팩토링하는 것', FALSE, 4);

  -- Q99: プロジェクト管理 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「マイルストーン」の意味として正しいものは？', 'マイルストーンはプロジェクトの主要な節目や達成目標を意味します。', 1, 99, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트의 주요 이정표 / 목표 지점', TRUE, 1),
    (gen_random_uuid(), q_id, '개발 환경의 설정 파일', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 자동화 도구', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 품질 측정 기준', FALSE, 4);

  -- Q100: ビジネス用語 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「エスカレーション」の意味として正しいものは？', 'エスカレーションは問題を上位者や専門チームに報告・引き継ぎすることです。', 1, 100, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '문제를 스스로 해결하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '문제를 상위자에게 보고/인계하는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '시스템을 업그레이드하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '에러 로그를 분석하는 것', FALSE, 4);

  -- Q101: IT用語 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「ホットフィックス」の意味として正しいものは？', 'ホットフィックスは本番環境の緊急バグ修正のためにリリースするパッチです。', 1, 101, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정기 릴리스에 포함되는 기능 업데이트', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 환경 전용 빌드', FALSE, 2),
    (gen_random_uuid(), q_id, '긴급 버그 수정 패치', TRUE, 3),
    (gen_random_uuid(), q_id, '서버 재시작 절차', FALSE, 4);

  -- Q102: プロジェクト管理 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「ベロシティ」の意味として正しいものは？', 'ベロシティはアジャイル開発でチームが一定期間に消化できる作業量を測る指標です。', 1, 102, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버의 응답 속도', FALSE, 1),
    (gen_random_uuid(), q_id, '팀이 일정 기간에 처리하는 작업량 지표', TRUE, 2),
    (gen_random_uuid(), q_id, '네트워크 전송 속도', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 실행 속도', FALSE, 4);

  -- ==========================================
  -- VOCAB - HARD (8 questions, sort_order 103-110)
  -- ==========================================

  -- Q103: IT用語 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「技術的負債」の意味として正しいものは？', '技術的負債は短期的な解決策を選んだ結果、将来的に追加の開発コストが発生する状態を指します。', 1, 103, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기술 도입에 필요한 초기 투자 비용', FALSE, 1),
    (gen_random_uuid(), q_id, '단기적 해결로 인해 발생하는 미래의 추가 개발 비용', TRUE, 2),
    (gen_random_uuid(), q_id, '외부 라이브러리 라이센스 비용', FALSE, 3),
    (gen_random_uuid(), q_id, '서버 운영 유지보수 비용', FALSE, 4);

  -- Q104: プロジェクト管理 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「レトロスペクティブ」の意味として正しいものは？', 'レトロスペクティブはスプリント終了後にチームで振り返りを行い、改善点を話し合う会議です。', 1, 104, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트 킥오프 미팅', FALSE, 1),
    (gen_random_uuid(), q_id, '코드 리뷰 회의', FALSE, 2),
    (gen_random_uuid(), q_id, '요건 정의 워크숍', FALSE, 3),
    (gen_random_uuid(), q_id, '스프린트 회고 미팅', TRUE, 4);

  -- Q105: ビジネス用語 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「SLA」の意味として正しいものは？', 'SLA(Service Level Agreement)はサービス品質の保証水準を定めた合意書です。', 1, 105, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소프트웨어 라이센스 계약', FALSE, 1),
    (gen_random_uuid(), q_id, '서비스 품질 보증 수준 합의서', TRUE, 2),
    (gen_random_uuid(), q_id, '시스템 로그 분석 도구', FALSE, 3),
    (gen_random_uuid(), q_id, '보안 레벨 인증 기준', FALSE, 4);

  -- Q106: IT用語 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「冪等性」の意味として正しいものは？', '冪等性(べきとうせい)は同じ操作を何回実行しても結果が同じになる性質です。APIの設計で重要な概念です。', 1, 106, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터를 암호화하는 성질', FALSE, 1),
    (gen_random_uuid(), q_id, '동시 접속을 허용하는 성질', FALSE, 2),
    (gen_random_uuid(), q_id, '같은 조작을 여러 번 실행해도 결과가 동일한 성질', TRUE, 3),
    (gen_random_uuid(), q_id, '시스템이 자동 복구되는 성질', FALSE, 4);

  -- Q107: プロジェクト管理 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「スクラムマスター」の意味として正しいものは？', 'スクラムマスターはスクラム開発においてチームの障害を取り除き、プロセスを円滑に進める役割です。', 1, 107, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트 전체 예산을 관리하는 역할', FALSE, 1),
    (gen_random_uuid(), q_id, '고객 요건을 정의하는 역할', FALSE, 2),
    (gen_random_uuid(), q_id, '팀의 장애를 제거하고 프로세스를 원활히 하는 역할', TRUE, 3),
    (gen_random_uuid(), q_id, '기술 아키텍처를 결정하는 역할', FALSE, 4);

  -- Q108: ビジネス用語 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「ポストモーテム」の意味として正しいものは？', 'ポストモーテムは障害やプロジェクト完了後に原因分析と再発防止策を議論する振り返りです。', 1, 108, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '장애/프로젝트 후 원인 분석 및 재발 방지 회고', TRUE, 1),
    (gen_random_uuid(), q_id, '프로젝트 시작 전 리스크 분석 회의', FALSE, 2),
    (gen_random_uuid(), q_id, '코드 품질 측정을 위한 정적 분석', FALSE, 3),
    (gen_random_uuid(), q_id, '서버 성능 모니터링 리포트', FALSE, 4);

  -- Q109: IT用語 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「デプロイパイプライン」の意味として正しいものは？', 'デプロイパイプラインはコードのビルド、テスト、デプロイを自動化した一連のプロセスです。', 1, 109, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '네트워크 데이터 전송 경로', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스 복제 프로세스', FALSE, 2),
    (gen_random_uuid(), q_id, '빌드/테스트/배포를 자동화한 일련의 프로세스', TRUE, 3),
    (gen_random_uuid(), q_id, '서버 간 로드 밸런싱 구조', FALSE, 4);

  -- Q110: プロジェクト管理 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「プロダクトオーナー」の意味として正しいものは？', 'プロダクトオーナーはスクラムにおいてプロダクトの価値を最大化する責任者で、バックログの優先順位を決定します。', 1, 110, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 인프라를 관리하는 운영 담당자', FALSE, 1),
    (gen_random_uuid(), q_id, 'QA 테스트를 총괄하는 품질 담당자', FALSE, 2),
    (gen_random_uuid(), q_id, '제품 가치를 최대화하고 백로그 우선순위를 결정하는 역할', TRUE, 3),
    (gen_random_uuid(), q_id, '팀 전체의 기술 방향을 결정하는 테크 리드', FALSE, 4);

END $$;

-- ============================================
-- READING category (20 questions, sort_order 111-130)
-- 仕様書/議事録/メール reading comprehension
-- easy 4, medium 8, hard 8
-- Options in Korean
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ==========================================
  -- READING - EASY (4 questions, sort_order 111-114)
  -- ==========================================

  -- Q111: ビジネスメール (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のメールを読んでください。\n「お疲れ様です。本日のデプロイ作業は完了しました。ステージング環境での動作確認をお願いいたします。不具合がありましたらSlackでご連絡ください。」\nメールの依頼事項は？', 'デプロイ完了後のステージング環境確認依頼メールです。', 1, 111, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '본번 환경에 배포를 실행해 달라', FALSE, 1),
    (gen_random_uuid(), q_id, '스테이징 환경에서 동작 확인을 해 달라', TRUE, 2),
    (gen_random_uuid(), q_id, 'Slack 채널을 새로 만들어 달라', FALSE, 3),
    (gen_random_uuid(), q_id, '배포 작업을 중지해 달라', FALSE, 4);

  -- Q112: 社内通知 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の通知を読んでください。\n「サーバーメンテナンスのお知らせ：3月15日（土）午前2時～午前6時にサーバーメンテナンスを実施します。この間、システムはご利用いただけません。」\nメンテナンスについて正しいのは？', 'サーバーメンテナンスの日程と影響範囲を読み取る問題です。', 1, 112, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '평일 오후에 실시되며 시스템은 정상 이용 가능', FALSE, 1),
    (gen_random_uuid(), q_id, '3월 15일 새벽 2시~6시에 시스템 이용 불가', TRUE, 2),
    (gen_random_uuid(), q_id, '매주 토요일 정기적으로 실시됨', FALSE, 3),
    (gen_random_uuid(), q_id, '메인터넌스 중에도 일부 기능은 사용 가능', FALSE, 4);

  -- Q113: タスク指示 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のSlackメッセージを読んでください。\n「田中さん、ログイン画面のバリデーションエラーメッセージを日本語に翻訳してください。対象は5件です。金曜日までにプルリクエストを出してください。」\nこのメッセージの依頼内容は？', 'バリデーションメッセージの翻訳タスクの指示です。', 1, 113, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그인 화면의 디자인을 변경해 달라', FALSE, 1),
    (gen_random_uuid(), q_id, '밸리데이션 에러 메시지 5건을 일본어로 번역해 달라', TRUE, 2),
    (gen_random_uuid(), q_id, '금요일까지 로그인 기능을 새로 개발해 달라', FALSE, 3),
    (gen_random_uuid(), q_id, '프론트엔드 테스트 코드를 작성해 달라', FALSE, 4);

  -- Q114: リリースノート (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のリリースノートを読んでください。\n「v2.1.0 リリースノート\n・ダッシュボードにグラフ表示機能を追加\n・パスワードリセット時のメール送信バグを修正\n・ページ読み込み速度を30%改善」\n今回のリリースで修正されたバグは？', 'リリースノートからバグ修正項目を読み取る問題です。', 1, 114, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대시보드 그래프 표시 오류', FALSE, 1),
    (gen_random_uuid(), q_id, '비밀번호 재설정 시 메일 전송 버그', TRUE, 2),
    (gen_random_uuid(), q_id, '페이지 로딩 속도 저하 문제', FALSE, 3),
    (gen_random_uuid(), q_id, '로그인 인증 실패 오류', FALSE, 4);

  -- ==========================================
  -- READING - MEDIUM (8 questions, sort_order 115-122)
  -- ==========================================

  -- Q115: 議事録 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の議事録を読んでください。\n「【スプリント振り返り議事録】\n日時：2025/3/10 15:00-16:00\n参加者：田中、佐藤、キム\n■良かった点\n・コードレビューのスピードが向上した\n■改善点\n・テストケースの作成が遅れがち\n■アクション\n・佐藤：テストケーステンプレートを来週までに作成する」\n佐藤さんのアクション項目は？', '議事録からアクション項目を読み取る問題です。', 1, 115, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드 리뷰 속도를 더 향상시키기', FALSE, 1),
    (gen_random_uuid(), q_id, '다음 주까지 테스트 케이스 템플릿을 작성하기', TRUE, 2),
    (gen_random_uuid(), q_id, '스프린트 회고 일정을 조정하기', FALSE, 3),
    (gen_random_uuid(), q_id, '새로운 팀원을 온보딩하기', FALSE, 4);

  -- Q116: 仕様書 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の仕様書を読んでください。\n「ユーザー検索API仕様\nエンドポイント：GET /api/users\nクエリパラメータ：\n・name（任意）：名前で部分一致検索\n・role（任意）：ロールで完全一致検索\nレスポンス：ユーザーオブジェクトの配列\nページネーション：1ページ20件」\nnameパラメータの検索方式は？', 'API仕様書から検索条件を読み取る問題です。', 1, 116, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '완전 일치 검색', FALSE, 1),
    (gen_random_uuid(), q_id, '부분 일치 검색', TRUE, 2),
    (gen_random_uuid(), q_id, '전방 일치 검색', FALSE, 3),
    (gen_random_uuid(), q_id, '정규표현식 검색', FALSE, 4);

  -- Q117: ビジネスメール (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のメールを読んでください。\n「件名：【重要】本番環境障害のお知らせ\n\n関係者各位\n\n本日14:30頃より、決済処理にてタイムアウトエラーが発生しております。\n原因：外部決済APIの応答遅延\n影響範囲：決済処理全般\n暫定対応：リトライ回数を3回から5回に変更済み\n恒久対応：来週中に決済APIのタイムアウト値を見直す予定\n\n以上、よろしくお願いいたします。」\n暫定対応として実施された内容は？', '障害報告メールから暫定対応を読み取る問題です。', 1, 117, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결제 API의 타임아웃 값을 변경했다', FALSE, 1),
    (gen_random_uuid(), q_id, '리트라이 횟수를 3회에서 5회로 변경했다', TRUE, 2),
    (gen_random_uuid(), q_id, '외부 결제 API를 다른 서비스로 교체했다', FALSE, 3),
    (gen_random_uuid(), q_id, '결제 처리 기능을 일시 중지했다', FALSE, 4);

  -- Q118: 議事録 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の議事録を読んでください。\n「【設計レビュー議事録】\n議題：認証方式の変更提案\n現状：セッションベース認証\n提案：JWTトークン認証への移行\n理由：\n1. マイクロサービス化に対応するため\n2. スケーラビリティの向上\n決定事項：次スプリントでPoCを実施し、パフォーマンス比較を行う」\n認証方式を変更する理由は？', '設計レビュー議事録から変更理由を読み取る問題です。', 1, 118, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보안 취약점이 발견되었기 때문에', FALSE, 1),
    (gen_random_uuid(), q_id, '마이크로서비스 대응과 확장성 향상을 위해', TRUE, 2),
    (gen_random_uuid(), q_id, '라이센스 비용을 절감하기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '고객으로부터 변경 요청을 받았기 때문에', FALSE, 4);

  -- Q119: 仕様書 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の仕様書を読んでください。\n「通知機能仕様：\n・メール通知：アカウント作成時、パスワード変更時に送信\n・プッシュ通知：タスクのアサイン時、締め切り24時間前に送信\n・Slack通知：デプロイ完了時、障害発生時に送信\n※ユーザーは設定画面で各通知のオン/オフを切り替え可能」\nデプロイ完了時に送信される通知の種類は？', '通知機能の仕様を読み取る問題です。', 1, 119, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '메일 통지', FALSE, 1),
    (gen_random_uuid(), q_id, '푸시 통지', FALSE, 2),
    (gen_random_uuid(), q_id, 'Slack 통지', TRUE, 3),
    (gen_random_uuid(), q_id, '메일 + 푸시 통지', FALSE, 4);

  -- Q120: 障害報告 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の障害報告を読んでください。\n「障害報告書\n発生日時：2025/3/12 09:15\n検知方法：監視アラート（CPU使用率90%超過）\n影響：レスポンスタイム3秒以上に悪化\n原因：バッチ処理のクエリがテーブルフルスキャンになっていた\n対応：該当クエリにインデックスを追加して解消」\n障害の根本原因は？', '障害報告書から根本原因を読み取る問題です。', 1, 120, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버의 CPU가 물리적으로 고장났다', FALSE, 1),
    (gen_random_uuid(), q_id, '네트워크 대역폭이 부족했다', FALSE, 2),
    (gen_random_uuid(), q_id, '배치 처리 쿼리가 테이블 풀 스캔을 하고 있었다', TRUE, 3),
    (gen_random_uuid(), q_id, '동시 접속 사용자가 급증했다', FALSE, 4);

  -- Q121: ビジネスメール (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のメールを読んでください。\n「田中様\n\nお疲れ様です。先日ご依頼いただいた画面設計書のレビューが完了しました。\n修正箇所は以下の3点です。\n1. ヘッダーのロゴサイズを仕様書に合わせる\n2. エラーメッセージの文言を統一する\n3. 入力フォームのバリデーションルールを追記する\n\n修正後、再度レビューをさせていただきます。\nよろしくお願いいたします。」\n修正が求められている箇所の数は？', 'レビュー結果メールから修正箇所数を読み取る問題です。', 1, 121, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1곳', FALSE, 1),
    (gen_random_uuid(), q_id, '2곳', FALSE, 2),
    (gen_random_uuid(), q_id, '3곳', TRUE, 3),
    (gen_random_uuid(), q_id, '4곳', FALSE, 4);

  -- Q122: 仕様書 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の仕様を読んでください。\n「ファイルアップロード仕様\n・対応形式：JPEG, PNG, PDF\n・最大サイズ：10MB\n・保存先：S3バケット（リージョン：東京）\n・アップロード後、サムネイルを自動生成（JPEG/PNGのみ）\n・PDFの場合は1ページ目をプレビュー画像として生成」\nPDFをアップロードした場合の動作は？', 'ファイルアップロード仕様からPDFの特別処理を読み取る問題です。', 1, 122, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '썸네일이 자동 생성된다', FALSE, 1),
    (gen_random_uuid(), q_id, '1페이지를 프리뷰 이미지로 생성한다', TRUE, 2),
    (gen_random_uuid(), q_id, '모든 페이지가 이미지로 변환된다', FALSE, 3),
    (gen_random_uuid(), q_id, 'PDF 뷰어가 자동으로 실행된다', FALSE, 4);

  -- ==========================================
  -- READING - HARD (8 questions, sort_order 123-130)
  -- ==========================================

  -- Q123: 技術仕様書 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の技術仕様書を読んでください。\n「キャッシュ戦略\n・L1キャッシュ：アプリケーションメモリ（TTL: 5分）\n・L2キャッシュ：Redis（TTL: 1時間）\n・キャッシュミス時：DBから取得し、L1/L2両方に書き込み\n・キャッシュ無効化：データ更新時にL1/L2ともに即座に削除\n・注意：L1キャッシュはインスタンスごとに独立のため、マルチインスタンス環境では最大5分の不整合が発生する可能性がある」\nマルチインスタンス環境で不整合が発生する原因は？', '多層キャッシュ仕様書からマルチインスタンスの課題を読み取る問題です。', 1, 123, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Redis의 TTL이 1시간으로 길기 때문에', FALSE, 1),
    (gen_random_uuid(), q_id, 'L1 캐시가 인스턴스마다 독립적이기 때문에', TRUE, 2),
    (gen_random_uuid(), q_id, '캐시 무효화가 비동기로 처리되기 때문에', FALSE, 3),
    (gen_random_uuid(), q_id, 'DB에서 데이터를 가져오는 데 시간이 걸리기 때문에', FALSE, 4);

  -- Q124: 議事録 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の議事録を読んでください。\n「【アーキテクチャ検討会議事録】\n議題：モノリスからマイクロサービスへの移行方針\n結論：段階的移行（ストラングラーフィグパターン）を採用\n理由：\n1. ビッグバン移行はリスクが高すぎる\n2. 既存機能を維持しながら段階的に切り出せる\n3. 各チームが独立してデプロイ可能になる\n第1フェーズ：認証サービスの分離（4月〜6月）\n第2フェーズ：通知サービスの分離（7月〜9月）」\nストラングラーフィグパターンが採用された主な理由は？', 'アーキテクチャ移行の意思決定を読み取る問題です。', 1, 124, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개발 비용이 가장 저렴하기 때문에', FALSE, 1),
    (gen_random_uuid(), q_id, '빅뱅 이행의 리스크가 높고 기존 기능을 유지하면서 단계적으로 분리 가능하기 때문에', TRUE, 2),
    (gen_random_uuid(), q_id, '마이크로서비스의 업계 표준이기 때문에', FALSE, 3),
    (gen_random_uuid(), q_id, '고객의 요청으로 결정되었기 때문에', FALSE, 4);

  -- Q125: 障害対応報告 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の障害報告を読んでください。\n「ポストモーテムレポート\n事象：2025/3/8 デプロイ後に500エラーが多発\nタイムライン：\n14:00 デプロイ実施\n14:05 500エラーアラート発報\n14:10 ロールバック判断\n14:15 前バージョンにロールバック完了\n14:20 正常復旧確認\n根本原因：環境変数の設定漏れ（新しく追加したAPI_KEYが本番環境に未設定）\n再発防止策：\n1. デプロイチェックリストに環境変数確認項目を追加\n2. 環境変数の差分チェックをCI/CDに組み込む」\n障害の根本原因は？', 'ポストモーテムから根本原因を読み取る問題です。', 1, 125, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드에 버그가 있었기 때문에', FALSE, 1),
    (gen_random_uuid(), q_id, '서버 리소스가 부족했기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '환경 변수 설정 누락 (새로운 API_KEY가 본번에 미설정)', TRUE, 3),
    (gen_random_uuid(), q_id, '롤백 절차에 문제가 있었기 때문에', FALSE, 4);

  -- Q126: 技術提案書 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の技術提案書を読んでください。\n「データベース移行提案\n現状：MySQL 5.7（EOL到来）\n提案：PostgreSQL 16への移行\n移行理由：\n1. MySQL 5.7のサポート終了\n2. JSONBカラムによる柔軟なデータ構造\n3. ウィンドウ関数・CTEの充実\nリスク：\n・SQL方言の違いによるクエリ修正が必要\n・ORM層の設定変更\n想定期間：3ヶ月（移行ツール開発1ヶ月、データ移行1ヶ月、検証1ヶ月）」\nPostgreSQL移行の技術的メリットとして挙げられているものは？', '技術提案書から移行メリットを読み取る問題です。', 1, 126, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '운영 비용이 저렴하고 라이센스가 무료', FALSE, 1),
    (gen_random_uuid(), q_id, 'JSONB 컬럼과 윈도우 함수/CTE의 충실함', TRUE, 2),
    (gen_random_uuid(), q_id, 'MySQL과 완전히 호환되어 마이그레이션이 불필요', FALSE, 3),
    (gen_random_uuid(), q_id, '클라우드 네이티브 환경에 최적화', FALSE, 4);

  -- Q127: 議事録 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の議事録を読んでください。\n「【セキュリティレビュー議事録】\n検出事項：\n1. [Critical] SQLインジェクション脆弱性（ユーザー検索API）\n2. [High] XSSの可能性（コメント投稿画面）\n3. [Medium] CORS設定が全オリジン許可になっている\n4. [Low] HTTPヘッダーにサーバーバージョン情報が露出\n対応方針：Critical/Highは今スプリント内に対応、Medium以下は次スプリントで対応」\n今スプリント内に対応すべき項目は？', 'セキュリティレビュー議事録から優先度を判断する問題です。', 1, 127, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4항목 모두 이번 스프린트에서 대응', FALSE, 1),
    (gen_random_uuid(), q_id, 'SQL 인젝션과 XSS (Critical/High만)', TRUE, 2),
    (gen_random_uuid(), q_id, 'SQL 인젝션만 (Critical만)', FALSE, 3),
    (gen_random_uuid(), q_id, 'CORS와 서버 버전 노출만 (Medium/Low만)', FALSE, 4);

  -- Q128: 設計書 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の設計書を読んでください。\n「エラーハンドリング設計\n・4xx系エラー：ユーザー起因（バリデーションエラー等）→ クライアントにエラー詳細を返す\n・5xx系エラー：サーバー起因 → 汎用エラーメッセージを返し、詳細はサーバーログに記録\n・リトライ方針：\n  - 429 Too Many Requests → Exponential Backoffで最大3回リトライ\n  - 503 Service Unavailable → 5秒後に1回リトライ\n  - その他5xx → リトライしない」\n429エラー時のリトライ方針は？', 'エラーハンドリング設計書からリトライ方針を読み取る問題です。', 1, 128, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5초 후에 1회 리트라이', FALSE, 1),
    (gen_random_uuid(), q_id, '리트라이하지 않음', FALSE, 2),
    (gen_random_uuid(), q_id, 'Exponential Backoff로 최대 3회 리트라이', TRUE, 3),
    (gen_random_uuid(), q_id, '즉시 3회 리트라이', FALSE, 4);

  -- Q129: 運用ドキュメント (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の運用手順書を読んでください。\n「本番環境デプロイ手順\n前提条件：\n1. developブランチのCI/CDが全てグリーンであること\n2. QAチームの承認が完了していること\n3. デプロイ計画書がレビュー済みであること\n手順：\n1. mainブランチにマージ\n2. タグを作成（セマンティックバージョニング）\n3. カナリアリリース（10%のトラフィック）\n4. 30分間モニタリング\n5. 問題なければ100%に展開\nロールバック基準：エラーレートが1%を超えた場合」\nカナリアリリースの初期トラフィック割合は？', '運用手順書からデプロイ手順の詳細を読み取る問題です。', 1, 129, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5%', FALSE, 1),
    (gen_random_uuid(), q_id, '10%', TRUE, 2),
    (gen_random_uuid(), q_id, '25%', FALSE, 3),
    (gen_random_uuid(), q_id, '50%', FALSE, 4);

  -- Q130: 技術仕様書 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の設計書を読んでください。\n「認証・認可設計\n認証方式：JWT（RS256）\nトークン構成：\n・アクセストークン（有効期限：15分）\n・リフレッシュトークン（有効期限：7日）\nトークンリフレッシュ：\n・アクセストークン期限切れ時、リフレッシュトークンで新しいアクセストークンを発行\n・リフレッシュトークンは使用時に新しいものを発行（ローテーション）\n・リフレッシュトークンの不正使用検知時、該当ユーザーの全トークンを無効化」\nリフレッシュトークンの有効期限は？', '認証設計書からトークン仕様を読み取る問題です。', 1, 130, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '15분', FALSE, 1),
    (gen_random_uuid(), q_id, '1시간', FALSE, 2),
    (gen_random_uuid(), q_id, '24시간', FALSE, 3),
    (gen_random_uuid(), q_id, '7일', TRUE, 4);

END $$;

-- ============================================
-- FILL_BLANK category (20 questions, sort_order 131-150)
-- 報連相, telephone, requests/reports
-- easy 4, medium 8, hard 8
-- Options in Japanese
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ==========================================
  -- FILL_BLANK - EASY (4 questions, sort_order 131-134)
  -- ==========================================

  -- Q131: 報告 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「タスクが完了しましたので、___いたします。」', '報告（ほうこく）は業務の進捗や結果を上司に伝えることです。「報連相」の「報」にあたります。', 1, 131, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご報告', TRUE, 1),
    (gen_random_uuid(), q_id, 'ご連絡', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご相談', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご確認', FALSE, 4);

  -- Q132: 電話応対 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「お電話ありがとうございます。株式会社〇〇の田中で___。」', '電話応対の基本的な名乗り方です。「ございます」が丁寧なビジネス表現です。', 1, 132, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あります', FALSE, 1),
    (gen_random_uuid(), q_id, 'います', FALSE, 2),
    (gen_random_uuid(), q_id, 'ございます', TRUE, 3),
    (gen_random_uuid(), q_id, 'おります', FALSE, 4);

  -- Q133: 依頼 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「コードレビューを___いただけますか？」', '「お願い」は相手に依頼する際の基本的なビジネス表現です。', 1, 133, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お手伝い', FALSE, 1),
    (gen_random_uuid(), q_id, 'お任せ', FALSE, 2),
    (gen_random_uuid(), q_id, 'お願い', TRUE, 3),
    (gen_random_uuid(), q_id, 'お伝え', FALSE, 4);

  -- Q134: 連絡 (easy)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「ミーティングの時間が変更になりましたので、___いたします。」', '連絡（れんらく）は変更事項や必要な情報を関係者に伝えることです。「報連相」の「連」にあたります。', 1, 134, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご報告', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご連絡', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご案内', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご説明', FALSE, 4);

  -- ==========================================
  -- FILL_BLANK - MEDIUM (8 questions, sort_order 135-142)
  -- ==========================================

  -- Q135: 相談 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「実装方針について___したいことがあるのですが、お時間よろしいでしょうか。」', '相談（そうだん）は判断に迷う事項を上司や同僚に意見を求めることです。「報連相」の「相」にあたります。', 1, 135, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご報告', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご連絡', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご相談', TRUE, 3),
    (gen_random_uuid(), q_id, 'ご依頼', FALSE, 4);

  -- Q136: 電話応対 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「申し訳ございません、佐藤は___席を外しております。」', '「ただいま」は「今」の丁寧な表現で、不在を伝える電話応対の定番フレーズです。', 1, 136, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いま', FALSE, 1),
    (gen_random_uuid(), q_id, 'ただいま', TRUE, 2),
    (gen_random_uuid(), q_id, 'さきほど', FALSE, 3),
    (gen_random_uuid(), q_id, 'あとで', FALSE, 4);

  -- Q137: 依頼 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「お忙しいところ恐れ入りますが、テスト環境の構築を___いただけないでしょうか。」', '「ご対応」は相手に作業を依頼する際の丁寧なビジネス表現です。', 1, 137, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご確認', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご検討', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご対応', TRUE, 3),
    (gen_random_uuid(), q_id, 'ご返答', FALSE, 4);

  -- Q138: 報告 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「プルリクエストの修正が完了しましたので、___のほどよろしくお願いいたします。」', '「ご確認」は相手に内容を確認してもらう際に使うビジネス表現です。', 1, 138, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご確認', TRUE, 1),
    (gen_random_uuid(), q_id, 'ご承認', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご査収', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご検収', FALSE, 4);

  -- Q139: 電話応対 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「佐藤が戻りましたら、___いたしましょうか。」', '「折り返しお電話」は電話応対で、担当者が戻り次第電話を返す際の表現です。', 1, 139, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メールをお送り', FALSE, 1),
    (gen_random_uuid(), q_id, '折り返しお電話', TRUE, 2),
    (gen_random_uuid(), q_id, 'チャットでご連絡', FALSE, 3),
    (gen_random_uuid(), q_id, '伝言をお伝え', FALSE, 4);

  -- Q140: 依頼/報告 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「スケジュールに遅れが生じそうなため、早めに___させていただきたく存じます。」', '進捗の遅れを事前に報告・相談する報連相の基本的なフレーズです。', 1, 140, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご報告', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご連絡', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご相談', TRUE, 3),
    (gen_random_uuid(), q_id, 'ご案内', FALSE, 4);

  -- Q141: ビジネスメール (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「仕様書を添付いたしますので、___ください。」', '「ご査収」は書類やデータなどを確認して受け取るよう依頼する際のビジネス表現です。', 1, 141, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご確認', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご査収', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご了承', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご返信', FALSE, 4);

  -- Q142: 報告 (medium)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「障害が発生したため、___ご報告申し上げます。」', '「取り急ぎ」は緊急時に詳細は後回しにして、まず第一報を入れる際に使う表現です。', 1, 142, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '改めて', FALSE, 1),
    (gen_random_uuid(), q_id, '取り急ぎ', TRUE, 2),
    (gen_random_uuid(), q_id, '念のため', FALSE, 3),
    (gen_random_uuid(), q_id, 'ついでに', FALSE, 4);

  -- ==========================================
  -- FILL_BLANK - HARD (8 questions, sort_order 143-150)
  -- ==========================================

  -- Q143: 依頼 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「リリース日程について、関係各所と___の上、改めてご連絡いたします。」', '「調整」は複数の関係者の間でスケジュールや内容を合わせる際に使うビジネス用語です。', 1, 143, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '検討', FALSE, 1),
    (gen_random_uuid(), q_id, '確認', FALSE, 2),
    (gen_random_uuid(), q_id, '調整', TRUE, 3),
    (gen_random_uuid(), q_id, '協議', FALSE, 4);

  -- Q144: 報連相 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「お客様からのご要望を___した結果、次のスプリントで対応する方針になりました。」', '「検討」は提案や要望について内容を精査し判断することを意味します。', 1, 144, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '確認', FALSE, 1),
    (gen_random_uuid(), q_id, '検討', TRUE, 2),
    (gen_random_uuid(), q_id, '相談', FALSE, 3),
    (gen_random_uuid(), q_id, '報告', FALSE, 4);

  -- Q145: 電話応対 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「お電話が遠いようなのですが、もう一度___いただけますでしょうか。」', '「おっしゃって」は「言う」の尊敬語で、相手に再度発言を求める丁寧な電話応対表現です。', 1, 145, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '言って', FALSE, 1),
    (gen_random_uuid(), q_id, '話して', FALSE, 2),
    (gen_random_uuid(), q_id, '申して', FALSE, 3),
    (gen_random_uuid(), q_id, 'おっしゃって', TRUE, 4);

  -- Q146: 報告 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「本件については、___を踏まえて恒久対応策を策定いたします。」', '「根本原因」は障害やバグの本質的な原因を意味し、ポストモーテムでよく使われる表現です。', 1, 146, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '暫定対応', FALSE, 1),
    (gen_random_uuid(), q_id, '影響範囲', FALSE, 2),
    (gen_random_uuid(), q_id, '根本原因', TRUE, 3),
    (gen_random_uuid(), q_id, '再発防止', FALSE, 4);

  -- Q147: 依頼 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「恐れ入りますが、本件につきましては___いただけますよう、何卒よろしくお願い申し上げます。」', '「ご了承」は相手に事情を理解・承認してもらうよう依頼する際の丁寧なビジネス表現です。', 1, 147, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご理解', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご了承', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご承知', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご認識', FALSE, 4);

  -- Q148: 報連相 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「セキュリティ脆弱性が発見されたため、___対応が必要です。影響範囲を調査の上、本日中に第一報を入れます。」', '「至急」は非常に急いで対応が必要であることを示すビジネス用語です。障害対応でよく使われます。', 1, 148, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '順次', FALSE, 1),
    (gen_random_uuid(), q_id, '適宜', FALSE, 2),
    (gen_random_uuid(), q_id, '随時', FALSE, 3),
    (gen_random_uuid(), q_id, '至急', TRUE, 4);

  -- Q149: ビジネスメール (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「先日の会議でご指摘いただいた件について、社内で___した結果、以下の方針で進めさせていただきたく存じます。」', '「協議」は複数の関係者が集まって話し合い、方針を決めることを意味します。', 1, 149, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '議論', FALSE, 1),
    (gen_random_uuid(), q_id, '協議', TRUE, 2),
    (gen_random_uuid(), q_id, '審議', FALSE, 3),
    (gen_random_uuid(), q_id, '合議', FALSE, 4);

  -- Q150: 依頼/報告 (hard)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「本番リリース後の影響確認が完了し、問題がないことを確認いたしました。つきましては、本件の対応を___とさせていただきたく存じます。」', '「クローズ」は課題やチケットの対応を完了・終了することを意味するIT業務用語です。', 1, 150, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '保留', FALSE, 1),
    (gen_random_uuid(), q_id, '完了', FALSE, 2),
    (gen_random_uuid(), q_id, 'クローズ', TRUE, 3),
    (gen_random_uuid(), q_id, '中断', FALSE, 4);

END $$;
