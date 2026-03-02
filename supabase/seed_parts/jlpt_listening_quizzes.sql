-- ============================================
-- JLPT Listening Quizzes (5 quizzes, 10 questions each)
-- N5/N4/N3/N2/N1 levels
-- ============================================

-- Cleanup existing listening quiz data
DELETE FROM comprehensive_exam_answers WHERE selected_option_id IN (
  SELECT id FROM quiz_question_options WHERE question_id IN (
    SELECT id FROM quiz_questions WHERE quiz_id IN (
      'd0000001-0000-0000-0000-000000000001',
      'd0000002-0000-0000-0000-000000000002',
      'd0000003-0000-0000-0000-000000000003',
      'd0000004-0000-0000-0000-000000000004',
      'd0000005-0000-0000-0000-000000000005'
    )
  )
);
DELETE FROM comprehensive_exam_answers WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'd0000001-0000-0000-0000-000000000001',
    'd0000002-0000-0000-0000-000000000002',
    'd0000003-0000-0000-0000-000000000003',
    'd0000004-0000-0000-0000-000000000004',
    'd0000005-0000-0000-0000-000000000005'
  )
);
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
-- N5 Questions (10 questions)
-- Scripts: コンビニでの買い物, 駅で道を聞く, レストランで注文, 友達との電話, 天気のお知らせ
-- Categories: 내용이해(4), 세부정보(3), 화자의도(2), 추론(1)
-- ============================================

-- N5 Q1: 내용이해 (コンビニでの買い物)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：いらっしゃいませ。\n田中：すみません、おにぎりはどこですか。\n店員：おにぎりはあちらの棚にあります。\n田中：ありがとうございます。これと、お茶をください。\n店員：はい、おにぎり一つとお茶一つですね。全部で三百二十円です。\n\n質問：田中さんは何を買いましたか。', E'田中さんは「これと、お茶をください」と言っています。「これ」はおにぎりを指しているので、おにぎりとお茶を買いました。全部で320円です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주먹밥과 물', FALSE, 1),
    (gen_random_uuid(), q_id, '주먹밥과 차', TRUE, 2),
    (gen_random_uuid(), q_id, '도시락과 차', FALSE, 3),
    (gen_random_uuid(), q_id, '빵과 주스', FALSE, 4);
END $$;

-- N5 Q2: 내용이해 (駅で道を聞く)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：すみません、図書館はどこですか。\n鈴木：ここからまっすぐ行って、二つ目の信号を右に曲がってください。\n鈴木：右に曲がったら、左側にあります。\n山田：歩いてどのくらいかかりますか。\n鈴木：十分くらいですよ。\n\n質問：図書館に行くにはどうしますか。', E'鈴木さんの説明では「まっすぐ行って、二つ目の信号を右に曲がる」と言っています。左側にあるのは図書館の位置で、曲がる方向は右です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '곧장 가서 두 번째 신호등에서 오른쪽으로 돈다', TRUE, 1),
    (gen_random_uuid(), q_id, '곧장 가서 첫 번째 신호등에서 왼쪽으로 돈다', FALSE, 2),
    (gen_random_uuid(), q_id, '곧장 가서 세 번째 신호등에서 오른쪽으로 돈다', FALSE, 3),
    (gen_random_uuid(), q_id, '곧장 가서 두 번째 신호등에서 왼쪽으로 돈다', FALSE, 4);
END $$;

-- N5 Q3: 내용이해 (レストランで注文)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：何にする？\n佐藤：私はカレーライスにする。高橋さんは？\n高橋：私はラーメンにします。\n店員：ご注文はお決まりですか。\n佐藤：カレーライス一つとラーメン一つ、お願いします。\n\n質問：高橋さんは何を注文しましたか。', E'高橋さんは「私はラーメンにします」と言っています。佐藤さんがカレーライス、高橋さんがラーメンを注文しました。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '카레라이스', FALSE, 1),
    (gen_random_uuid(), q_id, '우동', FALSE, 2),
    (gen_random_uuid(), q_id, '카레라이스와 라멘', FALSE, 3),
    (gen_random_uuid(), q_id, '라멘', TRUE, 4);
END $$;

-- N5 Q4: 내용이해 (友達との電話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：土曜日、ひまですか。\n鈴木：うん、ひまだよ。\n山田：じゃあ、一緒に公園に行きませんか。\n鈴木：いいね！何時に会う？\n山田：十時はどうですか。\n鈴木：十時はちょっと早いな。十一時はどう？\n山田：十一時、いいですよ。駅の前で会いましょう。\n\n質問：二人はいつ、どこで会いますか。', E'最初は十時を提案しましたが、鈴木さんが「ちょっと早い」と言って十一時を提案し、山田さんも同意しました。場所は「駅の前」です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '토요일 10시, 공원 앞에서', FALSE, 1),
    (gen_random_uuid(), q_id, '일요일 11시, 역 앞에서', FALSE, 2),
    (gen_random_uuid(), q_id, '토요일 11시, 역 앞에서', TRUE, 3),
    (gen_random_uuid(), q_id, '토요일 10시, 역 앞에서', FALSE, 4);
END $$;

-- N5 Q5: 세부정보 (コンビニでの買い物)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：全部で三百二十円です。\n田中：千円でお願いします。\n店員：六百八十円のおつりです。レジ袋はいりますか。\n田中：いいえ、大丈夫です。\n\n質問：おつりはいくらですか。', E'田中さんは千円を出しました。合計が320円なので、おつりは1000−320＝680円です。店員も「六百八十円のおつり」と言っています。', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '320엔', FALSE, 1),
    (gen_random_uuid(), q_id, '780엔', FALSE, 2),
    (gen_random_uuid(), q_id, '680엔', TRUE, 3),
    (gen_random_uuid(), q_id, '1000엔', FALSE, 4);
END $$;

-- N5 Q6: 세부정보 (天気のお知らせ)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンサー：今日の東京の天気は晴れです。気温は二十五度です。明日は曇りで、午後から雨が降るでしょう。傘を持って出かけてください。\n\n質問：明日の天気はどうですか。', E'「明日は曇りで、午後から雨が降るでしょう」と言っています。明日は曇りのち雨です。', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '맑음', FALSE, 1),
    (gen_random_uuid(), q_id, '흐리고 오후부터 비', TRUE, 2),
    (gen_random_uuid(), q_id, '하루 종일 비', FALSE, 3),
    (gen_random_uuid(), q_id, '맑고 더움', FALSE, 4);
END $$;

-- N5 Q7: 세부정보 (駅で道を聞く)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：歩いてどのくらいかかりますか。\n鈴木：十分くらいですよ。\n\n質問：図書館まで歩いてどのくらいかかりますか。', E'鈴木さんは「十分くらいですよ」と答えています。徒歩で約10分です。', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약 5분', FALSE, 1),
    (gen_random_uuid(), q_id, '약 15분', FALSE, 2),
    (gen_random_uuid(), q_id, '약 20분', FALSE, 3),
    (gen_random_uuid(), q_id, '약 10분', TRUE, 4);
END $$;

-- N5 Q8: 화자의도 (レストランで注文)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：お飲み物はいかがですか。\n高橋：水をください。\n\n質問：店員が「お飲み物はいかがですか」と聞いた意図は何ですか。', E'店員は追加注文を確認しています。「いかがですか」は飲み物の注文を勧めている表現です。', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '음료가 맛있는지 확인하려고', FALSE, 1),
    (gen_random_uuid(), q_id, '음료 주문을 받으려고', TRUE, 2),
    (gen_random_uuid(), q_id, '음료가 없다고 알려주려고', FALSE, 3),
    (gen_random_uuid(), q_id, '음료를 추천하려고', FALSE, 4);
END $$;

-- N5 Q9: 화자의도 (友達との電話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：十時はどうですか。\n鈴木：十時はちょっと早いな。十一時はどう？\n\n質問：鈴木さんが「十時はちょっと早いな」と言ったのはなぜですか。', E'鈴木さんは10時では早すぎると感じたので、11時に変更したいという意図で言いました。「ちょっと早い」は控えめな断り方です。', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10시에는 약속이 있어서', FALSE, 1),
    (gen_random_uuid(), q_id, '공원이 10시에 문을 열지 않아서', FALSE, 2),
    (gen_random_uuid(), q_id, '10시는 너무 이르다고 느껴서 시간을 바꾸고 싶어서', TRUE, 3),
    (gen_random_uuid(), q_id, '토요일에 가고 싶지 않아서', FALSE, 4);
END $$;

-- N5 Q10: 추론 (天気のお知らせ)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンサー：明日は曇りで、午後から雨が降るでしょう。傘を持って出かけてください。週末は晴れて、暑くなります。水をたくさん飲んでください。\n\n質問：明日出かける人は何を持っていくべきですか。', E'「傘を持って出かけてください」と言っているので、明日は午後から雨が降るため傘が必要です。', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '물', FALSE, 1),
    (gen_random_uuid(), q_id, '모자', FALSE, 2),
    (gen_random_uuid(), q_id, '선크림', FALSE, 3),
    (gen_random_uuid(), q_id, '우산', TRUE, 4);
END $$;

-- ============================================
-- N4 Questions (10 questions)
-- Scripts: 病院での受診, 不動産屋でのアパート探し, 郵便局での手続き, バスの案内放送, 友人を旅行に誘う
-- Categories: 내용이해(4), 세부정보(3), 화자의도(2), 추론(1)
-- ============================================

-- N4 Q1: 내용이해 (病院での受診)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n田中：三日前から頭が痛くて、熱もあるんです。\n医者：熱を測りましょう。三十八度二分ですね。のどを見せてください。\n医者：のどが赤いですね。風邪だと思います。\n\n質問：医者は田中さんの病気を何だと言いましたか。', E'医者は「風邪だと思います」と診断しています。症状は頭痛、発熱、喉の赤みです。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '감기', TRUE, 1),
    (gen_random_uuid(), q_id, '독감', FALSE, 2),
    (gen_random_uuid(), q_id, '알레르기', FALSE, 3),
    (gen_random_uuid(), q_id, '편두통', FALSE, 4);
END $$;

-- N4 Q2: 내용이해 (不動産屋でのアパート探し)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：この物件はいかがですか。駅から歩いて七分で、家賃は五万八千円です。\n佐藤：いいですね。部屋の広さはどのくらいですか。\n店員：ワンルームで、二十平米です。バス・トイレ別です。\n\n質問：紹介された物件について正しいものはどれですか。', E'店員は「駅から歩いて七分で、家賃は五万八千円」「ワンルームで二十平米」「バス・トイレ別」と説明しています。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '역에서 10분, 월세 6만 엔', FALSE, 1),
    (gen_random_uuid(), q_id, '역에서 7분, 월세 6만 엔', FALSE, 2),
    (gen_random_uuid(), q_id, '역에서 5분, 월세 5만 8천 엔', FALSE, 3),
    (gen_random_uuid(), q_id, '역에서 7분, 월세 5만 8천 엔', TRUE, 4);
END $$;

-- N4 Q3: 내용이해 (郵便局での手続き)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：この荷物を韓国に送りたいんですが。\n局員：中身は何ですか。\n高橋：お菓子と本です。\n局員：航空便ですと、三日から五日ぐらいで届きます。料金は二千五百円です。\n\n質問：高橋さんは何を送りますか。', E'高橋さんは韓国に送る荷物の中身について「お菓子と本です」と答えています。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '옷과 책', FALSE, 1),
    (gen_random_uuid(), q_id, '과자와 옷', FALSE, 2),
    (gen_random_uuid(), q_id, '과자와 책', TRUE, 3),
    (gen_random_uuid(), q_id, '책과 선물', FALSE, 4);
END $$;

-- N4 Q4: 내용이해 (友人を旅行に誘う)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：京都はどう？紅葉がきれいな時期だと思うんだけど。\n鈴木：京都いいね。でも、宿は取れるかな。\n山田：夜行バスのほうが安いよ。片道三千円ぐらいで行ける。\n鈴木：そんなに安いの？じゃあ、バスにしよう。\n\n質問：二人はどうやって京都に行くことにしましたか。', E'山田さんが「夜行バスのほうが安い」と提案し、鈴木さんが「じゃあ、バスにしよう」と同意しました。', 1, 4, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신칸센으로', FALSE, 1),
    (gen_random_uuid(), q_id, '비행기로', FALSE, 2),
    (gen_random_uuid(), q_id, '전철로', FALSE, 3),
    (gen_random_uuid(), q_id, '야간버스로', TRUE, 4);
END $$;

-- N4 Q5: 세부정보 (病院での受診)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n医者：薬を出しますから、三日分飲んでください。\n田中：分かりました。食事の前に飲みますか。\n医者：いいえ、食事の後に飲んでください。\n\n質問：田中さんはいつ薬を飲みますか。', E'医者は「食事の後に飲んでください」と指示しています。食前ではなく食後に服用します。', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '식사 전에', FALSE, 1),
    (gen_random_uuid(), q_id, '식사 후에', TRUE, 2),
    (gen_random_uuid(), q_id, '자기 전에', FALSE, 3),
    (gen_random_uuid(), q_id, '아침에 일어나서', FALSE, 4);
END $$;

-- N4 Q6: 세부정보 (バスの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：このバスは東京駅行きです。次は「中央公園前」です。本日は祝日ダイヤで運行しております。通常より本数が少なくなっておりますので、ご注意ください。\n\n質問：今日のバスについて正しいものはどれですか。', E'「本日は祝日ダイヤで運行しております。通常より本数が少なくなっております」と言っているので、通常より運行本数が少ないです。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '평소보다 운행 횟수가 많다', FALSE, 1),
    (gen_random_uuid(), q_id, '오늘은 운행하지 않는다', FALSE, 2),
    (gen_random_uuid(), q_id, '공휴일 시간표로 운행 횟수가 적다', TRUE, 3),
    (gen_random_uuid(), q_id, '도쿄역까지 가지 않는다', FALSE, 4);
END $$;

-- N4 Q7: 세부정보 (郵便局での手続き)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n局員：航空便ですと、三日から五日ぐらいで届きます。料金は二千五百円です。\n高橋：じゃあ、航空便でお願いします。\n局員：こちらの伝票に送り先の住所とお名前を書いてください。\n\n質問：航空便の料金と届くまでの日数はどれですか。', E'局員は「三日から五日ぐらいで届きます。料金は二千五百円です」と説明しています。', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1,500엔, 1~2일', FALSE, 1),
    (gen_random_uuid(), q_id, '2,500엔, 3~5일', TRUE, 2),
    (gen_random_uuid(), q_id, '2,500엔, 7~10일', FALSE, 3),
    (gen_random_uuid(), q_id, '3,500엔, 3~5일', FALSE, 4);
END $$;

-- N4 Q8: 화자의도 (不動産屋でのアパート探し)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：いいですね。一度見に行ってもいいですか。\n店員：もちろんです。今週の土曜日はいかがですか。\n\n質問：佐藤さんが「一度見に行ってもいいですか」と言った意図は何ですか。', E'佐藤さんは物件の説明を聞いて気に入り、実際に部屋を確認するために内見を希望しています。', 1, 8, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '물건을 사고 싶어서', FALSE, 1),
    (gen_random_uuid(), q_id, '바로 계약하고 싶어서', FALSE, 2),
    (gen_random_uuid(), q_id, '실제로 방을 보고 싶어서', TRUE, 3),
    (gen_random_uuid(), q_id, '다른 부동산에 가고 싶어서', FALSE, 4);
