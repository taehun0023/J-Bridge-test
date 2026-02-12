-- ============================================
-- JLPT Listening Quizzes (5 quizzes, 10 questions each)
-- N5/N4/N3/N2/N1 levels
-- ============================================

-- Cleanup existing listening quiz data
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'd0000001-0000-0000-0000-000000000001',
    'd0000002-0000-0000-0000-000000000002',
    'd0000003-0000-0000-0000-000000000003',
    'd0000004-0000-0000-0000-000000000004',
    'd0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'd0000001-0000-0000-0000-000000000001',
  'd0000002-0000-0000-0000-000000000002',
  'd0000003-0000-0000-0000-000000000003',
  'd0000004-0000-0000-0000-000000000004',
  'd0000005-0000-0000-0000-000000000005'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'd0000001-0000-0000-0000-000000000001',
    'd0000002-0000-0000-0000-000000000002',
    'd0000003-0000-0000-0000-000000000003',
    'd0000004-0000-0000-0000-000000000004',
    'd0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'd0000001-0000-0000-0000-000000000001',
  'd0000002-0000-0000-0000-000000000002',
  'd0000003-0000-0000-0000-000000000003',
  'd0000004-0000-0000-0000-000000000004',
  'd0000005-0000-0000-0000-000000000005'
);
DELETE FROM quizzes WHERE id IN (
  'd0000001-0000-0000-0000-000000000001',
  'd0000002-0000-0000-0000-000000000002',
  'd0000003-0000-0000-0000-000000000003',
  'd0000004-0000-0000-0000-000000000004',
  'd0000005-0000-0000-0000-000000000005'
);

-- Insert 5 listening quizzes
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment) VALUES
  ('d0000001-0000-0000-0000-000000000001', 'N5 聴解クイズ', 'jlpt_listening', 70, 15, FALSE),
  ('d0000002-0000-0000-0000-000000000002', 'N4 聴解クイズ', 'jlpt_listening', 70, 20, FALSE),
  ('d0000003-0000-0000-0000-000000000003', 'N3 聴解クイズ', 'jlpt_listening', 70, 25, FALSE),
  ('d0000004-0000-0000-0000-000000000004', 'N2 聴解クイズ', 'jlpt_listening', 70, 30, FALSE),
  ('d0000005-0000-0000-0000-000000000005', 'N1 聴解クイズ', 'jlpt_listening', 70, 35, FALSE);

-- ============================================
-- N5 聴解クイズ (10 questions)
-- Simple dialogues: 挨拶, 時間, 場所, 予定
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 - 회의 시간
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n田中：おはようございます。今日の会議は何時からですか。\n山田：10時からです。会議室Aです。\n\n質問：会議は何時からですか。', '会話の中で山田さんが「10時から」と言っています。時間（시간）を聞き取る問題です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '9시', FALSE, 1),
    (gen_random_uuid(), q_id, '10시', TRUE, 2),
    (gen_random_uuid(), q_id, '11시', FALSE, 3),
    (gen_random_uuid(), q_id, '12시', FALSE, 4);

  -- Q2: 내용 이해 - 장소
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n鈴木：すみません、コピー機はどこですか。\n佐藤：2階の事務室にありますよ。\n\n質問：コピー機はどこにありますか。', '佐藤さんが「2階の事務室」と答えています。場所（장소）を聞き取る問題です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1층 로비', FALSE, 1),
    (gen_random_uuid(), q_id, '2층 사무실', TRUE, 2),
    (gen_random_uuid(), q_id, '3층 회의실', FALSE, 3),
    (gen_random_uuid(), q_id, '지하 창고', FALSE, 4);

  -- Q3: 내용 이해 - 인사와 소개
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山本：はじめまして。山本です。営業部です。\n李：はじめまして。李です。開発部です。よろしくお願いします。\n\n質問：李さんはどの部署ですか。', '李さんは「開発部です」と自己紹介しています。所属（소속）を聞き取る問題です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영업부', FALSE, 1),
    (gen_random_uuid(), q_id, '총무부', FALSE, 2),
    (gen_random_uuid(), q_id, '개발부', TRUE, 3),
    (gen_random_uuid(), q_id, '인사부', FALSE, 4);

  -- Q4: 내용 이해 - 예정 확인
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n木村：明日は休みですか。\n中村：いいえ、明日は出勤です。土曜日が休みです。\n\n質問：中村さんの休みはいつですか。', '中村さんが「土曜日が休み」と言っています。予定（예정）を聞き取る問題です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내일', FALSE, 1),
    (gen_random_uuid(), q_id, '금요일', FALSE, 2),
    (gen_random_uuid(), q_id, '토요일', TRUE, 3),
    (gen_random_uuid(), q_id, '일요일', FALSE, 4);

  -- Q5: 세부 사항 - 시간과 장소
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：今日のランチミーティングは12時半からです。\n社員：場所はどこですか。\n部長：3階の休憩室です。\n\n質問：ランチミーティングの場所はどこですか。', '部長が「3階の休憩室」と答えています。場所の詳細（장소의 세부 사항）を聞き取る問題です。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2층 식당', FALSE, 1),
    (gen_random_uuid(), q_id, '3층 휴게실', TRUE, 2),
    (gen_random_uuid(), q_id, '1층 로비', FALSE, 3),
    (gen_random_uuid(), q_id, '4층 회의실', FALSE, 4);

  -- Q6: 세부 사항 - 수량
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社員A：コーヒーを買いに行きます。いくつ買いましょうか。\n社員B：3つお願いします。あ、やっぱり4つお願いします。田中さんの分も。\n\n質問：コーヒーはいくつ買いますか。', '最初は3つでしたが、「やっぱり4つ」と訂正しています。数量の訂正（수량 정정）を聞き取る問題です。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2개', FALSE, 1),
    (gen_random_uuid(), q_id, '3개', FALSE, 2),
    (gen_random_uuid(), q_id, '4개', TRUE, 3),
    (gen_random_uuid(), q_id, '5개', FALSE, 4);

  -- Q7: 세부 사항 - 요일 확인
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：来週の研修は何曜日ですか。\n部下：水曜日と木曜日です。\n上司：場所は本社ですか。\n部下：はい、本社の大会議室です。\n\n質問：研修は何曜日ですか。', '部下が「水曜日と木曜日」と答えています。曜日（요일）の詳細を聞き取る問題です。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '월요일과 화요일', FALSE, 1),
    (gen_random_uuid(), q_id, '화요일과 수요일', FALSE, 2),
    (gen_random_uuid(), q_id, '수요일과 목요일', TRUE, 3),
    (gen_random_uuid(), q_id, '목요일과 금요일', FALSE, 4);

  -- Q8: 화자 의도 - 의뢰의 의미
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先輩：この資料、ちょっと見てくれませんか。\n後輩：はい、わかりました。\n\n質問：先輩は何をしてほしいですか。', '「見てくれませんか」は丁寧な依頼表現です。先輩は資料を確認してほしいと思っています。依頼（의뢰）の意図を理解する問題です。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자료를 버려달라', FALSE, 1),
    (gen_random_uuid(), q_id, '자료를 확인해달라', TRUE, 2),
    (gen_random_uuid(), q_id, '자료를 복사해달라', FALSE, 3),
    (gen_random_uuid(), q_id, '자료를 가져가달라', FALSE, 4);

  -- Q9: 화자 의도 - 제안의 의미
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n同僚A：今日は残業ですか。\n同僚B：はい、少し。\n同僚A：大変ですね。手伝いましょうか。\n\n質問：同僚Aは何を言いたいですか。', '「手伝いましょうか」は申し出の表現です。同僚Aは残業を手伝う意思を示しています。提案（제안）の意図を理解する問題です。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빨리 퇴근하라고 말하고 싶다', FALSE, 1),
    (gen_random_uuid(), q_id, '야근을 도와주겠다고 말하고 싶다', TRUE, 2),
    (gen_random_uuid(), q_id, '상사에게 보고하라고 말하고 싶다', FALSE, 3),
    (gen_random_uuid(), q_id, '내일 하라고 말하고 싶다', FALSE, 4);

  -- Q10: 추론 - 다음 행동
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n受付：お名前をお願いします。\n訪問者：キムです。3時に山田さんと約束があります。\n受付：少々お待ちください。山田に連絡します。\n\n質問：受付は次に何をしますか。', '受付が「山田に連絡します」と言っているので、次の行動は山田さんへの連絡です。次の行動（다음 행동）を推論する問題です。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방문자를 안내한다', FALSE, 1),
    (gen_random_uuid(), q_id, '야마다 씨에게 연락한다', TRUE, 2),
    (gen_random_uuid(), q_id, '커피를 가져온다', FALSE, 3),
    (gen_random_uuid(), q_id, '명함을 교환한다', FALSE, 4);
