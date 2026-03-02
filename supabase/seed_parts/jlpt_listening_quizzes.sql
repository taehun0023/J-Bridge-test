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
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：いらっしゃいませ。\n田中：すみません、おにぎりはどこですか。\n店員：おにぎりはあちらの棚にあります。\n田中：ありがとうございます。これと、お茶をください。\n店員：はい、おにぎり一つとお茶一つですね。全部で三百二十円です。\n\n質問：田中さんは何を買いましたか。', E'田中さんは「これと、お茶をください」と言っています。「これ」はおにぎりを指しているので、おにぎりとお茶を買いました。全部で320円です。', 1, 1, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おにぎりと水', FALSE, 1),
    (gen_random_uuid(), q_id, 'おにぎりとお茶', TRUE, 2),
    (gen_random_uuid(), q_id, 'お弁当とお茶', FALSE, 3),
    (gen_random_uuid(), q_id, 'パンとジュース', FALSE, 4);
END $$;

-- N5 Q2: 내용이해 (駅で道を聞く)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：すみません、図書館はどこですか。\n鈴木：ここからまっすぐ行って、二つ目の信号を右に曲がってください。\n鈴木：右に曲がったら、左側にあります。\n山田：歩いてどのくらいかかりますか。\n鈴木：十分くらいですよ。\n\n質問：図書館に行くにはどうしますか。', E'鈴木さんの説明では「まっすぐ行って、二つ目の信号を右に曲がる」と言っています。左側にあるのは図書館の位置で、曲がる方向は右です。', 1, 2, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'まっすぐ行って二つ目の信号を右に曲がる', TRUE, 1),
    (gen_random_uuid(), q_id, 'まっすぐ行って一つ目の信号を左に曲がる', FALSE, 2),
    (gen_random_uuid(), q_id, 'まっすぐ行って三つ目の信号を右に曲がる', FALSE, 3),
    (gen_random_uuid(), q_id, 'まっすぐ行って二つ目の信号を左に曲がる', FALSE, 4);
END $$;

-- N5 Q3: 내용이해 (レストランで注文)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：何にする？\n佐藤：私はカレーライスにする。高橋さんは？\n高橋：私はラーメンにします。\n店員：ご注文はお決まりですか。\n佐藤：カレーライス一つとラーメン一つ、お願いします。\n\n質問：高橋さんは何を注文しましたか。', E'高橋さんは「私はラーメンにします」と言っています。佐藤さんがカレーライス、高橋さんがラーメンを注文しました。', 1, 3, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'カレーライス', FALSE, 1),
    (gen_random_uuid(), q_id, 'うどん', FALSE, 2),
    (gen_random_uuid(), q_id, 'カレーライスとラーメン', FALSE, 3),
    (gen_random_uuid(), q_id, 'ラーメン', TRUE, 4);
END $$;

-- N5 Q4: 내용이해 (友達との電話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：土曜日、ひまですか。\n鈴木：うん、ひまだよ。\n山田：じゃあ、一緒に公園に行きませんか。\n鈴木：いいね！何時に会う？\n山田：十時はどうですか。\n鈴木：十時はちょっと早いな。十一時はどう？\n山田：十一時、いいですよ。駅の前で会いましょう。\n\n質問：二人はいつ、どこで会いますか。', E'最初は十時を提案しましたが、鈴木さんが「ちょっと早い」と言って十一時を提案し、山田さんも同意しました。場所は「駅の前」です。', 1, 4, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '土曜日10時、公園の前で', FALSE, 1),
    (gen_random_uuid(), q_id, '日曜日11時、駅の前で', FALSE, 2),
    (gen_random_uuid(), q_id, '土曜日11時、駅の前で', TRUE, 3),
    (gen_random_uuid(), q_id, '土曜日10時、駅の前で', FALSE, 4);
END $$;

-- N5 Q5: 세부정보 (コンビニでの買い物)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：全部で三百二十円です。\n田中：千円でお願いします。\n店員：六百八十円のおつりです。レジ袋はいりますか。\n田中：いいえ、大丈夫です。\n\n質問：おつりはいくらですか。', E'田中さんは千円を出しました。合計が320円なので、おつりは1000−320＝680円です。店員も「六百八十円のおつり」と言っています。', 1, 5, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '320円', FALSE, 1),
    (gen_random_uuid(), q_id, '780円', FALSE, 2),
    (gen_random_uuid(), q_id, '680円', TRUE, 3),
    (gen_random_uuid(), q_id, '1000円', FALSE, 4);
END $$;

-- N5 Q6: 세부정보 (天気のお知らせ)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンサー：今日の東京の天気は晴れです。気温は二十五度です。明日は曇りで、午後から雨が降るでしょう。傘を持って出かけてください。\n\n質問：明日の天気はどうですか。', E'「明日は曇りで、午後から雨が降るでしょう」と言っています。明日は曇りのち雨です。', 1, 6, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '晴れ', FALSE, 1),
    (gen_random_uuid(), q_id, '曇りで午後から雨', TRUE, 2),
    (gen_random_uuid(), q_id, '一日中雨', FALSE, 3),
    (gen_random_uuid(), q_id, '晴れて暑い', FALSE, 4);
END $$;

-- N5 Q7: 세부정보 (駅で道を聞く)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：歩いてどのくらいかかりますか。\n鈴木：十分くらいですよ。\n\n質問：図書館まで歩いてどのくらいかかりますか。', E'鈴木さんは「十分くらいですよ」と答えています。徒歩で約10分です。', 1, 7, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約5分', FALSE, 1),
    (gen_random_uuid(), q_id, '約15分', FALSE, 2),
    (gen_random_uuid(), q_id, '約20分', FALSE, 3),
    (gen_random_uuid(), q_id, '約10分', TRUE, 4);
END $$;

-- N5 Q8: 화자의도 (レストランで注文)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：お飲み物はいかがですか。\n高橋：水をください。\n\n質問：店員が「お飲み物はいかがですか」と聞いた意図は何ですか。', E'店員は追加注文を確認しています。「いかがですか」は飲み物の注文を勧めている表現です。', 1, 8, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '飲み物がおいしいか確認するため', FALSE, 1),
    (gen_random_uuid(), q_id, '飲み物の注文を取るため', TRUE, 2),
    (gen_random_uuid(), q_id, '飲み物がないことを知らせるため', FALSE, 3),
    (gen_random_uuid(), q_id, '飲み物を勧めるため', FALSE, 4);
END $$;

-- N5 Q9: 화자의도 (友達との電話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：十時はどうですか。\n鈴木：十時はちょっと早いな。十一時はどう？\n\n質問：鈴木さんが「十時はちょっと早いな」と言ったのはなぜですか。', E'鈴木さんは10時では早すぎると感じたので、11時に変更したいという意図で言いました。「ちょっと早い」は控えめな断り方です。', 1, 9, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10時には約束があるから', FALSE, 1),
    (gen_random_uuid(), q_id, '公園が10時に開かないから', FALSE, 2),
    (gen_random_uuid(), q_id, '10時は早すぎると感じて時間を変えたかったから', TRUE, 3),
    (gen_random_uuid(), q_id, '土曜日に行きたくないから', FALSE, 4);
END $$;

-- N5 Q10: 추론 (天気のお知らせ)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンサー：明日は曇りで、午後から雨が降るでしょう。傘を持って出かけてください。週末は晴れて、暑くなります。水をたくさん飲んでください。\n\n質問：明日出かける人は何を持っていくべきですか。', E'「傘を持って出かけてください」と言っているので、明日は午後から雨が降るため傘が必要です。', 1, 10, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '水', FALSE, 1),
    (gen_random_uuid(), q_id, '帽子', FALSE, 2),
    (gen_random_uuid(), q_id, '日焼け止め', FALSE, 3),
    (gen_random_uuid(), q_id, '傘', TRUE, 4);
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
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n田中：三日前から頭が痛くて、熱もあるんです。\n医者：熱を測りましょう。三十八度二分ですね。のどを見せてください。\n医者：のどが赤いですね。風邪だと思います。\n\n質問：医者は田中さんの病気を何だと言いましたか。', E'医者は「風邪だと思います」と診断しています。症状は頭痛、発熱、喉の赤みです。', 1, 1, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '風邪', TRUE, 1),
    (gen_random_uuid(), q_id, 'インフルエンザ', FALSE, 2),
    (gen_random_uuid(), q_id, 'アレルギー', FALSE, 3),
    (gen_random_uuid(), q_id, '偏頭痛', FALSE, 4);
END $$;

-- N4 Q2: 내용이해 (不動産屋でのアパート探し)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：この物件はいかがですか。駅から歩いて七分で、家賃は五万八千円です。\n佐藤：いいですね。部屋の広さはどのくらいですか。\n店員：ワンルームで、二十平米です。バス・トイレ別です。\n\n質問：紹介された物件について正しいものはどれですか。', E'店員は「駅から歩いて七分で、家賃は五万八千円」「ワンルームで二十平米」「バス・トイレ別」と説明しています。', 1, 2, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '駅から10分、家賃6万円', FALSE, 1),
    (gen_random_uuid(), q_id, '駅から7分、家賃6万円', FALSE, 2),
    (gen_random_uuid(), q_id, '駅から5分、家賃5万8千円', FALSE, 3),
    (gen_random_uuid(), q_id, '駅から7分、家賃5万8千円', TRUE, 4);
END $$;

-- N4 Q3: 내용이해 (郵便局での手続き)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：この荷物を韓国に送りたいんですが。\n局員：中身は何ですか。\n高橋：お菓子と本です。\n局員：航空便ですと、三日から五日ぐらいで届きます。料金は二千五百円です。\n\n質問：高橋さんは何を送りますか。', E'高橋さんは韓国に送る荷物の中身について「お菓子と本です」と答えています。', 1, 3, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '服と本', FALSE, 1),
    (gen_random_uuid(), q_id, 'お菓子と服', FALSE, 2),
    (gen_random_uuid(), q_id, 'お菓子と本', TRUE, 3),
    (gen_random_uuid(), q_id, '本とプレゼント', FALSE, 4);
END $$;

-- N4 Q4: 내용이해 (友人を旅行に誘う)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：京都はどう？紅葉がきれいな時期だと思うんだけど。\n鈴木：京都いいね。でも、宿は取れるかな。\n山田：夜行バスのほうが安いよ。片道三千円ぐらいで行ける。\n鈴木：そんなに安いの？じゃあ、バスにしよう。\n\n質問：二人はどうやって京都に行くことにしましたか。', E'山田さんが「夜行バスのほうが安い」と提案し、鈴木さんが「じゃあ、バスにしよう」と同意しました。', 1, 4, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '新幹線で', FALSE, 1),
    (gen_random_uuid(), q_id, '飛行機で', FALSE, 2),
    (gen_random_uuid(), q_id, '電車で', FALSE, 3),
    (gen_random_uuid(), q_id, '夜行バスで', TRUE, 4);
END $$;

-- N4 Q5: 세부정보 (病院での受診)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n医者：薬を出しますから、三日分飲んでください。\n田中：分かりました。食事の前に飲みますか。\n医者：いいえ、食事の後に飲んでください。\n\n質問：田中さんはいつ薬を飲みますか。', E'医者は「食事の後に飲んでください」と指示しています。食前ではなく食後に服用します。', 1, 5, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '食事の前に', FALSE, 1),
    (gen_random_uuid(), q_id, '食事の後に', TRUE, 2),
    (gen_random_uuid(), q_id, '寝る前に', FALSE, 3),
    (gen_random_uuid(), q_id, '朝起きてから', FALSE, 4);
END $$;

-- N4 Q6: 세부정보 (バスの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：このバスは東京駅行きです。次は「中央公園前」です。本日は祝日ダイヤで運行しております。通常より本数が少なくなっておりますので、ご注意ください。\n\n質問：今日のバスについて正しいものはどれですか。', E'「本日は祝日ダイヤで運行しております。通常より本数が少なくなっております」と言っているので、通常より運行本数が少ないです。', 1, 6, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '普段より運行本数が多い', FALSE, 1),
    (gen_random_uuid(), q_id, '今日は運行しない', FALSE, 2),
    (gen_random_uuid(), q_id, '祝日ダイヤで運行本数が少ない', TRUE, 3),
    (gen_random_uuid(), q_id, '東京駅まで行かない', FALSE, 4);
END $$;

-- N4 Q7: 세부정보 (郵便局での手続き)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n局員：航空便ですと、三日から五日ぐらいで届きます。料金は二千五百円です。\n高橋：じゃあ、航空便でお願いします。\n局員：こちらの伝票に送り先の住所とお名前を書いてください。\n\n質問：航空便の料金と届くまでの日数はどれですか。', E'局員は「三日から五日ぐらいで届きます。料金は二千五百円です」と説明しています。', 1, 7, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1,500円、1〜2日', FALSE, 1),
    (gen_random_uuid(), q_id, '2,500円、3〜5日', TRUE, 2),
    (gen_random_uuid(), q_id, '2,500円、7〜10日', FALSE, 3),
    (gen_random_uuid(), q_id, '3,500円、3〜5日', FALSE, 4);
END $$;

-- N4 Q8: 화자의도 (不動産屋でのアパート探し)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：いいですね。一度見に行ってもいいですか。\n店員：もちろんです。今週の土曜日はいかがですか。\n\n質問：佐藤さんが「一度見に行ってもいいですか」と言った意図は何ですか。', E'佐藤さんは物件の説明を聞いて気に入り、実際に部屋を確認するために内見を希望しています。', 1, 8, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '物件を買いたいから', FALSE, 1),
    (gen_random_uuid(), q_id, 'すぐ契約したいから', FALSE, 2),
    (gen_random_uuid(), q_id, '実際に部屋を見たいから', TRUE, 3),
    (gen_random_uuid(), q_id, '他の不動産屋に行きたいから', FALSE, 4);
END $$;

-- N4 Q9: 화자의도 (友人を旅行に誘う)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：鈴木さん、来月の連休、どこか行かない？\n鈴木：いいね！どこに行きたい？\n\n質問：山田さんが「どこか行かない？」と言ったのはなぜですか。', E'「～ない？」は否定疑問形ですが、相手を誘うときに使う表現です。山田さんは鈴木さんを旅行に誘っています。', 1, 9, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '旅行に行きたくないから', FALSE, 1),
    (gen_random_uuid(), q_id, '鈴木さんの予定を確認するため', FALSE, 2),
    (gen_random_uuid(), q_id, '連休に仕事があるから', FALSE, 3),
    (gen_random_uuid(), q_id, '鈴木さんを旅行に誘うため', TRUE, 4);
END $$;

