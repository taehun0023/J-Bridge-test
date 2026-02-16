-- ============================================
-- J-Bridge Assessment: JLPT Reading Comprehension
-- 60 additional questions for 生活日本語総合試験
-- Quiz ID: a0000001-0000-0000-0000-000000000001
-- sort_order: 91-150 (appended to existing 90 questions)
-- ============================================

-- ============================================
-- EASY (N3 level) - 20 questions (sort_order 91-110)
-- Short IT workplace passages, straightforward comprehension
-- ============================================

-- Q91
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「明日の会議は10時から始まります。会議室Bを使います。資料を準備してください。」\n\nこのメールの内容として正しいものはどれですか？', '会議の時間（10時）、場所（会議室B）、準備すること（資料）が書かれています。', 1, 91, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의가 취소되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '내일 10시에 회의실B에서 회의가 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '회의 장소가 변경되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '자료는 필요 없다', FALSE, 4);
END $$;

-- Q92
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「システムのメンテナンスのため、今週の金曜日、午後6時から午後10時までサーバーを止めます。この時間はシステムが使えません。」\n\nメンテナンス中にできないことは何ですか？', 'メンテナンス中はサーバーが止まるため、システムを使うことができません。', 1, 92, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시스템 사용', TRUE, 1),
    (gen_random_uuid(), q_id, '전화 걸기', FALSE, 2),
    (gen_random_uuid(), q_id, '메일 보내기', FALSE, 3),
    (gen_random_uuid(), q_id, '자료 인쇄', FALSE, 4);
END $$;

-- Q93
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「田中さんへ\nお疲れ様です。今日の打ち合わせの議事録を送ります。確認をお願いします。何か問題があれば、連絡してください。\n佐藤」\n\n佐藤さんは田中さんに何をしてほしいですか？', '佐藤さんは議事録の「確認」をお願いしています。', 1, 93, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의록을 작성해 달라', FALSE, 1),
    (gen_random_uuid(), q_id, '회의에 참석해 달라', FALSE, 2),
    (gen_random_uuid(), q_id, '자료를 보내 달라', FALSE, 3),
    (gen_random_uuid(), q_id, '회의록을 확인해 달라', TRUE, 4);
END $$;

-- Q94
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「新しいプロジェクトのメンバーを募集しています。Javaの経験がある人は、山田リーダーに連絡してください。締め切りは来週の月曜日です。」\n\nこの掲示板の目的は何ですか？', 'Java経験者を対象に新しいプロジェクトのメンバーを募集しています。', 1, 94, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트 멤버 모집', TRUE, 1),
    (gen_random_uuid(), q_id, 'Java 교육 안내', FALSE, 2),
    (gen_random_uuid(), q_id, '프로젝트 완료 보고', FALSE, 3),
    (gen_random_uuid(), q_id, '야마다 리더 소개', FALSE, 4);
END $$;

-- Q95
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今月から、会社のパソコンのパスワードを毎月変えなければなりません。パスワードは8文字以上にしてください。」\n\nパスワードについて正しいものはどれですか？', 'パスワードは毎月変更し、8文字以上にする必要があります。', 1, 95, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3개월마다 변경한다', FALSE, 1),
    (gen_random_uuid(), q_id, '6자 이상이어야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '매달 변경하고 8자 이상이어야 한다', TRUE, 3),
    (gen_random_uuid(), q_id, '변경할 필요가 없다', FALSE, 4);
END $$;

-- Q96
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「お客様からバグの報告がありました。ログイン画面でエラーが出るそうです。今日中に原因を調べてください。」\n\n今日中にしなければならないことは何ですか？', '「今日中に原因を調べてください」と書かれているので、バグの原因調査が今日の仕事です。', 1, 96, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '고객에게 연락하기', FALSE, 1),
    (gen_random_uuid(), q_id, '로그인 화면 디자인 변경', FALSE, 2),
    (gen_random_uuid(), q_id, '새 기능 개발', FALSE, 3),
    (gen_random_uuid(), q_id, '버그 원인 조사', TRUE, 4);
END $$;

-- Q97
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「来週から新しいチームメンバーが入ります。名前は鈴木さんです。Pythonが得意だそうです。みなさん、よろしくお願いします。」\n\n鈴木さんについて正しいものはどれですか？', '鈴木さんはPythonが得意な新しいチームメンバーです。', 1, 97, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Java가 특기이다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Python이 특기인 새 팀원이다', TRUE, 2),
    (gen_random_uuid(), q_id, '이번 주에 입사한다', FALSE, 3),
    (gen_random_uuid(), q_id, '팀을 떠난다', FALSE, 4);
END $$;

-- Q98
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今日の進捗報告です。テスト項目の80%が完了しました。残りは明日までに終わる予定です。」\n\nテストの進捗状況はどうですか？', '80%が完了し、残りは明日までに終わる予定と報告しています。', 1, 98, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 테스트가 완료되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '아직 시작하지 않았다', FALSE, 2),
    (gen_random_uuid(), q_id, '50%가 완료되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '80%가 완료되었다', TRUE, 4);
END $$;

-- Q99
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「社員食堂のメニューが変わりました。月曜日はカレー、火曜日はラーメン、水曜日は定食です。値段は全部500円です。」\n\n火曜日のメニューは何ですか？', '火曜日のメニューはラーメンと書かれています。', 1, 99, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '카레', FALSE, 1),
    (gen_random_uuid(), q_id, '정식', FALSE, 2),
    (gen_random_uuid(), q_id, '라멘', TRUE, 3),
    (gen_random_uuid(), q_id, '우동', FALSE, 4);
END $$;

-- Q100
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「毎週金曜日の午後3時から、チームミーティングがあります。場所は3階の会議室です。遅れないように来てください。」\n\nチームミーティングについて正しいものはどれですか？', '毎週金曜日午後3時、3階の会議室でチームミーティングがあります。', 1, 100, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매주 금요일 오후 3시에 3층 회의실에서 한다', TRUE, 1),
    (gen_random_uuid(), q_id, '2층 회의실에서 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '오전 3시에 시작한다', FALSE, 3),
    (gen_random_uuid(), q_id, '매주 월요일에 있다', FALSE, 4);
END $$;

-- Q101
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「オフィスのプリンターが壊れました。修理は来週になります。それまでは、2階のプリンターを使ってください。」\n\n来週まで何をすればいいですか？', '修理が来週になるので、それまでは2階のプリンターを使うように案内しています。', 1, 101, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2층 프린터를 사용한다', TRUE, 1),
    (gen_random_uuid(), q_id, '인쇄를 하지 않는다', FALSE, 2),
    (gen_random_uuid(), q_id, '새 프린터를 산다', FALSE, 3),
    (gen_random_uuid(), q_id, '직접 수리한다', FALSE, 4);
