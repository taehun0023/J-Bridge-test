-- ============================================
-- JLPT Reading Quizzes (5 quizzes, 10 questions each)
-- N5/N4/N3/N2/N1 levels
-- ============================================

-- Cleanup existing reading quiz data
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'c0000001-0000-0000-0000-000000000001',
    'c0000002-0000-0000-0000-000000000002',
    'c0000003-0000-0000-0000-000000000003',
    'c0000004-0000-0000-0000-000000000004',
    'c0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'c0000001-0000-0000-0000-000000000001',
  'c0000002-0000-0000-0000-000000000002',
  'c0000003-0000-0000-0000-000000000003',
  'c0000004-0000-0000-0000-000000000004',
  'c0000005-0000-0000-0000-000000000005'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'c0000001-0000-0000-0000-000000000001',
    'c0000002-0000-0000-0000-000000000002',
    'c0000003-0000-0000-0000-000000000003',
    'c0000004-0000-0000-0000-000000000004',
    'c0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'c0000001-0000-0000-0000-000000000001',
  'c0000002-0000-0000-0000-000000000002',
  'c0000003-0000-0000-0000-000000000003',
  'c0000004-0000-0000-0000-000000000004',
  'c0000005-0000-0000-0000-000000000005'
);
DELETE FROM quizzes WHERE id IN (
  'c0000001-0000-0000-0000-000000000001',
  'c0000002-0000-0000-0000-000000000002',
  'c0000003-0000-0000-0000-000000000003',
  'c0000004-0000-0000-0000-000000000004',
  'c0000005-0000-0000-0000-000000000005'
);

-- Insert 5 reading quizzes
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment) VALUES
  ('c0000001-0000-0000-0000-000000000001', 'N5 読解クイズ', 'jlpt_reading', 70, 15, FALSE),
  ('c0000002-0000-0000-0000-000000000002', 'N4 読解クイズ', 'jlpt_reading', 70, 20, FALSE),
  ('c0000003-0000-0000-0000-000000000003', 'N3 読解クイズ', 'jlpt_reading', 70, 25, FALSE),
  ('c0000004-0000-0000-0000-000000000004', 'N2 読解クイズ', 'jlpt_reading', 70, 30, FALSE),
  ('c0000005-0000-0000-0000-000000000005', 'N1 読解クイズ', 'jlpt_reading', 70, 35, FALSE);

-- ============================================
-- N5 読解クイズ (10 questions)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 (회의실 예약 안내)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nかいぎしつを　つかいたい　ひとは、じむしつの　やまださんに　メールを　してください。かいぎしつは　ごぜん９じから　ごご６じまで　つかえます。よやくは　２にちまえまでに　してください。\n\n質問：かいぎしつは　いつまで　つかえますか？', 'この文章では会議室(かいぎしつ)の使用時間について書いてあります。「ごご６じまで」と書いてあるので、오후 6시까지 사용할 수 있습니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오전 9시까지', FALSE, 1),
    (gen_random_uuid(), q_id, '오후 6시까지', TRUE, 2),
    (gen_random_uuid(), q_id, '오후 9시까지', FALSE, 3),
    (gen_random_uuid(), q_id, '밤 12시까지', FALSE, 4);

  -- Q2: 내용 이해 (사내 메일)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nたなかさんへ\nあした　ごご２じから　ミーティングが　あります。ばしょは　３かいの　かいぎしつです。しりょうを　もってきて　ください。\nすずきより\n\n質問：ミーティングは　どこで　ありますか？', '場所(ばしょ)は「３かいの かいぎしつ」と書いてあります。장소에 대한 질문이므로 3층 회의실이 정답입니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1층 사무실', FALSE, 1),
    (gen_random_uuid(), q_id, '2층 회의실', FALSE, 2),
    (gen_random_uuid(), q_id, '3층 회의실', TRUE, 3),
    (gen_random_uuid(), q_id, '4층 휴게실', FALSE, 4);

  -- Q3: 내용 이해 (안내문)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nおしらせ\nらいしゅうの　げつようびから　きんようびまで、エレベーターが　つかえません。かいだんを　つかってください。すみませんが、よろしく　おねがいします。\n\n質問：エレベーターは　いつから　つかえませんか？', '「らいしゅうの げつようび」からエレベーターが使えません。다음 주 월요일부터 사용할 수 없습니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이번 주 월요일부터', FALSE, 1),
    (gen_random_uuid(), q_id, '다음 주 월요일부터', TRUE, 2),
    (gen_random_uuid(), q_id, '다음 주 금요일부터', FALSE, 3),
    (gen_random_uuid(), q_id, '이번 주 금요일부터', FALSE, 4);

  -- Q4: 내용 이해 (회사 안내)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしの　かいしゃは　えきから　あるいて　１０ぷんです。かいしゃには　しょくどうが　あります。しょくどうの　ひるごはんは　５００えんです。やすくて　おいしいです。\n\n質問：しょくどうの　ひるごはんは　いくらですか？', '食堂(しょくどう)の昼ごはんの値段は「５００えん」と書いてあります。가격에 대한 질문으로 500엔이 정답입니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '300엔', FALSE, 1),
    (gen_random_uuid(), q_id, '400엔', FALSE, 2),
    (gen_random_uuid(), q_id, '500엔', TRUE, 3),
    (gen_random_uuid(), q_id, '600엔', FALSE, 4);

  -- Q5: 세부 사항 (메일 내용)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nみなさんへ\nこんしゅうの　きんようび、かいしゃの　パーティーが　あります。じかんは　ごご７じからです。ばしょは　１かいの　レストランです。さんかしたい　ひとは　すいようびまでに　メールしてください。\n\n質問：パーティーに　さんかしたい　ひとは　なにを　しますか？', 'パーティーに参加したい人は「すいようびまでに メールしてください」と書いてあります。수요일까지 메일을 보내야 합니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '금요일까지 전화한다', FALSE, 1),
    (gen_random_uuid(), q_id, '수요일까지 메일한다', TRUE, 2),
    (gen_random_uuid(), q_id, '목요일까지 신청한다', FALSE, 3),
    (gen_random_uuid(), q_id, '화요일까지 사무실에 간다', FALSE, 4);

  -- Q6: 세부 사항 (근무 안내)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nあたらしい　ひとへ\nまいあさ　９じまでに　かいしゃに　きてください。おひるやすみは　１２じから　１じまでです。しごとは　ごご６じに　おわります。わからないことが　あったら、やまださんに　きいてください。\n\n質問：おひるやすみは　なんじかんですか？', '昼休みは「１２じから１じまで」なので1時間です。점심시간은 12시부터 1시까지 1시간입니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30분', FALSE, 1),
    (gen_random_uuid(), q_id, '1시간', TRUE, 2),
    (gen_random_uuid(), q_id, '1시간 30분', FALSE, 3),
    (gen_random_uuid(), q_id, '2시간', FALSE, 4);

  -- Q7: 세부 사항 (물건 주문 메일)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nたなかさんへ\nあたらしい　パソコンが　きました。いろは　しろです。つくえの　うえに　おきました。パスワードは　かみに　かいて　あります。パソコンの　よこに　あります。\nすずきより\n\n質問：パスワードは　どこに　ありますか？', 'パスワードは「パソコンの よこ」にある紙に書いてあります。비밀번호는 컴퓨터 옆에 있는 종이에 적혀 있습니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '책상 서랍 안에', FALSE, 1),
    (gen_random_uuid(), q_id, '메일에 적혀 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '컴퓨터 옆의 종이에', TRUE, 3),
    (gen_random_uuid(), q_id, '야마다 씨에게 물어본다', FALSE, 4);

  -- Q8: 문맥 어휘 (사내 안내)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nあしたから　あたらしい　プロジェクトが　はじまります。みなさん、がんばりましょう。わからないことが　あったら、えんりょなく　きいてください。\n\n質問：「えんりょなく」の　いみは　なんですか？', '「えんりょなく」は「遠慮なく」で、「부담 없이/사양하지 말고」という意味です。상대방에게 편하게 물어보라는 뜻입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빨리', FALSE, 1),
    (gen_random_uuid(), q_id, '조용히', FALSE, 2),
    (gen_random_uuid(), q_id, '사양하지 말고', TRUE, 3),
    (gen_random_uuid(), q_id, '나중에', FALSE, 4);

  -- Q9: 문맥 어휘 (회사 소개)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしの　かいしゃは　ITの　かいしゃです。しゃいんは　５０にんぐらいです。みんな　やさしくて、しょくばの　ふんいきは　とても　いいです。\n\n質問：「ふんいき」の　いみは　なんですか？', '「ふんいき」は「雰囲気」で、「분위기」という意味です。職場の雰囲気が良いと書いてあります。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '규칙', FALSE, 1),
    (gen_random_uuid(), q_id, '분위기', TRUE, 2),
    (gen_random_uuid(), q_id, '시간', FALSE, 3),
    (gen_random_uuid(), q_id, '급여', FALSE, 4);

  -- Q10: 추론/목적 (안내문의 목적)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nみなさんへ\nらいげつから　あさの　ミーティングの　じかんが　かわります。いままでは　９じからでしたが、８じ３０ぷんからに　なります。おくれないように　きてください。\n\n質問：このメールの　もくてきは　なんですか？', 'このメールは朝のミーティング時間の変更を知らせるためのものです。목적(もくてき)은 아침 미팅 시간 변경을 알리는 것입니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새로운 프로젝트 안내', FALSE, 1),
    (gen_random_uuid(), q_id, '미팅 장소 변경 안내', FALSE, 2),
    (gen_random_uuid(), q_id, '미팅 시간 변경 안내', TRUE, 3),
    (gen_random_uuid(), q_id, '미팅 취소 안내', FALSE, 4);