-- N4 Q10: 추론 (バスの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：次は「中央公園前」です。中央公園、市立図書館にお越しの方はこちらでお降りください。お降りの際は、前のドアからお降りください。車内では携帯電話はマナーモードにしてください。\n\n質問：市立図書館に行きたい人はどうすればいいですか。', E'「中央公園、市立図書館にお越しの方はこちらでお降りください」と案内しているので、「中央公園前」で下車すれば市立図書館に行けます。', 1, 10, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次の停留所の市役所前で降りる', FALSE, 1),
    (gen_random_uuid(), q_id, '中央公園前で降りる', TRUE, 2),
    (gen_random_uuid(), q_id, '東京駅で降りる', FALSE, 3),
    (gen_random_uuid(), q_id, '後ろのドアから降りる', FALSE, 4);
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
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：先週、大阪から引っ越してきたので、転入届を出したいのですが。\n窓口：転入届ですね。前の住所の役所で転出届は出されましたか。\n佐藤：はい、転出証明書を持っています。\n\n質問：佐藤さんは何をしに来ましたか。', E'佐藤さんは「転入届を出したい」と言っています。大阪から引っ越してきたので、新しい住所の区役所で転入届の手続きをしに来ました。', 1, 1, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '転入届を出しに', TRUE, 1),
    (gen_random_uuid(), q_id, '転出届を出しに', FALSE, 2),
    (gen_random_uuid(), q_id, 'パスポートを作りに', FALSE, 3),
    (gen_random_uuid(), q_id, '印鑑登録をしに', FALSE, 4);
END $$;