END $$;

-- Q102
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「明日は健康診断があります。朝ごはんを食べないで来てください。時間は午前9時からです。場所は1階のホールです。」\n\n健康診断の前にしてはいけないことは何ですか？', '「朝ごはんを食べないで来てください」と書かれているので、朝食を食べてはいけません。', 1, 102, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '운동', FALSE, 1),
    (gen_random_uuid(), q_id, '샤워', FALSE, 2),
    (gen_random_uuid(), q_id, '아침 식사', TRUE, 3),
    (gen_random_uuid(), q_id, '물 마시기', FALSE, 4);
END $$;

-- Q103
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「コードレビューの結果です。変数名がわかりにくいところがあります。もっとわかりやすい名前に変えてください。それ以外は問題ありません。」\n\nコードレビューで指摘されたことは何ですか？', '変数名がわかりにくいという指摘がされています。', 1, 103, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버그가 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '변수명이 알기 어렵다', TRUE, 2),
    (gen_random_uuid(), q_id, '테스트가 부족하다', FALSE, 3),
    (gen_random_uuid(), q_id, '코드가 너무 길다', FALSE, 4);
END $$;

-- Q104
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「出張のお知らせです。来月の15日から17日まで、大阪のお客様を訪問します。ホテルの予約は総務部がします。」\n\nホテルの予約は誰がしますか？', '「ホテルの予約は総務部がします」と書かれています。', 1, 104, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '본인이 직접 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '고객이 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '상사가 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '총무부가 한다', TRUE, 4);
END $$;

-- Q105
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今日のタスクです。午前中にテストコードを書いてください。午後はミーティングがあるので、コーディングは午前中に終わらせてください。」\n\n午前中にやることは何ですか？', '午前中にテストコードを書いて、コーディングを終わらせるよう指示されています。', 1, 105, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트 코드 작성', TRUE, 1),
    (gen_random_uuid(), q_id, '미팅 참석', FALSE, 2),
    (gen_random_uuid(), q_id, '설계서 작성', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 리뷰', FALSE, 4);
END $$;

-- Q106
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「Wi-Fiの接続方法をお知らせします。ネットワーク名は「Office-5F」です。パスワードは受付で聞いてください。」\n\nWi-Fiに接続するために必要なことは何ですか？', 'パスワードは受付で聞く必要があります。', 1, 106, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IT부서에 메일을 보낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '상사에게 물어본다', FALSE, 2),
    (gen_random_uuid(), q_id, '자기 핸드폰의 핫스팟을 사용한다', FALSE, 3),
    (gen_random_uuid(), q_id, '접수처에서 비밀번호를 물어본다', TRUE, 4);
END $$;

-- Q107
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「研修のお知らせです。来週の水曜日にセキュリティ研修があります。全員参加です。参加できない人は、上司に連絡してください。」\n\nこの研修について正しいものはどれですか？', '全員参加の研修で、参加できない場合は上司に連絡する必要があります。', 1, 107, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '希望者のみ参加する', FALSE, 1),
    (gen_random_uuid(), q_id, '전원 참가이며, 불참 시 상사에게 연락한다', TRUE, 2),
    (gen_random_uuid(), q_id, '온라인으로 참가한다', FALSE, 3),
    (gen_random_uuid(), q_id, '참가비가 필요하다', FALSE, 4);
END $$;

-- Q108
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「デプロイは毎週木曜日の夜に行います。水曜日の夕方までにコードをマージしてください。木曜日にマージしたコードは来週のデプロイになります。」\n\n今週のデプロイに間に合わせるにはいつまでにマージすればいいですか？', '水曜日の夕方までにマージすれば今週のデプロイに含まれます。', 1, 108, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수요일 저녁까지', TRUE, 1),
    (gen_random_uuid(), q_id, '화요일 저녁까지', FALSE, 2),
    (gen_random_uuid(), q_id, '목요일 아침까지', FALSE, 3),
    (gen_random_uuid(), q_id, '월요일 아침까지', FALSE, 4);
END $$;

-- Q109
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「先月の売り上げは目標の120%でした。特にオンラインショップの売り上げが良かったです。来月も頑張りましょう。」\n\n先月の売り上げはどうでしたか？', '目標の120%を達成し、特にオンラインショップの売り上げが良かったと書かれています。', 1, 109, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '목표를 달성하지 못했다', FALSE, 1),
    (gen_random_uuid(), q_id, '목표의 120%를 달성했다', TRUE, 2),
    (gen_random_uuid(), q_id, '목표와 같았다', FALSE, 3),
    (gen_random_uuid(), q_id, '작년보다 줄었다', FALSE, 4);
END $$;