END $$;

-- ============================================
-- N4 読解クイズ (10 questions)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 (업무 메일)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n山田さんへ\n来週の月曜日に新しいプロジェクトの会議があります。時間は午前10時から12時までです。場所は5階の大会議室です。プロジェクトの資料を準備してください。金曜日までにメールで送ってください。\n佐藤より\n\n質問：山田さんは何を準備しなければなりませんか？', '佐藤さんは山田さんに「プロジェクトの資料を準備してください」と頼んでいます。프로젝트 자료를 준비해야 합니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의실 예약', FALSE, 1),
    (gen_random_uuid(), q_id, '프로젝트 자료', TRUE, 2),
    (gen_random_uuid(), q_id, '점심 도시락', FALSE, 3),
    (gen_random_uuid(), q_id, '명함', FALSE, 4);

  -- Q2: 내용 이해 (사내 공지)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n社員の皆様へ\n今月から社内のWi-Fiのパスワードが変わりました。新しいパスワードはIT部の田中さんに聞いてください。古いパスワードはもう使えません。セキュリティのためですので、ご協力をお願いします。\n総務部\n\n質問：新しいパスワードはどうやって知ることができますか？', '新しいパスワードは「IT部の田中さんに聞いてください」と書いてあります。IT부서의 다나카 씨에게 물어보면 됩니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '메일로 확인한다', FALSE, 1),
    (gen_random_uuid(), q_id, 'IT부서의 다나카 씨에게 묻는다', TRUE, 2),
    (gen_random_uuid(), q_id, '총무부에 전화한다', FALSE, 3),
    (gen_random_uuid(), q_id, '게시판에서 확인한다', FALSE, 4);

  -- Q3: 내용 이해 (IT 관련 기사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最近、多くの会社がリモートワークを始めました。リモートワークは家で仕事ができるので便利です。しかし、チームのコミュニケーションが少なくなるという問題もあります。そのため、毎日オンラインミーティングをする会社も多いです。\n\n質問：リモートワークの問題は何ですか？', 'リモートワークの問題は「チームのコミュニケーションが少なくなる」ことです。팀 커뮤니케이션이 줄어드는 것이 문제입니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인터넷이 느리다', FALSE, 1),
    (gen_random_uuid(), q_id, '팀 커뮤니케이션이 줄어든다', TRUE, 2),
    (gen_random_uuid(), q_id, '업무 시간이 길어진다', FALSE, 3),
    (gen_random_uuid(), q_id, '급여가 줄어든다', FALSE, 4);

  -- Q4: 내용 이해 (연수 안내)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n新入社員研修のお知らせ\n日時：4月5日（月）～4月9日（金）\n時間：午前9時～午後5時\n場所：本社2階 研修室\n内容：ビジネスマナー、社内システムの使い方、セキュリティ研修\n持ち物：ノートパソコン、筆記用具\n\n質問：研修は何日間ありますか？', '研修は4月5日（月）から4月9日（金）までなので、5日間です。연수는 월요일부터 금요일까지 5일간입니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3일간', FALSE, 1),
    (gen_random_uuid(), q_id, '4일간', FALSE, 2),
    (gen_random_uuid(), q_id, '5일간', TRUE, 3),
    (gen_random_uuid(), q_id, '7일간', FALSE, 4);

  -- Q5: 세부 사항 (업무 보고 메일)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n課長へ\n今日のテスト結果を報告します。全部で50のテストケースがありました。45のテストケースは成功しましたが、5つはエラーが出ました。エラーの原因はデータベースの接続の問題でした。明日、修正する予定です。\n鈴木\n\n質問：エラーの原因は何でしたか？', 'エラーの原因は「データベースの接続の問題」と報告しています。데이터베이스 접속 문제가 에러의 원인이었습니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드 오류', FALSE, 1),
    (gen_random_uuid(), q_id, '네트워크 장애', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 접속 문제', TRUE, 3),
    (gen_random_uuid(), q_id, '서버 다운', FALSE, 4);

  -- Q6: 세부 사항 (사무용품 주문)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n事務用品の注文について\n必要なものがある人は、リストに名前と欲しいものを書いてください。リストは総務部の入口にあります。注文は毎月1日と15日にまとめて出します。届くまでに3日かかります。急ぎの場合は総務部の中村さんに相談してください。\n\n質問：注文した物はいつ届きますか？', '注文してから届くまで「3日かかります」と書いてあります。주문 후 3일 걸립니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '翌日', FALSE, 1),
    (gen_random_uuid(), q_id, '2日後', FALSE, 2),
    (gen_random_uuid(), q_id, '3日後', TRUE, 3),
    (gen_random_uuid(), q_id, '1週間後', FALSE, 4);

  -- Q7: 세부 사항 (시스템 메뉴얼)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n社内システムのログイン方法\n1. ブラウザを開いて、URLを入力します。\n2. 社員番号とパスワードを入力します。\n3. 「ログイン」ボタンを押します。\nパスワードを3回間違えると、アカウントがロックされます。ロックされた場合は、IT部に連絡してください。\n\n質問：アカウントがロックされたらどうしますか？', 'アカウントがロックされた場合は「IT部に連絡してください」と書いてあります。IT부서에 연락해야 합니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30分待つ', FALSE, 1),
    (gen_random_uuid(), q_id, '新しいアカウントを作る', FALSE, 2),
    (gen_random_uuid(), q_id, 'IT部に連絡する', TRUE, 3),
    (gen_random_uuid(), q_id, '上司に報告する', FALSE, 4);

  -- Q8: 문맥 어휘 (업무 메일)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n今日の会議で新しいスケジュールを共有しました。来月のデッドラインに間に合うように、みんなで協力してタスクを進めましょう。進捗があったら、毎週金曜日に報告してください。\n\n質問：この文章で「デッドライン」は何を意味しますか？', '「デッドライン」は「締め切り」（마감기한）という意味のビジネス用語です。기한 내에 맞추라는 뜻입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시작일', FALSE, 1),
    (gen_random_uuid(), q_id, '마감기한', TRUE, 2),
    (gen_random_uuid(), q_id, '회의 날짜', FALSE, 3),
    (gen_random_uuid(), q_id, '휴일', FALSE, 4);

  -- Q9: 문맥 어휘 (사내 공지)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n来月からフレックスタイム制度が始まります。コアタイムは午前10時から午後3時までです。この時間は必ず会社にいてください。それ以外の時間は自由に出勤・退勤できます。\n\n質問：「コアタイム」とは何ですか？', '「コアタイム」はフレックスタイムで必ず勤務しなければならない時間帯のことです。반드시 회사에 있어야 하는 시간대를 의미합니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자유롭게 출퇴근할 수 있는 시간', FALSE, 1),
    (gen_random_uuid(), q_id, '반드시 회사에 있어야 하는 시간', TRUE, 2),
    (gen_random_uuid(), q_id, '점심시간', FALSE, 3),
    (gen_random_uuid(), q_id, '야근 시간', FALSE, 4);

  -- Q10: 추론/목적 (메일의 의도)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nチームの皆さんへ\n先週のスプリントレビューで、お客さまから良いフィードバックをもらいました。特にUIのデザインが使いやすいと言われました。しかし、ページの読み込み速度が少し遅いという意見もありました。次のスプリントではパフォーマンスの改善に力を入れましょう。\nリーダー 木村\n\n質問：木村さんがこのメールを書いた一番の目的は何ですか？', 'このメールの主な目的は、次のスプリントで取り組むべき課題（パフォーマンス改善）を伝えることです。다음 스프린트의 방향성을 알리는 것이 목적입니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UI 디자인 칭찬', FALSE, 1),
    (gen_random_uuid(), q_id, '고객 불만 전달', FALSE, 2),
    (gen_random_uuid(), q_id, '다음 스프린트의 방향 공유', TRUE, 3),
    (gen_random_uuid(), q_id, '스프린트 리뷰 일정 안내', FALSE, 4);
END $$;

-- ============================================
-- N3 読解クイズ (10 questions)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 (리모트워크 기사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nリモートワークが普及してから、多くの企業がコミュニケーションツールを導入するようになった。チャットツールやビデオ会議システムを使うことで、離れた場所にいるメンバーとも円滑にやり取りができるようになった。しかし、対面でのコミュニケーションに比べると、ニュアンスが伝わりにくいという課題もある。特に、新入社員にとっては、先輩の表情や雰囲気から学ぶ機会が減ったと感じている人が多い。そのため、週に1～2回は出社する「ハイブリッドワーク」を採用する企業が増えている。\n\n質問：この文章によると、リモートワークの課題は何ですか？', 'この文章では、リモートワークの課題として「ニュアンスが伝わりにくい」ことが挙げられています。뉘앙스가 전달되기 어렵다는 것이 과제です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ツールの導入費用が高い', FALSE, 1),
    (gen_random_uuid(), q_id, 'インターネット環境が不安定である', FALSE, 2),
    (gen_random_uuid(), q_id, 'ニュアンスが伝わりにくい', TRUE, 3),
    (gen_random_uuid(), q_id, '業務の効率が大幅に下がる', FALSE, 4);

  -- Q2: 내용 이해 (프로젝트 관리)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアジャイル開発では、プロジェクトを短い期間に区切って進めていく。この短い期間を「スプリント」と呼び、通常は1～4週間で設定される。各スプリントの最後にはレビューを行い、成果物を確認する。この方法のメリットは、問題を早期に発見できることと、顧客のフィードバックを素早く反映できることである。一方で、全体のスケジュール管理が難しくなるというデメリットもある。チーム全員が毎日短いミーティングを行い、進捗状況を共有することが重要とされている。\n\n質問：アジャイル開発のメリットとして述べられているのはどれですか？', 'アジャイル開発のメリットは「問題を早期に発見できること」と「顧客のフィードバックを素早く反映できること」です。문제를 조기에 발견할 수 있다는 것이 장점입니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全体のスケジュール管理がしやすい', FALSE, 1),
    (gen_random_uuid(), q_id, '問題を早期に発見できる', TRUE, 2),
    (gen_random_uuid(), q_id, 'コストを大幅に削減できる', FALSE, 3),
    (gen_random_uuid(), q_id, 'ミーティングの回数を減らせる', FALSE, 4);

  -- Q3: 내용 이해 (IT보안 기사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n情報セキュリティは、IT企業にとって最も重要な課題の一つである。個人情報の漏洩は企業の信頼を大きく損なうことになる。そのため、多くの企業では定期的にセキュリティ研修を実施している。研修では、パスワードの管理方法、フィッシングメールの見分け方、社外秘データの取り扱い方法などを学ぶ。また、最近では二段階認証の導入やVPNの利用も標準的になってきている。社員一人一人がセキュリティ意識を高く持つことが、企業全体の安全を守ることにつながる。\n\n質問：この文章によると、セキュリティ研修ではどのようなことを学びますか？', 'セキュリティ研修では「パスワードの管理方法、フィッシングメールの見分け方、社外秘データの取り扱い方法」を学ぶと書いてあります。비밀번호 관리 방법 등을 배웁니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラミング言語の基礎', FALSE, 1),
    (gen_random_uuid(), q_id, 'パスワード管理やフィッシングメールの見分け方', TRUE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク機器の設定方法', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベースの設計方法', FALSE, 4);

  -- Q4: 내용 이해 (사내 제도 안내)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n当社では、社員のスキルアップを支援するための「自己啓発支援制度」を設けている。この制度では、業務に関連する書籍の購入費用を月額5,000円まで会社が負担する。また、外部の研修やセミナーに参加する場合、年間3回まで参加費を全額補助する。対象となるのは、IT技術、語学、マネジメントに関する研修である。利用を希望する社員は、事前に上司の承認を得た上で、総務部に申請書を提出する必要がある。\n\n質問：この制度を利用するために必要なことは何ですか？', '制度を利用するには「事前に上司の承認を得た上で、総務部に申請書を提出する」必要があります。상사의 승인 후 총무부에 신청서를 제출해야 합니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人事部に直接連絡する', FALSE, 1),
    (gen_random_uuid(), q_id, 'オンラインで申し込む', FALSE, 2),
    (gen_random_uuid(), q_id, '上司の承認を得て総務部に申請書を提出する', TRUE, 3),
    (gen_random_uuid(), q_id, '社長に直接メールを送る', FALSE, 4);

  -- Q5: 세부 사항 (코드 리뷰 가이드)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nコードレビューのガイドライン\n当チームでは、すべてのコード変更に対してコードレビューを義務づけている。プルリクエストを作成したら、チーム内の2人以上のメンバーからレビューを受ける必要がある。レビューでは、バグの有無、コーディング規約への準拠、テストの十分性を確認する。レビューコメントは建設的な内容にし、改善点を具体的に示すことを心がけてほしい。承認が得られたら、作成者自身がマージを行う。緊急のバグ修正の場合は、1人のレビューで進めてよい。\n\n質問：通常、プルリクエストのレビューには何人必要ですか？', '「チーム内の2人以上のメンバーからレビューを受ける必要がある」と書かれています。통상 2명 이상의 리뷰어가 필요합니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1人', FALSE, 1),
    (gen_random_uuid(), q_id, '2人以上', TRUE, 2),
    (gen_random_uuid(), q_id, '3人以上', FALSE, 3),
    (gen_random_uuid(), q_id, 'チーム全員', FALSE, 4);

  -- Q6: 세부 사항 (장애 대응 보고)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n障害報告書\n発生日時：2024年3月15日 14:30\n復旧日時：2024年3月15日 16:45\n影響範囲：社内メールシステム全体\n原因：メールサーバーのディスク容量が不足したため、新規メールの送受信ができなくなった。\n対応：不要なログファイルを削除し、ディスク容量を確保した。また、今後同様の問題が発生しないように、ディスク使用量の監視アラートを設定した。\n\n質問：障害の復旧にどのくらい時間がかかりましたか？', '発生が14:30で復旧が16:45なので、約2時間15分かかりました。약 2시간 15분 소요되었습니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約30分', FALSE, 1),
    (gen_random_uuid(), q_id, '約1時間', FALSE, 2),
    (gen_random_uuid(), q_id, '約2時間15分', TRUE, 3),
    (gen_random_uuid(), q_id, '約3時間', FALSE, 4);

  -- Q7: 세부 사항 (개발 환경 구축)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n新しいプロジェクトの開発環境構築手順\nまず、GitHubからリポジトリをクローンしてください。次に、プロジェクトのルートディレクトリで「npm install」を実行して依存パッケージをインストールします。環境変数の設定が必要です。.env.exampleファイルをコピーして.envファイルを作成し、必要な値を入力してください。データベースのマイグレーションを実行してから、「npm run dev」で開発サーバーを起動できます。ポート番号はデフォルトで3000ですが、.envファイルで変更可能です。\n\n質問：環境変数を設定するにはどうしますか？', '環境変数の設定は「.env.exampleファイルをコピーして.envファイルを作成し、必要な値を入力」します。.env.example 파일을 복사하여 .env를 만듭니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GitHubの設定画面で入力する', FALSE, 1),
    (gen_random_uuid(), q_id, '.env.exampleをコピーして.envを作成する', TRUE, 2),
    (gen_random_uuid(), q_id, 'package.jsonに直接書き込む', FALSE, 3),
    (gen_random_uuid(), q_id, 'npm configコマンドで設定する', FALSE, 4);

  -- Q8: 문맥 어휘 (업무 보고서)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n今回のリリースでは、いくつかのリグレッションが見つかった。以前正常に動作していた機能が、新しいコードの追加によって意図せず壊れてしまったのだ。今後はCI/CDパイプラインに自動テストを組み込むことで、このような問題を未然に防ぐことが重要である。テストカバレッジを80%以上に維持することを目標としたい。\n\n質問：「リグレッション」はこの文脈でどのような意味ですか？', '「リグレッション」は回帰バグのことで、以前動いていた機能が新しい変更により壊れることを指します。회귀 버그、즉 이전에 정상 동작하던 기능이 망가지는 것을 의미합니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '新しい機能の追加', FALSE, 1),
    (gen_random_uuid(), q_id, '以前動いていた機能が壊れること', TRUE, 2),
    (gen_random_uuid(), q_id, 'コードの最適化', FALSE, 3),
    (gen_random_uuid(), q_id, 'セキュリティの脆弱性', FALSE, 4);

  -- Q9: 문맥 어휘 (팀 리더 메일)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n先日のミーティングで話題になったレガシーコードの問題について報告します。現在のシステムには約10年前に書かれたコードが残っており、ドキュメントもほとんどありません。このコードはブラックボックス化しており、修正するリスクが高い状態です。段階的にリファクタリングを進めていく方針で進めたいと思います。まずはテストコードを追加するところから始めましょう。\n\n質問：「ブラックボックス化」とはどのような状態ですか？', '「ブラックボックス化」とは、内部の仕組みが分からなくなっている状態を指します。내부 구조를 알 수 없는 상태를 의미합니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'セキュリティが強化されている状態', FALSE, 1),
    (gen_random_uuid(), q_id, '内部の仕組みが分からなくなっている状態', TRUE, 2),
    (gen_random_uuid(), q_id, 'テストが完了している状態', FALSE, 3),
    (gen_random_uuid(), q_id, '最新の技術で書き直された状態', FALSE, 4);

  -- Q10: 추론/목적 (회의록)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nプロジェクト定例会議 議事録\n日時：2024年3月20日 10:00-11:00\n参加者：田中PM、鈴木、山田、佐藤、李\n\n議題1：進捗報告\nフロントエンドの開発は予定通り進んでいる。バックエンドのAPI開発は2日遅れている。原因はデータベース設計の変更が発生したため。来週月曜日までに遅れを取り戻す予定。\n\n議題2：次のアクション\n・鈴木：API開発の遅れを取り戻す\n・山田：UIテストを進める\n・佐藤：デプロイ手順書を作成する\n\n質問：この会議録から推測できることは何ですか？', 'バックエンドが遅れている原因が「データベース設計の変更」であることから、プロジェクトの途中で要件変更があったと推測できます。프로젝트 중간에 요건 변경이 있었다고 추측할 수 있습니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクトは順調に進んでいる', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロジェクトの途中で要件変更があった', TRUE, 2),
    (gen_random_uuid(), q_id, 'チームメンバーが不足している', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトは中止される予定である', FALSE, 4);
END $$;

-- ============================================
-- N2 読解クイズ (10 questions)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 (시스템 설계 보고서)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nマイクロサービスアーキテクチャは、アプリケーションを独立した小さなサービスに分割する設計手法である。各サービスは独自のデータベースを持ち、APIを通じて他のサービスと通信する。この手法の最大の利点は、各サービスを独立してデプロイ・スケーリングできる点にある。例えば、ユーザー認証サービスとの連携に問題があっても、商品検索サービスは正常に動作し続けることができる。しかし、サービス間の通信が増えるため、ネットワークの遅延やサービス間の整合性の管理が複雑になるという課題もある。また、分散システムの監視やデバッグは、モノリシックアプリケーションに比べて格段に難しくなる。そのため、組織の規模やシステムの複雑さに応じて、適切なアーキテクチャを選択することが重要である。\n\n質問：マイクロサービスアーキテクチャの最大の利点は何だと述べられていますか？', 'この文章では最大の利点として「各サービスを独立してデプロイ・スケーリングできる点」を挙げています。각 서비스를 독립적으로 배포/스케일링할 수 있다는 것이 최대 장점입니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発コストを大幅に削減できること', FALSE, 1),
    (gen_random_uuid(), q_id, '各サービスを独立してデプロイ・スケーリングできること', TRUE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク通信が不要になること', FALSE, 3),
    (gen_random_uuid(), q_id, 'デバッグが容易になること', FALSE, 4);

  -- Q2: 내용 이해 (클라우드 이전 보고서)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n当社のクラウド移行プロジェクトは、3つのフェーズに分けて進行している。第1フェーズでは、開発環境とテスト環境をクラウドに移行した。これにより、環境構築の時間が従来の数日から数時間に短縮された。第2フェーズでは、本番環境のうち、比較的リスクの低いバッチ処理システムをクラウドに移行する。第3フェーズでは、基幹システムを含むすべてのサービスをクラウドに移行する予定である。移行に際しては、セキュリティポリシーの見直し、データの暗号化、アクセス制御の強化を並行して進めている。特に個人情報を含むデータについては、国内リージョンでの保管を必須とする方針を定めた。\n\n質問：第2フェーズではどのようなシステムを移行しますか？', '第2フェーズでは「比較的リスクの低いバッチ処理システム」をクラウドに移行すると記載されています。비교적 리스크가 낮은 배치 처리 시스템을 이전합니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発環境とテスト環境', FALSE, 1),
    (gen_random_uuid(), q_id, '基幹システム', FALSE, 2),
    (gen_random_uuid(), q_id, 'バッチ処理システム', TRUE, 3),
    (gen_random_uuid(), q_id, 'すべてのサービス', FALSE, 4);

  -- Q3: 내용 이해 (기술 트렌드 기사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nコンテナ技術の普及により、アプリケーションのデプロイメントは大きく変わった。Dockerに代表されるコンテナ技術は、アプリケーションとその実行環境を一つのパッケージにまとめることで、「自分の環境では動くのに」という問題を解消した。さらに、Kubernetesのようなオーケストレーションツールの登場により、大量のコンテナを効率的に管理できるようになった。しかし、コンテナ化にはセキュリティの懸念もある。コンテナイメージに脆弱性が含まれていた場合、それが大規模に展開されるリスクがある。そのため、イメージのスキャンや署名による検証が不可欠となっている。また、コンテナのランタイムセキュリティについても、ネットワークポリシーの設定やリソース制限の適用が推奨されている。\n\n質問：この文章によると、コンテナ技術が解消した問題は何ですか？', 'コンテナ技術は「自分の環境では動くのに」という環境差異の問題を解消したと述べられています。환경 차이로 인한 문제를 해결했습니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'セキュリティの脆弱性', FALSE, 1),
    (gen_random_uuid(), q_id, '環境の違いによる動作差異', TRUE, 2),
    (gen_random_uuid(), q_id, 'ネットワーク通信の遅延', FALSE, 3),
    (gen_random_uuid(), q_id, 'ストレージ容量の不足', FALSE, 4);

  -- Q4: 내용 이해 (개발 프로세스 문서)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n当チームのCI/CDパイプラインは、コードの品質を担保するための重要な仕組みである。開発者がコードをプッシュすると、まず静的解析ツールによるコードチェックが実行される。次に、ユニットテストと統合テストが自動的に実行される。すべてのテストに合格した場合のみ、ステージング環境への自動デプロイが行われる。本番環境へのデプロイは、手動での承認プロセスを経て実行される。この承認プロセスには、技術リーダーとプロダクトオーナーの両方の承認が必要である。これにより、本番環境に不具合のあるコードが反映されるリスクを最小限に抑えている。パイプラインの各ステップの実行時間は監視されており、ボトルネックがあれば速やかに改善を行っている。\n\n質問：本番環境へのデプロイに必要な条件として正しいものはどれですか？', '本番環境へのデプロイには「技術リーダーとプロダクトオーナーの両方の承認」が必要と記載されています。기술 리더와 프로덕트 오너 양쪽의 승인이 필요합니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべてのテストに合格すれば自動的にデプロイされる', FALSE, 1),
    (gen_random_uuid(), q_id, '技術リーダーの承認のみで十分である', FALSE, 2),
    (gen_random_uuid(), q_id, '技術リーダーとプロダクトオーナーの両方の承認が必要', TRUE, 3),
    (gen_random_uuid(), q_id, '開発者本人が承認すればよい', FALSE, 4);

  -- Q5: 세부 사항 (API設計ドキュメント)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nRESTful API設計のベストプラクティスとして、いくつかの原則がある。まず、リソースを名詞で表現し、HTTPメソッド（GET, POST, PUT, DELETE）で操作を表現することが基本である。バージョニングはURLパスに含める方式（例：/api/v1/users）を推奨する。レスポンスには適切なHTTPステータスコードを返すべきであり、200番台は成功、400番台はクライアントエラー、500番台はサーバーエラーを示す。ページネーションについては、クエリパラメータでページ番号とページサイズを指定する方式を採用する。また、エラーレスポンスには統一されたフォーマットを使用し、エラーコード、メッセージ、詳細情報を含めることが望ましい。認証にはOAuth 2.0のBearerトークンを使用し、トークンの有効期限は1時間とする。\n\n質問：APIのバージョニングについて、推奨されている方式はどれですか？', 'APIのバージョニングは「URLパスに含める方式（例：/api/v1/users）」を推奨しています。URL 경로에 버전을 포함하는 방식을 권장합니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ヘッダーにバージョンを指定する', FALSE, 1),
    (gen_random_uuid(), q_id, 'URLパスにバージョンを含める', TRUE, 2),
    (gen_random_uuid(), q_id, 'クエリパラメータでバージョンを指定する', FALSE, 3),
    (gen_random_uuid(), q_id, 'サブドメインでバージョンを分ける', FALSE, 4);

  -- Q6: 세부 사항 (파포먼스 개선 보고서)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nパフォーマンス改善報告書\n\n今回の改善では、Webアプリケーションのページ読み込み時間を大幅に短縮することができた。主な施策として、以下の3点を実施した。第一に、画像の遅延読み込み（Lazy Loading）を導入し、初期表示に必要な画像のみを先にロードするようにした。第二に、JavaScriptバンドルのコード分割を行い、各ページに必要なコードのみを配信するようにした。第三に、CDNの導入により、静的アセットの配信を高速化した。これらの施策の結果、ページの読み込み時間は平均4.2秒から1.8秒に短縮された。特に、モバイル環境でのLCP（Largest Contentful Paint）が大幅に改善され、Googleのコアウェブバイタルの基準を満たすことができた。\n\n質問：改善後のページ読み込み時間はどのくらいですか？', '改善後のページ読み込み時間は「平均1.8秒」と報告されています。평균 1.8초로 단축되었습니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '平均0.8秒', FALSE, 1),
    (gen_random_uuid(), q_id, '平均1.8秒', TRUE, 2),
    (gen_random_uuid(), q_id, '平均2.8秒', FALSE, 3),
    (gen_random_uuid(), q_id, '平均4.2秒', FALSE, 4);

  -- Q7: 세부 사항 (데이터베이스 설계)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nデータベース設計において、正規化は重要な概念である。正規化とは、データの冗長性を排除し、データの整合性を保つためにテーブルを分割する手法である。第1正規形ではテーブルの各列にはアトミックな値のみを格納する。第2正規形では、主キーの一部にのみ依存する列を別テーブルに分離する。第3正規形では、非キー列間の推移的依存を排除する。しかし、正規化を進めすぎると、テーブルの結合が増えてクエリのパフォーマンスが低下する場合がある。そのため、読み取り性能が重視されるシステムでは、あえて非正規化を行うことも珍しくない。特に、分析系のデータウェアハウスでは、スタースキーマのような非正規化されたスキーマが一般的に使用されている。\n\n質問：正規化を進めすぎた場合に起こりうる問題は何ですか？', '正規化を進めすぎると「テーブルの結合が増えてクエリのパフォーマンスが低下する」と述べられています。테이블 조인이 증가하여 쿼리 성능이 저하될 수 있습니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの冗長性が増える', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブルの結合が増えてパフォーマンスが低下する', TRUE, 2),
    (gen_random_uuid(), q_id, 'データの整合性が保てなくなる', FALSE, 3),
    (gen_random_uuid(), q_id, 'ストレージ容量が不足する', FALSE, 4);

  -- Q8: 문맥 어휘 (기술 논문)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n近年、DevOpsの概念が広く浸透し、開発チームと運用チームの垣根がなくなりつつある。従来のウォーターフォール型開発では、開発チームがコードを書き終えた後に運用チームに引き渡すという分断されたプロセスが一般的であった。DevOpsでは、この「壁」を取り除き、開発から運用まで一貫した責任を持つことを目指す。「You build it, you run it」という哲学のもと、開発者自身がサービスの運用にも関与する。このアプローチにより、障害対応の速度が向上し、サービスの信頼性が高まることが期待されている。インフラをコードで管理するInfrastructure as Codeの実践や、監視・ロギングの自動化もDevOps文化の重要な要素である。\n\n質問：この文脈で「垣根がなくなる」とはどういう意味ですか？', '「垣根がなくなる」とは、開発チームと運用チームの間の壁・境界がなくなるという意味です。팀 간의 경계/장벽이 없어진다는 뜻입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'チームが解散する', FALSE, 1),
    (gen_random_uuid(), q_id, 'チーム間の境界や壁がなくなる', TRUE, 2),
    (gen_random_uuid(), q_id, 'オフィスのパーテーションを撤去する', FALSE, 3),
    (gen_random_uuid(), q_id, 'チームの人数が減る', FALSE, 4);

  -- Q9: 문맥 어휘 (기술 블로그)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n技術的負債という概念は、ソフトウェア開発においてしばしば議論される。短期的な納期のプレッシャーにより、理想的ではないコードを書いてしまうことがある。このようなコードは、将来的にメンテナンスコストを増大させ、新機能の開発速度を低下させる。まさに「借金」のように、利子が積み重なっていくのである。技術的負債を放置すると、やがてシステム全体の刷新が必要になるほど深刻な状態に陥ることもある。定期的なリファクタリングの時間を確保し、負債を計画的に返済していくことが、長期的なプロジェクトの成功には不可欠である。\n\n質問：「技術的負債」はこの文脈でどのような比喩として使われていますか？', '「技術的負債」は「借金」の比喩で、不完全なコードが将来の開発コストを増大させることを表しています。불완전한 코드가 미래의 비용을 증가시키는 것을 빚에 비유하고 있습니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '投資のように将来大きなリターンが得られるもの', FALSE, 1),
    (gen_random_uuid(), q_id, '借金のように将来の負担が増えていくもの', TRUE, 2),
    (gen_random_uuid(), q_id, '保険のようにリスクを軽減するもの', FALSE, 3),
    (gen_random_uuid(), q_id, '貯金のように少しずつ蓄積されるもの', FALSE, 4);

  -- Q10: 추론/목적 (CTO 메시지)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nCTOメッセージ\n\n私たちのチームが今年取り組むべき最も重要な課題は、システムの可観測性（Observability）の向上である。現在、本番環境で問題が発生した際、原因の特定に数時間かかることがある。これはログの散在、メトリクスの不足、トレーシングの欠如に起因している。来期からは、分散トレーシングの導入、構造化ログの統一、ダッシュボードの整備を段階的に進めていく。これにより、問題の検知から原因特定までの時間を30分以内に短縮することを目標とする。また、SLI/SLOの定義を行い、サービスの信頼性を定量的に測定・管理できる体制を構築する。エンジニア一人一人が、自分が開発したコードの運用品質にも責任を持つという意識を持ってほしい。\n\n質問：CTOがこのメッセージを通じて最も伝えたいことは何だと推測できますか？', 'CTOは可観測性の向上と、エンジニアが運用品質にも責任を持つことの重要性を伝えています。시스템 장애 대응 능력 향상과 운영 품질에 대한 책임 의식을 강조하고 있습니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '新しい技術の導入を控えるべきだ', FALSE, 1),
    (gen_random_uuid(), q_id, '開発速度を優先すべきだ', FALSE, 2),
    (gen_random_uuid(), q_id, 'システムの問題を迅速に特定できる体制を作るべきだ', TRUE, 3),
    (gen_random_uuid(), q_id, 'チームの人数を増やすべきだ', FALSE, 4);