-- N3 Q2: 내용이해 (近所トラブルの相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：実は、上の階の方の足音がかなり気になっていまして。特に夜の十時過ぎに大きな音がするんです。\n管理人：それはお困りでしょうね。いつ頃からですか。\n高橋：先月から新しい方が越してきてからです。\n\n質問：高橋さんは何に困っていますか。', E'高橋さんは「上の階の方の足音がかなり気になっている」と相談しています。特に夜22時以降の騒音が問題です。', 1, 2, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '隣の部屋の音楽の音', FALSE, 1),
    (gen_random_uuid(), q_id, '下の階の匂い', FALSE, 2),
    (gen_random_uuid(), q_id, '上の階の足音の騒音', TRUE, 3),
    (gen_random_uuid(), q_id, '駐車場の問題', FALSE, 4);
END $$;

-- N3 Q3: 내용이해 (お祭りの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：午前十時から正午まで、中央広場で和太鼓の演奏が行われます。午後一時からは、盆踊り大会を開催いたします。花火大会は午後七時半から約三十分間行います。\n\n質問：盆踊り大会は何時からですか。', E'アナウンスでは「午後一時からは、盆踊り大会を開催いたします」と案内しています。', 1, 3, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '午前10時から', FALSE, 1),
    (gen_random_uuid(), q_id, '正午から', FALSE, 2),
    (gen_random_uuid(), q_id, '午後1時から', TRUE, 3),
    (gen_random_uuid(), q_id, '午後7時30分から', FALSE, 4);
END $$;

-- N3 Q4: 내용이해 (日本語教室での会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先生：「おっしゃる」は相手の動作に使う尊敬語で、「申す」は自分の動作に使う謙譲語です。\nキム：なるほど。日常生活ではどのくらい使いますか。\n先生：お店の店員さんとか、病院で話すときによく使いますよ。\n\n質問：「おっしゃる」はどのような場面で使いますか。', E'先生は「おっしゃる」は「相手の動作に使う尊敬語」と説明しています。相手が何かを言った場面で使います。', 1, 4, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自分が言うとき', FALSE, 1),
    (gen_random_uuid(), q_id, '友達に言うとき', FALSE, 2),
    (gen_random_uuid(), q_id, '相手が言ったことを表すとき', TRUE, 3),
    (gen_random_uuid(), q_id, '独り言を言うとき', FALSE, 4);
END $$;

-- N3 Q5: 세부정보 (区役所での転入届)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：住民票もすぐもらえますか。\n窓口：はい、手続きが終わりましたら、住民票を発行できます。一通三百円になります。\n佐藤：では、二通お願いします。\n窓口：かしこまりました。手続きに二十分ほどかかります。\n\n質問：佐藤さんは住民票にいくら払いますか。', E'住民票は一通300円で、佐藤さんは二通注文したので、300×2＝600円です。', 1, 5, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '300円', FALSE, 1),
    (gen_random_uuid(), q_id, '500円', FALSE, 2),
    (gen_random_uuid(), q_id, '600円', TRUE, 3),
    (gen_random_uuid(), q_id, '900円', FALSE, 4);
END $$;

-- N3 Q6: 세부정보 (お祭りの案内放送)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：会場の北側には屋台が並んでおりまして、焼きそば、たこ焼き、かき氷などをお楽しみいただけます。お子様向けには、南側の広場で金魚すくいや輪投げなどのゲームをご用意しております。\n\n質問：子ども向けの遊びはどこにありますか。', E'「お子様向けには、南側の広場で金魚すくいや輪投げなどのゲームをご用意しております」と案内しています。', 1, 6, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会場の北側', FALSE, 1),
    (gen_random_uuid(), q_id, '中央広場', FALSE, 2),
    (gen_random_uuid(), q_id, '会場の東側', FALSE, 3),
    (gen_random_uuid(), q_id, '南側の広場', TRUE, 4);
END $$;

-- N3 Q7: 세부정보 (災害時の避難案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：避難所は三か所開設されています。第一避難所は中央小学校、第二避難所は北区公民館、第三避難所は東体育館です。自動車での避難は道路が混雑する原因となりますので、できるだけ徒歩でお願いいたします。\n\n質問：避難所は全部でいくつありますか。', E'「避難所は三か所開設されています」と言っています。中央小学校、北区公民館、東体育館の3か所です。', 1, 7, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1か所', FALSE, 1),
    (gen_random_uuid(), q_id, '2か所', FALSE, 2),
    (gen_random_uuid(), q_id, '3か所', TRUE, 3),
    (gen_random_uuid(), q_id, '5か所', FALSE, 4);
END $$;

-- N3 Q8: 화자의도 (近所トラブルの相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n高橋：直接言ったほうがいいでしょうか。\n管理人：最初は管理事務所から全体のお知らせという形が良いかと思います。それでも改善されない場合は、個別に対応いたします。\n\n質問：管理人はまず何をすると言いましたか。', E'管理人は「全体のお知らせとして、夜間の騒音に関する注意書きを掲示板に貼る」と言っています。直接言うのではなく、まず全体への注意喚起をする方針です。', 1, 8, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '上の階の住民に直接注意する', FALSE, 1),
    (gen_random_uuid(), q_id, '全体のお知らせとして夜間騒音の注意事項を掲示する', TRUE, 2),
    (gen_random_uuid(), q_id, '警察に届ける', FALSE, 3),
    (gen_random_uuid(), q_id, '何もしない', FALSE, 4);
END $$;

-- N3 Q9: 화자의도 (日本語教室での会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリン：友達には使わないほうがいいですか。\n先生：そうですね。友達に使うと距離を感じさせてしまいます。では、実際に練習してみましょう。ペアになってください。\n\n質問：先生が「友達に使うと距離を感じさせてしまいます」と言ったのはどういう意味ですか。', E'先生は、友達に対して敬語を使うと他人行儀になり、心理的な距離が生まれてしまうことを説明しています。', 1, 9, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '物理的な距離が遠くなるという意味', FALSE, 1),
    (gen_random_uuid(), q_id, '友達に敬語を使うとよそよそしくなるという意味', TRUE, 2),
    (gen_random_uuid(), q_id, '友達と会いにくくなるという意味', FALSE, 3),
    (gen_random_uuid(), q_id, '敬語は難しいという意味', FALSE, 4);
END $$;

-- N3 Q10: 추론 (災害時の避難案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nアナウンス：ただいま、この地域に大雨警報が発令されました。河川の水位が上昇しておりますので、川の近くにお住まいの方は十分にご注意ください。自動車での避難は道路が混雑する原因となりますので、できるだけ徒歩でお願いいたします。\n\n質問：この放送から推測できることとして正しいものはどれですか。', E'大雨警報が発令され、河川の水位上昇が報告されているので、洪水の危険性があることが推測できます。', 1, 10, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '地震が発生する危険がある', FALSE, 1),
    (gen_random_uuid(), q_id, '台風が接近している', FALSE, 2),
    (gen_random_uuid(), q_id, '避難する必要がない', FALSE, 3),
    (gen_random_uuid(), q_id, '洪水の危険があり川の近くの住民は注意が必要だ', TRUE, 4);
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
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n山田：料理教室に興味がありまして。来月開講する講座はありますか。\n受付：来月ですと、「はじめての和食」と「家庭でできるイタリアン」の二講座がございます。\n山田：「はじめての和食」について詳しく教えていただけますか。\n\n質問：山田さんが詳しく聞きたい講座はどれですか。', E'山田さんは「はじめての和食」について詳しく教えてほしいと言っています。', 1, 1, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'はじめての和食', TRUE, 1),
    (gen_random_uuid(), q_id, '家庭でできるイタリアン', FALSE, 2),
    (gen_random_uuid(), q_id, '二講座とも', FALSE, 3),
    (gen_random_uuid(), q_id, 'お菓子教室', FALSE, 4);
END $$;

-- N2 Q2: 내용이해 (医師と患者の診察会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n医師：全体的に大きな問題はありませんが、コレステロール値がやや高めです。前回と比べると少し上がっています。\n田中：何か生活で気をつけることはありますか。\n医師：まず、食生活の見直しが大切です。揚げ物や脂っこい食事を控えて、野菜を多く摂るようにしてください。\n\n質問：田中さんの検査結果でどこに問題がありましたか。', E'医師は「コレステロール値がやや高め」で「前回と比べると少し上がっている」と説明しています。', 1, 2, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '血圧が高い', FALSE, 1),
    (gen_random_uuid(), q_id, '血糖値が高い', FALSE, 2),
    (gen_random_uuid(), q_id, 'コレステロール値が高い', TRUE, 3),
    (gen_random_uuid(), q_id, '特に問題はない', FALSE, 4);
END $$;

-- N2 Q3: 내용이해 (PTA会議での議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n会長：本日の議題は、来月の運動会についてです。日程の確認ですが、十月十二日の土曜日で変更はありませんね。\n副会長：はい、雨天の場合は翌日の十三日に延期ということで、学校側とも確認済みです。\n\n質問：運動会が雨で中止になったらどうなりますか。', E'副会長は「雨天の場合は翌日の十三日に延期」と説明しています。中止ではなく翌日に延期されます。', 1, 3, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そのまま中止になる', FALSE, 1),
    (gen_random_uuid(), q_id, '来週に延期される', FALSE, 2),
    (gen_random_uuid(), q_id, '室内で行う', FALSE, 3),
    (gen_random_uuid(), q_id, '翌日の13日に延期される', TRUE, 4);
END $$;

-- N2 Q4: 내용이해 (マンション管理組合の会合)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n理事長：本日の議題は、大規模修繕工事の実施計画についてです。\n副理事長：築二十年を迎えまして、外壁の塗装や防水工事が必要な時期となっております。\n\n質問：臨時総会の議題は何ですか。', E'理事長は「大規模修繕工事の実施計画」が今日の議題だと説明しています。築20年で外壁塗装や防水工事が必要になりました。', 1, 4, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '管理費の値上げ', FALSE, 1),
    (gen_random_uuid(), q_id, '大規模修繕工事の実施計画', TRUE, 2),
    (gen_random_uuid(), q_id, '駐車場の拡張工事', FALSE, 3),
    (gen_random_uuid(), q_id, 'エレベーターの交換', FALSE, 4);
END $$;

-- N2 Q5: 세부정보 (市民講座の申し込み)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n受付：毎週水曜日の午前十時から十二時まで、全八回のコースです。定員は十五名で、受講料は材料費込みで一万二千円になります。\n山田：持ち物は何か必要ですか。\n受付：エプロンと三角巾をご持参ください。調理器具と食材はこちらでご用意いたします。\n\n質問：受講者が持参するものは何ですか。', E'受付は「エプロンと三角巾をご持参ください」と言っています。調理器具と食材はセンター側で用意します。', 1, 5, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '調理器具と食材', FALSE, 1),
    (gen_random_uuid(), q_id, 'エプロンと三角巾', TRUE, 2),
    (gen_random_uuid(), q_id, '教科書とノート', FALSE, 3),
    (gen_random_uuid(), q_id, '包丁とまな板', FALSE, 4);
END $$;

-- N2 Q6: 세부정보 (マンション管理組合の会合)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n理事長：見積もりを三社から取りまして、平均すると約三千万円になります。修繕積立金の残高は現在二千五百万円ですので、不足分は一時金として各戸にご負担いただく必要がございます。\n副理事長：全三十戸ですので、一戸あたり約十七万円のご負担となります。\n\n質問：修繕工事の不足分は一戸あたりいくらですか。', E'副理事長が「一戸あたり約十七万円のご負担」と説明しています。総額3000万円−積立金2500万円＝500万円の不足分を30戸で割った金額です。', 1, 6, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約10万円', FALSE, 1),
    (gen_random_uuid(), q_id, '約17万円', TRUE, 2),
    (gen_random_uuid(), q_id, '約25万円', FALSE, 3),
    (gen_random_uuid(), q_id, '約100万円', FALSE, 4);
END $$;

-- N2 Q7: 세부정보 (交通安全の講演)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：交通事故件数は前年より減少していますが、自転車に関する事故は逆に増加しています。特に、スマートフォンを見ながらの運転や、イヤホンをつけたままの走行が原因となるケースが目立ちます。\n\n質問：自転車事故が増えている原因として挙げられているものはどれですか。', E'講師は「スマートフォンを見ながらの運転」と「イヤホンをつけたままの走行」を自転車事故増加の原因として挙げています。', 1, 7, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '飲酒運転と速度超過', FALSE, 1),
    (gen_random_uuid(), q_id, '信号無視と逆走', FALSE, 2),
    (gen_random_uuid(), q_id, 'スマートフォンの使用とイヤホンの着用', TRUE, 3),
    (gen_random_uuid(), q_id, '夜間無灯走行と傘の使用', FALSE, 4);
END $$;

-- N2 Q8: 화자의도 (医師と患者の診察会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n田中：薬は必要ですか。\n医師：今のところ、薬を出すほどではありません。まずは生活習慣の改善で様子を見ましょう。三か月後にもう一度検査をしますので、それまでに改善が見られなければ、その時に薬の処方を検討します。\n\n質問：医師が「まずは生活習慣の改善で様子を見ましょう」と言った意図は何ですか。', E'医師は薬に頼る前に、食事改善や運動などの生活習慣の見直しで改善できるか様子を見たいと考えています。3か月後の再検査で判断する方針です。', 1, 8, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '薬を処方するには症状がひどすぎるから', FALSE, 1),
    (gen_random_uuid(), q_id, '薬なしで生活習慣の改善でまず様子を見たいから', TRUE, 2),
    (gen_random_uuid(), q_id, '薬が現在品切れだから', FALSE, 3),
    (gen_random_uuid(), q_id, '田中さんが薬を拒否したから', FALSE, 4);
END $$;

-- N2 Q9: 화자의도 (PTA会議での議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n佐藤：昨年はアレルギー対応が不十分だという声がありました。今年は各出店にアレルギー表示を義務付けてはどうでしょうか。\n副会長：賛成です。食品表示のテンプレートを作って配布するのがいいと思います。\n\n質問：佐藤さんが提案したことは何ですか。', E'佐藤さんは「各出店にアレルギー表示を義務付ける」ことを提案しています。昨年の反省を踏まえた改善案です。', 1, 9, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '食品の販売を中止しよう', FALSE, 1),
    (gen_random_uuid(), q_id, '販売する食品の数を減らそう', FALSE, 2),
    (gen_random_uuid(), q_id, '各出店にアレルギー表示を義務付けよう', TRUE, 3),
    (gen_random_uuid(), q_id, 'アレルギーのある子は参加を控えよう', FALSE, 4);
END $$;

-- N2 Q10: 추론 (交通安全の講演)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：自転車も車両の一種ですので、交通ルールを守る義務があります。具体的には、信号を守ること、一時停止の標識では必ず止まること、夜間は必ずライトを点灯すること、そして歩道ではなく車道の左側を走行することが基本です。\n\n質問：この講演から推測できる問題として正しいものはどれですか。', E'講師がわざわざ自転車の基本ルールを説明しているということは、これらのルールが守られていない現状があることが推測できます。', 1, 10, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自動車事故が増加している', FALSE, 1),
    (gen_random_uuid(), q_id, '自転車利用者が交通ルールを守らない現実がある', TRUE, 2),
    (gen_random_uuid(), q_id, '歩行者事故が最も多い', FALSE, 3),
    (gen_random_uuid(), q_id, '交通ルールが最近変更された', FALSE, 4);
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
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n市長：当市は少子高齢化という構造的課題に直面しておりますが、これを危機ではなく変革の好機と捉え、持続可能なまちづくりを推進してまいります。第一に、子育て支援の抜本的強化です。第二に、高齢者福祉の充実です。第三に、防災・減災対策の強化です。\n\n質問：市長が挙げた三つの重点施策に含まれないものはどれですか。', E'市長は三つの施策として「子育て支援」「高齢者福祉」「防災・減災対策」を挙げています。産業振興は含まれていません。', 1, 1, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '子育て支援の強化', FALSE, 1),
    (gen_random_uuid(), q_id, '高齢者福祉の充実', FALSE, 2),
    (gen_random_uuid(), q_id, '産業振興', TRUE, 3),
    (gen_random_uuid(), q_id, '防災・減災対策の強化', FALSE, 4);
END $$;

-- N1 Q2: 내용이해 (文化交流シンポジウム)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n教授：共生という言葉が示すように、これは一方的な同化ではなく、相互理解と尊重に基づく関係の構築を意味します。\nパネリストA：外国人住民の方々が最も困っているのは、やはり言葉の壁です。\n\n質問：パネリストAが外国人住民の最大の課題として挙げたものは何ですか。', E'パネリストAは「外国人住民の方々が最も困っているのは、やはり言葉の壁です」と明確に述べています。', 1, 2, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '就職問題', FALSE, 1),
    (gen_random_uuid(), q_id, '住居問題', FALSE, 2),
    (gen_random_uuid(), q_id, '文化の違い', FALSE, 3),
    (gen_random_uuid(), q_id, '言葉の壁', TRUE, 4);
END $$;

-- N1 Q3: 내용이해 (地域活性化の座談会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n田中：当町の人口はこの二十年で三割減少しました。特に若年層の流出が深刻で、高校を卒業すると大半が都市部に出てしまいます。商店街もシャッター通りと化し、かつての賑わいは見る影もありません。\n\n質問：田中さんが述べた地域の問題は何ですか。', E'田中さんは人口が20年で3割減少し、若者が流出し、商店街が衰退していると述べています。人口減少と地域の衰退が問題です。', 1, 3, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人口減少と若年層の流出による地域の衰退', TRUE, 1),
    (gen_random_uuid(), q_id, '人口過密と交通渋滞', FALSE, 2),
    (gen_random_uuid(), q_id, '外国人観光客の増加による混雑', FALSE, 3),
    (gen_random_uuid(), q_id, '自然災害の被害復旧', FALSE, 4);
END $$;

-- N1 Q4: 내용이해 (教育改革についての討論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n教授A：最大の課題は、画一的な教育から個別最適化された学びへの転換が進んでいないことです。\n教授B：私はむしろ、教育の本質的な目的が見失われていることを懸念しています。知識の暗記偏重から脱却できず、批判的思考力や創造性を育む教育が不十分です。\n\n質問：教授Bが懸念している問題は何ですか。', E'教授Bは「知識の暗記偏重から脱却できず、批判的思考力や創造性を育む教育が不十分」だと懸念しています。教育の本質的な目的が見失われているという指摘です。', 1, 4, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '画一的教育から個別最適化への転換不足', FALSE, 1),
    (gen_random_uuid(), q_id, '学校施設の老朽化', FALSE, 2),
    (gen_random_uuid(), q_id, '暗記偏重から脱却できず批判的思考力と創造性教育が不足していること', TRUE, 3),
    (gen_random_uuid(), q_id, '教員数の不足', FALSE, 4);
END $$;

-- N1 Q5: 세부정보 (市長の施政方針演説)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n市長：各地区に設置しております高齢者サロンを現在の十五か所から二十五か所に増設し、高齢者の社会参加と生きがいづくりを支援いたします。\n\n質問：高齢者サロンの増設計画はどのようなものですか。', E'市長は高齢者サロンを「現在の十五か所から二十五か所に増設」すると述べています。10か所の増設です。', 1, 5, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10か所から15か所に増設', FALSE, 1),
    (gen_random_uuid(), q_id, '15か所から25か所に増設', TRUE, 2),
    (gen_random_uuid(), q_id, '20か所から30か所に増設', FALSE, 3),
    (gen_random_uuid(), q_id, '25か所から50か所に増設', FALSE, 4);
END $$;

-- N1 Q6: 세부정보 (環境保護NPOの活動報告)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n代表：第一の事業は、里山再生プロジェクトです。荒廃していた市内五か所の里山において、地域住民とボランティアの協力のもと、間伐作業や植樹活動を実施しました。延べ参加人数は千二百名に達し、約三千本の苗木を植えることができました。\n\n質問：里山再生プロジェクトの成果として正しいものはどれですか。', E'代表は「延べ参加人数は千二百名に達し、約三千本の苗木を植えることができました」と報告しています。', 1, 6, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '延べ1,200名が参加し約3,000本の苗木を植えた', TRUE, 1),
    (gen_random_uuid(), q_id, '延べ500名が参加し1,000本の苗木を植えた', FALSE, 2),
    (gen_random_uuid(), q_id, '延べ3,000名が参加し約1,200本の苗木を植えた', FALSE, 3),
    (gen_random_uuid(), q_id, '延べ2,000名が参加し約5,000本の苗木を植えた', FALSE, 4);
END $$;

-- N1 Q7: 세부정보 (地域活性化の座談会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n佐藤：当地域にはまだ十分に活用されていない観光資源が数多くあります。温泉や伝統工芸、豊かな自然環境を組み合わせた体験型の滞在プログラムを開発することで、交流人口の拡大を図れるのではないでしょうか。\n\n質問：佐藤さんが提案した地域活性化の方策は何ですか。', E'佐藤さんは温泉・伝統工芸・自然環境を組み合わせた「体験型の滞在プログラム」で交流人口の拡大を図ることを提案しています。', 1, 7, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大規模ショッピングモールの誘致', FALSE, 1),
    (gen_random_uuid(), q_id, '工場建設の誘致', FALSE, 2),
    (gen_random_uuid(), q_id, '温泉・伝統工芸・自然環境を組み合わせた体験型滞在プログラムの開発', TRUE, 3),
    (gen_random_uuid(), q_id, '高速道路の建設', FALSE, 4);
END $$;

-- N1 Q8: 화자의도 (教育改革についての討論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n保護者代表：現場の声として申し上げますと、教員の多忙化が子どもたちの教育の質に直接影響しています。教員が一人一人の子どもと向き合う時間が不足しています。部活動の指導や事務作業の負担を軽減しなければ、いくら理想を掲げても実現は困難です。\n\n質問：保護者代表が最も伝えたかったことは何ですか。', E'保護者代表は、教員の業務負担軽減なしに教育改革は実現できないと訴えています。理想論だけでなく、現場の教員の負担を減らすことが必要だという主張です。', 1, 8, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '部活動を廃止すべきだ', FALSE, 1),
    (gen_random_uuid(), q_id, '教員をもっと採用すべきだ', FALSE, 2),
    (gen_random_uuid(), q_id, '教員の業務負担を減らさなければ教育改革は実現不可能だ', TRUE, 3),
    (gen_random_uuid(), q_id, '保護者がもっと参加すべきだ', FALSE, 4);
END $$;

-- N1 Q9: 화자의도 (文化交流シンポジウム)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n教授：制度的な整備に加えて、地域レベルでの草の根の交流こそが、真の共生社会を実現する鍵ではないでしょうか。お互いの文化を知り、日常的な接点を増やしていくことが、偏見や差別を克服する最も有効な手段だと確信しています。\n\n質問：教授が真の共生社会実現の鍵だと考えているものは何ですか。', E'教授は「地域レベルでの草の根の交流」こそが鍵だと述べ、「日常的な接点を増やす」ことが偏見克服に有効だと確信しています。', 1, 9, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '法律と制度の整備', FALSE, 1),
    (gen_random_uuid(), q_id, '外国人住民の日本語能力の向上', FALSE, 2),
    (gen_random_uuid(), q_id, '地域レベルの草の根の交流と日常的な接点の拡大', TRUE, 3),
    (gen_random_uuid(), q_id, '外国人住民数の制限', FALSE, 4);
END $$;

-- N1 Q10: 추론 (環境保護NPOの活動報告)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n代表：課題としましては、活動資金の確保が依然として厳しい状況にあります。会員数は増加傾向にあるものの、助成金への依存度が高く、自主財源の多様化が必要です。\n事務局長：来年度の展望としましては、企業との協働事業の拡大や、クラウドファンディングの活用など、新たな資金調達の仕組みを構築してまいります。\n\n質問：このNPOの最大の課題と今後の対策として正しい組み合わせはどれですか。', E'課題は「活動資金の確保」で「助成金への依存度が高い」こと。対策は「企業との協働事業」「クラウドファンディング」など新たな資金調達方法の構築です。', 1, 10, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会員減少 - 会費値上げで対応', FALSE, 1),
    (gen_random_uuid(), q_id, 'ボランティア不足 - 有給職員の採用', FALSE, 2),
    (gen_random_uuid(), q_id, '活動資金の確保困難 - 企業協働とクラウドファンディングの活用', TRUE, 3),
    (gen_random_uuid(), q_id, '活動範囲の縮小 - 他地域NPOとの統合', FALSE, 4);
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
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、ゆうびんきょくは どこですか。\nB：まっすぐ いって、つぎの かどを みぎに まがってください。ひだりがわに あります。\nA：ありがとうございます。\n\n質問：ゆうびんきょくは どちらに まがりますか？', E'「みぎに まがってください」と言っています。오른쪽으로 돕니다。', 1, 11, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左', FALSE, 1),
    (gen_random_uuid(), q_id, '右', TRUE, 2),
    (gen_random_uuid(), q_id, 'まっすぐ', FALSE, 3),
    (gen_random_uuid(), q_id, '後ろ', FALSE, 4);
END $$;

-- N5 Q12: 세부정보 (買い物 - 数量)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：いらっしゃいませ。\n客：りんごを 5つ ください。\n店員：すみません、きょうは 3つしか ありません。\n客：じゃ、3つ ください。\n\n質問：おきゃくさんは りんごを いくつ かいますか？', E'「3つしかありません」と言われ、「3つください」と答えています。3개 삽니다。', 1, 12, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5つ', FALSE, 1),
    (gen_random_uuid(), q_id, '3つ', TRUE, 2),
    (gen_random_uuid(), q_id, '2つ', FALSE, 3),
    (gen_random_uuid(), q_id, '買わない', FALSE, 4);
END $$;

-- N5 Q13: 화자의도 (お願い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：あした、いっしょに としょかんに いきませんか。\nB：いいですね。なんじに いきますか。\nA：10じは どうですか。\nB：10じは ちょっと はやいです。11じに しましょう。\nA：わかりました。\n\n質問：ふたりは なんじに いきますか？', E'Bが「11じにしましょう」と提案し、Aが「わかりました」と答えています。11시에 갑니다。', 1, 13, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '9時', FALSE, 1),
    (gen_random_uuid(), q_id, '10時', FALSE, 2),
    (gen_random_uuid(), q_id, '11時', TRUE, 3),
    (gen_random_uuid(), q_id, '12時', FALSE, 4);
END $$;

-- N5 Q14: 내용이해 (自己紹介)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：はじめまして。わたしは キムです。かんこくから きました。\nB：はじめまして。たなかです。キムさんの しゅみは なんですか。\nA：りょうりが すきです。にほんの りょうりを つくりたいです。\n\n質問：キムさんは なにが すきですか？', E'「りょうりが すきです」と言っています。요리를 좋아합니다。', 1, 14, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '読書', FALSE, 1),
    (gen_random_uuid(), q_id, '料理', TRUE, 2),
    (gen_random_uuid(), q_id, '音楽', FALSE, 3),
    (gen_random_uuid(), q_id, '運動', FALSE, 4);
END $$;

-- N5 Q15: 세부정보 (天気と服装)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：きょうは さむいですね。\nB：そうですね。コートを きたほうが いいですよ。\nA：はい。ぼうしも かぶります。\nB：いいですね。\n\n質問：Aさんは なにを きますか？', E'「コートを きた」と「ぼうしも かぶります」と言っています。코트와 모자입니다。', 1, 15, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コートだけ', FALSE, 1),
    (gen_random_uuid(), q_id, '帽子だけ', FALSE, 2),
    (gen_random_uuid(), q_id, 'コートと帽子', TRUE, 3),
    (gen_random_uuid(), q_id, 'マフラーだけ', FALSE, 4);
END $$;

-- N5 Q16: 화자의도 (断り)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：どようび、パーティーに きませんか。\nB：すみません、どようびは ちょっと…。\nA：そうですか。ざんねんですね。\nB：ほんとうに すみません。\n\n質問：Bさんは パーティーに いきますか？', E'「ちょっと…」は断りの表現です。Bさんはパーティーに行けません。가지 않습니다。', 1, 16, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '行く', FALSE, 1),
    (gen_random_uuid(), q_id, '行かない', TRUE, 2),
    (gen_random_uuid(), q_id, '遅れて行く', FALSE, 3),
    (gen_random_uuid(), q_id, 'まだわからない', FALSE, 4);
END $$;

-- N5 Q17: 내용이해 (学校で)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nせんせい：あしたは テストが あります。きょうかしょの 1ページから 20ページまでです。\nがくせい：せんせい、ノートも ひつようですか。\nせんせい：いいえ、えんぴつと けしゴムだけ もってきてください。\n\n質問：テストに なにを もっていきますか？', E'「えんぴつと けしゴムだけ」と言っています。연필과 지우개만 가져갑니다。', 1, 17, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '教科書とノート', FALSE, 1),
    (gen_random_uuid(), q_id, '鉛筆と消しゴム', TRUE, 2),
    (gen_random_uuid(), q_id, 'ノートと鉛筆', FALSE, 3),
    (gen_random_uuid(), q_id, '何も必要ない', FALSE, 4);
END $$;

-- N5 Q18: 세부정보 (予約)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：おでんわ ありがとうございます。さくらレストランです。\n客：よやくを おねがいします。あしたの 7じに 4にんです。\n店員：7じですね。おなまえを おねがいします。\n客：パクです。\n\n質問：なんにんで よやくしましたか？', E'「4にんです」と言っています。4명으로 예약했습니다。', 1, 18, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2人', FALSE, 1),
    (gen_random_uuid(), q_id, '3人', FALSE, 2),
    (gen_random_uuid(), q_id, '4人', TRUE, 3),
    (gen_random_uuid(), q_id, '5人', FALSE, 4);
END $$;

-- N5 Q19: 추론 (感情)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：きょう、テストの けっかが でました。\nB：どうでしたか。\nA：90てんでした！\nB：すごいですね！おめでとうございます。\nA：ありがとうございます。とても うれしいです。\n\n質問：Aさんは いま どんな きもちですか？', E'「とても うれしいです」と言っています。매우 기쁜 기분입니다。', 1, 19, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '悲しい', FALSE, 1),
    (gen_random_uuid(), q_id, 'うれしい', TRUE, 2),
    (gen_random_uuid(), q_id, '怒っている', FALSE, 3),
    (gen_random_uuid(), q_id, '心配だ', FALSE, 4);
END $$;

-- N5 Q20: 내용이해 (日常の予定)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：にちようびは なにを しますか。\nB：ごぜんは せんたくを します。ごごは かいものに いきます。\nA：よるは？\nB：テレビを みます。\n\n質問：Bさんは ごごに なにを しますか？', E'「ごごは かいものに いきます」と言っています。오후에는 쇼핑을 갑니다。', 1, 20, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '洗濯', FALSE, 1),
    (gen_random_uuid(), q_id, '買い物', TRUE, 2),
    (gen_random_uuid(), q_id, 'テレビを見る', FALSE, 3),
    (gen_random_uuid(), q_id, '料理', FALSE, 4);
END $$;

-- N5 Q21-Q30 (remaining 10)
-- N5 Q21: 세부정보 (交通手段)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：がっこうまで どうやって いきますか。\nB：バスで いきます。20ぷん ぐらいです。\nA：でんしゃは つかいませんか。\nB：えきが とおいですから、バスの ほうが べんりです。\n\n質問：Bさんは なぜ バスで いきますか？', E'「えきが とおい」のでバスの方が便利と言っています。역이 멀기 때문에 버스가 편리합니다。', 1, 21, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バスが安いから', FALSE, 1),
    (gen_random_uuid(), q_id, '駅が遠いのでバスが便利だから', TRUE, 2),
    (gen_random_uuid(), q_id, '電車がないから', FALSE, 3),
    (gen_random_uuid(), q_id, '歩きたいから', FALSE, 4);
END $$;

-- N5 Q22: 화자의도 (提案)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：あたまが いたいです。\nB：だいじょうぶですか。くすりを のんだほうが いいですよ。\nA：くすりが ありません。\nB：じゃ、わたしの くすりを あげましょう。\n\n質問：Bさんは なにを してあげますか？', E'「わたしの くすりを あげましょう」と言っています。자신의 약을 줍니다。', 1, 22, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '病院に連れて行く', FALSE, 1),
    (gen_random_uuid(), q_id, '薬をあげる', TRUE, 2),
    (gen_random_uuid(), q_id, '水をあげる', FALSE, 3),
    (gen_random_uuid(), q_id, '休ませる', FALSE, 4);
END $$;

-- N5 Q23: 내용이해 (食事)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：おひるごはん、なにを たべますか。\nB：ラーメンが いいです。\nA：わたしは カレーに します。\nB：あ、わたしも カレーに しましょう。\n\n質問：ふたりは なにを たべますか？', E'Bが「わたしもカレーにしましょう」と変更したので、二人ともカレーを食べます。둘 다 카레를 먹습니다。', 1, 23, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ラーメン', FALSE, 1),
    (gen_random_uuid(), q_id, 'カレー', TRUE, 2),
    (gen_random_uuid(), q_id, '別々のもの', FALSE, 3),
    (gen_random_uuid(), q_id, 'うどん', FALSE, 4);