-- Q110
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「エレベーターの工事のため、今週は階段を使ってください。工事は金曜日に終わる予定です。ご不便をおかけして申し訳ありません。」\n\nいつからエレベーターが使えますか？', '工事は金曜日に終わる予定なので、金曜日以降にエレベーターが使えるようになります。', 1, 110, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수요일부터', FALSE, 1),
    (gen_random_uuid(), q_id, '목요일부터', FALSE, 2),
    (gen_random_uuid(), q_id, '다음 주 월요일부터', FALSE, 3),
    (gen_random_uuid(), q_id, '금요일 공사 완료 후부터', TRUE, 4);
END $$;

-- ============================================
-- MEDIUM (N2 level) - 20 questions (sort_order 111-130)
-- IT workplace passages, some inference required
-- ============================================

-- Q111
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「本番環境へのデプロイ手順が変更されました。今後はステージング環境でのテストを完了した上で、リーダーの承認を得てからデプロイしてください。直接本番にデプロイすることは禁止されています。」\n\nデプロイの正しい手順はどれですか？', 'ステージングでテスト→リーダー承認→本番デプロイという手順が正しいです。直接本番デプロイは禁止されています。', 1, 111, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스테이징 테스트 완료 후 리더 승인을 받고 배포', TRUE, 1),
    (gen_random_uuid(), q_id, '리더 승인 후 스테이징 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '스테이징 테스트 후 바로 배포', FALSE, 3),
    (gen_random_uuid(), q_id, '본번 환경에 직접 배포', FALSE, 4);
END $$;

-- Q112
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「先日のリリースでレスポンスタイムが大幅に悪化したため、一部の機能をロールバックしました。原因を特定次第、修正版をリリースする予定です。ご迷惑をおかけし、申し訳ございません。」\n\nロールバックした理由は何ですか？', 'レスポンスタイムが大幅に悪化したため、ロールバックを行いました。', 1, 112, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새 기능 추가를 위해', FALSE, 1),
    (gen_random_uuid(), q_id, '보안 취약점이 발견되어서', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 비용을 절감하기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '응답 시간이 크게 악화되어서', TRUE, 4);
END $$;

-- Q113
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「このたび、社内のコミュニケーションツールをSlackからTeamsに移行することになりました。移行期間は1ヶ月を予定しており、その間は両方のツールを並行して使用します。詳細は別途マニュアルを配布します。」\n\n移行期間中はどうなりますか？', '移行期間中は両方のツール（SlackとTeams）を並行して使用すると書かれています。', 1, 113, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Slack만 사용한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'Teams만 사용한다', FALSE, 2),
    (gen_random_uuid(), q_id, '이메일만 사용한다', FALSE, 3),
    (gen_random_uuid(), q_id, '두 도구를 병행 사용한다', TRUE, 4);
END $$;

-- Q114
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今回のスプリントレビューでは、予定していた8つのストーリーのうち6つが完了しました。残り2つは技術的な課題があり、次のスプリントに持ち越すことになりました。チームとしては改善の余地があると考えています。」\n\nこのスプリントの結果について正しいものはどれですか？', '8つ中6つ完了、2つは技術的課題で次のスプリントに持ち越しとなりました。', 1, 114, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 스토리가 완료되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '절반의 스토리가 완료되었다', FALSE, 2),
    (gen_random_uuid(), q_id, '기술적 문제로 전부 이월되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '8개 중 6개가 완료되고 2개는 이월되었다', TRUE, 4);
END $$;

-- Q115
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「お客様から要件の追加依頼がありました。現在の開発スケジュールに影響が出る可能性があるため、まずは工数の見積もりを行い、PMに報告してください。お客様への回答はPMが行います。」\n\n開発者がまずやるべきことは何ですか？', '開発者はまず工数の見積もりを行い、PMに報告する必要があります。お客様への回答はPMが行います。', 1, 115, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공수 견적을 내고 PM에게 보고한다', TRUE, 1),
    (gen_random_uuid(), q_id, '바로 개발을 시작한다', FALSE, 2),
    (gen_random_uuid(), q_id, '요건을 거절한다', FALSE, 3),
    (gen_random_uuid(), q_id, '고객에게 직접 답변한다', FALSE, 4);
END $$;

-- Q116
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「本日のコードレビューで、セキュリティ上の問題が見つかりました。ユーザー入力のバリデーションが不足しており、SQLインジェクションの危険性があります。リリース前に必ず修正してください。」\n\nこのコードの問題点は何ですか？', 'ユーザー入力のバリデーション不足によるSQLインジェクションの危険性が指摘されています。', 1, 116, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사용자 입력 검증 부족으로 SQL 인젝션 위험이 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '코드 포맷이 통일되어 있지 않다', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 코드가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '주석이 부족하다', FALSE, 4);
END $$;

-- Q117
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「在宅勤務の際は、VPNに接続した上で社内システムにアクセスしてください。VPNの接続に問題がある場合は、情報システム部に問い合わせてください。なお、公共のWi-Fiからの接続はセキュリティ上、推奨しません。」\n\n在宅勤務で推奨されていないことは何ですか？', '公共のWi-Fiからの接続はセキュリティ上推奨されていないと書かれています。', 1, 117, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공공 Wi-Fi에서의 접속', TRUE, 1),
    (gen_random_uuid(), q_id, '사내 시스템 접근', FALSE, 2),
    (gen_random_uuid(), q_id, '정보시스템부에 문의', FALSE, 3),
    (gen_random_uuid(), q_id, 'VPN 접속', FALSE, 4);
END $$;