END $$;

-- ============================================
-- N1 読解クイズ (10 questions)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 내용 이해 (기술 윤리 에세이)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n人工知能の発展に伴い、技術倫理の議論がかつてないほど活発化している。特に、AIによる意思決定の透明性と説明可能性は、現代のソフトウェアエンジニアが直面する最も重要な課題の一つである。機械学習モデルがローンの審査や採用選考に用いられるようになった今日、そのアルゴリズムがなぜ特定の判断を下したのかを説明できなければ、社会的な信頼を得ることは困難である。いわゆる「ブラックボックス問題」は、技術的な課題であると同時に、民主主義社会の根幹に関わる問題でもある。なぜなら、アルゴリズムによる差別や偏見が、意図せずして社会的不平等を助長する可能性があるからだ。この問題に対処するために、欧州ではAI規制法が制定され、高リスクAIシステムに対して透明性と説明可能性を義務づけている。日本においても、AIガバナンスに関するガイドラインが策定されつつあり、企業は自社のAIシステムが倫理的に適切であることを積極的に示す責任を負いつつある。技術者は、効率性や精度だけでなく、公平性や透明性をも設計の原則として組み込む姿勢が求められている。\n\n質問：この文章で「ブラックボックス問題」が重要視されている理由として最も適切なものはどれですか？', '「ブラックボックス問題」は技術的課題であると同時に「民主主義社会の根幹に関わる」問題であり、アルゴリズムの差別や偏見が社会的不平等を助長する可能性があるからです。알고리즘의 차별이 사회적 불평등을 조장할 수 있기 때문입니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '技術的に解決が不可能であるから', FALSE, 1),
    (gen_random_uuid(), q_id, 'アルゴリズムの差別が社会的不平等を助長しうるから', TRUE, 2),
    (gen_random_uuid(), q_id, 'AIの開発コストが増大するから', FALSE, 3),
    (gen_random_uuid(), q_id, '欧州の規制に違反するから', FALSE, 4);

  -- Q2: 내용 이해 (AI 사회 영향 논문)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n生成AIの急速な進化は、ソフトウェア開発の在り方そのものを根本的に変えつつある。コード生成AIは、自然言語での指示からプログラムを自動生成し、開発者の生産性を飛躍的に向上させている。しかし、この革新は諸刃の剣でもある。AIが生成したコードの品質保証は誰が担うのか、知的財産権はどのように扱われるべきか、そしてAIへの過度な依存が開発者のスキル低下を招かないかという懸念が指摘されている。さらに深刻なのは、AI生成コードに含まれるセキュリティ脆弱性の問題である。学習データに含まれる脆弱なコードパターンが、そのまま再生産される可能性があり、これが大規模に展開されれば、インターネット全体のセキュリティリスクを高めることになりかねない。一方で、AIをセキュリティ監査に活用し、人間では見逃しやすい脆弱性を検出するという積極的な利用も進んでいる。結局のところ、AIは道具であり、その使い方を決めるのは人間である。技術者には、AIの能力と限界を正確に理解し、適切に活用する判断力が求められている。\n\n質問：この文章で、AI生成コードに関して「最も深刻」とされている問題は何ですか？', '文章では「さらに深刻なのは、AI生成コードに含まれるセキュリティ脆弱性の問題」と明記されています。AI 생성 코드에 포함된 보안 취약성이 가장 심각한 문제로 지적되고 있습니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '知的財産権の帰属の問題', FALSE, 1),
    (gen_random_uuid(), q_id, '開発者のスキル低下の問題', FALSE, 2),
    (gen_random_uuid(), q_id, 'AI生成コードに含まれるセキュリティ脆弱性の問題', TRUE, 3),
    (gen_random_uuid(), q_id, '生産性向上が期待ほどではない問題', FALSE, 4);

  -- Q3: 내용 이해 (기술과 사회 에세이)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nデジタルトランスフォーメーション（DX）が叫ばれて久しいが、真のDXとは単にアナログ業務をデジタル化することではない。それは組織の文化、ビジネスモデル、そして価値提供の方法そのものを根本から変革することを意味する。多くの日本企業がDX推進を掲げながらも、実態は既存の業務フローにITツールを当てはめただけの「デジタイゼーション」に留まっているケースが少なくない。真のDXを実現するためには、経営層がデジタル技術の本質を理解し、トップダウンで変革をリードする必要がある。同時に、現場のエンジニアやビジネス担当者がボトムアップで改善提案を行える組織風土の醸成も不可欠である。つまり、DXは技術の問題である以前に、組織と人の問題なのである。テクノロジーはあくまでもイネーブラーであり、それを活用して価値を生み出すのは、最終的には人間の創造性と変革への意志にかかっている。\n\n質問：筆者が考える「真のDX」とは何ですか？', '筆者は「真のDX」を「組織の文化、ビジネスモデル、価値提供の方法を根本から変革すること」と定義しています。조직 문화와 비즈니스 모델 자체를 근본적으로 변혁하는 것입니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべての業務をデジタル化すること', FALSE, 1),
    (gen_random_uuid(), q_id, '最新のITツールを導入すること', FALSE, 2),
    (gen_random_uuid(), q_id, '組織文化やビジネスモデルを根本から変革すること', TRUE, 3),
    (gen_random_uuid(), q_id, 'エンジニアの人数を増やすこと', FALSE, 4);

  -- Q4: 내용 이해 (소프트웨어 품질 논문)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nソフトウェアの品質を測定する指標は多岐にわたるが、近年特に注目されているのがSRE（Site Reliability Engineering）の文脈で提唱されたSLI/SLO/SLAの概念体系である。SLI（Service Level Indicator）はサービスの品質を定量的に測定する指標であり、可用性、レイテンシ、スループットなどが代表的なものとして挙げられる。SLO（Service Level Objective）はSLIに対する目標値を定めたものであり、例えば「可用性99.9%」や「レイテンシのp99が200ms以下」といった形で定義される。SLA（Service Level Agreement）はSLOを含む顧客との契約であり、目標を達成できなかった場合のペナルティが規定される。重要なのは、100%の可用性を目指すことが必ずしも最適解ではないということである。99.99%と99.999%の差は技術的にもコスト的にも莫大であり、そのリソースを新機能の開発に充てた方が、ユーザーにとって大きな価値を提供できる場合もある。エラーバジェットという概念は、まさにこのトレードオフを管理するために生まれたものである。\n\n質問：この文章によると、100%の可用性を目指すことについてどのような見解が示されていますか？', '100%の可用性を目指すことは「必ずしも最適解ではない」と述べられており、コストとのトレードオフを考慮すべきだとしています。반드시 최적의 해결책은 아니며 비용과의 트레이드오프를 고려해야 합니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべてのサービスで目指すべきである', FALSE, 1),
    (gen_random_uuid(), q_id, '技術的に不可能である', FALSE, 2),
    (gen_random_uuid(), q_id, '必ずしも最適解ではなくトレードオフを考慮すべきである', TRUE, 3),
    (gen_random_uuid(), q_id, 'SLAで必ず規定しなければならない', FALSE, 4);

  -- Q5: 세부 사항 (기술 경영 기사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nオープンソースソフトウェア（OSS）のエコシステムは、現代のソフトウェア産業の根幹を支えている。しかし、その持続可能性については深刻な懸念が指摘されている。多くの重要なOSSプロジェクトが、少数のメンテナーのボランティア的な貢献によって支えられているのが実態である。2021年のLog4j脆弱性問題は、広く利用されているOSSの保守が十分に行われていないことのリスクを世界に知らしめた。この問題を受けて、大手テック企業がOSSのセキュリティ強化に資金を拠出する動きが活発化している。また、GitHubスポンサーなどの仕組みを通じて、個人やコミュニティがOSSメンテナーを経済的に支援する文化も育ちつつある。しかし、根本的な解決には至っておらず、OSSの持続可能なガバナンスモデルの確立が急務とされている。一部の企業は、自社のビジネスに不可欠なOSSに対して専任のエンジニアを配置し、上流への貢献を組織的に行うという戦略を取り始めている。\n\n質問：Log4j脆弱性問題が世界に知らしめたことは何ですか？', 'Log4j脆弱性問題は「広く利用されているOSSの保守が十分に行われていないことのリスク」を知らしめたと述べられています。널리 사용되는 OSS의 유지보수가 충분히 이루어지지 않는 리스크를 알렸습니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'OSSの開発速度が商用ソフトに劣ること', FALSE, 1),
    (gen_random_uuid(), q_id, '広く利用されるOSSの保守が不十分であるリスク', TRUE, 2),
    (gen_random_uuid(), q_id, 'OSSのライセンスが複雑であること', FALSE, 3),
    (gen_random_uuid(), q_id, 'Java言語の脆弱性が多いこと', FALSE, 4);

  -- Q6: 세부 사항 (분산 시스템 기술문서)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n分散システムにおけるデータの一貫性は、CAP定理によって本質的な制約が課されている。CAP定理は、一貫性（Consistency）、可用性（Availability）、分断耐性（Partition Tolerance）の3つの特性のうち、同時に満たせるのは最大2つまでであるという定理である。ネットワーク分断は現実のシステムでは不可避であるため、実質的には一貫性と可用性のトレードオフとなる。この制約に対して、現代の分散データベースは「結果整合性（Eventual Consistency）」という概念を導入している。これは、一時的な不整合を許容しつつ、最終的にはすべてのレプリカが同じ状態に収束することを保証するものである。例えば、SNSの「いいね」の数がユーザーによって一時的に異なって表示されることは許容されるが、銀行口座の残高については厳密な一貫性が求められる。システムの設計者は、ビジネス要件に応じて適切な一貫性レベルを選択する必要がある。\n\n質問：CAP定理において、ネットワーク分断が不可避であることを考慮すると、実質的なトレードオフは何と何の間にありますか？', 'ネットワーク分断は不可避なので分断耐性は必須であり、「実質的には一貫性と可用性のトレードオフ」になると述べられています。일관성과 가용성 사이의 트레이드오프입니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '一貫性と分断耐性', FALSE, 1),
    (gen_random_uuid(), q_id, '一貫性と可用性', TRUE, 2),
    (gen_random_uuid(), q_id, '可用性と分断耐性', FALSE, 3),
    (gen_random_uuid(), q_id, 'スループットとレイテンシ', FALSE, 4);

  -- Q7: 세부 사항 (조직론 기사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nコンウェイの法則は、「システムを設計する組織は、その組織のコミュニケーション構造を反映した設計を生み出す」という経験則である。例えば、3つの独立したチームがコンパイラを開発すれば、3パスのコンパイラが生まれるという具合である。この法則は1967年にメルヴィン・コンウェイによって提唱されたが、半世紀以上を経た現在でも、ソフトウェアアーキテクチャの設計において重要な示唆を与え続けている。近年では、この法則を逆手に取った「逆コンウェイ戦略」が注目されている。すなわち、望ましいシステムアーキテクチャを先に定義し、それに合わせて組織構造を設計するというアプローチである。マイクロサービスアーキテクチャの導入に際して、各サービスに対応する小規模な自律的チームを編成するのは、まさにこの戦略の実践例と言える。しかし、組織変革は技術的変更以上に困難を伴うことが多く、段階的なアプローチが推奨されている。\n\n質問：「逆コンウェイ戦略」とはどのようなアプローチですか？', '「逆コンウェイ戦略」は「望ましいシステムアーキテクチャを先に定義し、それに合わせて組織構造を設計する」アプローチです。원하는 아키텍처를 먼저 정의하고 그에 맞춰 조직 구조를 설계하는 접근법입니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '組織構造に合わせてシステムを設計する', FALSE, 1),
    (gen_random_uuid(), q_id, '望ましいアーキテクチャに合わせて組織を設計する', TRUE, 2),
    (gen_random_uuid(), q_id, '組織とシステムを同時に変更する', FALSE, 3),
    (gen_random_uuid(), q_id, '外部コンサルタントにアーキテクチャを委任する', FALSE, 4);

  -- Q8: 문맥 어휘 (기술 철학 에세이)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nテクノロジーの進化は、常にユートピア的な期待とディストピア的な恐怖の狭間で語られてきた。インターネットの黎明期には、情報の民主化によって社会の格差が解消されるという楽観的な予測が支配的であった。しかし現実には、デジタルデバイドという新たな格差が生まれ、情報のフィルターバブルが社会の分断を加速させている側面も否定できない。テクノロジーは本質的に中立的な道具であるが、その設計と運用には人間の価値観と意図が不可避的に埋め込まれる。だからこそ、テクノロジーを設計するエンジニアには、技術的な卓越性だけでなく、社会的な感受性と倫理的な判断力が求められるのである。我々は技術の恩恵を享受しながらも、その影響を批判的に検証し続ける姿勢を失ってはならない。\n\n質問：「フィルターバブル」がこの文脈で問題視されている理由は何ですか？', '「フィルターバブル」はユーザーが自分の好みに合った情報しか見なくなる現象で、「社会の分断を加速させている」と問題視されています。사회의 분단을 가속화하는 요인으로 지적되고 있습니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '情報へのアクセスが制限されるから', FALSE, 1),
    (gen_random_uuid(), q_id, '社会の分断を加速させるから', TRUE, 2),
    (gen_random_uuid(), q_id, 'インターネットの速度が低下するから', FALSE, 3),
    (gen_random_uuid(), q_id, '個人情報が漏洩するリスクがあるから', FALSE, 4);

  -- Q9: 문맥 어휘 (기술 리더십 논문)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nソフトウェアエンジニアリングにおいて、「銀の弾丸はない」というフレデリック・ブルックスの命題は、半世紀近くを経てなお色褪せない真理である。彼が指摘したように、ソフトウェアの本質的複雑性は、いかなる技術革新によっても解消されることはない。新しいプログラミング言語、フレームワーク、方法論が次々と登場しては脚光を浴びるが、それらは偶有的複雑性を軽減するに過ぎない。アジャイルもDevOpsもマイクロサービスも、特定の問題に対する優れた解決策ではあるが、万能薬ではない。むしろ、それぞれが新たな複雑性をもたらす側面も持っている。成熟したエンジニアとは、この本質的な限界を理解した上で、目の前の問題に最も適した手法を選択できる人間のことを指すのではないだろうか。流行に踊らされることなく、技術の本質を見極める冷静さこそが、エンジニアリングの真髄である。\n\n質問：「偶有的複雑性」とはこの文脈でどのような意味ですか？', '「偶有的複雑性」は本質的ではない、技術やツールの選択によって生じる複雑性を指し、技術の進歩で軽減可能なものです。도구나 기술 선택에 의해 생기는 비본질적인 복잡성으로, 기술 발전으로 경감 가능한 것을 의미합니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソフトウェアの根本的な複雑さ', FALSE, 1),
    (gen_random_uuid(), q_id, 'ユーザーの要求による複雑さ', FALSE, 2),
    (gen_random_uuid(), q_id, '技術やツールの選択によって生じる非本質的な複雑さ', TRUE, 3),
    (gen_random_uuid(), q_id, 'ビジネス要件の変化による複雑さ', FALSE, 4);

  -- Q10: 추론/목적 (미래 기술 에세이)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n量子コンピューティングの実用化が現実味を帯びてくるにつれ、現在の暗号技術の根幹が揺らぎ始めている。RSA暗号やECC（楕円曲線暗号）といった広く使われている暗号方式は、古典的なコンピュータでは解読に天文学的な時間がかかる数学的問題に安全性の基盤を置いている。しかし、十分な量子ビットを持つ量子コンピュータが実現すれば、ショアのアルゴリズムによってこれらの暗号は短時間で解読されうる。この「ポスト量子」の脅威に備えて、NIST（米国国立標準技術研究所）は量子耐性を持つ新しい暗号アルゴリズムの標準化を進めている。現時点で量子コンピュータが実用レベルに達するまでにはまだ時間があるとされているが、「今日暗号化されたデータが、将来量子コンピュータによって解読される」という「Harvest now, decrypt later」の脅威は、すでに現実のものとなっている。つまり、敵対的な組織が現在暗号化された通信を傍受・保存し、将来の量子コンピュータで解読する可能性があるのだ。長期的に機密性を保つ必要があるデータを扱う組織にとって、ポスト量子暗号への移行は喫緊の課題と言えよう。\n\n質問：この文章の筆者が最も訴えたいことは何だと推測できますか？', '筆者は「Harvest now, decrypt later」の脅威を具体的に説明し、ポスト量子暗号への移行が「喫緊の課題」であると結論づけています。양자 내성 암호로의 전환이 시급하다는 것을 가장 강조하고 있습니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '量子コンピュータの開発を中止すべきである', FALSE, 1),
    (gen_random_uuid(), q_id, '現在の暗号技術で十分に安全である', FALSE, 2),
    (gen_random_uuid(), q_id, 'ポスト量子暗号への移行を今すぐ始めるべきである', TRUE, 3),
    (gen_random_uuid(), q_id, '暗号化されたデータの保存をやめるべきである', FALSE, 4);
END $$;
