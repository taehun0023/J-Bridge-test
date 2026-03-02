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
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nがくせいの みなさんへ\nあしたは たいいくの じゅぎょうが あります。うんどうぐつを もってきてください。たいいくかんに 9じに あつまってください。\nせんせいより\n\n質問：あした なにを もっていきますか？', '「うんどうぐつを もってきてください」と書いてあります。내일 운동화를 가져가야 합니다。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교과서', FALSE, 1),
    (gen_random_uuid(), q_id, '도시락', FALSE, 2),
    (gen_random_uuid(), q_id, '운동화', TRUE, 3),
    (gen_random_uuid(), q_id, '수영복', FALSE, 4);
END $$;

-- N5 Q12: 세부정보 (전단지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nさくらレストラン\nひる：11じ〜2じ\nよる：5じ〜9じ\nやすみ：すいようび\nランチセット：800えん（サラダ、スープつき）\n\n質問：ランチセットに ついているものは なんですか？', '「サラダ、スープつき」と書いてあります。런치 세트에는 샐러드와 수프가 포함되어 있습니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '샐러드와 음료', FALSE, 1),
    (gen_random_uuid(), q_id, '수프와 디저트', FALSE, 2),
    (gen_random_uuid(), q_id, '샐러드와 수프', TRUE, 3),
    (gen_random_uuid(), q_id, '빵과 수프', FALSE, 4);
END $$;

-- N5 Q13: 내용이해 (일기)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nきょうは にちようびです。あさ こうえんで ジョギングを しました。それから としょかんで ほんを よみました。ごごは ともだちと えいがを みました。とても たのしかったです。\n\n質問：この人は ごぜん なにを しましたか？', '朝は公園でジョギング、それから図書館で本を読みました。오전에는 조깅과 독서를 했습니다。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영화를 보았다', FALSE, 1),
    (gen_random_uuid(), q_id, '조깅과 독서를 했다', TRUE, 2),
    (gen_random_uuid(), q_id, '친구를 만났다', FALSE, 3),
    (gen_random_uuid(), q_id, '쇼핑을 했다', FALSE, 4);
END $$;

-- N5 Q14: 문맥어휘 (메모)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nたなかさんへ\nでんわが ありました。やまださんから です。あしたの かいぎは 3じに かわりました。2じでは ありません。\nすずきより\n\n質問：「かわりました」は なんの いみですか？', '「かわりました」は「変わりました」で、時間が変更されたことを意味します。변경되었다는 의미입니다。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취소되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '변경되었다', TRUE, 2),
    (gen_random_uuid(), q_id, '시작되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '끝났다', FALSE, 4);
END $$;

-- N5 Q15: 세부정보 (가족 소개)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしの かぞくは 4にんです。ちちと ははと あにと わたしです。ちちは かいしゃいんです。ははは せんせいです。あには だいがくせいです。\n\n質問：おかあさんの しごとは なんですか？', '「ははは せんせいです」と書いてあります。어머니는 선생님입니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회사원', FALSE, 1),
    (gen_random_uuid(), q_id, '대학생', FALSE, 2),
    (gen_random_uuid(), q_id, '선생님', TRUE, 3),
    (gen_random_uuid(), q_id, '간호사', FALSE, 4);
END $$;

-- N5 Q16: 내용이해 (교통 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nえきから びょういんまで バスで 10ぷんです。バスは 1ばんの のりばから でます。30ぷんに 1かい あります。\n\n質問：バスは どのくらいの かんかくで ありますか？', '「30ぷんに 1かい あります」と書いてあります。30분에 1번 있습니다。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '10분에 1번', FALSE, 1),
    (gen_random_uuid(), q_id, '20분에 1번', FALSE, 2),
    (gen_random_uuid(), q_id, '30분에 1번', TRUE, 3),
    (gen_random_uuid(), q_id, '1시간에 1번', FALSE, 4);
END $$;

-- N5 Q17: 세부정보 (날씨 예보)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nあしたの てんきよほう\nあさ：はれ\nひる：くもり\nよる：あめ\nかさを もっていった ほうが いいです。\n\n質問：いつから あめが ふりますか？', '「よる：あめ」と書いてあります。밤부터 비가 옵니다。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '아침부터', FALSE, 1),
    (gen_random_uuid(), q_id, '낮부터', FALSE, 2),
    (gen_random_uuid(), q_id, '밤부터', TRUE, 3),
    (gen_random_uuid(), q_id, '하루 종일', FALSE, 4);
END $$;

-- N5 Q18: 문맥어휘 (쇼핑)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nこの みせでは やさいが とても やすいです。にんじんは 1ぽん 50えんです。たまねぎは 3つで 100えんです。まいにち たくさんの ひとが きます。\n\n質問：「やすい」は なんの いみですか？', '「やすい」は「安い」で、値段が低いことを意味します。(가격이) 싸다는 의미입니다。', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '맛있다', FALSE, 1),
    (gen_random_uuid(), q_id, '싸다', TRUE, 2),
    (gen_random_uuid(), q_id, '비싸다', FALSE, 3),
    (gen_random_uuid(), q_id, '신선하다', FALSE, 4);
END $$;

-- N5 Q19: 추론 (초대)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nリンさんへ\nこんど の どようび、うちで パーティーを します。ともだちも たくさん きます。りょうりも つくります。リンさんも きませんか。\nたなかより\n\n質問：たなかさんは リンさんに なにを したいですか？', '「リンさんも きませんか」は誘いの表現です。田中さんはリンさんをパーティーに招待したいと考えています。파티에 초대하고 싶어합니다。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요리를 가르쳐 주고 싶다', FALSE, 1),
    (gen_random_uuid(), q_id, '파티에 초대하고 싶다', TRUE, 2),
    (gen_random_uuid(), q_id, '선물을 주고 싶다', FALSE, 3),
    (gen_random_uuid(), q_id, '함께 공부하고 싶다', FALSE, 4);
END $$;

-- N5 Q20: 내용이해 (취미)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしの しゅみは りょうりです。まいにち よるごはんを つくります。にほんの りょうりが すきです。とくに おすしが だいすきです。でも つくるのは むずかしいです。\n\n質問：この ひとが いちばん すきな りょうりは なんですか？', '「とくに おすしが だいすきです」と書いてあります。특히 초밥을 가장 좋아합니다。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '라멘', FALSE, 1),
    (gen_random_uuid(), q_id, '초밥', TRUE, 2),
    (gen_random_uuid(), q_id, '카레', FALSE, 3),
    (gen_random_uuid(), q_id, '튀김', FALSE, 4);
END $$;

-- N5 Q21: 세부정보 (병원 접수)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nやまだ びょういん\nうけつけ じかん：ごぜん 9じ〜12じ、ごご 2じ〜5じ\nやすみ：にちようびと しゅくじつ\nはじめての ひとは ほけんしょうを もってきてください。\n\n質問：はじめての ひとは なにが ひつようですか？', '「ほけんしょうを もってきてください」と書いてあります。처음 오는 사람은 보험증이 필요합니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '여권', FALSE, 1),
    (gen_random_uuid(), q_id, '보험증', TRUE, 2),
    (gen_random_uuid(), q_id, '학생증', FALSE, 3),
    (gen_random_uuid(), q_id, '진찰권', FALSE, 4);
END $$;

-- N5 Q22: 내용이해 (여행 계획)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nらいしゅう おおさかに いきます。しんかんせんで いきます。2はく します。おおさかじょうと どうとんぼりに いきたいです。\n\n質問：なんで おおさかに いきますか？', '「しんかんせんで いきます」と書いてあります。신칸센으로 갑니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비행기', FALSE, 1),
    (gen_random_uuid(), q_id, '버스', FALSE, 2),
    (gen_random_uuid(), q_id, '신칸센', TRUE, 3),
    (gen_random_uuid(), q_id, '자동차', FALSE, 4);
END $$;

-- N5 Q23: 추론 (메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nキムさんへ\nあした いっしょに べんきょうしませんか。としょかんで 10じに まっています。おわったら、いっしょに おひるごはんを たべましょう。\nリンより\n\n質問：リンさんは あした なにを しますか？', 'リンさんは図書館で勉強した後、一緒に昼ご飯を食べる予定です。공부 후 점심을 같이 먹습니다。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공부만 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '공부한 후 점심을 같이 먹는다', TRUE, 2),
    (gen_random_uuid(), q_id, '점심만 먹는다', FALSE, 3),
    (gen_random_uuid(), q_id, '영화를 본다', FALSE, 4);
END $$;

-- N5 Q24: 세부정보 (자기소개)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nわたしは パクです。かんこくから きました。いま とうきょうに すんでいます。にほんごの がっこうに かよっています。まいにち 3じかん べんきょうします。\n\n質問：パクさんは まいにち なんじかん べんきょうしますか？', '「まいにち 3じかん べんきょうします」と書いてあります。매일 3시간 공부합니다。', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1시간', FALSE, 1),
    (gen_random_uuid(), q_id, '2시간', FALSE, 2),
    (gen_random_uuid(), q_id, '3시간', TRUE, 3),
    (gen_random_uuid(), q_id, '4시간', FALSE, 4);
END $$;

-- N5 Q25: 문맥어휘 (도서관 규칙)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nとしょかんの きまり\n・しずかに してください。\n・ほんは 2しゅうかん かりられます。\n・たべものと のみものは だめです。\n\n質問：「だめです」は なんの いみですか？', '「だめです」は禁止を表す表現で、「안 됩니다 / 금지입니다」の意味です。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '좋다', FALSE, 1),
    (gen_random_uuid(), q_id, '안 된다', TRUE, 2),
    (gen_random_uuid(), q_id, '필요하다', FALSE, 3),
    (gen_random_uuid(), q_id, '가능하다', FALSE, 4);
END $$;