-- Q118
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「データベースのマイグレーションを実行する際は、必ずバックアップを取得してから行ってください。万が一マイグレーションが失敗した場合、バックアップから復元する必要があります。手順書はConfluenceに掲載されています。」\n\nマイグレーション前にしなければならないことは何ですか？', 'マイグレーション前にはバックアップを取得する必要があります。', 1, 118, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '백업을 취득한다', TRUE, 1),
    (gen_random_uuid(), q_id, '테스트를 실행한다', FALSE, 2),
    (gen_random_uuid(), q_id, '리더에게 보고한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Confluence를 업데이트한다', FALSE, 4);
END $$;

-- Q119
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「プロジェクトの振り返り会議を行います。良かった点と改善すべき点を事前にまとめておいてください。率直な意見を歓迎しますが、個人への批判は避けてください。建設的なフィードバックをお願いします。」\n\nこの会議で求められていることは何ですか？', '個人批判を避け、建設的なフィードバックを行うことが求められています。', 1, 119, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개인에 대한 솔직한 비판', FALSE, 1),
    (gen_random_uuid(), q_id, '프로젝트 성과 발표', FALSE, 2),
    (gen_random_uuid(), q_id, '다음 프로젝트 계획 수립', FALSE, 3),
    (gen_random_uuid(), q_id, '건설적인 피드백', TRUE, 4);
END $$;

-- Q120
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「API仕様の変更に伴い、フロントエンド側の修正が必要になりました。影響範囲はユーザー登録画面とプロフィール編集画面です。バックエンド側の変更は来週の水曜日にリリースされる予定なので、それまでにフロントエンドの修正を完了してください。」\n\nフロントエンドの修正期限はいつですか？', 'バックエンドの変更が来週水曜日にリリースされるため、それまでにフロントエンドの修正を完了する必要があります。', 1, 120, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이번 주 금요일까지', FALSE, 1),
    (gen_random_uuid(), q_id, '다음 주 월요일까지', FALSE, 2),
    (gen_random_uuid(), q_id, '다음 주 수요일까지', TRUE, 3),
    (gen_random_uuid(), q_id, '다음 주 금요일까지', FALSE, 4);
END $$;

-- Q121
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「障害報告：昨日の夜11時頃から本日の朝6時まで、決済システムに障害が発生しました。原因はデータベースの容量不足でした。現在は復旧済みですが、再発防止のためにディスク容量の監視設定を強化しました。」\n\n障害の原因は何でしたか？', 'データベースの容量不足が障害の原因であったと報告されています。', 1, 121, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스 용량 부족', TRUE, 1),
    (gen_random_uuid(), q_id, '네트워크 장애', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 다운', FALSE, 3),
    (gen_random_uuid(), q_id, '해킹 공격', FALSE, 4);
END $$;

-- Q122
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「来期からアジャイル開発を本格的に導入します。これまでのウォーターフォール型の開発と異なり、短い開発サイクルで機能をリリースしていきます。スクラムマスターの研修を来月実施しますので、各チームから1名参加してください。」\n\n各チームに求められていることは何ですか？', '各チームから1名、スクラムマスター研修に参加することが求められています。', 1, 122, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전원이 연수에 참가한다', FALSE, 1),
    (gen_random_uuid(), q_id, '워터폴 개발을 계속한다', FALSE, 2),
    (gen_random_uuid(), q_id, '팀에서 1명이 스크럼마스터 연수에 참가한다', TRUE, 3),
    (gen_random_uuid(), q_id, '애자일 도입을 거부한다', FALSE, 4);
END $$;

-- Q123
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今回のユーザビリティテストの結果、設定画面の操作が直感的でないという意見が多く寄せられました。特にトグルスイッチの位置がわかりにくいとの指摘がありました。次のイテレーションで改善を検討してください。」\n\nユーザビリティテストで指摘された問題は何ですか？', '設定画面の操作が直感的でなく、特にトグルスイッチの位置がわかりにくいと指摘されました。', 1, 123, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설정 화면 조작이 직관적이지 않다', TRUE, 1),
    (gen_random_uuid(), q_id, '색상 배합이 나쁘다', FALSE, 2),
    (gen_random_uuid(), q_id, '글자 크기가 작다', FALSE, 3),
    (gen_random_uuid(), q_id, '페이지 로딩이 느리다', FALSE, 4);
END $$;

-- Q124
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「新しいチケット管理ルールについてお知らせします。チケットのステータスを更新する際は、必ずコメントで作業内容を記載してください。また、見積もり時間と実際の作業時間を記録することで、今後の見積もり精度の向上に役立てます。」\n\nチケット更新時に必要なことは何ですか？', 'ステータス更新時にコメントで作業内容を記載し、見積もり時間と実際の作業時間を記録する必要があります。', 1, 124, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '작업 내용 코멘트와 시간 기록', TRUE, 1),
    (gen_random_uuid(), q_id, '스크린샷 첨부', FALSE, 2),
    (gen_random_uuid(), q_id, '리더의 승인', FALSE, 3),
    (gen_random_uuid(), q_id, '관련 코드 링크 첨부', FALSE, 4);
END $$;

-- Q125
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「お客様からの問い合わせ対応マニュアルを更新しました。一次対応は30分以内に返信してください。技術的な調査が必要な場合は、まず受付の返信をした上で、調査結果を2営業日以内に回答してください。」\n\n技術的な調査が必要な場合、最初にすることは何ですか？', 'まず受付の返信（一次対応）を行い、その上で調査結果を後日回答するという手順です。', 1, 125, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '바로 조사를 시작한다', FALSE, 1),
    (gen_random_uuid(), q_id, '먼저 접수 답변을 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '상사에게 보고한다', FALSE, 3),
    (gen_random_uuid(), q_id, '2영업일 후에 답변한다', FALSE, 4);
END $$;

-- Q126
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「CI/CDパイプラインの実行時間が長くなっています。特にE2Eテストの実行に時間がかかっており、全体の70%を占めています。テストの並列実行を検討するか、テストケースの見直しを行ってください。」\n\nパイプラインの実行時間が長い主な原因は何ですか？', 'E2Eテストの実行が全体の70%を占めており、実行時間が長くなっている主な原因です。', 1, 126, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빌드 시간이 길다', FALSE, 1),
    (gen_random_uuid(), q_id, '배포 프로세스가 복잡하다', FALSE, 2),
    (gen_random_uuid(), q_id, 'E2E 테스트 실행 시간이 길다', TRUE, 3),
    (gen_random_uuid(), q_id, '유닛 테스트가 많다', FALSE, 4);