END $$;

-- ============================================
-- N4 聴解クイズ (10 questions)
-- Business conversations: 電話, 依頼, 約束
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 - 전화 대응
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社員A：お電話ありがとうございます。ABC株式会社でございます。\n客：お世話になっております。DEF商事の金です。田中部長はいらっしゃいますか。\n社員A：申し訳ございません。田中はただいま外出しております。\n客：そうですか。何時ごろ戻りますか。\n\n質問：田中部長は今どこにいますか。', '社員Aが「外出しております」と答えています。田中部長は外出中（외출 중）です。電話対応（전화 대응）の内容理解問題です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의 중이다', FALSE, 1),
    (gen_random_uuid(), q_id, '외출 중이다', TRUE, 2),
    (gen_random_uuid(), q_id, '휴가 중이다', FALSE, 3),
    (gen_random_uuid(), q_id, '자리에 있다', FALSE, 4);

  -- Q2: 내용 이해 - 업무 의뢰
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：金さん、この報告書を明日までにまとめてもらえますか。\n金：はい、わかりました。フォーマットはいつものでいいですか。\n課長：ええ、いつも通りでお願いします。\n金：承知しました。\n\n質問：金さんは何を頼まれましたか。', '課長が「報告書をまとめてもらえますか」と依頼しています。報告書の作成（보고서 작성）を依頼された内容理解問題です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의 준비', FALSE, 1),
    (gen_random_uuid(), q_id, '보고서 작성', TRUE, 2),
    (gen_random_uuid(), q_id, '거래처 방문', FALSE, 3),
    (gen_random_uuid(), q_id, '자료 번역', FALSE, 4);

  -- Q3: 내용 이해 - 약속 변경
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：明日の打ち合わせですが、時間を変更してもよろしいでしょうか。\n李：はい、何時がよろしいですか。\n山田：午前10時から午後2時に変えたいのですが。\n李：2時ですね。大丈夫です。\n\n質問：打ち合わせは何時に変わりましたか。', '山田さんが「午後2時に変えたい」と言い、李さんが了承しています。約束変更（약속 변경）の内容理解問題です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오전 10시', FALSE, 1),
    (gen_random_uuid(), q_id, '오전 11시', FALSE, 2),
    (gen_random_uuid(), q_id, '오후 1시', FALSE, 3),
    (gen_random_uuid(), q_id, '오후 2시', TRUE, 4);

  -- Q4: 내용 이해 - 업무 상담
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先輩：今のプロジェクト、どうですか。\n後輩：少し大変です。データベースの設計がよくわかりません。\n先輩：じゃあ、午後に一緒に見ましょうか。\n後輩：ありがとうございます。助かります。\n\n質問：後輩は何に困っていますか。', '後輩が「データベースの設計がよくわかりません」と言っています。困っていること（곤란한 점）を理解する問題です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로그래밍 언어', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스 설계', TRUE, 2),
    (gen_random_uuid(), q_id, '네트워크 설정', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 방법', FALSE, 4);

  -- Q5: 세부 사항 - 전화 메시지
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n受付：鈴木はただいま席を外しております。\n客：そうですか。では、伝言をお願いできますか。\n受付：はい、どうぞ。\n客：3時の会議の資料を、メールで送ってほしいとお伝えください。\n受付：3時の会議の資料をメールで、ですね。承知しました。\n\n質問：客は鈴木さんに何をしてほしいですか。', '客が「3時の会議の資料をメールで送ってほしい」と伝言を頼んでいます。伝言の内容（전언 내용）の詳細を聞き取る問題です。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전화를 걸어달라', FALSE, 1),
    (gen_random_uuid(), q_id, '회의 자료를 메일로 보내달라', TRUE, 2),
    (gen_random_uuid(), q_id, '회의 시간을 변경해달라', FALSE, 3),
    (gen_random_uuid(), q_id, '자료를 인쇄해달라', FALSE, 4);

  -- Q6: 세부 사항 - 기한 확인
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：このバグの修正、いつまでにできますか。\n部下：今日中は難しいですが、明後日の午前中までには直せると思います。\n上司：明後日ですね。では、お願いします。\n部下：はい、頑張ります。\n\n質問：バグの修正はいつまでですか。', '部下が「明後日の午前中まで」と言い、上司が了承しています。期限（기한）の詳細を聞き取る問題です。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오늘 중', FALSE, 1),
    (gen_random_uuid(), q_id, '내일 오후', FALSE, 2),
    (gen_random_uuid(), q_id, '모레 오전', TRUE, 3),
    (gen_random_uuid(), q_id, '다음 주', FALSE, 4);

  -- Q7: 세부 사항 - 인원 확인
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：来月の新人研修ですが、参加者は何人ですか。\n担当者：今のところ8人です。来週もう2人入社するので、合わせて10人になる予定です。\n課長：10人ですね。研修室は大きい方を予約してください。\n担当者：はい、わかりました。\n\n質問：新人研修の参加者は最終的に何人ですか。', '担当者が「合わせて10人になる予定」と言っています。最終人数（최종 인원）の詳細を聞き取る問題です。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '6명', FALSE, 1),
    (gen_random_uuid(), q_id, '8명', FALSE, 2),
    (gen_random_uuid(), q_id, '10명', TRUE, 3),
    (gen_random_uuid(), q_id, '12명', FALSE, 4);

  -- Q8: 화자 의도 - 거절의 뉘앙스
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n同僚A：今週の金曜日、飲み会がありますが、来ませんか。\n同僚B：金曜日ですか。ちょっと予定を確認しないと…。すみません、金曜日はちょっと…。\n同僚A：そうですか。残念ですね。\n\n質問：同僚Bは飲み会に行きますか。', '「金曜日はちょっと…」は日本語の婉曲的な断り表現です。同僚Bは遠回しに断っています。婉曲的拒否（완곡한 거절）の意図を理解する問題です。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '간다', FALSE, 1),
    (gen_random_uuid(), q_id, '가지 않는다', TRUE, 2),
    (gen_random_uuid(), q_id, '아직 모른다', FALSE, 3),
    (gen_random_uuid(), q_id, '다른 사람과 간다', FALSE, 4);

  -- Q9: 화자 의도 - 겸양 표현
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：この企画書、よくできていますね。\n部下：いえいえ、まだまだです。先輩にたくさん教えていただきました。\n上司：謙遜しなくていいですよ。自信を持ってください。\n部下：ありがとうございます。\n\n質問：部下が「まだまだです」と言った意図は何ですか。', '「まだまだです」は謙遜の表現です。褒められた時に日本では謙虚に答えるのが一般的です。謙遜（겸손）の意図を理解する問題です。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정말 부족하다는 의미', FALSE, 1),
    (gen_random_uuid(), q_id, '겸손하게 대답하고 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '더 시간이 필요하다는 의미', FALSE, 3),
    (gen_random_uuid(), q_id, '도움이 필요하다는 의미', FALSE, 4);

  -- Q10: 추론 - 다음 행동
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社員A：プリンターの紙がなくなりました。\n社員B：倉庫に予備がありますよ。鍵は受付にあります。\n社員A：わかりました。じゃあ、取りに行ってきます。\n社員B：重いので、手伝いましょうか。\n社員A：大丈夫です。ありがとうございます。\n\n質問：社員Aはこの後何をしますか。', '社員Aが「取りに行ってきます」と言っています。まず受付で鍵をもらい、倉庫に紙を取りに行くと推論できます。次の行動（다음 행동）を推論する問題です。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프린터를 수리한다', FALSE, 1),
    (gen_random_uuid(), q_id, '안내 데스크에서 열쇠를 받아 창고에 간다', TRUE, 2),
    (gen_random_uuid(), q_id, '사원B와 함께 간다', FALSE, 3),
    (gen_random_uuid(), q_id, '새 종이를 주문한다', FALSE, 4);
END $$;

-- ============================================
-- N3 聴解クイズ (10 questions)
-- Work discussions: 会議, プロジェクト, 業務相談
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 - プロジェクト進捗
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：今のプロジェクトの進捗はどうですか。\n金：フロントエンドの開発は80%完了しています。ただ、バックエンドのAPI連携がまだ50%ぐらいです。\n課長：期限は来月の15日ですよね。間に合いそうですか。\n金：はい、今のペースなら大丈夫だと思います。\n課長：何か問題があったら、すぐに報告してください。\n金：はい、わかりました。\n\n質問：バックエンドのAPI連携の進捗はどのくらいですか。', '金さんが「バックエンドのAPI連携がまだ50%ぐらい」と報告しています。プロジェクト進捗（프로젝트 진행 상황）の内容理解問題です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30%', FALSE, 1),
    (gen_random_uuid(), q_id, '50%', TRUE, 2),
    (gen_random_uuid(), q_id, '80%', FALSE, 3),
    (gen_random_uuid(), q_id, '100%', FALSE, 4);

  -- Q2: 내용 이해 - ミーティング内容
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリーダー：では、今日の朝会を始めます。昨日のタスクの報告をお願いします。\n佐藤：ログイン画面のデザインを完成させました。\n李：テスト環境の構築をしていましたが、少し問題が出て、まだ途中です。\nリーダー：李さん、どんな問題ですか。\n李：Dockerのコンテナが正しく起動しないんです。\nリーダー：わかりました。佐藤さん、午前中に李さんをサポートしてもらえますか。\n佐藤：はい、大丈夫です。\n\n質問：李さんの問題は何ですか。', '李さんが「Dockerのコンテナが正しく起動しない」と説明しています。技術的な問題（기술적 문제）の内容理解問題です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ログイン画面のデザインの問題', FALSE, 1),
    (gen_random_uuid(), q_id, 'Dockerコンテナが起動しない問題', TRUE, 2),
    (gen_random_uuid(), q_id, 'テストコードのエラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバーの接続問題', FALSE, 4);

  -- Q3: 내용 이해 - 業務相談
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先輩：コードレビューで気づいたんだけど、エラーハンドリングが少し足りないと思う。\n後輩：具体的にどの部分ですか。\n先輩：APIからのレスポンスが404の場合の処理がないんだ。\n後輩：あ、確かにそうですね。try-catchで囲んでエラーメッセージを返すようにします。\n先輩：うん、それでいいと思う。あと、ログも出力しておいてね。\n後輩：わかりました。今日中に修正します。\n\n質問：先輩が指摘した問題は何ですか。', '先輩が「エラーハンドリングが足りない」「404の場合の処理がない」と指摘しています。コードレビュー（코드 리뷰）の内容理解問題です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パフォーマンスの問題', FALSE, 1),
    (gen_random_uuid(), q_id, 'セキュリティの問題', FALSE, 2),
    (gen_random_uuid(), q_id, 'エラーハンドリングの不足', TRUE, 3),
    (gen_random_uuid(), q_id, 'デザインの問題', FALSE, 4);

  -- Q4: 내용 이해 - 会議での決定事項
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nマネージャー：リリース日について相談したいのですが。\n開発者A：テストが全部終わるのは来週の金曜日の予定です。\n開発者B：QAチームのレビューも必要なので、もう1週間ほしいです。\nマネージャー：では、再来週の金曜日をリリース日にしましょう。\n開発者A：はい、それなら余裕があります。\n開発者B：了解しました。\n\n質問：リリース日はいつに決まりましたか。', 'マネージャーが「再来週の金曜日」と決定し、全員が同意しています。会議での決定事項（회의 결정 사항）の内容理解問題です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今週の金曜日', FALSE, 1),
    (gen_random_uuid(), q_id, '来週の金曜日', FALSE, 2),
    (gen_random_uuid(), q_id, '再来週の金曜日', TRUE, 3),
    (gen_random_uuid(), q_id, '来月の金曜日', FALSE, 4);

  -- Q5: 세부 사항 - 具体的な作業手順
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリーダー：デプロイの手順を確認しましょう。まず、featureブランチからdevelopにマージします。\n開発者：マージした後はどうしますか。\nリーダー：次にステージング環境でテストして、問題なければmainにマージします。\n開発者：mainにマージした後、自動デプロイされますか。\nリーダー：いいえ、mainマージ後にリリースタグを付けてから手動でデプロイします。\n開発者：わかりました。リリースタグを付けてから手動デプロイですね。\n\n質問：mainにマージした後、次にすることは何ですか。', 'リーダーが「リリースタグを付けてから手動でデプロイ」と説明しています。作業手順（작업 절차）の詳細を聞き取る問題です。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自動デプロイされる', FALSE, 1),
    (gen_random_uuid(), q_id, 'ステージングでテストする', FALSE, 2),
    (gen_random_uuid(), q_id, 'リリースタグを付けて手動デプロイする', TRUE, 3),
    (gen_random_uuid(), q_id, 'featureブランチを削除する', FALSE, 4);

  -- Q6: 세부 사항 - 担当の割り振り
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリーダー：今週のタスクを割り振ります。金さんはユーザー認証のAPIを担当してください。\n金：はい、わかりました。\nリーダー：佐藤さんはフロントエンドのダッシュボード画面をお願いします。\n佐藤：了解です。\nリーダー：山田さんはデータベースのマイグレーションスクリプトの作成をお願いします。\n山田：承知しました。いつまでですか。\nリーダー：全員、金曜日までにPRを出してください。\n\n質問：金さんの担当は何ですか。', 'リーダーが金さんに「ユーザー認証のAPI」を担当するよう指示しています。担当の割り振り（담당 배분）の詳細を聞き取る問題です。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ダッシュボード画面の開発', FALSE, 1),
    (gen_random_uuid(), q_id, 'データベースのマイグレーション', FALSE, 2),
    (gen_random_uuid(), q_id, 'ユーザー認証のAPI開発', TRUE, 3),
    (gen_random_uuid(), q_id, 'テストコードの作成', FALSE, 4);

  -- Q7: 세부 사항 - 技術的な条件
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：新しいプロジェクトのフレームワークは何を使いますか。\n開発者A：フロントエンドはReactを使う予定です。\n開発者B：バックエンドはNode.jsかGoで迷っています。\n上司：パフォーマンスが重要なので、Goにしましょう。\n開発者A：データベースはPostgreSQLでいいですか。\n上司：はい、PostgreSQLでお願いします。\n開発者B：わかりました。では、React + Go + PostgreSQLですね。\n\n質問：バックエンドのフレームワークは何に決まりましたか。', '上司が「Goにしましょう」と決定しています。技術選定（기술 선정）の詳細を聞き取る問題です。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'React', FALSE, 1),
    (gen_random_uuid(), q_id, 'Node.js', FALSE, 2),
    (gen_random_uuid(), q_id, 'Go', TRUE, 3),
    (gen_random_uuid(), q_id, 'Python', FALSE, 4);

  -- Q8: 화자 의도 - 暗黙の要求
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：このコード、動くことは動くんだけど、ちょっと読みにくいかなと思って。\n開発者：あ、そうですか。具体的にはどのあたりですか。\n課長：変数名が短すぎて、何を表しているかわかりにくいんだよね。あと、コメントも少ないし。\n開発者：なるほど、わかりました。\n課長：まあ、今すぐじゃなくていいけど、次のスプリントまでには直してほしいな。\n\n質問：課長の発言の意図は何ですか。', '課長は「読みにくい」「変数名が短すぎる」「コメントも少ない」と指摘した上で「次のスプリントまでには直してほしい」と言っています。暗黙の要求（암묵적 요구）を理解する問題です。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードを書き直してほしい', FALSE, 1),
    (gen_random_uuid(), q_id, 'コードの可読性を改善してほしい', TRUE, 2),
    (gen_random_uuid(), q_id, 'パフォーマンスを改善してほしい', FALSE, 3),
    (gen_random_uuid(), q_id, 'テストコードを追加してほしい', FALSE, 4);

  -- Q9: 화자 의도 - 遠回しな提案
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n開発者A：この処理、全部一つの関数に書いてるんですけど。\n開発者B：うーん、関数が300行もあるのは、ちょっとどうかなと思うんだけど。\n開発者A：長いですかね。\n開発者B：他のプロジェクトでは、一つの関数は50行以内にするルールがあったりするよ。\n開発者A：なるほど、分割した方がいいですか。\n開発者B：その方がテストも書きやすいし、メンテナンスもしやすいと思うよ。\n\n質問：開発者Bが本当に言いたいことは何ですか。', '開発者Bは「300行は長い」「50行以内のルール」「テストもメンテナンスもしやすい」と遠回しに関数の分割を提案しています。遠回しな提案（완곡한 제안）を理解する問題です。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今のままでいいと思っている', FALSE, 1),
    (gen_random_uuid(), q_id, '関数を分割すべきだと提案している', TRUE, 2),
    (gen_random_uuid(), q_id, 'テストコードを書くべきだと言っている', FALSE, 3),
    (gen_random_uuid(), q_id, '他のプロジェクトに移るべきだと言っている', FALSE, 4);

  -- Q10: 추론 - 프로젝트의 다음 단계
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nPM：現在の状況を整理します。開発は完了、単体テストもパスしています。\n開発者：はい、CIも全部グリーンです。\nPM：QAチームのテストはどうですか。\nQA：明日で完了予定です。今のところ重大なバグはありません。\nPM：クライアントへのデモは来週の月曜日に予定していますが、問題ないですね。\nQA：はい、金曜日にはQAレポートを提出します。\nPM：では、週末に最終確認をして、月曜日のデモに備えましょう。\n\n質問：この後、チームが次にすることは何ですか。', 'PMが「週末に最終確認をして、月曜日のデモに備える」と言っています。まずQAテストの完了を待ち、最終確認に入ると推論できます。次のステップ（다음 단계）を推論する問題です。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発をやり直す', FALSE, 1),
    (gen_random_uuid(), q_id, 'すぐにリリースする', FALSE, 2),
    (gen_random_uuid(), q_id, 'QAテスト完了後、最終確認してデモに備える', TRUE, 3),
    (gen_random_uuid(), q_id, '新しい機能を追加する', FALSE, 4);