-- N5 Q26: 내용이해 (아르바이트 모집)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアルバイト ぼしゅう\nコンビニの しごとです。\nじかん：ごご 6じ〜10じ\nきゅうりょう：1じかん 1000えん\nがくせい OK\n\n質問：1にち なんじかん はたらきますか？', '午後6時〜10時なので、4時間です。하루 4시간 일합니다。', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3시간', FALSE, 1),
    (gen_random_uuid(), q_id, '4시간', TRUE, 2),
    (gen_random_uuid(), q_id, '5시간', FALSE, 3),
    (gen_random_uuid(), q_id, '6시간', FALSE, 4);
END $$;

-- N5 Q27: 추론 (감사 편지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nせんせいへ\nいつも ていねいに おしえてくださって、ありがとうございます。おかげで にほんごが すこし わかるように なりました。これからも がんばります。\nキムより\n\n質問：キムさんは いま どう おもっていますか？', 'キムさんは先生に感謝し、日本語が少しわかるようになったと言っています。감사하고 있으며 앞으로도 열심히 하겠다고 합니다。', 1, 27, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본어가 너무 어려워서 포기하고 싶다', FALSE, 1),
    (gen_random_uuid(), q_id, '선생님께 감사하며 앞으로도 열심히 하겠다', TRUE, 2),
    (gen_random_uuid(), q_id, '선생님의 수업이 불만이다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본어를 다 배웠다', FALSE, 4);
END $$;

-- N5 Q28: 세부정보 (아파트 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアパートの みなさんへ\nすいようびは ゴミの ひです。あさ 8じまでに だしてください。ペットボトルは きんようびに だしてください。\nかんりにんより\n\n質問：ペットボトルは いつ だしますか？', '「ペットボトルは きんようびに だしてください」と書いてあります。페트병은 금요일에 내놓습니다。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수요일', FALSE, 1),
    (gen_random_uuid(), q_id, '목요일', FALSE, 2),
    (gen_random_uuid(), q_id, '금요일', TRUE, 3),
    (gen_random_uuid(), q_id, '월요일', FALSE, 4);
END $$;

-- N5 Q29: 내용이해 (계절)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nにほんの なつは あつくて、むしむしします。7がつと 8がつが いちばん あついです。みんな うみや プールに いきます。かきごおりが にんきです。\n\n質問：にほんの なつの とくちょうは なんですか？', '「あつくて、むしむしします」と書いてあります。일본의 여름은 덥고 습합니다。', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '춥고 건조하다', FALSE, 1),
    (gen_random_uuid(), q_id, '덥고 습하다', TRUE, 2),
    (gen_random_uuid(), q_id, '시원하고 쾌적하다', FALSE, 3),
    (gen_random_uuid(), q_id, '비가 많이 온다', FALSE, 4);
END $$;

-- N5 Q30: 문맥어휘 (약속 변경)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000001-0000-0000-0000-000000000001', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nすみません、あしたの やくそくですが、ちょっと つごうが わるくなりました。あさっては どうですか。おなじ じかんで おねがいします。\n\n質問：「つごうが わるい」は なんの いみですか？', '「つごうが わるい」は「都合が悪い」で、予定が合わないことを意味します。사정이 안 좋다 / 시간이 안 된다는 의미입니다。', 1, 30, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기분이 나쁘다', FALSE, 1),
    (gen_random_uuid(), q_id, '사정이 안 된다', TRUE, 2),
    (gen_random_uuid(), q_id, '날씨가 나쁘다', FALSE, 3),
    (gen_random_uuid(), q_id, '건강이 안 좋다', FALSE, 4);
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
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n社員の皆さんへ\n来週の月曜日から、会社の入り口が変わります。正面ではなく、横の入り口を使ってください。工事は2週間かかります。ご迷惑をおかけしますが、よろしくお願いします。\n\n質問：来週から何が変わりますか？', '「会社の入り口が変わります」と書いてあります。회사 입구가 변경됩니다。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '근무 시간', FALSE, 1),
    (gen_random_uuid(), q_id, '회사 입구', TRUE, 2),
    (gen_random_uuid(), q_id, '점심 시간', FALSE, 3),
    (gen_random_uuid(), q_id, '회의실', FALSE, 4);
END $$;

-- N4 Q12: 세부정보 (이벤트 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n春のフリーマーケット\n日時：4月15日（土）10時〜16時\n場所：中央公園\n参加費：1ブース 500円\n雨天の場合は翌日に延期します。\n申し込み：4月10日まで\n\n質問：雨が降ったらどうなりますか？', '「雨天の場合は翌日に延期します」と書いてあります。비가 오면 다음 날로 연기됩니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '중지된다', FALSE, 1),
    (gen_random_uuid(), q_id, '다음 날로 연기된다', TRUE, 2),
    (gen_random_uuid(), q_id, '실내에서 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '그대로 진행한다', FALSE, 4);
END $$;

-- N4 Q13: 내용이해 (일상 블로그)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n先週、新しいカフェに行きました。駅から歩いて5分のところにあります。ケーキがおいしくて、コーヒーも安いです。でも、席が少ないので、週末は混んでいます。平日に行くほうがいいと思います。\n\n質問：この人はいつ行くことをすすめていますか？', '「平日に行くほうがいいと思います」と言っています。평일에 가는 것을 추천합니다。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주말 오전', FALSE, 1),
    (gen_random_uuid(), q_id, '평일', TRUE, 2),
    (gen_random_uuid(), q_id, '주말 오후', FALSE, 3),
    (gen_random_uuid(), q_id, '공휴일', FALSE, 4);
END $$;

-- N4 Q14: 문맥어휘 (요리 레시피)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nかんたんオムライス\n1. たまねぎを細かく切ります。\n2. フライパンで炒めます。\n3. ごはんとケチャップを入れて混ぜます。\n4. 別のフライパンでたまごを焼きます。\n5. ごはんの上にたまごをのせて、できあがりです。\n\n質問：「炒めます」の意味は何ですか？', '「炒めます」は火を使って食材をかき混ぜながら加熱することです。볶다라는 의미입니다。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '삶다', FALSE, 1),
    (gen_random_uuid(), q_id, '볶다', TRUE, 2),
    (gen_random_uuid(), q_id, '찌다', FALSE, 3),
    (gen_random_uuid(), q_id, '튀기다', FALSE, 4);
END $$;

-- N4 Q15: 추론 (감사 메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n田中先輩へ\n昨日は引っ越しを手伝ってくださって、ありがとうございました。おかげさまで予定より早く終わりました。今度、お礼にご飯をおごらせてください。\n金より\n\n質問：金さんはこれから何をしたいですか？', '「お礼にご飯をおごらせてください」と言っています。감사의 뜻으로 밥을 사고 싶어합니다。', 1, 15, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '또 이사를 도와달라고 하고 싶다', FALSE, 1),
    (gen_random_uuid(), q_id, '감사의 뜻으로 밥을 사고 싶다', TRUE, 2),
    (gen_random_uuid(), q_id, '선물을 보내고 싶다', FALSE, 3),
    (gen_random_uuid(), q_id, '편지를 쓰고 싶다', FALSE, 4);
END $$;

-- N4 Q16: 내용이해 (스포츠 클럽)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nスポーツクラブ会員募集\n月会費：5000円\nプール・ジム使い放題\n営業時間：朝7時〜夜10時\n初回体験は無料です。\n持ち物：運動着、タオル、室内シューズ\n\n質問：初めての人はいくら払いますか？', '「初回体験は無料です」と書いてあります。처음 체험은 무료입니다。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '5000엔', FALSE, 1),
    (gen_random_uuid(), q_id, '3000엔', FALSE, 2),
    (gen_random_uuid(), q_id, '무료', TRUE, 3),
    (gen_random_uuid(), q_id, '1000엔', FALSE, 4);
END $$;

-- N4 Q17: 세부정보 (여행 후기)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n先月、京都に旅行に行きました。一日目はお寺を見て回りました。二日目は着物を着て街を歩きました。三日目は抹茶の体験をしました。京都は古い建物が多くて、とてもきれいでした。\n\n質問：二日目に何をしましたか？', '「二日目は着物を着て街を歩きました」と書いてあります。이틀째에는 기모노를 입고 거리를 걸었습니다。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '절을 구경했다', FALSE, 1),
    (gen_random_uuid(), q_id, '기모노를 입고 거리를 걸었다', TRUE, 2),
    (gen_random_uuid(), q_id, '말차 체험을 했다', FALSE, 3),
    (gen_random_uuid(), q_id, '쇼핑을 했다', FALSE, 4);
END $$;

-- N4 Q18: 내용이해 (건강 조언)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n健康のために大切なことが三つあります。一つ目は、毎日少しでも運動することです。二つ目は、野菜を多く食べることです。三つ目は、十分な睡眠をとることです。この三つを守れば、病気になりにくくなります。\n\n質問：健康のために大切なことはいくつありますか？', '「健康のために大切なことが三つあります」と書いてあります。건강을 위해 중요한 것은 3가지입니다。', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2가지', FALSE, 1),
    (gen_random_uuid(), q_id, '3가지', TRUE, 2),
    (gen_random_uuid(), q_id, '4가지', FALSE, 3),
    (gen_random_uuid(), q_id, '5가지', FALSE, 4);
END $$;

-- N4 Q19: 문맥어휘 (계절 묘사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n秋になると、木の葉が赤や黄色に色づきます。これを「紅葉」と言います。日本では紅葉を見に山や公園に行く人がたくさんいます。京都の紅葉が特に有名です。\n\n質問：「色づく」の意味は何ですか？', '「色づく」は葉の色が変わることを意味します。색이 물들다 / 단풍이 들다의 의미입니다。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잎이 떨어지다', FALSE, 1),
    (gen_random_uuid(), q_id, '색이 물들다', TRUE, 2),
    (gen_random_uuid(), q_id, '꽃이 피다', FALSE, 3),
    (gen_random_uuid(), q_id, '열매가 열리다', FALSE, 4);
END $$;

-- N4 Q20: 추론 (고민 상담)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最近、夜なかなか眠れません。スマートフォンを見るのをやめたほうがいいと友達に言われました。確かに寝る前にいつもスマートフォンを使っています。今日から寝る前1時間はスマートフォンを見ないようにしてみます。\n\n質問：この人はこれから何をしますか？', '「寝る前1時間はスマートフォンを見ないようにしてみます」と言っています。잠자기 전 1시간은 스마트폰을 보지 않겠다고 합니다。', 1, 20, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수면제를 먹는다', FALSE, 1),
    (gen_random_uuid(), q_id, '잠자기 전 1시간은 스마트폰을 보지 않는다', TRUE, 2),
    (gen_random_uuid(), q_id, '스마트폰을 버린다', FALSE, 3),
    (gen_random_uuid(), q_id, '병원에 간다', FALSE, 4);
