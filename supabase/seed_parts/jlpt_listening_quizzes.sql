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
