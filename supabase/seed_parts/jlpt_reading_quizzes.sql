-- ============================================
-- JLPT Reading Quizzes (5 quizzes, 10 questions each)
-- N5/N4/N3/N2/N1 levels
-- ============================================

-- Cleanup existing reading quiz data
DELETE FROM comprehensive_exam_answers WHERE selected_option_id IN (
  SELECT id FROM quiz_question_options WHERE question_id IN (
    SELECT id FROM quiz_questions WHERE quiz_id IN (
      'c0000001-0000-0000-0000-000000000001',
      'c0000002-0000-0000-0000-000000000002',
      'c0000003-0000-0000-0000-000000000003',
      'c0000004-0000-0000-0000-000000000004',
      'c0000005-0000-0000-0000-000000000005'
    )
  )
);
DELETE FROM comprehensive_exam_answers WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'c0000001-0000-0000-0000-000000000001',
    'c0000002-0000-0000-0000-000000000002',
    'c0000003-0000-0000-0000-000000000003',
    'c0000004-0000-0000-0000-000000000004',
    'c0000005-0000-0000-0000-000000000005'
  )
);
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
-- Categories: 내용이해(4), 세부정보(3), 문맥어휘(2), 추론(1)
-- ============================================

-- Q1: 내용이해 (쇼핑 리스트)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうのかいものリスト\nたまご 1パック　ぎゅうにゅう 1本　パン 1つ　りんご 3つ　にんじん 2本　とりにく 200グラム\nぜんぶで 1500えんぐらいです。おかねは テーブルの うえに あります。5じまでに かってきてください。\nおかあさんより\n\n質問：おかねは　どこに　ありますか？', '「おかねは テーブルの うえに あります」と書いてあります。돈은 테이블 위에 있습니다。', 1, 1, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '冷蔵庫の中に', FALSE, 1),
    (gen_random_uuid(), q_id, 'かばんの中に', FALSE, 2),
    (gen_random_uuid(), q_id, 'テーブルの上に', TRUE, 3),
    (gen_random_uuid(), q_id, '引き出しの中に', FALSE, 4);
END $$;

-- Q2: 내용이해 (친구 메시지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nゆきさんへ\nわたしは いま とうきょうに すんでいます。まいにち にほんごの べんきょうを しています。らいしゅうの どようび、いっしょに こうえんに いきませんか。はなみを したいです。\nミナより\n\n質問：ミナさんは　らいしゅう　なにを　したいですか？', '「はなみを したいです」と書いてあります。미나 씨는 꽃구경을 하고 싶어합니다。', 1, 2, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お花見をしたい', TRUE, 1),
    (gen_random_uuid(), q_id, '映画を見たい', FALSE, 2),
    (gen_random_uuid(), q_id, '買い物をしたい', FALSE, 3),
    (gen_random_uuid(), q_id, '勉強をしたい', FALSE, 4);
END $$;

-- Q3: 내용이해 (전철 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nおしらせ\n12がつ 20にちから でんしゃの じかんが かわります。\nあさの でんしゃ：さいしょの でんしゃは 5じ30ぷんです。（いまは 5じ50ぷん）\nどようびと にちようびは いつもと おなじです。\n\n質問：12がつ 20にちから、さいしょの でんしゃは　なんじですか？', '変更後のさいしょの でんしゃは「5じ30ぷん」です。변경 후 첫 전철은 5시 30분입니다。', 1, 3, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5時50分', FALSE, 1),
    (gen_random_uuid(), q_id, '5時30分', TRUE, 2),
    (gen_random_uuid(), q_id, '6時', FALSE, 3),
    (gen_random_uuid(), q_id, '5時', FALSE, 4);
END $$;

-- Q4: 내용이해 (병원 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nさくら びょういん\nしんさつの じかん：\nげつようび〜きんようび：あさ 9じ〜ひる 12じ、ごご 2じ〜ゆうがた 5じ\nどようび：あさ 9じ〜ひる 12じ\nにちようび：おやすみ\n\n質問：にちようびに　びょういんに　いけますか？', '「にちようび：おやすみ」と書いてあるので、日曜日は行けません。일요일은 휴진입니다。', 1, 4, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '午前だけ行ける', FALSE, 1),
    (gen_random_uuid(), q_id, '午後だけ行ける', FALSE, 2),
    (gen_random_uuid(), q_id, '一日中行ける', FALSE, 3),
    (gen_random_uuid(), q_id, '行けない（休診）', TRUE, 4);
END $$;

-- Q5: 세부정보 (아파트 규칙)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアパートに すんでいる みなさんへ\n1. よるの 10じから あさの 7じまで、おおきい おとを ださないでください。\n2. ゴミは きまった ひに だしてください。\n3. じてんしゃは じてんしゃおきばに おいてください。\n4. ペットは かうことができません。\n\n質問：アパートで　ペットを　かうことが　できますか？', '「ペットは かうことができません」と明記されています。반려동물은 기를 수 없습니다。', 1, 5, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '小さい動物だけ飼える', FALSE, 1),
    (gen_random_uuid(), q_id, '飼えない', TRUE, 2),
    (gen_random_uuid(), q_id, '管理人に許可をもらえばいい', FALSE, 3),
    (gen_random_uuid(), q_id, '猫だけ飼える', FALSE, 4);
END $$;

-- Q6: 세부정보 (레시피)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nたまごやきの つくりかた\nざいりょう：たまご 3つ、さとう すこし、しお すこし、あぶら すこし\nつくりかた：\n1. たまごを ボウルに いれます。\n2. さとうと しおを いれて、よく まぜます。\n3. フライパンに あぶらを いれて、ひを つけます。\n\n質問：たまごは　いくつ　つかいますか？', '材料に「たまご 3つ」と書いてあります。달걀은 3개 사용합니다。', 1, 6, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1つ', FALSE, 1),
    (gen_random_uuid(), q_id, '2つ', FALSE, 2),
    (gen_random_uuid(), q_id, '4つ', FALSE, 3),
    (gen_random_uuid(), q_id, '3つ', TRUE, 4);
END $$;