END $$;

-- Q127
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「社内ハッカソンの参加者を募集します。テーマは「業務効率化ツールの開発」です。3〜5名のチームで参加してください。優勝チームには開発合宿への参加権が与えられます。エントリー締め切りは今月末です。」\n\n参加条件として正しいものはどれですか？', '3〜5名のチームで参加することが条件です。', 1, 127, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '個人で参加する', FALSE, 1),
    (gen_random_uuid(), q_id, '2명 이상의 팀으로 참가한다', FALSE, 2),
    (gen_random_uuid(), q_id, '3~5명의 팀으로 참가한다', TRUE, 3),
    (gen_random_uuid(), q_id, '부서 전원이 참가한다', FALSE, 4);
END $$;

-- Q128
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「Git運用ルールの変更です。今後、mainブランチへの直接プッシュは禁止します。feature ブランチを作成し、プルリクエストを経由してください。レビュアーは最低2名以上の承認が必要です。」\n\nプルリクエストのマージに必要な条件は何ですか？', '最低2名以上のレビュアーの承認が必要です。', 1, 128, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리더 1명의 승인', FALSE, 1),
    (gen_random_uuid(), q_id, '최소 2명 이상의 리뷰어 승인', TRUE, 2),
    (gen_random_uuid(), q_id, '전원의 승인', FALSE, 3),
    (gen_random_uuid(), q_id, '승인 없이 머지 가능', FALSE, 4);
END $$;

-- Q129
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「ログ管理ポリシーが更新されました。個人情報を含むログは30日間保持した後、自動的に削除されます。アクセスログは90日間保持されます。ログの保持期間の延長が必要な場合は、情報セキュリティ部門の承認が必要です。」\n\nアクセスログの保持期間はどれくらいですか？', 'アクセスログは90日間保持されると明記されています。', 1, 129, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30일', FALSE, 1),
    (gen_random_uuid(), q_id, '60일', FALSE, 2),
    (gen_random_uuid(), q_id, '90일', TRUE, 3),
    (gen_random_uuid(), q_id, '180일', FALSE, 4);
END $$;

-- Q130
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「技術選定会議の結果を共有します。新規プロジェクトのフロントエンドフレームワークはReactに決定しました。TypeScriptの使用を必須とし、状態管理にはReduxではなくZustandを採用します。理由は学習コストの低さとバンドルサイズの小ささです。」\n\nZustandが採用された理由は何ですか？', 'Zustandは学習コストが低く、バンドルサイズが小さいことが採用理由です。', 1, 130, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기능이 많기 때문에', FALSE, 1),
    (gen_random_uuid(), q_id, '커뮤니티가 크기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '회사 표준이기 때문에', FALSE, 3),
    (gen_random_uuid(), q_id, '학습 비용이 낮고 번들 사이즈가 작기 때문에', TRUE, 4);
END $$;

-- ============================================
-- HARD (N1 level) - 20 questions (sort_order 131-150)
-- Complex IT workplace passages, nuanced understanding, implied meaning
-- ============================================

-- Q131
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「先般のアーキテクチャレビューにおいて、マイクロサービス間の依存関係が過度に複雑化している点が懸念事項として挙げられました。特に認証サービスへの依存が集中しており、当該サービスの障害が全体に波及するリスクが看過できない水準に達しています。サーキットブレーカーパターンの導入を含めた対策を早急に検討すべきでしょう。」\n\nこの文章が最も懸念していることは何ですか？', '認証サービスへの依存集中により、障害が全体に波及するリスクが最大の懸念です。「看過できない水準」という表現が深刻さを示しています。', 1, 131, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '마이크로서비스 수가 너무 많다', FALSE, 1),
    (gen_random_uuid(), q_id, '인증 서비스 장애 시 전체 시스템에 영향이 미치는 위험', TRUE, 2),
    (gen_random_uuid(), q_id, '서킷 브레이커 패턴의 도입 비용', FALSE, 3),
    (gen_random_uuid(), q_id, '아키텍처 리뷰 빈도가 부족하다', FALSE, 4);
END $$;

-- Q132
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「今回の人事評価において、技術力の向上のみならず、チームへの貢献度も重要な評価軸として考慮されることになりました。具体的には、コードレビューの質と頻度、ナレッジ共有の取り組み、後輩の育成への関与などが評価対象に含まれます。個人の成果だけでなく、組織全体の底上げに寄与する姿勢が求められています。」\n\nこの人事評価の変更点として最も適切なものはどれですか？', '個人の技術力だけでなく、チームへの貢献（コードレビュー、ナレッジ共有、後輩育成）も評価されるようになりました。', 1, 132, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기술력만으로 평가한다', FALSE, 1),
    (gen_random_uuid(), q_id, '코드 리뷰가 의무화되었다', FALSE, 2),
    (gen_random_uuid(), q_id, '기술력뿐 아니라 팀 기여도도 평가 대상이 되었다', TRUE, 3),
    (gen_random_uuid(), q_id, '후배 육성이 필수 업무가 되었다', FALSE, 4);
END $$;