END $$;

-- N5 Q24: 세부정보 (場所)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、トイレは どこですか。\nB：あのエレベーターの そばに あります。2かいです。\nA：ありがとうございます。\n\n質問：トイレは なんかいに ありますか？', E'「2かいです」と言っています。2층에 있습니다。', 1, 24, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1階', FALSE, 1),
    (gen_random_uuid(), q_id, '2階', TRUE, 2),
    (gen_random_uuid(), q_id, '3階', FALSE, 3),
    (gen_random_uuid(), q_id, '地下1階', FALSE, 4);
END $$;

-- N5 Q25: 추론 (体調)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：どうしましたか。かおが あかいですよ。\nB：ちょっと ねつが あるみたいです。\nA：はやく うちに かえった ほうが いいですよ。\nB：そうですね。せんせいに いって かえります。\n\n質問：Bさんは これから なにを しますか？', E'先生に言って帰ると言っています。선생님께 말씀드리고 집에 돌아갑니다。', 1, 25, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '病院に行く', FALSE, 1),
    (gen_random_uuid(), q_id, '先生に言って家に帰る', TRUE, 2),
    (gen_random_uuid(), q_id, '勉強を続ける', FALSE, 3),
    (gen_random_uuid(), q_id, '薬を飲む', FALSE, 4);
END $$;

-- N5 Q26: 내용이해 (趣味)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：やすみの ひは なにを していますか。\nB：えいがを みたり、ほんを よんだりしています。\nA：どんな えいがが すきですか。\nB：アクションえいがが すきです。\n\n質問：Bさんが すきな えいがは なんですか？', E'「アクションえいがが すきです」と言っています。액션 영화를 좋아합니다。', 1, 26, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ホラー映画', FALSE, 1),
    (gen_random_uuid(), q_id, 'アクション映画', TRUE, 2),
    (gen_random_uuid(), q_id, 'ロマンス映画', FALSE, 3),
    (gen_random_uuid(), q_id, 'コメディ映画', FALSE, 4);
END $$;

-- N5 Q27: 세부정보 (値段)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：この ノートは いくらですか。\nB：150えんです。\nA：じゃ、2つ ください。\nB：ぜんぶで 300えんです。\n\n質問：ノート 1つの ねだんは いくらですか？', E'「150えんです」と言っています。1개에 150엔입니다。', 1, 27, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '100円', FALSE, 1),
    (gen_random_uuid(), q_id, '150円', TRUE, 2),
    (gen_random_uuid(), q_id, '200円', FALSE, 3),
    (gen_random_uuid(), q_id, '300円', FALSE, 4);
END $$;

-- N5 Q28: 화자의도 (誘い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：あした、うみに いきませんか。\nB：いいですね。でも あしたは あめかもしれません。\nA：じゃ、あさっては どうですか。\nB：あさっては はれですから、いいですよ。\n\n質問：ふたりは いつ うみに いきますか？', E'「あさっては はれですから、いいですよ」で合意しました。모레 갑니다。', 1, 28, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今日', FALSE, 1),
    (gen_random_uuid(), q_id, '明日', FALSE, 2),
    (gen_random_uuid(), q_id, '明後日', TRUE, 3),
    (gen_random_uuid(), q_id, '行かない', FALSE, 4);
END $$;

-- N5 Q29: 추론 (家族の話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：きょうだいは いますか。\nB：はい、あねが ひとり います。\nA：おねえさんは なにを していますか。\nB：びょういんで はたらいています。\n\n質問：Bさんの おねえさんの しごとは なんですか？', E'「びょういんで はたらいています」と言っています。병원에서 일하고 있습니다。', 1, 29, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '先生', FALSE, 1),
    (gen_random_uuid(), q_id, '病院勤務', TRUE, 2),
    (gen_random_uuid(), q_id, '会社員', FALSE, 3),
    (gen_random_uuid(), q_id, '学生', FALSE, 4);
END $$;

-- N5 Q30: 내용이해 (休みの計画)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：なつやすみは なにを しますか。\nB：くにに かえります。\nA：いいですね。なんにち ぐらい かえりますか。\nB：2しゅうかん ぐらいです。\n\n質問：Bさんは なつやすみに なにを しますか？', E'「くにに かえります」と言っています。고향에 돌아갑니다。', 1, 30, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '旅行に行く', FALSE, 1),
    (gen_random_uuid(), q_id, '国に帰る', TRUE, 2),
    (gen_random_uuid(), q_id, 'アルバイトをする', FALSE, 3),
    (gen_random_uuid(), q_id, '日本にいる', FALSE, 4);
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
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n面接官：アルバイトの経験はありますか。\n応募者：はい、韓国でカフェで1年間働いていました。\n面接官：日本語はどのくらいできますか。\n応募者：日常会話なら大丈夫です。\n面接官：勤務時間は週3日、夕方5時から9時までですが、よろしいですか。\n応募者：はい、大丈夫です。\n\n質問：このアルバイトの勤務時間は？', E'「夕方5時から9時まで」と言っています。오후 5시부터 9시까지입니다。', 1, 11, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '午前9時〜午後1時', FALSE, 1),
    (gen_random_uuid(), q_id, '午後5時〜9時', TRUE, 2),
    (gen_random_uuid(), q_id, '午後1時〜5時', FALSE, 3),
    (gen_random_uuid(), q_id, '午後3時〜7時', FALSE, 4);
END $$;

-- N4 Q12: 세부정보 (病院の受付)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n受付：どうなさいましたか。\n患者：3日前から頭が痛くて、熱もあります。\n受付：今の体温は何度ですか。\n患者：今朝測ったら38度2分でした。\n受付：保険証をお持ちですか。\n患者：はい、ここにあります。\n\n質問：患者さんの体温は何度ですか？', E'「38度2分」と言っています。38.2도입니다。', 1, 12, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '37.5度', FALSE, 1),
    (gen_random_uuid(), q_id, '38.2度', TRUE, 2),
    (gen_random_uuid(), q_id, '39度', FALSE, 3),
    (gen_random_uuid(), q_id, '36.8度', FALSE, 4);
END $$;

-- N4 Q13: 화자의도 (旅行の相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：今度の連休、どこかに行きたいんだけど。\nB：京都はどう？紅葉がきれいだよ。\nA：京都はこの前行ったばかりだから、他のところがいいな。\nB：じゃ、大阪は？食べ物がおいしいよ。\nA：いいね！大阪にしよう。\n\n質問：二人はどこに行くことにしましたか？', E'「大阪にしよう」と決まりました。오사카로 결정했습니다。', 1, 13, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '京都', FALSE, 1),
    (gen_random_uuid(), q_id, '大阪', TRUE, 2),
    (gen_random_uuid(), q_id, '東京', FALSE, 3),
    (gen_random_uuid(), q_id, '奈良', FALSE, 4);
END $$;

-- N4 Q14: 내용이해 (引っ越し)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：来月引っ越すんだ。\nB：どこに引っ越すの？\nA：会社の近くのマンション。駅から歩いて3分だよ。\nB：いいね。家賃は高い？\nA：今のアパートより少し高いけど、通勤が楽になるから。\n\n質問：Aさんが引っ越す理由は何ですか？', E'「通勤が楽になるから」と言っています。통근이 편해지기 때문입니다。', 1, 14, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '家賃が安くなるから', FALSE, 1),
    (gen_random_uuid(), q_id, '通勤が楽になるから', TRUE, 2),
    (gen_random_uuid(), q_id, '部屋が広いから', FALSE, 3),
    (gen_random_uuid(), q_id, '周辺環境がいいから', FALSE, 4);
END $$;

-- N4 Q15: 세부정보 (スケジュール)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先生：来週の授業スケジュールをお知らせします。月曜日は文法、火曜日は読解、水曜日は会話、木曜日はテスト、金曜日は復習です。\n学生：先生、テストの範囲はどこですか。\n先生：教科書の第5課から第8課までです。\n\n質問：テストは何曜日ですか？', E'「木曜日はテスト」と言っています。목요일입니다。', 1, 15, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '水曜日', FALSE, 1),
    (gen_random_uuid(), q_id, '木曜日', TRUE, 2),
    (gen_random_uuid(), q_id, '金曜日', FALSE, 3),
    (gen_random_uuid(), q_id, '火曜日', FALSE, 4);
END $$;

-- N4 Q16-Q20
-- N4 Q16: 화자의도 (プレゼント)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：田中さんの誕生日プレゼント、何がいいかな。\nB：田中さん、コーヒーが好きだから、マグカップはどう？\nA：マグカップは去年あげたよ。\nB：じゃ、コーヒー豆のセットは？\nA：それ、いいね！\n\n質問：二人は何をプレゼントすることにしましたか？', E'「コーヒー豆のセット」に決まりました。커피 원두 세트입니다。', 1, 16, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'マグカップ', FALSE, 1),
    (gen_random_uuid(), q_id, 'コーヒー豆のセット', TRUE, 2),
    (gen_random_uuid(), q_id, 'ケーキ', FALSE, 3),
    (gen_random_uuid(), q_id, '本', FALSE, 4);
END $$;

-- N4 Q17: 추론 (相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：最近、日本語の勉強が大変で…。漢字が全然覚えられないんです。\nB：毎日少しずつ書くのがいいですよ。\nA：どのくらい勉強すればいいですか。\nB：1日10個ぐらいから始めてみたら？\nA：なるほど。やってみます。\n\n質問：Bさんのアドバイスは何ですか？', E'「毎日少しずつ書く」「1日10個ぐらいから」と提案しています。매일 조금씩 쓰기, 하루 10개부터 시작하기입니다。', 1, 17, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '漢字の勉強をあきらめる', FALSE, 1),
    (gen_random_uuid(), q_id, '毎日少しずつ書いて1日10個から始める', TRUE, 2),
    (gen_random_uuid(), q_id, '塾に通う', FALSE, 3),
    (gen_random_uuid(), q_id, 'アプリで勉強する', FALSE, 4);
END $$;

-- N4 Q18: 내용이해 (買い物)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n客：この靴、サイズはありますか。26センチがほしいんですが。\n店員：すみません、26は売り切れです。25.5か26.5ならあります。\n客：じゃ、26.5を試してみます。\n店員：はい、こちらをどうぞ。\n\n質問：お客さんは何センチの靴を試しますか？', E'「26.5を試してみます」と言っています。26.5cm를 신어봅니다。', 1, 18, 'N4', 'listening');
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
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、市役所はどう行けばいいですか。\nB：この道をまっすぐ行って、2つ目の信号を左に曲がってください。右側に大きな建物が見えます。\nA：歩いてどのくらいかかりますか。\nB：10分ぐらいです。\n\n質問：市役所まで歩いて何分かかりますか？', E'「10分ぐらい」と言っています。약 10분입니다。', 1, 19, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5分', FALSE, 1),
    (gen_random_uuid(), q_id, '10分', TRUE, 2),
    (gen_random_uuid(), q_id, '15分', FALSE, 3),
    (gen_random_uuid(), q_id, '20分', FALSE, 4);
END $$;

-- N4 Q20: 추론 (約束の変更)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：もしもし、明日の約束なんだけど…。\nB：うん、2時に駅前で会うよね？\nA：ごめん、ちょっと仕事が入って。3時に変えてもいい？\nB：いいよ。場所は同じ？\nA：うん、駅前のカフェで待ってるね。\n\n質問：約束の時間はどう変わりましたか？', E'2時から3時に変更されました。2시에서 3시로 변경되었습니다。', 1, 20, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1時から2時に', FALSE, 1),
    (gen_random_uuid(), q_id, '2時から3時に', TRUE, 2),
    (gen_random_uuid(), q_id, '3時から4時に', FALSE, 3),
    (gen_random_uuid(), q_id, '変更なし', FALSE, 4);
END $$;

-- N4 Q21-Q30
-- N4 Q21: 내용이해 (週末の予定)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：週末、一緒に映画を見に行かない？\nB：土曜日は用事があるんだけど、日曜日なら空いてるよ。\nA：じゃ、日曜日の午後はどう？\nB：午前中に掃除したいから、1時以降がいいな。\nA：わかった。2時にしよう。\n\n質問：二人は何時に映画を見ますか？', E'「2時にしよう」と決まりました。2시에 영화를 봅니다。', 1, 21, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '午前11時', FALSE, 1),
    (gen_random_uuid(), q_id, '午後1時', FALSE, 2),
    (gen_random_uuid(), q_id, '午後2時', TRUE, 3),
    (gen_random_uuid(), q_id, '午後3時', FALSE, 4);
END $$;

-- N4 Q22: 화자의도 (お礼とお詫び)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：先週貸してもらった本、とてもおもしろかったです。ありがとうございました。\nB：よかった。気に入ってもらえてうれしいよ。\nA：でも、すみません、少し汚してしまいました。\nB：大丈夫、気にしないで。\n\n質問：Aさんが謝っている理由は何ですか？', E'「少し汚してしまいました」と言っています。책을 조금 더럽혀서 사과하고 있습니다。', 1, 22, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本をなくしたから', FALSE, 1),
    (gen_random_uuid(), q_id, '本を少し汚してしまったから', TRUE, 2),
    (gen_random_uuid(), q_id, '本を返していないから', FALSE, 3),
    (gen_random_uuid(), q_id, '本がつまらなかったから', FALSE, 4);