END $$;

-- ============================================
-- N2 聴解クイズ (10 questions)
-- Technical discussions: レビュー, 障害対応, 設計
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 - 障害対応の状況
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nオペレーター：緊急連絡です。本番環境でエラーが発生しています。\nリーダー：どのサービスですか。\nオペレーター：決済サービスです。トランザクションがタイムアウトしています。\nリーダー：影響範囲は把握できていますか。\nオペレーター：現在、全ユーザーの約30%が影響を受けています。\nリーダー：わかりました。すぐにインシデント対応チームを召集してください。\nオペレーター：はい、Slackで緊急チャンネルを立ち上げます。\nリーダー：DBチームにも連絡してください。データベースの負荷が原因かもしれません。\n\n質問：現在発生している障害は何ですか。', 'オペレーターが「決済サービスのトランザクションがタイムアウトしている」と報告しています。障害内容（장애 내용）の理解問題です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ログインサービスの停止', FALSE, 1),
    (gen_random_uuid(), q_id, '決済サービスのトランザクションタイムアウト', TRUE, 2),
    (gen_random_uuid(), q_id, 'メールサービスの遅延', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルストレージの容量不足', FALSE, 4);

  -- Q2: 내용 이해 - 設計レビューの議論
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nアーキテクト：今回のシステムでは、マイクロサービスアーキテクチャを採用したいと考えています。\n開発者A：モノリスの方がシンプルではないですか。\nアーキテクト：確かにシンプルですが、今後のスケーラビリティを考えると、サービスを分割しておいた方がいいと思います。\n開発者B：チームの規模的にマイクロサービスを運用できますか。DevOpsの負担が大きくなりませんか。\nアーキテクト：その点は懸念していますが、Kubernetesを使えば運用コストを抑えられると考えています。\n開発者A：なるほど。ただ、最初はモジュラーモノリスから始めて、必要に応じて分離するのはどうですか。\nアーキテクト：それは良い折衷案ですね。検討しましょう。\n\n質問：アーキテクトが提案したアーキテクチャは何ですか。', 'アーキテクトが「マイクロサービスアーキテクチャを採用したい」と提案しています。設計議論（설계 논의）の内容理解問題です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'モノリスアーキテクチャ', FALSE, 1),
    (gen_random_uuid(), q_id, 'マイクロサービスアーキテクチャ', TRUE, 2),
    (gen_random_uuid(), q_id, 'サーバーレスアーキテクチャ', FALSE, 3),
    (gen_random_uuid(), q_id, 'モジュラーモノリス', FALSE, 4);

  -- Q3: 내용 이해 - コードレビューの指摘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nレビュアー：PRを見ましたが、いくつか気になる点があります。\n開発者：はい、お願いします。\nレビュアー：まず、N+1クエリの問題があります。ユーザー一覧を取得する際に、各ユーザーのプロフィール情報を個別にクエリしています。\n開発者：JOINで一括取得すべきということですね。\nレビュアー：そうです。あと、パスワードのハッシュ化にMD5を使っていますが、bcryptに変更してください。セキュリティ上の問題があります。\n開発者：わかりました。両方修正して再度PRを出します。\nレビュアー：お願いします。それ以外のロジックは問題ありません。\n\n質問：レビュアーが指摘したセキュリティの問題は何ですか。', 'レビュアーが「パスワードのハッシュ化にMD5を使っている」ことを「セキュリティ上の問題」と指摘しています。セキュリティ（보안）の内容理解問題です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SQLインジェクションの脆弱性', FALSE, 1),
    (gen_random_uuid(), q_id, 'XSSの脆弱性', FALSE, 2),
    (gen_random_uuid(), q_id, 'パスワードのハッシュ化にMD5を使用している', TRUE, 3),
    (gen_random_uuid(), q_id, 'HTTPS未対応', FALSE, 4);

  -- Q4: 내용 이해 - 障害の原因調査
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nエンジニアA：障害の原因が特定できました。\nリーダー：何が原因でしたか。\nエンジニアA：昨日のデプロイでキャッシュの有効期限の設定を変更したのですが、その際にTTLを秒単位ではなくミリ秒単位で設定してしまったんです。\nリーダー：つまり、キャッシュがすぐに無効になって、DBに直接アクセスが集中したということですか。\nエンジニアA：はい、その通りです。TTLを3600秒に設定すべきところを3600ミリ秒、つまり3.6秒に設定してしまいました。\nエンジニアB：それでDBの負荷が急上昇したんですね。\nリーダー：すぐにホットフィックスを出してください。\nエンジニアA：はい、もうPRを作成しています。\n\n質問：障害の根本原因は何ですか。', 'エンジニアAが「TTLを秒単位ではなくミリ秒単位で設定してしまった」と原因を特定しています。障害原因（장애 원인）の内容理解問題です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバーのメモリ不足', FALSE, 1),
    (gen_random_uuid(), q_id, 'ネットワークの障害', FALSE, 2),
    (gen_random_uuid(), q_id, 'キャッシュTTLの単位設定ミス', TRUE, 3),
    (gen_random_uuid(), q_id, 'データベースのバグ', FALSE, 4);

  -- Q5: 세부 사항 - パフォーマンス要件の数値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nPM：SLAについて確認したいのですが、レスポンスタイムの要件はどうなっていますか。\nアーキテクト：APIの平均レスポンスタイムは200ミリ秒以内、95パーセンタイルで500ミリ秒以内です。\nPM：可用性は？\nアーキテクト：99.9%のアップタイムを保証します。月間のダウンタイムは約43分以内ということになります。\nPM：前回のプロジェクトでは99.5%だったので、だいぶ厳しくなりますね。\nアーキテクト：はい、そのためにマルチAZの構成を検討しています。\nPM：コストとのバランスも考える必要がありますね。\nアーキテクト：はい、次の会議でコスト試算を出します。\n\n質問：APIの95パーセンタイルのレスポンスタイム要件は何ミリ秒ですか。', 'アーキテクトが「95パーセンタイルで500ミリ秒以内」と説明しています。パフォーマンス要件（성능 요건）の数値の詳細を聞き取る問題です。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '100ミリ秒', FALSE, 1),
    (gen_random_uuid(), q_id, '200ミリ秒', FALSE, 2),
    (gen_random_uuid(), q_id, '500ミリ秒', TRUE, 3),
    (gen_random_uuid(), q_id, '1000ミリ秒', FALSE, 4);

  -- Q6: 세부 사항 - 障害対応の手順
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリーダー：インシデント対応の手順を確認しましょう。まず、影響範囲を特定します。\nエンジニア：影響範囲の特定後は何をしますか。\nリーダー：次にサービスの切り分けを行い、原因箇所を特定します。可能であれば、一時的なワークアラウンドを適用します。\nエンジニア：その後、根本対応ですか。\nリーダー：はい。ただし、根本対応は翌営業日でも構いません。重要なのは、まずサービスを復旧させることです。\nエンジニア：復旧後はポストモーテムを書くんですよね。\nリーダー：そうです。48時間以内にポストモーテムを作成してチームに共有してください。\nエンジニア：わかりました。\n\n質問：ポストモーテムの作成期限はいつですか。', 'リーダーが「48時間以内にポストモーテムを作成」と指示しています。対応手順（대응 절차）の詳細を聞き取る問題です。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '12時間以内', FALSE, 1),
    (gen_random_uuid(), q_id, '24時間以内', FALSE, 2),
    (gen_random_uuid(), q_id, '48時間以内', TRUE, 3),
    (gen_random_uuid(), q_id, '1週間以内', FALSE, 4);

  -- Q7: 세부 사항 - データベース設計の仕様
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nDBA：テーブル設計について相談があります。ユーザーのアクティビティログをどう保存するか決めたいのですが。\n開発者：今の案では、RDBにそのまま保存する予定ですが。\nDBA：アクティビティログは書き込みが多いので、RDBだと負荷が高くなります。NoSQLか、時系列データベースの方が適していると思います。\n開発者：具体的にはどのDBを検討していますか。\nDBA：TimescaleDBはどうでしょうか。PostgreSQLの拡張なので、既存のインフラと互換性があります。\n開発者：なるほど。保持期間はどうしますか。\nDBA：直近90日分はホットデータとして保持し、それ以前のデータはS3にアーカイブする方針でいきたいと思います。\n開発者：合理的ですね。その方向で設計書を作りましょう。\n\n質問：アクティビティログのホットデータの保持期間は何日ですか。', 'DBAが「直近90日分はホットデータとして保持」と説明しています。データ保持期間（데이터 보존 기간）の詳細を聞き取る問題です。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30日', FALSE, 1),
    (gen_random_uuid(), q_id, '60日', FALSE, 2),
    (gen_random_uuid(), q_id, '90日', TRUE, 3),
    (gen_random_uuid(), q_id, '180日', FALSE, 4);

  -- Q8: 화자 의도 - 技術的な懸念の伝え方
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nPM：クライアントがこの機能を来週までに欲しいと言っています。\n開発者：来週ですか…。技術的には実装可能ですが、テストを省略することになりますね。\nPM：テストなしでも大丈夫ですか。\n開発者：動くものは出せますが、品質の保証はできかねます。本番で問題が起きた場合、対応にさらに時間がかかる可能性があります。\nPM：つまり、スケジュールを延ばした方がいいということですか。\n開発者：できれば2週間いただけると、テストも含めて品質を担保できます。\nPM：クライアントと再調整してみます。\n\n質問：開発者が本当に伝えたいことは何ですか。', '開発者は「品質の保証はできかねます」「問題が起きた場合、さらに時間がかかる」と遠回しにスケジュール延長を求めています。技術的懸念の伝え方（기술적 우려 전달）の意図を理解する問題です。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実装ができないと言いたい', FALSE, 1),
    (gen_random_uuid(), q_id, 'テストなしでリリースすべきだと言いたい', FALSE, 2),
    (gen_random_uuid(), q_id, 'スケジュールを延長してテストの時間を確保したい', TRUE, 3),
    (gen_random_uuid(), q_id, 'クライアントの要望を断りたい', FALSE, 4);

  -- Q9: 화자 의도 - 提案の裏にある意図
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nシニアエンジニア：最近、同じようなバグが繰り返し発生していませんか。\nジュニアエンジニア：はい、特に認証周りで似たようなエラーが出ています。\nシニアエンジニア：もしかすると、認証モジュールの設計自体に根本的な問題があるのかもしれませんね。\nジュニアエンジニア：リファクタリングが必要ということですか。\nシニアエンジニア：そうですね。パッチを当て続けるよりも、一度しっかり設計し直した方が、長い目で見れば工数が減ると思います。\nジュニアエンジニア：確かに、毎回バグ修正に時間を取られていますからね。\nシニアエンジニア：次のスプリントプランニングで提案してみましょうか。\n\n質問：シニアエンジニアの提案の本質は何ですか。', 'シニアエンジニアは繰り返すバグを例に挙げ、「設計し直した方が長い目で見れば工数が減る」と認証モジュールのリファクタリングを提案しています。提案の本質（제안의 본질）を理解する問題です。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグ修正を優先すべきだ', FALSE, 1),
    (gen_random_uuid(), q_id, '認証モジュールを根本的にリファクタリングすべきだ', TRUE, 2),
    (gen_random_uuid(), q_id, '新しい認証ライブラリを導入すべきだ', FALSE, 3),
    (gen_random_uuid(), q_id, 'ジュニアエンジニアのスキルを向上させるべきだ', FALSE, 4);

  -- Q10: 추론 - 障害対応後の展開
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCTO：今回の障害について振り返りましょう。原因は何でしたか。\nエンジニア：本番環境の設定ファイルを手動で更新した際のミスです。\nCTO：手動更新ですか。なぜ自動化されていなかったのですか。\nエンジニア：元々は手動運用で問題なかったのですが、システム規模が大きくなって管理が追いつかなくなりました。\nCTO：今後の対策はどうしますか。\nエンジニア：設定ファイルの管理をGitOpsに移行し、PRベースで変更管理を行う方針です。\nCTO：いいですね。それに加えて、設定変更時の自動テストも組み込んでください。\nエンジニア：はい、CI/CDパイプラインに設定検証のステップを追加します。\nCTO：来月のアーキテクチャレビューで進捗を報告してください。\n\n質問：今後、設定ファイルの管理はどう変わりますか。', 'エンジニアが「GitOpsに移行し、PRベースで変更管理を行う」と対策を説明し、CTOが「自動テストも組み込む」よう指示しています。今後の改善策（향후 개선 방안）を推論する問題です。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '引き続き手動で管理する', FALSE, 1),
    (gen_random_uuid(), q_id, '外部ベンダーに委託する', FALSE, 2),
    (gen_random_uuid(), q_id, 'GitOpsとCI/CDによる自動管理に移行する', TRUE, 3),
    (gen_random_uuid(), q_id, '設定ファイルの使用をやめる', FALSE, 4);