-- Q133
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「クラウドインフラのコスト最適化に関する報告です。現在、開発環境のインスタンスが常時稼働していますが、業務時間外は利用されていないことが判明しました。スケジューリングによる自動停止・起動を導入することで、月額コストの約40%削減が見込まれます。ただし、夜間バッチ処理が稼働しているインスタンスは対象外とする必要があります。」\n\nコスト削減の対象外となるインスタンスはどれですか？', '夜間バッチ処理が稼働しているインスタンスは自動停止の対象外とする必要があります。', 1, 133, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '본번 환경의 인스턴스', FALSE, 1),
    (gen_random_uuid(), q_id, '스테이징 환경의 인스턴스', FALSE, 2),
    (gen_random_uuid(), q_id, '야간 배치 처리가 가동 중인 인스턴스', TRUE, 3),
    (gen_random_uuid(), q_id, '모든 개발 환경 인스턴스', FALSE, 4);
END $$;

-- Q134
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「技術的負債の解消に向けたロードマップを策定しました。短期的にはレガシーAPIの段階的な廃止、中期的にはモノリスからマイクロサービスへの移行、長期的にはインフラのクラウドネイティブ化を目指します。なお、ビジネス要件との兼ね合いから、各フェーズの期間は柔軟に調整する可能性があります。」\n\n「柔軟に調整する可能性がある」とは何を意味していますか？', 'ビジネス要件との兼ね合いにより、技術的負債解消の各フェーズの期間が変更される可能性があることを示唆しています。', 1, 134, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로드맵 자체가 취소될 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 요건에 따라 각 페이즈 기간이 변경될 수 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '기술 스택이 변경될 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '팀 구성이 바뀔 수 있다', FALSE, 4);
END $$;

-- Q135
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「お客様との要件定義会議を終えましたが、いくつかの仕様が曖昧なまま残っています。特に、データの保持期間に関する法的要件について、お客様側でも確認が必要とのことです。この点が確定しないまま設計を進めると、後工程での手戻りが発生する恐れがあります。次回の会議までに、こちらからも法務部門に確認を取っておくべきでしょう。」\n\n筆者が最も伝えたいことは何ですか？', '仕様が曖昧なまま進めると手戻りが発生するため、法的要件を事前に確認すべきだという主張です。', 1, 135, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요건 정의 회의가 성공적이었다', FALSE, 1),
    (gen_random_uuid(), q_id, '고객의 확인이 늦어지고 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '설계를 먼저 시작해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '법적 요건을 확정한 후 설계를 진행해야 한다', TRUE, 4);
END $$;

-- Q136
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「パフォーマンスチューニングの結果をご報告します。N+1クエリの解消とインデックスの最適化により、一覧画面のレスポンスタイムが3.2秒から0.4秒に改善しました。ただし、集計処理については依然として5秒以上かかっており、非同期処理への切り替えを検討しています。即座に結果を返す必要がないため、バックグラウンドジョブとして処理するのが妥当だと考えます。」\n\n集計処理の改善案として提案されていることは何ですか？', '集計処理は即座に結果を返す必要がないため、バックグラウンドジョブ（非同期処理）として処理することが提案されています。', 1, 136, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인덱스를 추가한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'N+1 쿼리를 해소한다', FALSE, 2),
    (gen_random_uuid(), q_id, '비동기 처리(백그라운드 잡)로 전환한다', TRUE, 3),
    (gen_random_uuid(), q_id, '캐시를 도입한다', FALSE, 4);
END $$;

-- Q137
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「採用面接のフィードバックです。候補者は技術的なスキルについては申し分なく、特にインフラ領域の知識は即戦力として期待できます。一方で、チームでの協働経験が浅い印象を受けました。弊社ではペアプログラミングやモブプログラミングを積極的に取り入れているため、その点への適応力を見極める必要があるかもしれません。」\n\nこのフィードバックが示唆していることは何ですか？', '技術力は高いが、チーム協働の経験が浅い点が懸念されており、適応できるか見極めが必要だと示唆しています。', 1, 137, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '후보자를 즉시 채용해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '후보자의 기술력이 부족하다', FALSE, 2),
    (gen_random_uuid(), q_id, '기술력은 충분하지만 팀 협업 적응력 확인이 필요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '후보자를 불합격시켜야 한다', FALSE, 4);
END $$;

-- Q138
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「GDPRおよび個人情報保護法への対応状況について報告します。ユーザーデータの暗号化は完了していますが、データポータビリティへの対応が未着手です。お客様からデータのエクスポート機能の要望が増えてきており、法令遵守の観点からも優先度を上げて対応すべきです。なお、データ削除の「忘れられる権利」についても、現行システムでは論理削除にとどまっており、物理削除の仕組みの構築が求められます。」\n\n現行システムで不足している対応として挙げられていないものはどれですか？', 'データの暗号化は完了済みと明記されているため、これは不足している対応ではありません。', 1, 138, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 포터빌리티 대응', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터 암호화', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터 엑스포트 기능', FALSE, 3),
    (gen_random_uuid(), q_id, '물리 삭제 구조 구축', FALSE, 4);
END $$;

-- Q139
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「オンボーディングプロセスの見直しを提案します。現在は入社初日にすべての環境設定を行っていますが、事前にアカウントの発行やツールのインストール手順書を送付することで、初日の負担を軽減できます。また、メンター制度を導入し、最初の3ヶ月間は先輩社員が伴走することで、早期の戦力化と離職率の低下が期待できます。」\n\n「伴走する」という表現が意味することは何ですか？', '「伴走する」は一緒に走る＝寄り添いながらサポートするという意味で、メンターが新入社員に継続的にサポートを提供することを表しています。', 1, 139, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대신 업무를 수행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '업무를 감시한다', FALSE, 2),
    (gen_random_uuid(), q_id, '업무를 평가한다', FALSE, 3),
    (gen_random_uuid(), q_id, '옆에서 지속적으로 지원하며 함께한다', TRUE, 4);