-- Q7: 세부정보 (도서관 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nみなみ としょかん りようあんない\nほんは 5さつまで かりることができます。かりる きかんは 2しゅうかんです。\nとしょかんの なかで たべたり のんだりしないでください。\nカードを つくりたいひとは、うけつけに きてください。みぶんしょうめいしょが いります。\n\n質問：ほんは　なんさつまで　かりることが　できますか？', '「ほんは 5さつまで かりることができます」と書いてあります。책은 5권까지 빌릴 수 있습니다。', 1, 7, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3冊', FALSE, 1),
    (gen_random_uuid(), q_id, '5冊', TRUE, 2),
    (gen_random_uuid(), q_id, '7冊', FALSE, 3),
    (gen_random_uuid(), q_id, '10冊', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (일기예보)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうの てんきよほう\nきょうの とうきょうは はれです。きおんは 18どです。\nあしたは くもりで、ごごから あめが ふるかもしれません。\nかさを もっていったほうが いいです。\n\n質問：「てんきよほう」の　いみは　なんですか？', '「てんきよほう」は「天気予報」で、날씨를 미리 알려주는 것입니다。', 1, 8, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '天気のニュース', FALSE, 1),
    (gen_random_uuid(), q_id, '天気予報', TRUE, 2),
    (gen_random_uuid(), q_id, '気温の記録', FALSE, 3),
    (gen_random_uuid(), q_id, '季節のカレンダー', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (자기소개 카드)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nなまえ：パク・ジヒョン\nくに：かんこく（ソウル）\nすきな こと：りょうり、さんぽ、えいがを みること\nにほんごの レベル：すこし はなせます\nにほんで したいこと：おいしい たべものを たべたいです。ともだちを たくさん つくりたいです。\n\n質問：「さんぽ」の　いみは　なんですか？', '「さんぽ」は「散歩」で、천천히 걸어다니는 것을 의미합니다。', 1, 9, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ランニング', FALSE, 1),
    (gen_random_uuid(), q_id, '水泳', FALSE, 2),
    (gen_random_uuid(), q_id, '散歩', TRUE, 3),
    (gen_random_uuid(), q_id, '登山', FALSE, 4);
END $$;

-- Q10: 추론 (쇼핑 리스트 목적)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうのかいものリスト\nたまご 1パック　ぎゅうにゅう 1本　パン 1つ　りんご 3つ　にんじん 2本　とりにく 200グラム\nぜんぶで 1500えんぐらいです。おかねは テーブルの うえに あります。5じまでに かってきてください。\nおかあさんより\n\n質問：この　メモは　だれが　だれに　かきましたか？', '最後に「おかあさんより」と書いてあるので、お母さんが子どもに書いたメモです。엄마가 자녀에게 쓴 메모입니다。', 1, 10, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '子どもがお母さんに', FALSE, 1),
    (gen_random_uuid(), q_id, '友達が友達に', FALSE, 2),
    (gen_random_uuid(), q_id, 'お母さんが子どもに', TRUE, 3),
    (gen_random_uuid(), q_id, 'お店の人がお客さんに', FALSE, 4);
END $$;

-- ============================================
-- N4 読解クイズ (10 questions)
-- Categories: 내용이해(4), 세부정보(3), 문맥어휘(2), 추론(1)
-- ============================================

-- Q1: 내용이해 (이사 안내 메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n田中さんへ\n来月の15日に新しいアパートに引っ越すことになりました。今のアパートは駅から遠くて、ちょっと不便でした。新しいアパートは駅から歩いて5分のところにあります。\nパク・ジュンより\n\n質問：新しいアパートはどんなところですか？', '「新しいアパートは駅から歩いて5分」と書いてあります。새 아파트는 역에서 걸어서 5분 거리에 있습니다。', 1, 1, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '駅から遠い', FALSE, 1),
    (gen_random_uuid(), q_id, '駅から歩いて5分だ', TRUE, 2),
    (gen_random_uuid(), q_id, '駅からバスで10分だ', FALSE, 3),
    (gen_random_uuid(), q_id, '駅のすぐ前だ', FALSE, 4);
END $$;

-- Q2: 내용이해 (취미 서클)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「にほんご読書クラブ」のメンバーをぼしゅうしています！\n私たちは月に2回、土曜日の午後に集まって、日本語の本を読んでいます。やさしい本から始めるので、日本語がまだ上手じゃなくても大丈夫です。\n\n質問：このクラブでは何をしますか？', '「日本語の本を読んでいます」と書いてあります。일본어 책을 읽는 클럽입니다。', 1, 2, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本語の会話練習をする', FALSE, 1),
    (gen_random_uuid(), q_id, '日本の映画を見る', FALSE, 2),
    (gen_random_uuid(), q_id, '日本語の本を読む', TRUE, 3),
    (gen_random_uuid(), q_id, '日本料理を作る', FALSE, 4);
END $$;

-- Q3: 내용이해 (교토 여행 가이드)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n京都は日本で一番人気がある観光地の一つです。\nおすすめの場所：\n・金閣寺：金色のきれいなお寺です。\n・嵐山：秋の紅葉がとてもきれいです。\n・錦市場：おいしい食べ物がたくさんあります。「京都の台所」と呼ばれています。\n\n質問：錦市場は何と呼ばれていますか？', '「京都の台所」と呼ばれていると書いてあります。니시키 시장은 "교토의 부엌"이라고 불립니다。', 1, 3, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '京都の庭', FALSE, 1),
    (gen_random_uuid(), q_id, '京都の台所', TRUE, 2),
    (gen_random_uuid(), q_id, '京都の心臓', FALSE, 3),
    (gen_random_uuid(), q_id, '京都の宝物', FALSE, 4);
END $$;

-- Q4: 내용이해 (건강검진 결과)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n先日の健康診断の結果をお知らせします。\n全体的に問題はありません。しかし、コレステロールの数値が少し高いです。\nアドバイス：\n・野菜や魚を多く食べるようにしましょう。\n・揚げ物や甘いものを食べすぎないように気をつけてください。\n\n質問：健康診断で問題があったのは何ですか？', '「コレステロールの数値が少し高いです」と書いてあります。콜레스테롤 수치가 조금 높은 것이 문제입니다。', 1, 4, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '血圧が高い', FALSE, 1),
    (gen_random_uuid(), q_id, '視力が悪い', FALSE, 2),
    (gen_random_uuid(), q_id, '体重が多い', FALSE, 3),
    (gen_random_uuid(), q_id, 'コレステロールの数値が少し高い', TRUE, 4);
END $$;

-- Q5: 세부정보 (구청 절차 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n引っ越しをしたときの手続きについて\n新しい区に引っ越した方は、14日以内に転入届を出してください。\n必要なもの：在留カード、パスポート、前の区の転出届の紙\nわからないことがあったら、外国語相談窓口（2階）を利用してください。\n\n質問：転入届はいつまでに出さなければなりませんか？', '「14日以内に転入届を出してください」と書いてあります。14일 이내에 전입신고를 내야 합니다。', 1, 5, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '7日以内', FALSE, 1),
    (gen_random_uuid(), q_id, '14日以内', TRUE, 2),
    (gen_random_uuid(), q_id, '30日以内', FALSE, 3),
    (gen_random_uuid(), q_id, '期限なし', FALSE, 4);
END $$;

-- Q6: 세부정보 (요리 교실)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「世界の家庭料理教室」参加者ぼしゅう！\n今月のテーマ：韓国料理（ビビンバとチヂミ）\n定員：15名（先着順）\n参加費：1,000円（材料費を含む）\n持ち物：エプロン、ハンドタオル\nしめきりは3月15日です。\n\n質問：参加費の1,000円には何が含まれていますか？', '「参加費：1,000円（材料費を含む）」と書いてあります。참가비에는 재료비가 포함되어 있습니다。', 1, 6, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '交通費', FALSE, 1),
    (gen_random_uuid(), q_id, 'エプロンのレンタル代', FALSE, 2),
    (gen_random_uuid(), q_id, '材料費', TRUE, 3),
    (gen_random_uuid(), q_id, '教材費', FALSE, 4);
END $$;

-- Q7: 세부정보 (쓰레기 분리 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n【資源ゴミ】金曜日\nペットボトル、かん、びん、段ボール\n→ きれいに洗ってから出してください。\n→ ペットボトルはキャップとラベルを外してください。\nゴミは朝8時までに出してください。\n\n質問：ペットボトルを出すとき、どうしなければなりませんか？', '「ペットボトルはキャップとラベルを外してください」と書いてあります。페트병은 뚜껑과 라벨을 떼어야 합니다。', 1, 7, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そのまま捨てる', FALSE, 1),
    (gen_random_uuid(), q_id, '細かく切って捨てる', FALSE, 2),
    (gen_random_uuid(), q_id, 'キャップとラベルを外さなければならない', TRUE, 3),
    (gen_random_uuid(), q_id, '紙袋に入れて捨てる', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (빵집 리뷰)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n駅前にできた新しいパン屋「森のパン工房」に行ってきました。\nメロンパンは外がカリカリで、中はふわふわでした。今まで食べた中で一番おいしかったです。\n値段は少し高いですが、材料にこだわっているので、しかたがないと思います。\n\n質問：「こだわっている」の意味に一番近いものはどれですか？', '「こだわっている」は材料の質にとても気を使っている、という意味です。재료에 신경을 많이 쓰고 있다는 뜻입니다。', 1, 8, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大事にしている', FALSE, 1),
    (gen_random_uuid(), q_id, 'こだわっている', TRUE, 2),
    (gen_random_uuid(), q_id, '節約している', FALSE, 3),
    (gen_random_uuid(), q_id, '心配している', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (일본 계절 행사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n夏には「お盆」があります。8月13日から16日ごろに、亡くなった家族のためにお墓参りをします。この時期は多くの人がふるさとに帰ります。\n\n質問：「ふるさと」の意味は何ですか？', '「ふるさと」は「故郷」で、自分が生まれ育った場所です。고향이라는 뜻입니다。', 1, 9, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '職場', FALSE, 1),
    (gen_random_uuid(), q_id, '旅行先', FALSE, 2),
    (gen_random_uuid(), q_id, '友達の家', FALSE, 3),
    (gen_random_uuid(), q_id, 'ふるさと', TRUE, 4);
END $$;

-- Q10: 추론 (이사 메일의 목적)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n田中さんへ\n来月の15日に新しいアパートに引っ越すことになりました。新しいアパートは駅から歩いて5分のところにあります。部屋は今より少し広くて、近くにスーパーやコンビニもあります。\n引っ越しが終わったら、ぜひ遊びに来てください。\nパク・ジュンより\n\n質問：このメールの一番の目的は何ですか？', 'パクさんは引っ越しを知らせて、新しい家に遊びに来てほしいと伝えています。이사 소식을 알리고 놀러 오라고 초대하는 것이 목적입니다。', 1, 10, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '引っ越しの手伝いを頼むため', FALSE, 1),
    (gen_random_uuid(), q_id, '引っ越しを知らせて遊びに来てもらうため', TRUE, 2),
    (gen_random_uuid(), q_id, '新しいアパートの欠点を伝えるため', FALSE, 3),
    (gen_random_uuid(), q_id, '不動産を勧めるため', FALSE, 4);
END $$;

-- ============================================
-- N3 読解クイズ (10 questions)
-- Categories: 내용이해(4), 세부정보(3), 문맥어휘(2), 추론(1)
-- ============================================

-- Q1: 내용이해 (일본 매너)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n電車の中では大きな声で話したり、電話をしたりしないのが一般的です。優先席の近くでは、携帯電話の電源を切るか、マナーモードにしてください。\n\n質問：電車の中でのマナーとして正しいものはどれですか？', '電車の中では「大きな声で話したり、電話をしたりしない」のが一般的です。전철 안에서는 큰 소리로 이야기하거나 전화하지 않는 것이 일반적입니다。', 1, 1, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大きな声で電話してもいい', FALSE, 1),
    (gen_random_uuid(), q_id, '大きな声で話したり、電話をしたりしない', TRUE, 2),
    (gen_random_uuid(), q_id, '優先席の近くでだけ静かにする', FALSE, 3),
    (gen_random_uuid(), q_id, '音楽を大きく聞いてもいい', FALSE, 4);
END $$;

-- Q2: 내용이해 (방재 훈련)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n秋の防災訓練を下記のとおり実施いたします。\n日時：10月15日（日）午前9時〜12時\n場所：中央公園\n※雨天の場合は、市民体育館で行います。\n参加申し込みは不要です。\n\n質問：雨が降ったら、訓練はどうなりますか？', '「雨天の場合は、市民体育館で行います」と書いてあります。비가 오면 시민체육관에서 진행합니다。', 1, 2, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '訓練が中止になる', FALSE, 1),
    (gen_random_uuid(), q_id, '来週に延期される', FALSE, 2),
    (gen_random_uuid(), q_id, '市民体育館で行う', TRUE, 3),
    (gen_random_uuid(), q_id, '傘をさして公園で行う', FALSE, 4);
END $$;

-- Q3: 내용이해 (봉사활동 보고)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「川をきれいにしよう」ボランティア活動報告\n今年は大人65名、子ども23名、合計88名の方に参加していただきました。昨年より15名も多く、過去最多の参加者数でした。\nペットボトルや空き缶が最も多く、中には自転車やタイヤなど大きなゴミもありました。\n\n質問：今年の参加者は昨年と比べてどうでしたか？', '「昨年より15名も多く、過去最多」と書いてあります。작년보다 15명 많은 역대 최다 참가자 수였습니다。', 1, 3, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '昨年と同じだった', FALSE, 1),
    (gen_random_uuid(), q_id, '昨年より15名少なかった', FALSE, 2),
    (gen_random_uuid(), q_id, '昨年より15名多かった', TRUE, 3),
    (gen_random_uuid(), q_id, '昨年より88名多かった', FALSE, 4);
END $$;

-- Q4: 내용이해 (식문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の食文化は2013年にユネスコの無形文化遺産に登録されました。\n一つ目は、「一汁三菜」という考え方です。ご飯、味噌汁、そして3つのおかずをバランスよく食べるという伝統があります。\n二つ目は、季節を大切にすることです。日本人は「旬」の食材を使うことを好みます。\n\n質問：「一汁三菜」とは何ですか？', '「ご飯、味噌汁、そして3つのおかず」を食べるスタイルです。밥, 된장국, 반찬 3가지를 먹는 전통입니다。', 1, 4, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '汁3つとおかず1つ', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご飯、汁1つ、おかず3つ', TRUE, 2),
    (gen_random_uuid(), q_id, '旬の食材だけ食べること', FALSE, 3),
    (gen_random_uuid(), q_id, '一日三食食べること', FALSE, 4);
END $$;

-- Q5: 세부정보 (주민 설문조사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「暮らしやすさに関するアンケート」結果報告\n【改善してほしい点】（複数回答可）\n1位：病院が少ない（42%）\n2位：夜道が暗くて危ない（35%）\n3位：子どもの遊び場が少ない（28%）\n\n質問：住民が一番改善してほしいと思っていることは何ですか？', '改善してほしい点の1位は「病院が少ない（42%）」です。주민들이 가장 개선을 원하는 것은 병원이 적다는 것입니다。', 1, 5, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '病院が少ない', TRUE, 1),
    (gen_random_uuid(), q_id, '夜道が暗くて危ない', FALSE, 2),
    (gen_random_uuid(), q_id, '子どもの遊び場が少ない', FALSE, 3),
    (gen_random_uuid(), q_id, '交通が不便だ', FALSE, 4);
END $$;

-- Q6: 세부정보 (축제 보고)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n第15回さくら祭りイベント報告\n今年は3年ぶりの通常開催となり、約3,500人の来場者で大いににぎわいました。\nボランティアスタッフとして参加してくださった52名の皆さま、協賛いただいた地元企業の皆さまに感謝申し上げます。\n\n質問：今年の来場者数は約何人でしたか？', '「約3,500人の来場者」と書いてあります。약 3,500명의 방문객이 있었습니다。', 1, 6, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約500人', FALSE, 1),
    (gen_random_uuid(), q_id, '約1,500人', FALSE, 2),
    (gen_random_uuid(), q_id, '約3,500人', TRUE, 3),
    (gen_random_uuid(), q_id, '約5,200人', FALSE, 4);
END $$;

-- Q7: 세부정보 (일본 주거 사정)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本では、入居するときに「敷金」と「礼金」を払うのが一般的です。敷金は家賃の1〜2か月分で、退去するときに部屋の修理代を引いた金額が戻ってきます。礼金は大家さんへのお礼で、こちらは戻ってきません。\n\n質問：退去するとき、敷金はどうなりますか？', '「退去するときに部屋の修理代を引いた金額が戻ってきます」と書いてあります。방 수리비를 뺀 금액이 돌아옵니다。', 1, 7, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全額戻ってくる', FALSE, 1),
    (gen_random_uuid(), q_id, '全く戻ってこない', FALSE, 2),
    (gen_random_uuid(), q_id, '修理代を引いた金額が戻ってくる', TRUE, 3),
    (gen_random_uuid(), q_id, '次の大家さんに渡される', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (전철 통근 매너)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nお年寄りや体が不自由な方、妊婦さんを見かけたら、席を譲るのが望ましいです。朝の通勤時間帯は特に混雑しますが、お互いに思いやりを持って、気持ちよく移動できるようにしたいものです。\n\n質問：「思いやり」の意味に一番近いものはどれですか？', '「思いやり」は相手の気持ちや立場を考えて行動することです。상대방을 배려하는 마음입니다。', 1, 8, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ルールを守ること', FALSE, 1),
    (gen_random_uuid(), q_id, '忍耐力', FALSE, 2),
    (gen_random_uuid(), q_id, '相手への思いやり', TRUE, 3),
    (gen_random_uuid(), q_id, '勇気', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (계절 편지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n手紙を書く習慣が少なくなっている現代ですが、心のこもった手書きの手紙は、もらった人をとても喜ばせるものです。年賀状は1月1日に届くように、12月中旬までに出しましょう。\n\n質問：「心のこもった」の意味に一番近いものはどれですか？', '「心のこもった」は真心が入った、気持ちを込めて書いたという意味です。진심이 담긴이라는 뜻입니다。', 1, 9, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '長く書いた', FALSE, 1),
    (gen_random_uuid(), q_id, '気持ちを込めて書いた', TRUE, 2),
    (gen_random_uuid(), q_id, '高い紙に書いた', FALSE, 3),
    (gen_random_uuid(), q_id, '難しい言葉を使った', FALSE, 4);
END $$;

-- Q10: 추론 (식문화의 과제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本料理は味だけでなく、盛り付けにもこだわります。色とりどりの食材を使い、器にも気を配ります。「目で食べる」という表現があるほど、見た目を大切にしています。\nしかし最近は、若い世代の食生活が変わりつつあり、伝統的な食文化をどう守っていくかが課題となっています。\n\n質問：筆者が心配していることは何だと考えられますか？', '最後の文で「伝統的な食文化をどう守っていくかが課題」と述べています。전통적인 식문화가 사라지는 것을 걱정하고 있습니다。', 1, 10, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本料理の価格が高くなりすぎること', FALSE, 1),
    (gen_random_uuid(), q_id, '若い世代が料理をできないこと', FALSE, 2),
    (gen_random_uuid(), q_id, '外国料理が人気があること', FALSE, 3),
    (gen_random_uuid(), q_id, '伝統的な食文化がなくなる可能性があること', TRUE, 4);
END $$;

-- ============================================
-- N2 読解クイズ (10 questions)
-- Categories: 내용이해(4), 세부정보(3), 문맥어휘(2), 추론(1)
-- ============================================

-- Q1: 내용이해 (저출산 고령화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nまず、労働力不足の問題がある。生産年齢人口の減少により、多くの業種で人手が足りない状況が続いている。特に介護、農業、建設といった分野では深刻であり、外国人労働者の受け入れ拡大が議論されている。\n\n質問：労働力不足が特に深刻な分野として挙げられていないのはどれですか？', '本文では「介護、農業、建設」が特に深刻だと述べています。금융は挙げられていません。', 1, 1, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '介護', FALSE, 1),
    (gen_random_uuid(), q_id, '農業', FALSE, 2),
    (gen_random_uuid(), q_id, '金融', TRUE, 3),
    (gen_random_uuid(), q_id, '建設', FALSE, 4);
END $$;

-- Q2: 내용이해 (교육 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の教育制度は「6-3-3-4制」と呼ばれ、小学校6年、中学校3年、高等学校3年、大学4年で構成されている。このうち小学校と中学校の9年間が義務教育であり、ほぼ全ての子どもが通っている。\n\n質問：日本の義務教育は何年間ですか？', '「小学校と中学校の9年間が義務教育」と書いてあります。의무교육은 9년입니다。', 1, 2, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '6年', FALSE, 1),
    (gen_random_uuid(), q_id, '9年', TRUE, 2),
    (gen_random_uuid(), q_id, '12年', FALSE, 3),
    (gen_random_uuid(), q_id, '16年', FALSE, 4);
END $$;

-- Q3: 내용이해 (환경 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n2020年にはレジ袋の有料化が全国で実施され、マイバッグを持参する習慣が広く定着した。\n最近では「エシカル消費」という概念も広まりつつあり、環境や社会に配慮した商品を選ぶ消費者が増えている。\n\n質問：レジ袋の有料化の結果、どのような変化がありましたか？', '「マイバッグを持参する習慣が広く定着した」と書いてあります。에코백을 지참하는 습관이 정착되었습니다。', 1, 3, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レジ袋の使用がさらに増えた', FALSE, 1),
    (gen_random_uuid(), q_id, 'マイバッグを持参する習慣が定着した', TRUE, 2),
    (gen_random_uuid(), q_id, 'スーパーの売上が減った', FALSE, 3),
    (gen_random_uuid(), q_id, '紙袋に変わった', FALSE, 4);
END $$;

-- Q4: 내용이해 (식품 로스)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n特に日本独特の商習慣である「3分の1ルール」が問題視されている。これは、賞味期限の3分の1が過ぎた時点で小売店に納品できなくなるというルールで、まだ十分に食べられる商品が廃棄される一因となっている。\n\n質問：「3分の1ルール」とは何ですか？', '賞味期限の3分の1が過ぎると小売店に納品できなくなるルールです。유통기한의 1/3이 지나면 납품 불가능한 상관행입니다。', 1, 4, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '商品の1/3を割引するルール', FALSE, 1),
    (gen_random_uuid(), q_id, '賞味期限の1/3が過ぎると納品できないルール', TRUE, 2),
    (gen_random_uuid(), q_id, '食品の1/3は捨ててもいいルール', FALSE, 3),
    (gen_random_uuid(), q_id, '価格の1/3を寄付するルール', FALSE, 4);
END $$;

-- Q5: 세부정보 (외국인 생활 지원)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n特に医療に関しては、言葉の壁により適切な治療を受けられないケースが問題となっており、医療通訳の整備が急がれている。\n子育て支援も重要な分野だ。外国にルーツを持つ子どもたちが学校生活に適応できるよう、日本語指導や母語を活用した学習支援が行われている。\n\n質問：外国人住民の医療に関する課題は何ですか？', '「言葉の壁により適切な治療を受けられないケース」が問題です。언어 장벽으로 적절한 치료를 받지 못하는 것이 문제입니다。', 1, 5, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '保険に加入できない', FALSE, 1),
    (gen_random_uuid(), q_id, '病院が不足している', FALSE, 2),
    (gen_random_uuid(), q_id, '言葉の壁により適切な治療を受けられない', TRUE, 3),
    (gen_random_uuid(), q_id, '医療費が高すぎる', FALSE, 4);
END $$;

-- Q6: 세부정보 (의료 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の医療制度は「国民皆保険」を基本としており、全ての国民が何らかの公的な健康保険に加入することが義務づけられている。これにより、医療費の自己負担は原則3割で済む。\n紹介状なしで大病院を受診すると、追加の費用がかかる場合がある。\n\n質問：日本の医療費の自己負担は原則何割ですか？', '「医療費の自己負担は原則3割」と書いてあります。의료비 자기부담은 원칙적으로 3할입니다。', 1, 6, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1割', FALSE, 1),
    (gen_random_uuid(), q_id, '2割', FALSE, 2),
    (gen_random_uuid(), q_id, '3割', TRUE, 3),
    (gen_random_uuid(), q_id, '5割', FALSE, 4);
END $$;

-- Q7: 세부정보 (지방 이주)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n内閣府の調査によると、東京圏在住者の約3割が地方移住に関心を持っており、特に20代〜30代の若い世代で関心が高い。\nコロナ禍でテレワークが定着したことで、都市部で働きながら地方に住むという選択肢が現実的になったことも大きな要因である。\n\n質問：地方移住への関心が高まった大きな要因の一つは何ですか？', '「テレワークが定着したことで、都市部で働きながら地方に住むという選択肢が現実的になった」と書いてあります。재택근무 정착이 큰 요인입니다。', 1, 7, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '地方の給与が上がったから', FALSE, 1),
    (gen_random_uuid(), q_id, '東京の人口が減ったから', FALSE, 2),
    (gen_random_uuid(), q_id, '地方のインターネットが速くなったから', FALSE, 3),
    (gen_random_uuid(), q_id, 'テレワークが定着したから', TRUE, 4);
END $$;

-- Q8: 문맥어휘 (워크라이프 밸런스)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本はかつて「企業戦士」「モーレツ社員」という言葉に象徴されるように、長時間労働が美徳とされる社会だった。その結果、「過労死」という言葉が英語でも「Karoshi」としてそのまま使われるほど、深刻な社会問題となった。\n\n質問：「美徳」の意味に一番近いものはどれですか？', '「美徳」は道徳的に優れた行いや価値のことです。도덕적으로 가치 있는 것이라는 뜻입니다。', 1, 8, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '美しい徳目、望ましい価値', TRUE, 1),
    (gen_random_uuid(), q_id, '悪い習慣', FALSE, 2),
    (gen_random_uuid(), q_id, '法的義務', FALSE, 3),
    (gen_random_uuid(), q_id, '流行している文化', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (SNS와 커뮤니케이션)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n匿名性を利用した誹謗中傷は深刻な社会問題となっており、精神的な被害を受ける人が後を絶たない。情報の真偽を見極めるメディアリテラシーの重要性がかつてないほど高まっている。\n\n質問：「後を絶たない」の意味に一番近いものはどれですか？', '「後を絶たない」は「続いて起こり、なくならない」という意味です。계속 끊이지 않는다는 뜻입니다。', 1, 9, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '減っている', FALSE, 1),
    (gen_random_uuid(), q_id, '後を絶たない', TRUE, 2),
    (gen_random_uuid(), q_id, '突然始まった', FALSE, 3),
    (gen_random_uuid(), q_id, '完全になくなった', FALSE, 4);
END $$;

-- Q10: 추론 (고령화 사회의 본질적 과제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nかつては高齢者1人を現役世代約10人で支えていたが、現在では約2人で支えなければならない計算になる。\n政府はさまざまな対策を講じているが、出生率の回復には至っていない。子育て支援の充実、働き方改革、地方創生など、複合的なアプローチが求められている。\n\n質問：筆者が主張したいことは何だと考えられますか？', '筆者は一つの対策だけでなく「複合的なアプローチ」が必要だと主張しています。복합적인 접근이 필요하다는 것입니다。', 1, 10, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '外国人労働者を増やせば解決する', FALSE, 1),
    (gen_random_uuid(), q_id, '年金制度を廃止すべきだ', FALSE, 2),
    (gen_random_uuid(), q_id, '一つの対策ではなく複合的なアプローチが必要だ', TRUE, 3),
    (gen_random_uuid(), q_id, '高齢者がもっと長く働けばいい', FALSE, 4);
END $$;

-- ============================================
-- N1 読解クイズ (10 questions)
-- Categories: 내용이해(4), 세부정보(3), 문맥어휘(2), 추론(1)
-- ============================================

-- Q1: 내용이해 (경어 체계의 변천)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n伝統的に、日本語の敬語は「尊敬語」「謙譲語」「丁寧語」の三分類で整理されてきた。ところが、2007年に文化審議会が発表した「敬語の指針」では、これが五分類に再編された。具体的には、従来の謙譲語が「謙譲語I」と「謙譲語II（丁重語）」に分けられ、また「丁寧語」から「美化語」が独立した。\n\n質問：2007年の「敬語の指針」で、敬語はどのように変わりましたか？', '3分類から5分類に再編されました。3분류에서 5분류로 재편되었습니다。', 1, 1, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5分類から3分類に簡素化された', FALSE, 1),
    (gen_random_uuid(), q_id, '3分類から5分類に再編された', TRUE, 2),
    (gen_random_uuid(), q_id, '3分類から7分類に細分化された', FALSE, 3),
    (gen_random_uuid(), q_id, '敬語の分類が廃止された', FALSE, 4);
END $$;

-- Q2: 내용이해 (다문화 공생)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本語能力が不十分なまま通常の授業に参加せざるを得ない子どもたちは、学力の遅れだけでなく、アイデンティティの揺らぎという問題にも直面する。母語も日本語も中途半端になる「ダブルリミテッド」の状態に陥るケースも報告されている。\n\n質問：「ダブルリミテッド」とはどのような状態ですか？', '母語も日本語も中途半端になる状態です。모국어도 일본어도 중간 수준에 머무는 상태입니다。', 1, 2, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '二つの言語を完璧に使いこなす状態', FALSE, 1),
    (gen_random_uuid(), q_id, '日本語しかできない状態', FALSE, 2),
    (gen_random_uuid(), q_id, '母語も日本語も十分でない状態', TRUE, 3),
    (gen_random_uuid(), q_id, '二つの国籍を持つ状態', FALSE, 4);
END $$;

-- Q3: 내용이해 (소비 행동 변화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nかつてのような「モノ消費」、すなわちブランド品や高級車を所有することにステータスを見出す傾向は薄れ、代わりに「コト消費」と呼ばれる体験型の消費が台頭している。\nカーシェアリングやフリマアプリの利用者数の増加は、所有から利用へという消費パラダイムの転換を如実に物語っている。\n\n質問：現代の日本の消費行動の変化として正しいものはどれですか？', '「モノ消費」から「コト消費」（体験型消費）への転換が起きています。소유에서 이용으로의 전환이 일어나고 있습니다。', 1, 3, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブランド品の購入がさらに増えた', FALSE, 1),
    (gen_random_uuid(), q_id, 'モノの所有より体験消費に変わりつつある', TRUE, 2),
    (gen_random_uuid(), q_id, '消費自体が減った', FALSE, 3),
    (gen_random_uuid(), q_id, '高級車の販売が増えている', FALSE, 4);
END $$;

-- Q4: 내용이해 (지역 커뮤니티)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n東日本大震災をはじめとする度重なる自然災害は、地域のつながりの重要性を改めて浮き彫りにした。災害時に最も頼りになるのは、日頃から顔の見える関係を築いている隣人たちだということが、多くの被災地の経験から明らかになった。\n\n質問：自然災害の経験から明らかになったことは何ですか？', '「日頃から顔の見える関係を築いている隣人たちが最も頼りになる」と述べています。평소 얼굴을 아는 이웃이 가장 의지가 된다는 것입니다。', 1, 4, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '行政の支援だけで十分だ', FALSE, 1),
    (gen_random_uuid(), q_id, '一人で備えることが最も重要だ', FALSE, 2),
    (gen_random_uuid(), q_id, '日頃の近隣との関係が最も頼りになる', TRUE, 3),
    (gen_random_uuid(), q_id, 'SNSの連絡が最も効果的だ', FALSE, 4);
END $$;

-- Q5: 세부정보 (사계절과 문학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n松尾芭蕉の「古池や蛙飛び込む水の音」における「蛙」は春の季語であり、冬の静寂が破られる瞬間の生命の躍動を表現している。\n清少納言の『枕草子』は、「春はあけぼの」という有名な冒頭に始まり、各季節の最も美しい時間帯を繊細に描き出した。\n\n質問：松尾芭蕉の俳句で「蛙」はどの季節の季語ですか？', '「蛙は春の季語」と書いてあります。개구리는 봄의 기고(계절어)입니다。', 1, 5, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '春', TRUE, 1),
    (gen_random_uuid(), q_id, '夏', FALSE, 2),
    (gen_random_uuid(), q_id, '秋', FALSE, 3),
    (gen_random_uuid(), q_id, '冬', FALSE, 4);
END $$;

-- Q6: 세부정보 (돌봄 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最も深刻なのは、介護人材の不足である。介護職の離職率は高く、その背景には低賃金と過酷な労働環境がある。全産業平均と比較して月額約6万円低い給与水準は、若い世代がこの業界を敬遠する一因となっている。\n\n質問：介護人材が不足している主な背景は何ですか？', '「低賃金と過酷な労働環境」が背景として挙げられています。낮은 임금과 가혹한 노동 환경이 주요 배경입니다。', 1, 6, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '資格取得が難しいから', FALSE, 1),
    (gen_random_uuid(), q_id, '仕事が退屈だから', FALSE, 2),
    (gen_random_uuid(), q_id, '低賃金と過酷な労働環境', TRUE, 3),
    (gen_random_uuid(), q_id, '外国人労働者との競争', FALSE, 4);
END $$;

-- Q7: 세부정보 (교육 격차)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n年収400万円未満の家庭の大学進学率が約30%であるのに対し、年収1000万円以上の家庭では約60%に達する。この差は、塾や予備校の費用、大学の学費など、教育にかかる経済的負担の大きさを反映している。\n\n質問：年収1000万円以上の家庭の大学進学率は約何%ですか？', '「年収1000万円以上の家庭では約60%」と書いてあります。연수입 1000만 엔 이상 가정의 대학 진학률은 약 60%입니다。', 1, 7, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約30%', FALSE, 1),
    (gen_random_uuid(), q_id, '約45%', FALSE, 2),
    (gen_random_uuid(), q_id, '約60%', TRUE, 3),
    (gen_random_uuid(), q_id, '約90%', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (식품 안전)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n食の安全に対する消費者の関心は、過去の食品偽装事件や農薬混入問題を経て、かつてないほど高まっている。\n安全性の高い食品は総じて価格も高く、全ての消費者が手にできるわけではない。食の安全を一部の富裕層だけの特権としないためにも、安全で手頃な価格の食品を安定的に供給できる仕組みの構築が重要だ。\n\n質問：「かつてないほど」の意味に一番近いものはどれですか？', '「かつてないほど」は「今までにないくらい」という意味です。지금까지 없었을 정도로 라는 뜻입니다。', 1, 8, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '以前と同じ程度に', FALSE, 1),
    (gen_random_uuid(), q_id, '以前より少し', FALSE, 2),
    (gen_random_uuid(), q_id, 'かつてないほど', TRUE, 3),
    (gen_random_uuid(), q_id, '予想した通り', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (모호한 표현)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「ちょっと…」「考えておきます」「前向きに検討します」といった表現は、言葉通りに受け取ると肯定的に聞こえるが、実際には婉曲的な断りを意味することが多い。\n直接的な拒絶や否定は相手の面子を潰し、人間関係に亀裂を生じさせるリスクがある。\n\n質問：「婉曲的」の意味に一番近いものはどれですか？', '「婉曲的」は直接的でなく、遠回しに表現するという意味です。직접적이지 않고 돌려서 말하는이라는 뜻입니다。', 1, 9, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '直接的で明確な', FALSE, 1),
    (gen_random_uuid(), q_id, '嘘をつく', FALSE, 2),
    (gen_random_uuid(), q_id, '遠回しに言う', TRUE, 3),
    (gen_random_uuid(), q_id, '感情的な', FALSE, 4);
END $$;

-- Q10: 추론 (모호한 표현의 본질)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n曖昧表現を日本語の「欠点」と見るか「豊かさ」と見るかは、立場によって異なる。確かに、曖昧さが責任の所在を不明確にし、意思決定を遅延させるという批判は正当である。しかし同時に、相手の立場を慮り、衝突を回避しようとする配慮の表れでもある。\n重要なのは、相手や状況に応じて、曖昧な表現と明確な表現を使い分ける能力を身につけることであろう。\n\n質問：筆者が最も主張したいことは何ですか？', '筆者は曖昧表現の良し悪しではなく、「状況に応じて使い分ける能力が重要」だと主張しています。상황에 따라 구분하여 사용하는 능력이 중요하다는 것입니다。', 1, 10, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '曖昧な表現を完全になくすべきだ', FALSE, 1),
    (gen_random_uuid(), q_id, '曖昧な表現は日本語の長所だ', FALSE, 2),
    (gen_random_uuid(), q_id, '状況に応じて曖昧な表現と明確な表現を使い分ける能力が重要だ', TRUE, 3),
    (gen_random_uuid(), q_id, '外国人には明確な表現だけ使うべきだ', FALSE, 4);
END $$;

-- ============================================
-- Additional Reading Questions (+20 per quiz, Q11-Q30)
-- ============================================

-- ============================================
-- N5 読解 追加問題 (Q11-Q30)
-- ============================================

-- N5 Q11: 내용이해 (학교 안내문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nがくせいの みなさんへ\nあしたは たいいくの じゅぎょうが あります。うんどうぐつを もってきてください。たいいくかんに 9じに あつまってください。\nせんせいより\n\n質問：あした なにを もっていきますか？', '「うんどうぐつを もってきてください」と書いてあります。내일 운동화를 가져가야 합니다。', 1, 11, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '教科書', FALSE, 1),
    (gen_random_uuid(), q_id, 'お弁当', FALSE, 2),
    (gen_random_uuid(), q_id, '運動靴', TRUE, 3),
    (gen_random_uuid(), q_id, '水着', FALSE, 4);
END $$;

-- N5 Q12: 세부정보 (전단지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nさくらレストラン\nひる：11じ〜2じ\nよる：5じ〜9じ\nやすみ：すいようび\nランチセット：800えん（サラダ、スープつき）\n\n質問：ランチセットに ついているものは なんですか？', '「サラダ、スープつき」と書いてあります。런치 세트에는 샐러드와 수프가 포함되어 있습니다。', 1, 12, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サラダと飲み物', FALSE, 1),
    (gen_random_uuid(), q_id, 'スープとデザート', FALSE, 2),
    (gen_random_uuid(), q_id, 'サラダとスープ', TRUE, 3),
    (gen_random_uuid(), q_id, 'パンとスープ', FALSE, 4);
END $$;

-- N5 Q13: 내용이해 (일기)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうは にちようびです。あさ こうえんで ジョギングを しました。それから としょかんで ほんを よみました。ごごは ともだちと えいがを みました。とても たのしかったです。\n\n質問：この人は ごぜん なにを しましたか？', '朝は公園でジョギング、それから図書館で本を読みました。오전에는 조깅과 독서를 했습니다。', 1, 13, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '映画を見た', FALSE, 1),
    (gen_random_uuid(), q_id, 'ジョギングと読書をした', TRUE, 2),
    (gen_random_uuid(), q_id, '友達に会った', FALSE, 3),
    (gen_random_uuid(), q_id, '買い物をした', FALSE, 4);
END $$;

-- N5 Q14: 문맥어휘 (메모)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nたなかさんへ\nでんわが ありました。やまださんから です。あしたの かいぎは 3じに かわりました。2じでは ありません。\nすずきより\n\n質問：「かわりました」は なんの いみですか？', '「かわりました」は「変わりました」で、時間が変更されたことを意味します。변경되었다는 의미입니다。', 1, 14, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キャンセルされた', FALSE, 1),
    (gen_random_uuid(), q_id, '変更された', TRUE, 2),
    (gen_random_uuid(), q_id, '始まった', FALSE, 3),
    (gen_random_uuid(), q_id, '終わった', FALSE, 4);
END $$;

-- N5 Q15: 세부정보 (가족 소개)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしの かぞくは 4にんです。ちちと ははと あにと わたしです。ちちは かいしゃいんです。ははは せんせいです。あには だいがくせいです。\n\n質問：おかあさんの しごとは なんですか？', '「ははは せんせいです」と書いてあります。어머니는 선생님입니다。', 1, 15, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会社員', FALSE, 1),
    (gen_random_uuid(), q_id, '大学生', FALSE, 2),
    (gen_random_uuid(), q_id, '先生', TRUE, 3),
    (gen_random_uuid(), q_id, '看護師', FALSE, 4);
END $$;

-- N5 Q16: 내용이해 (교통 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nえきから びょういんまで バスで 10ぷんです。バスは 1ばんの のりばから でます。30ぷんに 1かい あります。\n\n質問：バスは どのくらいの かんかくで ありますか？', '「30ぷんに 1かい あります」と書いてあります。30분에 1번 있습니다。', 1, 16, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10分に1回', FALSE, 1),
    (gen_random_uuid(), q_id, '20分に1回', FALSE, 2),
    (gen_random_uuid(), q_id, '30分に1回', TRUE, 3),
    (gen_random_uuid(), q_id, '1時間に1回', FALSE, 4);
END $$;

-- N5 Q17: 세부정보 (날씨 예보)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nあしたの てんきよほう\nあさ：はれ\nひる：くもり\nよる：あめ\nかさを もっていった ほうが いいです。\n\n質問：いつから あめが ふりますか？', '「よる：あめ」と書いてあります。밤부터 비가 옵니다。', 1, 17, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '朝から', FALSE, 1),
    (gen_random_uuid(), q_id, '昼から', FALSE, 2),
    (gen_random_uuid(), q_id, '夜から', TRUE, 3),
    (gen_random_uuid(), q_id, '一日中', FALSE, 4);
END $$;

-- N5 Q18: 문맥어휘 (쇼핑)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nこの みせでは やさいが とても やすいです。にんじんは 1ぽん 50えんです。たまねぎは 3つで 100えんです。まいにち たくさんの ひとが きます。\n\n質問：「やすい」は なんの いみですか？', '「やすい」は「安い」で、値段が低いことを意味します。(가격이) 싸다는 의미입니다。', 1, 18, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おいしい', FALSE, 1),
    (gen_random_uuid(), q_id, '安い', TRUE, 2),
    (gen_random_uuid(), q_id, '高い', FALSE, 3),
    (gen_random_uuid(), q_id, '新鮮だ', FALSE, 4);
END $$;

-- N5 Q19: 추론 (초대)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nリンさんへ\nこんど の どようび、うちで パーティーを します。ともだちも たくさん きます。りょうりも つくります。リンさんも きませんか。\nたなかより\n\n質問：たなかさんは リンさんに なにを したいですか？', '「リンさんも きませんか」は誘いの表現です。田中さんはリンさんをパーティーに招待したいと考えています。파티에 초대하고 싶어합니다。', 1, 19, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '料理を教えたい', FALSE, 1),
    (gen_random_uuid(), q_id, 'パーティーに招待したい', TRUE, 2),
    (gen_random_uuid(), q_id, 'プレゼントをあげたい', FALSE, 3),
    (gen_random_uuid(), q_id, '一緒に勉強したい', FALSE, 4);
END $$;

-- N5 Q20: 내용이해 (취미)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしの しゅみは りょうりです。まいにち よるごはんを つくります。にほんの りょうりが すきです。とくに おすしが だいすきです。でも つくるのは むずかしいです。\n\n質問：この ひとが いちばん すきな りょうりは なんですか？', '「とくに おすしが だいすきです」と書いてあります。특히 초밥을 가장 좋아합니다。', 1, 20, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ラーメン', FALSE, 1),
    (gen_random_uuid(), q_id, 'おすし', TRUE, 2),
    (gen_random_uuid(), q_id, 'カレー', FALSE, 3),
    (gen_random_uuid(), q_id, 'てんぷら', FALSE, 4);
END $$;

-- N5 Q21: 세부정보 (병원 접수)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nやまだ びょういん\nうけつけ じかん：ごぜん 9じ〜12じ、ごご 2じ〜5じ\nやすみ：にちようびと しゅくじつ\nはじめての ひとは ほけんしょうを もってきてください。\n\n質問：はじめての ひとは なにが ひつようですか？', '「ほけんしょうを もってきてください」と書いてあります。처음 오는 사람은 보험증이 필요합니다。', 1, 21, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パスポート', FALSE, 1),
    (gen_random_uuid(), q_id, '保険証', TRUE, 2),
    (gen_random_uuid(), q_id, '学生証', FALSE, 3),
    (gen_random_uuid(), q_id, '診察券', FALSE, 4);
END $$;

-- N5 Q22: 내용이해 (여행 계획)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nらいしゅう おおさかに いきます。しんかんせんで いきます。2はく します。おおさかじょうと どうとんぼりに いきたいです。\n\n質問：なんで おおさかに いきますか？', '「しんかんせんで いきます」と書いてあります。신칸센으로 갑니다。', 1, 22, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '飛行機', FALSE, 1),
    (gen_random_uuid(), q_id, 'バス', FALSE, 2),
    (gen_random_uuid(), q_id, '新幹線', TRUE, 3),
    (gen_random_uuid(), q_id, '車', FALSE, 4);
END $$;

-- N5 Q23: 추론 (메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nキムさんへ\nあした いっしょに べんきょうしませんか。としょかんで 10じに まっています。おわったら、いっしょに おひるごはんを たべましょう。\nリンより\n\n質問：リンさんは あした なにを しますか？', 'リンさんは図書館で勉強した後、一緒に昼ご飯を食べる予定です。공부 후 점심을 같이 먹습니다。', 1, 23, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '勉強だけする', FALSE, 1),
    (gen_random_uuid(), q_id, '勉強した後、一緒にお昼ごはんを食べる', TRUE, 2),
    (gen_random_uuid(), q_id, 'お昼ごはんだけ食べる', FALSE, 3),
    (gen_random_uuid(), q_id, '映画を見る', FALSE, 4);
END $$;

-- N5 Q24: 세부정보 (자기소개)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしは パクです。かんこくから きました。いま とうきょうに すんでいます。にほんごの がっこうに かよっています。まいにち 3じかん べんきょうします。\n\n質問：パクさんは まいにち なんじかん べんきょうしますか？', '「まいにち 3じかん べんきょうします」と書いてあります。매일 3시간 공부합니다。', 1, 24, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1時間', FALSE, 1),
    (gen_random_uuid(), q_id, '2時間', FALSE, 2),
    (gen_random_uuid(), q_id, '3時間', TRUE, 3),
    (gen_random_uuid(), q_id, '4時間', FALSE, 4);
END $$;

-- N5 Q25: 문맥어휘 (도서관 규칙)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nとしょかんの きまり\n・しずかに してください。\n・ほんは 2しゅうかん かりられます。\n・たべものと のみものは だめです。\n\n質問：「だめです」は なんの いみですか？', '「だめです」は禁止を表す表現で、「안 됩니다 / 금지입니다」の意味です。', 1, 25, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いい', FALSE, 1),
    (gen_random_uuid(), q_id, 'だめだ', TRUE, 2),
    (gen_random_uuid(), q_id, '必要だ', FALSE, 3),
    (gen_random_uuid(), q_id, 'できる', FALSE, 4);
END $$;

-- N5 Q26: 내용이해 (아르바이트 모집)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアルバイト ぼしゅう\nコンビニの しごとです。\nじかん：ごご 6じ〜10じ\nきゅうりょう：1じかん 1000えん\nがくせい OK\n\n質問：1にち なんじかん はたらきますか？', '午後6時〜10時なので、4時間です。하루 4시간 일합니다。', 1, 26, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3時間', FALSE, 1),
    (gen_random_uuid(), q_id, '4時間', TRUE, 2),
    (gen_random_uuid(), q_id, '5時間', FALSE, 3),
    (gen_random_uuid(), q_id, '6時間', FALSE, 4);
END $$;

-- N5 Q27: 추론 (감사 편지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nせんせいへ\nいつも ていねいに おしえてくださって、ありがとうございます。おかげで にほんごが すこし わかるように なりました。これからも がんばります。\nキムより\n\n質問：キムさんは いま どう おもっていますか？', 'キムさんは先生に感謝し、日本語が少しわかるようになったと言っています。감사하고 있으며 앞으로도 열심히 하겠다고 합니다。', 1, 27, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本語が難しすぎてあきらめたい', FALSE, 1),
    (gen_random_uuid(), q_id, '先生に感謝して、これからもがんばりたい', TRUE, 2),
    (gen_random_uuid(), q_id, '先生の授業に不満だ', FALSE, 3),
    (gen_random_uuid(), q_id, '日本語を全部覚えた', FALSE, 4);
END $$;

-- N5 Q28: 세부정보 (아파트 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアパートの みなさんへ\nすいようびは ゴミの ひです。あさ 8じまでに だしてください。ペットボトルは きんようびに だしてください。\nかんりにんより\n\n質問：ペットボトルは いつ だしますか？', '「ペットボトルは きんようびに だしてください」と書いてあります。페트병은 금요일에 내놓습니다。', 1, 28, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '水曜日', FALSE, 1),
    (gen_random_uuid(), q_id, '木曜日', FALSE, 2),
    (gen_random_uuid(), q_id, '金曜日', TRUE, 3),
    (gen_random_uuid(), q_id, '月曜日', FALSE, 4);
END $$;

-- N5 Q29: 내용이해 (계절)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nにほんの なつは あつくて、むしむしします。7がつと 8がつが いちばん あついです。みんな うみや プールに いきます。かきごおりが にんきです。\n\n質問：にほんの なつの とくちょうは なんですか？', '「あつくて、むしむしします」と書いてあります。일본의 여름은 덥고 습합니다。', 1, 29, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '寒くて乾燥している', FALSE, 1),
    (gen_random_uuid(), q_id, '暑くてむしむしする', TRUE, 2),
    (gen_random_uuid(), q_id, '涼しくて快適だ', FALSE, 3),
    (gen_random_uuid(), q_id, '雨がたくさん降る', FALSE, 4);
END $$;

-- N5 Q30: 문맥어휘 (약속 변경)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nすみません、あしたの やくそくですが、ちょっと つごうが わるくなりました。あさっては どうですか。おなじ じかんで おねがいします。\n\n質問：「つごうが わるい」は なんの いみですか？', '「つごうが わるい」は「都合が悪い」で、予定が合わないことを意味します。사정이 안 좋다 / 시간이 안 된다는 의미입니다。', 1, 30, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '気分が悪い', FALSE, 1),
    (gen_random_uuid(), q_id, '都合が悪い', TRUE, 2),
    (gen_random_uuid(), q_id, '天気が悪い', FALSE, 3),
    (gen_random_uuid(), q_id, '体の調子が悪い', FALSE, 4);
END $$;

-- ============================================
-- N4 読解 追加問題 (Q11-Q30)
-- ============================================

-- N4 Q11: 내용이해 (회사 안내 메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n社員の皆さんへ\n来週の月曜日から、会社の入り口が変わります。正面ではなく、横の入り口を使ってください。工事は2週間かかります。ご迷惑をおかけしますが、よろしくお願いします。\n\n質問：来週から何が変わりますか？', '「会社の入り口が変わります」と書いてあります。회사 입구가 변경됩니다。', 1, 11, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '勤務時間', FALSE, 1),
    (gen_random_uuid(), q_id, '会社の入り口', TRUE, 2),
    (gen_random_uuid(), q_id, '昼休みの時間', FALSE, 3),
    (gen_random_uuid(), q_id, '会議室', FALSE, 4);
END $$;

-- N4 Q12: 세부정보 (이벤트 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n春のフリーマーケット\n日時：4月15日（土）10時〜16時\n場所：中央公園\n参加費：1ブース 500円\n雨天の場合は翌日に延期します。\n申し込み：4月10日まで\n\n質問：雨が降ったらどうなりますか？', '「雨天の場合は翌日に延期します」と書いてあります。비가 오면 다음 날로 연기됩니다。', 1, 12, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '中止になる', FALSE, 1),
    (gen_random_uuid(), q_id, '翌日に延期される', TRUE, 2),
    (gen_random_uuid(), q_id, '室内で行う', FALSE, 3),
    (gen_random_uuid(), q_id, 'そのまま行う', FALSE, 4);
END $$;

-- N4 Q13: 내용이해 (일상 블로그)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n先週、新しいカフェに行きました。駅から歩いて5分のところにあります。ケーキがおいしくて、コーヒーも安いです。でも、席が少ないので、週末は混んでいます。平日に行くほうがいいと思います。\n\n質問：この人はいつ行くことをすすめていますか？', '「平日に行くほうがいいと思います」と言っています。평일에 가는 것을 추천합니다。', 1, 13, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '週末の午前', FALSE, 1),
    (gen_random_uuid(), q_id, '平日', TRUE, 2),
    (gen_random_uuid(), q_id, '週末の午後', FALSE, 3),
    (gen_random_uuid(), q_id, '祝日', FALSE, 4);
END $$;

-- N4 Q14: 문맥어휘 (요리 레시피)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nかんたんオムライス\n1. たまねぎを細かく切ります。\n2. フライパンで炒めます。\n3. ごはんとケチャップを入れて混ぜます。\n4. 別のフライパンでたまごを焼きます。\n5. ごはんの上にたまごをのせて、できあがりです。\n\n質問：「炒めます」の意味は何ですか？', '「炒めます」は火を使って食材をかき混ぜながら加熱することです。볶다라는 의미입니다。', 1, 14, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ゆでる', FALSE, 1),
    (gen_random_uuid(), q_id, '炒める', TRUE, 2),
    (gen_random_uuid(), q_id, '蒸す', FALSE, 3),
    (gen_random_uuid(), q_id, '揚げる', FALSE, 4);
END $$;

-- N4 Q15: 추론 (감사 메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n田中先輩へ\n昨日は引っ越しを手伝ってくださって、ありがとうございました。おかげさまで予定より早く終わりました。今度、お礼にご飯をおごらせてください。\n金より\n\n質問：金さんはこれから何をしたいですか？', '「お礼にご飯をおごらせてください」と言っています。감사의 뜻으로 밥을 사고 싶어합니다。', 1, 15, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'また引っ越しを手伝ってほしい', FALSE, 1),
    (gen_random_uuid(), q_id, 'お礼にご飯をおごりたい', TRUE, 2),
    (gen_random_uuid(), q_id, 'プレゼントを送りたい', FALSE, 3),
    (gen_random_uuid(), q_id, '手紙を書きたい', FALSE, 4);
END $$;

-- N4 Q16: 내용이해 (스포츠 클럽)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nスポーツクラブ会員募集\n月会費：5000円\nプール・ジム使い放題\n営業時間：朝7時〜夜10時\n初回体験は無料です。\n持ち物：運動着、タオル、室内シューズ\n\n質問：初めての人はいくら払いますか？', '「初回体験は無料です」と書いてあります。처음 체험은 무료입니다。', 1, 16, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5000円', FALSE, 1),
    (gen_random_uuid(), q_id, '3000円', FALSE, 2),
    (gen_random_uuid(), q_id, '無料', TRUE, 3),
    (gen_random_uuid(), q_id, '1000円', FALSE, 4);
END $$;

-- N4 Q17: 세부정보 (여행 후기)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n先月、京都に旅行に行きました。一日目はお寺を見て回りました。二日目は着物を着て街を歩きました。三日目は抹茶の体験をしました。京都は古い建物が多くて、とてもきれいでした。\n\n質問：二日目に何をしましたか？', '「二日目は着物を着て街を歩きました」と書いてあります。이틀째에는 기모노를 입고 거리를 걸었습니다。', 1, 17, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お寺を見て回った', FALSE, 1),
    (gen_random_uuid(), q_id, '着物を着て街を歩いた', TRUE, 2),
    (gen_random_uuid(), q_id, '抹茶の体験をした', FALSE, 3),
    (gen_random_uuid(), q_id, '買い物をした', FALSE, 4);
END $$;

-- N4 Q18: 내용이해 (건강 조언)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n健康のために大切なことが三つあります。一つ目は、毎日少しでも運動することです。二つ目は、野菜を多く食べることです。三つ目は、十分な睡眠をとることです。この三つを守れば、病気になりにくくなります。\n\n質問：健康のために大切なことはいくつありますか？', '「健康のために大切なことが三つあります」と書いてあります。건강을 위해 중요한 것은 3가지입니다。', 1, 18, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2つ', FALSE, 1),
    (gen_random_uuid(), q_id, '3つ', TRUE, 2),
    (gen_random_uuid(), q_id, '4つ', FALSE, 3),
    (gen_random_uuid(), q_id, '5つ', FALSE, 4);
END $$;

-- N4 Q19: 문맥어휘 (계절 묘사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n秋になると、木の葉が赤や黄色に色づきます。これを「紅葉」と言います。日本では紅葉を見に山や公園に行く人がたくさんいます。京都の紅葉が特に有名です。\n\n質問：「色づく」の意味は何ですか？', '「色づく」は葉の色が変わることを意味します。색이 물들다 / 단풍이 들다의 의미입니다。', 1, 19, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '葉が落ちる', FALSE, 1),
    (gen_random_uuid(), q_id, '色が変わる', TRUE, 2),
    (gen_random_uuid(), q_id, '花が咲く', FALSE, 3),
    (gen_random_uuid(), q_id, '実がなる', FALSE, 4);
END $$;

-- N4 Q20: 추론 (고민 상담)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最近、夜なかなか眠れません。スマートフォンを見るのをやめたほうがいいと友達に言われました。確かに寝る前にいつもスマートフォンを使っています。今日から寝る前1時間はスマートフォンを見ないようにしてみます。\n\n質問：この人はこれから何をしますか？', '「寝る前1時間はスマートフォンを見ないようにしてみます」と言っています。잠자기 전 1시간은 스마트폰을 보지 않겠다고 합니다。', 1, 20, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '睡眠薬を飲む', FALSE, 1),
    (gen_random_uuid(), q_id, '寝る前1時間はスマートフォンを見ない', TRUE, 2),
    (gen_random_uuid(), q_id, 'スマートフォンを捨てる', FALSE, 3),
    (gen_random_uuid(), q_id, '病院に行く', FALSE, 4);
END $$;

-- N4 Q21: 내용이해 (교통 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n東京から大阪まで新幹線で2時間半かかります。飛行機なら1時間ですが、空港までの移動時間を入れると、あまり変わりません。安く行きたいなら、夜行バスもあります。約8時間かかりますが、5000円ぐらいで行けます。\n\n質問：一番安い方法はどれですか？', '夜行バスが「5000円ぐらいで行けます」と書いてあります。야간 버스가 가장 저렴합니다。', 1, 21, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '新幹線', FALSE, 1),
    (gen_random_uuid(), q_id, '飛行機', FALSE, 2),
    (gen_random_uuid(), q_id, '夜行バス', TRUE, 3),
    (gen_random_uuid(), q_id, 'タクシー', FALSE, 4);
END $$;

-- N4 Q22: 세부정보 (도서관 이용)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n図書館からのお知らせ\n本の貸し出し：1人5冊まで、2週間\nDVD：1人2枚まで、1週間\n返却が遅れた場合、1日につき10円の延滞料がかかります。\n\n質問：DVDは何枚まで借りられますか？', '「DVD：1人2枚まで」と書いてあります。DVD는 1인당 2장까지 빌릴 수 있습니다。', 1, 22, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1枚', FALSE, 1),
    (gen_random_uuid(), q_id, '2枚', TRUE, 2),
    (gen_random_uuid(), q_id, '3枚', FALSE, 3),
    (gen_random_uuid(), q_id, '5枚', FALSE, 4);
END $$;

-- N4 Q23: 추론 (선물 고민)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n友達の誕生日プレゼントに迷っています。本が好きだから本をあげようと思いましたが、同じ本を持っているかもしれません。それで、本屋のギフトカードにしようと思います。そうすれば、好きな本を自分で選べますから。\n\n質問：この人は最終的に何をプレゼントしますか？', '「本屋のギフトカードにしようと思います」と言っています。서점 기프트카드를 선물합니다。', 1, 23, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本', FALSE, 1),
    (gen_random_uuid(), q_id, '本屋のギフトカード', TRUE, 2),
    (gen_random_uuid(), q_id, '現金', FALSE, 3),
    (gen_random_uuid(), q_id, '花', FALSE, 4);
END $$;

-- N4 Q24: 내용이해 (환경 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最近、マイバッグを持って買い物に行く人が増えています。2020年からレジ袋が有料になったからです。環境のためにプラスチックを減らすことが大切です。小さなことから始めましょう。\n\n質問：なぜマイバッグを持つ人が増えましたか？', '「レジ袋が有料になったからです」と書いてあります。비닐봉지가 유료가 되었기 때문입니다。', 1, 24, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'マイバッグが流行だから', FALSE, 1),
    (gen_random_uuid(), q_id, 'レジ袋が有料になったから', TRUE, 2),
    (gen_random_uuid(), q_id, 'マイバッグが無料で配られるから', FALSE, 3),
    (gen_random_uuid(), q_id, 'レジ袋が足りないから', FALSE, 4);
END $$;

-- N4 Q25: 문맥어휘 (직장 이메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nお疲れ様です。明日の会議の資料を添付します。ご確認の上、修正点があればお知らせください。なお、会議の時間が14時から15時に変更になりましたのでご注意ください。\n\n質問：「添付」の意味は何ですか？', '「添付」はメールにファイルを付けることです。첨부하다의 의미입니다。', 1, 25, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '印刷する', FALSE, 1),
    (gen_random_uuid(), q_id, '添付する', TRUE, 2),
    (gen_random_uuid(), q_id, '削除する', FALSE, 3),
    (gen_random_uuid(), q_id, 'コピーする', FALSE, 4);
END $$;

-- N4 Q26: 세부정보 (아파트 규칙)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nマンションの規則\n・夜10時以降は大きな音を出さないでください。\n・ペットは小型犬と猫のみ飼えます。\n・ベランダでのバーベキューは禁止です。\n・ゴミは指定の場所に出してください。\n\n質問：このマンションで飼えない動物はどれですか？', '「小型犬と猫のみ飼えます」なので、大型犬は飼えません。소형견과 고양이만 가능하므로 대형견은 불가합니다。', 1, 26, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '小型犬', FALSE, 1),
    (gen_random_uuid(), q_id, '猫', FALSE, 2),
    (gen_random_uuid(), q_id, '大型犬', TRUE, 3),
    (gen_random_uuid(), q_id, '小型犬と猫の両方', FALSE, 4);
END $$;

-- N4 Q27: 추론 (학생 작문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本に来て一番驚いたことは、電車の正確さです。韓国でも電車は大体時間通りに来ますが、日本は1分も遅れないことが多いです。遅れた時はアナウンスで謝ります。日本人の時間に対する考え方がよくわかります。\n\n質問：この人が一番驚いたことは何ですか？', '「一番驚いたことは、電車の正確さです」と書いてあります。전철의 정확성에 가장 놀랐습니다。', 1, 27, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '電車がきれいなこと', FALSE, 1),
    (gen_random_uuid(), q_id, '電車の正確さ', TRUE, 2),
    (gen_random_uuid(), q_id, '電車の料金が高いこと', FALSE, 3),
    (gen_random_uuid(), q_id, '電車が混んでいること', FALSE, 4);
END $$;

-- N4 Q28: 내용이해 (일본 문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本では食事の前に「いただきます」と言い、食事の後に「ごちそうさまでした」と言います。これは食べ物への感謝の気持ちを表す言葉です。料理を作ってくれた人にも感謝しています。\n\n質問：「いただきます」は何を表していますか？', '「食べ物への感謝の気持ちを表す言葉です」と書いてあります。음식에 대한 감사의 마음을 나타냅니다。', 1, 28, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お腹がすいたということ', FALSE, 1),
    (gen_random_uuid(), q_id, '食べ物への感謝', TRUE, 2),
    (gen_random_uuid(), q_id, '食事の開始時間', FALSE, 3),
    (gen_random_uuid(), q_id, '料理の注文', FALSE, 4);
END $$;

-- N4 Q29: 세부정보 (수업 변경)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n学生の皆さんへ\n来週の水曜日、鈴木先生がお休みのため、3時間目の数学の授業は中止です。そのかわり、4時間目に田中先生の英語の授業があります。教科書を忘れないでください。\n\n質問：来週の水曜日の3時間目はどうなりますか？', '「3時間目の数学の授業は中止です」と書いてあります。3교시 수학 수업은 중지됩니다。', 1, 29, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '英語の授業に変更', FALSE, 1),
    (gen_random_uuid(), q_id, '他の先生が数学の授業', FALSE, 2),
    (gen_random_uuid(), q_id, '授業中止', TRUE, 3),
    (gen_random_uuid(), q_id, '自習', FALSE, 4);
END $$;

-- N4 Q30: 추론 (미래 꿈)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n私の夢はITエンジニアとして日本で働くことです。そのために、毎日プログラミングの勉強をしています。日本語も上手になりたいので、日本のドラマを見たり、日本人の友達と話したりしています。大変ですが、とても楽しいです。\n\n質問：この人が日本語の勉強のためにしていることは何ですか？', '「日本のドラマを見たり、日本人の友達と話したり」と言っています。일본 드라마를 보거나 일본인 친구와 이야기합니다。', 1, 30, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '教科書だけ勉強する', FALSE, 1),
    (gen_random_uuid(), q_id, '日本のドラマを見たり、日本人の友達と話したりする', TRUE, 2),
    (gen_random_uuid(), q_id, '日本語学校に通う', FALSE, 3),
    (gen_random_uuid(), q_id, '毎日日記を書く', FALSE, 4);
END $$;

-- ============================================
-- N3 読解 追加問題 (Q11-Q30)
-- ============================================

-- N3 Q11: 내용이해 (리모트워크 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nリモートワークを導入する企業が増えている。通勤時間がなくなるため、自由に使える時間が増えるというメリットがある。一方で、同僚とのコミュニケーションが減り、孤独を感じる人もいるという課題もある。\n\n質問：リモートワークの課題として挙げられているのは何ですか？', '「同僚とのコミュニケーションが減り、孤独を感じる人もいる」と書いてあります。동료와의 소통 감소와 고독감이 과제입니다。', 1, 11, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '通勤時間が長くなる', FALSE, 1),
    (gen_random_uuid(), q_id, '同僚とのコミュニケーション減少と孤独感', TRUE, 2),
    (gen_random_uuid(), q_id, '給料が減る', FALSE, 3),
    (gen_random_uuid(), q_id, 'インターネットの費用がかかる', FALSE, 4);
END $$;

-- N3 Q12: 세부정보 (영양 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n朝ごはんを食べないと、脳にエネルギーが行かず、集中力が下がります。特に学生は朝ごはんをしっかり食べることが大切です。理想的な朝ごはんは、ごはんやパンなどの炭水化物と、卵や牛乳などのたんぱく質を組み合わせたものです。\n\n質問：朝ごはんを食べないとどうなりますか？', '「脳にエネルギーが行かず、集中力が下がります」と書いてあります。집중력이 떨어집니다。', 1, 12, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '体重が減る', FALSE, 1),
    (gen_random_uuid(), q_id, '集中力が下がる', TRUE, 2),
    (gen_random_uuid(), q_id, '運動能力が上がる', FALSE, 3),
    (gen_random_uuid(), q_id, '睡眠の質が良くなる', FALSE, 4);
END $$;

-- N3 Q13: 문맥어휘 (비즈니스 메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nお世話になっております。先日お送りしたお見積もりについて、ご検討いただけましたでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください。何卒よろしくお願いいたします。\n\n質問：「お見積もり」の意味は何ですか？', '「お見積もり」は商品やサービスの料金を事前に計算した書類です。견적서의 의미입니다。', 1, 13, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '領収書', FALSE, 1),
    (gen_random_uuid(), q_id, '見積書', TRUE, 2),
    (gen_random_uuid(), q_id, '契約書', FALSE, 3),
    (gen_random_uuid(), q_id, '請求書', FALSE, 4);
END $$;

-- N3 Q14: 추론 (에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「失敗は成功のもと」ということわざがある。失敗すると落ち込んでしまうが、なぜ失敗したかを考え、次に活かすことが大切だ。何度失敗しても、あきらめずに挑戦し続ける人こそ、最後に成功する。\n\n質問：筆者が最も伝えたいことは何ですか？', '筆者は失敗から学んで挑戦し続けることの大切さを伝えています。실패에서 배우고 계속 도전하는 것이 중요합니다。', 1, 14, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '失敗しないことが大切だ', FALSE, 1),
    (gen_random_uuid(), q_id, '失敗から学んで挑戦し続けることが大切だ', TRUE, 2),
    (gen_random_uuid(), q_id, '失敗したら早くあきらめるべきだ', FALSE, 3),
    (gen_random_uuid(), q_id, '成功した人は失敗したことがない', FALSE, 4);
END $$;

-- N3 Q15: 내용이해 (환경 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n食品ロスが世界的な問題になっている。日本では年間約600万トンの食品が捨てられている。これを減らすために、「賞味期限」と「消費期限」の違いを正しく理解し、まだ食べられるものを無駄にしないことが重要だ。\n\n質問：日本で年間どのくらいの食品が捨てられていますか？', '「年間約600万トンの食品が捨てられている」と書いてあります。연간 약 600만 톤입니다。', 1, 15, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '約100万トン', FALSE, 1),
    (gen_random_uuid(), q_id, '約600万トン', TRUE, 2),
    (gen_random_uuid(), q_id, '約1000万トン', FALSE, 3),
    (gen_random_uuid(), q_id, '約60万トン', FALSE, 4);
END $$;

-- N3 Q16: 세부정보 (IT 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nパスワードの安全性を高めるためのポイントを紹介します。まず、8文字以上にすること。次に、大文字・小文字・数字・記号を組み合わせること。そして、同じパスワードを複数のサイトで使い回さないことです。定期的に変更することも推奨されます。\n\n質問：パスワードは最低何文字以上にすべきですか？', '「8文字以上にすること」と書いてあります。최소 8자 이상으로 해야 합니다。', 1, 16, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4文字', FALSE, 1),
    (gen_random_uuid(), q_id, '6文字', FALSE, 2),
    (gen_random_uuid(), q_id, '8文字', TRUE, 3),
    (gen_random_uuid(), q_id, '10文字', FALSE, 4);
END $$;

-- N3 Q17: 문맥어휘 (사회 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の少子高齢化は深刻な問題だ。若い世代の人口が減り、高齢者の割合が増えている。その結果、労働力の不足や社会保障費の増加といった課題に直面している。外国人労働者の受け入れ拡大も一つの対策として議論されている。\n\n質問：「少子高齢化」の意味は何ですか？', '「少子高齢化」は若い世代が減り高齢者が増えることです。저출산·고령화의 의미입니다。', 1, 17, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人口が急増すること', FALSE, 1),
    (gen_random_uuid(), q_id, '出生率が低く高齢者の割合が高くなること', TRUE, 2),
    (gen_random_uuid(), q_id, '若い人が海外に移住すること', FALSE, 3),
    (gen_random_uuid(), q_id, '都市の人口だけ増えること', FALSE, 4);
END $$;

-- N3 Q18: 추론 (IT 직장 문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本のIT企業では、「報連相（ほうれんそう）」が重視されている。報告・連絡・相談の頭文字を取ったものだ。問題が起きた時にすぐに上司に報告し、関係者に連絡し、困った時は一人で悩まず相談することが求められる。\n\n質問：「報連相」で最も重要視されていることは何ですか？', '報連相は問題の早期共有と円滑なコミュニケーションを重視しています。문제의 조기 공유와 원활한 소통이 중요합니다。', 1, 18, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '一人で問題を解決すること', FALSE, 1),
    (gen_random_uuid(), q_id, '情報を積極的に共有しコミュニケーションを取ること', TRUE, 2),
    (gen_random_uuid(), q_id, '上司の指示だけに従うこと', FALSE, 3),
    (gen_random_uuid(), q_id, '報告書をたくさん書くこと', FALSE, 4);
END $$;

-- N3 Q19: 내용이해 (취미 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最近、DIYが流行っている。自分で家具を作ったり、部屋をリフォームしたりする人が増えている。完成した時の達成感がやみつきになるらしい。ただし、工具の使い方を間違えると危険なので、初心者は簡単なものから始めるのがいいだろう。\n\n質問：筆者が初心者にアドバイスしていることは何ですか？', '「初心者は簡単なものから始めるのがいい」と言っています。초보자는 간단한 것부터 시작하는 게 좋다고 합니다。', 1, 19, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '専門家に任せるべきだ', FALSE, 1),
    (gen_random_uuid(), q_id, '簡単なものから始めるべきだ', TRUE, 2),
    (gen_random_uuid(), q_id, '高い道具を買うべきだ', FALSE, 3),
    (gen_random_uuid(), q_id, 'DIYをしてはいけない', FALSE, 4);
END $$;

-- N3 Q20: 세부정보 (구인 광고)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n【求人】Webエンジニア募集\n勤務地：東京都渋谷区\n給与：月25万〜40万円（経験による）\n勤務時間：フレックスタイム制（コアタイム11:00〜15:00）\n必須スキル：HTML/CSS/JavaScript\n歓迎スキル：React、TypeScript\n\n質問：必ず出社しなければならない時間は？', '「コアタイム11:00〜15:00」が必ず出社する時間です。코어 타임은 11시~15시입니다。', 1, 20, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '9時～17時', FALSE, 1),
    (gen_random_uuid(), q_id, '10時～16時', FALSE, 2),
    (gen_random_uuid(), q_id, '11時～15時', TRUE, 3),
    (gen_random_uuid(), q_id, '自由', FALSE, 4);
END $$;

-- N3 Q21: 내용이해 (문화 비교)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本では名刺交換がビジネスマナーの基本だ。名刺は両手で渡し、受け取る時も両手で受ける。もらった名刺はすぐにしまわず、テーブルの上に置いておくのが礼儀である。名刺を折ったり、メモを書いたりするのは失礼にあたる。\n\n質問：名刺をもらった後、すべきことは何ですか？', '「テーブルの上に置いておくのが礼儀」と書いてあります。테이블 위에 놓아두는 것이 예의입니다。', 1, 21, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すぐにポケットに入れる', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブルの上に置いておく', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモを書く', FALSE, 3),
    (gen_random_uuid(), q_id, '半分に折る', FALSE, 4);
END $$;

-- N3 Q22: 문맥어휘 (경제 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n円安が進んでいる。円安とは、外国の通貨に対して円の価値が下がることだ。輸出企業にとってはメリットがあるが、輸入品の価格が上がるため、消費者の生活には影響が出る。特にエネルギーや食料品の価格上昇が懸念されている。\n\n質問：「円安」の影響として正しいものはどれですか？', '円安では輸入品の価格が上がります。수입품 가격이 오릅니다。', 1, 22, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '輸入品の価格が下がる', FALSE, 1),
    (gen_random_uuid(), q_id, '輸入品の価格が上がる', TRUE, 2),
    (gen_random_uuid(), q_id, '輸出が減る', FALSE, 3),
    (gen_random_uuid(), q_id, '観光客が減る', FALSE, 4);
END $$;

-- N3 Q23: 추론 (자기 관리)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nスマートフォンの使いすぎが問題になっている。長時間画面を見ることで、目が疲れたり、肩がこったりする。また、寝る前にスマホを見ると、ブルーライトの影響で睡眠の質が低下する。使用時間を意識的にコントロールすることが必要だ。\n\n質問：筆者が提案していることは何ですか？', '「使用時間を意識的にコントロールすることが必要」と言っています。사용 시간을 의식적으로 조절해야 합니다。', 1, 23, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スマートフォンを使わない', FALSE, 1),
    (gen_random_uuid(), q_id, '使用時間を意識的にコントロールする', TRUE, 2),
    (gen_random_uuid(), q_id, 'ブルーライトカットメガネを買う', FALSE, 3),
    (gen_random_uuid(), q_id, 'スマートフォンの代わりにパソコンを使う', FALSE, 4);
END $$;

-- N3 Q24: 내용이해 (일본어 학습)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本語の敬語は「尊敬語」「謙譲語」「丁寧語」の三種類がある。尊敬語は相手の動作を高める表現で、謙譲語は自分の動作を低める表現だ。丁寧語は「です」「ます」をつけて丁寧に話す表現である。ビジネスでは正しく使い分けることが求められる。\n\n質問：「謙譲語」はどのような表現ですか？', '「謙譲語は自分の動作を低める表現」と書いてあります。겸양어는 자신의 동작을 낮추는 표현입니다。', 1, 24, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '相手の動作を高める表現', FALSE, 1),
    (gen_random_uuid(), q_id, '自分の動作を低める表現', TRUE, 2),
    (gen_random_uuid(), q_id, '丁寧に話す表現', FALSE, 3),
    (gen_random_uuid(), q_id, '親しい間柄で使う表現', FALSE, 4);
END $$;

-- N3 Q25: 세부정보 (건강 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n睡眠の質を上げるために、いくつかのポイントがある。寝る2時間前にお風呂に入ること、カフェインは午後3時以降は控えること、そして寝室の温度を18〜22度に保つことだ。特に寝る直前のスマホ使用は避けたほうがいい。\n\n質問：カフェインはいつまでに控えるべきですか？', '「カフェインは午後3時以降は控えること」と書いてあります。오후 3시 이후에는 카페인을 자제해야 합니다。', 1, 25, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '正午以降', FALSE, 1),
    (gen_random_uuid(), q_id, '午後3時以降', TRUE, 2),
    (gen_random_uuid(), q_id, '夕方6時以降', FALSE, 3),
    (gen_random_uuid(), q_id, '夜9時以降', FALSE, 4);
END $$;

-- N3 Q26: 추론 (교육 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nプログラミング教育が小学校で必修化された。目的はプログラマーを育てることではなく、論理的思考力を身につけることだ。問題を小さく分けて、順番に解決していく力は、プログラミング以外の場面でも役立つ。\n\n質問：小学校のプログラミング教育の主な目的は何ですか？', '「論理的思考力を身につけること」が目的です。논리적 사고력을 기르는 것이 목적입니다。', 1, 26, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラマーを育てる', FALSE, 1),
    (gen_random_uuid(), q_id, '論理的思考力を身につける', TRUE, 2),
    (gen_random_uuid(), q_id, 'コンピュータの操作方法を覚える', FALSE, 3),
    (gen_random_uuid(), q_id, 'IT企業に就職させる', FALSE, 4);
END $$;

-- N3 Q27: 내용이해 (일본 생활)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本のコンビニは24時間営業で、食べ物や飲み物だけでなく、公共料金の支払いや荷物の受け取りもできる。最近はコピー機でチケットを印刷したり、ATMでお金を下ろしたりすることもできるようになった。まさに生活のインフラと言える。\n\n質問：日本のコンビニで最近できるようになったことは何ですか？', '「コピー機でチケットを印刷したり、ATMでお金を下ろしたり」が最近の機能です。복사기로 티켓 인쇄, ATM으로 현금 인출 등입니다。', 1, 27, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '食べ物の配達', FALSE, 1),
    (gen_random_uuid(), q_id, 'チケットの印刷と現金の引き出し', TRUE, 2),
    (gen_random_uuid(), q_id, '医療サービス', FALSE, 3),
    (gen_random_uuid(), q_id, 'クリーニングサービス', FALSE, 4);
END $$;

-- N3 Q28: 문맥어휘 (기술 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nAIの発展により、多くの仕事が自動化されると言われている。しかし、AIにはできないこともある。創造性が必要な仕事や、人の感情を理解する仕事は、まだ人間にしかできない。AIと人間がそれぞれの強みを活かして協力することが大切だ。\n\n質問：「自動化」の意味は何ですか？', '「自動化」は人の代わりに機械やシステムが作業を行うことです。자동화의 의미입니다。', 1, 28, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人が直接やること', FALSE, 1),
    (gen_random_uuid(), q_id, '機械やシステムが代わりに作業すること', TRUE, 2),
    (gen_random_uuid(), q_id, '速度を上げること', FALSE, 3),
    (gen_random_uuid(), q_id, 'コストを減らすこと', FALSE, 4);
END $$;

-- N3 Q29: 세부정보 (사내 공지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n社員各位\n来月から新しい勤怠管理システムを導入します。出退勤はスマートフォンのアプリで打刻してください。従来のタイムカードは廃止します。アプリの使い方は来週の説明会でご案内します。\n\n質問：来月からどのように出退勤を記録しますか？', '「スマートフォンのアプリで打刻してください」と書いてあります。스마트폰 앱으로 출퇴근을 기록합니다。', 1, 29, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'タイムカード', FALSE, 1),
    (gen_random_uuid(), q_id, 'スマートフォンのアプリ', TRUE, 2),
    (gen_random_uuid(), q_id, '手書き記録', FALSE, 3),
    (gen_random_uuid(), q_id, 'PCログイン', FALSE, 4);
END $$;

-- N3 Q30: 추론 (다문화 공존)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n外国人労働者が増える中、職場での異文化理解が重要になっている。言葉の壁だけでなく、仕事の進め方や時間に対する感覚の違いもある。お互いの文化を尊重し、オープンにコミュニケーションを取ることが、良い職場環境を作る鍵である。\n\n質問：筆者が良い職場環境のために必要だと考えていることは何ですか？', '「お互いの文化を尊重し、オープンにコミュニケーションを取ること」が鍵です。서로의 문화를 존중하고 열린 소통을 하는 것입니다。', 1, 30, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '外国人に日本文化だけ教える', FALSE, 1),
    (gen_random_uuid(), q_id, 'お互いの文化を尊重し、オープンにコミュニケーションを取る', TRUE, 2),
    (gen_random_uuid(), q_id, '同じ国の人同士だけで働く', FALSE, 3),
    (gen_random_uuid(), q_id, 'ルールをもっと厳しくする', FALSE, 4);
END $$;

-- ============================================
-- N2 読解 追加問題 (Q11-Q30)
-- ============================================

-- N2 Q11: 내용이해 (일본의 고용 관행)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の終身雇用制度は、高度経済成長期に定着した雇用慣行である。一つの企業に定年まで勤める代わりに、企業は社員の生活を保障するという暗黙の契約であった。しかし、グローバル化や経済環境の変化により、転職が一般的になりつつあり、この制度は徐々に崩れ始めている。\n\n質問：終身雇用制度が変化している理由は何ですか？', 'グローバル化や経済環境の変化が理由です。글로벌화와 경제 환경의 변화가 원인입니다。', 1, 11, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '社員が仕事を嫌いになった', FALSE, 1),
    (gen_random_uuid(), q_id, 'グローバル化と経済環境の変化', TRUE, 2),
    (gen_random_uuid(), q_id, '政府が法律で禁止した', FALSE, 3),
    (gen_random_uuid(), q_id, '企業の数が減った', FALSE, 4);
END $$;

-- N2 Q12: 세부정보 (기술 블로그)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアジャイル開発とは、短い開発サイクルを繰り返しながらソフトウェアを完成させていく手法である。従来のウォーターフォール型と異なり、要件の変更に柔軟に対応できる点が最大のメリットだ。ただし、全体の設計が曖昧なまま進むリスクもあるため、チーム内のコミュニケーションが不可欠である。\n\n質問：アジャイル開発の最大のメリットは何ですか？', '「要件の変更に柔軟に対応できる点」が最大のメリットです。요건 변경에 유연하게 대응할 수 있습니다。', 1, 12, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発コストが減る', FALSE, 1),
    (gen_random_uuid(), q_id, '要件の変更に柔軟に対応できる', TRUE, 2),
    (gen_random_uuid(), q_id, '全体の設計が完璧になる', FALSE, 3),
    (gen_random_uuid(), q_id, '人数が少なくてもいい', FALSE, 4);
END $$;

-- N2 Q13: 문맥어휘 (사회 논설)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nSNSの普及により、情報の拡散が急速に進むようになった。しかし、その中には根拠のない情報、いわゆる「フェイクニュース」も含まれている。情報を鵜呑みにせず、出典を確認する「メディアリテラシー」が今後ますます重要になるだろう。\n\n質問：「鵜呑みにする」の意味は何ですか？', '「鵜呑みにする」は情報をそのまま信じることです。그대로 곧이곧대로 믿다의 의미입니다。', 1, 13, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '疑う', FALSE, 1),
    (gen_random_uuid(), q_id, 'そのまま信じる', TRUE, 2),
    (gen_random_uuid(), q_id, '無視する', FALSE, 3),
    (gen_random_uuid(), q_id, '共有する', FALSE, 4);
END $$;

-- N2 Q14: 추론 (직장 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本企業では「根回し」という習慣がある。会議の前に関係者に個別に相談し、合意を得ておくことだ。外国人からは非効率に見えるかもしれないが、実際の会議がスムーズに進むという利点がある。全員が事前に内容を理解しているため、会議での反対意見が少なくなる。\n\n質問：「根回し」の利点は何ですか？', '事前に合意を得ることで会議がスムーズに進みます。사전에 합의를 얻어 회의가 원활하게 진행됩니다。', 1, 14, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議を省略できる', FALSE, 1),
    (gen_random_uuid(), q_id, '実際の会議がスムーズに進む', TRUE, 2),
    (gen_random_uuid(), q_id, 'コストを節約できる', FALSE, 3),
    (gen_random_uuid(), q_id, '個人の意見が反映されない', FALSE, 4);
END $$;

-- N2 Q15: 내용이해 (환경 정책)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nカーボンニュートラルとは、温室効果ガスの排出量と吸収量を均衡させ、実質的にゼロにすることを指す。日本政府は2050年までにこの目標を達成すると宣言した。再生可能エネルギーの普及や電気自動車の推進など、あらゆる分野での取り組みが必要とされている。\n\n質問：日本のカーボンニュートラルの目標年はいつですか？', '「2050年まで」と明記されています。2050년까지가 목표입니다。', 1, 15, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2030年', FALSE, 1),
    (gen_random_uuid(), q_id, '2040年', FALSE, 2),
    (gen_random_uuid(), q_id, '2050年', TRUE, 3),
    (gen_random_uuid(), q_id, '2060年', FALSE, 4);
END $$;

-- N2 Q16: 세부정보 (개발 프로세스)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nコードレビューとは、他の開発者が書いたコードを確認し、改善点を指摘するプロセスである。バグの早期発見だけでなく、チーム全体のコーディングスキル向上にもつながる。ただし、指摘する際は建設的なフィードバックを心がけ、人格攻撃にならないよう注意が必要だ。\n\n質問：コードレビューの効果として挙げられていないものはどれですか？', 'バグの早期発見とスキル向上は挙げられていますが、開発速度の向上は言及されていません。개발 속도 향상은 언급되지 않았습니다。', 1, 16, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグの早期発見', FALSE, 1),
    (gen_random_uuid(), q_id, 'チームのコーディングスキル向上', FALSE, 2),
    (gen_random_uuid(), q_id, '開発速度の向上', TRUE, 3),
    (gen_random_uuid(), q_id, '建設的なフィードバック文化の形成', FALSE, 4);
END $$;

-- N2 Q17: 문맥어휘 (비즈니스 일본어)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本のビジネスメールでは、冒頭に「お世話になっております」と書くのが一般的である。初めてメールを送る相手には「初めてご連絡いたします」と書く。また、依頼する際は「恐れ入りますが」や「お手数をおかけしますが」といったクッション言葉を使うことで、相手への配慮を示す。\n\n質問：「クッション言葉」の役割は何ですか？', 'クッション言葉は相手への配慮を示す表現です。상대에 대한 배려를 나타내는 완충 표현입니다。', 1, 17, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自己紹介をするため', FALSE, 1),
    (gen_random_uuid(), q_id, '相手への配慮を示すため', TRUE, 2),
    (gen_random_uuid(), q_id, 'メールを長く書くため', FALSE, 3),
    (gen_random_uuid(), q_id, 'かしこまらないため', FALSE, 4);
END $$;

-- N2 Q18: 추론 (사회 변화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n働き方改革により、長時間労働の是正が進んでいる。しかし、残業時間の削減だけでは根本的な解決にはならない。業務プロセスの見直しやITツールの活用による生産性向上が不可欠である。限られた時間の中で最大の成果を出す働き方が求められている。\n\n質問：筆者が本当に必要だと考えていることは何ですか？', '残業削減だけでなく生産性向上が必要と言っています。잔업 삭감만이 아니라 생산성 향상이 필요합니다。', 1, 18, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '残業時間の削減だけで十分だ', FALSE, 1),
    (gen_random_uuid(), q_id, '業務プロセスの改善とITツール活用による生産性向上', TRUE, 2),
    (gen_random_uuid(), q_id, '社員の数を増やす', FALSE, 3),
    (gen_random_uuid(), q_id, 'テレワークを全面導入する', FALSE, 4);
END $$;

-- N2 Q19: 내용이해 (프로젝트 관리)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nプロジェクトマネジメントにおいて、「スコープクリープ」は最も警戒すべきリスクの一つだ。これは、プロジェクトの範囲が徐々に拡大し、当初の計画を超えてしまう現象を指す。明確な要件定義と変更管理プロセスを確立することで、このリスクを軽減できる。\n\n質問：「スコープクリープ」を防ぐために必要なことは何ですか？', '明確な要件定義と変更管理プロセスが必要です。명확한 요건 정의와 변경 관리 프로세스가 필요합니다。', 1, 19, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人員を増やす', FALSE, 1),
    (gen_random_uuid(), q_id, '明確な要件定義と変更管理プロセス', TRUE, 2),
    (gen_random_uuid(), q_id, '納期を延長する', FALSE, 3),
    (gen_random_uuid(), q_id, 'すべての要望を受け入れる', FALSE, 4);
END $$;

-- N2 Q20: 세부정보 (법률 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n個人情報保護法により、企業は顧客の個人情報を適切に管理する義務がある。個人情報とは、氏名、住所、電話番号、メールアドレスなど、特定の個人を識別できる情報を指す。データの漏洩が発生した場合、企業は速やかに本人に通知し、監督官庁に報告しなければならない。\n\n質問：データ漏洩時に企業がすべきことは何ですか？', '本人への通知と監督官庁への報告が必要です。본인에게 통지하고 감독관청에 보고해야 합니다。', 1, 20, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '事実を隠す', FALSE, 1),
    (gen_random_uuid(), q_id, '本人に通知し監督官庁に報告する', TRUE, 2),
    (gen_random_uuid(), q_id, 'システムを停止する', FALSE, 3),
    (gen_random_uuid(), q_id, '担当者を解雇する', FALSE, 4);
END $$;

-- N2 Q21: 추론 (조직 문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n心理的安全性とは、チーム内で自分の意見を自由に言えると感じられる状態のことだ。Googleの研究では、高パフォーマンスのチームに共通する最大の要因がこの心理的安全性であった。失敗を責めず、建設的な議論ができる環境が、イノベーションを生む土壌となる。\n\n質問：高パフォーマンスチームに最も重要な要因は何ですか？', '心理的安全性が最大の要因です。심리적 안전성이 가장 중요한 요인입니다。', 1, 21, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '高い給与', FALSE, 1),
    (gen_random_uuid(), q_id, '心理的安全性', TRUE, 2),
    (gen_random_uuid(), q_id, '厳格なルール', FALSE, 3),
    (gen_random_uuid(), q_id, '優秀なリーダー', FALSE, 4);
END $$;

-- N2 Q22: 내용이해 (기술 트렌드)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nクラウドコンピューティングの普及により、企業のITインフラは大きく変わった。自社でサーバーを保有・管理する「オンプレミス」から、必要な分だけリソースを借りるクラウドへの移行が進んでいる。初期投資が抑えられ、拡張性に優れている点がクラウドの強みである。\n\n質問：クラウドの強みとして挙げられているのはどれですか？', '初期投資の抑制と拡張性が強みです。초기 투자 절감과 확장성이 장점입니다。', 1, 22, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'セキュリティが完璧だ', FALSE, 1),
    (gen_random_uuid(), q_id, '初期投資の抑制と高い拡張性', TRUE, 2),
    (gen_random_uuid(), q_id, 'インターネットなしでも利用可能', FALSE, 3),
    (gen_random_uuid(), q_id, '速度が常に速い', FALSE, 4);
END $$;

-- N2 Q23: 문맥어휘 (경영 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n企業の持続的成長のためには、短期的な利益の追求だけでなく、ESG（環境・社会・ガバナンス）への取り組みが不可欠になっている。投資家もESGの観点から企業を評価するようになり、社会的責任を果たさない企業は淘汰されるリスクがある。\n\n質問：「淘汰される」の意味は何ですか？', '「淘汰される」は競争に負けて排除されることです。도태되다 / 경쟁에서 밀려나다의 의미입니다。', 1, 23, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '成長する', FALSE, 1),
    (gen_random_uuid(), q_id, '淘汰される', TRUE, 2),
    (gen_random_uuid(), q_id, '合併される', FALSE, 3),
    (gen_random_uuid(), q_id, '上場される', FALSE, 4);
END $$;

-- N2 Q24: 추론 (AI 논의)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n生成AIの登場により、クリエイティブ産業にも大きな変化が訪れている。AIが文章を書き、絵を描き、音楽を作る時代になった。これにより、クリエイターの仕事が奪われるという懸念がある一方で、AIをツールとして活用することで、制作の効率が飛躍的に向上するという見方もある。\n\n質問：筆者が提示している二つの見方はどれですか？', '仕事が奪われるという懸念とツールとして活用できるという見方の二つです。일자리를 빼앗긴다는 우려와 도구로 활용할 수 있다는 관점입니다。', 1, 24, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AIが完璧だということと不完全だということ', FALSE, 1),
    (gen_random_uuid(), q_id, '仕事が奪われるという懸念とツールとして活用できるという見方', TRUE, 2),
    (gen_random_uuid(), q_id, 'AIが高いということと安いということ', FALSE, 3),
    (gen_random_uuid(), q_id, 'AIを禁止すべきだということと義務化すべきだということ', FALSE, 4);
END $$;

-- N2 Q25: 내용이해 (사내 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nメンター制度とは、経験豊富な先輩社員が新入社員に対して、業務指導やキャリア相談を行う仕組みである。定期的な面談を通じて、新入社員の不安を解消し、早期離職を防ぐ効果が期待できる。メンターにとっても、指導力やコミュニケーション能力の向上という成長機会になる。\n\n質問：メンター側にとってのメリットは何ですか？', 'メンターにとって指導力やコミュニケーション能力が向上します。지도력과 의사소통 능력이 향상됩니다。', 1, 25, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '給与が上がる', FALSE, 1),
    (gen_random_uuid(), q_id, '指導力とコミュニケーション能力の向上', TRUE, 2),
    (gen_random_uuid(), q_id, '業務量が減る', FALSE, 3),
    (gen_random_uuid(), q_id, '昇進が保証される', FALSE, 4);
END $$;

-- N2 Q26: 세부정보 (데이터 보안)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nゼロトラストセキュリティとは、「何も信頼しない」という前提に基づくセキュリティモデルである。従来の境界型セキュリティでは、社内ネットワークを信頼し、外部からのアクセスのみを制限していた。しかし、リモートワークの普及やクラウド利用の拡大により、すべてのアクセスを検証する必要性が高まっている。\n\n質問：ゼロトラストセキュリティの基本的な考え方は何ですか？', '「何も信頼しない」という前提です。아무것도 신뢰하지 않는다는 전제입니다。', 1, 26, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '社内ネットワークだけ信頼する', FALSE, 1),
    (gen_random_uuid(), q_id, '何も信頼せずすべてのアクセスを検証する', TRUE, 2),
    (gen_random_uuid(), q_id, 'すべてを信頼する', FALSE, 3),
    (gen_random_uuid(), q_id, '外部アクセスだけ遮断する', FALSE, 4);
END $$;

-- N2 Q27: 문맥어휘 (인사 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本企業の多くは年功序列型の賃金体系を採用してきたが、近年は成果主義への移行が進んでいる。年齢や勤続年数ではなく、実際の業績や能力に基づいて評価・報酬を決定する仕組みだ。若手社員のモチベーション向上が期待される反面、評価基準の客観性をいかに担保するかが課題となっている。\n\n質問：「年功序列」の意味は何ですか？', '年功序列は年齢や勤続年数に応じて地位・賃金が上がる制度です。연공서열의 의미입니다。', 1, 27, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '能力に応じて給与が決まること', FALSE, 1),
    (gen_random_uuid(), q_id, '年齢や勤続年数に応じて地位と給与が上がること', TRUE, 2),
    (gen_random_uuid(), q_id, '成果に応じて昇進が決まること', FALSE, 3),
    (gen_random_uuid(), q_id, '上司の判断で給与が決まること', FALSE, 4);
END $$;

-- N2 Q28: 추론 (리더십)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nサーバントリーダーシップとは、リーダーが部下に奉仕するという考え方だ。命令するのではなく、部下の成長を支援し、働きやすい環境を整えることで、結果的にチームの成果が向上する。従来のトップダウン型とは対照的なアプローチであり、多様性を重視する現代の組織に適していると言われている。\n\n質問：サーバントリーダーシップの特徴はどれですか？', 'リーダーが部下に奉仕し成長を支援するアプローチです。리더가 부하에게 봉사하고 성장을 지원합니다。', 1, 28, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リーダーが強く指示する', FALSE, 1),
    (gen_random_uuid(), q_id, 'リーダーが部下の成長を支援し、働きやすい環境を作る', TRUE, 2),
    (gen_random_uuid(), q_id, 'リーダーがすべてを決める', FALSE, 3),
    (gen_random_uuid(), q_id, 'リーダーが必要ない', FALSE, 4);
END $$;

-- N2 Q29: 내용이해 (기술 부채)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n技術的負債とは、短期的な開発スピードを優先した結果、コードの品質が低下し、将来的に修正コストが増大する現象を指す。納期に追われて応急処置的なコードを書くことは避けられない場合もあるが、放置すると保守性が著しく低下する。定期的なリファクタリングが技術的負債を管理する鍵となる。\n\n質問：技術的負債を管理するために必要なことは何ですか？', '「定期的なリファクタリング」が鍵です。정기적인 리팩토링이 핵심입니다。', 1, 29, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードを最初から書き直す', FALSE, 1),
    (gen_random_uuid(), q_id, '定期的なリファクタリング', TRUE, 2),
    (gen_random_uuid(), q_id, 'テストを省略する', FALSE, 3),
    (gen_random_uuid(), q_id, '外注に任せる', FALSE, 4);
END $$;

-- N2 Q30: 추론 (다양성)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nダイバーシティ経営とは、多様な人材の能力を最大限に活かすことで、イノベーションを生み出し、企業価値を向上させる経営戦略である。性別、国籍、年齢、障がいの有無に関わらず、多様な視点があることで、市場の変化に柔軟に対応でき、新たなビジネスチャンスを捉えることができる。\n\n質問：ダイバーシティ経営の目的は何ですか？', '多様な人材を活かしてイノベーションを生むことです。다양한 인재를 활용하여 혁신을 창출하는 것입니다。', 1, 30, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人件費を削減する', FALSE, 1),
    (gen_random_uuid(), q_id, '多様な人材を活かしてイノベーションと企業価値を高める', TRUE, 2),
    (gen_random_uuid(), q_id, '海外進出のためだけのものだ', FALSE, 3),
    (gen_random_uuid(), q_id, '法的義務を満たすためのものだ', FALSE, 4);
END $$;

-- ============================================
-- N1 読解 追加問題 (Q11-Q30)
-- ============================================

-- N1 Q11: 내용이해 (언어 철학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n言語は単なるコミュニケーションの道具ではなく、思考そのものを形作るものである。サピア＝ウォーフ仮説によれば、使用する言語が世界の認知の仕方に影響を与える。例えば、色の名前が豊富な言語を持つ民族は、色の識別能力が高いという研究結果がある。\n\n質問：サピア＝ウォーフ仮説の主張は何ですか？', '使用する言語が世界の認知の仕方に影響するという仮説です。사용하는 언어가 세계 인식 방식에 영향을 준다는 가설입니다。', 1, 11, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべての言語は同じ構造を持つ', FALSE, 1),
    (gen_random_uuid(), q_id, '使用する言語が世界の認知の仕方に影響を与える', TRUE, 2),
    (gen_random_uuid(), q_id, '言語はコミュニケーションの道具に過ぎない', FALSE, 3),
    (gen_random_uuid(), q_id, '思考は言語と無関係だ', FALSE, 4);
END $$;

-- N1 Q12: 세부정보 (경영 전략)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nイノベーションのジレンマとは、成功している企業が既存の製品やサービスの改善に注力するあまり、破壊的技術の台頭に対応できなくなる現象を指す。既存顧客の声に応えることは重要だが、市場の根本的な変化を見落とすリスクがある。持続的イノベーションと破壊的イノベーションの両方に目を配る経営判断が求められる。\n\n質問：イノベーションのジレンマが起きる原因は何ですか？', '既存製品の改善に注力しすぎることが原因です。기존 제품 개선에 지나치게 집중하는 것이 원인입니다。', 1, 12, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '研究開発費が不足している', FALSE, 1),
    (gen_random_uuid(), q_id, '既存製品の改善に注力しすぎて破壊的技術に対応できない', TRUE, 2),
    (gen_random_uuid(), q_id, '競合他社が多すぎる', FALSE, 3),
    (gen_random_uuid(), q_id, '消費者の好みが変わらない', FALSE, 4);
END $$;

-- N1 Q13: 문맥어휘 (법학 논문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n法の下の平等とは、全ての国民が法的に平等に扱われるべきという原則である。しかし、形式的平等だけでは不十分な場合がある。社会的弱者に対する積極的是正措置（アファーマティブ・アクション）は、実質的平等を実現するための手段として議論されている。\n\n質問：「積極的是正措置」の目的は何ですか？', '実質的平等を実現するための措置です。실질적 평등을 실현하기 위한 조치입니다。', 1, 13, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '形式的平等を維持するため', FALSE, 1),
    (gen_random_uuid(), q_id, '実質的平等を実現するため', TRUE, 2),
    (gen_random_uuid(), q_id, '特定の集団を優遇するため', FALSE, 3),
    (gen_random_uuid(), q_id, '法律を改正するため', FALSE, 4);
END $$;

-- N1 Q14: 추론 (철학 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「知の呪い」とは、ある分野に精通した人が、その分野の知識がない人の立場を理解できなくなる現象を指す。専門家が初心者に説明する際、無意識に専門用語を使ったり、前提知識があることを当然と思ったりする。優れた教育者とは、この呪いから自らを解放し、学習者の視点に立てる者のことである。\n\n質問：筆者が考える「優れた教育者」の条件は何ですか？', '学習者の視点に立てることです。학습자의 관점에 설 수 있는 것이 조건입니다。', 1, 14, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '専門知識が豊富な人', FALSE, 1),
    (gen_random_uuid(), q_id, '学習者の視点に立てる人', TRUE, 2),
    (gen_random_uuid(), q_id, '厳しく教える人', FALSE, 3),
    (gen_random_uuid(), q_id, '多くの経験を持つ人', FALSE, 4);
END $$;

-- N1 Q15: 내용이해 (사회학 논문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n現代社会における「孤独」は、個人的な問題にとどまらず、社会的課題として認識されるようになった。英国では2018年に「孤独担当大臣」が設置され、日本でも2021年に同様のポストが新設された。孤独は精神的健康に悪影響を及ぼすだけでなく、心臓病や認知症のリスクを高めるという研究結果もある。\n\n質問：日本で孤独担当大臣が設置されたのはいつですか？', '「日本でも2021年に同様のポストが新設された」と書いてあります。2021년에 설치되었습니다。', 1, 15, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2018年', FALSE, 1),
    (gen_random_uuid(), q_id, '2021年', TRUE, 2),
    (gen_random_uuid(), q_id, '2020年', FALSE, 3),
    (gen_random_uuid(), q_id, '2023年', FALSE, 4);
END $$;

-- N1 Q16: 세부정보 (과학 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n量子コンピュータは、従来のコンピュータとは根本的に異なる計算原理に基づく。従来のビットが0か1の状態しか取れないのに対し、量子ビットは0と1の重ね合わせ状態を取ることができる。これにより、特定の問題に対して従来のコンピュータでは不可能なほどの高速計算が可能になる。ただし、実用化にはエラー率の低減や環境制御など、多くの技術的課題が残されている。\n\n質問：量子コンピュータの実用化に向けた課題はどれですか？', 'エラー率の低減や環境制御が課題です。오류율 저감과 환경 제어가 과제입니다。', 1, 16, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '計算速度が遅い', FALSE, 1),
    (gen_random_uuid(), q_id, 'エラー率の低減と環境制御', TRUE, 2),
    (gen_random_uuid(), q_id, 'ソフトウェアが不足している', FALSE, 3),
    (gen_random_uuid(), q_id, 'コストが安い', FALSE, 4);
END $$;

-- N1 Q17: 문맥어휘 (문학 평론)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n文学作品における「メタファー」は、表面的な意味の背後に深い含意を持つ表現技法である。例えば、「人生は旅である」という表現は、人生の不確実性や発見の連続を暗示している。優れた作家は、メタファーを通じて読者の想像力を喚起し、言葉の限界を超えた意味の伝達を可能にする。\n\n質問：「喚起する」の意味は何ですか？', '「喚起する」は呼び起こす、引き出すという意味です。불러일으키다 / 환기시키다의 의미입니다。', 1, 17, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '抑制する', FALSE, 1),
    (gen_random_uuid(), q_id, '喚起する', TRUE, 2),
    (gen_random_uuid(), q_id, '無視する', FALSE, 3),
    (gen_random_uuid(), q_id, '制限する', FALSE, 4);
END $$;

-- N1 Q18: 추론 (윤리학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nAI倫理の議論において、「トロッコ問題」のような思考実験が再注目されている。自動運転車が避けられない事故に直面した時、乗客を守るべきか歩行者を守るべきかという判断を、AIにどうプログラムするかという問題だ。技術の進歩が倫理的判断の自動化を迫る中、社会全体での合意形成が急務となっている。\n\n質問：筆者が最も重要だと考えていることは何ですか？', '社会全体での合意形成が急務だと言っています。사회 전체의 합의 형성이 시급합니다。', 1, 18, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AI技術の発展を止めること', FALSE, 1),
    (gen_random_uuid(), q_id, '社会全体での合意形成', TRUE, 2),
    (gen_random_uuid(), q_id, '自動運転を禁止すること', FALSE, 3),
    (gen_random_uuid(), q_id, '技術者に判断を任せること', FALSE, 4);
END $$;

-- N1 Q19: 내용이해 (경제학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n行動経済学は、人間が必ずしも合理的な判断を下すわけではないという前提に立つ学問だ。例えば、「損失回避バイアス」により、人は同額の利益を得る喜びよりも、同額を失う苦痛の方を大きく感じる。この知見は、マーケティングや公共政策の設計に広く応用されている。\n\n質問：「損失回避バイアス」とは何ですか？', '同額でも利益より損失の方を大きく感じる傾向です。같은 금액이라도 이익보다 손실을 더 크게 느끼는 경향입니다。', 1, 19, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '利益を最大化しようとする傾向', FALSE, 1),
    (gen_random_uuid(), q_id, '同額でも利益より損失の方を大きく感じる傾向', TRUE, 2),
    (gen_random_uuid(), q_id, 'リスクを好む傾向', FALSE, 3),
    (gen_random_uuid(), q_id, '将来の利益を無視する傾向', FALSE, 4);
END $$;

-- N1 Q20: 세부정보 (기업 가치)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nステークホルダー資本主義とは、企業が株主だけでなく、従業員、顧客、取引先、地域社会など、全てのステークホルダーの利益を考慮すべきだという考え方である。従来の株主至上主義では短期的な利益が重視されがちだったが、長期的な企業価値の向上には、多様なステークホルダーとの関係構築が不可欠だとする見解が主流になりつつある。\n\n質問：ステークホルダー資本主義が重視するのは何ですか？', '全てのステークホルダーの利益です。모든 이해관계자의 이익을 중시합니다。', 1, 20, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '株主の利益だけ', FALSE, 1),
    (gen_random_uuid(), q_id, 'すべてのステークホルダーの利益', TRUE, 2),
    (gen_random_uuid(), q_id, '経営者の報酬', FALSE, 3),
    (gen_random_uuid(), q_id, '短期的な利益', FALSE, 4);
END $$;

-- N1 Q21: 문맥어휘 (정치학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n民主主義の根幹を成すのは、国民の知る権利と報道の自由である。権力の監視機能を果たすジャーナリズムは「第四の権力」とも称される。しかし、メディアの商業化やSNSの台頭により、センセーショナリズムに偏った報道が増加し、ジャーナリズムの信頼性が揺らいでいるのも事実である。\n\n質問：「揺らいでいる」の意味は何ですか？', '「揺らいでいる」は不安定になっている、動揺しているという意味です。흔들리고 있다의 의미입니다。', 1, 21, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '強化されている', FALSE, 1),
    (gen_random_uuid(), q_id, '揺らいでいる', TRUE, 2),
    (gen_random_uuid(), q_id, '確立されている', FALSE, 3),
    (gen_random_uuid(), q_id, '無視されている', FALSE, 4);
END $$;

-- N1 Q22: 추론 (과학 철학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nカール・ポパーの反証可能性の概念は、科学と非科学を区別する基準として提唱された。科学的理論とは、原理的に反証可能な命題でなければならない。すなわち、どのような観察結果が得られればその理論が誤りだと判断できるかが明確でなければ、それは科学とは言えないのである。\n\n質問：ポパーが提唱した科学の条件は何ですか？', '反証可能性、つまり理論が原理的に反証可能であることです。이론이 원리적으로 반증 가능해야 합니다。', 1, 22, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実験で証明できなければならない', FALSE, 1),
    (gen_random_uuid(), q_id, '理論が原理的に反証可能でなければならない', TRUE, 2),
    (gen_random_uuid(), q_id, '多数の科学者が同意しなければならない', FALSE, 3),
    (gen_random_uuid(), q_id, '数学的に証明可能でなければならない', FALSE, 4);
END $$;

-- N1 Q23: 내용이해 (조직론)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「学習する組織」とは、ピーター・センゲが提唱した概念であり、組織のメンバーが継続的に学び、変化に適応する能力を持つ組織を指す。個人の学習だけでなく、チーム学習やシステム思考が重要視される。知識を個人に閉じ込めず、組織全体で共有・活用する文化が不可欠である。\n\n質問：「学習する組織」で重要視されていることは何ですか？', 'チーム学習やシステム思考が重要視されています。팀 학습과 시스템 사고가 중시됩니다。', 1, 23, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '個人の競争', FALSE, 1),
    (gen_random_uuid(), q_id, 'チーム学習とシステム思考', TRUE, 2),
    (gen_random_uuid(), q_id, '管理者の指示', FALSE, 3),
    (gen_random_uuid(), q_id, '外部コンサルティング', FALSE, 4);
END $$;

-- N1 Q24: 세부정보 (국제 관계)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nソフトパワーとは、軍事力や経済制裁のようなハードパワーとは対照的に、文化、価値観、外交政策の魅力によって他国の行動に影響を与える能力を指す。日本のアニメ、食文化、おもてなしの精神は、国際社会における日本のソフトパワーの源泉として評価されている。\n\n質問：ソフトパワーに該当しないものはどれですか？', 'ソフトパワーは文化的魅力による影響力で、軍事力はハードパワーです。군사력은 소프트파워가 아닙니다。', 1, 24, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アニメ文化', FALSE, 1),
    (gen_random_uuid(), q_id, '食文化', FALSE, 2),
    (gen_random_uuid(), q_id, '軍事的脅威', TRUE, 3),
    (gen_random_uuid(), q_id, 'おもてなしの精神', FALSE, 4);
END $$;

-- N1 Q25: 추론 (기술 윤리)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nデジタルデバイドとは、情報技術を活用できる者とできない者の間に生じる格差を指す。高齢者や低所得層は、デジタル化の恩恵を受けにくい傾向がある。行政サービスのオンライン化が進む中、デジタルに不慣れな市民が取り残されないよう、対面窓口の維持やデジタルリテラシー教育の充実が不可欠である。\n\n質問：筆者が必要だと考えていることは何ですか？', '対面窓口の維持とデジタルリテラシー教育です。대면 창구 유지와 디지털 리터러시 교육입니다。', 1, 25, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべてのサービスをオンラインに移行する', FALSE, 1),
    (gen_random_uuid(), q_id, '対面窓口の維持とデジタルリテラシー教育の充実', TRUE, 2),
    (gen_random_uuid(), q_id, '高齢者にスマートフォンを無料配布する', FALSE, 3),
    (gen_random_uuid(), q_id, 'デジタル化を中止する', FALSE, 4);
END $$;

-- N1 Q26: 내용이해 (심리학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nダニング＝クルーガー効果とは、能力の低い人ほど自分の能力を過大評価し、能力の高い人ほど自分の能力を過小評価する傾向を指す認知バイアスである。これは、能力が低い人は自分の無知を認識する能力すら欠如しているために起こる。逆に、専門家は自分にとって容易なことを他者にも容易だと錯覚しやすい。\n\n質問：能力の高い人に見られる傾向は何ですか？', '能力の高い人は自分を過小評価する傾向があります。능력이 높은 사람은 자신을 과소평가하는 경향이 있습니다。', 1, 26, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自分の能力を過大評価する', FALSE, 1),
    (gen_random_uuid(), q_id, '自分の能力を過小評価する', TRUE, 2),
    (gen_random_uuid(), q_id, '自分の能力を正確に評価する', FALSE, 3),
    (gen_random_uuid(), q_id, '他の人の能力を過小評価する', FALSE, 4);
END $$;

-- N1 Q27: 문맥어휘 (환경 논문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n生物多様性の喪失は、気候変動と並ぶ地球規模の危機である。一つの種の絶滅は、食物連鎖を通じて生態系全体に波及する。この「カスケード効果」により、一見無関係に見える種の減少が、農業や漁業などの人間活動にも甚大な影響を及ぼす可能性がある。\n\n質問：「甚大な」の意味は何ですか？', '「甚大な」は非常に大きい、深刻なという意味です。매우 큰 / 심대한의 의미입니다。', 1, 27, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '些細な', FALSE, 1),
    (gen_random_uuid(), q_id, '非常に大きい／甚大な', TRUE, 2),
    (gen_random_uuid(), q_id, '一時的な', FALSE, 3),
    (gen_random_uuid(), q_id, '間接的な', FALSE, 4);
END $$;

-- N1 Q28: 추론 (미디어론)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nエコーチェンバー現象とは、SNS上で自分と同じ意見の情報ばかりに触れることで、特定の信念がますます強化される現象を指す。アルゴリズムがユーザーの好みに合った情報を優先的に表示するため、異なる視点に触れる機会が減少する。これにより、社会の分断が加速するリスクがある。\n\n質問：エコーチェンバー現象が社会にもたらすリスクは何ですか？', '社会の分断が加速するリスクがあります。사회의 분단이 가속화될 위험이 있습니다。', 1, 28, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '情報の質が向上する', FALSE, 1),
    (gen_random_uuid(), q_id, '社会の分断が加速する', TRUE, 2),
    (gen_random_uuid(), q_id, '多様な意見が広がる', FALSE, 3),
    (gen_random_uuid(), q_id, 'SNS利用者が減る', FALSE, 4);
END $$;

-- N1 Q29: 내용이해 (기술 경영)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nDX（デジタルトランスフォーメーション）は、単なるIT化やデジタル化とは本質的に異なる概念である。既存の業務プロセスをデジタル化する「デジタイゼーション」を超え、デジタル技術を活用してビジネスモデルそのものを変革し、新たな価値を創造することがDXの本質である。組織文化の変革なくしてDXの成功はあり得ない。\n\n質問：DXの本質として筆者が最も強調していることは何ですか？', 'ビジネスモデルの変革と新たな価値の創造がDXの本質です。비즈니스 모델 변혁과 새로운 가치 창조가 핵심입니다。', 1, 29, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '既存業務のIT化', FALSE, 1),
    (gen_random_uuid(), q_id, 'ビジネスモデルそのものの変革と新たな価値の創造', TRUE, 2),
    (gen_random_uuid(), q_id, '紙業務のデジタル化', FALSE, 3),
    (gen_random_uuid(), q_id, '最新技術の導入', FALSE, 4);
END $$;

-- N1 Q30: 추론 (사회 철학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「正義」の概念は時代や文化によって異なる。ジョン・ロールズは「無知のヴェール」という思考実験を通じて、公正な社会制度を構想した。自分がどのような立場に生まれるかわからないという前提で制度を設計すれば、最も恵まれない人々の利益を最大化する制度が選ばれるはずだ、と主張した。\n\n質問：ロールズの「無知のヴェール」が導く結論は何ですか？', '最も恵まれない人々の利益を最大化する制度が選ばれるという結論です。가장 불우한 사람들의 이익을 최대화하는 제도가 선택됩니다。', 1, 30, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '多数決が常に正義である', FALSE, 1),
    (gen_random_uuid(), q_id, '最も恵まれない人々の利益を最大化する制度が選ばれる', TRUE, 2),
    (gen_random_uuid(), q_id, '個人の自由が絶対的だ', FALSE, 3),
    (gen_random_uuid(), q_id, 'すべての人に同じ量を分配する', FALSE, 4);
END $$;

-- Update reading quiz time limits (+10 minutes each)
UPDATE quizzes SET time_limit_minutes = time_limit_minutes + 10 WHERE id IN (
  'c0000001-0000-0000-0000-000000000001',
  'c0000002-0000-0000-0000-000000000002',
  'c0000003-0000-0000-0000-000000000003',
  'c0000004-0000-0000-0000-000000000004',
  'c0000005-0000-0000-0000-000000000005'
);
