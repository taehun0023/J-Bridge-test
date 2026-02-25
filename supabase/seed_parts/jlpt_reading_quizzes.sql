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
-- Categories: 내용이해(4), 세부정보(3), 문맥어휘(2), 추론(1)
-- ============================================

-- Q1: 내용이해 (쇼핑 리스트)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうのかいものリスト\nたまご 1パック　ぎゅうにゅう 1本　パン 1つ　りんご 3つ　にんじん 2本　とりにく 200グラム\nぜんぶで 1500えんぐらいです。おかねは テーブルの うえに あります。5じまでに かってきてください。\nおかあさんより\n\n質問：おかねは　どこに　ありますか？', '「おかねは テーブルの うえに あります」と書いてあります。돈은 테이블 위에 있습니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '냉장고 안에', FALSE, 1),
    (gen_random_uuid(), q_id, '가방 안에', FALSE, 2),
    (gen_random_uuid(), q_id, '테이블 위에', TRUE, 3),
    (gen_random_uuid(), q_id, '서랍 안에', FALSE, 4);
END $$;

-- Q2: 내용이해 (친구 메시지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nゆきさんへ\nわたしは いま とうきょうに すんでいます。まいにち にほんごの べんきょうを しています。らいしゅうの どようび、いっしょに こうえんに いきませんか。はなみを したいです。\nミナより\n\n質問：ミナさんは　らいしゅう　なにを　したいですか？', '「はなみを したいです」と書いてあります。미나 씨는 꽃구경을 하고 싶어합니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '꽃구경을 하고 싶다', TRUE, 1),
    (gen_random_uuid(), q_id, '영화를 보고 싶다', FALSE, 2),
    (gen_random_uuid(), q_id, '쇼핑을 하고 싶다', FALSE, 3),
    (gen_random_uuid(), q_id, '공부를 하고 싶다', FALSE, 4);
END $$;