END $$;

-- N4 Q21: 내용이해 (교통 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n東京から大阪まで新幹線で2時間半かかります。飛行機なら1時間ですが、空港までの移動時間を入れると、あまり変わりません。安く行きたいなら、夜行バスもあります。約8時間かかりますが、5000円ぐらいで行けます。\n\n質問：一番安い方法はどれですか？', '夜行バスが「5000円ぐらいで行けます」と書いてあります。야간 버스가 가장 저렴합니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신칸센', FALSE, 1),
    (gen_random_uuid(), q_id, '비행기', FALSE, 2),
    (gen_random_uuid(), q_id, '야간 버스', TRUE, 3),
    (gen_random_uuid(), q_id, '택시', FALSE, 4);
END $$;

-- N4 Q22: 세부정보 (도서관 이용)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n図書館からのお知らせ\n本の貸し出し：1人5冊まで、2週間\nDVD：1人2枚まで、1週間\n返却が遅れた場合、1日につき10円の延滞料がかかります。\n\n質問：DVDは何枚まで借りられますか？', '「DVD：1人2枚まで」と書いてあります。DVD는 1인당 2장까지 빌릴 수 있습니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1장', FALSE, 1),
    (gen_random_uuid(), q_id, '2장', TRUE, 2),
    (gen_random_uuid(), q_id, '3장', FALSE, 3),
    (gen_random_uuid(), q_id, '5장', FALSE, 4);
END $$;

-- N4 Q23: 추론 (선물 고민)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n友達の誕生日プレゼントに迷っています。本が好きだから本をあげようと思いましたが、同じ本を持っているかもしれません。それで、本屋のギフトカードにしようと思います。そうすれば、好きな本を自分で選べますから。\n\n質問：この人は最終的に何をプレゼントしますか？', '「本屋のギフトカードにしようと思います」と言っています。서점 기프트카드를 선물합니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '책', FALSE, 1),
    (gen_random_uuid(), q_id, '서점 기프트카드', TRUE, 2),
    (gen_random_uuid(), q_id, '현금', FALSE, 3),
    (gen_random_uuid(), q_id, '꽃', FALSE, 4);
END $$;

-- N4 Q24: 내용이해 (환경 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最近、マイバッグを持って買い物に行く人が増えています。2020年からレジ袋が有料になったからです。環境のためにプラスチックを減らすことが大切です。小さなことから始めましょう。\n\n質問：なぜマイバッグを持つ人が増えましたか？', '「レジ袋が有料になったからです」と書いてあります。비닐봉지가 유료가 되었기 때문입니다。', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '마이백이 유행이니까', FALSE, 1),
    (gen_random_uuid(), q_id, '비닐봉지가 유료가 되었으니까', TRUE, 2),
    (gen_random_uuid(), q_id, '마이백이 무료로 배포되니까', FALSE, 3),
    (gen_random_uuid(), q_id, '비닐봉지가 부족하니까', FALSE, 4);
END $$;

-- N4 Q25: 문맥어휘 (직장 이메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nお疲れ様です。明日の会議の資料を添付します。ご確認の上、修正点があればお知らせください。なお、会議の時間が14時から15時に変更になりましたのでご注意ください。\n\n質問：「添付」の意味は何ですか？', '「添付」はメールにファイルを付けることです。첨부하다의 의미입니다。', 1, 25, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인쇄하다', FALSE, 1),
    (gen_random_uuid(), q_id, '첨부하다', TRUE, 2),
    (gen_random_uuid(), q_id, '삭제하다', FALSE, 3),
    (gen_random_uuid(), q_id, '복사하다', FALSE, 4);
END $$;

-- N4 Q26: 세부정보 (아파트 규칙)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nマンションの規則\n・夜10時以降は大きな音を出さないでください。\n・ペットは小型犬と猫のみ飼えます。\n・ベランダでのバーベキューは禁止です。\n・ゴミは指定の場所に出してください。\n\n質問：このマンションで飼えない動物はどれですか？', '「小型犬と猫のみ飼えます」なので、大型犬は飼えません。소형견과 고양이만 가능하므로 대형견은 불가합니다。', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소형견', FALSE, 1),
    (gen_random_uuid(), q_id, '고양이', FALSE, 2),
    (gen_random_uuid(), q_id, '대형견', TRUE, 3),
    (gen_random_uuid(), q_id, '소형견과 고양이 모두', FALSE, 4);
END $$;

-- N4 Q27: 추론 (학생 작문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本に来て一番驚いたことは、電車の正確さです。韓国でも電車は大体時間通りに来ますが、日本は1分も遅れないことが多いです。遅れた時はアナウンスで謝ります。日本人の時間に対する考え方がよくわかります。\n\n質問：この人が一番驚いたことは何ですか？', '「一番驚いたことは、電車の正確さです」と書いてあります。전철의 정확성에 가장 놀랐습니다。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전철이 깨끗한 것', FALSE, 1),
    (gen_random_uuid(), q_id, '전철의 정확성', TRUE, 2),
    (gen_random_uuid(), q_id, '전철 요금이 비싼 것', FALSE, 3),
    (gen_random_uuid(), q_id, '전철이 혼잡한 것', FALSE, 4);
END $$;

-- N4 Q28: 내용이해 (일본 문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本では食事の前に「いただきます」と言い、食事の後に「ごちそうさまでした」と言います。これは食べ物への感謝の気持ちを表す言葉です。料理を作ってくれた人にも感謝しています。\n\n質問：「いただきます」は何を表していますか？', '「食べ物への感謝の気持ちを表す言葉です」と書いてあります。음식에 대한 감사의 마음을 나타냅니다。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배가 고프다는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '음식에 대한 감사', TRUE, 2),
    (gen_random_uuid(), q_id, '식사 시작 시간', FALSE, 3),
    (gen_random_uuid(), q_id, '요리 주문', FALSE, 4);
END $$;

-- N4 Q29: 세부정보 (수업 변경)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n学生の皆さんへ\n来週の水曜日、鈴木先生がお休みのため、3時間目の数学の授業は中止です。そのかわり、4時間目に田中先生の英語の授業があります。教科書を忘れないでください。\n\n質問：来週の水曜日の3時間目はどうなりますか？', '「3時間目の数学の授業は中止です」と書いてあります。3교시 수학 수업은 중지됩니다。', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영어 수업으로 변경', FALSE, 1),
    (gen_random_uuid(), q_id, '다른 선생님이 수학 수업', FALSE, 2),
    (gen_random_uuid(), q_id, '수업 중지', TRUE, 3),
    (gen_random_uuid(), q_id, '자습', FALSE, 4);
END $$;

-- N4 Q30: 추론 (미래 꿈)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n私の夢はITエンジニアとして日本で働くことです。そのために、毎日プログラミングの勉強をしています。日本語も上手になりたいので、日本のドラマを見たり、日本人の友達と話したりしています。大変ですが、とても楽しいです。\n\n質問：この人が日本語の勉強のためにしていることは何ですか？', '「日本のドラマを見たり、日本人の友達と話したり」と言っています。일본 드라마를 보거나 일본인 친구와 이야기합니다。', 1, 30, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '교과서만 공부한다', FALSE, 1),
    (gen_random_uuid(), q_id, '일본 드라마를 보거나 일본인 친구와 이야기한다', TRUE, 2),
    (gen_random_uuid(), q_id, '일본어 학원에 다닌다', FALSE, 3),
    (gen_random_uuid(), q_id, '매일 일기를 쓴다', FALSE, 4);
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
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nリモートワークを導入する企業が増えている。通勤時間がなくなるため、自由に使える時間が増えるというメリットがある。一方で、同僚とのコミュニケーションが減り、孤独を感じる人もいるという課題もある。\n\n質問：リモートワークの課題として挙げられているのは何ですか？', '「同僚とのコミュニケーションが減り、孤独を感じる人もいる」と書いてあります。동료와의 소통 감소와 고독감이 과제입니다。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '통근 시간이 길어진다', FALSE, 1),
    (gen_random_uuid(), q_id, '동료와의 소통 감소와 고독감', TRUE, 2),
    (gen_random_uuid(), q_id, '급여가 줄어든다', FALSE, 3),
    (gen_random_uuid(), q_id, '인터넷 비용이 든다', FALSE, 4);
END $$;

-- N3 Q12: 세부정보 (영양 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n朝ごはんを食べないと、脳にエネルギーが行かず、集中力が下がります。特に学生は朝ごはんをしっかり食べることが大切です。理想的な朝ごはんは、ごはんやパンなどの炭水化物と、卵や牛乳などのたんぱく質を組み合わせたものです。\n\n質問：朝ごはんを食べないとどうなりますか？', '「脳にエネルギーが行かず、集中力が下がります」と書いてあります。집중력이 떨어집니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '체중이 줄어든다', FALSE, 1),
    (gen_random_uuid(), q_id, '집중력이 떨어진다', TRUE, 2),
    (gen_random_uuid(), q_id, '운동 능력이 향상된다', FALSE, 3),
    (gen_random_uuid(), q_id, '수면의 질이 좋아진다', FALSE, 4);
END $$;

-- N3 Q13: 문맥어휘 (비즈니스 메일)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nお世話になっております。先日お送りしたお見積もりについて、ご検討いただけましたでしょうか。ご不明な点がございましたら、お気軽にお問い合わせください。何卒よろしくお願いいたします。\n\n質問：「お見積もり」の意味は何ですか？', '「お見積もり」は商品やサービスの料金を事前に計算した書類です。견적서의 의미입니다。', 1, 13, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영수증', FALSE, 1),
    (gen_random_uuid(), q_id, '견적서', TRUE, 2),
    (gen_random_uuid(), q_id, '계약서', FALSE, 3),
    (gen_random_uuid(), q_id, '청구서', FALSE, 4);