END $$;

-- N4 Q23: 세부정보 (レストランで)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：ご注文はお決まりですか。\n客A：私はハンバーグ定食をお願いします。\n客B：私は焼き魚定食で。飲み物はオレンジジュースをください。\n店員：ハンバーグ定食と焼き魚定食、オレンジジュースですね。お飲み物はお一つでよろしいですか。\n客A：あ、私もお茶をください。\n\n質問：飲み物は全部でいくつ注文しましたか？', E'オレンジジュースとお茶で2つです。음료는 총 2개 주문했습니다。', 1, 23, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1つ', FALSE, 1),
    (gen_random_uuid(), q_id, '2つ', TRUE, 2),
    (gen_random_uuid(), q_id, '3つ', FALSE, 3),
    (gen_random_uuid(), q_id, '注文していない', FALSE, 4);
END $$;

-- N4 Q24: 추론 (仕事の話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：新しい仕事はどう？\nB：仕事は楽しいんだけど、毎日残業が多くて…。\nA：大変だね。何時ごろ帰るの？\nB：だいたい9時か10時。もう少し早く帰りたいな。\n\n質問：Bさんの悩みは何ですか？', E'「毎日残業が多くて」「もう少し早く帰りたい」と言っています。잔업이 많아서 일찍 퇴근하고 싶다는 것입니다。', 1, 24, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '仕事が難しい', FALSE, 1),
    (gen_random_uuid(), q_id, '残業が多くて早く帰りたい', TRUE, 2),
    (gen_random_uuid(), q_id, '給料が低い', FALSE, 3),
    (gen_random_uuid(), q_id, '同僚との関係がよくない', FALSE, 4);
END $$;

-- N4 Q25: 내용이해 (季節の会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：桜がきれいですね。\nB：本当ですね。今週末、花見をしませんか。\nA：いいですね。どこでしましょうか。\nB：上野公園はどうですか。有名ですよ。\nA：いいですね。お弁当を作っていきましょう。\n\n質問：二人はどこで花見をしますか？', E'「上野公園」で花見をします。우에노 공원에서 꽃구경합니다。', 1, 25, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '新宿公園', FALSE, 1),
    (gen_random_uuid(), q_id, '上野公園', TRUE, 2),
    (gen_random_uuid(), q_id, '代々木公園', FALSE, 3),
    (gen_random_uuid(), q_id, '日比谷公園', FALSE, 4);
END $$;

-- N4 Q26: 세부정보 (携帯電話の契約)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n店員：月額プランは3つあります。3GBで1980円、10GBで2980円、無制限で4980円です。\n客：動画をよく見るから、10GBでは足りないかな。\n店員：それなら無制限がおすすめです。\n客：じゃ、無制限プランにします。\n\n質問：お客さんが選んだプランはいくらですか？', E'「無制限プラン」を選び、それは4980円です。4980엔입니다。', 1, 26, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1980円', FALSE, 1),
    (gen_random_uuid(), q_id, '2980円', FALSE, 2),
    (gen_random_uuid(), q_id, '4980円', TRUE, 3),
    (gen_random_uuid(), q_id, '5980円', FALSE, 4);
END $$;

-- N4 Q27: 화자의도 (お見舞い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：山田さん、入院したらしいよ。\nB：えっ、大丈夫かな。お見舞いに行こうよ。\nA：うん。果物でも持っていこうか。\nB：いいね。メロンとかどう？\nA：メロンは高いから、りんごにしよう。\n\n質問：二人は何を持っていくことにしましたか？', E'「りんごにしよう」と決まりました。사과를 가져가기로 했습니다。', 1, 27, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メロン', FALSE, 1),
    (gen_random_uuid(), q_id, 'りんご', TRUE, 2),
    (gen_random_uuid(), q_id, '花', FALSE, 3),
    (gen_random_uuid(), q_id, 'ケーキ', FALSE, 4);
END $$;

-- N4 Q28: 내용이해 (アナウンス)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nお客様にお知らせいたします。本日は悪天候のため、3番線の電車が15分ほど遅れて運行しております。ご迷惑をおかけして申し訳ございません。なお、1番線と2番線は通常通り運行しております。\n\n質問：遅れているのは何番線ですか？', E'「3番線の電車が15分ほど遅れて」と言っています。3번 선이 지연되고 있습니다。', 1, 28, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1番線', FALSE, 1),
    (gen_random_uuid(), q_id, '2番線', FALSE, 2),
    (gen_random_uuid(), q_id, '3番線', TRUE, 3),
    (gen_random_uuid(), q_id, '全路線', FALSE, 4);
END $$;

-- N4 Q29: 추론 (留学の感想)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：日本に来て半年たったね。どう？\nB：最初は大変だったけど、今は慣れたよ。\nA：日本語も上手になったね。\nB：ありがとう。でも敬語がまだ難しい。会社で使うとき、いつも緊張するんだ。\n\n質問：Bさんが今も難しいと感じていることは何ですか？', E'「敬語がまだ難しい」と言っています。존경어가 아직 어렵다고 합니다。', 1, 29, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日常会話', FALSE, 1),
    (gen_random_uuid(), q_id, '敬語（尊敬語）', TRUE, 2),
    (gen_random_uuid(), q_id, '漢字の読み', FALSE, 3),
    (gen_random_uuid(), q_id, '発音', FALSE, 4);
END $$;

-- N4 Q30: 세부정보 (講義の案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n特別講演のお知らせ\n題目：「IT業界で活躍するために」\n講師：佐藤太郎氏（元Google日本法人）\n日時：5月20日（土）14:00〜16:00\n場所：5階 大会議室\n参加費：無料（要事前登録）\n\n質問：この講演に参加するために必要なことは何ですか？', E'「要事前登録」と書いてあります。사전 등록이 필요합니다。', 1, 30, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '参加費を払う', FALSE, 1),
    (gen_random_uuid(), q_id, '事前登録をする', TRUE, 2),
    (gen_random_uuid(), q_id, '学生証を見せる', FALSE, 3),
    (gen_random_uuid(), q_id, '推薦書をもらう', FALSE, 4);
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
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：田中さん、来週の会議の資料、できてる？\n田中：はい、8割ぐらいできています。金曜日までに完成させます。\n課長：ちょっと急いでほしいんだけど、水曜日までにもらえないかな。\n田中：わかりました。水曜日の午前中に提出します。\n\n質問：田中さんはいつまでに資料を出しますか？', E'「水曜日の午前中に提出します」と答えています。수요일 오전까지 제출합니다。', 1, 11, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '月曜日', FALSE, 1),
    (gen_random_uuid(), q_id, '水曜日の午前', TRUE, 2),
    (gen_random_uuid(), q_id, '金曜日', FALSE, 3),
    (gen_random_uuid(), q_id, '木曜日', FALSE, 4);
END $$;

-- N3 Q12: 세부정보 (マンション説明会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n担当者：このマンションは駅から徒歩5分で、築3年の物件です。\n客：家賃はいくらですか。\n担当者：月8万5千円です。管理費が5千円かかります。\n客：合計で月9万円ということですね。\n担当者：はい、そうです。\n\n質問：月々の支払い合計はいくらですか？', E'家賃8万5千円＋管理費5千円＝9万円です。월 합계 9만엔입니다。', 1, 12, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8万5千円', FALSE, 1),
    (gen_random_uuid(), q_id, '9万円', TRUE, 2),
    (gen_random_uuid(), q_id, '9万5千円', FALSE, 3),
    (gen_random_uuid(), q_id, '10万円', FALSE, 4);
END $$;

-- N3 Q13: 화자의도 (上司との会話)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：このプレゼン資料、よくできてるけど、グラフがちょっと見にくいかな。\n社員：そうですか。色を変えたほうがいいですか。\n部長：うん、もう少しコントラストをつけてくれると助かる。あと、フォントも大きくしたほうがいいかもしれないね。\n\n質問：部長が直してほしいことは何ですか？', E'グラフの色のコントラストとフォントのサイズです。그래프 색상 대비와 글꼴 크기입니다。', 1, 13, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プレゼンテーションの内容', FALSE, 1),
    (gen_random_uuid(), q_id, 'グラフの色のコントラストとフォントの大きさ', TRUE, 2),
    (gen_random_uuid(), q_id, 'データの正確性', FALSE, 3),
    (gen_random_uuid(), q_id, 'ページ数', FALSE, 4);
END $$;

-- N3 Q14: 추론 (IT企業の面接)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n面接官：弊社を志望した理由を教えてください。\n応募者：御社のグローバルな開発環境に魅力を感じました。多国籍のチームで開発することで、技術力だけでなく、異文化コミュニケーション能力も高められると考えています。\n面接官：当社ではどのようなキャリアを目指したいですか。\n応募者：将来的にはプロジェクトマネージャーとして、国際プロジェクトをリードしたいと考えています。\n\n質問：応募者の将来の目標は何ですか？', E'「プロジェクトマネージャーとして国際プロジェクトをリード」と言っています。PM으로서 국제 프로젝트를 이끄는 것입니다。', 1, 14, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フリーランス開発者になること', FALSE, 1),
    (gen_random_uuid(), q_id, 'PMとして国際プロジェクトをリードすること', TRUE, 2),
    (gen_random_uuid(), q_id, '自分の会社を起業すること', FALSE, 3),
    (gen_random_uuid(), q_id, '海外支社に転勤すること', FALSE, 4);
END $$;

-- N3 Q15: 내용이해 (研修案内)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n新入社員研修のお知らせです。研修は4月1日から5日までの5日間で行われます。初日はオリエンテーション、2日目から4日目までは部署別研修、最終日は全体振り返りとなっています。持ち物はノートPCと筆記用具です。\n\n質問：部署別研修は何日間ありますか？', E'2日目から4日目までなので3日間です。3일간입니다。', 1, 15, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2日間', FALSE, 1),
    (gen_random_uuid(), q_id, '3日間', TRUE, 2),
    (gen_random_uuid(), q_id, '4日間', FALSE, 3),
    (gen_random_uuid(), q_id, '5日間', FALSE, 4);
END $$;

-- N3 Q16: 세부정보 (プロジェクト進捗)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nPM：プロジェクトの進捗を報告してください。\n開発者：設計は100%完了しています。コーディングは70%ぐらいです。テストはまだ始めていません。\nPM：テストはいつから始められますか。\n開発者：来週の火曜日からは可能です。\n\n質問：コーディングの進捗は何パーセントですか？', E'「コーディングは70%ぐらい」と報告しています。약 70%입니다。', 1, 16, 'N3', 'listening');
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
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n客：すみません、先週注文した商品がまだ届かないんですが。\n店員：大変申し訳ございません。確認いたしますので、注文番号を教えていただけますか。\n客：12345です。\n店員：確認しました。配送に遅れが出ておりまして、明日中にはお届けできる見込みです。\n\n質問：商品はいつ届きますか？', E'「明日中にはお届けできる」と言っています。내일 중으로 배달될 예정입니다。', 1, 17, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今日中', FALSE, 1),
    (gen_random_uuid(), q_id, '明日中', TRUE, 2),
    (gen_random_uuid(), q_id, '今週末', FALSE, 3),
    (gen_random_uuid(), q_id, '来週', FALSE, 4);
END $$;

-- N3 Q18: 추론 (チームミーティング)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nリーダー：来月のリリースに向けて、タスクの優先順位を決めましょう。バグ修正、新機能の開発、パフォーマンス改善、ドキュメント作成があります。\nメンバーA：バグ修正が一番大事じゃないですか。ユーザーからのクレームが来てますし。\nリーダー：その通りだね。バグ修正を最優先にして、次に新機能にしよう。\n\n質問：最優先のタスクは何ですか？', E'「バグ修正を最優先」と決まりました。버그 수정이 최우선입니다。', 1, 18, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '新機能の開発', FALSE, 1),
    (gen_random_uuid(), q_id, 'バグ修正', TRUE, 2),
    (gen_random_uuid(), q_id, 'パフォーマンス改善', FALSE, 3),
    (gen_random_uuid(), q_id, 'ドキュメント作成', FALSE, 4);