-- Q3: 내용이해 (전철 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nおしらせ\n12がつ 20にちから でんしゃの じかんが かわります。\nあさの でんしゃ：さいしょの でんしゃは 5じ30ぷんです。（いまは 5じ50ぷん）\nどようびと にちようびは いつもと おなじです。\n\n質問：12がつ 20にちから、さいしょの でんしゃは　なんじですか？', '変更後のさいしょの でんしゃは「5じ30ぷん」です。변경 후 첫 전철은 5시 30분입니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5시 50분', FALSE, 1),
    (gen_random_uuid(), q_id, '5시 30분', TRUE, 2),
    (gen_random_uuid(), q_id, '6시', FALSE, 3),
    (gen_random_uuid(), q_id, '5시', FALSE, 4);
END $$;

-- Q4: 내용이해 (병원 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nさくら びょういん\nしんさつの じかん：\nげつようび〜きんようび：あさ 9じ〜ひる 12じ、ごご 2じ〜ゆうがた 5じ\nどようび：あさ 9じ〜ひる 12じ\nにちようび：おやすみ\n\n質問：にちようびに　びょういんに　いけますか？', '「にちようび：おやすみ」と書いてあるので、日曜日は行けません。일요일은 휴진입니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오전만 갈 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '오후만 갈 수 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '하루 종일 갈 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '갈 수 없다 (휴진)', TRUE, 4);
END $$;

-- Q5: 세부정보 (아파트 규칙)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアパートに すんでいる みなさんへ\n1. よるの 10じから あさの 7じまで、おおきい おとを ださないでください。\n2. ゴミは きまった ひに だしてください。\n3. じてんしゃは じてんしゃおきばに おいてください。\n4. ペットは かうことができません。\n\n質問：アパートで　ペットを　かうことが　できますか？', '「ペットは かうことができません」と明記されています。반려동물은 기를 수 없습니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '작은 동물만 기를 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '기를 수 없다', TRUE, 2),
    (gen_random_uuid(), q_id, '관리인에게 허락 받으면 된다', FALSE, 3),
    (gen_random_uuid(), q_id, '고양이만 기를 수 있다', FALSE, 4);
END $$;

-- Q6: 세부정보 (레시피)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nたまごやきの つくりかた\nざいりょう：たまご 3つ、さとう すこし、しお すこし、あぶら すこし\nつくりかた：\n1. たまごを ボウルに いれます。\n2. さとうと しおを いれて、よく まぜます。\n3. フライパンに あぶらを いれて、ひを つけます。\n\n質問：たまごは　いくつ　つかいますか？', '材料に「たまご 3つ」と書いてあります。달걀은 3개 사용합니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1개', FALSE, 1),
    (gen_random_uuid(), q_id, '2개', FALSE, 2),
    (gen_random_uuid(), q_id, '4개', FALSE, 3),
    (gen_random_uuid(), q_id, '3개', TRUE, 4);
END $$;

-- Q7: 세부정보 (도서관 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nみなみ としょかん りようあんない\nほんは 5さつまで かりることができます。かりる きかんは 2しゅうかんです。\nとしょかんの なかで たべたり のんだりしないでください。\nカードを つくりたいひとは、うけつけに きてください。みぶんしょうめいしょが いります。\n\n質問：ほんは　なんさつまで　かりることが　できますか？', '「ほんは 5さつまで かりることができます」と書いてあります。책은 5권까지 빌릴 수 있습니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3권', FALSE, 1),
    (gen_random_uuid(), q_id, '5권', TRUE, 2),
    (gen_random_uuid(), q_id, '7권', FALSE, 3),
    (gen_random_uuid(), q_id, '10권', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (일기예보)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうの てんきよほう\nきょうの とうきょうは はれです。きおんは 18どです。\nあしたは くもりで、ごごから あめが ふるかもしれません。\nかさを もっていったほうが いいです。\n\n質問：「てんきよほう」の　いみは　なんですか？', '「てんきよほう」は「天気予報」で、날씨를 미리 알려주는 것입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '날씨 뉴스', FALSE, 1),
    (gen_random_uuid(), q_id, '일기예보', TRUE, 2),
    (gen_random_uuid(), q_id, '기온 기록', FALSE, 3),
    (gen_random_uuid(), q_id, '계절 달력', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (자기소개 카드)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nなまえ：パク・ジヒョン\nくに：かんこく（ソウル）\nすきな こと：りょうり、さんぽ、えいがを みること\nにほんごの レベル：すこし はなせます\nにほんで したいこと：おいしい たべものを たべたいです。ともだちを たくさん つくりたいです。\n\n質問：「さんぽ」の　いみは　なんですか？', '「さんぽ」は「散歩」で、천천히 걸어다니는 것을 의미합니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '달리기', FALSE, 1),
    (gen_random_uuid(), q_id, '수영', FALSE, 2),
    (gen_random_uuid(), q_id, '산책', TRUE, 3),
    (gen_random_uuid(), q_id, '등산', FALSE, 4);
END $$;

-- Q10: 추론 (쇼핑 리스트 목적)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうのかいものリスト\nたまご 1パック　ぎゅうにゅう 1本　パン 1つ　りんご 3つ　にんじん 2本　とりにく 200グラム\nぜんぶで 1500えんぐらいです。おかねは テーブルの うえに あります。5じまでに かってきてください。\nおかあさんより\n\n質問：この　メモは　だれが　だれに　かきましたか？', '最後に「おかあさんより」と書いてあるので、お母さんが子どもに書いたメモです。엄마가 자녀에게 쓴 메모입니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '아이가 엄마에게', FALSE, 1),
    (gen_random_uuid(), q_id, '친구가 친구에게', FALSE, 2),
    (gen_random_uuid(), q_id, '엄마가 자녀에게', TRUE, 3),
    (gen_random_uuid(), q_id, '가게 직원이 손님에게', FALSE, 4);
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
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n田中さんへ\n来月の15日に新しいアパートに引っ越すことになりました。今のアパートは駅から遠くて、ちょっと不便でした。新しいアパートは駅から歩いて5分のところにあります。\nパク・ジュンより\n\n質問：新しいアパートはどんなところですか？', '「新しいアパートは駅から歩いて5分」と書いてあります。새 아파트는 역에서 걸어서 5분 거리에 있습니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '역에서 멀다', FALSE, 1),
    (gen_random_uuid(), q_id, '역에서 걸어서 5분이다', TRUE, 2),
    (gen_random_uuid(), q_id, '역에서 버스로 10분이다', FALSE, 3),
    (gen_random_uuid(), q_id, '역 바로 앞이다', FALSE, 4);
END $$;

-- Q2: 내용이해 (취미 서클)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「にほんご読書クラブ」のメンバーをぼしゅうしています！\n私たちは月に2回、土曜日の午後に集まって、日本語の本を読んでいます。やさしい本から始めるので、日本語がまだ上手じゃなくても大丈夫です。\n\n質問：このクラブでは何をしますか？', '「日本語の本を読んでいます」と書いてあります。일본어 책을 읽는 클럽입니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본어 회화 연습을 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '일본 영화를 본다', FALSE, 2),
    (gen_random_uuid(), q_id, '일본어 책을 읽는다', TRUE, 3),
    (gen_random_uuid(), q_id, '일본 요리를 만든다', FALSE, 4);
END $$;

-- Q3: 내용이해 (교토 여행 가이드)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n京都は日本で一番人気がある観光地の一つです。\nおすすめの場所：\n・金閣寺：金色のきれいなお寺です。\n・嵐山：秋の紅葉がとてもきれいです。\n・錦市場：おいしい食べ物がたくさんあります。「京都の台所」と呼ばれています。\n\n質問：錦市場は何と呼ばれていますか？', '「京都の台所」と呼ばれていると書いてあります。니시키 시장은 "교토의 부엌"이라고 불립니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교토의 정원', FALSE, 1),
    (gen_random_uuid(), q_id, '교토의 부엌', TRUE, 2),
    (gen_random_uuid(), q_id, '교토의 심장', FALSE, 3),
    (gen_random_uuid(), q_id, '교토의 보물', FALSE, 4);
END $$;