END $$;

-- N4 Q9: 화자의도 (友人を旅行に誘う)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：鈴木さん、来月の連休、どこか行かない？\n鈴木：いいね！どこに行きたい？\n\n質問：山田さんが「どこか行かない？」と言ったのはなぜですか。', E'「～ない？」は否定疑問形ですが、相手を誘うときに使う表現です。山田さんは鈴木さんを旅行に誘っています。', 1, 9, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '여행에 가고 싶지 않아서', FALSE, 1),
    (gen_random_uuid(), q_id, '스즈키 씨의 예정을 확인하려고', FALSE, 2),
    (gen_random_uuid(), q_id, '연휴에 일이 있어서', FALSE, 3),
    (gen_random_uuid(), q_id, '스즈키 씨를 여행에 초대하려고', TRUE, 4);
END $$;

-- N4 Q10: 추론 (バスの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：次は「中央公園前」です。中央公園、市立図書館にお越しの方はこちらでお降りください。お降りの際は、前のドアからお降りください。車内では携帯電話はマナーモードにしてください。\n\n質問：市立図書館に行きたい人はどうすればいいですか。', E'「中央公園、市立図書館にお越しの方はこちらでお降りください」と案内しているので、「中央公園前」で下車すれば市立図書館に行けます。', 1, 10, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '다음 정류장인 시청 앞에서 내린다', FALSE, 1),
    (gen_random_uuid(), q_id, '주오공원 앞에서 내린다', TRUE, 2),
    (gen_random_uuid(), q_id, '도쿄역에서 내린다', FALSE, 3),
    (gen_random_uuid(), q_id, '뒷문으로 내린다', FALSE, 4);
END $$;

-- ============================================
-- N3 Questions (10 questions)
-- Scripts: 区役所での転入届, 近所トラブルの相談, お祭りの案内放送, 日本語教室での会話, 災害時の避難案内
-- Categories: 내용이해(4), 세부정보(3), 화자의도(2), 추론(1)
-- ============================================

-- N3 Q1: 내용이해 (区役所での転入届)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：先週、大阪から引っ越してきたので、転入届を出したいのですが。\n窓口：転入届ですね。前の住所の役所で転出届は出されましたか。\n佐藤：はい、転出証明書を持っています。\n\n質問：佐藤さんは何をしに来ましたか。', E'佐藤さんは「転入届を出したい」と言っています。大阪から引っ越してきたので、新しい住所の区役所で転入届の手続きをしに来ました。', 1, 1, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전입신고를 하러', TRUE, 1),
    (gen_random_uuid(), q_id, '전출신고를 하러', FALSE, 2),
    (gen_random_uuid(), q_id, '여권을 만들러', FALSE, 3),
    (gen_random_uuid(), q_id, '인감등록을 하러', FALSE, 4);
END $$;

-- N3 Q2: 내용이해 (近所トラブルの相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：実は、上の階の方の足音がかなり気になっていまして。特に夜の十時過ぎに大きな音がするんです。\n管理人：それはお困りでしょうね。いつ頃からですか。\n高橋：先月から新しい方が越してきてからです。\n\n質問：高橋さんは何に困っていますか。', E'高橋さんは「上の階の方の足音がかなり気になっている」と相談しています。特に夜22時以降の騒音が問題です。', 1, 2, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '옆방의 음악 소리', FALSE, 1),
    (gen_random_uuid(), q_id, '아래층의 냄새', FALSE, 2),
    (gen_random_uuid(), q_id, '윗층의 발소리 소음', TRUE, 3),
    (gen_random_uuid(), q_id, '주차장 문제', FALSE, 4);
END $$;

-- N3 Q3: 내용이해 (お祭りの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：午前十時から正午まで、中央広場で和太鼓の演奏が行われます。午後一時からは、盆踊り大会を開催いたします。花火大会は午後七時半から約三十分間行います。\n\n質問：盆踊り大会は何時からですか。', E'アナウンスでは「午後一時からは、盆踊り大会を開催いたします」と案内しています。', 1, 3, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오전 10시부터', FALSE, 1),
    (gen_random_uuid(), q_id, '정오부터', FALSE, 2),
    (gen_random_uuid(), q_id, '오후 1시부터', TRUE, 3),
    (gen_random_uuid(), q_id, '오후 7시 30분부터', FALSE, 4);
END $$;

-- N3 Q4: 내용이해 (日本語教室での会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先生：「おっしゃる」は相手の動作に使う尊敬語で、「申す」は自分の動作に使う謙譲語です。\nキム：なるほど。日常生活ではどのくらい使いますか。\n先生：お店の店員さんとか、病院で話すときによく使いますよ。\n\n質問：「おっしゃる」はどのような場面で使いますか。', E'先生は「おっしゃる」は「相手の動作に使う尊敬語」と説明しています。相手が何かを言った場面で使います。', 1, 4, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자신이 말할 때', FALSE, 1),
    (gen_random_uuid(), q_id, '친구에게 말할 때', FALSE, 2),
    (gen_random_uuid(), q_id, '상대방이 말한 것을 나타낼 때', TRUE, 3),
    (gen_random_uuid(), q_id, '혼잣말을 할 때', FALSE, 4);
END $$;

-- N3 Q5: 세부정보 (区役所での転入届)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：住民票もすぐもらえますか。\n窓口：はい、手続きが終わりましたら、住民票を発行できます。一通三百円になります。\n佐藤：では、二通お願いします。\n窓口：かしこまりました。手続きに二十分ほどかかります。\n\n質問：佐藤さんは住民票にいくら払いますか。', E'住民票は一通300円で、佐藤さんは二通注文したので、300×2＝600円です。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '300엔', FALSE, 1),
    (gen_random_uuid(), q_id, '500엔', FALSE, 2),
    (gen_random_uuid(), q_id, '600엔', TRUE, 3),
    (gen_random_uuid(), q_id, '900엔', FALSE, 4);
END $$;