END $$;

-- N3 Q19-Q24: 6 more questions
-- N3 Q19: 내용이해 (会社説明)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社長：うちの会社は社員の成長を大切にしています。年に2回、スキルアップのための研修費を会社が負担します。上限は1回5万円です。\n社員：オンライン講座も対象ですか。\n社長：はい、書籍購入やセミナー参加も含めて、全て対象です。\n\n質問：研修費の上限は1回いくらですか？', E'「上限は1回5万円」と言っています。1회 5만엔이 상한입니다。', 1, 19, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3万円', FALSE, 1),
    (gen_random_uuid(), q_id, '5万円', TRUE, 2),
    (gen_random_uuid(), q_id, '10万円', FALSE, 3),
    (gen_random_uuid(), q_id, '上限なし', FALSE, 4);
END $$;

-- N3 Q20: 세부정보 (システム障害)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：すみません、社内システムにログインできないんですが。\nB：今、サーバーの障害が発生していまして、復旧作業中です。\nA：いつ頃直りますか。\nB：あと1時間ぐらいで復旧する予定です。復旧したらメールでお知らせします。\n\n質問：システムはどのくらいで復旧しますか？', E'「あと1時間ぐらいで復旧する予定」と言っています。약 1시간 후 복구 예정입니다。', 1, 20, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30分', FALSE, 1),
    (gen_random_uuid(), q_id, '1時間', TRUE, 2),
    (gen_random_uuid(), q_id, '3時間', FALSE, 3),
    (gen_random_uuid(), q_id, 'わからない', FALSE, 4);
END $$;

-- N3 Q21: 화자의도 (相談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n後輩：先輩、プログラミングを独学で勉強しているんですが、なかなか上達しなくて。\n先輩：教科書だけじゃなくて、実際にプロジェクトを作ってみるといいよ。自分でアプリを一つ作ると、理解が深まるから。\n後輩：どんなアプリがいいですか。\n先輩：まずはToDoアプリみたいな簡単なものから始めたらいいと思う。\n\n質問：先輩のアドバイスは何ですか？', E'実際にプロジェクトを作ることを勧めています。실제로 프로젝트를 만들어보라고 조언합니다。', 1, 21, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '教科書をもっと読む', FALSE, 1),
    (gen_random_uuid(), q_id, '実際にアプリを作ってみる', TRUE, 2),
    (gen_random_uuid(), q_id, 'プログラミング塾に通う', FALSE, 3),
    (gen_random_uuid(), q_id, '資格試験を受ける', FALSE, 4);
END $$;

-- N3 Q22: 추론 (転職の悩み)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：実は転職を考えていて。今の会社は安定しているけど、新しいことに挑戦したいんだ。\nB：気持ちはわかるけど、今のスキルをもう少し磨いてからのほうがいいんじゃない？\nA：そうかな。確かに、まだ2年目だし。\nB：3年ぐらい経験を積んでから転職したほうが、条件もよくなると思うよ。\n\n質問：Bさんが勧めていることは何ですか？', E'もう少し経験を積んでから転職することを勧めています。좀 더 경험을 쌓고 나서 이직하라고 조언합니다。', 1, 22, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今すぐ転職する', FALSE, 1),
    (gen_random_uuid(), q_id, 'もう少し経験を積んでから転職する', TRUE, 2),
    (gen_random_uuid(), q_id, '転職をあきらめる', FALSE, 3),
    (gen_random_uuid(), q_id, '副業を始める', FALSE, 4);
END $$;

-- N3 Q23-Q30: remaining 8 questions compressed
-- N3 Q23: 내용이해 (飲み会の幹事)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：歓迎会の幹事を頼まれたんだけど、いい店知らない？\nB：駅前のイタリアンはどう？飲み放題つきで一人4000円だよ。\nA：人数は15人ぐらいなんだけど、入れるかな。\nB：個室があるから大丈夫だと思う。予約しておこうか？\nA：お願い。金曜日の19時で。\n\n質問：一人あたりの金額はいくらですか？', E'「一人4000円」と言っています。1인당 4000엔입니다。', 1, 23, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3000円', FALSE, 1),
    (gen_random_uuid(), q_id, '4000円', TRUE, 2),
    (gen_random_uuid(), q_id, '5000円', FALSE, 3),
    (gen_random_uuid(), q_id, '6000円', FALSE, 4);
END $$;

-- N3 Q24: 세부정보 (健康診断)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n社員の皆様へ。来月の健康診断についてお知らせします。日程は6月10日から14日の間で、各自都合のいい日を選んでください。前日の夜9時以降は食事を取らないでください。当日は受付で保険証を提示してください。\n\n質問：健康診断の前日に注意すべきことは何ですか？', E'「前日の夜9時以降は食事を取らない」ことです。전날 밤 9시 이후 식사를 하지 않아야 합니다。', 1, 24, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '運動をしない', FALSE, 1),
    (gen_random_uuid(), q_id, '夜9時以降食事をしない', TRUE, 2),
    (gen_random_uuid(), q_id, '早く寝る', FALSE, 3),
    (gen_random_uuid(), q_id, '水をたくさん飲む', FALSE, 4);
END $$;

-- N3 Q25: 화자의도 (退社の挨拶)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：お先に失礼します。\nB：お疲れ様でした。あ、田中さん、明日の朝一で打ち合わせがあるの、忘れないでね。\nA：はい、9時からですよね。資料は準備してあります。\nB：さすがだね。じゃ、お疲れ様。\n\n質問：明日の打ち合わせは何時からですか？', E'「9時から」と確認しています。9시부터입니다。', 1, 25, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8時', FALSE, 1),
    (gen_random_uuid(), q_id, '9時', TRUE, 2),
    (gen_random_uuid(), q_id, '10時', FALSE, 3),
    (gen_random_uuid(), q_id, '11時', FALSE, 4);
END $$;

-- N3 Q26: 추론 (文化の違い)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：日本の会議って、発言する人が少ないよね。\nB：確かに。韓国だとみんな積極的に意見を言うけど。\nA：日本では会議の前に根回しして、会議では確認するだけという文化があるみたいだよ。\nB：なるほど。だから会議自体はスムーズなんだね。\n\n質問：日本の会議の特徴は何ですか？', E'会議前に根回しして会議では確認するだけという文化です。회의 전에 사전 조율을 하고 회의에서는 확인만 합니다。', 1, 26, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全員が積極的に発言する', FALSE, 1),
    (gen_random_uuid(), q_id, '事前に根回しして会議では確認だけする', TRUE, 2),
    (gen_random_uuid(), q_id, '会議がとても長い', FALSE, 3),
    (gen_random_uuid(), q_id, '上司だけが発言する', FALSE, 4);
END $$;

-- N3 Q27: 내용이해 (環境問題)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：エネルギー問題について話します。日本のエネルギー自給率は約10%で、90%を海外からの輸入に頼っています。再生可能エネルギーの割合を増やすことが重要です。特に太陽光と風力の活用が期待されています。\n\n質問：日本のエネルギー自給率は約何パーセントですか？', E'「約10%」と言っています。약 10%입니다。', 1, 27, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約5%', FALSE, 1),
    (gen_random_uuid(), q_id, '約10%', TRUE, 2),
    (gen_random_uuid(), q_id, '約30%', FALSE, 3),
    (gen_random_uuid(), q_id, '約50%', FALSE, 4);
END $$;

-- N3 Q28: 세부정보 (旅行計画)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：社員旅行の行き先、アンケートの結果が出ました。\nB：どこが一番人気でしたか。\nA：1位が北海道で35票、2位が沖縄で28票、3位が京都で17票でした。\nB：じゃ、北海道に決まりですね。\n\n質問：社員旅行の行き先はどこに決まりましたか？', E'1位の北海道に決まりました。홋카이도로 결정되었습니다。', 1, 28, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '沖縄', FALSE, 1),
    (gen_random_uuid(), q_id, '北海道', TRUE, 2),
    (gen_random_uuid(), q_id, '京都', FALSE, 3),
    (gen_random_uuid(), q_id, 'まだ未定', FALSE, 4);
END $$;

-- N3 Q29: 화자의도 (フィードバック)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n先輩：コードレビューしたけど、全体的によく書けてるよ。一つだけ気になったのは、変数名がちょっとわかりにくいところがあるかな。\n後輩：どの部分ですか。\n先輩：「tmp」とか「data」みたいな名前じゃなくて、具体的な名前にしたほうが読みやすいよ。\n後輩：なるほど、気をつけます。\n\n質問：先輩が指摘したことは何ですか？', E'変数名をもっと具体的にすべきと指摘しています。변수명을 더 구체적으로 해야 한다고 지적합니다。', 1, 29, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードにバグがある', FALSE, 1),
    (gen_random_uuid(), q_id, '変数名がわかりにくいので具体的にすべきだ', TRUE, 2),
    (gen_random_uuid(), q_id, 'コメントが不足している', FALSE, 3),
    (gen_random_uuid(), q_id, 'インデントが間違っている', FALSE, 4);
END $$;

-- N3 Q30: 추론 (仕事の将来)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：最近AIの発展がすごいよね。プログラマーの仕事もなくなるって言う人がいるけど。\nB：全部なくなることはないと思うよ。AIを使いこなせるエンジニアは、逆に需要が増えるんじゃないかな。\nA：確かに。AIと協力して開発する能力が大事になりそうだね。\n\n質問：Bさんが考える将来有望なスキルは何ですか？', E'AIを使いこなす能力が需要が増えると考えています。AI를 다룰 수 있는 능력이 중요해진다고 생각합니다。', 1, 30, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '手作業コーディング能力', FALSE, 1),
    (gen_random_uuid(), q_id, 'AIを扱い活用する能力', TRUE, 2),
    (gen_random_uuid(), q_id, 'AIを避ける能力', FALSE, 3),
    (gen_random_uuid(), q_id, '管理職の能力', FALSE, 4);
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
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nPM：今回のプロジェクトでは、マイクロサービスアーキテクチャを採用したいと考えています。\n開発者：モノリシックと比べて、デプロイが独立してできるのは魅力ですね。ただ、サービス間通信の複雑さが懸念です。\nPM：その点はAPIゲートウェイで管理する予定です。\n\n質問：マイクロサービスの懸念点として挙げられたのは何ですか？', E'「サービス間通信の複雑さ」が懸念点です。서비스 간 통신의 복잡성이 우려됩니다。', 1, 11, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コストが高い', FALSE, 1),
    (gen_random_uuid(), q_id, 'サービス間通信の複雑さ', TRUE, 2),
    (gen_random_uuid(), q_id, '開発速度が遅い', FALSE, 3),
    (gen_random_uuid(), q_id, '人員が不足している', FALSE, 4);
END $$;

-- N2 Q12: 세부정보 (人事制度説明)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n人事：当社の評価制度についてご説明します。評価は半期ごとに行われ、上司評価、同僚評価、自己評価の三つの視点から総合的に判断されます。\n社員：360度評価ということですね。\n人事：はい。結果はフィードバック面談で本人にお伝えします。\n\n質問：評価はどのくらいの頻度で行われますか？', E'「半期ごと」と言っています。반기마다(연 2회) 실시됩니다。', 1, 12, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎月', FALSE, 1),
    (gen_random_uuid(), q_id, '半期ごと', TRUE, 2),
    (gen_random_uuid(), q_id, '年1回', FALSE, 3),
    (gen_random_uuid(), q_id, '四半期ごと', FALSE, 4);
END $$;

-- N2 Q13: 화자의도 (技術選定の議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：フロントエンドのフレームワーク、ReactとVue.jsのどちらにしましょうか。\nB：チームの経験を考えると、Reactのほうが慣れている人が多いですね。\nA：ただ、今回は比較的小規模なプロジェクトなので、Vue.jsのほうがシンプルに作れるかもしれません。\nB：確かに。学習コストも低いですし、Vue.jsでいきましょうか。\n\n質問：最終的にどのフレームワークに決まりましたか？', E'「Vue.jsでいきましょうか」と合意しています。Vue.js로 결정했습니다。', 1, 13, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'React', FALSE, 1),
    (gen_random_uuid(), q_id, 'Vue.js', TRUE, 2),
    (gen_random_uuid(), q_id, 'Angular', FALSE, 3),
    (gen_random_uuid(), q_id, '未定', FALSE, 4);
END $$;

-- N2 Q14: 추론 (ワークライフバランス)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：うちの部署、残業が多すぎるという声がある。何か対策を考えてほしい。\n課長：まず、毎週水曜日をノー残業デーにするのはどうでしょうか。\n部長：いいね。ただ、それだけだと他の日に残業が集中する可能性がある。\n課長：では、業務の棚卸しをして、不要な会議を減らすことも並行して進めましょう。\n\n質問：課長が提案した対策は何ですか？', E'ノー残業デーと不要な会議の削減の二つです。노 잔업 데이와 불필요한 회의 삭감입니다。', 1, 14, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人員を増やす', FALSE, 1),
    (gen_random_uuid(), q_id, 'ノー残業デーの導入と不要な会議の削減', TRUE, 2),
    (gen_random_uuid(), q_id, '給与を上げる', FALSE, 3),
    (gen_random_uuid(), q_id, 'リモートワークを始める', FALSE, 4);
END $$;

-- N2 Q15: 내용이해 (セキュリティ研修)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：フィッシング詐欺の被害が増加しています。不審なメールのリンクは絶対にクリックしないでください。送信元のアドレスをよく確認し、少しでも怪しいと感じたら、情報セキュリティ部門に報告してください。パスワードは定期的に変更し、二要素認証を有効にすることも重要です。\n\n質問：不審なメールを受け取ったらどうすべきですか？', E'情報セキュリティ部門に報告すべきと言っています。정보 보안 부서에 보고해야 합니다。', 1, 15, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リンクをクリックして確認する', FALSE, 1),
    (gen_random_uuid(), q_id, '情報セキュリティ部門に報告する', TRUE, 2),
    (gen_random_uuid(), q_id, '削除して忘れる', FALSE, 3),
    (gen_random_uuid(), q_id, '同僚に転送する', FALSE, 4);
END $$;

-- N2 Q16: 세부정보 (開発手法)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nスクラムマスター：今週のスプリントの振り返りをしましょう。計画した8つのストーリーのうち、完了したのは6つです。\n開発者A：残り2つはバグが見つかって、修正に時間がかかりました。\nスクラムマスター：次のスプリントでは見積もりをもう少し余裕を持たせましょう。\n\n質問：今週完了したストーリーの数は？', E'「完了したのは6つ」と報告しています。6개 완료했습니다。', 1, 16, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4つ', FALSE, 1),
    (gen_random_uuid(), q_id, '6つ', TRUE, 2),
    (gen_random_uuid(), q_id, '8つ', FALSE, 3),
    (gen_random_uuid(), q_id, '10個', FALSE, 4);
END $$;