END $$;

-- Q140
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「障害の事後分析（ポストモーテム）を実施しました。今回の障害は、設定ファイルの変更が適切にレビューされないまま本番環境に反映されたことが直接の原因でした。根本原因としては、インフラの設定変更に対するレビュープロセスが明文化されておらず、属人的な運用になっていた点が挙げられます。再発防止策として、Infrastructure as Codeの徹底とPRベースのレビューフローの義務化を提案します。」\n\n根本原因として指摘されていることは何ですか？', '直接原因はレビューなしの設定変更ですが、根本原因はレビュープロセスが明文化されず属人的な運用になっていた点です。', 1, 140, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설정 파일의 오류', FALSE, 1),
    (gen_random_uuid(), q_id, '인프라 설정 변경의 리뷰 프로세스가 명문화되지 않고 속인적이었다', TRUE, 2),
    (gen_random_uuid(), q_id, 'Infrastructure as Code를 사용하지 않았다', FALSE, 3),
    (gen_random_uuid(), q_id, '본번 환경의 보안이 취약했다', FALSE, 4);
END $$;

-- Q141
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「弊社の技術ブログの執筆方針について議論しました。外部への情報発信は採用ブランディングの観点から非常に重要ですが、機密情報の取り扱いには細心の注意が必要です。記事の公開前に、技術的な正確性のレビューに加えて、情報セキュリティ部門による内容の確認を必須とします。社内のノウハウを外部に還元しつつ、競合優位性の源泉となる技術については適切に秘匿する必要があります。」\n\n「競合優位性の源泉となる技術については適切に秘匿する」が意味することは何ですか？', '自社の競争力の基盤となる独自技術は外部に公開せず秘密にしておく必要があるということです。', 1, 141, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 기술 정보를 공개한다', FALSE, 1),
    (gen_random_uuid(), q_id, '기술 블로그를 쓰지 않는다', FALSE, 2),
    (gen_random_uuid(), q_id, '경쟁 우위의 원천이 되는 기술은 외부에 공개하지 않는다', TRUE, 3),
    (gen_random_uuid(), q_id, '경쟁사의 기술을 분석한다', FALSE, 4);
END $$;

-- Q142
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「マルチテナントアーキテクチャへの移行について検討しています。現在はテナントごとに独立したデータベースを持つ構成ですが、運用コストが増大しています。共有データベースに移行することでコストは削減できますが、テナント間のデータ分離やパフォーマンスの影響を慎重に検証する必要があります。段階的な移行を想定し、まずは小規模テナントから試験的に移行を開始することを提案します。」\n\n筆者の提案のアプローチとして最も適切なものはどれですか？', '一度にすべてを移行するのではなく、小規模テナントから試験的に段階的に移行することが提案されています。', 1, 142, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전체 테넌트를 한꺼번에 이전한다', FALSE, 1),
    (gen_random_uuid(), q_id, '대규모 테넌트부터 이전한다', FALSE, 2),
    (gen_random_uuid(), q_id, '이전을 중단한다', FALSE, 3),
    (gen_random_uuid(), q_id, '소규모 테넌트부터 시험적으로 단계적 이전을 시작한다', TRUE, 4);
END $$;

-- Q143
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「先日の技術カンファレンスで発表された事例は、弊社の課題と非常に親和性が高いものでした。発表者の企業はモノリスからマイクロサービスへの移行で、段階的にストラングラーフィグパターンを適用し、サービスの分離を実現しました。弊社でも同様のアプローチを取ることで、一度にすべてを書き換えるリスクを回避できるのではないかと考えます。」\n\n「ストラングラーフィグパターン」の特徴として文脈から読み取れることは何ですか？', '文脈から、ストラングラーフィグパターンは一度にすべてを書き換えるのではなく、段階的に移行を進めるアプローチであることが読み取れます。', 1, 143, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '한꺼번에 전체를 재구축하는 패턴', FALSE, 1),
    (gen_random_uuid(), q_id, '단계적으로 기존 시스템을 분리하는 패턴', TRUE, 2),
    (gen_random_uuid(), q_id, '새로운 시스템을 병렬로 구축하는 패턴', FALSE, 3),
    (gen_random_uuid(), q_id, '기존 시스템을 그대로 유지하는 패턴', FALSE, 4);
END $$;

-- Q144
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「プロジェクトの遅延について上層部から説明を求められています。率直に申し上げると、当初の見積もりが楽観的すぎたことが主因です。要件の複雑さを過小評価し、また技術的な調査に想定以上の時間を要しました。今後は、見積もりにバッファを設けるとともに、スパイクタスクを設定して事前に技術的なリスクを洗い出す運用を徹底します。」\n\n「スパイクタスク」の目的として文脈から推測できることは何ですか？', '文脈から、スパイクタスクは技術的なリスクを事前に洗い出すための調査タスクであることが推測できます。', 1, 144, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트 일정을 단축한다', FALSE, 1),
    (gen_random_uuid(), q_id, '사전에 기술적 리스크를 파악하기 위한 조사', TRUE, 2),
    (gen_random_uuid(), q_id, '고객에게 진척을 보고한다', FALSE, 3),
    (gen_random_uuid(), q_id, '팀원의 성과를 평가한다', FALSE, 4);
END $$;