-- N3 Q6: 세부정보 (お祭りの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：会場の北側には屋台が並んでおりまして、焼きそば、たこ焼き、かき氷などをお楽しみいただけます。お子様向けには、南側の広場で金魚すくいや輪投げなどのゲームをご用意しております。\n\n質問：子ども向けの遊びはどこにありますか。', E'「お子様向けには、南側の広場で金魚すくいや輪投げなどのゲームをご用意しております」と案内しています。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회장 북쪽', FALSE, 1),
    (gen_random_uuid(), q_id, '중앙 광장', FALSE, 2),
    (gen_random_uuid(), q_id, '회장 동쪽', FALSE, 3),
    (gen_random_uuid(), q_id, '남쪽 광장', TRUE, 4);
END $$;

-- N3 Q7: 세부정보 (災害時の避難案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：避難所は三か所開設されています。第一避難所は中央小学校、第二避難所は北区公民館、第三避難所は東体育館です。自動車での避難は道路が混雑する原因となりますので、できるだけ徒歩でお願いいたします。\n\n質問：避難所は全部でいくつありますか。', E'「避難所は三か所開設されています」と言っています。中央小学校、北区公民館、東体育館の3か所です。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1곳', FALSE, 1),
    (gen_random_uuid(), q_id, '2곳', FALSE, 2),
    (gen_random_uuid(), q_id, '3곳', TRUE, 3),
    (gen_random_uuid(), q_id, '5곳', FALSE, 4);
END $$;

-- N3 Q8: 화자의도 (近所トラブルの相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：直接言ったほうがいいでしょうか。\n管理人：最初は管理事務所から全体のお知らせという形が良いかと思います。それでも改善されない場合は、個別に対応いたします。\n\n質問：管理人はまず何をすると言いましたか。', E'管理人は「全体のお知らせとして、夜間の騒音に関する注意書きを掲示板に貼る」と言っています。直接言うのではなく、まず全体への注意喚起をする方針です。', 1, 8, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '윗층 주민에게 직접 주의를 준다', FALSE, 1),
    (gen_random_uuid(), q_id, '전체 공지로 야간 소음에 대한 주의사항을 게시한다', TRUE, 2),
    (gen_random_uuid(), q_id, '경찰에 신고한다', FALSE, 3),
    (gen_random_uuid(), q_id, '아무것도 하지 않는다', FALSE, 4);
END $$;

-- N3 Q9: 화자의도 (日本語教室での会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリン：友達には使わないほうがいいですか。\n先生：そうですね。友達に使うと距離を感じさせてしまいます。では、実際に練習してみましょう。ペアになってください。\n\n質問：先生が「友達に使うと距離を感じさせてしまいます」と言ったのはどういう意味ですか。', E'先生は、友達に対して敬語を使うと他人行儀になり、心理的な距離が生まれてしまうことを説明しています。', 1, 9, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '물리적 거리가 멀어진다는 뜻', FALSE, 1),
    (gen_random_uuid(), q_id, '친구에게 경어를 쓰면 서먹해질 수 있다는 뜻', TRUE, 2),
    (gen_random_uuid(), q_id, '친구와 만나기 어려워진다는 뜻', FALSE, 3),
    (gen_random_uuid(), q_id, '경어는 어렵다는 뜻', FALSE, 4);
END $$;

-- N3 Q10: 추론 (災害時の避難案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：ただいま、この地域に大雨警報が発令されました。河川の水位が上昇しておりますので、川の近くにお住まいの方は十分にご注意ください。自動車での避難は道路が混雑する原因となりますので、できるだけ徒歩でお願いいたします。\n\n質問：この放送から推測できることとして正しいものはどれですか。', E'大雨警報が発令され、河川の水位上昇が報告されているので、洪水の危険性があることが推測できます。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지진이 발생할 위험이 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '태풍이 접근하고 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '대피할 필요가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '홍수 위험이 있어서 강 근처 주민은 주의가 필요하다', TRUE, 4);
END $$;

-- ============================================
-- N2 Questions (10 questions)
-- Scripts: 市民講座の申し込み, 医師と患者の診察会話, PTA会議での議論, 交通安全の講演, マンション管理組合の会合
-- Categories: 내용이해(4), 세부정보(3), 화자의도(2), 추론(1)
-- ============================================

-- N2 Q1: 내용이해 (市民講座の申し込み)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：料理教室に興味がありまして。来月開講する講座はありますか。\n受付：来月ですと、「はじめての和食」と「家庭でできるイタリアン」の二講座がございます。\n山田：「はじめての和食」について詳しく教えていただけますか。\n\n質問：山田さんが詳しく聞きたい講座はどれですか。', E'山田さんは「はじめての和食」について詳しく教えてほしいと言っています。', 1, 1, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '처음 시작하는 일식', TRUE, 1),
    (gen_random_uuid(), q_id, '가정에서 만드는 이탈리안', FALSE, 2),
    (gen_random_uuid(), q_id, '두 강좌 모두', FALSE, 3),
    (gen_random_uuid(), q_id, '제과 교실', FALSE, 4);
END $$;

-- N2 Q2: 내용이해 (医師と患者の診察会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n医師：全体的に大きな問題はありませんが、コレステロール値がやや高めです。前回と比べると少し上がっています。\n田中：何か生活で気をつけることはありますか。\n医師：まず、食生活の見直しが大切です。揚げ物や脂っこい食事を控えて、野菜を多く摂るようにしてください。\n\n質問：田中さんの検査結果でどこに問題がありましたか。', E'医師は「コレステロール値がやや高め」で「前回と比べると少し上がっている」と説明しています。', 1, 2, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '혈압이 높다', FALSE, 1),
    (gen_random_uuid(), q_id, '혈당치가 높다', FALSE, 2),
    (gen_random_uuid(), q_id, '콜레스테롤 수치가 높다', TRUE, 3),
    (gen_random_uuid(), q_id, '특별한 문제는 없다', FALSE, 4);
END $$;

-- N2 Q3: 내용이해 (PTA会議での議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n会長：本日の議題は、来月の運動会についてです。日程の確認ですが、十月十二日の土曜日で変更はありませんね。\n副会長：はい、雨天の場合は翌日の十三日に延期ということで、学校側とも確認済みです。\n\n質問：運動会が雨で中止になったらどうなりますか。', E'副会長は「雨天の場合は翌日の十三日に延期」と説明しています。中止ではなく翌日に延期されます。', 1, 3, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '그대로 중지된다', FALSE, 1),
    (gen_random_uuid(), q_id, '다음 주로 연기된다', FALSE, 2),
    (gen_random_uuid(), q_id, '실내에서 진행한다', FALSE, 3),
    (gen_random_uuid(), q_id, '다음 날인 13일로 연기된다', TRUE, 4);
END $$;

-- N2 Q4: 내용이해 (マンション管理組合の会合)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n理事長：本日の議題は、大規模修繕工事の実施計画についてです。\n副理事長：築二十年を迎えまして、外壁の塗装や防水工事が必要な時期となっております。\n\n質問：臨時総会の議題は何ですか。', E'理事長は「大規模修繕工事の実施計画」が今日の議題だと説明しています。築20年で外壁塗装や防水工事が必要になりました。', 1, 4, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관리비 인상', FALSE, 1),
    (gen_random_uuid(), q_id, '대규모 수선공사 실시 계획', TRUE, 2),
    (gen_random_uuid(), q_id, '주차장 확장 공사', FALSE, 3),
    (gen_random_uuid(), q_id, '엘리베이터 교체', FALSE, 4);
END $$;

-- N2 Q5: 세부정보 (市民講座の申し込み)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n受付：毎週水曜日の午前十時から十二時まで、全八回のコースです。定員は十五名で、受講料は材料費込みで一万二千円になります。\n山田：持ち物は何か必要ですか。\n受付：エプロンと三角巾をご持参ください。調理器具と食材はこちらでご用意いたします。\n\n質問：受講者が持参するものは何ですか。', E'受付は「エプロンと三角巾をご持参ください」と言っています。調理器具と食材はセンター側で用意します。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조리기구와 식재료', FALSE, 1),
    (gen_random_uuid(), q_id, '앞치마와 삼각두건', TRUE, 2),
    (gen_random_uuid(), q_id, '교과서와 노트', FALSE, 3),
    (gen_random_uuid(), q_id, '칼과 도마', FALSE, 4);
END $$;

-- N2 Q6: 세부정보 (マンション管理組合の会合)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n理事長：見積もりを三社から取りまして、平均すると約三千万円になります。修繕積立金の残高は現在二千五百万円ですので、不足分は一時金として各戸にご負担いただく必要がございます。\n副理事長：全三十戸ですので、一戸あたり約十七万円のご負担となります。\n\n質問：修繕工事の不足分は一戸あたりいくらですか。', E'副理事長が「一戸あたり約十七万円のご負担」と説明しています。総額3000万円−積立金2500万円＝500万円の不足分を30戸で割った金額です。', 1, 6, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약 10만 엔', FALSE, 1),
    (gen_random_uuid(), q_id, '약 17만 엔', TRUE, 2),
    (gen_random_uuid(), q_id, '약 25만 엔', FALSE, 3),
    (gen_random_uuid(), q_id, '약 100만 엔', FALSE, 4);
END $$;

-- N2 Q7: 세부정보 (交通安全の講演)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：交通事故件数は前年より減少していますが、自転車に関する事故は逆に増加しています。特に、スマートフォンを見ながらの運転や、イヤホンをつけたままの走行が原因となるケースが目立ちます。\n\n質問：自転車事故が増えている原因として挙げられているものはどれですか。', E'講師は「スマートフォンを見ながらの運転」と「イヤホンをつけたままの走行」を自転車事故増加の原因として挙げています。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '음주 운전과 과속', FALSE, 1),
    (gen_random_uuid(), q_id, '신호 무시와 역주행', FALSE, 2),
    (gen_random_uuid(), q_id, '스마트폰 사용과 이어폰 착용', TRUE, 3),
    (gen_random_uuid(), q_id, '야간 무등 주행과 우산 사용', FALSE, 4);
END $$;

-- N2 Q8: 화자의도 (医師と患者の診察会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n田中：薬は必要ですか。\n医師：今のところ、薬を出すほどではありません。まずは生活習慣の改善で様子を見ましょう。三か月後にもう一度検査をしますので、それまでに改善が見られなければ、その時に薬の処方を検討します。\n\n質問：医師が「まずは生活習慣の改善で様子を見ましょう」と言った意図は何ですか。', E'医師は薬に頼る前に、食事改善や運動などの生活習慣の見直しで改善できるか様子を見たいと考えています。3か月後の再検査で判断する方針です。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약을 처방하기에는 증상이 너무 심해서', FALSE, 1),
    (gen_random_uuid(), q_id, '약 없이 생활습관 개선으로 먼저 경과를 보고 싶어서', TRUE, 2),
    (gen_random_uuid(), q_id, '약이 현재 품절이라서', FALSE, 3),
    (gen_random_uuid(), q_id, '다나카 씨가 약을 거부해서', FALSE, 4);
END $$;

-- N2 Q9: 화자의도 (PTA会議での議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：昨年はアレルギー対応が不十分だという声がありました。今年は各出店にアレルギー表示を義務付けてはどうでしょうか。\n副会長：賛成です。食品表示のテンプレートを作って配布するのがいいと思います。\n\n質問：佐藤さんが提案したことは何ですか。', E'佐藤さんは「各出店にアレルギー表示を義務付ける」ことを提案しています。昨年の反省を踏まえた改善案です。', 1, 9, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '음식 판매를 중지하자', FALSE, 1),
    (gen_random_uuid(), q_id, '판매 음식의 수를 줄이자', FALSE, 2),
    (gen_random_uuid(), q_id, '각 판매점에 알레르기 표시를 의무화하자', TRUE, 3),
    (gen_random_uuid(), q_id, '알레르기가 있는 아이는 참가를 자제하자', FALSE, 4);
END $$;

-- N2 Q10: 추론 (交通安全の講演)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：自転車も車両の一種ですので、交通ルールを守る義務があります。具体的には、信号を守ること、一時停止の標識では必ず止まること、夜間は必ずライトを点灯すること、そして歩道ではなく車道の左側を走行することが基本です。\n\n質問：この講演から推測できる問題として正しいものはどれですか。', E'講師がわざわざ自転車の基本ルールを説明しているということは、これらのルールが守られていない現状があることが推測できます。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자동차 사고가 증가하고 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '자전거 이용자가 교통 규칙을 잘 지키지 않는 현실이 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '보행자 사고가 가장 많다', FALSE, 3),
    (gen_random_uuid(), q_id, '교통 규칙이 최근 변경되었다', FALSE, 4);
END $$;

-- ============================================
-- N1 Questions (10 questions)
-- Scripts: 市長の施政方針演説, 文化交流シンポジウム, 地域活性化の座談会, 教育改革についての討論, 環境保護NPOの活動報告
-- Categories: 내용이해(4), 세부정보(3), 화자의도(2), 추론(1)
-- ============================================

-- N1 Q1: 내용이해 (市長の施政方針演説)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n市長：当市は少子高齢化という構造的課題に直面しておりますが、これを危機ではなく変革の好機と捉え、持続可能なまちづくりを推進してまいります。第一に、子育て支援の抜本的強化です。第二に、高齢者福祉の充実です。第三に、防災・減災対策の強化です。\n\n質問：市長が挙げた三つの重点施策に含まれないものはどれですか。', E'市長は三つの施策として「子育て支援」「高齢者福祉」「防災・減災対策」を挙げています。産業振興は含まれていません。', 1, 1, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '육아 지원 강화', FALSE, 1),
    (gen_random_uuid(), q_id, '고령자 복지 충실', FALSE, 2),
    (gen_random_uuid(), q_id, '산업 진흥', TRUE, 3),
    (gen_random_uuid(), q_id, '방재·감재 대책 강화', FALSE, 4);
END $$;

-- N1 Q2: 내용이해 (文化交流シンポジウム)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n教授：共生という言葉が示すように、これは一方的な同化ではなく、相互理解と尊重に基づく関係の構築を意味します。\nパネリストA：外国人住民の方々が最も困っているのは、やはり言葉の壁です。\n\n質問：パネリストAが外国人住民の最大の課題として挙げたものは何ですか。', E'パネリストAは「外国人住民の方々が最も困っているのは、やはり言葉の壁です」と明確に述べています。', 1, 2, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취업 문제', FALSE, 1),
    (gen_random_uuid(), q_id, '주거 문제', FALSE, 2),
    (gen_random_uuid(), q_id, '문화 차이', FALSE, 3),
    (gen_random_uuid(), q_id, '언어의 벽', TRUE, 4);
END $$;

-- N1 Q3: 내용이해 (地域活性化の座談会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n田中：当町の人口はこの二十年で三割減少しました。特に若年層の流出が深刻で、高校を卒業すると大半が都市部に出てしまいます。商店街もシャッター通りと化し、かつての賑わいは見る影もありません。\n\n質問：田中さんが述べた地域の問題は何ですか。', E'田中さんは人口が20年で3割減少し、若者が流出し、商店街が衰退していると述べています。人口減少と地域の衰退が問題です。', 1, 3, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인구 감소와 젊은 층 유출로 인한 지역 쇠퇴', TRUE, 1),
    (gen_random_uuid(), q_id, '인구 과밀과 교통 체증', FALSE, 2),
    (gen_random_uuid(), q_id, '외국인 관광객 증가로 인한 혼잡', FALSE, 3),
    (gen_random_uuid(), q_id, '자연재해 피해 복구', FALSE, 4);
END $$;

-- N1 Q4: 내용이해 (教育改革についての討論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n教授A：最大の課題は、画一的な教育から個別最適化された学びへの転換が進んでいないことです。\n教授B：私はむしろ、教育の本質的な目的が見失われていることを懸念しています。知識の暗記偏重から脱却できず、批判的思考力や創造性を育む教育が不十分です。\n\n質問：教授Bが懸念している問題は何ですか。', E'教授Bは「知識の暗記偏重から脱却できず、批判的思考力や創造性を育む教育が不十分」だと懸念しています。教育の本質的な目的が見失われているという指摘です。', 1, 4, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '획일적 교육에서 개별 최적화로의 전환 부족', FALSE, 1),
    (gen_random_uuid(), q_id, '학교 시설의 노후화', FALSE, 2),
    (gen_random_uuid(), q_id, '암기 편중에서 벗어나지 못하고 비판적 사고력과 창의성 교육이 부족한 것', TRUE, 3),
    (gen_random_uuid(), q_id, '교원 수의 부족', FALSE, 4);
END $$;

-- N1 Q5: 세부정보 (市長の施政方針演説)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n市長：各地区に設置しております高齢者サロンを現在の十五か所から二十五か所に増設し、高齢者の社会参加と生きがいづくりを支援いたします。\n\n質問：高齢者サロンの増設計画はどのようなものですか。', E'市長は高齢者サロンを「現在の十五か所から二十五か所に増設」すると述べています。10か所の増設です。', 1, 5, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10곳에서 15곳으로 증설', FALSE, 1),
    (gen_random_uuid(), q_id, '15곳에서 25곳으로 증설', TRUE, 2),
    (gen_random_uuid(), q_id, '20곳에서 30곳으로 증설', FALSE, 3),
    (gen_random_uuid(), q_id, '25곳에서 50곳으로 증설', FALSE, 4);
END $$;

-- N1 Q6: 세부정보 (環境保護NPOの活動報告)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n代表：第一の事業は、里山再生プロジェクトです。荒廃していた市内五か所の里山において、地域住民とボランティアの協力のもと、間伐作業や植樹活動を実施しました。延べ参加人数は千二百名に達し、約三千本の苗木を植えることができました。\n\n質問：里山再生プロジェクトの成果として正しいものはどれですか。', E'代表は「延べ参加人数は千二百名に達し、約三千本の苗木を植えることができました」と報告しています。', 1, 6, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '연인원 1,200명이 참가하여 약 3,000그루를 심었다', TRUE, 1),
    (gen_random_uuid(), q_id, '연인원 500명이 참가하여 1,000그루를 심었다', FALSE, 2),
    (gen_random_uuid(), q_id, '연인원 3,000명이 참가하여 약 1,200그루를 심었다', FALSE, 3),
    (gen_random_uuid(), q_id, '연인원 2,000명이 참가하여 약 5,000그루를 심었다', FALSE, 4);
END $$;

-- N1 Q7: 세부정보 (地域活性化の座談会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n佐藤：当地域にはまだ十分に活用されていない観光資源が数多くあります。温泉や伝統工芸、豊かな自然環境を組み合わせた体験型の滞在プログラムを開発することで、交流人口の拡大を図れるのではないでしょうか。\n\n質問：佐藤さんが提案した地域活性化の方策は何ですか。', E'佐藤さんは温泉・伝統工芸・自然環境を組み合わせた「体験型の滞在プログラム」で交流人口の拡大を図ることを提案しています。', 1, 7, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대규모 쇼핑몰 유치', FALSE, 1),
    (gen_random_uuid(), q_id, '공장 건설 유치', FALSE, 2),
    (gen_random_uuid(), q_id, '온천·전통공예·자연환경을 결합한 체험형 체재 프로그램 개발', TRUE, 3),
    (gen_random_uuid(), q_id, '고속도로 건설', FALSE, 4);
END $$;

-- N1 Q8: 화자의도 (教育改革についての討論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n保護者代表：現場の声として申し上げますと、教員の多忙化が子どもたちの教育の質に直接影響しています。教員が一人一人の子どもと向き合う時間が不足しています。部活動の指導や事務作業の負担を軽減しなければ、いくら理想を掲げても実現は困難です。\n\n質問：保護者代表が最も伝えたかったことは何ですか。', E'保護者代表は、教員の業務負担軽減なしに教育改革は実現できないと訴えています。理想論だけでなく、現場の教員の負担を減らすことが必要だという主張です。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부활동을 폐지해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '교원을 더 많이 채용해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '교원의 업무 부담을 줄이지 않으면 교육 개혁은 실현 불가능하다', TRUE, 3),
    (gen_random_uuid(), q_id, '학부모가 더 많이 참여해야 한다', FALSE, 4);
END $$;

-- N1 Q9: 화자의도 (文化交流シンポジウム)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n教授：制度的な整備に加えて、地域レベルでの草の根の交流こそが、真の共生社会を実現する鍵ではないでしょうか。お互いの文化を知り、日常的な接点を増やしていくことが、偏見や差別を克服する最も有効な手段だと確信しています。\n\n質問：教授が真の共生社会実現の鍵だと考えているものは何ですか。', E'教授は「地域レベルでの草の根の交流」こそが鍵だと述べ、「日常的な接点を増やす」ことが偏見克服に有効だと確信しています。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '법률과 제도의 정비', FALSE, 1),
    (gen_random_uuid(), q_id, '외국인 주민의 일본어 능력 향상', FALSE, 2),
    (gen_random_uuid(), q_id, '지역 수준의 풀뿌리 교류와 일상적 접점 확대', TRUE, 3),
    (gen_random_uuid(), q_id, '외국인 주민 수의 제한', FALSE, 4);
END $$;

-- N1 Q10: 추론 (環境保護NPOの活動報告)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n代表：課題としましては、活動資金の確保が依然として厳しい状況にあります。会員数は増加傾向にあるものの、助成金への依存度が高く、自主財源の多様化が必要です。\n事務局長：来年度の展望としましては、企業との協働事業の拡大や、クラウドファンディングの活用など、新たな資金調達の仕組みを構築してまいります。\n\n質問：このNPOの最大の課題と今後の対策として正しい組み合わせはどれですか。', E'課題は「活動資金の確保」で「助成金への依存度が高い」こと。対策は「企業との協働事業」「クラウドファンディング」など新たな資金調達方法の構築です。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회원 감소 - 회비 인상으로 대응', FALSE, 1),
    (gen_random_uuid(), q_id, '자원봉사자 부족 - 유급 직원 채용', FALSE, 2),
    (gen_random_uuid(), q_id, '활동 자금 확보 어려움 - 기업 협업과 크라우드펀딩 활용', TRUE, 3),
    (gen_random_uuid(), q_id, '활동 범위 축소 - 다른 지역 NPO와 통합', FALSE, 4);
END $$;

-- ============================================
-- Additional Listening Questions (+20 per quiz, Q11-Q30)
-- ============================================

-- ============================================
-- N5 聴解 追加問題 (Q11-Q30)
-- ============================================

-- N5 Q11: 내용이해 (道案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、ゆうびんきょくは どこですか。\nB：まっすぐ いって、つぎの かどを みぎに まがってください。ひだりがわに あります。\nA：ありがとうございます。\n\n質問：ゆうびんきょくは どちらに まがりますか？', E'「みぎに まがってください」と言っています。오른쪽으로 돕니다。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '왼쪽', FALSE, 1),
    (gen_random_uuid(), q_id, '오른쪽', TRUE, 2),
    (gen_random_uuid(), q_id, '직진', FALSE, 3),
    (gen_random_uuid(), q_id, '뒤로', FALSE, 4);
END $$;

-- N5 Q12: 세부정보 (買い物 - 数量)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：いらっしゃいませ。\n客：りんごを 5つ ください。\n店員：すみません、きょうは 3つしか ありません。\n客：じゃ、3つ ください。\n\n質問：おきゃくさんは りんごを いくつ かいますか？', E'「3つしかありません」と言われ、「3つください」と答えています。3개 삽니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5개', FALSE, 1),
    (gen_random_uuid(), q_id, '3개', TRUE, 2),
    (gen_random_uuid(), q_id, '2개', FALSE, 3),
    (gen_random_uuid(), q_id, '사지 않는다', FALSE, 4);
END $$;

-- N5 Q13: 화자의도 (お願い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：あした、いっしょに としょかんに いきませんか。\nB：いいですね。なんじに いきますか。\nA：10じは どうですか。\nB：10じは ちょっと はやいです。11じに しましょう。\nA：わかりました。\n\n質問：ふたりは なんじに いきますか？', E'Bが「11じにしましょう」と提案し、Aが「わかりました」と答えています。11시에 갑니다。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '9시', FALSE, 1),
    (gen_random_uuid(), q_id, '10시', FALSE, 2),
    (gen_random_uuid(), q_id, '11시', TRUE, 3),
    (gen_random_uuid(), q_id, '12시', FALSE, 4);
END $$;

-- N5 Q14: 내용이해 (自己紹介)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：はじめまして。わたしは キムです。かんこくから きました。\nB：はじめまして。たなかです。キムさんの しゅみは なんですか。\nA：りょうりが すきです。にほんの りょうりを つくりたいです。\n\n質問：キムさんは なにが すきですか？', E'「りょうりが すきです」と言っています。요리를 좋아합니다。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '독서', FALSE, 1),
    (gen_random_uuid(), q_id, '요리', TRUE, 2),
    (gen_random_uuid(), q_id, '음악', FALSE, 3),
    (gen_random_uuid(), q_id, '운동', FALSE, 4);
END $$;

-- N5 Q15: 세부정보 (天気と服装)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：きょうは さむいですね。\nB：そうですね。コートを きたほうが いいですよ。\nA：はい。ぼうしも かぶります。\nB：いいですね。\n\n質問：Aさんは なにを きますか？', E'「コートを きた」と「ぼうしも かぶります」と言っています。코트와 모자입니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코트만', FALSE, 1),
    (gen_random_uuid(), q_id, '모자만', FALSE, 2),
    (gen_random_uuid(), q_id, '코트와 모자', TRUE, 3),
    (gen_random_uuid(), q_id, '마후라만', FALSE, 4);
END $$;

-- N5 Q16: 화자의도 (断り)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：どようび、パーティーに きませんか。\nB：すみません、どようびは ちょっと…。\nA：そうですか。ざんねんですね。\nB：ほんとうに すみません。\n\n質問：Bさんは パーティーに いきますか？', E'「ちょっと…」は断りの表現です。Bさんはパーティーに行けません。가지 않습니다。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '간다', FALSE, 1),
    (gen_random_uuid(), q_id, '가지 않는다', TRUE, 2),
    (gen_random_uuid(), q_id, '늦게 간다', FALSE, 3),
    (gen_random_uuid(), q_id, '아직 모른다', FALSE, 4);
END $$;

-- N5 Q17: 내용이해 (学校で)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nせんせい：あしたは テストが あります。きょうかしょの 1ページから 20ページまでです。\nがくせい：せんせい、ノートも ひつようですか。\nせんせい：いいえ、えんぴつと けしゴムだけ もってきてください。\n\n質問：テストに なにを もっていきますか？', E'「えんぴつと けしゴムだけ」と言っています。연필과 지우개만 가져갑니다。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교과서와 노트', FALSE, 1),
    (gen_random_uuid(), q_id, '연필과 지우개', TRUE, 2),
    (gen_random_uuid(), q_id, '노트와 연필', FALSE, 3),
    (gen_random_uuid(), q_id, '아무것도 필요 없다', FALSE, 4);
END $$;

-- N5 Q18: 세부정보 (予約)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：おでんわ ありがとうございます。さくらレストランです。\n客：よやくを おねがいします。あしたの 7じに 4にんです。\n店員：7じですね。おなまえを おねがいします。\n客：パクです。\n\n質問：なんにんで よやくしましたか？', E'「4にんです」と言っています。4명으로 예약했습니다。', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2명', FALSE, 1),
    (gen_random_uuid(), q_id, '3명', FALSE, 2),
    (gen_random_uuid(), q_id, '4명', TRUE, 3),
    (gen_random_uuid(), q_id, '5명', FALSE, 4);
END $$;

-- N5 Q19: 추론 (感情)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：きょう、テストの けっかが でました。\nB：どうでしたか。\nA：90てんでした！\nB：すごいですね！おめでとうございます。\nA：ありがとうございます。とても うれしいです。\n\n質問：Aさんは いま どんな きもちですか？', E'「とても うれしいです」と言っています。매우 기쁜 기분입니다。', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '슬프다', FALSE, 1),
    (gen_random_uuid(), q_id, '기쁘다', TRUE, 2),
    (gen_random_uuid(), q_id, '화가 난다', FALSE, 3),
    (gen_random_uuid(), q_id, '걱정된다', FALSE, 4);
END $$;

-- N5 Q20: 내용이해 (日常の予定)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：にちようびは なにを しますか。\nB：ごぜんは せんたくを します。ごごは かいものに いきます。\nA：よるは？\nB：テレビを みます。\n\n質問：Bさんは ごごに なにを しますか？', E'「ごごは かいものに いきます」と言っています。오후에는 쇼핑을 갑니다。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빨래', FALSE, 1),
    (gen_random_uuid(), q_id, '쇼핑', TRUE, 2),
    (gen_random_uuid(), q_id, 'TV 시청', FALSE, 3),
    (gen_random_uuid(), q_id, '요리', FALSE, 4);
END $$;

-- N5 Q21-Q30 (remaining 10)
-- N5 Q21: 세부정보 (交通手段)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：がっこうまで どうやって いきますか。\nB：バスで いきます。20ぷん ぐらいです。\nA：でんしゃは つかいませんか。\nB：えきが とおいですから、バスの ほうが べんりです。\n\n質問：Bさんは なぜ バスで いきますか？', E'「えきが とおい」のでバスの方が便利と言っています。역이 멀기 때문에 버스가 편리합니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버스가 싸니까', FALSE, 1),
    (gen_random_uuid(), q_id, '역이 멀어서 버스가 편리하니까', TRUE, 2),
    (gen_random_uuid(), q_id, '전철이 없으니까', FALSE, 3),
    (gen_random_uuid(), q_id, '걷고 싶으니까', FALSE, 4);
END $$;

-- N5 Q22: 화자의도 (提案)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：あたまが いたいです。\nB：だいじょうぶですか。くすりを のんだほうが いいですよ。\nA：くすりが ありません。\nB：じゃ、わたしの くすりを あげましょう。\n\n質問：Bさんは なにを してあげますか？', E'「わたしの くすりを あげましょう」と言っています。자신의 약을 줍니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '병원에 데려간다', FALSE, 1),
    (gen_random_uuid(), q_id, '약을 준다', TRUE, 2),
    (gen_random_uuid(), q_id, '물을 준다', FALSE, 3),
    (gen_random_uuid(), q_id, '쉬게 한다', FALSE, 4);