-- Q4: 내용이해 (건강검진 결과)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n先日の健康診断の結果をお知らせします。\n全体的に問題はありません。しかし、コレステロールの数値が少し高いです。\nアドバイス：\n・野菜や魚を多く食べるようにしましょう。\n・揚げ物や甘いものを食べすぎないように気をつけてください。\n\n質問：健康診断で問題があったのは何ですか？', '「コレステロールの数値が少し高いです」と書いてあります。콜레스테롤 수치가 조금 높은 것이 문제입니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '혈압이 높다', FALSE, 1),
    (gen_random_uuid(), q_id, '시력이 나쁘다', FALSE, 2),
    (gen_random_uuid(), q_id, '체중이 많이 나간다', FALSE, 3),
    (gen_random_uuid(), q_id, '콜레스테롤 수치가 조금 높다', TRUE, 4);
END $$;

-- Q5: 세부정보 (구청 절차 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n引っ越しをしたときの手続きについて\n新しい区に引っ越した方は、14日以内に転入届を出してください。\n必要なもの：在留カード、パスポート、前の区の転出届の紙\nわからないことがあったら、外国語相談窓口（2階）を利用してください。\n\n質問：転入届はいつまでに出さなければなりませんか？', '「14日以内に転入届を出してください」と書いてあります。14일 이내에 전입신고를 내야 합니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '7일 이내', FALSE, 1),
    (gen_random_uuid(), q_id, '14일 이내', TRUE, 2),
    (gen_random_uuid(), q_id, '30일 이내', FALSE, 3),
    (gen_random_uuid(), q_id, '기한 없음', FALSE, 4);
END $$;

-- Q6: 세부정보 (요리 교실)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「世界の家庭料理教室」参加者ぼしゅう！\n今月のテーマ：韓国料理（ビビンバとチヂミ）\n定員：15名（先着順）\n参加費：1,000円（材料費を含む）\n持ち物：エプロン、ハンドタオル\nしめきりは3月15日です。\n\n質問：参加費の1,000円には何が含まれていますか？', '「参加費：1,000円（材料費を含む）」と書いてあります。참가비에는 재료비가 포함되어 있습니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교통비', FALSE, 1),
    (gen_random_uuid(), q_id, '앞치마 대여비', FALSE, 2),
    (gen_random_uuid(), q_id, '재료비', TRUE, 3),
    (gen_random_uuid(), q_id, '교재비', FALSE, 4);
END $$;

-- Q7: 세부정보 (쓰레기 분리 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n【資源ゴミ】金曜日\nペットボトル、かん、びん、段ボール\n→ きれいに洗ってから出してください。\n→ ペットボトルはキャップとラベルを外してください。\nゴミは朝8時までに出してください。\n\n質問：ペットボトルを出すとき、どうしなければなりませんか？', '「ペットボトルはキャップとラベルを外してください」と書いてあります。페트병은 뚜껑과 라벨을 떼어야 합니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '그대로 버린다', FALSE, 1),
    (gen_random_uuid(), q_id, '잘게 잘라서 버린다', FALSE, 2),
    (gen_random_uuid(), q_id, '뚜껑과 라벨을 떼어야 한다', TRUE, 3),
    (gen_random_uuid(), q_id, '종이봉투에 넣어서 버린다', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (빵집 리뷰)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n駅前にできた新しいパン屋「森のパン工房」に行ってきました。\nメロンパンは外がカリカリで、中はふわふわでした。今まで食べた中で一番おいしかったです。\n値段は少し高いですが、材料にこだわっているので、しかたがないと思います。\n\n質問：「こだわっている」の意味に一番近いものはどれですか？', '「こだわっている」は材料の質にとても気を使っている、という意味です。재료에 신경을 많이 쓰고 있다는 뜻입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '아끼고 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '신경을 많이 쓰고 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '절약하고 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '걱정하고 있다', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (일본 계절 행사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n夏には「お盆」があります。8月13日から16日ごろに、亡くなった家族のためにお墓参りをします。この時期は多くの人がふるさとに帰ります。\n\n質問：「ふるさと」の意味は何ですか？', '「ふるさと」は「故郷」で、自分が生まれ育った場所です。고향이라는 뜻입니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '직장', FALSE, 1),
    (gen_random_uuid(), q_id, '여행지', FALSE, 2),
    (gen_random_uuid(), q_id, '친구 집', FALSE, 3),
    (gen_random_uuid(), q_id, '고향', TRUE, 4);
END $$;

-- Q10: 추론 (이사 메일의 목적)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n田中さんへ\n来月の15日に新しいアパートに引っ越すことになりました。新しいアパートは駅から歩いて5分のところにあります。部屋は今より少し広くて、近くにスーパーやコンビニもあります。\n引っ越しが終わったら、ぜひ遊びに来てください。\nパク・ジュンより\n\n質問：このメールの一番の目的は何ですか？', 'パクさんは引っ越しを知らせて、新しい家に遊びに来てほしいと伝えています。이사 소식을 알리고 놀러 오라고 초대하는 것이 목적입니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이사 도움을 부탁하려고', FALSE, 1),
    (gen_random_uuid(), q_id, '이사 소식을 알리고 놀러 오라고 초대하려고', TRUE, 2),
    (gen_random_uuid(), q_id, '새 아파트의 단점을 알려주려고', FALSE, 3),
    (gen_random_uuid(), q_id, '부동산을 추천하려고', FALSE, 4);
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
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n電車の中では大きな声で話したり、電話をしたりしないのが一般的です。優先席の近くでは、携帯電話の電源を切るか、マナーモードにしてください。\n\n質問：電車の中でのマナーとして正しいものはどれですか？', '電車の中では「大きな声で話したり、電話をしたりしない」のが一般的です。전철 안에서는 큰 소리로 이야기하거나 전화하지 않는 것이 일반적입니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '큰 소리로 전화해도 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '큰 소리로 이야기하거나 전화하지 않는다', TRUE, 2),
    (gen_random_uuid(), q_id, '우선석에서만 조용히 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '음악을 크게 들어도 된다', FALSE, 4);
END $$;

-- Q2: 내용이해 (방재 훈련)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n秋の防災訓練を下記のとおり実施いたします。\n日時：10月15日（日）午前9時〜12時\n場所：中央公園\n※雨天の場合は、市民体育館で行います。\n参加申し込みは不要です。\n\n質問：雨が降ったら、訓練はどうなりますか？', '「雨天の場合は、市民体育館で行います」と書いてあります。비가 오면 시민체육관에서 진행합니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '훈련이 취소된다', FALSE, 1),
    (gen_random_uuid(), q_id, '다음 주로 연기된다', FALSE, 2),
    (gen_random_uuid(), q_id, '시민체육관에서 진행한다', TRUE, 3),
    (gen_random_uuid(), q_id, '우산을 쓰고 공원에서 한다', FALSE, 4);
END $$;

-- Q3: 내용이해 (봉사활동 보고)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「川をきれいにしよう」ボランティア活動報告\n今年は大人65名、子ども23名、合計88名の方に参加していただきました。昨年より15名も多く、過去最多の参加者数でした。\nペットボトルや空き缶が最も多く、中には自転車やタイヤなど大きなゴミもありました。\n\n質問：今年の参加者は昨年と比べてどうでしたか？', '「昨年より15名も多く、過去最多」と書いてあります。작년보다 15명 많은 역대 최다 참가자 수였습니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '작년과 같았다', FALSE, 1),
    (gen_random_uuid(), q_id, '작년보다 15명 적었다', FALSE, 2),
    (gen_random_uuid(), q_id, '작년보다 15명 많았다', TRUE, 3),
    (gen_random_uuid(), q_id, '작년보다 88명 많았다', FALSE, 4);