-- Q145
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「SREチームからの提案です。現在、アラートの閾値設定が厳格すぎるため、深夜の不要なオンコール対応が頻発しています。これはチームメンバーのバーンアウトにつながりかねません。アラートの優先度を再定義し、即座の対応が不要なものはP3以下に分類して翌営業日対応とすることで、オンコール負荷の適正化を図りたいと考えています。」\n\n「バーンアウトにつながりかねません」という表現が暗示していることは何ですか？', '「つながりかねません」は、まだ起きていないが将来起こる可能性があるという警告を暗示しています。チームメンバーの燃え尽き症候群のリスクを示しています。', 1, 145, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이미 번아웃이 발생했다', FALSE, 1),
    (gen_random_uuid(), q_id, '번아웃이 절대 일어나지 않는다', FALSE, 2),
    (gen_random_uuid(), q_id, '번아웃은 개인의 문제이다', FALSE, 3),
    (gen_random_uuid(), q_id, '현재 상태가 계속되면 번아웃이 발생할 위험이 있다', TRUE, 4);
END $$;

-- Q146
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「新規事業のPoCプロジェクトが承認されました。ただし、経営陣が期待しているのは完成度の高い製品ではなく、市場ニーズの検証です。したがって、MVPの範囲を極力絞り込み、3ヶ月以内に仮説の検証を完了させることが最優先です。技術的な完璧さよりも、仮説検証のスピードを重視してください。過剰な設計は避け、必要最低限の機能で市場の反応を確認しましょう。」\n\nこのPoCプロジェクトで最も重視されていることは何ですか？', '技術的な完璧さよりも仮説検証のスピードが重視されています。MVPで市場ニーズを検証することが最優先です。', 1, 146, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기술적 완성도', FALSE, 1),
    (gen_random_uuid(), q_id, '시장 니즈의 가설 검증 속도', TRUE, 2),
    (gen_random_uuid(), q_id, '확장 가능한 아키텍처', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 품질', FALSE, 4);
END $$;

-- Q147
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「可観測性（Observability）の強化に取り組んでいます。ログ、メトリクス、トレーシングの3本柱を整備することで、障害発生時の原因特定を迅速化します。現状ではログの構造化が不十分で、分散トレーシングも未導入のため、マイクロサービス間の呼び出しを横断的に追跡することが困難です。OpenTelemetryの導入を推進し、統一的なオブザーバビリティ基盤を構築することを提案します。」\n\n現状の課題として挙げられているものをすべて含む選択肢はどれですか？', 'ログの構造化が不十分であることと、分散トレーシングが未導入であることの2点が課題として挙げられています。', 1, 147, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그 구조화 부족만', FALSE, 1),
    (gen_random_uuid(), q_id, '분산 트레이싱 미도입만', FALSE, 2),
    (gen_random_uuid(), q_id, '메트릭스 수집 부족만', FALSE, 3),
    (gen_random_uuid(), q_id, '로그 구조화 부족과 분산 트레이싱 미도입', TRUE, 4);
END $$;

-- Q148
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「取引先との契約更新に際し、SLAの見直しを行います。現行のSLAでは稼働率99.9%を保証していますが、昨年度の実績は99.95%でした。取引先からは99.99%への引き上げを要望されていますが、これを達成するには現在のインフラ構成では不十分であり、冗長化の強化やマルチリージョン対応が必要です。コスト面での影響も考慮した上で、経営判断を仰ぎたいと思います。」\n\n99.99%のSLA達成が難しい理由は何ですか？', '現在のインフラ構成では不十分であり、冗長化の強化やマルチリージョン対応が追加で必要です。', 1, 148, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '현재의 인프라 구성으로는 불충분하며 추가 투자가 필요하다', TRUE, 1),
    (gen_random_uuid(), q_id, '기술적으로 불가능하다', FALSE, 2),
    (gen_random_uuid(), q_id, '작년 실적이 나빴기 때문이다', FALSE, 3),
    (gen_random_uuid(), q_id, '인력이 부족하다', FALSE, 4);
END $$;

-- Q149
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「データ分析基盤の刷新プロジェクトにおいて、ETLパイプラインからELTパイプラインへの移行を検討しています。従来はデータの変換処理を抽出時に行っていましたが、クラウドのデータウェアハウスの処理能力を活用し、ロード後に変換を行う方式に切り替えることで、柔軟性の向上と開発工数の削減が見込まれます。ただし、データウェアハウス側のコンピューティングリソースの増加に伴うコスト増には留意が必要です。」\n\nELTへの移行で留意すべきこととして述べられていることは何ですか？', 'ELTではデータウェアハウス側で変換処理を行うため、コンピューティングリソースの増加に伴うコスト増に留意が必要です。', 1, 149, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 품질의 저하', FALSE, 1),
    (gen_random_uuid(), q_id, '개발 공수의 증가', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 웨어하우스 컴퓨팅 리소스 증가에 따른 비용 증가', TRUE, 3),
    (gen_random_uuid(), q_id, '보안 리스크의 증대', FALSE, 4);
END $$;

-- Q150
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで、質問に答えてください。\n\n「グローバル展開に伴い、多言語対応（i18n）の設計方針を策定しました。翻訳リソースはJSON形式で管理し、動的にロードする仕組みとします。日付や通貨のフォーマットはICU標準に準拠し、ロケールに応じて自動的に切り替えます。なお、右から左に読む言語（RTL）への対応は、現時点では対象市場に含まれていないため、将来的な拡張性を考慮しつつも、今回のスコープからは除外します。」\n\n今回のスコープから除外されているものは何ですか？', 'RTL（右から左に読む言語）への対応は、現時点では対象市場に含まれていないため、今回のスコープから除外されています。', 1, 150, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '번역 리소스의 JSON 관리', FALSE, 1),
    (gen_random_uuid(), q_id, '날짜/통화 포맷의 ICU 준거', FALSE, 2),
    (gen_random_uuid(), q_id, '로케일에 따른 자동 전환', FALSE, 3),
    (gen_random_uuid(), q_id, 'RTL(오른쪽에서 왼쪽으로 읽는 언어) 대응', TRUE, 4);
END $$;