END $$;

-- N5 Q23: 내용이해 (食事)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：おひるごはん、なにを たべますか。\nB：ラーメンが いいです。\nA：わたしは カレーに します。\nB：あ、わたしも カレーに しましょう。\n\n質問：ふたりは なにを たべますか？', E'Bが「わたしもカレーにしましょう」と変更したので、二人ともカレーを食べます。둘 다 카레를 먹습니다。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '라멘', FALSE, 1),
    (gen_random_uuid(), q_id, '카레', TRUE, 2),
    (gen_random_uuid(), q_id, '각각 다른 것', FALSE, 3),
    (gen_random_uuid(), q_id, '우동', FALSE, 4);
END $$;

-- N5 Q24: 세부정보 (場所)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、トイレは どこですか。\nB：あのエレベーターの そばに あります。2かいです。\nA：ありがとうございます。\n\n質問：トイレは なんかいに ありますか？', E'「2かいです」と言っています。2층에 있습니다。', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1층', FALSE, 1),
    (gen_random_uuid(), q_id, '2층', TRUE, 2),
    (gen_random_uuid(), q_id, '3층', FALSE, 3),
    (gen_random_uuid(), q_id, '지하 1층', FALSE, 4);
END $$;

-- N5 Q25: 추론 (体調)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：どうしましたか。かおが あかいですよ。\nB：ちょっと ねつが あるみたいです。\nA：はやく うちに かえった ほうが いいですよ。\nB：そうですね。せんせいに いって かえります。\n\n質問：Bさんは これから なにを しますか？', E'先生に言って帰ると言っています。선생님께 말씀드리고 집에 돌아갑니다。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '병원에 간다', FALSE, 1),
    (gen_random_uuid(), q_id, '선생님께 말하고 집에 간다', TRUE, 2),
    (gen_random_uuid(), q_id, '공부를 계속한다', FALSE, 3),
    (gen_random_uuid(), q_id, '약을 먹는다', FALSE, 4);
END $$;

-- N5 Q26: 내용이해 (趣味)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：やすみの ひは なにを していますか。\nB：えいがを みたり、ほんを よんだりしています。\nA：どんな えいがが すきですか。\nB：アクションえいがが すきです。\n\n質問：Bさんが すきな えいがは なんですか？', E'「アクションえいがが すきです」と言っています。액션 영화를 좋아합니다。', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공포 영화', FALSE, 1),
    (gen_random_uuid(), q_id, '액션 영화', TRUE, 2),
    (gen_random_uuid(), q_id, '로맨스 영화', FALSE, 3),
    (gen_random_uuid(), q_id, '코미디 영화', FALSE, 4);
END $$;

-- N5 Q27: 세부정보 (値段)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：この ノートは いくらですか。\nB：150えんです。\nA：じゃ、2つ ください。\nB：ぜんぶで 300えんです。\n\n質問：ノート 1つの ねだんは いくらですか？', E'「150えんです」と言っています。1개에 150엔입니다。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '100엔', FALSE, 1),
    (gen_random_uuid(), q_id, '150엔', TRUE, 2),
    (gen_random_uuid(), q_id, '200엔', FALSE, 3),
    (gen_random_uuid(), q_id, '300엔', FALSE, 4);
END $$;

-- N5 Q28: 화자의도 (誘い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：あした、うみに いきませんか。\nB：いいですね。でも あしたは あめかもしれません。\nA：じゃ、あさっては どうですか。\nB：あさっては はれですから、いいですよ。\n\n質問：ふたりは いつ うみに いきますか？', E'「あさっては はれですから、いいですよ」で合意しました。모레 갑니다。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오늘', FALSE, 1),
    (gen_random_uuid(), q_id, '내일', FALSE, 2),
    (gen_random_uuid(), q_id, '모레', TRUE, 3),
    (gen_random_uuid(), q_id, '가지 않는다', FALSE, 4);
END $$;

-- N5 Q29: 추론 (家族の話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：きょうだいは いますか。\nB：はい、あねが ひとり います。\nA：おねえさんは なにを していますか。\nB：びょういんで はたらいています。\n\n質問：Bさんの おねえさんの しごとは なんですか？', E'「びょういんで はたらいています」と言っています。병원에서 일하고 있습니다。', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '선생님', FALSE, 1),
    (gen_random_uuid(), q_id, '병원 근무', TRUE, 2),
    (gen_random_uuid(), q_id, '회사원', FALSE, 3),
    (gen_random_uuid(), q_id, '학생', FALSE, 4);
END $$;

-- N5 Q30: 내용이해 (休みの計画)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：なつやすみは なにを しますか。\nB：くにに かえります。\nA：いいですね。なんにち ぐらい かえりますか。\nB：2しゅうかん ぐらいです。\n\n質問：Bさんは なつやすみに なにを しますか？', E'「くにに かえります」と言っています。고향에 돌아갑니다。', 1, 30, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '여행을 간다', FALSE, 1),
    (gen_random_uuid(), q_id, '고향에 돌아간다', TRUE, 2),
    (gen_random_uuid(), q_id, '아르바이트를 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본에 있는다', FALSE, 4);
END $$;

-- ============================================
-- N4 聴解 追加問題 (Q11-Q30)
-- ============================================

-- N4 Q11: 내용이해 (アルバイトの面接)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n面接官：アルバイトの経験はありますか。\n応募者：はい、韓国でカフェで1年間働いていました。\n面接官：日本語はどのくらいできますか。\n応募者：日常会話なら大丈夫です。\n面接官：勤務時間は週3日、夕方5時から9時までですが、よろしいですか。\n応募者：はい、大丈夫です。\n\n質問：このアルバイトの勤務時間は？', E'「夕方5時から9時まで」と言っています。오후 5시부터 9시까지입니다。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오전 9시~오후 1시', FALSE, 1),
    (gen_random_uuid(), q_id, '오후 5시~9시', TRUE, 2),
    (gen_random_uuid(), q_id, '오후 1시~5시', FALSE, 3),
    (gen_random_uuid(), q_id, '오후 3시~7시', FALSE, 4);
END $$;

-- N4 Q12: 세부정보 (病院の受付)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n受付：どうなさいましたか。\n患者：3日前から頭が痛くて、熱もあります。\n受付：今の体温は何度ですか。\n患者：今朝測ったら38度2分でした。\n受付：保険証をお持ちですか。\n患者：はい、ここにあります。\n\n質問：患者さんの体温は何度ですか？', E'「38度2分」と言っています。38.2도입니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '37.5도', FALSE, 1),
    (gen_random_uuid(), q_id, '38.2도', TRUE, 2),
    (gen_random_uuid(), q_id, '39도', FALSE, 3),
    (gen_random_uuid(), q_id, '36.8도', FALSE, 4);
END $$;

-- N4 Q13: 화자의도 (旅行の相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：今度の連休、どこかに行きたいんだけど。\nB：京都はどう？紅葉がきれいだよ。\nA：京都はこの前行ったばかりだから、他のところがいいな。\nB：じゃ、大阪は？食べ物がおいしいよ。\nA：いいね！大阪にしよう。\n\n質問：二人はどこに行くことにしましたか？', E'「大阪にしよう」と決まりました。오사카로 결정했습니다。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교토', FALSE, 1),
    (gen_random_uuid(), q_id, '오사카', TRUE, 2),
    (gen_random_uuid(), q_id, '도쿄', FALSE, 3),
    (gen_random_uuid(), q_id, '나라', FALSE, 4);
END $$;

-- N4 Q14: 내용이해 (引っ越し)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：来月引っ越すんだ。\nB：どこに引っ越すの？\nA：会社の近くのマンション。駅から歩いて3分だよ。\nB：いいね。家賃は高い？\nA：今のアパートより少し高いけど、通勤が楽になるから。\n\n質問：Aさんが引っ越す理由は何ですか？', E'「通勤が楽になるから」と言っています。통근이 편해지기 때문입니다。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '집세가 싸지니까', FALSE, 1),
    (gen_random_uuid(), q_id, '통근이 편해지니까', TRUE, 2),
    (gen_random_uuid(), q_id, '방이 넓으니까', FALSE, 3),
    (gen_random_uuid(), q_id, '주변 환경이 좋으니까', FALSE, 4);
END $$;

-- N4 Q15: 세부정보 (スケジュール)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先生：来週の授業スケジュールをお知らせします。月曜日は文法、火曜日は読解、水曜日は会話、木曜日はテスト、金曜日は復習です。\n学生：先生、テストの範囲はどこですか。\n先生：教科書の第5課から第8課までです。\n\n質問：テストは何曜日ですか？', E'「木曜日はテスト」と言っています。목요일입니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수요일', FALSE, 1),
    (gen_random_uuid(), q_id, '목요일', TRUE, 2),
    (gen_random_uuid(), q_id, '금요일', FALSE, 3),
    (gen_random_uuid(), q_id, '화요일', FALSE, 4);
END $$;

-- N4 Q16-Q20
-- N4 Q16: 화자의도 (プレゼント)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：田中さんの誕生日プレゼント、何がいいかな。\nB：田中さん、コーヒーが好きだから、マグカップはどう？\nA：マグカップは去年あげたよ。\nB：じゃ、コーヒー豆のセットは？\nA：それ、いいね！\n\n質問：二人は何をプレゼントすることにしましたか？', E'「コーヒー豆のセット」に決まりました。커피 원두 세트입니다。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '머그컵', FALSE, 1),
    (gen_random_uuid(), q_id, '커피 원두 세트', TRUE, 2),
    (gen_random_uuid(), q_id, '케이크', FALSE, 3),
    (gen_random_uuid(), q_id, '책', FALSE, 4);