-- N2 Q17: 화자의도 (キャリア面談)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：今後のキャリアプランについて聞かせてください。\n部下：技術を深めたい気持ちもありますが、チームをまとめる役割にも興味があります。\n上司：両方のスキルを持つテックリードという選択肢もあるよ。技術力を維持しながらチームを率いるポジションだ。\n部下：それは理想的ですね。ぜひ目指したいです。\n\n質問：部下が目指すことにしたポジションは何ですか？', E'「テックリード」を目指すと言っています。테크 리드를 목표로 합니다。', 1, 17, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プロジェクトマネージャー', FALSE, 1),
    (gen_random_uuid(), q_id, 'テックリード', TRUE, 2),
    (gen_random_uuid(), q_id, 'シニア開発者', FALSE, 3),
    (gen_random_uuid(), q_id, 'CTO', FALSE, 4);
END $$;

-- N2 Q18: 추론 (品質管理)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nQA：今回のリリースで重大なバグが3件見つかりました。テストカバレッジが不十分だったのが原因です。\nPM：テスト工程にもっと時間を確保すべきだったね。\nQA：今後はCI/CDパイプラインに自動テストを組み込んで、品質を担保したいと思います。\nPM：ぜひ進めてください。\n\n質問：QAが提案した改善策は何ですか？', E'CI/CDパイプラインに自動テストを組み込むことです。CI/CD 파이프라인에 자동 테스트를 포함시키는 것입니다。', 1, 18, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'QA人員を増やす', FALSE, 1),
    (gen_random_uuid(), q_id, 'CI/CDに自動テストを組み込む', TRUE, 2),
    (gen_random_uuid(), q_id, '手動テストを強化する', FALSE, 3),
    (gen_random_uuid(), q_id, 'リリース周期を遅らせる', FALSE, 4);
END $$;

-- N2 Q19: 내용이해 (採用面接)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n面接官：前職ではどのような業務を担当されていましたか。\n応募者：バックエンドの開発を中心に、データベース設計やAPIの実装を行っていました。チームは5人で、私がサブリーダーを務めていました。\n面接官：使用していた技術スタックを教えてください。\n応募者：Java、Spring Boot、PostgreSQL、Dockerです。\n\n質問：応募者の前職での役割は何でしたか？', E'「サブリーダー」を務めていたと言っています。서브 리더를 맡았습니다。', 1, 19, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リーダー', FALSE, 1),
    (gen_random_uuid(), q_id, 'サブリーダー', TRUE, 2),
    (gen_random_uuid(), q_id, '一般メンバー', FALSE, 3),
    (gen_random_uuid(), q_id, 'PM', FALSE, 4);
END $$;

-- N2 Q20: 세부정보 (予算承認)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n部長：新しい開発ツールの導入について提案書を見ました。年間ライセンス費が120万円ですか。\n課長：はい。ただ、導入することで月平均30時間の工数削減が見込めます。\n部長：費用対効果は十分ありそうだね。来期の予算に組み込もう。\n\n質問：ツール導入の年間コストはいくらですか？', E'「年間ライセンス費が120万円」と言っています。연간 120만엔입니다。', 1, 20, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '60万円', FALSE, 1),
    (gen_random_uuid(), q_id, '120万円', TRUE, 2),
    (gen_random_uuid(), q_id, '240万円', FALSE, 3),
    (gen_random_uuid(), q_id, '300万円', FALSE, 4);
END $$;

-- N2 Q21-Q30 (remaining 10 compressed)
-- N2 Q21: 화자의도 (クライアント対応)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n営業：クライアントから追加機能の要望が来ています。\nPM：スコープ外の要件ですね。対応するとスケジュールに影響が出ます。\n営業：クライアントとしては、重要な機能らしいんですが。\nPM：では、次のフェーズで対応する形で提案しましょう。今のリリースには間に合いません。\n\n質問：PMの対応方針は何ですか？', E'次のフェーズで対応すると提案しています。다음 페이즈에서 대응하자고 제안합니다。', 1, 21, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '今すぐ追加する', FALSE, 1),
    (gen_random_uuid(), q_id, '次のフェーズで対応する', TRUE, 2),
    (gen_random_uuid(), q_id, '断る', FALSE, 3),
    (gen_random_uuid(), q_id, '他のチームに任せる', FALSE, 4);
END $$;

-- N2 Q22: 추론 (組織改革)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社長：来期から組織をフラットにしたい。意思決定のスピードを上げるためだ。\n役員：階層を減らすということですか。\n社長：そうだ。部長・課長の二層制を、グループリーダー一層にする。\n役員：現場の声が経営に届きやすくなりますね。\n\n質問：組織改革の目的は何ですか？', E'「意思決定のスピードを上げるため」です。의사 결정 속도를 높이기 위해서입니다。', 1, 22, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人件費を減らすため', FALSE, 1),
    (gen_random_uuid(), q_id, '意思決定の速度を上げるため', TRUE, 2),
    (gen_random_uuid(), q_id, '社員数を増やすため', FALSE, 3),
    (gen_random_uuid(), q_id, '管理職を増やすため', FALSE, 4);
END $$;

-- N2 Q23: 내용이해 (技術勉強会)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n発表者：本日はDockerとKubernetesの基礎についてお話しします。Dockerはアプリケーションをコンテナという単位でパッケージ化する技術です。Kubernetesは、複数のコンテナを自動的に管理・スケーリングするオーケストレーションツールです。\n\n質問：Kubernetesの役割は何ですか？', E'「複数のコンテナを自動的に管理・スケーリング」することです。여러 컨테이너를 자동으로 관리하고 스케일링합니다。', 1, 23, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードを書く', FALSE, 1),
    (gen_random_uuid(), q_id, '複数のコンテナを自動的に管理しスケーリングする', TRUE, 2),
    (gen_random_uuid(), q_id, 'データベースを管理する', FALSE, 3),
    (gen_random_uuid(), q_id, 'セキュリティを強化する', FALSE, 4);
END $$;

-- N2 Q24: 세부정보 (障害対応)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nオペレーター：本番環境で障害が発生しました。アプリケーションサーバーのCPU使用率が95%を超えています。\nエンジニア：原因を調査します。ログを見ると、特定のAPIに大量のリクエストが集中しているようです。\nオペレーター：暫定対応として、サーバーの台数を増やしますか。\nエンジニア：はい、スケールアウトで対応しつつ、根本原因を調査しましょう。\n\n質問：暫定対応として何をしますか？', E'「サーバーの台数を増やす（スケールアウト）」で対応します。서버 대수를 늘려 대응합니다。', 1, 24, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバーを再起動する', FALSE, 1),
    (gen_random_uuid(), q_id, 'サーバーの台数を増やす（スケールアウト）', TRUE, 2),
    (gen_random_uuid(), q_id, 'APIをブロックする', FALSE, 3),
    (gen_random_uuid(), q_id, 'ユーザーに案内する', FALSE, 4);
END $$;

-- N2 Q25: 화자의도 (1on1ミーティング)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n上司：最近の調子はどう？何か困っていることはない？\n部下：正直、今のタスク量が少し多いと感じています。\n上司：そうか。じゃ、一部を他のメンバーに分担してもらおう。あと、優先度の低いタスクは後回しにしていいよ。\n部下：ありがとうございます。助かります。\n\n質問：上司が提案した解決策は何ですか？', E'タスクの分担と優先度の低いタスクの後回しです。업무 분담과 우선순위 낮은 태스크 후순위화입니다。', 1, 25, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '残業を許可する', FALSE, 1),
    (gen_random_uuid(), q_id, '業務の分担と優先度の低いタスクの後回し', TRUE, 2),
    (gen_random_uuid(), q_id, '納期を延長する', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクトから外れる', FALSE, 4);
END $$;

-- N2 Q26: 추론 (グローバル対応)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n課長：来月からインドのチームと共同開発することになった。時差が3時間半あるから、ミーティングの時間を調整する必要がある。\n社員：日本時間の午後なら向こうの午前中になりますね。\n課長：そうだね。あと、英語でのコミュニケーションになるから、ドキュメントも英語で書いてほしい。\n\n質問：グローバル開発で必要になることは何ですか？', E'時差を考慮した会議時間の調整と英語でのドキュメント作成です。시차를 고려한 회의 시간 조정과 영어 문서 작성입니다。', 1, 26, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インドに出張に行く', FALSE, 1),
    (gen_random_uuid(), q_id, '時差を考慮した会議時間の調整と英語のドキュメント作成', TRUE, 2),
    (gen_random_uuid(), q_id, '通訳を雇う', FALSE, 3),
    (gen_random_uuid(), q_id, 'ヒンディー語を学ぶ', FALSE, 4);
END $$;

-- N2 Q27-Q30: 4 more
-- N2 Q27: 내용이해 (DX推進)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\nCTO：DX推進にあたり、三つの柱を立てます。第一に、レガシーシステムのモダナイゼーション。第二に、データ活用基盤の構築。第三に、デジタル人材の育成です。まずは現状のシステムを棚卸しするところから始めましょう。\n\n質問：DX推進の第一歩は何ですか？', E'「現状のシステムを棚卸しする」ことから始めます。현재 시스템을 점검하는 것부터 시작합니다。', 1, 27, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '新しいシステムを構築する', FALSE, 1),
    (gen_random_uuid(), q_id, '現在のシステムを棚卸しする', TRUE, 2),
    (gen_random_uuid(), q_id, '人材を採用する', FALSE, 3),
    (gen_random_uuid(), q_id, '外注に任せる', FALSE, 4);
END $$;

-- N2 Q28: 세부정보 (契約交渉)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n営業：SLA（サービスレベルアグリーメント）についてご説明します。可用性99.9%を保証し、月間ダウンタイムは最大43分以内とします。\nクライアント：障害発生時の対応時間はどのくらいですか。\n営業：重大障害の場合、30分以内に初動対応を開始します。\n\n質問：保証される可用性は何パーセントですか？', E'「可用性99.9%を保証」と言っています。99.9%입니다。', 1, 28, 'N2', 'listening');
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
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n社員：お時間いただきありがとうございます。実は、来月末で退職させていただきたいと考えています。\n上司：急だね。理由を聞いてもいいかな。\n社員：以前からWeb系の開発に興味があり、そちらの分野に挑戦したいと思いまして。\n上司：引き留めはしないけど、残りの期間でしっかり引き継ぎをお願いするよ。\n\n質問：社員が退職する理由は何ですか？', E'Web系の開発に挑戦したいからです。웹 계열 개발에 도전하고 싶기 때문입니다。', 1, 29, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '給与が低いから', FALSE, 1),
    (gen_random_uuid(), q_id, 'Web系の開発に挑戦したいから', TRUE, 2),
    (gen_random_uuid(), q_id, '人間関係がよくないから', FALSE, 3),
    (gen_random_uuid(), q_id, '健康上の理由', FALSE, 4);
END $$;

-- N2 Q30: 추론 (新技術導入)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：AIコーディングアシスタントの導入を検討しているんだけど、どう思う？\nB：コードの補完やバグの検出には役立つと思う。ただ、生成されたコードをそのまま使うのはリスクがあるよ。\nA：確かに。レビューは必須だね。\nB：うん。あくまでツールとして活用して、最終的な判断は人間がすべきだと思う。\n\n質問：Bさんの意見として正しいものは？', E'ツールとして活用し最終判断は人間がすべきと言っています。도구로 활용하되 최종 판단은 사람이 해야 합니다。', 1, 30, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AIを導入すべきではない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ツールとして活用し最終判断は人間がすべきだ', TRUE, 2),
    (gen_random_uuid(), q_id, 'AIに全てを任せるべきだ', FALSE, 3),
    (gen_random_uuid(), q_id, 'コードレビューは必要ない', FALSE, 4);
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
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n取締役：海外展開について、東南アジア市場への参入を提案します。特にベトナムとインドネシアは、IT人材の供給が豊富で、かつ成長市場です。\n社長：リスクは何が考えられますか。\n取締役：法規制の違いや文化の相違、為替リスクが主なものです。現地パートナーとの提携が鍵になるでしょう。\n\n質問：海外展開のリスクとして挙げられていないものは？', E'人材不足はリスクとして挙げられていません。인재 부족은 언급되지 않았습니다。', 1, 11, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '法規制の違い', FALSE, 1),
    (gen_random_uuid(), q_id, '人材不足', TRUE, 2),
    (gen_random_uuid(), q_id, '為替リスク', FALSE, 3),
    (gen_random_uuid(), q_id, '文化の相違', FALSE, 4);
END $$;

-- N1 Q12: 세부정보 (技術講演)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講演者：ブロックチェーン技術の本質は、中央管理者を必要としない分散型の合意形成メカニズムにあります。暗号通貨への応用が有名ですが、サプライチェーン管理や電子投票など、信頼性の担保が求められるあらゆる領域で活用の可能性があります。\n\n質問：ブロックチェーンの本質的な特徴は何ですか？', E'「中央管理者を必要としない分散型の合意形成」が本質です。중앙 관리자가 필요 없는 분산형 합의 형성입니다。', 1, 12, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '高速処理が可能だ', FALSE, 1),
    (gen_random_uuid(), q_id, '中央管理者が不要な分散型の合意形成', TRUE, 2),
    (gen_random_uuid(), q_id, 'データを削除できる', FALSE, 3),
    (gen_random_uuid(), q_id, '無料で使用できる', FALSE, 4);
END $$;

-- N1 Q13: 화자의도 (M&A議論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCFO：A社の買収について、デューデリジェンスの結果が出ました。財務状況は健全ですが、技術的負債がかなり蓄積しています。\nCEO：買収後のシステム統合にどのくらいのコストが見込まれますか。\nCFO：概算で5億円程度です。ただし、A社のAI技術は当社にない強みであり、長期的には投資回収が十分見込めます。\n\n質問：A社の課題は何ですか？', E'「技術的負債がかなり蓄積」していることが課題です。기술 부채가 상당히 축적되어 있습니다。', 1, 13, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '財務状況が悪い', FALSE, 1),
    (gen_random_uuid(), q_id, '技術的負債が多く蓄積されている', TRUE, 2),
    (gen_random_uuid(), q_id, 'AI技術が不足している', FALSE, 3),
    (gen_random_uuid(), q_id, '人材が流出している', FALSE, 4);
END $$;

-- N1 Q14: 추론 (倫理的AI開発)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n研究者A：AIの学習データにバイアスが含まれていると、出力結果にもバイアスが反映されてしまいます。\n研究者B：いわゆるアルゴリズミックバイアスの問題ですね。採用選考AIが特定の属性を不当に排除した事例もありました。\n研究者A：だからこそ、データの多様性を確保し、定期的な公平性監査が不可欠なのです。\n\n質問：アルゴリズミックバイアスを防ぐために必要なことは何ですか？', E'データの多様性確保と定期的な公平性監査です。데이터 다양성 확보와 정기적인 공정성 감사입니다。', 1, 14, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AI開発を中断する', FALSE, 1),
    (gen_random_uuid(), q_id, 'データの多様性確保と定期的な公平性監査', TRUE, 2),
    (gen_random_uuid(), q_id, '学習データを減らす', FALSE, 3),
    (gen_random_uuid(), q_id, 'AIの判断を公開しない', FALSE, 4);