END $$;

-- ============================================
-- N1 聴解クイズ (10 questions)
-- Complex meetings: 戦略, アーキテクチャ, 提案
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 - 技術戦略の議論
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCTO：来期の技術戦略について議論したいと思います。現在、レガシーシステムの維持コストが年間予算の40%を占めている状況です。\nVP：それは深刻ですね。段階的にモダナイゼーションを進めるべきではないでしょうか。\nCTO：同意します。ただし、一度にすべてを刷新するのはリスクが高すぎます。ストラングラーフィグパターンを適用して、段階的に移行することを提案します。\nアーキテクト：具体的にはどのサービスから着手しますか。\nCTO：まず、最もビジネスインパクトが大きい受注管理システムから始めたいと考えています。\nVP：受注管理は確かに重要ですが、依存関係が多いので、在庫管理システムを先にモダナイズした方が移行がスムーズではないですか。\nCTO：なるほど、依存関係の観点は重要ですね。在庫管理から着手する方向で検討しましょう。\nアーキテクト：在庫管理であれば、3か月で最初のフェーズを完了できると思います。\nCTO：では、来月の取締役会でこの計画を提案します。\nVP：コスト試算も準備しておきましょう。\n\n質問：最終的にどのシステムから着手することになりましたか。', 'CTOが最初は受注管理を提案しましたが、VPの「依存関係」の指摘を受けて「在庫管理から着手する方向で検討しましょう」と変更しています。技術戦略の議論（기술 전략 논의）における最終決定を理解する問題です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '受注管理システム', FALSE, 1),
    (gen_random_uuid(), q_id, '在庫管理システム', TRUE, 2),
    (gen_random_uuid(), q_id, '顧客管理システム', FALSE, 3),
    (gen_random_uuid(), q_id, '会計システム', FALSE, 4);

  -- Q2: 내용 이해 - アーキテクチャ提案
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nアーキテクト：現在のイベント処理基盤について、改善提案があります。\nPM：どのような改善ですか。\nアーキテクト：現在はポーリング方式でイベントを処理していますが、イベント駆動アーキテクチャへの移行を提案します。具体的には、Apache Kafkaをメッセージブローカーとしてイベントソーシングパターンを導入したいと考えています。\n開発者A：Kafkaの運用経験がチームにありませんが、大丈夫でしょうか。\nアーキテクト：マネージドサービスのConfluent Cloudを利用することで、運用負荷を最小限に抑えられます。\n開発者B：イベントのスキーマ管理はどうしますか。\nアーキテクト：Avroスキーマを使い、Schema Registryで一元管理します。スキーマの後方互換性も検証できます。\nPM：移行期間中は既存システムと並行運用になりますか。\nアーキテクト：はい、移行期間は3か月を見込んでいます。その間はデュアルライトで両方のシステムに書き込みます。\nPM：リスクは把握できましたか。了解です、進めましょう。\n\n質問：提案されたメッセージブローカーは何ですか。', 'アーキテクトが「Apache Kafkaをメッセージブローカーとしてイベントソーシングパターンを導入」と提案しています。アーキテクチャ提案（아키텍처 제안）の内容理解問題です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'RabbitMQ', FALSE, 1),
    (gen_random_uuid(), q_id, 'Apache Kafka', TRUE, 2),
    (gen_random_uuid(), q_id, 'Amazon SQS', FALSE, 3),
    (gen_random_uuid(), q_id, 'Redis Pub/Sub', FALSE, 4);

  -- Q3: 내용 이해 - 組織戦略の方針
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：海外拠点との開発体制について見直しが必要だと感じています。\n課長A：現在のオフショア開発では、コミュニケーションコストが予想以上にかかっていますね。\n部長：はい。特にタイムゾーンの違いによるレスポンスの遅延が大きな課題です。\n課長B：ニアショアに切り替えるという選択肢もありますが、コスト面ではオフショアの方が有利です。\n部長：そこで、ハイブリッドモデルを検討しています。コア機能の開発は国内チームで行い、テストやドキュメンテーションなどはオフショアに任せるという分担です。\n課長A：コア機能の定義を明確にする必要がありますね。\n部長：その通りです。来週までに各チームのリーダーと相談して、コア機能のリストを作ってください。\n課長B：承知しました。オフショアチームへの説明はどうしますか。\n部長：方針が固まったら、私からブリッジSEを通じて説明します。\n\n質問：部長が提案している開発体制は何ですか。', '部長が「ハイブリッドモデル」として「コア機能の開発は国内チーム、テストやドキュメンテーションはオフショア」という分担を提案しています。組織戦略（조직 전략）の内容理解問題です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '完全に国内開発に切り替える', FALSE, 1),
    (gen_random_uuid(), q_id, 'ニアショア開発に移行する', FALSE, 2),
    (gen_random_uuid(), q_id, 'コア機能は国内、それ以外はオフショアのハイブリッドモデル', TRUE, 3),
    (gen_random_uuid(), q_id, 'オフショア開発を拡大する', FALSE, 4);

  -- Q4: 내용 이해 - クラウド移行計画
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nインフラリーダー：オンプレミスからクラウドへの移行計画について報告します。\nCTO：現在の進捗はどうですか。\nインフラリーダー：全体の120サービスのうち、45サービスが移行完了です。現在、第2フェーズとして基幹系システムの移行準備を進めています。\nCTO：基幹系はリスクが高いですが、どのような移行戦略を取りますか。\nインフラリーダー：リフト＆シフトではなく、リファクタリングを行いながら移行します。特にデータベースはAurora PostgreSQLへの移行を計画しています。\nCTO：ダウンタイムはどの程度見込んでいますか。\nインフラリーダー：DMS（Database Migration Service）を使うことで、ダウンタイムは最大でも2時間以内に抑えられる見込みです。事前にリハーサルを3回実施する予定です。\nCTO：ロールバック計画は用意していますか。\nインフラリーダー：はい、移行後72時間はオンプレミス環境を維持し、問題があればすぐに切り戻せるようにします。\nCTO：了解しました。次回の経営会議で報告しましょう。\n\n質問：移行完了したサービスの数はいくつですか。', 'インフラリーダーが「120サービスのうち、45サービスが移行完了」と報告しています。移行進捗（마이그레이션 진행 상황）の内容理解問題です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30サービス', FALSE, 1),
    (gen_random_uuid(), q_id, '45サービス', TRUE, 2),
    (gen_random_uuid(), q_id, '80サービス', FALSE, 3),
    (gen_random_uuid(), q_id, '120サービス', FALSE, 4);

  -- Q5: 세부 사항 - セキュリティ監査の結果
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCISO：第三者によるペネトレーションテストの結果が出ました。\nセキュリティエンジニア：重大な脆弱性はありましたか。\nCISO：クリティカルが2件、ハイが5件、ミディアムが12件です。\nセキュリティエンジニア：クリティカルの2件はどのような内容ですか。\nCISO：1つはAPIエンドポイントの認証バイパスの脆弱性、もう1つはストアドXSSの脆弱性です。\nセキュリティエンジニア：認証バイパスは致命的ですね。すぐに対応が必要です。\nCISO：はい。クリティカルは48時間以内、ハイは1週間以内に対応完了してください。ミディアムは来月のスプリントで対応する方針です。\nセキュリティエンジニア：認証バイパスの方は、JWTの検証ロジックに問題があるようです。今日中にパッチを作成します。\nCISO：お願いします。対応完了後、再テストも実施してください。\n\n質問：ハイレベルの脆弱性の対応期限はいつまでですか。', 'CISOが「ハイは1週間以内に対応完了」と指示しています。対応期限（대응 기한）の詳細を聞き取る問題です。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '24時間以内', FALSE, 1),
    (gen_random_uuid(), q_id, '48時間以内', FALSE, 2),
    (gen_random_uuid(), q_id, '1週間以内', TRUE, 3),
    (gen_random_uuid(), q_id, '来月のスプリント', FALSE, 4);

  -- Q6: 세부 사항 - 予算配分の数値
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCFO：来期のIT予算の配分について議論しましょう。全体予算は前年比15%増の5億円です。\nCTO：ありがとうございます。内訳の提案ですが、インフラ費用に2億円、開発人件費に1.5億円、ライセンス費用に8000万円、残りの2000万円をR&Dに充てたいと考えています。\nCFO：R&Dの割合が少なくないですか。競合他社は10%程度をR&Dに投資しています。\nCTO：確かにそうですね。ただ、今期はクラウド移行のコストが大きいので、来期以降はR&Dの比率を増やす予定です。\nCFO：クラウド移行が完了すれば、インフラ費用は下がる見込みですか。\nCTO：はい、移行完了後はインフラ費用が約30%削減できると試算しています。\nCFO：その削減分をR&Dに回すということですね。\nCTO：はい、その通りです。\n\n質問：クラウド移行完了後のインフラ費用の削減率はどの程度ですか。', 'CTOが「移行完了後はインフラ費用が約30%削減できる」と試算しています。予算の数値（예산 수치）の詳細を聞き取る問題です。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約10%', FALSE, 1),
    (gen_random_uuid(), q_id, '約20%', FALSE, 2),
    (gen_random_uuid(), q_id, '約30%', TRUE, 3),
    (gen_random_uuid(), q_id, '約50%', FALSE, 4);

  -- Q7: 세부 사항 - 技術評価の基準
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nVPoE：エンジニアの評価制度を見直したいのですが。\nHR：現在の課題は何ですか。\nVPoE：技術力の評価基準が曖昧で、マネージャーの主観に依存しています。客観的な指標を導入したいのです。\nHR：具体的にはどのような指標を考えていますか。\nVPoE：4つの軸で評価します。技術的な深さ、技術的な広さ、アウトプットの品質、それからチームへの貢献度です。\nHR：定量化は可能ですか。\nVPoE：コードレビューの質とPRのマージ率、障害対応の頻度と解決時間、技術ブログやLTでの発信などを指標として使います。\nHR：360度フィードバックも組み合わせると、より公平になりませんか。\nVPoE：いいアイデアですね。ピアレビューの仕組みも取り入れましょう。\nHR：では、来四半期からトライアルを始めましょうか。\nVPoE：はい、まずは一つの部署でパイロット運用してから全社展開する方針で進めましょう。\n\n質問：VPoEが提案した評価の軸はいくつですか。', 'VPoEが「技術的な深さ、技術的な広さ、アウトプットの品質、チームへの貢献度」の4つの軸を提案しています。評価基準（평가 기준）の詳細を聞き取る問題です。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2つ', FALSE, 1),
    (gen_random_uuid(), q_id, '3つ', FALSE, 2),
    (gen_random_uuid(), q_id, '4つ', TRUE, 3),
    (gen_random_uuid(), q_id, '5つ', FALSE, 4);

  -- Q8: 화자 의도 - 経営層への提言の真意
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCTO：先日の障害で、SLAの99.9%を達成できませんでした。\n社長：原因は何ですか。\nCTO：直接的な原因はデプロイ時のヒューマンエラーですが、本質的な問題は自動化の遅れにあると考えています。\n社長：自動化にはどの程度の投資が必要ですか。\nCTO：CI/CDパイプラインの整備、IaCの導入、監視基盤の強化で、約6000万円と見込んでいます。\n社長：その投資に見合うリターンはありますか。\nCTO：障害による機会損失は昨年だけで約1億円でした。自動化により障害頻度を80%削減できれば、1年で投資回収が可能です。\n社長：なるほど。ただ、6000万円は大きな金額ですね。\nCTO：おっしゃる通りです。ただ、このままでは同様の障害が繰り返されるリスクがあります。投資しないことのコストの方が大きいと考えています。\n\n質問：CTOが「投資しないことのコストの方が大きい」と言った真意は何ですか。', 'CTOは障害損失（1億円）と投資額（6000万円）を比較し、「投資しないことのコスト」つまり自動化しなければ障害が繰り返され損失が続くというリスクを強調しています。経営層への提言（경영진 제언）の真意を理解する問題です。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '予算を削減すべきだと主張している', FALSE, 1),
    (gen_random_uuid(), q_id, '自動化投資は不要だと伝えている', FALSE, 2),
    (gen_random_uuid(), q_id, '自動化しなければ障害損失が投資額を上回り続けると警告している', TRUE, 3),
    (gen_random_uuid(), q_id, '社長の判断に従うと言っている', FALSE, 4);

  -- Q9: 화자 의도 - 技術選定における政治的判断
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nVP：次期プロジェクトのクラウドプロバイダーについて、AWSとGCPで意見が割れていますね。\nチームA Lead：私たちのチームはAWSの経験が豊富なので、AWSを推します。移行コストも抑えられます。\nチームB Lead：GCPのBigQueryは機械学習パイプラインとの親和性が高いです。将来的なデータ活用を考えると、GCPの方が有利です。\nVP：どちらにも一理ありますが、現在の取引先の多くがAWSを使っていて、技術パートナーシップの関係もあります。\nチームB Lead：技術的な優位性よりもビジネス関係を優先するということでしょうか。\nVP：いえ、技術的な評価も重要です。ただし、エコシステム全体を考慮する必要があるということです。GCPの利点については、マルチクラウド戦略の中で取り入れることも検討しましょう。\nチームA Lead：マルチクラウドはコストがかかりますが、ベンダーロックインのリスクは減りますね。\nVP：最終的には来週のステアリングコミッティで決定しますが、メインはAWSで、データ分析基盤のみGCPを使うというハイブリッド案を提案するつもりです。\n\n質問：VPの発言から読み取れる判断基準は何ですか。', 'VPは技術面だけでなく「取引先がAWSを使っている」「技術パートナーシップの関係」「エコシステム全体」を考慮し、ハイブリッド案を提案しています。技術選定における総合判断（기술 선정의 종합적 판단）の意図を理解する問題です。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '純粋に技術的な優位性だけで判断している', FALSE, 1),
    (gen_random_uuid(), q_id, 'コストだけを重視している', FALSE, 2),
    (gen_random_uuid(), q_id, '技術面とビジネス関係・エコシステムを総合的に判断している', TRUE, 3),
    (gen_random_uuid(), q_id, 'チームAの意見をそのまま採用している', FALSE, 4);

  -- Q10: 추론 - 組織の今後の方向性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCEO：DX推進の進捗について聞かせてください。\nCDO：現在、3つの施策を並行して進めています。1つ目は社内業務のデジタル化、2つ目は顧客接点のデジタル化、3つ目はデータドリブン経営の基盤構築です。\nCEO：成果は出ていますか。\nCDO：社内業務のペーパーレス化により、年間約3000万円のコスト削減を実現しました。ただし、データドリブン経営についてはまだ道半ばです。\nCEO：何がボトルネックになっていますか。\nCDO：データサイロの問題です。各部署がそれぞれ独自のツールでデータを管理しており、統合的な分析ができていません。\nCEO：解決策はありますか。\nCDO：全社共通のデータレイクを構築し、各部署のデータを一元管理する仕組みが必要です。加えて、データリテラシーの向上も不可欠です。ツールを導入しても、使いこなせる人材がいなければ意味がありません。\nCEO：人材育成にはどのくらいの期間が必要ですか。\nCDO：基礎的なデータ分析スキルの研修は3か月で完了しますが、組織文化として定着させるには1〜2年かかると見込んでいます。\nCEO：長期的な取り組みということですね。引き続き進めてください。\n\n質問：CDOの発言から、DX推進の最大の課題は何だと推論できますか。', 'CDOは「データサイロの問題」を挙げた上で、「全社共通のデータレイク」と「データリテラシーの向上」が必要と述べ、「組織文化として定着させるには1〜2年」と言及しています。技術面だけでなく組織・人材面の課題が最大のボトルネックだと推論できます。DX推進の課題（DX 추진 과제）を総合的に推論する問題です。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '予算の不足', FALSE, 1),
    (gen_random_uuid(), q_id, '技術的な制約', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの分断と組織全体のデータリテラシー不足', TRUE, 3),
    (gen_random_uuid(), q_id, '経営層の理解不足', FALSE, 4);
END $$;