END $$;

-- N4 Q17: 추론 (相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：最近、日本語の勉強が大変で…。漢字が全然覚えられないんです。\nB：毎日少しずつ書くのがいいですよ。\nA：どのくらい勉強すればいいですか。\nB：1日10個ぐらいから始めてみたら？\nA：なるほど。やってみます。\n\n質問：Bさんのアドバイスは何ですか？', E'「毎日少しずつ書く」「1日10個ぐらいから」と提案しています。매일 조금씩 쓰기, 하루 10개부터 시작하기입니다。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '한자 공부를 포기한다', FALSE, 1),
    (gen_random_uuid(), q_id, '매일 조금씩 쓰고 하루 10개부터 시작한다', TRUE, 2),
    (gen_random_uuid(), q_id, '학원에 다닌다', FALSE, 3),
    (gen_random_uuid(), q_id, '앱으로 공부한다', FALSE, 4);
END $$;

-- N4 Q18: 내용이해 (買い物)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n客：この靴、サイズはありますか。26センチがほしいんですが。\n店員：すみません、26は売り切れです。25.5か26.5ならあります。\n客：じゃ、26.5を試してみます。\n店員：はい、こちらをどうぞ。\n\n質問：お客さんは何センチの靴を試しますか？', E'「26.5を試してみます」と言っています。26.5cm를 신어봅니다。', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '25.5cm', FALSE, 1),
    (gen_random_uuid(), q_id, '26cm', FALSE, 2),
    (gen_random_uuid(), q_id, '26.5cm', TRUE, 3),
    (gen_random_uuid(), q_id, '27cm', FALSE, 4);
END $$;

-- N4 Q19: 세부정보 (道案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、市役所はどう行けばいいですか。\nB：この道をまっすぐ行って、2つ目の信号を左に曲がってください。右側に大きな建物が見えます。\nA：歩いてどのくらいかかりますか。\nB：10分ぐらいです。\n\n質問：市役所まで歩いて何分かかりますか？', E'「10分ぐらい」と言っています。약 10분입니다。', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5분', FALSE, 1),
    (gen_random_uuid(), q_id, '10분', TRUE, 2),
    (gen_random_uuid(), q_id, '15분', FALSE, 3),
    (gen_random_uuid(), q_id, '20분', FALSE, 4);
END $$;

-- N4 Q20: 추론 (約束の変更)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：もしもし、明日の約束なんだけど…。\nB：うん、2時に駅前で会うよね？\nA：ごめん、ちょっと仕事が入って。3時に変えてもいい？\nB：いいよ。場所は同じ？\nA：うん、駅前のカフェで待ってるね。\n\n質問：約束の時間はどう変わりましたか？', E'2時から3時に変更されました。2시에서 3시로 변경되었습니다。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1시에서 2시로', FALSE, 1),
    (gen_random_uuid(), q_id, '2시에서 3시로', TRUE, 2),
    (gen_random_uuid(), q_id, '3시에서 4시로', FALSE, 3),
    (gen_random_uuid(), q_id, '변경 없음', FALSE, 4);
END $$;

-- N4 Q21-Q30
-- N4 Q21: 내용이해 (週末の予定)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：週末、一緒に映画を見に行かない？\nB：土曜日は用事があるんだけど、日曜日なら空いてるよ。\nA：じゃ、日曜日の午後はどう？\nB：午前中に掃除したいから、1時以降がいいな。\nA：わかった。2時にしよう。\n\n質問：二人は何時に映画を見ますか？', E'「2時にしよう」と決まりました。2시에 영화를 봅니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오전 11시', FALSE, 1),
    (gen_random_uuid(), q_id, '오후 1시', FALSE, 2),
    (gen_random_uuid(), q_id, '오후 2시', TRUE, 3),
    (gen_random_uuid(), q_id, '오후 3시', FALSE, 4);
END $$;

-- N4 Q22: 화자의도 (お礼とお詫び)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：先週貸してもらった本、とてもおもしろかったです。ありがとうございました。\nB：よかった。気に入ってもらえてうれしいよ。\nA：でも、すみません、少し汚してしまいました。\nB：大丈夫、気にしないで。\n\n質問：Aさんが謝っている理由は何ですか？', E'「少し汚してしまいました」と言っています。책을 조금 더럽혀서 사과하고 있습니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '책을 잃어버려서', FALSE, 1),
    (gen_random_uuid(), q_id, '책을 조금 더럽혀서', TRUE, 2),
    (gen_random_uuid(), q_id, '책을 돌려주지 않아서', FALSE, 3),
    (gen_random_uuid(), q_id, '책이 재미없어서', FALSE, 4);
END $$;

-- N4 Q23: 세부정보 (レストランで)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：ご注文はお決まりですか。\n客A：私はハンバーグ定食をお願いします。\n客B：私は焼き魚定食で。飲み物はオレンジジュースをください。\n店員：ハンバーグ定食と焼き魚定食、オレンジジュースですね。お飲み物はお一つでよろしいですか。\n客A：あ、私もお茶をください。\n\n質問：飲み物は全部でいくつ注文しましたか？', E'オレンジジュースとお茶で2つです。음료는 총 2개 주문했습니다。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1개', FALSE, 1),
    (gen_random_uuid(), q_id, '2개', TRUE, 2),
    (gen_random_uuid(), q_id, '3개', FALSE, 3),
    (gen_random_uuid(), q_id, '주문하지 않음', FALSE, 4);
END $$;

-- N4 Q24: 추론 (仕事の話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：新しい仕事はどう？\nB：仕事は楽しいんだけど、毎日残業が多くて…。\nA：大変だね。何時ごろ帰るの？\nB：だいたい9時か10時。もう少し早く帰りたいな。\n\n質問：Bさんの悩みは何ですか？', E'「毎日残業が多くて」「もう少し早く帰りたい」と言っています。잔업이 많아서 일찍 퇴근하고 싶다는 것입니다。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일이 어렵다', FALSE, 1),
    (gen_random_uuid(), q_id, '잔업이 많아 일찍 퇴근하고 싶다', TRUE, 2),
    (gen_random_uuid(), q_id, '급여가 낮다', FALSE, 3),
    (gen_random_uuid(), q_id, '동료와 관계가 안 좋다', FALSE, 4);
END $$;

-- N4 Q25: 내용이해 (季節の会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：桜がきれいですね。\nB：本当ですね。今週末、花見をしませんか。\nA：いいですね。どこでしましょうか。\nB：上野公園はどうですか。有名ですよ。\nA：いいですね。お弁当を作っていきましょう。\n\n質問：二人はどこで花見をしますか？', E'「上野公園」で花見をします。우에노 공원에서 꽃구경합니다。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신주쿠 공원', FALSE, 1),
    (gen_random_uuid(), q_id, '우에노 공원', TRUE, 2),
    (gen_random_uuid(), q_id, '요요기 공원', FALSE, 3),
    (gen_random_uuid(), q_id, '히비야 공원', FALSE, 4);
END $$;

-- N4 Q26: 세부정보 (携帯電話の契約)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：月額プランは3つあります。3GBで1980円、10GBで2980円、無制限で4980円です。\n客：動画をよく見るから、10GBでは足りないかな。\n店員：それなら無制限がおすすめです。\n客：じゃ、無制限プランにします。\n\n質問：お客さんが選んだプランはいくらですか？', E'「無制限プラン」を選び、それは4980円です。4980엔입니다。', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1980엔', FALSE, 1),
    (gen_random_uuid(), q_id, '2980엔', FALSE, 2),
    (gen_random_uuid(), q_id, '4980엔', TRUE, 3),
    (gen_random_uuid(), q_id, '5980엔', FALSE, 4);
END $$;

-- N4 Q27: 화자의도 (お見舞い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：山田さん、入院したらしいよ。\nB：えっ、大丈夫かな。お見舞いに行こうよ。\nA：うん。果物でも持っていこうか。\nB：いいね。メロンとかどう？\nA：メロンは高いから、りんごにしよう。\n\n質問：二人は何を持っていくことにしましたか？', E'「りんごにしよう」と決まりました。사과를 가져가기로 했습니다。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '메론', FALSE, 1),
    (gen_random_uuid(), q_id, '사과', TRUE, 2),
    (gen_random_uuid(), q_id, '꽃', FALSE, 3),
    (gen_random_uuid(), q_id, '케이크', FALSE, 4);
END $$;

-- N4 Q28: 내용이해 (アナウンス)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nお客様にお知らせいたします。本日は悪天候のため、3番線の電車が15分ほど遅れて運行しております。ご迷惑をおかけして申し訳ございません。なお、1番線と2番線は通常通り運行しております。\n\n質問：遅れているのは何番線ですか？', E'「3番線の電車が15分ほど遅れて」と言っています。3번 선이 지연되고 있습니다。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1번 선', FALSE, 1),
    (gen_random_uuid(), q_id, '2번 선', FALSE, 2),
    (gen_random_uuid(), q_id, '3번 선', TRUE, 3),
    (gen_random_uuid(), q_id, '모든 노선', FALSE, 4);
END $$;

-- N4 Q29: 추론 (留学の感想)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：日本に来て半年たったね。どう？\nB：最初は大変だったけど、今は慣れたよ。\nA：日本語も上手になったね。\nB：ありがとう。でも敬語がまだ難しい。会社で使うとき、いつも緊張するんだ。\n\n質問：Bさんが今も難しいと感じていることは何ですか？', E'「敬語がまだ難しい」と言っています。존경어가 아직 어렵다고 합니다。', 1, 29, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일상회화', FALSE, 1),
    (gen_random_uuid(), q_id, '경어(존경어)', TRUE, 2),
    (gen_random_uuid(), q_id, '한자 읽기', FALSE, 3),
    (gen_random_uuid(), q_id, '발음', FALSE, 4);
END $$;

-- N4 Q30: 세부정보 (講義の案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n特別講演のお知らせ\n題目：「IT業界で活躍するために」\n講師：佐藤太郎氏（元Google日本法人）\n日時：5月20日（土）14:00〜16:00\n場所：5階 大会議室\n参加費：無料（要事前登録）\n\n質問：この講演に参加するために必要なことは何ですか？', E'「要事前登録」と書いてあります。사전 등록이 필요합니다。', 1, 30, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '참가비를 낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '사전 등록을 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '학생증을 보여준다', FALSE, 3),
    (gen_random_uuid(), q_id, '추천서를 받는다', FALSE, 4);
END $$;

-- ============================================
-- N3 聴解 追加問題 (Q11-Q30)
-- ============================================

-- N3 Q11: 내용이해 (職場での依頼)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：田中さん、来週の会議の資料、できてる？\n田中：はい、8割ぐらいできています。金曜日までに完成させます。\n課長：ちょっと急いでほしいんだけど、水曜日までにもらえないかな。\n田中：わかりました。水曜日の午前中に提出します。\n\n質問：田中さんはいつまでに資料を出しますか？', E'「水曜日の午前中に提出します」と答えています。수요일 오전까지 제출합니다。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '월요일', FALSE, 1),
    (gen_random_uuid(), q_id, '수요일 오전', TRUE, 2),
    (gen_random_uuid(), q_id, '금요일', FALSE, 3),
    (gen_random_uuid(), q_id, '목요일', FALSE, 4);
END $$;

-- N3 Q12: 세부정보 (マンション説明会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n担当者：このマンションは駅から徒歩5分で、築3年の物件です。\n客：家賃はいくらですか。\n担当者：月8万5千円です。管理費が5千円かかります。\n客：合計で月9万円ということですね。\n担当者：はい、そうです。\n\n質問：月々の支払い合計はいくらですか？', E'家賃8万5千円＋管理費5千円＝9万円です。월 합계 9만엔입니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8만 5천엔', FALSE, 1),
    (gen_random_uuid(), q_id, '9만엔', TRUE, 2),
    (gen_random_uuid(), q_id, '9만 5천엔', FALSE, 3),
    (gen_random_uuid(), q_id, '10만엔', FALSE, 4);
END $$;

-- N3 Q13: 화자의도 (上司との会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：このプレゼン資料、よくできてるけど、グラフがちょっと見にくいかな。\n社員：そうですか。色を変えたほうがいいですか。\n部長：うん、もう少しコントラストをつけてくれると助かる。あと、フォントも大きくしたほうがいいかもしれないね。\n\n質問：部長が直してほしいことは何ですか？', E'グラフの色のコントラストとフォントのサイズです。그래프 색상 대비와 글꼴 크기입니다。', 1, 13, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프레젠테이션 내용', FALSE, 1),
    (gen_random_uuid(), q_id, '그래프 색상 대비와 글꼴 크기', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터의 정확성', FALSE, 3),
    (gen_random_uuid(), q_id, '페이지 수', FALSE, 4);
END $$;

-- N3 Q14: 추론 (IT企業の面接)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n面接官：弊社を志望した理由を教えてください。\n応募者：御社のグローバルな開発環境に魅力を感じました。多国籍のチームで開発することで、技術力だけでなく、異文化コミュニケーション能力も高められると考えています。\n面接官：当社ではどのようなキャリアを目指したいですか。\n応募者：将来的にはプロジェクトマネージャーとして、国際プロジェクトをリードしたいと考えています。\n\n質問：応募者の将来の目標は何ですか？', E'「プロジェクトマネージャーとして国際プロジェクトをリード」と言っています。PM으로서 국제 프로젝트를 이끄는 것입니다。', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프리랜서 개발자가 되는 것', FALSE, 1),
    (gen_random_uuid(), q_id, 'PM으로서 국제 프로젝트를 이끄는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '자기 회사를 창업하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '해외 지사에 전근하는 것', FALSE, 4);
END $$;

-- N3 Q15: 내용이해 (研修案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n新入社員研修のお知らせです。研修は4月1日から5日までの5日間で行われます。初日はオリエンテーション、2日目から4日目までは部署別研修、最終日は全体振り返りとなっています。持ち物はノートPCと筆記用具です。\n\n質問：部署別研修は何日間ありますか？', E'2日目から4日目までなので3日間です。3일간입니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2일', FALSE, 1),
    (gen_random_uuid(), q_id, '3일', TRUE, 2),
    (gen_random_uuid(), q_id, '4일', FALSE, 3),
    (gen_random_uuid(), q_id, '5일', FALSE, 4);
END $$;

-- N3 Q16: 세부정보 (プロジェクト進捗)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nPM：プロジェクトの進捗を報告してください。\n開発者：設計は100%完了しています。コーディングは70%ぐらいです。テストはまだ始めていません。\nPM：テストはいつから始められますか。\n開発者：来週の火曜日からは可能です。\n\n質問：コーディングの進捗は何パーセントですか？', E'「コーディングは70%ぐらい」と報告しています。약 70%입니다。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '50%', FALSE, 1),
    (gen_random_uuid(), q_id, '70%', TRUE, 2),
    (gen_random_uuid(), q_id, '90%', FALSE, 3),
    (gen_random_uuid(), q_id, '100%', FALSE, 4);
END $$;

-- N3 Q17: 화자의도 (クレーム対応)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n客：すみません、先週注文した商品がまだ届かないんですが。\n店員：大変申し訳ございません。確認いたしますので、注文番号を教えていただけますか。\n客：12345です。\n店員：確認しました。配送に遅れが出ておりまして、明日中にはお届けできる見込みです。\n\n質問：商品はいつ届きますか？', E'「明日中にはお届けできる」と言っています。내일 중으로 배달될 예정입니다。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오늘 중', FALSE, 1),
    (gen_random_uuid(), q_id, '내일 중', TRUE, 2),
    (gen_random_uuid(), q_id, '이번 주말', FALSE, 3),
    (gen_random_uuid(), q_id, '다음 주', FALSE, 4);
END $$;

-- N3 Q18: 추론 (チームミーティング)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリーダー：来月のリリースに向けて、タスクの優先順位を決めましょう。バグ修正、新機能の開発、パフォーマンス改善、ドキュメント作成があります。\nメンバーA：バグ修正が一番大事じゃないですか。ユーザーからのクレームが来てますし。\nリーダー：その通りだね。バグ修正を最優先にして、次に新機能にしよう。\n\n質問：最優先のタスクは何ですか？', E'「バグ修正を最優先」と決まりました。버그 수정이 최우선입니다。', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새 기능 개발', FALSE, 1),
    (gen_random_uuid(), q_id, '버그 수정', TRUE, 2),
    (gen_random_uuid(), q_id, '성능 개선', FALSE, 3),
    (gen_random_uuid(), q_id, '문서 작성', FALSE, 4);