END $$;

-- Q4: 내용이해 (식문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の食文化は2013年にユネスコの無形文化遺産に登録されました。\n一つ目は、「一汁三菜」という考え方です。ご飯、味噌汁、そして3つのおかずをバランスよく食べるという伝統があります。\n二つ目は、季節を大切にすることです。日本人は「旬」の食材を使うことを好みます。\n\n質問：「一汁三菜」とは何ですか？', '「ご飯、味噌汁、そして3つのおかず」を食べるスタイルです。밥, 된장국, 반찬 3가지를 먹는 전통입니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '국 3개와 반찬 1개', FALSE, 1),
    (gen_random_uuid(), q_id, '밥, 국 1개, 반찬 3개', TRUE, 2),
    (gen_random_uuid(), q_id, '제철 재료만 먹는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '하루 세 끼를 먹는 것', FALSE, 4);
END $$;

-- Q5: 세부정보 (주민 설문조사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「暮らしやすさに関するアンケート」結果報告\n【改善してほしい点】（複数回答可）\n1位：病院が少ない（42%）\n2位：夜道が暗くて危ない（35%）\n3位：子どもの遊び場が少ない（28%）\n\n質問：住民が一番改善してほしいと思っていることは何ですか？', '改善してほしい点の1位は「病院が少ない（42%）」です。주민들이 가장 개선을 원하는 것은 병원이 적다는 것입니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '병원이 적다', TRUE, 1),
    (gen_random_uuid(), q_id, '밤길이 어두워 위험하다', FALSE, 2),
    (gen_random_uuid(), q_id, '아이들 놀이터가 적다', FALSE, 3),
    (gen_random_uuid(), q_id, '교통이 불편하다', FALSE, 4);
END $$;

-- Q6: 세부정보 (축제 보고)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n第15回さくら祭りイベント報告\n今年は3年ぶりの通常開催となり、約3,500人の来場者で大いににぎわいました。\nボランティアスタッフとして参加してくださった52名の皆さま、協賛いただいた地元企業の皆さまに感謝申し上げます。\n\n質問：今年の来場者数は約何人でしたか？', '「約3,500人の来場者」と書いてあります。약 3,500명의 방문객이 있었습니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약 500명', FALSE, 1),
    (gen_random_uuid(), q_id, '약 1,500명', FALSE, 2),
    (gen_random_uuid(), q_id, '약 3,500명', TRUE, 3),
    (gen_random_uuid(), q_id, '약 5,200명', FALSE, 4);
END $$;

-- Q7: 세부정보 (일본 주거 사정)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本では、入居するときに「敷金」と「礼金」を払うのが一般的です。敷金は家賃の1〜2か月分で、退去するときに部屋の修理代を引いた金額が戻ってきます。礼金は大家さんへのお礼で、こちらは戻ってきません。\n\n質問：退去するとき、敷金はどうなりますか？', '「退去するときに部屋の修理代を引いた金額が戻ってきます」と書いてあります。방 수리비를 뺀 금액이 돌아옵니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전액 돌아온다', FALSE, 1),
    (gen_random_uuid(), q_id, '전혀 돌아오지 않는다', FALSE, 2),
    (gen_random_uuid(), q_id, '수리비를 뺀 금액이 돌아온다', TRUE, 3),
    (gen_random_uuid(), q_id, '다음 집주인에게 넘어간다', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (전철 통근 매너)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nお年寄りや体が不自由な方、妊婦さんを見かけたら、席を譲るのが望ましいです。朝の通勤時間帯は特に混雑しますが、お互いに思いやりを持って、気持ちよく移動できるようにしたいものです。\n\n質問：「思いやり」の意味に一番近いものはどれですか？', '「思いやり」は相手の気持ちや立場を考えて行動することです。상대방을 배려하는 마음입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '규칙을 지키는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '참을성', FALSE, 2),
    (gen_random_uuid(), q_id, '상대방에 대한 배려', TRUE, 3),
    (gen_random_uuid(), q_id, '용기', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (계절 편지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n手紙を書く習慣が少なくなっている現代ですが、心のこもった手書きの手紙は、もらった人をとても喜ばせるものです。年賀状は1月1日に届くように、12月中旬までに出しましょう。\n\n質問：「心のこもった」の意味に一番近いものはどれですか？', '「心のこもった」は真心が入った、気持ちを込めて書いたという意味です。진심이 담긴이라는 뜻입니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '길게 쓴', FALSE, 1),
    (gen_random_uuid(), q_id, '진심이 담긴', TRUE, 2),
    (gen_random_uuid(), q_id, '비싼 종이에 쓴', FALSE, 3),
    (gen_random_uuid(), q_id, '어려운 단어를 사용한', FALSE, 4);
END $$;

-- Q10: 추론 (식문화의 과제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本料理は味だけでなく、盛り付けにもこだわります。色とりどりの食材を使い、器にも気を配ります。「目で食べる」という表現があるほど、見た目を大切にしています。\nしかし最近は、若い世代の食生活が変わりつつあり、伝統的な食文化をどう守っていくかが課題となっています。\n\n質問：筆者が心配していることは何だと考えられますか？', '最後の文で「伝統的な食文化をどう守っていくかが課題」と述べています。전통적인 식문화가 사라지는 것을 걱정하고 있습니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본 요리의 가격이 너무 비싸지는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '젊은 세대가 요리를 못하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '외국 요리가 인기 있는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '전통 식문화가 사라질 수 있는 것', TRUE, 4);
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
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nまず、労働力不足の問題がある。生産年齢人口の減少により、多くの業種で人手が足りない状況が続いている。特に介護、農業、建設といった分野では深刻であり、外国人労働者の受け入れ拡大が議論されている。\n\n質問：労働力不足が特に深刻な分野として挙げられていないのはどれですか？', '本文では「介護、農業、建設」が特に深刻だと述べています。금융は挙げられていません。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '돌봄(간호)', FALSE, 1),
    (gen_random_uuid(), q_id, '농업', FALSE, 2),
    (gen_random_uuid(), q_id, '금융', TRUE, 3),
    (gen_random_uuid(), q_id, '건설', FALSE, 4);
END $$;

-- Q2: 내용이해 (교육 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の教育制度は「6-3-3-4制」と呼ばれ、小学校6年、中学校3年、高等学校3年、大学4年で構成されている。このうち小学校と中学校の9年間が義務教育であり、ほぼ全ての子どもが通っている。\n\n質問：日本の義務教育は何年間ですか？', '「小学校と中学校の9年間が義務教育」と書いてあります。의무교육은 9년입니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '6년', FALSE, 1),
    (gen_random_uuid(), q_id, '9년', TRUE, 2),
    (gen_random_uuid(), q_id, '12년', FALSE, 3),
    (gen_random_uuid(), q_id, '16년', FALSE, 4);
END $$;

-- Q3: 내용이해 (환경 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n2020年にはレジ袋の有料化が全国で実施され、マイバッグを持参する習慣が広く定着した。\n最近では「エシカル消費」という概念も広まりつつあり、環境や社会に配慮した商品を選ぶ消費者が増えている。\n\n質問：レジ袋の有料化の結果、どのような変化がありましたか？', '「マイバッグを持参する習慣が広く定着した」と書いてあります。에코백을 지참하는 습관이 정착되었습니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비닐봉지 사용이 더 늘었다', FALSE, 1),
    (gen_random_uuid(), q_id, '에코백을 지참하는 습관이 정착되었다', TRUE, 2),
    (gen_random_uuid(), q_id, '슈퍼마켓 매출이 줄었다', FALSE, 3),
    (gen_random_uuid(), q_id, '종이봉투로 바뀌었다', FALSE, 4);
END $$;

-- Q4: 내용이해 (식품 로스)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n特に日本独特の商習慣である「3分の1ルール」が問題視されている。これは、賞味期限の3分の1が過ぎた時点で小売店に納品できなくなるというルールで、まだ十分に食べられる商品が廃棄される一因となっている。\n\n質問：「3分の1ルール」とは何ですか？', '賞味期限の3分の1が過ぎると小売店に納品できなくなるルールです。유통기한의 1/3이 지나면 납품 불가능한 상관행입니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상품의 1/3을 할인하는 규칙', FALSE, 1),
    (gen_random_uuid(), q_id, '유통기한의 1/3이 지나면 납품할 수 없는 규칙', TRUE, 2),
    (gen_random_uuid(), q_id, '음식의 1/3은 버려도 되는 규칙', FALSE, 3),
    (gen_random_uuid(), q_id, '가격의 1/3을 기부하는 규칙', FALSE, 4);
END $$;

-- Q5: 세부정보 (외국인 생활 지원)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n特に医療に関しては、言葉の壁により適切な治療を受けられないケースが問題となっており、医療通訳の整備が急がれている。\n子育て支援も重要な分野だ。外国にルーツを持つ子どもたちが学校生活に適応できるよう、日本語指導や母語を活用した学習支援が行われている。\n\n質問：外国人住民の医療に関する課題は何ですか？', '「言葉の壁により適切な治療を受けられないケース」が問題です。언어 장벽으로 적절한 치료를 받지 못하는 것이 문제입니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보험에 가입할 수 없다', FALSE, 1),
    (gen_random_uuid(), q_id, '병원이 부족하다', FALSE, 2),
    (gen_random_uuid(), q_id, '언어 장벽으로 적절한 치료를 받지 못한다', TRUE, 3),
    (gen_random_uuid(), q_id, '의료비가 너무 비싸다', FALSE, 4);
END $$;

-- Q6: 세부정보 (의료 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の医療制度は「国民皆保険」を基本としており、全ての国民が何らかの公的な健康保険に加入することが義務づけられている。これにより、医療費の自己負担は原則3割で済む。\n紹介状なしで大病院を受診すると、追加の費用がかかる場合がある。\n\n質問：日本の医療費の自己負担は原則何割ですか？', '「医療費の自己負担は原則3割」と書いてあります。의료비 자기부담은 원칙적으로 3할입니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1할', FALSE, 1),
    (gen_random_uuid(), q_id, '2할', FALSE, 2),
    (gen_random_uuid(), q_id, '3할', TRUE, 3),
    (gen_random_uuid(), q_id, '5할', FALSE, 4);
END $$;

-- Q7: 세부정보 (지방 이주)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n内閣府の調査によると、東京圏在住者の約3割が地方移住に関心を持っており、特に20代〜30代の若い世代で関心が高い。\nコロナ禍でテレワークが定着したことで、都市部で働きながら地方に住むという選択肢が現実的になったことも大きな要因である。\n\n質問：地方移住への関心が高まった大きな要因の一つは何ですか？', '「テレワークが定着したことで、都市部で働きながら地方に住むという選択肢が現実的になった」と書いてあります。재택근무 정착이 큰 요인입니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지방의 급여가 올랐기 때문', FALSE, 1),
    (gen_random_uuid(), q_id, '도쿄의 인구가 줄었기 때문', FALSE, 2),
    (gen_random_uuid(), q_id, '지방의 인터넷이 빨라졌기 때문', FALSE, 3),
    (gen_random_uuid(), q_id, '재택근무가 정착되었기 때문', TRUE, 4);
END $$;

-- Q8: 문맥어휘 (워크라이프 밸런스)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本はかつて「企業戦士」「モーレツ社員」という言葉に象徴されるように、長時間労働が美徳とされる社会だった。その結果、「過労死」という言葉が英語でも「Karoshi」としてそのまま使われるほど、深刻な社会問題となった。\n\n質問：「美徳」の意味に一番近いものはどれですか？', '「美徳」は道徳的に優れた行いや価値のことです。도덕적으로 가치 있는 것이라는 뜻입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '아름다운 덕목, 바람직한 가치', TRUE, 1),
    (gen_random_uuid(), q_id, '나쁜 습관', FALSE, 2),
    (gen_random_uuid(), q_id, '법적 의무', FALSE, 3),
    (gen_random_uuid(), q_id, '유행하는 문화', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (SNS와 커뮤니케이션)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n匿名性を利用した誹謗中傷は深刻な社会問題となっており、精神的な被害を受ける人が後を絶たない。情報の真偽を見極めるメディアリテラシーの重要性がかつてないほど高まっている。\n\n質問：「後を絶たない」の意味に一番近いものはどれですか？', '「後を絶たない」は「続いて起こり、なくならない」という意味です。계속 끊이지 않는다는 뜻입니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '줄어들고 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '계속 끊이지 않는다', TRUE, 2),
    (gen_random_uuid(), q_id, '갑자기 시작되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '완전히 사라졌다', FALSE, 4);
END $$;

-- Q10: 추론 (고령화 사회의 본질적 과제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nかつては高齢者1人を現役世代約10人で支えていたが、現在では約2人で支えなければならない計算になる。\n政府はさまざまな対策を講じているが、出生率の回復には至っていない。子育て支援の充実、働き方改革、地方創生など、複合的なアプローチが求められている。\n\n質問：筆者が主張したいことは何だと考えられますか？', '筆者は一つの対策だけでなく「複合的なアプローチ」が必要だと主張しています。복합적인 접근이 필요하다는 것입니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '외국인 노동자만 늘리면 해결된다', FALSE, 1),
    (gen_random_uuid(), q_id, '연금 제도를 폐지해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '하나의 대책이 아닌 복합적인 접근이 필요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '고령자가 더 오래 일하면 된다', FALSE, 4);
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
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n伝統的に、日本語の敬語は「尊敬語」「謙譲語」「丁寧語」の三分類で整理されてきた。ところが、2007年に文化審議会が発表した「敬語の指針」では、これが五分類に再編された。具体的には、従来の謙譲語が「謙譲語I」と「謙譲語II（丁重語）」に分けられ、また「丁寧語」から「美化語」が独立した。\n\n質問：2007年の「敬語の指針」で、敬語はどのように変わりましたか？', '3分類から5分類に再編されました。3분류에서 5분류로 재편되었습니다。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5분류에서 3분류로 간소화되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '3분류에서 5분류로 재편되었다', TRUE, 2),
    (gen_random_uuid(), q_id, '3분류에서 7분류로 세분화되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '경어 분류가 폐지되었다', FALSE, 4);
END $$;

-- Q2: 내용이해 (다문화 공생)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本語能力が不十分なまま通常の授業に参加せざるを得ない子どもたちは、学力の遅れだけでなく、アイデンティティの揺らぎという問題にも直面する。母語も日本語も中途半端になる「ダブルリミテッド」の状態に陥るケースも報告されている。\n\n質問：「ダブルリミテッド」とはどのような状態ですか？', '母語も日本語も中途半端になる状態です。모국어도 일본어도 중간 수준에 머무는 상태입니다。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '두 가지 언어를 완벽하게 구사하는 상태', FALSE, 1),
    (gen_random_uuid(), q_id, '일본어만 할 수 있는 상태', FALSE, 2),
    (gen_random_uuid(), q_id, '모국어도 일본어도 충분하지 않은 상태', TRUE, 3),
    (gen_random_uuid(), q_id, '두 가지 국적을 가진 상태', FALSE, 4);
END $$;

-- Q3: 내용이해 (소비 행동 변화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nかつてのような「モノ消費」、すなわちブランド品や高級車を所有することにステータスを見出す傾向は薄れ、代わりに「コト消費」と呼ばれる体験型の消費が台頭している。\nカーシェアリングやフリマアプリの利用者数の増加は、所有から利用へという消費パラダイムの転換を如実に物語っている。\n\n質問：現代の日本の消費行動の変化として正しいものはどれですか？', '「モノ消費」から「コト消費」（体験型消費）への転換が起きています。소유에서 이용으로의 전환이 일어나고 있습니다。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '브랜드품 구매가 더 늘었다', FALSE, 1),
    (gen_random_uuid(), q_id, '물건 소유보다 체험 소비로 바뀌고 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '소비 자체가 줄어들었다', FALSE, 3),
    (gen_random_uuid(), q_id, '고급차 판매가 증가하고 있다', FALSE, 4);
END $$;

-- Q4: 내용이해 (지역 커뮤니티)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n東日本大震災をはじめとする度重なる自然災害は、地域のつながりの重要性を改めて浮き彫りにした。災害時に最も頼りになるのは、日頃から顔の見える関係を築いている隣人たちだということが、多くの被災地の経験から明らかになった。\n\n質問：自然災害の経験から明らかになったことは何ですか？', '「日頃から顔の見える関係を築いている隣人たちが最も頼りになる」と述べています。평소 얼굴을 아는 이웃이 가장 의지가 된다는 것입니다。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '행정 지원만으로 충분하다', FALSE, 1),
    (gen_random_uuid(), q_id, '혼자서 대비하는 것이 가장 중요하다', FALSE, 2),
    (gen_random_uuid(), q_id, '평소 이웃과의 관계가 가장 의지가 된다', TRUE, 3),
    (gen_random_uuid(), q_id, 'SNS 연락이 가장 효과적이다', FALSE, 4);
END $$;

-- Q5: 세부정보 (사계절과 문학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n松尾芭蕉の「古池や蛙飛び込む水の音」における「蛙」は春の季語であり、冬の静寂が破られる瞬間の生命の躍動を表現している。\n清少納言の『枕草子』は、「春はあけぼの」という有名な冒頭に始まり、各季節の最も美しい時間帯を繊細に描き出した。\n\n質問：松尾芭蕉の俳句で「蛙」はどの季節の季語ですか？', '「蛙は春の季語」と書いてあります。개구리는 봄의 기고(계절어)입니다。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '봄', TRUE, 1),
    (gen_random_uuid(), q_id, '여름', FALSE, 2),
    (gen_random_uuid(), q_id, '가을', FALSE, 3),
    (gen_random_uuid(), q_id, '겨울', FALSE, 4);
END $$;

-- Q6: 세부정보 (돌봄 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最も深刻なのは、介護人材の不足である。介護職の離職率は高く、その背景には低賃金と過酷な労働環境がある。全産業平均と比較して月額約6万円低い給与水準は、若い世代がこの業界を敬遠する一因となっている。\n\n質問：介護人材が不足している主な背景は何ですか？', '「低賃金と過酷な労働環境」が背景として挙げられています。낮은 임금과 가혹한 노동 환경이 주요 배경입니다。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자격 취득이 어렵기 때문', FALSE, 1),
    (gen_random_uuid(), q_id, '일이 지루하기 때문', FALSE, 2),
    (gen_random_uuid(), q_id, '낮은 임금과 가혹한 노동 환경', TRUE, 3),
    (gen_random_uuid(), q_id, '외국인 노동자와의 경쟁', FALSE, 4);
END $$;

-- Q7: 세부정보 (교육 격차)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n年収400万円未満の家庭の大学進学率が約30%であるのに対し、年収1000万円以上の家庭では約60%に達する。この差は、塾や予備校の費用、大学の学費など、教育にかかる経済的負担の大きさを反映している。\n\n質問：年収1000万円以上の家庭の大学進学率は約何%ですか？', '「年収1000万円以上の家庭では約60%」と書いてあります。연수입 1000만 엔 이상 가정의 대학 진학률은 약 60%입니다。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약 30%', FALSE, 1),
    (gen_random_uuid(), q_id, '약 45%', FALSE, 2),
    (gen_random_uuid(), q_id, '약 60%', TRUE, 3),
    (gen_random_uuid(), q_id, '약 90%', FALSE, 4);
END $$;

-- Q8: 문맥어휘 (식품 안전)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n食の安全に対する消費者の関心は、過去の食品偽装事件や農薬混入問題を経て、かつてないほど高まっている。\n安全性の高い食品は総じて価格も高く、全ての消費者が手にできるわけではない。食の安全を一部の富裕層だけの特権としないためにも、安全で手頃な価格の食品を安定的に供給できる仕組みの構築が重要だ。\n\n質問：「かつてないほど」の意味に一番近いものはどれですか？', '「かつてないほど」は「今までにないくらい」という意味です。지금까지 없었을 정도로 라는 뜻입니다。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이전과 같은 정도로', FALSE, 1),
    (gen_random_uuid(), q_id, '이전보다 조금 더', FALSE, 2),
    (gen_random_uuid(), q_id, '지금까지 없었을 정도로', TRUE, 3),
    (gen_random_uuid(), q_id, '예상했던 대로', FALSE, 4);
END $$;

-- Q9: 문맥어휘 (모호한 표현)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「ちょっと…」「考えておきます」「前向きに検討します」といった表現は、言葉通りに受け取ると肯定的に聞こえるが、実際には婉曲的な断りを意味することが多い。\n直接的な拒絶や否定は相手の面子を潰し、人間関係に亀裂を生じさせるリスクがある。\n\n質問：「婉曲的」の意味に一番近いものはどれですか？', '「婉曲的」は直接的でなく、遠回しに表現するという意味です。직접적이지 않고 돌려서 말하는이라는 뜻입니다。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '직접적이고 명확한', FALSE, 1),
    (gen_random_uuid(), q_id, '거짓말을 하는', FALSE, 2),
    (gen_random_uuid(), q_id, '돌려서 말하는', TRUE, 3),
    (gen_random_uuid(), q_id, '감정적인', FALSE, 4);
END $$;

-- Q10: 추론 (모호한 표현의 본질)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n曖昧表現を日本語の「欠点」と見るか「豊かさ」と見るかは、立場によって異なる。確かに、曖昧さが責任の所在を不明確にし、意思決定を遅延させるという批判は正当である。しかし同時に、相手の立場を慮り、衝突を回避しようとする配慮の表れでもある。\n重要なのは、相手や状況に応じて、曖昧な表現と明確な表現を使い分ける能力を身につけることであろう。\n\n質問：筆者が最も主張したいことは何ですか？', '筆者は曖昧表現の良し悪しではなく、「状況に応じて使い分ける能力が重要」だと主張しています。상황에 따라 구분하여 사용하는 능력이 중요하다는 것입니다。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모호한 표현을 완전히 없애야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '모호한 표현은 일본어의 장점이다', FALSE, 2),
    (gen_random_uuid(), q_id, '상황에 따라 모호한 표현과 명확한 표현을 구분하여 사용하는 능력이 중요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '외국인에게는 명확한 표현만 사용해야 한다', FALSE, 4);
END $$;