END $$;

-- N1 Q15: 내용이해 (持続可能性報告)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n報告者：当社のCO2排出量削減の取り組みについて報告します。2025年度は前年比15%の削減を達成しました。再生可能エネルギーの利用率を60%まで引き上げ、データセンターの電力効率も改善しています。2030年までにカーボンニュートラルを目指します。\n\n質問：2025年度のCO2排出量は前年比でどのくらい削減されましたか？', E'「前年比15%の削減」と報告しています。전년 대비 15% 삭감되었습니다。', 1, 15, 'N1', 'listening');
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
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n弁護士：オープンソースライセンスについてご注意ください。GPL系のライブラリを使用した場合、ソースコードの公開義務が生じる可能性があります。\n開発者：MIT ライセンスなら問題ないですか。\n弁護士：MITは比較的制約が少ないですが、著作権表示の義務はあります。ライセンスの種類を確認してから利用することをお勧めします。\n\n質問：GPLライセンスの特徴は何ですか？', E'ソースコードの公開義務が生じる可能性があります。소스코드 공개 의무가 발생할 수 있습니다。', 1, 16, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '制約が全くない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ソースコードの公開義務が発生し得る', TRUE, 2),
    (gen_random_uuid(), q_id, '商業利用ができない', FALSE, 3),
    (gen_random_uuid(), q_id, '無料で使用できない', FALSE, 4);
END $$;

-- N1 Q17: 화자의도 (投資判断)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nアナリスト：生成AI市場は2030年までに年平均40%の成長が見込まれています。ただし、規制環境の不確実性がリスク要因です。\n投資家：個別銘柄への投資とETFのどちらが良いでしょうか。\nアナリスト：市場全体の成長に賭けるならETFが無難です。特定の技術に確信があれば個別銘柄も検討に値します。\n\n質問：アナリストが無難だと言っているのはどちらですか？', E'「ETFが無難」と言っています。ETF가 무난하다고 합니다。', 1, 17, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '個別銘柄', FALSE, 1),
    (gen_random_uuid(), q_id, 'ETF', TRUE, 2),
    (gen_random_uuid(), q_id, '債券', FALSE, 3),
    (gen_random_uuid(), q_id, '不動産', FALSE, 4);
END $$;

-- N1 Q18: 추론 (教育改革)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n教授：従来の講義型教育から、プロジェクトベースの学習への転換が求められています。\n学生：具体的にはどのような違いがありますか。\n教授：知識の暗記ではなく、実際の課題を解決するプロセスを通じて学ぶことです。失敗も重要な学習機会として捉えます。チームでの協働能力も自然と身につきます。\n\n質問：プロジェクトベース学習で重視されていることは何ですか？', E'実際の課題解決プロセスを通じた学びです。실제 과제 해결 프로세스를 통한 학습입니다。', 1, 18, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '知識の暗記', FALSE, 1),
    (gen_random_uuid(), q_id, '実際の課題解決プロセスを通じた学習', TRUE, 2),
    (gen_random_uuid(), q_id, '試験点数の向上', FALSE, 3),
    (gen_random_uuid(), q_id, '教授の講義を聞くこと', FALSE, 4);
END $$;

-- N1 Q19-Q24
-- N1 Q19: 내용이해 (量子暗号)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n講師：量子コンピュータの発展により、現在の暗号技術が将来破られる可能性があります。これに対応するため、耐量子暗号（ポスト量子暗号）の研究が急速に進んでいます。NISTは2024年に新しい暗号標準を策定しました。企業は今から移行計画を立てるべきです。\n\n質問：耐量子暗号が必要な理由は何ですか？', E'量子コンピュータにより現在の暗号が破られる可能性があるからです。양자 컴퓨터에 의해 현재 암호가 깨질 가능성이 있기 때문입니다。', 1, 19, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '現在の暗号が複雑だから', FALSE, 1),
    (gen_random_uuid(), q_id, '量子コンピュータにより現在の暗号が破られる可能性があるから', TRUE, 2),
    (gen_random_uuid(), q_id, 'コストを削減するため', FALSE, 3),
    (gen_random_uuid(), q_id, '速度を上げるため', FALSE, 4);
END $$;

-- N1 Q20: 세부정보 (ガバナンス)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n監査役：内部統制の観点から、開発環境と本番環境へのアクセス権限は厳密に分離すべきです。\nCTO：現在は開発者が本番環境に直接アクセスできる状態です。\n監査役：それは重大なリスクです。最低限、本番デプロイは承認フローを経るようにしてください。職務分掌の原則に基づいた権限管理を徹底すべきです。\n\n質問：監査役が指摘した問題は何ですか？', E'開発者が本番環境に直接アクセスできることが問題です。개발자가 본번 환경에 직접 접근할 수 있는 것이 문제입니다。', 1, 20, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発環境が遅い', FALSE, 1),
    (gen_random_uuid(), q_id, '開発者が本番環境に直接アクセスできる', TRUE, 2),
    (gen_random_uuid(), q_id, 'バックアップがない', FALSE, 3),
    (gen_random_uuid(), q_id, '監査ログがない', FALSE, 4);
END $$;

-- N1 Q21: 화자의도 (異文化マネジメント)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nマネージャー：多国籍チームのマネジメントで一番大切なのは、暗黙の前提を言語化することです。日本では「空気を読む」文化がありますが、異文化間ではそれが通用しません。\n社員：具体的にはどうすればいいですか。\nマネージャー：決定事項は必ず文書化し、期待値を明確に伝えること。そして、質問しやすい雰囲気を作ることです。\n\n質問：異文化マネジメントで最も重要なことは何ですか？', E'暗黙の前提を言語化することです。암묵적 전제를 언어화하는 것입니다。', 1, 21, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '空気を読むこと', FALSE, 1),
    (gen_random_uuid(), q_id, '暗黙の前提を言語化すること', TRUE, 2),
    (gen_random_uuid(), q_id, '厳格なルールを作ること', FALSE, 3),
    (gen_random_uuid(), q_id, '全てを上司が決めること', FALSE, 4);
END $$;

-- N1 Q22: 추론 (哲学的討論)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nA：技術の進歩は必ずしも人間の幸福につながるとは限らないのではないか。\nB：技術自体は中立で、それをどう使うかが問題だと思います。\nA：しかし、一度開発された技術は止められないという「技術的慣性」の問題がある。\nB：だからこそ、開発段階から倫理的な議論を組み込む「バリュー・センシティブ・デザイン」が重要なんですね。\n\n質問：Bさんが重要だと考える概念は何ですか？', E'「バリュー・センシティブ・デザイン」が重要だと言っています。밸류 센시티브 디자인입니다。', 1, 22, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '技術的慣性', FALSE, 1),
    (gen_random_uuid(), q_id, 'バリュー・センシティブ・デザイン', TRUE, 2),
    (gen_random_uuid(), q_id, '技術中立性', FALSE, 3),
    (gen_random_uuid(), q_id, '技術決定論', FALSE, 4);
END $$;

-- N1 Q23-Q30: remaining 8
-- N1 Q23: 내용이해 (人口動態)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n研究者：日本の生産年齢人口は2050年までに現在の約3割減少すると予測されています。労働力不足への対策として、AI・ロボットの活用、女性・高齢者の労働参加率向上、外国人材の受け入れ拡大が検討されています。しかし、いずれも単独では解決策にはなり得ず、複合的なアプローチが必要です。\n\n質問：生産年齢人口は2050年までにどのくらい減少しますか？', E'「約3割減少」と予測されています。약 30% 감소할 것으로 예측됩니다。', 1, 23, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約10%', FALSE, 1),
    (gen_random_uuid(), q_id, '約30%', TRUE, 2),
    (gen_random_uuid(), q_id, '約50%', FALSE, 3),
    (gen_random_uuid(), q_id, '約70%', FALSE, 4);
END $$;

-- N1 Q24: 세부정보 (規制と革新)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n政策立案者：レギュラトリーサンドボックス制度を導入し、新技術の実証実験を規制の例外として認めることを検討しています。\n企業代表：規制の枠外で実験できるのは大きなメリットです。ただし、消費者保護の観点も忘れてはなりません。\n政策立案者：もちろんです。実験の範囲と期間を限定し、影響を監視しながら進めます。\n\n質問：レギュラトリーサンドボックスの目的は何ですか？', E'新技術の実証実験を規制の例外として認めることです。신기술 실증 실험을 규제 예외로 인정하는 것입니다。', 1, 24, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全ての規制を廃止する', FALSE, 1),
    (gen_random_uuid(), q_id, '新技術の実証実験を規制の例外として認める', TRUE, 2),
    (gen_random_uuid(), q_id, '企業に補助金を支給する', FALSE, 3),
    (gen_random_uuid(), q_id, '消費者を保護しない', FALSE, 4);
END $$;

-- N1 Q25: 화자의도 (知識共有)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nCTO：組織のナレッジマネジメントを強化したい。ベテラン社員の暗黙知を形式知化する仕組みが必要だ。\nマネージャー：社内Wikiの活用やペアプログラミングの推進はどうでしょうか。\nCTO：いいね。加えて、月に一度テックトークを開催して、各チームの知見を共有する場を作ろう。\n\n質問：CTOが新たに提案したことは何ですか？', E'月に一度のテックトークの開催です。월 1회 테크 토크 개최입니다。', 1, 25, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '社内Wikiの活用', FALSE, 1),
    (gen_random_uuid(), q_id, '月1回テックトークの開催', TRUE, 2),
    (gen_random_uuid(), q_id, 'ペアプログラミング', FALSE, 3),
    (gen_random_uuid(), q_id, '外部研修', FALSE, 4);
END $$;

-- N1 Q26: 추론 (デジタル民主主義)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n学者A：デジタル技術は民主主義を強化する可能性がある一方で、監視社会を助長するリスクもあります。\n学者B：台湾のvTaiwanのように、市民参加型のデジタルプラットフォームは良い事例ですね。\n学者A：しかし、デジタルリテラシーの格差が新たな民主主義の不平等を生む可能性も指摘されています。\n\n質問：デジタル技術と民主主義の関係で懸念されていることは何ですか？', E'デジタルリテラシーの格差が新たな不平等を生む可能性です。디지털 리터러시 격차가 새로운 불평등을 만들 수 있습니다。', 1, 26, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インターネットの速度が遅い', FALSE, 1),
    (gen_random_uuid(), q_id, 'デジタルリテラシーの格差が新たな不平等を生む', TRUE, 2),
    (gen_random_uuid(), q_id, '投票率が低くなる', FALSE, 3),
    (gen_random_uuid(), q_id, '政治家が不要になる', FALSE, 4);
END $$;

-- N1 Q27: 내용이해 (SDGs取り組み)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文を読んで、質問に答えてください。\n\n代表：当社はSDGsの目標4「質の高い教育」に貢献するため、途上国向けにオンライン教育プラットフォームを無償提供しています。現在15カ国で利用されており、累計10万人以上が受講しています。来年度はアフリカ地域への展開を計画しています。\n\n質問：現在このプラットフォームは何カ国で利用されていますか？', E'「15カ国で利用」と報告しています。15개국에서 이용되고 있습니다。', 1, 27, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10か国', FALSE, 1),
    (gen_random_uuid(), q_id, '15か国', TRUE, 2),
    (gen_random_uuid(), q_id, '20か国', FALSE, 3),
    (gen_random_uuid(), q_id, '30か国', FALSE, 4);
END $$;

-- N1 Q28: 세부정보 (労働法改正)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n人事部長：同一労働同一賃金の原則が強化され、正社員と非正規社員の不合理な待遇差が禁止されています。\n社員：具体的にどのような差が問題になりますか。\n人事部長：基本給だけでなく、手当や福利厚生の差も対象です。職務内容が同じであれば、雇用形態に関わらず同等の待遇を保障する必要があります。\n\n質問：同一労働同一賃金の対象は何ですか？', E'基本給だけでなく手当や福利厚生も対象です。기본급뿐 아니라 수당이나 복리후생도 대상입니다。', 1, 28, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '基本給のみ', FALSE, 1),
    (gen_random_uuid(), q_id, '基本給、手当、福利厚生の全て', TRUE, 2),
    (gen_random_uuid(), q_id, '賞与のみ', FALSE, 3),
    (gen_random_uuid(), q_id, '正社員のみ対象', FALSE, 4);
END $$;

-- N1 Q29: 화자의도 (技術倫理)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\nエンジニア：ユーザーデータの収集範囲について倫理的に問題がないか確認したいのですが。\nCPO：収集目的を明確にし、最小限のデータだけを取得する「データミニマイゼーション」の原則を守ってください。\nエンジニア：同意の取得方法も確認すべきですね。\nCPO：はい。オプトインの仕組みを確実に実装してください。\n\n質問：CPOが指示した原則は何ですか？', E'「データミニマイゼーション」の原則です。데이터 미니마이제이션(최소화) 원칙입니다。', 1, 29, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'できるだけ多くのデータを収集する', FALSE, 1),
    (gen_random_uuid(), q_id, '最小限のデータだけを収集するデータミニマイゼーション', TRUE, 2),
    (gen_random_uuid(), q_id, 'データ収集をしない', FALSE, 3),
    (gen_random_uuid(), q_id, '匿名化すればよい', FALSE, 4);
END $$;

-- N1 Q30: 추론 (未来の働き方)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'd0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の会話を読んで、質問に答えてください。\n\n未来学者：2030年代には、企業に所属しない「DAO（分散型自律組織）」のような新しい働き方が一般化する可能性があります。\n記者：従来の雇用関係はなくなるのでしょうか。\n未来学者：完全になくなることはないでしょうが、プロジェクト単位で集まり、完了後に解散するような柔軟な組織形態が増えると予想されます。重要なのは、個人がポータブルなスキルと評判を持つことです。\n\n質問：未来学者が個人に必要だと考えていることは何ですか？', E'ポータブルなスキルと評判を持つことです。포터블한(이동 가능한) 스킬과 평판을 갖는 것입니다。', 1, 30, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大企業に所属すること', FALSE, 1),
    (gen_random_uuid(), q_id, 'ポータブルなスキルと評判を持つこと', TRUE, 2),
    (gen_random_uuid(), q_id, '一つの専門分野だけを深く掘り下げること', FALSE, 3),
    (gen_random_uuid(), q_id, '組織に順応すること', FALSE, 4);
END $$;

-- Update listening quiz time limits (+10 minutes each)
UPDATE quizzes SET time_limit_minutes = time_limit_minutes + 10 WHERE id IN (
  'd0000001-0000-0000-0000-000000000001',
  'd0000002-0000-0000-0000-000000000002',
  'd0000003-0000-0000-0000-000000000003',
  'd0000004-0000-0000-0000-000000000004',
  'd0000005-0000-0000-0000-000000000005'
);