END $$;

-- N3 Q19-Q24: 6 more questions
-- N3 Q19: 내용이해 (会社説明)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社長：うちの会社は社員の成長を大切にしています。年に2回、スキルアップのための研修費を会社が負担します。上限は1回5万円です。\n社員：オンライン講座も対象ですか。\n社長：はい、書籍購入やセミナー参加も含めて、全て対象です。\n\n質問：研修費の上限は1回いくらですか？', E'「上限は1回5万円」と言っています。1회 5만엔이 상한입니다。', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3만엔', FALSE, 1),
    (gen_random_uuid(), q_id, '5만엔', TRUE, 2),
    (gen_random_uuid(), q_id, '10만엔', FALSE, 3),
    (gen_random_uuid(), q_id, '상한 없음', FALSE, 4);
END $$;

-- N3 Q20: 세부정보 (システム障害)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、社内システムにログインできないんですが。\nB：今、サーバーの障害が発生していまして、復旧作業中です。\nA：いつ頃直りますか。\nB：あと1時間ぐらいで復旧する予定です。復旧したらメールでお知らせします。\n\n質問：システムはどのくらいで復旧しますか？', E'「あと1時間ぐらいで復旧する予定」と言っています。약 1시간 후 복구 예정입니다。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30분', FALSE, 1),
    (gen_random_uuid(), q_id, '1시간', TRUE, 2),
    (gen_random_uuid(), q_id, '3시간', FALSE, 3),
    (gen_random_uuid(), q_id, '알 수 없음', FALSE, 4);
END $$;

-- N3 Q21: 화자의도 (相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n後輩：先輩、プログラミングを独学で勉強しているんですが、なかなか上達しなくて。\n先輩：教科書だけじゃなくて、実際にプロジェクトを作ってみるといいよ。自分でアプリを一つ作ると、理解が深まるから。\n後輩：どんなアプリがいいですか。\n先輩：まずはToDoアプリみたいな簡単なものから始めたらいいと思う。\n\n質問：先輩のアドバイスは何ですか？', E'実際にプロジェクトを作ることを勧めています。실제로 프로젝트를 만들어보라고 조언합니다。', 1, 21, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교과서를 더 읽는다', FALSE, 1),
    (gen_random_uuid(), q_id, '실제로 앱을 만들어본다', TRUE, 2),
    (gen_random_uuid(), q_id, '프로그래밍 학원에 다닌다', FALSE, 3),
    (gen_random_uuid(), q_id, '자격증 시험을 본다', FALSE, 4);
END $$;

-- N3 Q22: 추론 (転職の悩み)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：実は転職を考えていて。今の会社は安定しているけど、新しいことに挑戦したいんだ。\nB：気持ちはわかるけど、今のスキルをもう少し磨いてからのほうがいいんじゃない？\nA：そうかな。確かに、まだ2年目だし。\nB：3年ぐらい経験を積んでから転職したほうが、条件もよくなると思うよ。\n\n質問：Bさんが勧めていることは何ですか？', E'もう少し経験を積んでから転職することを勧めています。좀 더 경험을 쌓고 나서 이직하라고 조언합니다。', 1, 22, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지금 바로 이직한다', FALSE, 1),
    (gen_random_uuid(), q_id, '좀 더 경험을 쌓고 나서 이직한다', TRUE, 2),
    (gen_random_uuid(), q_id, '이직을 포기한다', FALSE, 3),
    (gen_random_uuid(), q_id, '부업을 시작한다', FALSE, 4);
END $$;

-- N3 Q23-Q30: remaining 8 questions compressed
-- N3 Q23: 내용이해 (飲み会の幹事)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：歓迎会の幹事を頼まれたんだけど、いい店知らない？\nB：駅前のイタリアンはどう？飲み放題つきで一人4000円だよ。\nA：人数は15人ぐらいなんだけど、入れるかな。\nB：個室があるから大丈夫だと思う。予約しておこうか？\nA：お願い。金曜日の19時で。\n\n質問：一人あたりの金額はいくらですか？', E'「一人4000円」と言っています。1인당 4000엔입니다。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3000엔', FALSE, 1),
    (gen_random_uuid(), q_id, '4000엔', TRUE, 2),
    (gen_random_uuid(), q_id, '5000엔', FALSE, 3),
    (gen_random_uuid(), q_id, '6000엔', FALSE, 4);
END $$;

-- N3 Q24: 세부정보 (健康診断)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n社員の皆様へ。来月の健康診断についてお知らせします。日程は6月10日から14日の間で、各自都合のいい日を選んでください。前日の夜9時以降は食事を取らないでください。当日は受付で保険証を提示してください。\n\n質問：健康診断の前日に注意すべきことは何ですか？', E'「前日の夜9時以降は食事を取らない」ことです。전날 밤 9시 이후 식사를 하지 않아야 합니다。', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '운동을 하지 않는다', FALSE, 1),
    (gen_random_uuid(), q_id, '밤 9시 이후 식사를 하지 않는다', TRUE, 2),
    (gen_random_uuid(), q_id, '일찍 잔다', FALSE, 3),
    (gen_random_uuid(), q_id, '물을 많이 마신다', FALSE, 4);
END $$;

-- N3 Q25: 화자의도 (退社の挨拶)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：お先に失礼します。\nB：お疲れ様でした。あ、田中さん、明日の朝一で打ち合わせがあるの、忘れないでね。\nA：はい、9時からですよね。資料は準備してあります。\nB：さすがだね。じゃ、お疲れ様。\n\n質問：明日の打ち合わせは何時からですか？', E'「9時から」と確認しています。9시부터입니다。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8시', FALSE, 1),
    (gen_random_uuid(), q_id, '9시', TRUE, 2),
    (gen_random_uuid(), q_id, '10시', FALSE, 3),
    (gen_random_uuid(), q_id, '11시', FALSE, 4);
END $$;

-- N3 Q26: 추론 (文化の違い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：日本の会議って、発言する人が少ないよね。\nB：確かに。韓国だとみんな積極的に意見を言うけど。\nA：日本では会議の前に根回しして、会議では確認するだけという文化があるみたいだよ。\nB：なるほど。だから会議自体はスムーズなんだね。\n\n質問：日本の会議の特徴は何ですか？', E'会議前に根回しして会議では確認するだけという文化です。회의 전에 사전 조율을 하고 회의에서는 확인만 합니다。', 1, 26, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모두가 적극적으로 발언한다', FALSE, 1),
    (gen_random_uuid(), q_id, '사전 조율 후 회의에서는 확인만 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '회의가 매우 길다', FALSE, 3),
    (gen_random_uuid(), q_id, '상사만 발언한다', FALSE, 4);
END $$;

-- N3 Q27: 내용이해 (環境問題)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：エネルギー問題について話します。日本のエネルギー自給率は約10%で、90%を海外からの輸入に頼っています。再生可能エネルギーの割合を増やすことが重要です。特に太陽光と風力の活用が期待されています。\n\n質問：日本のエネルギー自給率は約何パーセントですか？', E'「約10%」と言っています。약 10%입니다。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약 5%', FALSE, 1),
    (gen_random_uuid(), q_id, '약 10%', TRUE, 2),
    (gen_random_uuid(), q_id, '약 30%', FALSE, 3),
    (gen_random_uuid(), q_id, '약 50%', FALSE, 4);
END $$;

-- N3 Q28: 세부정보 (旅行計画)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：社員旅行の行き先、アンケートの結果が出ました。\nB：どこが一番人気でしたか。\nA：1位が北海道で35票、2位が沖縄で28票、3位が京都で17票でした。\nB：じゃ、北海道に決まりですね。\n\n質問：社員旅行の行き先はどこに決まりましたか？', E'1位の北海道に決まりました。홋카이도로 결정되었습니다。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오키나와', FALSE, 1),
    (gen_random_uuid(), q_id, '홋카이도', TRUE, 2),
    (gen_random_uuid(), q_id, '교토', FALSE, 3),
    (gen_random_uuid(), q_id, '아직 미정', FALSE, 4);
END $$;

-- N3 Q29: 화자의도 (フィードバック)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先輩：コードレビューしたけど、全体的によく書けてるよ。一つだけ気になったのは、変数名がちょっとわかりにくいところがあるかな。\n後輩：どの部分ですか。\n先輩：「tmp」とか「data」みたいな名前じゃなくて、具体的な名前にしたほうが読みやすいよ。\n後輩：なるほど、気をつけます。\n\n質問：先輩が指摘したことは何ですか？', E'変数名をもっと具体的にすべきと指摘しています。변수명을 더 구체적으로 해야 한다고 지적합니다。', 1, 29, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드에 버그가 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '변수명이 알기 어려워 구체적으로 해야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '코멘트가 부족하다', FALSE, 3),
    (gen_random_uuid(), q_id, '들여쓰기가 잘못되었다', FALSE, 4);
END $$;

-- N3 Q30: 추론 (仕事の将来)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：最近AIの発展がすごいよね。プログラマーの仕事もなくなるって言う人がいるけど。\nB：全部なくなることはないと思うよ。AIを使いこなせるエンジニアは、逆に需要が増えるんじゃないかな。\nA：確かに。AIと協力して開発する能力が大事になりそうだね。\n\n質問：Bさんが考える将来有望なスキルは何ですか？', E'AIを使いこなす能力が需要が増えると考えています。AI를 다룰 수 있는 능력이 중요해진다고 생각합니다。', 1, 30, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수작업 코딩 능력', FALSE, 1),
    (gen_random_uuid(), q_id, 'AI를 다루고 활용하는 능력', TRUE, 2),
    (gen_random_uuid(), q_id, 'AI를 피하는 능력', FALSE, 3),
    (gen_random_uuid(), q_id, '관리직 능력', FALSE, 4);
END $$;

-- ============================================
-- N2 聴解 追加問題 (Q11-Q30)
-- ============================================

-- N2 Q11: 내용이해 (プロジェクト方針会議)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nPM：今回のプロジェクトでは、マイクロサービスアーキテクチャを採用したいと考えています。\n開発者：モノリシックと比べて、デプロイが独立してできるのは魅力ですね。ただ、サービス間通信の複雑さが懸念です。\nPM：その点はAPIゲートウェイで管理する予定です。\n\n質問：マイクロサービスの懸念点として挙げられたのは何ですか？', E'「サービス間通信の複雑さ」が懸念点です。서비스 간 통신의 복잡성이 우려됩니다。', 1, 11, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비용이 높다', FALSE, 1),
    (gen_random_uuid(), q_id, '서비스 간 통신의 복잡성', TRUE, 2),
    (gen_random_uuid(), q_id, '개발 속도가 느리다', FALSE, 3),
    (gen_random_uuid(), q_id, '인원이 부족하다', FALSE, 4);
END $$;

-- N2 Q12: 세부정보 (人事制度説明)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n人事：当社の評価制度についてご説明します。評価は半期ごとに行われ、上司評価、同僚評価、自己評価の三つの視点から総合的に判断されます。\n社員：360度評価ということですね。\n人事：はい。結果はフィードバック面談で本人にお伝えします。\n\n質問：評価はどのくらいの頻度で行われますか？', E'「半期ごと」と言っています。반기마다(연 2회) 실시됩니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매월', FALSE, 1),
    (gen_random_uuid(), q_id, '반기마다', TRUE, 2),
    (gen_random_uuid(), q_id, '연 1회', FALSE, 3),
    (gen_random_uuid(), q_id, '분기마다', FALSE, 4);
END $$;

-- N2 Q13: 화자의도 (技術選定の議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：フロントエンドのフレームワーク、ReactとVue.jsのどちらにしましょうか。\nB：チームの経験を考えると、Reactのほうが慣れている人が多いですね。\nA：ただ、今回は比較的小規模なプロジェクトなので、Vue.jsのほうがシンプルに作れるかもしれません。\nB：確かに。学習コストも低いですし、Vue.jsでいきましょうか。\n\n質問：最終的にどのフレームワークに決まりましたか？', E'「Vue.jsでいきましょうか」と合意しています。Vue.js로 결정했습니다。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'React', FALSE, 1),
    (gen_random_uuid(), q_id, 'Vue.js', TRUE, 2),
    (gen_random_uuid(), q_id, 'Angular', FALSE, 3),
    (gen_random_uuid(), q_id, '미정', FALSE, 4);
END $$;

-- N2 Q14: 추론 (ワークライフバランス)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：うちの部署、残業が多すぎるという声がある。何か対策を考えてほしい。\n課長：まず、毎週水曜日をノー残業デーにするのはどうでしょうか。\n部長：いいね。ただ、それだけだと他の日に残業が集中する可能性がある。\n課長：では、業務の棚卸しをして、不要な会議を減らすことも並行して進めましょう。\n\n質問：課長が提案した対策は何ですか？', E'ノー残業デーと不要な会議の削減の二つです。노 잔업 데이와 불필요한 회의 삭감입니다。', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인원을 늘린다', FALSE, 1),
    (gen_random_uuid(), q_id, '노 잔업 데이 도입과 불필요한 회의 삭감', TRUE, 2),
    (gen_random_uuid(), q_id, '급여를 올린다', FALSE, 3),
    (gen_random_uuid(), q_id, '재택근무를 시작한다', FALSE, 4);
END $$;

-- N2 Q15: 내용이해 (セキュリティ研修)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：フィッシング詐欺の被害が増加しています。不審なメールのリンクは絶対にクリックしないでください。送信元のアドレスをよく確認し、少しでも怪しいと感じたら、情報セキュリティ部門に報告してください。パスワードは定期的に変更し、二要素認証を有効にすることも重要です。\n\n質問：不審なメールを受け取ったらどうすべきですか？', E'情報セキュリティ部門に報告すべきと言っています。정보 보안 부서에 보고해야 합니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '링크를 클릭하여 확인한다', FALSE, 1),
    (gen_random_uuid(), q_id, '정보 보안 부서에 보고한다', TRUE, 2),
    (gen_random_uuid(), q_id, '삭제하고 잊는다', FALSE, 3),
    (gen_random_uuid(), q_id, '동료에게 전달한다', FALSE, 4);