END $$;

-- N3 Q14: 추론 (에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「失敗は成功のもと」ということわざがある。失敗すると落ち込んでしまうが、なぜ失敗したかを考え、次に活かすことが大切だ。何度失敗しても、あきらめずに挑戦し続ける人こそ、最後に成功する。\n\n質問：筆者が最も伝えたいことは何ですか？', '筆者は失敗から学んで挑戦し続けることの大切さを伝えています。실패에서 배우고 계속 도전하는 것이 중요합니다。', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '실패하지 않는 것이 중요하다', FALSE, 1),
    (gen_random_uuid(), q_id, '실패에서 배우고 계속 도전하는 것이 중요하다', TRUE, 2),
    (gen_random_uuid(), q_id, '실패하면 빨리 포기해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '성공한 사람은 실패한 적이 없다', FALSE, 4);
END $$;

-- N3 Q15: 내용이해 (환경 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n食品ロスが世界的な問題になっている。日本では年間約600万トンの食品が捨てられている。これを減らすために、「賞味期限」と「消費期限」の違いを正しく理解し、まだ食べられるものを無駄にしないことが重要だ。\n\n質問：日本で年間どのくらいの食品が捨てられていますか？', '「年間約600万トンの食品が捨てられている」と書いてあります。연간 약 600만 톤입니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약 100만 톤', FALSE, 1),
    (gen_random_uuid(), q_id, '약 600만 톤', TRUE, 2),
    (gen_random_uuid(), q_id, '약 1000만 톤', FALSE, 3),
    (gen_random_uuid(), q_id, '약 60만 톤', FALSE, 4);
END $$;

-- N3 Q16: 세부정보 (IT 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nパスワードの安全性を高めるためのポイントを紹介します。まず、8文字以上にすること。次に、大文字・小文字・数字・記号を組み合わせること。そして、同じパスワードを複数のサイトで使い回さないことです。定期的に変更することも推奨されます。\n\n質問：パスワードは最低何文字以上にすべきですか？', '「8文字以上にすること」と書いてあります。최소 8자 이상으로 해야 합니다。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4자', FALSE, 1),
    (gen_random_uuid(), q_id, '6자', FALSE, 2),
    (gen_random_uuid(), q_id, '8자', TRUE, 3),
    (gen_random_uuid(), q_id, '10자', FALSE, 4);
END $$;

-- N3 Q17: 문맥어휘 (사회 문제)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の少子高齢化は深刻な問題だ。若い世代の人口が減り、高齢者の割合が増えている。その結果、労働力の不足や社会保障費の増加といった課題に直面している。外国人労働者の受け入れ拡大も一つの対策として議論されている。\n\n質問：「少子高齢化」の意味は何ですか？', '「少子高齢化」は若い世代が減り高齢者が増えることです。저출산·고령화의 의미입니다。', 1, 17, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인구가 급증하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '출생률이 낮고 고령자 비율이 높아지는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '젊은 사람이 해외로 이주하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '도시 인구만 증가하는 것', FALSE, 4);
END $$;

-- N3 Q18: 추론 (IT 직장 문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本のIT企業では、「報連相（ほうれんそう）」が重視されている。報告・連絡・相談の頭文字を取ったものだ。問題が起きた時にすぐに上司に報告し、関係者に連絡し、困った時は一人で悩まず相談することが求められる。\n\n質問：「報連相」で最も重要視されていることは何ですか？', '報連相は問題の早期共有と円滑なコミュニケーションを重視しています。문제의 조기 공유와 원활한 소통이 중요합니다。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '혼자서 문제를 해결하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '정보를 적극적으로 공유하고 소통하는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '상사의 지시만 따르는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '보고서를 많이 쓰는 것', FALSE, 4);
END $$;

-- N3 Q19: 내용이해 (취미 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n最近、DIYが流行っている。自分で家具を作ったり、部屋をリフォームしたりする人が増えている。完成した時の達成感がやみつきになるらしい。ただし、工具の使い方を間違えると危険なので、初心者は簡単なものから始めるのがいいだろう。\n\n質問：筆者が初心者にアドバイスしていることは何ですか？', '「初心者は簡単なものから始めるのがいい」と言っています。초보자는 간단한 것부터 시작하는 게 좋다고 합니다。', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전문가에게 맡겨야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '간단한 것부터 시작해야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '비싼 도구를 사야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'DIY를 하면 안 된다', FALSE, 4);
END $$;

-- N3 Q20: 세부정보 (구인 광고)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n【求人】Webエンジニア募集\n勤務地：東京都渋谷区\n給与：月25万〜40万円（経験による）\n勤務時間：フレックスタイム制（コアタイム11:00〜15:00）\n必須スキル：HTML/CSS/JavaScript\n歓迎スキル：React、TypeScript\n\n質問：必ず出社しなければならない時間は？', '「コアタイム11:00〜15:00」が必ず出社する時間です。코어 타임은 11시~15시입니다。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '9시~17시', FALSE, 1),
    (gen_random_uuid(), q_id, '10시~16시', FALSE, 2),
    (gen_random_uuid(), q_id, '11시~15시', TRUE, 3),
    (gen_random_uuid(), q_id, '자유', FALSE, 4);
END $$;

-- N3 Q21: 내용이해 (문화 비교)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本では名刺交換がビジネスマナーの基本だ。名刺は両手で渡し、受け取る時も両手で受ける。もらった名刺はすぐにしまわず、テーブルの上に置いておくのが礼儀である。名刺を折ったり、メモを書いたりするのは失礼にあたる。\n\n質問：名刺をもらった後、すべきことは何ですか？', '「テーブルの上に置いておくのが礼儀」と書いてあります。테이블 위에 놓아두는 것이 예의입니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '바로 주머니에 넣는다', FALSE, 1),
    (gen_random_uuid(), q_id, '테이블 위에 놓아둔다', TRUE, 2),
    (gen_random_uuid(), q_id, '메모를 적는다', FALSE, 3),
    (gen_random_uuid(), q_id, '반으로 접는다', FALSE, 4);
END $$;

-- N3 Q22: 문맥어휘 (경제 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n円安が進んでいる。円安とは、外国の通貨に対して円の価値が下がることだ。輸出企業にとってはメリットがあるが、輸入品の価格が上がるため、消費者の生活には影響が出る。特にエネルギーや食料品の価格上昇が懸念されている。\n\n質問：「円安」の影響として正しいものはどれですか？', '円安では輸入品の価格が上がります。수입품 가격이 오릅니다。', 1, 22, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수입품 가격이 내려간다', FALSE, 1),
    (gen_random_uuid(), q_id, '수입품 가격이 올라간다', TRUE, 2),
    (gen_random_uuid(), q_id, '수출이 줄어든다', FALSE, 3),
    (gen_random_uuid(), q_id, '관광객이 줄어든다', FALSE, 4);
END $$;

-- N3 Q23: 추론 (자기 관리)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nスマートフォンの使いすぎが問題になっている。長時間画面を見ることで、目が疲れたり、肩がこったりする。また、寝る前にスマホを見ると、ブルーライトの影響で睡眠の質が低下する。使用時間を意識的にコントロールすることが必要だ。\n\n質問：筆者が提案していることは何ですか？', '「使用時間を意識的にコントロールすることが必要」と言っています。사용 시간을 의식적으로 조절해야 합니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스마트폰을 사용하지 않는다', FALSE, 1),
    (gen_random_uuid(), q_id, '사용 시간을 의식적으로 조절한다', TRUE, 2),
    (gen_random_uuid(), q_id, '블루라이트 차단 안경을 산다', FALSE, 3),
    (gen_random_uuid(), q_id, '스마트폰 대신 컴퓨터를 사용한다', FALSE, 4);
END $$;

-- N3 Q24: 내용이해 (일본어 학습)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本語の敬語は「尊敬語」「謙譲語」「丁寧語」の三種類がある。尊敬語は相手の動作を高める表現で、謙譲語は自分の動作を低める表現だ。丁寧語は「です」「ます」をつけて丁寧に話す表現である。ビジネスでは正しく使い分けることが求められる。\n\n質問：「謙譲語」はどのような表現ですか？', '「謙譲語は自分の動作を低める表現」と書いてあります。겸양어는 자신의 동작을 낮추는 표현입니다。', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상대의 동작을 높이는 표현', FALSE, 1),
    (gen_random_uuid(), q_id, '자신의 동작을 낮추는 표현', TRUE, 2),
    (gen_random_uuid(), q_id, '정중하게 말하는 표현', FALSE, 3),
    (gen_random_uuid(), q_id, '친한 사이에 쓰는 표현', FALSE, 4);
END $$;

-- N3 Q25: 세부정보 (건강 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n睡眠の質を上げるために、いくつかのポイントがある。寝る2時間前にお風呂に入ること、カフェインは午後3時以降は控えること、そして寝室の温度を18〜22度に保つことだ。特に寝る直前のスマホ使用は避けたほうがいい。\n\n質問：カフェインはいつまでに控えるべきですか？', '「カフェインは午後3時以降は控えること」と書いてあります。오후 3시 이후에는 카페인을 자제해야 합니다。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정오 이후', FALSE, 1),
    (gen_random_uuid(), q_id, '오후 3시 이후', TRUE, 2),
    (gen_random_uuid(), q_id, '저녁 6시 이후', FALSE, 3),
    (gen_random_uuid(), q_id, '밤 9시 이후', FALSE, 4);
END $$;

-- N3 Q26: 추론 (교육 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nプログラミング教育が小学校で必修化された。目的はプログラマーを育てることではなく、論理的思考力を身につけることだ。問題を小さく分けて、順番に解決していく力は、プログラミング以外の場面でも役立つ。\n\n質問：小学校のプログラミング教育の主な目的は何ですか？', '「論理的思考力を身につけること」が目的です。논리적 사고력을 기르는 것이 목적입니다。', 1, 26, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로그래머를 육성한다', FALSE, 1),
    (gen_random_uuid(), q_id, '논리적 사고력을 기른다', TRUE, 2),
    (gen_random_uuid(), q_id, '컴퓨터 조작법을 익힌다', FALSE, 3),
    (gen_random_uuid(), q_id, 'IT 기업에 취직시킨다', FALSE, 4);
END $$;

-- N3 Q27: 내용이해 (일본 생활)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本のコンビニは24時間営業で、食べ物や飲み物だけでなく、公共料金の支払いや荷物の受け取りもできる。最近はコピー機でチケットを印刷したり、ATMでお金を下ろしたりすることもできるようになった。まさに生活のインフラと言える。\n\n質問：日本のコンビニで最近できるようになったことは何ですか？', '「コピー機でチケットを印刷したり、ATMでお金を下ろしたり」が最近の機能です。복사기로 티켓 인쇄, ATM으로 현금 인출 등입니다。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '음식 배달', FALSE, 1),
    (gen_random_uuid(), q_id, '티켓 인쇄와 현금 인출', TRUE, 2),
    (gen_random_uuid(), q_id, '의료 서비스', FALSE, 3),
    (gen_random_uuid(), q_id, '세탁 서비스', FALSE, 4);
END $$;

-- N3 Q28: 문맥어휘 (기술 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nAIの発展により、多くの仕事が自動化されると言われている。しかし、AIにはできないこともある。創造性が必要な仕事や、人の感情を理解する仕事は、まだ人間にしかできない。AIと人間がそれぞれの強みを活かして協力することが大切だ。\n\n質問：「自動化」の意味は何ですか？', '「自動化」は人の代わりに機械やシステムが作業を行うことです。자동화의 의미입니다。', 1, 28, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사람이 직접 하는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '기계나 시스템이 대신 작업하는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '속도를 높이는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '비용을 줄이는 것', FALSE, 4);
END $$;

-- N3 Q29: 세부정보 (사내 공지)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n社員各位\n来月から新しい勤怠管理システムを導入します。出退勤はスマートフォンのアプリで打刻してください。従来のタイムカードは廃止します。アプリの使い方は来週の説明会でご案内します。\n\n質問：来月からどのように出退勤を記録しますか？', '「スマートフォンのアプリで打刻してください」と書いてあります。스마트폰 앱으로 출퇴근을 기록합니다。', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '타임카드', FALSE, 1),
    (gen_random_uuid(), q_id, '스마트폰 앱', TRUE, 2),
    (gen_random_uuid(), q_id, '수기 기록', FALSE, 3),
    (gen_random_uuid(), q_id, 'PC 로그인', FALSE, 4);
END $$;

-- N3 Q30: 추론 (다문화 공존)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000003-0000-0000-0000-000000000003', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n外国人労働者が増える中、職場での異文化理解が重要になっている。言葉の壁だけでなく、仕事の進め方や時間に対する感覚の違いもある。お互いの文化を尊重し、オープンにコミュニケーションを取ることが、良い職場環境を作る鍵である。\n\n質問：筆者が良い職場環境のために必要だと考えていることは何ですか？', '「お互いの文化を尊重し、オープンにコミュニケーションを取ること」が鍵です。서로의 문화를 존중하고 열린 소통을 하는 것입니다。', 1, 30, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '외국인에게 일본 문화만 가르친다', FALSE, 1),
    (gen_random_uuid(), q_id, '서로의 문화를 존중하고 열린 소통을 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '같은 나라 사람끼리만 일한다', FALSE, 3),
    (gen_random_uuid(), q_id, '규칙을 더 엄격하게 한다', FALSE, 4);
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
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本の終身雇用制度は、高度経済成長期に定着した雇用慣行である。一つの企業に定年まで勤める代わりに、企業は社員の生活を保障するという暗黙の契約であった。しかし、グローバル化や経済環境の変化により、転職が一般的になりつつあり、この制度は徐々に崩れ始めている。\n\n質問：終身雇用制度が変化している理由は何ですか？', 'グローバル化や経済環境の変化が理由です。글로벌화와 경제 환경의 변화가 원인입니다。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사원들이 일을 싫어하게 되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '글로벌화와 경제 환경의 변화', TRUE, 2),
    (gen_random_uuid(), q_id, '정부가 법으로 금지했다', FALSE, 3),
    (gen_random_uuid(), q_id, '기업의 수가 줄었다', FALSE, 4);
END $$;

-- N2 Q12: 세부정보 (기술 블로그)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nアジャイル開発とは、短い開発サイクルを繰り返しながらソフトウェアを完成させていく手法である。従来のウォーターフォール型と異なり、要件の変更に柔軟に対応できる点が最大のメリットだ。ただし、全体の設計が曖昧なまま進むリスクもあるため、チーム内のコミュニケーションが不可欠である。\n\n質問：アジャイル開発の最大のメリットは何ですか？', '「要件の変更に柔軟に対応できる点」が最大のメリットです。요건 변경에 유연하게 대응할 수 있습니다。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개발 비용이 줄어든다', FALSE, 1),
    (gen_random_uuid(), q_id, '요건 변경에 유연하게 대응할 수 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '전체 설계가 완벽해진다', FALSE, 3),
    (gen_random_uuid(), q_id, '인원이 적어도 된다', FALSE, 4);
END $$;

-- N2 Q13: 문맥어휘 (사회 논설)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nSNSの普及により、情報の拡散が急速に進むようになった。しかし、その中には根拠のない情報、いわゆる「フェイクニュース」も含まれている。情報を鵜呑みにせず、出典を確認する「メディアリテラシー」が今後ますます重要になるだろう。\n\n質問：「鵜呑みにする」の意味は何ですか？', '「鵜呑みにする」は情報をそのまま信じることです。그대로 곧이곧대로 믿다의 의미입니다。', 1, 13, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '의심하다', FALSE, 1),
    (gen_random_uuid(), q_id, '그대로 곧이곧대로 믿다', TRUE, 2),
    (gen_random_uuid(), q_id, '무시하다', FALSE, 3),
    (gen_random_uuid(), q_id, '공유하다', FALSE, 4);
END $$;

-- N2 Q14: 추론 (직장 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本企業では「根回し」という習慣がある。会議の前に関係者に個別に相談し、合意を得ておくことだ。外国人からは非効率に見えるかもしれないが、実際の会議がスムーズに進むという利点がある。全員が事前に内容を理解しているため、会議での反対意見が少なくなる。\n\n質問：「根回し」の利点は何ですか？', '事前に合意を得ることで会議がスムーズに進みます。사전에 합의를 얻어 회의가 원활하게 진행됩니다。', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회의를 생략할 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '실제 회의가 원활하게 진행된다', TRUE, 2),
    (gen_random_uuid(), q_id, '비용을 절약할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '개인의 의견이 반영되지 않는다', FALSE, 4);
END $$;

-- N2 Q15: 내용이해 (환경 정책)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nカーボンニュートラルとは、温室効果ガスの排出量と吸収量を均衡させ、実質的にゼロにすることを指す。日本政府は2050年までにこの目標を達成すると宣言した。再生可能エネルギーの普及や電気自動車の推進など、あらゆる分野での取り組みが必要とされている。\n\n質問：日本のカーボンニュートラルの目標年はいつですか？', '「2050年まで」と明記されています。2050년까지가 목표입니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2030년', FALSE, 1),
    (gen_random_uuid(), q_id, '2040년', FALSE, 2),
    (gen_random_uuid(), q_id, '2050년', TRUE, 3),
    (gen_random_uuid(), q_id, '2060년', FALSE, 4);
END $$;

-- N2 Q16: 세부정보 (개발 프로세스)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nコードレビューとは、他の開発者が書いたコードを確認し、改善点を指摘するプロセスである。バグの早期発見だけでなく、チーム全体のコーディングスキル向上にもつながる。ただし、指摘する際は建設的なフィードバックを心がけ、人格攻撃にならないよう注意が必要だ。\n\n質問：コードレビューの効果として挙げられていないものはどれですか？', 'バグの早期発見とスキル向上は挙げられていますが、開発速度の向上は言及されていません。개발 속도 향상은 언급되지 않았습니다。', 1, 16, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버그의 조기 발견', FALSE, 1),
    (gen_random_uuid(), q_id, '팀 코딩 스킬 향상', FALSE, 2),
    (gen_random_uuid(), q_id, '개발 속도 향상', TRUE, 3),
    (gen_random_uuid(), q_id, '건설적인 피드백 문화 형성', FALSE, 4);
END $$;

-- N2 Q17: 문맥어휘 (비즈니스 일본어)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本のビジネスメールでは、冒頭に「お世話になっております」と書くのが一般的である。初めてメールを送る相手には「初めてご連絡いたします」と書く。また、依頼する際は「恐れ入りますが」や「お手数をおかけしますが」といったクッション言葉を使うことで、相手への配慮を示す。\n\n質問：「クッション言葉」の役割は何ですか？', 'クッション言葉は相手への配慮を示す表現です。상대에 대한 배려를 나타내는 완충 표현입니다。', 1, 17, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자기소개를 하기 위해', FALSE, 1),
    (gen_random_uuid(), q_id, '상대에 대한 배려를 나타내기 위해', TRUE, 2),
    (gen_random_uuid(), q_id, '메일을 길게 쓰기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '격식을 차리지 않기 위해', FALSE, 4);
END $$;

-- N2 Q18: 추론 (사회 변화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n働き方改革により、長時間労働の是正が進んでいる。しかし、残業時間の削減だけでは根本的な解決にはならない。業務プロセスの見直しやITツールの活用による生産性向上が不可欠である。限られた時間の中で最大の成果を出す働き方が求められている。\n\n質問：筆者が本当に必要だと考えていることは何ですか？', '残業削減だけでなく生産性向上が必要と言っています。잔업 삭감만이 아니라 생산성 향상이 필요합니다。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잔업 시간의 삭감만으로 충분하다', FALSE, 1),
    (gen_random_uuid(), q_id, '업무 프로세스 개선과 IT 활용으로 생산성 향상', TRUE, 2),
    (gen_random_uuid(), q_id, '직원 수를 늘린다', FALSE, 3),
    (gen_random_uuid(), q_id, '재택근무를 전면 도입한다', FALSE, 4);
END $$;

-- N2 Q19: 내용이해 (프로젝트 관리)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nプロジェクトマネジメントにおいて、「スコープクリープ」は最も警戒すべきリスクの一つだ。これは、プロジェクトの範囲が徐々に拡大し、当初の計画を超えてしまう現象を指す。明確な要件定義と変更管理プロセスを確立することで、このリスクを軽減できる。\n\n質問：「スコープクリープ」を防ぐために必要なことは何ですか？', '明確な要件定義と変更管理プロセスが必要です。명확한 요건 정의와 변경 관리 프로세스가 필요합니다。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인원을 늘린다', FALSE, 1),
    (gen_random_uuid(), q_id, '명확한 요건 정의와 변경 관리 프로세스', TRUE, 2),
    (gen_random_uuid(), q_id, '납기를 연장한다', FALSE, 3),
    (gen_random_uuid(), q_id, '모든 요청을 수용한다', FALSE, 4);
END $$;

-- N2 Q20: 세부정보 (법률 안내)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n個人情報保護法により、企業は顧客の個人情報を適切に管理する義務がある。個人情報とは、氏名、住所、電話番号、メールアドレスなど、特定の個人を識別できる情報を指す。データの漏洩が発生した場合、企業は速やかに本人に通知し、監督官庁に報告しなければならない。\n\n質問：データ漏洩時に企業がすべきことは何ですか？', '本人への通知と監督官庁への報告が必要です。본인에게 통지하고 감독관청에 보고해야 합니다。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사실을 숨긴다', FALSE, 1),
    (gen_random_uuid(), q_id, '본인에게 통지하고 감독관청에 보고한다', TRUE, 2),
    (gen_random_uuid(), q_id, '시스템을 정지시킨다', FALSE, 3),
    (gen_random_uuid(), q_id, '담당자를 해고한다', FALSE, 4);
END $$;

-- N2 Q21: 추론 (조직 문화)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n心理的安全性とは、チーム内で自分の意見を自由に言えると感じられる状態のことだ。Googleの研究では、高パフォーマンスのチームに共通する最大の要因がこの心理的安全性であった。失敗を責めず、建設的な議論ができる環境が、イノベーションを生む土壌となる。\n\n質問：高パフォーマンスチームに最も重要な要因は何ですか？', '心理的安全性が最大の要因です。심리적 안전성이 가장 중요한 요인입니다。', 1, 21, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '높은 급여', FALSE, 1),
    (gen_random_uuid(), q_id, '심리적 안전성', TRUE, 2),
    (gen_random_uuid(), q_id, '엄격한 규칙', FALSE, 3),
    (gen_random_uuid(), q_id, '우수한 리더', FALSE, 4);
END $$;

-- N2 Q22: 내용이해 (기술 트렌드)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nクラウドコンピューティングの普及により、企業のITインフラは大きく変わった。自社でサーバーを保有・管理する「オンプレミス」から、必要な分だけリソースを借りるクラウドへの移行が進んでいる。初期投資が抑えられ、拡張性に優れている点がクラウドの強みである。\n\n質問：クラウドの強みとして挙げられているのはどれですか？', '初期投資の抑制と拡張性が強みです。초기 투자 절감과 확장성이 장점입니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보안이 완벽하다', FALSE, 1),
    (gen_random_uuid(), q_id, '초기 투자 절감과 높은 확장성', TRUE, 2),
    (gen_random_uuid(), q_id, '인터넷 없이도 사용 가능', FALSE, 3),
    (gen_random_uuid(), q_id, '속도가 항상 빠르다', FALSE, 4);
END $$;

-- N2 Q23: 문맥어휘 (경영 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n企業の持続的成長のためには、短期的な利益の追求だけでなく、ESG（環境・社会・ガバナンス）への取り組みが不可欠になっている。投資家もESGの観点から企業を評価するようになり、社会的責任を果たさない企業は淘汰されるリスクがある。\n\n質問：「淘汰される」の意味は何ですか？', '「淘汰される」は競争に負けて排除されることです。도태되다 / 경쟁에서 밀려나다의 의미입니다。', 1, 23, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '성장하다', FALSE, 1),
    (gen_random_uuid(), q_id, '도태되다 / 경쟁에서 밀려나다', TRUE, 2),
    (gen_random_uuid(), q_id, '합병되다', FALSE, 3),
    (gen_random_uuid(), q_id, '상장되다', FALSE, 4);
END $$;

-- N2 Q24: 추론 (AI 논의)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n生成AIの登場により、クリエイティブ産業にも大きな変化が訪れている。AIが文章を書き、絵を描き、音楽を作る時代になった。これにより、クリエイターの仕事が奪われるという懸念がある一方で、AIをツールとして活用することで、制作の効率が飛躍的に向上するという見方もある。\n\n質問：筆者が提示している二つの見方はどれですか？', '仕事が奪われるという懸念とツールとして活用できるという見方の二つです。일자리를 빼앗긴다는 우려와 도구로 활용할 수 있다는 관점입니다。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AI가 완벽하다는 것과 불완전하다는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '일자리를 빼앗긴다는 우려와 도구로 활용할 수 있다는 관점', TRUE, 2),
    (gen_random_uuid(), q_id, 'AI가 비싸다는 것과 싸다는 것', FALSE, 3),
    (gen_random_uuid(), q_id, 'AI를 금지해야 한다는 것과 의무화해야 한다는 것', FALSE, 4);
END $$;

-- N2 Q25: 내용이해 (사내 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nメンター制度とは、経験豊富な先輩社員が新入社員に対して、業務指導やキャリア相談を行う仕組みである。定期的な面談を通じて、新入社員の不安を解消し、早期離職を防ぐ効果が期待できる。メンターにとっても、指導力やコミュニケーション能力の向上という成長機会になる。\n\n質問：メンター側にとってのメリットは何ですか？', 'メンターにとって指導力やコミュニケーション能力が向上します。지도력과 의사소통 능력이 향상됩니다。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '급여가 올라간다', FALSE, 1),
    (gen_random_uuid(), q_id, '지도력과 의사소통 능력 향상', TRUE, 2),
    (gen_random_uuid(), q_id, '업무량이 줄어든다', FALSE, 3),
    (gen_random_uuid(), q_id, '승진이 보장된다', FALSE, 4);
END $$;

-- N2 Q26: 세부정보 (데이터 보안)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nゼロトラストセキュリティとは、「何も信頼しない」という前提に基づくセキュリティモデルである。従来の境界型セキュリティでは、社内ネットワークを信頼し、外部からのアクセスのみを制限していた。しかし、リモートワークの普及やクラウド利用の拡大により、すべてのアクセスを検証する必要性が高まっている。\n\n質問：ゼロトラストセキュリティの基本的な考え方は何ですか？', '「何も信頼しない」という前提です。아무것도 신뢰하지 않는다는 전제입니다。', 1, 26, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사내 네트워크만 신뢰한다', FALSE, 1),
    (gen_random_uuid(), q_id, '아무것도 신뢰하지 않고 모든 접근을 검증한다', TRUE, 2),
    (gen_random_uuid(), q_id, '모든 것을 신뢰한다', FALSE, 3),
    (gen_random_uuid(), q_id, '외부 접근만 차단한다', FALSE, 4);
END $$;

-- N2 Q27: 문맥어휘 (인사 제도)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n日本企業の多くは年功序列型の賃金体系を採用してきたが、近年は成果主義への移行が進んでいる。年齢や勤続年数ではなく、実際の業績や能力に基づいて評価・報酬を決定する仕組みだ。若手社員のモチベーション向上が期待される反面、評価基準の客観性をいかに担保するかが課題となっている。\n\n質問：「年功序列」の意味は何ですか？', '年功序列は年齢や勤続年数に応じて地位・賃金が上がる制度です。연공서열의 의미입니다。', 1, 27, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '능력에 따라 급여가 결정되는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '연령이나 근속 연수에 따라 지위와 급여가 올라가는 것', TRUE, 2),
    (gen_random_uuid(), q_id, '성과에 따라 승진이 결정되는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '상사의 판단으로 급여가 결정되는 것', FALSE, 4);
END $$;

-- N2 Q28: 추론 (리더십)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nサーバントリーダーシップとは、リーダーが部下に奉仕するという考え方だ。命令するのではなく、部下の成長を支援し、働きやすい環境を整えることで、結果的にチームの成果が向上する。従来のトップダウン型とは対照的なアプローチであり、多様性を重視する現代の組織に適していると言われている。\n\n質問：サーバントリーダーシップの特徴はどれですか？', 'リーダーが部下に奉仕し成長を支援するアプローチです。리더가 부하에게 봉사하고 성장을 지원합니다。', 1, 28, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리더가 강하게 지시한다', FALSE, 1),
    (gen_random_uuid(), q_id, '리더가 부하의 성장을 지원하고 일하기 좋은 환경을 만든다', TRUE, 2),
    (gen_random_uuid(), q_id, '리더가 모든 것을 결정한다', FALSE, 3),
    (gen_random_uuid(), q_id, '리더가 필요 없다', FALSE, 4);
END $$;

-- N2 Q29: 내용이해 (기술 부채)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n技術的負債とは、短期的な開発スピードを優先した結果、コードの品質が低下し、将来的に修正コストが増大する現象を指す。納期に追われて応急処置的なコードを書くことは避けられない場合もあるが、放置すると保守性が著しく低下する。定期的なリファクタリングが技術的負債を管理する鍵となる。\n\n質問：技術的負債を管理するために必要なことは何ですか？', '「定期的なリファクタリング」が鍵です。정기적인 리팩토링이 핵심입니다。', 1, 29, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드를 처음부터 다시 작성한다', FALSE, 1),
    (gen_random_uuid(), q_id, '정기적인 리팩토링', TRUE, 2),
    (gen_random_uuid(), q_id, '테스트를 생략한다', FALSE, 3),
    (gen_random_uuid(), q_id, '외주에 맡긴다', FALSE, 4);
END $$;

-- N2 Q30: 추론 (다양성)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000004-0000-0000-0000-000000000004', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nダイバーシティ経営とは、多様な人材の能力を最大限に活かすことで、イノベーションを生み出し、企業価値を向上させる経営戦略である。性別、国籍、年齢、障がいの有無に関わらず、多様な視点があることで、市場の変化に柔軟に対応でき、新たなビジネスチャンスを捉えることができる。\n\n質問：ダイバーシティ経営の目的は何ですか？', '多様な人材を活かしてイノベーションを生むことです。다양한 인재를 활용하여 혁신을 창출하는 것입니다。', 1, 30, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인건비를 절감한다', FALSE, 1),
    (gen_random_uuid(), q_id, '다양한 인재를 활용하여 혁신과 기업 가치를 높인다', TRUE, 2),
    (gen_random_uuid(), q_id, '해외 진출만을 위한 것이다', FALSE, 3),
    (gen_random_uuid(), q_id, '법적 의무를 충족하기 위한 것이다', FALSE, 4);
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
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n言語は単なるコミュニケーションの道具ではなく、思考そのものを形作るものである。サピア＝ウォーフ仮説によれば、使用する言語が世界の認知の仕方に影響を与える。例えば、色の名前が豊富な言語を持つ民族は、色の識別能力が高いという研究結果がある。\n\n質問：サピア＝ウォーフ仮説の主張は何ですか？', '使用する言語が世界の認知の仕方に影響するという仮説です。사용하는 언어가 세계 인식 방식에 영향을 준다는 가설입니다。', 1, 11, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 언어는 동일한 구조를 가진다', FALSE, 1),
    (gen_random_uuid(), q_id, '사용하는 언어가 세계 인식 방식에 영향을 준다', TRUE, 2),
    (gen_random_uuid(), q_id, '언어는 의사소통 도구에 불과하다', FALSE, 3),
    (gen_random_uuid(), q_id, '사고는 언어와 무관하다', FALSE, 4);
END $$;

-- N1 Q12: 세부정보 (경영 전략)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nイノベーションのジレンマとは、成功している企業が既存の製品やサービスの改善に注力するあまり、破壊的技術の台頭に対応できなくなる現象を指す。既存顧客の声に応えることは重要だが、市場の根本的な変化を見落とすリスクがある。持続的イノベーションと破壊的イノベーションの両方に目を配る経営判断が求められる。\n\n質問：イノベーションのジレンマが起きる原因は何ですか？', '既存製品の改善に注力しすぎることが原因です。기존 제품 개선에 지나치게 집중하는 것이 원인입니다。', 1, 12, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '연구 개발비가 부족하다', FALSE, 1),
    (gen_random_uuid(), q_id, '기존 제품 개선에 지나치게 집중하여 파괴적 기술에 대응하지 못한다', TRUE, 2),
    (gen_random_uuid(), q_id, '경쟁사가 너무 많다', FALSE, 3),
    (gen_random_uuid(), q_id, '소비자의 취향이 바뀌지 않는다', FALSE, 4);
END $$;

-- N1 Q13: 문맥어휘 (법학 논문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n法の下の平等とは、全ての国民が法的に平等に扱われるべきという原則である。しかし、形式的平等だけでは不十分な場合がある。社会的弱者に対する積極的是正措置（アファーマティブ・アクション）は、実質的平等を実現するための手段として議論されている。\n\n質問：「積極的是正措置」の目的は何ですか？', '実質的平等を実現するための措置です。실질적 평등을 실현하기 위한 조치입니다。', 1, 13, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '형식적 평등을 유지하기 위해', FALSE, 1),
    (gen_random_uuid(), q_id, '실질적 평등을 실현하기 위해', TRUE, 2),
    (gen_random_uuid(), q_id, '특정 집단을 우대하기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '법률을 개정하기 위해', FALSE, 4);
END $$;

-- N1 Q14: 추론 (철학 에세이)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「知の呪い」とは、ある分野に精通した人が、その分野の知識がない人の立場を理解できなくなる現象を指す。専門家が初心者に説明する際、無意識に専門用語を使ったり、前提知識があることを当然と思ったりする。優れた教育者とは、この呪いから自らを解放し、学習者の視点に立てる者のことである。\n\n質問：筆者が考える「優れた教育者」の条件は何ですか？', '学習者の視点に立てることです。학습자의 관점에 설 수 있는 것이 조건입니다。', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전문 지식이 풍부한 사람', FALSE, 1),
    (gen_random_uuid(), q_id, '학습자의 관점에 설 수 있는 사람', TRUE, 2),
    (gen_random_uuid(), q_id, '엄격하게 가르치는 사람', FALSE, 3),
    (gen_random_uuid(), q_id, '많은 경험을 가진 사람', FALSE, 4);
END $$;

-- N1 Q15: 내용이해 (사회학 논문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n現代社会における「孤独」は、個人的な問題にとどまらず、社会的課題として認識されるようになった。英国では2018年に「孤独担当大臣」が設置され、日本でも2021年に同様のポストが新設された。孤独は精神的健康に悪影響を及ぼすだけでなく、心臓病や認知症のリスクを高めるという研究結果もある。\n\n質問：日本で孤独担当大臣が設置されたのはいつですか？', '「日本でも2021年に同様のポストが新設された」と書いてあります。2021년에 설치되었습니다。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2018년', FALSE, 1),
    (gen_random_uuid(), q_id, '2021년', TRUE, 2),
    (gen_random_uuid(), q_id, '2020년', FALSE, 3),
    (gen_random_uuid(), q_id, '2023년', FALSE, 4);
END $$;

-- N1 Q16: 세부정보 (과학 기사)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n量子コンピュータは、従来のコンピュータとは根本的に異なる計算原理に基づく。従来のビットが0か1の状態しか取れないのに対し、量子ビットは0と1の重ね合わせ状態を取ることができる。これにより、特定の問題に対して従来のコンピュータでは不可能なほどの高速計算が可能になる。ただし、実用化にはエラー率の低減や環境制御など、多くの技術的課題が残されている。\n\n質問：量子コンピュータの実用化に向けた課題はどれですか？', 'エラー率の低減や環境制御が課題です。오류율 저감과 환경 제어가 과제입니다。', 1, 16, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '계산 속도가 느리다', FALSE, 1),
    (gen_random_uuid(), q_id, '오류율 저감과 환경 제어', TRUE, 2),
    (gen_random_uuid(), q_id, '소프트웨어가 부족하다', FALSE, 3),
    (gen_random_uuid(), q_id, '비용이 저렴하다', FALSE, 4);
END $$;

-- N1 Q17: 문맥어휘 (문학 평론)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n文学作品における「メタファー」は、表面的な意味の背後に深い含意を持つ表現技法である。例えば、「人生は旅である」という表現は、人生の不確実性や発見の連続を暗示している。優れた作家は、メタファーを通じて読者の想像力を喚起し、言葉の限界を超えた意味の伝達を可能にする。\n\n質問：「喚起する」の意味は何ですか？', '「喚起する」は呼び起こす、引き出すという意味です。불러일으키다 / 환기시키다의 의미입니다。', 1, 17, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '억제하다', FALSE, 1),
    (gen_random_uuid(), q_id, '불러일으키다', TRUE, 2),
    (gen_random_uuid(), q_id, '무시하다', FALSE, 3),
    (gen_random_uuid(), q_id, '제한하다', FALSE, 4);
END $$;

-- N1 Q18: 추론 (윤리학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nAI倫理の議論において、「トロッコ問題」のような思考実験が再注目されている。自動運転車が避けられない事故に直面した時、乗客を守るべきか歩行者を守るべきかという判断を、AIにどうプログラムするかという問題だ。技術の進歩が倫理的判断の自動化を迫る中、社会全体での合意形成が急務となっている。\n\n質問：筆者が最も重要だと考えていることは何ですか？', '社会全体での合意形成が急務だと言っています。사회 전체의 합의 형성이 시급합니다。', 1, 18, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AI 기술의 발전을 멈추는 것', FALSE, 1),
    (gen_random_uuid(), q_id, '사회 전체의 합의 형성', TRUE, 2),
    (gen_random_uuid(), q_id, '자동운전을 금지하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '기술자에게 판단을 맡기는 것', FALSE, 4);
END $$;

-- N1 Q19: 내용이해 (경제학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n行動経済学は、人間が必ずしも合理的な判断を下すわけではないという前提に立つ学問だ。例えば、「損失回避バイアス」により、人は同額の利益を得る喜びよりも、同額を失う苦痛の方を大きく感じる。この知見は、マーケティングや公共政策の設計に広く応用されている。\n\n質問：「損失回避バイアス」とは何ですか？', '同額でも利益より損失の方を大きく感じる傾向です。같은 금액이라도 이익보다 손실을 더 크게 느끼는 경향입니다。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이익을 극대화하려는 경향', FALSE, 1),
    (gen_random_uuid(), q_id, '같은 금액이라도 이익보다 손실을 더 크게 느끼는 경향', TRUE, 2),
    (gen_random_uuid(), q_id, '위험을 좋아하는 경향', FALSE, 3),
    (gen_random_uuid(), q_id, '미래의 이익을 무시하는 경향', FALSE, 4);
END $$;

-- N1 Q20: 세부정보 (기업 가치)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nステークホルダー資本主義とは、企業が株主だけでなく、従業員、顧客、取引先、地域社会など、全てのステークホルダーの利益を考慮すべきだという考え方である。従来の株主至上主義では短期的な利益が重視されがちだったが、長期的な企業価値の向上には、多様なステークホルダーとの関係構築が不可欠だとする見解が主流になりつつある。\n\n質問：ステークホルダー資本主義が重視するのは何ですか？', '全てのステークホルダーの利益です。모든 이해관계자의 이익을 중시합니다。', 1, 20, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주주의 이익만', FALSE, 1),
    (gen_random_uuid(), q_id, '모든 이해관계자의 이익', TRUE, 2),
    (gen_random_uuid(), q_id, '경영자의 보수', FALSE, 3),
    (gen_random_uuid(), q_id, '단기적 수익', FALSE, 4);
END $$;

-- N1 Q21: 문맥어휘 (정치학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n民主主義の根幹を成すのは、国民の知る権利と報道の自由である。権力の監視機能を果たすジャーナリズムは「第四の権力」とも称される。しかし、メディアの商業化やSNSの台頭により、センセーショナリズムに偏った報道が増加し、ジャーナリズムの信頼性が揺らいでいるのも事実である。\n\n質問：「揺らいでいる」の意味は何ですか？', '「揺らいでいる」は不安定になっている、動揺しているという意味です。흔들리고 있다의 의미입니다。', 1, 21, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '강화되고 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '흔들리고 있다', TRUE, 2),
    (gen_random_uuid(), q_id, '확립되고 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '무시되고 있다', FALSE, 4);
END $$;

-- N1 Q22: 추론 (과학 철학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nカール・ポパーの反証可能性の概念は、科学と非科学を区別する基準として提唱された。科学的理論とは、原理的に反証可能な命題でなければならない。すなわち、どのような観察結果が得られればその理論が誤りだと判断できるかが明確でなければ、それは科学とは言えないのである。\n\n質問：ポパーが提唱した科学の条件は何ですか？', '反証可能性、つまり理論が原理的に反証可能であることです。이론이 원리적으로 반증 가능해야 합니다。', 1, 22, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '실험으로 증명할 수 있어야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '이론이 원리적으로 반증 가능해야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '다수의 과학자가 동의해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '수학적으로 증명 가능해야 한다', FALSE, 4);
END $$;

-- N1 Q23: 내용이해 (조직론)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「学習する組織」とは、ピーター・センゲが提唱した概念であり、組織のメンバーが継続的に学び、変化に適応する能力を持つ組織を指す。個人の学習だけでなく、チーム学習やシステム思考が重要視される。知識を個人に閉じ込めず、組織全体で共有・活用する文化が不可欠である。\n\n質問：「学習する組織」で重要視されていることは何ですか？', 'チーム学習やシステム思考が重要視されています。팀 학습과 시스템 사고가 중시됩니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개인의 경쟁', FALSE, 1),
    (gen_random_uuid(), q_id, '팀 학습과 시스템 사고', TRUE, 2),
    (gen_random_uuid(), q_id, '관리자의 지시', FALSE, 3),
    (gen_random_uuid(), q_id, '외부 컨설팅', FALSE, 4);
END $$;

-- N1 Q24: 세부정보 (국제 관계)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nソフトパワーとは、軍事力や経済制裁のようなハードパワーとは対照的に、文化、価値観、外交政策の魅力によって他国の行動に影響を与える能力を指す。日本のアニメ、食文化、おもてなしの精神は、国際社会における日本のソフトパワーの源泉として評価されている。\n\n質問：ソフトパワーに該当しないものはどれですか？', 'ソフトパワーは文化的魅力による影響力で、軍事力はハードパワーです。군사력은 소프트파워가 아닙니다。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '애니메이션 문화', FALSE, 1),
    (gen_random_uuid(), q_id, '음식 문화', FALSE, 2),
    (gen_random_uuid(), q_id, '군사적 위협', TRUE, 3),
    (gen_random_uuid(), q_id, '오모테나시 정신', FALSE, 4);
END $$;

-- N1 Q25: 추론 (기술 윤리)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nデジタルデバイドとは、情報技術を活用できる者とできない者の間に生じる格差を指す。高齢者や低所得層は、デジタル化の恩恵を受けにくい傾向がある。行政サービスのオンライン化が進む中、デジタルに不慣れな市民が取り残されないよう、対面窓口の維持やデジタルリテラシー教育の充実が不可欠である。\n\n質問：筆者が必要だと考えていることは何ですか？', '対面窓口の維持とデジタルリテラシー教育です。대면 창구 유지와 디지털 리터러시 교육입니다。', 1, 25, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 서비스를 온라인으로 전환한다', FALSE, 1),
    (gen_random_uuid(), q_id, '대면 창구 유지와 디지털 리터러시 교육 충실', TRUE, 2),
    (gen_random_uuid(), q_id, '고령자에게 스마트폰을 무료 배포한다', FALSE, 3),
    (gen_random_uuid(), q_id, '디지털화를 중지한다', FALSE, 4);
END $$;

-- N1 Q26: 내용이해 (심리학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nダニング＝クルーガー効果とは、能力の低い人ほど自分の能力を過大評価し、能力の高い人ほど自分の能力を過小評価する傾向を指す認知バイアスである。これは、能力が低い人は自分の無知を認識する能力すら欠如しているために起こる。逆に、専門家は自分にとって容易なことを他者にも容易だと錯覚しやすい。\n\n質問：能力の高い人に見られる傾向は何ですか？', '能力の高い人は自分を過小評価する傾向があります。능력이 높은 사람은 자신을 과소평가하는 경향이 있습니다。', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자신의 능력을 과대평가한다', FALSE, 1),
    (gen_random_uuid(), q_id, '자신의 능력을 과소평가한다', TRUE, 2),
    (gen_random_uuid(), q_id, '자신의 능력을 정확히 평가한다', FALSE, 3),
    (gen_random_uuid(), q_id, '다른 사람의 능력을 과소평가한다', FALSE, 4);
END $$;

-- N1 Q27: 문맥어휘 (환경 논문)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n生物多様性の喪失は、気候変動と並ぶ地球規模の危機である。一つの種の絶滅は、食物連鎖を通じて生態系全体に波及する。この「カスケード効果」により、一見無関係に見える種の減少が、農業や漁業などの人間活動にも甚大な影響を及ぼす可能性がある。\n\n質問：「甚大な」の意味は何ですか？', '「甚大な」は非常に大きい、深刻なという意味です。매우 큰 / 심대한의 의미입니다。', 1, 27, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사소한', FALSE, 1),
    (gen_random_uuid(), q_id, '매우 큰 / 심대한', TRUE, 2),
    (gen_random_uuid(), q_id, '일시적인', FALSE, 3),
    (gen_random_uuid(), q_id, '간접적인', FALSE, 4);
END $$;

-- N1 Q28: 추론 (미디어론)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nエコーチェンバー現象とは、SNS上で自分と同じ意見の情報ばかりに触れることで、特定の信念がますます強化される現象を指す。アルゴリズムがユーザーの好みに合った情報を優先的に表示するため、異なる視点に触れる機会が減少する。これにより、社会の分断が加速するリスクがある。\n\n質問：エコーチェンバー現象が社会にもたらすリスクは何ですか？', '社会の分断が加速するリスクがあります。사회의 분단이 가속화될 위험이 있습니다。', 1, 28, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정보의 질이 향상된다', FALSE, 1),
    (gen_random_uuid(), q_id, '사회의 분단이 가속화된다', TRUE, 2),
    (gen_random_uuid(), q_id, '다양한 의견이 확산된다', FALSE, 3),
    (gen_random_uuid(), q_id, 'SNS 이용자가 줄어든다', FALSE, 4);
END $$;

-- N1 Q29: 내용이해 (기술 경영)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\nDX（デジタルトランスフォーメーション）は、単なるIT化やデジタル化とは本質的に異なる概念である。既存の業務プロセスをデジタル化する「デジタイゼーション」を超え、デジタル技術を活用してビジネスモデルそのものを変革し、新たな価値を創造することがDXの本質である。組織文化の変革なくしてDXの成功はあり得ない。\n\n質問：DXの本質として筆者が最も強調していることは何ですか？', 'ビジネスモデルの変革と新たな価値の創造がDXの本質です。비즈니스 모델 변혁과 새로운 가치 창조가 핵심입니다。', 1, 29, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기존 업무의 IT화', FALSE, 1),
    (gen_random_uuid(), q_id, '비즈니스 모델 자체의 변혁과 새로운 가치 창조', TRUE, 2),
    (gen_random_uuid(), q_id, '종이 업무의 디지털화', FALSE, 3),
    (gen_random_uuid(), q_id, '최신 기술의 도입', FALSE, 4);
END $$;

-- N1 Q30: 추론 (사회 철학)
DO $$
DECLARE q_id UUID;
BEGIN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'c0000005-0000-0000-0000-000000000005', 'multiple_choice', E'次の文章を読んで、質問に答えてください。\n\n「正義」の概念は時代や文化によって異なる。ジョン・ロールズは「無知のヴェール」という思考実験を通じて、公正な社会制度を構想した。自分がどのような立場に生まれるかわからないという前提で制度を設計すれば、最も恵まれない人々の利益を最大化する制度が選ばれるはずだ、と主張した。\n\n質問：ロールズの「無知のヴェール」が導く結論は何ですか？', '最も恵まれない人々の利益を最大化する制度が選ばれるという結論です。가장 불우한 사람들의 이익을 최대화하는 제도가 선택됩니다。', 1, 30, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '다수결이 항상 정의이다', FALSE, 1),
    (gen_random_uuid(), q_id, '가장 불우한 사람들의 이익을 최대화하는 제도가 선택된다', TRUE, 2),
    (gen_random_uuid(), q_id, '개인의 자유가 절대적이다', FALSE, 3),
    (gen_random_uuid(), q_id, '모든 사람에게 같은 양을 분배한다', FALSE, 4);
END $$;

-- Update reading quiz time limits (+10 minutes each)
UPDATE quizzes SET time_limit_minutes = time_limit_minutes + 10 WHERE id IN (
  'c0000001-0000-0000-0000-000000000001',
  'c0000002-0000-0000-0000-000000000002',
  'c0000003-0000-0000-0000-000000000003',
  'c0000004-0000-0000-0000-000000000004',
  'c0000005-0000-0000-0000-000000000005'
);