END $$;

-- N2 Q16: 세부정보 (開発手法)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nスクラムマスター：今週のスプリントの振り返りをしましょう。計画した8つのストーリーのうち、完了したのは6つです。\n開発者A：残り2つはバグが見つかって、修正に時間がかかりました。\nスクラムマスター：次のスプリントでは見積もりをもう少し余裕を持たせましょう。\n\n質問：今週完了したストーリーの数は？', E'「完了したのは6つ」と報告しています。6개 완료했습니다。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4개', FALSE, 1),
    (gen_random_uuid(), q_id, '6개', TRUE, 2),
    (gen_random_uuid(), q_id, '8개', FALSE, 3),
    (gen_random_uuid(), q_id, '10개', FALSE, 4);
END $$;

-- N2 Q17: 화자의도 (キャリア面談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：今後のキャリアプランについて聞かせてください。\n部下：技術を深めたい気持ちもありますが、チームをまとめる役割にも興味があります。\n上司：両方のスキルを持つテックリードという選択肢もあるよ。技術力を維持しながらチームを率いるポジションだ。\n部下：それは理想的ですね。ぜひ目指したいです。\n\n質問：部下が目指すことにしたポジションは何ですか？', E'「テックリード」を目指すと言っています。테크 리드를 목표로 합니다。', 1, 17, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트 매니저', FALSE, 1),
    (gen_random_uuid(), q_id, '테크 리드', TRUE, 2),
    (gen_random_uuid(), q_id, '시니어 개발자', FALSE, 3),
    (gen_random_uuid(), q_id, 'CTO', FALSE, 4);
END $$;

-- N2 Q18: 추론 (品質管理)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nQA：今回のリリースで重大なバグが3件見つかりました。テストカバレッジが不十分だったのが原因です。\nPM：テスト工程にもっと時間を確保すべきだったね。\nQA：今後はCI/CDパイプラインに自動テストを組み込んで、品質を担保したいと思います。\nPM：ぜひ進めてください。\n\n質問：QAが提案した改善策は何ですか？', E'CI/CDパイプラインに自動テストを組み込むことです。CI/CD 파이프라인에 자동 테스트를 포함시키는 것입니다。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'QA 인원을 늘린다', FALSE, 1),
    (gen_random_uuid(), q_id, 'CI/CD에 자동 테스트를 포함시킨다', TRUE, 2),
    (gen_random_uuid(), q_id, '수동 테스트를 강화한다', FALSE, 3),
    (gen_random_uuid(), q_id, '릴리스 주기를 늦춘다', FALSE, 4);
END $$;

-- N2 Q19: 내용이해 (採用面接)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n面接官：前職ではどのような業務を担当されていましたか。\n応募者：バックエンドの開発を中心に、データベース設計やAPIの実装を行っていました。チームは5人で、私がサブリーダーを務めていました。\n面接官：使用していた技術スタックを教えてください。\n応募者：Java、Spring Boot、PostgreSQL、Dockerです。\n\n質問：応募者の前職での役割は何でしたか？', E'「サブリーダー」を務めていたと言っています。서브 리더를 맡았습니다。', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리더', FALSE, 1),
    (gen_random_uuid(), q_id, '서브 리더', TRUE, 2),
    (gen_random_uuid(), q_id, '일반 멤버', FALSE, 3),
    (gen_random_uuid(), q_id, 'PM', FALSE, 4);
END $$;

-- N2 Q20: 세부정보 (予算承認)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：新しい開発ツールの導入について提案書を見ました。年間ライセンス費が120万円ですか。\n課長：はい。ただ、導入することで月平均30時間の工数削減が見込めます。\n部長：費用対効果は十分ありそうだね。来期の予算に組み込もう。\n\n質問：ツール導入の年間コストはいくらですか？', E'「年間ライセンス費が120万円」と言っています。연간 120만엔입니다。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '60만엔', FALSE, 1),
    (gen_random_uuid(), q_id, '120만엔', TRUE, 2),
    (gen_random_uuid(), q_id, '240만엔', FALSE, 3),
    (gen_random_uuid(), q_id, '300만엔', FALSE, 4);
END $$;

-- N2 Q21-Q30 (remaining 10 compressed)
-- N2 Q21: 화자의도 (クライアント対応)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n営業：クライアントから追加機能の要望が来ています。\nPM：スコープ外の要件ですね。対応するとスケジュールに影響が出ます。\n営業：クライアントとしては、重要な機能らしいんですが。\nPM：では、次のフェーズで対応する形で提案しましょう。今のリリースには間に合いません。\n\n質問：PMの対応方針は何ですか？', E'次のフェーズで対応すると提案しています。다음 페이즈에서 대응하자고 제안합니다。', 1, 21, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지금 바로 추가한다', FALSE, 1),
    (gen_random_uuid(), q_id, '다음 페이즈에서 대응한다', TRUE, 2),
    (gen_random_uuid(), q_id, '거절한다', FALSE, 3),
    (gen_random_uuid(), q_id, '다른 팀에 맡긴다', FALSE, 4);
END $$;

-- N2 Q22: 추론 (組織改革)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社長：来期から組織をフラットにしたい。意思決定のスピードを上げるためだ。\n役員：階層を減らすということですか。\n社長：そうだ。部長・課長の二層制を、グループリーダー一層にする。\n役員：現場の声が経営に届きやすくなりますね。\n\n質問：組織改革の目的は何ですか？', E'「意思決定のスピードを上げるため」です。의사 결정 속도를 높이기 위해서입니다。', 1, 22, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인건비를 줄이기 위해', FALSE, 1),
    (gen_random_uuid(), q_id, '의사 결정 속도를 높이기 위해', TRUE, 2),
    (gen_random_uuid(), q_id, '직원 수를 늘리기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '관리직을 늘리기 위해', FALSE, 4);
END $$;

-- N2 Q23: 내용이해 (技術勉強会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n発表者：本日はDockerとKubernetesの基礎についてお話しします。Dockerはアプリケーションをコンテナという単位でパッケージ化する技術です。Kubernetesは、複数のコンテナを自動的に管理・スケーリングするオーケストレーションツールです。\n\n質問：Kubernetesの役割は何ですか？', E'「複数のコンテナを自動的に管理・スケーリング」することです。여러 컨테이너를 자동으로 관리하고 스케일링합니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드를 작성한다', FALSE, 1),
    (gen_random_uuid(), q_id, '여러 컨테이너를 자동으로 관리하고 스케일링한다', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터베이스를 관리한다', FALSE, 3),
    (gen_random_uuid(), q_id, '보안을 강화한다', FALSE, 4);
END $$;

-- N2 Q24: 세부정보 (障害対応)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nオペレーター：本番環境で障害が発生しました。アプリケーションサーバーのCPU使用率が95%を超えています。\nエンジニア：原因を調査します。ログを見ると、特定のAPIに大量のリクエストが集中しているようです。\nオペレーター：暫定対応として、サーバーの台数を増やしますか。\nエンジニア：はい、スケールアウトで対応しつつ、根本原因を調査しましょう。\n\n質問：暫定対応として何をしますか？', E'「サーバーの台数を増やす（スケールアウト）」で対応します。서버 대수를 늘려 대응합니다。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버를 재시작한다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버 대수를 늘린다(스케일아웃)', TRUE, 2),
    (gen_random_uuid(), q_id, 'API를 차단한다', FALSE, 3),
    (gen_random_uuid(), q_id, '사용자에게 안내한다', FALSE, 4);
END $$;

-- N2 Q25: 화자의도 (1on1ミーティング)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：最近の調子はどう？何か困っていることはない？\n部下：正直、今のタスク量が少し多いと感じています。\n上司：そうか。じゃ、一部を他のメンバーに分担してもらおう。あと、優先度の低いタスクは後回しにしていいよ。\n部下：ありがとうございます。助かります。\n\n質問：上司が提案した解決策は何ですか？', E'タスクの分担と優先度の低いタスクの後回しです。업무 분담과 우선순위 낮은 태스크 후순위화입니다。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잔업을 허용한다', FALSE, 1),
    (gen_random_uuid(), q_id, '업무 분담과 우선순위 낮은 태스크 후순위화', TRUE, 2),
    (gen_random_uuid(), q_id, '납기를 연장한다', FALSE, 3),
    (gen_random_uuid(), q_id, '프로젝트에서 빠진다', FALSE, 4);
END $$;

-- N2 Q26: 추론 (グローバル対応)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：来月からインドのチームと共同開発することになった。時差が3時間半あるから、ミーティングの時間を調整する必要がある。\n社員：日本時間の午後なら向こうの午前中になりますね。\n課長：そうだね。あと、英語でのコミュニケーションになるから、ドキュメントも英語で書いてほしい。\n\n質問：グローバル開発で必要になることは何ですか？', E'時差を考慮した会議時間の調整と英語でのドキュメント作成です。시차를 고려한 회의 시간 조정과 영어 문서 작성입니다。', 1, 26, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인도에 출장을 간다', FALSE, 1),
    (gen_random_uuid(), q_id, '시차를 고려한 회의 시간 조정과 영어 문서 작성', TRUE, 2),
    (gen_random_uuid(), q_id, '통역을 고용한다', FALSE, 3),
    (gen_random_uuid(), q_id, '힌디어를 배운다', FALSE, 4);
END $$;

-- N2 Q27-Q30: 4 more
-- N2 Q27: 내용이해 (DX推進)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nCTO：DX推進にあたり、三つの柱を立てます。第一に、レガシーシステムのモダナイゼーション。第二に、データ活用基盤の構築。第三に、デジタル人材の育成です。まずは現状のシステムを棚卸しするところから始めましょう。\n\n質問：DX推進の第一歩は何ですか？', E'「現状のシステムを棚卸しする」ことから始めます。현재 시스템을 점검하는 것부터 시작합니다。', 1, 27, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새 시스템을 구축한다', FALSE, 1),
    (gen_random_uuid(), q_id, '현재 시스템을 점검한다', TRUE, 2),
    (gen_random_uuid(), q_id, '인재를 채용한다', FALSE, 3),
    (gen_random_uuid(), q_id, '외주에 맡긴다', FALSE, 4);
END $$;

-- N2 Q28: 세부정보 (契約交渉)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n営業：SLA（サービスレベルアグリーメント）についてご説明します。可用性99.9%を保証し、月間ダウンタイムは最大43分以内とします。\nクライアント：障害発生時の対応時間はどのくらいですか。\n営業：重大障害の場合、30分以内に初動対応を開始します。\n\n質問：保証される可用性は何パーセントですか？', E'「可用性99.9%を保証」と言っています。99.9%입니다。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '99%', FALSE, 1),
    (gen_random_uuid(), q_id, '99.9%', TRUE, 2),
    (gen_random_uuid(), q_id, '99.99%', FALSE, 3),
    (gen_random_uuid(), q_id, '100%', FALSE, 4);
END $$;

-- N2 Q29: 화자의도 (退職面談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社員：お時間いただきありがとうございます。実は、来月末で退職させていただきたいと考えています。\n上司：急だね。理由を聞いてもいいかな。\n社員：以前からWeb系の開発に興味があり、そちらの分野に挑戦したいと思いまして。\n上司：引き留めはしないけど、残りの期間でしっかり引き継ぎをお願いするよ。\n\n質問：社員が退職する理由は何ですか？', E'Web系の開発に挑戦したいからです。웹 계열 개발에 도전하고 싶기 때문입니다。', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '급여가 낮아서', FALSE, 1),
    (gen_random_uuid(), q_id, '웹 계열 개발에 도전하고 싶어서', TRUE, 2),
    (gen_random_uuid(), q_id, '인간관계가 안 좋아서', FALSE, 3),
    (gen_random_uuid(), q_id, '건강상의 이유', FALSE, 4);
END $$;

-- N2 Q30: 추론 (新技術導入)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：AIコーディングアシスタントの導入を検討しているんだけど、どう思う？\nB：コードの補完やバグの検出には役立つと思う。ただ、生成されたコードをそのまま使うのはリスクがあるよ。\nA：確かに。レビューは必須だね。\nB：うん。あくまでツールとして活用して、最終的な判断は人間がすべきだと思う。\n\n質問：Bさんの意見として正しいものは？', E'ツールとして活用し最終判断は人間がすべきと言っています。도구로 활용하되 최종 판단은 사람이 해야 합니다。', 1, 30, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AI를 도입하면 안 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '도구로 활용하되 최종 판단은 사람이 해야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, 'AI에게 모든 것을 맡겨야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 리뷰가 필요 없다', FALSE, 4);
END $$;

-- ============================================
-- N1 聴解 追加問題 (Q11-Q30)
-- ============================================

-- N1 Q11: 내용이해 (経営戦略会議)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n取締役：海外展開について、東南アジア市場への参入を提案します。特にベトナムとインドネシアは、IT人材の供給が豊富で、かつ成長市場です。\n社長：リスクは何が考えられますか。\n取締役：法規制の違いや文化の相違、為替リスクが主なものです。現地パートナーとの提携が鍵になるでしょう。\n\n質問：海外展開のリスクとして挙げられていないものは？', E'人材不足はリスクとして挙げられていません。인재 부족은 언급되지 않았습니다。', 1, 11, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '법규제의 차이', FALSE, 1),
    (gen_random_uuid(), q_id, '인재 부족', TRUE, 2),
    (gen_random_uuid(), q_id, '환율 리스크', FALSE, 3),
    (gen_random_uuid(), q_id, '문화의 차이', FALSE, 4);
END $$;

-- N1 Q12: 세부정보 (技術講演)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講演者：ブロックチェーン技術の本質は、中央管理者を必要としない分散型の合意形成メカニズムにあります。暗号通貨への応用が有名ですが、サプライチェーン管理や電子投票など、信頼性の担保が求められるあらゆる領域で活用の可能性があります。\n\n質問：ブロックチェーンの本質的な特徴は何ですか？', E'「中央管理者を必要としない分散型の合意形成」が本質です。중앙 관리자가 필요 없는 분산형 합의 형성입니다。', 1, 12, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '고속 처리가 가능하다', FALSE, 1),
    (gen_random_uuid(), q_id, '중앙 관리자가 필요 없는 분산형 합의 형성', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터를 삭제할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '무료로 사용할 수 있다', FALSE, 4);
END $$;

-- N1 Q13: 화자의도 (M&A議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCFO：A社の買収について、デューデリジェンスの結果が出ました。財務状況は健全ですが、技術的負債がかなり蓄積しています。\nCEO：買収後のシステム統合にどのくらいのコストが見込まれますか。\nCFO：概算で5億円程度です。ただし、A社のAI技術は当社にない強みであり、長期的には投資回収が十分見込めます。\n\n質問：A社の課題は何ですか？', E'「技術的負債がかなり蓄積」していることが課題です。기술 부채가 상당히 축적되어 있습니다。', 1, 13, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재무 상황이 나쁘다', FALSE, 1),
    (gen_random_uuid(), q_id, '기술 부채가 많이 축적되어 있다', TRUE, 2),
    (gen_random_uuid(), q_id, 'AI 기술이 부족하다', FALSE, 3),
    (gen_random_uuid(), q_id, '인재가 유출되고 있다', FALSE, 4);
END $$;

-- N1 Q14: 추론 (倫理的AI開発)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n研究者A：AIの学習データにバイアスが含まれていると、出力結果にもバイアスが反映されてしまいます。\n研究者B：いわゆるアルゴリズミックバイアスの問題ですね。採用選考AIが特定の属性を不当に排除した事例もありました。\n研究者A：だからこそ、データの多様性を確保し、定期的な公平性監査が不可欠なのです。\n\n質問：アルゴリズミックバイアスを防ぐために必要なことは何ですか？', E'データの多様性確保と定期的な公平性監査です。데이터 다양성 확보와 정기적인 공정성 감사입니다。', 1, 14, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AI 개발을 중단한다', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터 다양성 확보와 정기적인 공정성 감사', TRUE, 2),
    (gen_random_uuid(), q_id, '학습 데이터를 줄인다', FALSE, 3),
    (gen_random_uuid(), q_id, 'AI의 판단을 공개하지 않는다', FALSE, 4);
END $$;

-- N1 Q15: 내용이해 (持続可能性報告)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n報告者：当社のCO2排出量削減の取り組みについて報告します。2025年度は前年比15%の削減を達成しました。再生可能エネルギーの利用率を60%まで引き上げ、データセンターの電力効率も改善しています。2030年までにカーボンニュートラルを目指します。\n\n質問：2025年度のCO2排出量は前年比でどのくらい削減されましたか？', E'「前年比15%の削減」と報告しています。전년 대비 15% 삭감되었습니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10%', FALSE, 1),
    (gen_random_uuid(), q_id, '15%', TRUE, 2),
    (gen_random_uuid(), q_id, '20%', FALSE, 3),
    (gen_random_uuid(), q_id, '30%', FALSE, 4);
END $$;

-- N1 Q16: 세부정보 (知的財産)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n弁護士：オープンソースライセンスについてご注意ください。GPL系のライブラリを使用した場合、ソースコードの公開義務が生じる可能性があります。\n開発者：MIT ライセンスなら問題ないですか。\n弁護士：MITは比較的制約が少ないですが、著作権表示の義務はあります。ライセンスの種類を確認してから利用することをお勧めします。\n\n質問：GPLライセンスの特徴は何ですか？', E'ソースコードの公開義務が生じる可能性があります。소스코드 공개 의무가 발생할 수 있습니다。', 1, 16, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '제약이 전혀 없다', FALSE, 1),
    (gen_random_uuid(), q_id, '소스코드 공개 의무가 발생할 수 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '상업적 이용이 불가능하다', FALSE, 3),
    (gen_random_uuid(), q_id, '무료로 사용할 수 없다', FALSE, 4);
END $$;

-- N1 Q17: 화자의도 (投資判断)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nアナリスト：生成AI市場は2030年までに年平均40%の成長が見込まれています。ただし、規制環境の不確実性がリスク要因です。\n投資家：個別銘柄への投資とETFのどちらが良いでしょうか。\nアナリスト：市場全体の成長に賭けるならETFが無難です。特定の技術に確信があれば個別銘柄も検討に値します。\n\n質問：アナリストが無難だと言っているのはどちらですか？', E'「ETFが無難」と言っています。ETF가 무난하다고 합니다。', 1, 17, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개별 종목', FALSE, 1),
    (gen_random_uuid(), q_id, 'ETF', TRUE, 2),
    (gen_random_uuid(), q_id, '채권', FALSE, 3),
    (gen_random_uuid(), q_id, '부동산', FALSE, 4);
END $$;

-- N1 Q18: 추론 (教育改革)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n教授：従来の講義型教育から、プロジェクトベースの学習への転換が求められています。\n学生：具体的にはどのような違いがありますか。\n教授：知識の暗記ではなく、実際の課題を解決するプロセスを通じて学ぶことです。失敗も重要な学習機会として捉えます。チームでの協働能力も自然と身につきます。\n\n質問：プロジェクトベース学習で重視されていることは何ですか？', E'実際の課題解決プロセスを通じた学びです。실제 과제 해결 프로세스를 통한 학습입니다。', 1, 18, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지식의 암기', FALSE, 1),
    (gen_random_uuid(), q_id, '실제 과제 해결 프로세스를 통한 학습', TRUE, 2),
    (gen_random_uuid(), q_id, '시험 점수 향상', FALSE, 3),
    (gen_random_uuid(), q_id, '교수의 강의 듣기', FALSE, 4);
END $$;

-- N1 Q19-Q24
-- N1 Q19: 내용이해 (量子暗号)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：量子コンピュータの発展により、現在の暗号技術が将来破られる可能性があります。これに対応するため、耐量子暗号（ポスト量子暗号）の研究が急速に進んでいます。NISTは2024年に新しい暗号標準を策定しました。企業は今から移行計画を立てるべきです。\n\n質問：耐量子暗号が必要な理由は何ですか？', E'量子コンピュータにより現在の暗号が破られる可能性があるからです。양자 컴퓨터에 의해 현재 암호가 깨질 가능성이 있기 때문입니다。', 1, 19, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '현재 암호가 복잡하니까', FALSE, 1),
    (gen_random_uuid(), q_id, '양자 컴퓨터에 의해 현재 암호가 깨질 수 있으니까', TRUE, 2),
    (gen_random_uuid(), q_id, '비용을 줄이기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '속도를 높이기 위해', FALSE, 4);
END $$;

-- N1 Q20: 세부정보 (ガバナンス)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n監査役：内部統制の観点から、開発環境と本番環境へのアクセス権限は厳密に分離すべきです。\nCTO：現在は開発者が本番環境に直接アクセスできる状態です。\n監査役：それは重大なリスクです。最低限、本番デプロイは承認フローを経るようにしてください。職務分掌の原則に基づいた権限管理を徹底すべきです。\n\n質問：監査役が指摘した問題は何ですか？', E'開発者が本番環境に直接アクセスできることが問題です。개발자가 본번 환경에 직접 접근할 수 있는 것이 문제입니다。', 1, 20, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개발 환경이 느리다', FALSE, 1),
    (gen_random_uuid(), q_id, '개발자가 본번 환경에 직접 접근 가능하다', TRUE, 2),
    (gen_random_uuid(), q_id, '백업이 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '감사 로그가 없다', FALSE, 4);
END $$;

-- N1 Q21: 화자의도 (異文化マネジメント)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nマネージャー：多国籍チームのマネジメントで一番大切なのは、暗黙の前提を言語化することです。日本では「空気を読む」文化がありますが、異文化間ではそれが通用しません。\n社員：具体的にはどうすればいいですか。\nマネージャー：決定事項は必ず文書化し、期待値を明確に伝えること。そして、質問しやすい雰囲気を作ることです。\n\n質問：異文化マネジメントで最も重要なことは何ですか？', E'暗黙の前提を言語化することです。암묵적 전제를 언어화하는 것입니다。', 1, 21, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '분위기를 읽는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '암묵적 전제를 언어화하는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '엄격한 규칙을 만드는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '모든 것을 상사가 결정하는 것', FALSE, 4);
END $$;

-- N1 Q22: 추론 (哲学的討論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：技術の進歩は必ずしも人間の幸福につながるとは限らないのではないか。\nB：技術自体は中立で、それをどう使うかが問題だと思います。\nA：しかし、一度開発された技術は止められないという「技術的慣性」の問題がある。\nB：だからこそ、開発段階から倫理的な議論を組み込む「バリュー・センシティブ・デザイン」が重要なんですね。\n\n質問：Bさんが重要だと考える概念は何ですか？', E'「バリュー・センシティブ・デザイン」が重要だと言っています。밸류 센시티브 디자인입니다。', 1, 22, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기술적 관성', FALSE, 1),
    (gen_random_uuid(), q_id, '밸류 센시티브 디자인', TRUE, 2),
    (gen_random_uuid(), q_id, '기술 중립성', FALSE, 3),
    (gen_random_uuid(), q_id, '기술 결정론', FALSE, 4);
END $$;

-- N1 Q23-Q30: remaining 8
-- N1 Q23: 내용이해 (人口動態)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n研究者：日本の生産年齢人口は2050年までに現在の約3割減少すると予測されています。労働力不足への対策として、AI・ロボットの活用、女性・高齢者の労働参加率向上、外国人材の受け入れ拡大が検討されています。しかし、いずれも単独では解決策にはなり得ず、複合的なアプローチが必要です。\n\n質問：生産年齢人口は2050年までにどのくらい減少しますか？', E'「約3割減少」と予測されています。약 30% 감소할 것으로 예측됩니다。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약 10%', FALSE, 1),
    (gen_random_uuid(), q_id, '약 30%', TRUE, 2),
    (gen_random_uuid(), q_id, '약 50%', FALSE, 3),
    (gen_random_uuid(), q_id, '약 70%', FALSE, 4);
END $$;

-- N1 Q24: 세부정보 (規制と革新)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n政策立案者：レギュラトリーサンドボックス制度を導入し、新技術の実証実験を規制の例外として認めることを検討しています。\n企業代表：規制の枠外で実験できるのは大きなメリットです。ただし、消費者保護の観点も忘れてはなりません。\n政策立案者：もちろんです。実験の範囲と期間を限定し、影響を監視しながら進めます。\n\n質問：レギュラトリーサンドボックスの目的は何ですか？', E'新技術の実証実験を規制の例外として認めることです。신기술 실증 실험을 규제 예외로 인정하는 것입니다。', 1, 24, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 규제를 폐지한다', FALSE, 1),
    (gen_random_uuid(), q_id, '신기술 실증 실험을 규제 예외로 인정한다', TRUE, 2),
    (gen_random_uuid(), q_id, '기업에 보조금을 지급한다', FALSE, 3),
    (gen_random_uuid(), q_id, '소비자를 보호하지 않는다', FALSE, 4);
END $$;

-- N1 Q25: 화자의도 (知識共有)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCTO：組織のナレッジマネジメントを強化したい。ベテラン社員の暗黙知を形式知化する仕組みが必要だ。\nマネージャー：社内Wikiの活用やペアプログラミングの推進はどうでしょうか。\nCTO：いいね。加えて、月に一度テックトークを開催して、各チームの知見を共有する場を作ろう。\n\n質問：CTOが新たに提案したことは何ですか？', E'月に一度のテックトークの開催です。월 1회 테크 토크 개최입니다。', 1, 25, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사내 위키 활용', FALSE, 1),
    (gen_random_uuid(), q_id, '월 1회 테크 토크 개최', TRUE, 2),
    (gen_random_uuid(), q_id, '페어 프로그래밍', FALSE, 3),
    (gen_random_uuid(), q_id, '외부 연수', FALSE, 4);
END $$;

-- N1 Q26: 추론 (デジタル民主主義)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n学者A：デジタル技術は民主主義を強化する可能性がある一方で、監視社会を助長するリスクもあります。\n学者B：台湾のvTaiwanのように、市民参加型のデジタルプラットフォームは良い事例ですね。\n学者A：しかし、デジタルリテラシーの格差が新たな民主主義の不平等を生む可能性も指摘されています。\n\n質問：デジタル技術と民主主義の関係で懸念されていることは何ですか？', E'デジタルリテラシーの格差が新たな不平等を生む可能性です。디지털 리터러시 격차가 새로운 불평등을 만들 수 있습니다。', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인터넷 속도가 느리다', FALSE, 1),
    (gen_random_uuid(), q_id, '디지털 리터러시 격차가 새로운 불평등을 만든다', TRUE, 2),
    (gen_random_uuid(), q_id, '투표율이 낮아진다', FALSE, 3),
    (gen_random_uuid(), q_id, '정치인이 필요 없게 된다', FALSE, 4);
END $$;

-- N1 Q27: 내용이해 (SDGs取り組み)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n代表：当社はSDGsの目標4「質の高い教育」に貢献するため、途上国向けにオンライン教育プラットフォームを無償提供しています。現在15カ国で利用されており、累計10万人以上が受講しています。来年度はアフリカ地域への展開を計画しています。\n\n質問：現在このプラットフォームは何カ国で利用されていますか？', E'「15カ国で利用」と報告しています。15개국에서 이용되고 있습니다。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10개국', FALSE, 1),
    (gen_random_uuid(), q_id, '15개국', TRUE, 2),
    (gen_random_uuid(), q_id, '20개국', FALSE, 3),
    (gen_random_uuid(), q_id, '30개국', FALSE, 4);
END $$;

-- N1 Q28: 세부정보 (労働法改正)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n人事部長：同一労働同一賃金の原則が強化され、正社員と非正規社員の不合理な待遇差が禁止されています。\n社員：具体的にどのような差が問題になりますか。\n人事部長：基本給だけでなく、手当や福利厚生の差も対象です。職務内容が同じであれば、雇用形態に関わらず同等の待遇を保障する必要があります。\n\n質問：同一労働同一賃金の対象は何ですか？', E'基本給だけでなく手当や福利厚生も対象です。기본급뿐 아니라 수당이나 복리후생도 대상입니다。', 1, 28, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기본급만', FALSE, 1),
    (gen_random_uuid(), q_id, '기본급, 수당, 복리후생 전체', TRUE, 2),
    (gen_random_uuid(), q_id, '상여금만', FALSE, 3),
    (gen_random_uuid(), q_id, '정사원만 해당', FALSE, 4);
END $$;

-- N1 Q29: 화자의도 (技術倫理)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nエンジニア：ユーザーデータの収集範囲について倫理的に問題がないか確認したいのですが。\nCPO：収集目的を明確にし、最小限のデータだけを取得する「データミニマイゼーション」の原則を守ってください。\nエンジニア：同意の取得方法も確認すべきですね。\nCPO：はい。オプトインの仕組みを確実に実装してください。\n\n質問：CPOが指示した原則は何ですか？', E'「データミニマイゼーション」の原則です。데이터 미니마이제이션(최소화) 원칙입니다。', 1, 29, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가능한 한 많은 데이터를 수집한다', FALSE, 1),
    (gen_random_uuid(), q_id, '최소한의 데이터만 수집하는 데이터 미니마이제이션', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터 수집을 하지 않는다', FALSE, 3),
    (gen_random_uuid(), q_id, '익명화만 하면 된다', FALSE, 4);
END $$;

-- N1 Q30: 추론 (未来の働き方)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n未来学者：2030年代には、企業に所属しない「DAO（分散型自律組織）」のような新しい働き方が一般化する可能性があります。\n記者：従来の雇用関係はなくなるのでしょうか。\n未来学者：完全になくなることはないでしょうが、プロジェクト単位で集まり、完了後に解散するような柔軟な組織形態が増えると予想されます。重要なのは、個人がポータブルなスキルと評判を持つことです。\n\n質問：未来学者が個人に必要だと考えていることは何ですか？', E'ポータブルなスキルと評判を持つことです。포터블한(이동 가능한) 스킬과 평판을 갖는 것입니다。', 1, 30, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대기업에 소속되는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '포터블한 스킬과 평판을 갖는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '하나의 전문 분야만 깊이 파는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '조직에 순응하는 것', FALSE, 4);
END $$;

-- Update listening quiz time limits (+10 minutes each)
UPDATE quizzes SET time_limit_minutes = time_limit_minutes + 10 WHERE id IN (
  'd0000001-0000-0000-0000-000000000001',
  'd0000002-0000-0000-0000-000000000002',
  'd0000003-0000-0000-0000-000000000003',
  'd0000004-0000-0000-0000-000000000004',
  'd0000005-0000-0000-0000-000000000005'
);
