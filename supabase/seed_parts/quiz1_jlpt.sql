-- ============================================
-- Quiz 1: JLPT 日本語能力評価 (120 questions)
-- Categories: grammar(60), reading(30), listening(30)
-- Difficulty: N5~N1 (JLPT level mapped)
-- ALL options in Japanese. Real JLPT exam style.
-- ============================================

-- Cleanup existing data for this quiz
-- 1. comprehensive_exam_answers references quiz_question_options via selected_option_id
DELETE FROM comprehensive_exam_answers WHERE selected_option_id IN (
  SELECT id FROM quiz_question_options WHERE question_id IN (
    SELECT id FROM quiz_questions WHERE quiz_id = 'a0000001-0000-0000-0000-000000000001'
  )
);
-- 2. comprehensive_exam_answers also references quiz_questions via question_id
DELETE FROM comprehensive_exam_answers WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id = 'a0000001-0000-0000-0000-000000000001'
);
-- 3. quiz_answers → quiz_attempts → quiz
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id = 'a0000001-0000-0000-0000-000000000001'
);
DELETE FROM quiz_attempts WHERE quiz_id = 'a0000001-0000-0000-0000-000000000001';
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id = 'a0000001-0000-0000-0000-000000000001'
);
DELETE FROM quiz_questions WHERE quiz_id = 'a0000001-0000-0000-0000-000000000001';
DELETE FROM quizzes WHERE id = 'a0000001-0000-0000-0000-000000000001';

-- Insert the quiz
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment)
VALUES ('a0000001-0000-0000-0000-000000000001', 'JLPT 日本語能力評価', 'jlpt_grammar', 70, 70, TRUE);

-- ============================================
-- GRAMMAR: N5 (7) + N4 (5) = 12 questions, sort_order 1-12
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- G1: easy grammar - N5 particle
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「（　）」に入る正しい助詞はどれですか？\n私は毎朝コーヒー（　）飲みます。',
    '「を」は目的語を示す助詞です。「コーヒーを飲む」が正しい表現です。(커피를 마시다)', 1, 1, 'N5', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'が', FALSE, 1),
    (gen_random_uuid(), q_id, 'を', TRUE, 2),
    (gen_random_uuid(), q_id, 'に', FALSE, 3),
    (gen_random_uuid(), q_id, 'で', FALSE, 4);

  -- G2: easy grammar - N5 verb conjugation
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「食べる」の丁寧形（ます形）はどれですか？',
    '「食べる」は一段動詞で、「る」を取って「ます」をつけます。(먹다 → 먹습니다)', 1, 2, 'N5', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '食べます', TRUE, 1),
    (gen_random_uuid(), q_id, '食べるます', FALSE, 2),
    (gen_random_uuid(), q_id, '食びます', FALSE, 3),
    (gen_random_uuid(), q_id, '食べいます', FALSE, 4);

  -- G3: easy grammar - N5 adjective
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「この部屋は（　）です。」正しいものを選んでください。',
    '「静か」はナ形容詞で、「静かです」の形になります。(이 방은 조용합니다)', 1, 3, 'N5', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '静かい', FALSE, 1),
    (gen_random_uuid(), q_id, '静かな', FALSE, 2),
    (gen_random_uuid(), q_id, '静か', TRUE, 3),
    (gen_random_uuid(), q_id, '静かく', FALSE, 4);

  -- G4: easy grammar - N5 question word
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「（　）から来ましたか。」場所を聞く疑問詞はどれですか？',
    '「どこ」は場所を尋ねる疑問詞です。(어디에서 왔습니까?)', 1, 4, 'N5', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いつ', FALSE, 1),
    (gen_random_uuid(), q_id, 'だれ', FALSE, 2),
    (gen_random_uuid(), q_id, 'なに', FALSE, 3),
    (gen_random_uuid(), q_id, 'どこ', TRUE, 4);

  -- G5: easy grammar - N4 te-form
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「書く」のて形はどれですか？',
    '「書く」はカ行五段動詞で、て形は「書いて」になります。(쓰다의 て형)', 1, 5, 'N4', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '書きて', FALSE, 1),
    (gen_random_uuid(), q_id, '書いて', TRUE, 2),
    (gen_random_uuid(), q_id, '書って', FALSE, 3),
    (gen_random_uuid(), q_id, '書ちて', FALSE, 4);

  -- G6: easy grammar - N4 potential form
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「日本語が（　）。」可能の意味になる正しいものはどれですか？',
    '「話せます」は「話す」の可能形で、「日本語が話せる」は能力を表します。(일본어를 할 수 있습니다)', 1, 6, 'N4', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '話します', FALSE, 1),
    (gen_random_uuid(), q_id, '話されます', FALSE, 2),
    (gen_random_uuid(), q_id, '話せます', TRUE, 3),
    (gen_random_uuid(), q_id, '話させます', FALSE, 4);

  -- G7: easy grammar - N5 existence verb
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「机の上に本が（　）。」正しいものはどれですか？',
    '物の存在には「あります」を使います。人や動物には「います」を使います。(책상 위에 책이 있습니다)', 1, 7, 'N5', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'います', FALSE, 1),
    (gen_random_uuid(), q_id, 'あります', TRUE, 2),
    (gen_random_uuid(), q_id, 'なります', FALSE, 3),
    (gen_random_uuid(), q_id, 'します', FALSE, 4);

  -- G8: easy grammar - N4 volitional
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「一緒に昼ご飯を（　）。」誘いの表現として正しいものはどれですか？',
    '「食べましょう」は意志・勧誘を表す丁寧な表現です。(같이 점심을 먹읍시다)', 1, 8, 'N4', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '食べましょう', TRUE, 1),
    (gen_random_uuid(), q_id, '食べました', FALSE, 2),
    (gen_random_uuid(), q_id, '食べません', FALSE, 3),
    (gen_random_uuid(), q_id, '食べています', FALSE, 4);

  -- G9: easy grammar - N5 counter
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「りんごを（　）ください。」正しい数え方はどれですか？',
    '果物などの丸いものは「〜つ」で数えます。「三つ」が正解です。(사과를 세 개 주세요)', 1, 9, 'N5', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '三本', FALSE, 1),
    (gen_random_uuid(), q_id, '三枚', FALSE, 2),
    (gen_random_uuid(), q_id, '三つ', TRUE, 3),
    (gen_random_uuid(), q_id, '三台', FALSE, 4);

  -- G10: easy grammar - N4 conditional
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「雨が（　）、試合は中止です。」正しいものはどれですか？',
    '「降ったら」は条件を表すタラ形です。(비가 오면 시합은 중지입니다)', 1, 10, 'N4', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '降るなら', FALSE, 1),
    (gen_random_uuid(), q_id, '降ったら', TRUE, 2),
    (gen_random_uuid(), q_id, '降っても', FALSE, 3),
    (gen_random_uuid(), q_id, '降るのに', FALSE, 4);

  -- G11: easy grammar - N5 past tense
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「昨日、映画を（　）。」正しい過去形はどれですか？',
    '「見ました」は「見る」の丁寧な過去形です。(어제 영화를 봤습니다)', 1, 11, 'N5', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '見ます', FALSE, 1),
    (gen_random_uuid(), q_id, '見ません', FALSE, 2),
    (gen_random_uuid(), q_id, '見ました', TRUE, 3),
    (gen_random_uuid(), q_id, '見ています', FALSE, 4);

  -- G12: easy grammar - N4 giving/receiving
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「友達が私に本を（　）。」正しいものはどれですか？',
    '「くれました」は相手が自分に何かをしてくれる時に使います。(친구가 나에게 책을 줬습니다)', 1, 12, 'N4', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あげました', FALSE, 1),
    (gen_random_uuid(), q_id, 'もらいました', FALSE, 2),
    (gen_random_uuid(), q_id, 'やりました', FALSE, 3),
    (gen_random_uuid(), q_id, 'くれました', TRUE, 4);

END $$;

-- ============================================
-- GRAMMAR: N3 (12 questions) sort_order 13-24
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- G13: medium grammar - N3 passive
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「電車の中で足を（　）。」受身形として正しいものはどれですか？',
    '「踏まれた」は「踏む」の受身形です。迷惑の受身を表します。(전철 안에서 발을 밟혔다)', 1, 13, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '踏んだ', FALSE, 1),
    (gen_random_uuid(), q_id, '踏ませた', FALSE, 2),
    (gen_random_uuid(), q_id, '踏まれた', TRUE, 3),
    (gen_random_uuid(), q_id, '踏まされた', FALSE, 4);

  -- G14: medium grammar - N3 causative
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「先生は学生に作文を（　）。」使役形として正しいものはどれですか？',
    '「書かせた」は「書く」の使役形です。(선생님은 학생에게 작문을 쓰게 했다)', 1, 14, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '書かせた', TRUE, 1),
    (gen_random_uuid(), q_id, '書かれた', FALSE, 2),
    (gen_random_uuid(), q_id, '書けた', FALSE, 3),
    (gen_random_uuid(), q_id, '書いた', FALSE, 4);

  -- G15: medium grammar - N3 conjecture
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「空が暗いから、雨が降る（　）。」推量を表す正しいものはどれですか？',
    '「かもしれない」は不確実な推量を表します。(비가 올지도 모른다)', 1, 15, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'つもりだ', FALSE, 1),
    (gen_random_uuid(), q_id, 'はずだ', FALSE, 2),
    (gen_random_uuid(), q_id, 'かもしれない', TRUE, 3),
    (gen_random_uuid(), q_id, 'にちがいない', FALSE, 4);

  -- G16: medium grammar - N3 hearsay
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「天気予報によると、明日は晴れる（　）。」伝聞を表す正しいものはどれですか？',
    '「そうだ」（伝聞）は他から聞いた情報を伝える表現です。(일기예보에 따르면 내일은 맑다고 한다)', 1, 16, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ようだ', FALSE, 1),
    (gen_random_uuid(), q_id, 'らしい', FALSE, 2),
    (gen_random_uuid(), q_id, 'みたいだ', FALSE, 3),
    (gen_random_uuid(), q_id, 'そうだ', TRUE, 4);

  -- G17: medium grammar - N3 purpose
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「日本語を勉強する（　）、日本に来ました。」目的を表す正しいものはどれですか？',
    '「ために」は目的を表す表現です。意志動詞の辞書形に接続します。(일본어를 공부하기 위해 일본에 왔습니다)', 1, 17, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ために', TRUE, 1),
    (gen_random_uuid(), q_id, 'ように', FALSE, 2),
    (gen_random_uuid(), q_id, 'ことに', FALSE, 3),
    (gen_random_uuid(), q_id, 'までに', FALSE, 4);

  -- G18: medium grammar - N3 appearance
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「このケーキは（　）そうだ。」様態を表す正しいものはどれですか？',
    '「おいしそうだ」はイ形容詞の語幹＋そうだで、見た目からの判断を表します。(이 케이크는 맛있어 보인다)', 1, 18, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おいしい', FALSE, 1),
    (gen_random_uuid(), q_id, 'おいし', TRUE, 2),
    (gen_random_uuid(), q_id, 'おいしく', FALSE, 3),
    (gen_random_uuid(), q_id, 'おいしさ', FALSE, 4);

  -- G19: medium grammar - N3 obligation
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「明日までにレポートを出さ（　）。」義務を表す正しいものはどれですか？',
    '「なければならない」は義務・必要を表す文型です。(내일까지 리포트를 내야 한다)', 1, 19, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'なくてもいい', FALSE, 1),
    (gen_random_uuid(), q_id, 'ないでほしい', FALSE, 2),
    (gen_random_uuid(), q_id, 'なければならない', TRUE, 3),
    (gen_random_uuid(), q_id, 'ないようにする', FALSE, 4);

  -- G20: medium grammar - N3 experience
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「富士山に登った（　）がありますか。」経験を表す正しいものはどれですか？',
    '「ことがある」は過去の経験を表す文型です。(후지산에 올라간 적이 있습니까?)', 1, 20, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もの', FALSE, 1),
    (gen_random_uuid(), q_id, 'こと', TRUE, 2),
    (gen_random_uuid(), q_id, 'ところ', FALSE, 3),
    (gen_random_uuid(), q_id, 'わけ', FALSE, 4);

  -- G21: medium grammar - N3 simultaneous action
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「音楽を聞き（　）、勉強しています。」同時動作を表す正しいものはどれですか？',
    '「ながら」は二つの動作を同時に行うことを表します。(음악을 들으면서 공부하고 있습니다)', 1, 21, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'つつ', FALSE, 1),
    (gen_random_uuid(), q_id, 'ながら', TRUE, 2),
    (gen_random_uuid(), q_id, 'がてら', FALSE, 3),
    (gen_random_uuid(), q_id, 'つも', FALSE, 4);

  -- G22: medium grammar - N3 prohibition
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「ここで写真を撮っては（　）。」禁止を表す正しいものはどれですか？',
    '「いけません」は禁止を表す丁寧な表現です。(여기서 사진을 찍으면 안 됩니다)', 1, 22, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いけません', TRUE, 1),
    (gen_random_uuid(), q_id, 'いきません', FALSE, 2),
    (gen_random_uuid(), q_id, 'おきません', FALSE, 3),
    (gen_random_uuid(), q_id, 'できません', FALSE, 4);

  -- G23: medium grammar - N3 try doing
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「新しいレストランに行って（　）。」試みを表す正しいものはどれですか？',
    '「てみる」は試しに何かをすることを表します。(새 레스토랑에 가 보았다)', 1, 23, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しまった', FALSE, 1),
    (gen_random_uuid(), q_id, 'おいた', FALSE, 2),
    (gen_random_uuid(), q_id, 'みた', TRUE, 3),
    (gen_random_uuid(), q_id, 'あった', FALSE, 4);

  -- G24: medium grammar - N3 become
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「日本語が上手に（　）。」変化を表す正しいものはどれですか？',
    '「なりました」はナ形容詞＋になるで、状態の変化を表します。(일본어가 잘 하게 되었습니다)', 1, 24, 'N3', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しました', FALSE, 1),
    (gen_random_uuid(), q_id, 'できました', FALSE, 2),
    (gen_random_uuid(), q_id, 'ありました', FALSE, 3),
    (gen_random_uuid(), q_id, 'なりました', TRUE, 4);

END $$;

-- ============================================
-- GRAMMAR: N2 (11) + N1 (7) = 18 questions, sort_order 25-42
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- G25: hard grammar - N2 despite
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「何度説明した（　）、彼は理解しなかった。」逆接を表す正しいものはどれですか？',
    '「にもかかわらず」は強い逆接を表すN2文型です。(몇 번 설명했음에도 불구하고 그는 이해하지 못했다)', 1, 25, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にもかかわらず', TRUE, 1),
    (gen_random_uuid(), q_id, 'にしたがって', FALSE, 2),
    (gen_random_uuid(), q_id, 'につれて', FALSE, 3),
    (gen_random_uuid(), q_id, 'にともなって', FALSE, 4);

  -- G26: hard grammar - N2 tendency
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「最近、若者は本を読まない（　）がある。」傾向を表す正しいものはどれですか？',
    '「傾向がある」は「〜する傾向がある」の形で傾向を表します。(최근 젊은이들은 책을 읽지 않는 경향이 있다)', 1, 26, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おそれ', FALSE, 1),
    (gen_random_uuid(), q_id, '傾向', TRUE, 2),
    (gen_random_uuid(), q_id, '一方', FALSE, 3),
    (gen_random_uuid(), q_id, '反面', FALSE, 4);

  -- G27: hard grammar - N2 based on
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「調査結果（　）、新しい方針を決定した。」根拠を表す正しいものはどれですか？',
    '「に基づいて」は根拠・基準を表すN2文型です。(조사 결과에 기초하여 새로운 방침을 결정했다)', 1, 27, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'に関して', FALSE, 1),
    (gen_random_uuid(), q_id, 'に対して', FALSE, 2),
    (gen_random_uuid(), q_id, 'に基づいて', TRUE, 3),
    (gen_random_uuid(), q_id, 'について', FALSE, 4);

  -- G28: hard grammar - N2 only if
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「努力し（　）、成功はない。」条件を表す正しいものはどれですか？',
    '「ない限り」は「〜しない限り」で必要条件を表します。(노력하지 않는 한 성공은 없다)', 1, 28, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ないうちに', FALSE, 1),
    (gen_random_uuid(), q_id, 'ないばかりに', FALSE, 2),
    (gen_random_uuid(), q_id, 'ない限り', TRUE, 3),
    (gen_random_uuid(), q_id, 'ないわけに', FALSE, 4);

  -- G29: hard grammar - N2 as expected
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「予想（　）、プロジェクトは予定通りに完成した。」正しいものはどれですか？',
    '「通り」は「予想通り」で期待に沿った結果を表します。(예상대로 프로젝트는 예정대로 완성되었다)', 1, 29, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '通り', TRUE, 1),
    (gen_random_uuid(), q_id, '次第', FALSE, 2),
    (gen_random_uuid(), q_id, '以上', FALSE, 3),
    (gen_random_uuid(), q_id, '上で', FALSE, 4);

  -- G30: hard grammar - N2 in proportion
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「経験を積む（　）、仕事の効率が上がった。」比例変化を表す正しいものはどれですか？',
    '「につれて」は二つの事柄が比例して変化することを表します。(경험을 쌓을수록 업무 효율이 올랐다)', 1, 30, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にしても', FALSE, 1),
    (gen_random_uuid(), q_id, 'につれて', TRUE, 2),
    (gen_random_uuid(), q_id, 'にしては', FALSE, 3),
    (gen_random_uuid(), q_id, 'にかけて', FALSE, 4);

  -- G31: hard grammar - N1 not only
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「彼は英語（　）、フランス語も話せる。」追加を表す正しいものはどれですか？',
    '「のみならず」は「だけでなく」の硬い書き言葉です。N1文型。(그는 영어뿐만 아니라 프랑스어도 할 수 있다)', 1, 31, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ばかりか', FALSE, 1),
    (gen_random_uuid(), q_id, 'だけあって', FALSE, 2),
    (gen_random_uuid(), q_id, 'のみならず', TRUE, 3),
    (gen_random_uuid(), q_id, 'をはじめ', FALSE, 4);

  -- G32: hard grammar - N1 cannot help but
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「あの映画を見ると、感動せずには（　）。」正しいものはどれですか？',
    '「いられない」は「〜せずにはいられない」で我慢できないことを表すN1文型です。(그 영화를 보면 감동하지 않을 수 없다)', 1, 32, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すまない', FALSE, 1),
    (gen_random_uuid(), q_id, 'おかない', FALSE, 2),
    (gen_random_uuid(), q_id, 'いられない', TRUE, 3),
    (gen_random_uuid(), q_id, 'ならない', FALSE, 4);

  -- G33: hard grammar - N2 whether or not
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「参加する（　）、明日までに連絡してください。」正しいものはどれですか？',
    '「かどうか」は不確定なことについて確認する表現です。(참가할지 안 할지 내일까지 연락해 주세요)', 1, 33, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'かどうか', TRUE, 1),
    (gen_random_uuid(), q_id, 'かのように', FALSE, 2),
    (gen_random_uuid(), q_id, 'かといって', FALSE, 3),
    (gen_random_uuid(), q_id, 'かわりに', FALSE, 4);

  -- G34: hard grammar - N2 IT context
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「このバグは再現性が低い（　）、修正が難しい。」理由を表す正しいものはどれですか？',
    '「だけに」は原因・理由を強調する表現です。(이 버그는 재현성이 낮은 만큼 수정이 어렵다)', 1, 34, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ものの', FALSE, 1),
    (gen_random_uuid(), q_id, 'だけに', TRUE, 2),
    (gen_random_uuid(), q_id, 'ながらも', FALSE, 3),
    (gen_random_uuid(), q_id, 'わりに', FALSE, 4);

  -- G35: hard grammar - N1 as soon as
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「会議が終わる（　）、すぐに報告書を作成した。」直後を表す正しいものはどれですか？',
    '「や否や」は動作の直後を表すN1の硬い書き言葉です。(회의가 끝나자마자 바로 보고서를 작성했다)', 1, 35, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'とたんに', FALSE, 1),
    (gen_random_uuid(), q_id, 'か早いか', FALSE, 2),
    (gen_random_uuid(), q_id, 'なり', FALSE, 3),
    (gen_random_uuid(), q_id, 'や否や', TRUE, 4);

  -- G36: hard grammar - N2 regarding
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「セキュリティ対策（　）、全社員に通知した。」関連を表す正しいものはどれですか？',
    '「に関して」は「について」のフォーマルな表現です。(보안 대책에 관하여 전 사원에게 통지했다)', 1, 36, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'に関して', TRUE, 1),
    (gen_random_uuid(), q_id, 'にとって', FALSE, 2),
    (gen_random_uuid(), q_id, 'にかけて', FALSE, 3),
    (gen_random_uuid(), q_id, 'において', FALSE, 4);

  -- G37: hard grammar - N1 to the extent
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「彼の日本語力は、日本人と（　）ほどだ。」程度を表す正しいものはどれですか？',
    '「見間違える」＋ほどで、日本人と間違うほど上手だという意味です。(그의 일본어 실력은 일본인과 헷갈릴 정도다)', 1, 37, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '間違える', FALSE, 1),
    (gen_random_uuid(), q_id, '見間違える', TRUE, 2),
    (gen_random_uuid(), q_id, '見分ける', FALSE, 3),
    (gen_random_uuid(), q_id, '区別する', FALSE, 4);

  -- G38: hard grammar - N2 in the middle of
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「開発の（　）で問題が発生した。」過程を表す正しいものはどれですか？',
    '「途中」は進行中の過程を表す名詞です。(개발 도중에 문제가 발생했다)', 1, 38, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '結果', FALSE, 1),
    (gen_random_uuid(), q_id, '最中', FALSE, 2),
    (gen_random_uuid(), q_id, '途中', TRUE, 3),
    (gen_random_uuid(), q_id, '以前', FALSE, 4);

  -- G39: hard grammar - N1 needless to say
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「品質管理は（　）、納期の厳守も求められる。」正しいものはどれですか？',
    '「言うまでもなく」は「当然のこととして」の意味のN1表現です。(품질관리는 말할 것도 없고 납기 엄수도 요구된다)', 1, 39, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ともかく', FALSE, 1),
    (gen_random_uuid(), q_id, '言うまでもなく', TRUE, 2),
    (gen_random_uuid(), q_id, 'もとより', FALSE, 3),
    (gen_random_uuid(), q_id, 'さておき', FALSE, 4);

  -- G40: hard grammar - N2 even if
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「たとえ失敗（　）、挑戦することに意味がある。」譲歩を表す正しいものはどれですか？',
    '「したとしても」は仮定の譲歩を表す表現です。(설령 실패하더라도 도전하는 것에 의미가 있다)', 1, 40, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'したところで', FALSE, 1),
    (gen_random_uuid(), q_id, 'したとしても', TRUE, 2),
    (gen_random_uuid(), q_id, 'したばかりに', FALSE, 3),
    (gen_random_uuid(), q_id, 'したあげく', FALSE, 4);

  -- G41: hard grammar - N1 cannot
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「お客様のご要望（　）、対応いたしかねます。」不可能を表す正しいものはどれですか？',
    '「には」＋「いたしかねます」は丁寧な断り表現です。(고객님의 요망에는 대응하기 어렵습니다)', 1, 41, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'には', TRUE, 1),
    (gen_random_uuid(), q_id, 'では', FALSE, 2),
    (gen_random_uuid(), q_id, 'とは', FALSE, 3),
    (gen_random_uuid(), q_id, 'からは', FALSE, 4);

  -- G42: hard grammar - N2 depending on
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「結果（　）では、計画を変更する必要がある。」条件を表す正しいものはどれですか？',
    '「次第」は「結果次第」で条件・依存を表します。(결과에 따라서는 계획을 변경할 필요가 있다)', 1, 42, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次第', TRUE, 1),
    (gen_random_uuid(), q_id, '限り', FALSE, 2),
    (gen_random_uuid(), q_id, '以上', FALSE, 3),
    (gen_random_uuid(), q_id, 'だけ', FALSE, 4);

END $$;

-- ============================================
-- GRAMMAR: N2 (9) + N1 (9) = 18 questions, sort_order 43-60
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- G43: hard grammar - N1 formal expression
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「本件（　）、下記の通りご報告いたします。」ビジネス文書の表現として正しいものはどれですか？',
    '「につきまして」は「について」の敬語表現で、ビジネス文書でよく使われます。(본건에 대하여 아래와 같이 보고드립니다)', 1, 43, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'につきまして', TRUE, 1),
    (gen_random_uuid(), q_id, 'にあたりまして', FALSE, 2),
    (gen_random_uuid(), q_id, 'にかかわりまして', FALSE, 3),
    (gen_random_uuid(), q_id, 'にいたりまして', FALSE, 4);

  -- G44: hard grammar - N2 it seems that
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「彼の話（　）と、プロジェクトは順調らしい。」正しいものはどれですか？',
    '「によると」は情報源を示す表現です。(그의 이야기에 의하면 프로젝트는 순조로운 것 같다)', 1, 44, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にすると', FALSE, 1),
    (gen_random_uuid(), q_id, 'によると', TRUE, 2),
    (gen_random_uuid(), q_id, 'にしたら', FALSE, 3),
    (gen_random_uuid(), q_id, 'にかかると', FALSE, 4);

  -- G45: hard grammar - N1 no choice but
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「納期に間に合わせるためには、残業する（　）。」仕方ない気持ちを表す正しいものはどれですか？',
    '「よりほかない」は「他に方法がない」の意味のN1文型です。(납기에 맞추기 위해서는 야근할 수밖에 없다)', 1, 45, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'べきではない', FALSE, 1),
    (gen_random_uuid(), q_id, 'わけにはいかない', FALSE, 2),
    (gen_random_uuid(), q_id, 'よりほかない', TRUE, 3),
    (gen_random_uuid(), q_id, 'ことはない', FALSE, 4);

  -- G46: hard grammar - N2 in order to
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「データを保護する（　）、暗号化を実装した。」目的を表す正しいものはどれですか？',
    '「べく」は「〜するために」の書き言葉的表現です。(데이터를 보호하고자 암호화를 구현했다)', 1, 46, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'べく', TRUE, 1),
    (gen_random_uuid(), q_id, 'まで', FALSE, 2),
    (gen_random_uuid(), q_id, 'ほど', FALSE, 3),
    (gen_random_uuid(), q_id, 'だけ', FALSE, 4);

  -- G47: hard grammar - N1 upon doing
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「システムを導入する（　）、十分なテストが必要だ。」正しいものはどれですか？',
    '「にあたって」は重要な行動の前に使う表現です。(시스템을 도입함에 있어서 충분한 테스트가 필요하다)', 1, 47, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'において', FALSE, 1),
    (gen_random_uuid(), q_id, 'にあたって', TRUE, 2),
    (gen_random_uuid(), q_id, 'にかけて', FALSE, 3),
    (gen_random_uuid(), q_id, 'にわたって', FALSE, 4);

  -- G48: hard grammar - N2 as a result
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「長時間議論した（　）、最終的に合意に達した。」結果を表す正しいものはどれですか？',
    '「末（に）」は長い過程の結果を表すN2文型です。(오랜 시간 논의한 끝에 최종적으로 합의에 도달했다)', 1, 48, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あげく', FALSE, 1),
    (gen_random_uuid(), q_id, '結果', FALSE, 2),
    (gen_random_uuid(), q_id, '末', TRUE, 3),
    (gen_random_uuid(), q_id, 'ところ', FALSE, 4);

  -- G49: hard grammar - N1 it goes without saying
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「情報漏洩の危険性は（　）。」自明であることを表す正しいものはどれですか？',
    '「言うに及ばない」は「言う必要がないほど明らか」という意味のN1表現です。(정보 유출의 위험성은 말할 나위도 없다)', 1, 49, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '言いようがない', FALSE, 1),
    (gen_random_uuid(), q_id, '言うに及ばない', TRUE, 2),
    (gen_random_uuid(), q_id, '言わざるを得ない', FALSE, 3),
    (gen_random_uuid(), q_id, '言ってはならない', FALSE, 4);

  -- G50: hard grammar - N2 while/contrast
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「フロントエンドは改善された（　）、バックエンドには課題が残っている。」対比を表す正しいものはどれですか？',
    '「一方で」は二つの事柄を対比する表現です。(프론트엔드는 개선된 한편 백엔드에는 과제가 남아 있다)', 1, 50, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ところが', FALSE, 1),
    (gen_random_uuid(), q_id, 'それなのに', FALSE, 2),
    (gen_random_uuid(), q_id, '一方で', TRUE, 3),
    (gen_random_uuid(), q_id, 'それでも', FALSE, 4);

  -- G51: hard grammar - N1 to the point of
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「彼女は泣か（　）ばかりに感謝の言葉を述べた。」程度を表す正しいものはどれですか？',
    '「んばかりに」は「今にも〜しそうな様子で」の意味のN1文型です。(그녀는 울기라도 할 것처럼 감사의 말을 전했다)', 1, 51, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ん', TRUE, 1),
    (gen_random_uuid(), q_id, 'さ', FALSE, 2),
    (gen_random_uuid(), q_id, 'し', FALSE, 3),
    (gen_random_uuid(), q_id, 'り', FALSE, 4);

  -- G52: hard grammar - N2 regardless
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「経験の有無（　）、応募できます。」無関係を表す正しいものはどれですか？',
    '「を問わず」は条件に関係なくという意味です。(경험 유무에 관계없이 응모할 수 있습니다)', 1, 52, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'をめぐって', FALSE, 1),
    (gen_random_uuid(), q_id, 'をもとに', FALSE, 2),
    (gen_random_uuid(), q_id, 'を通じて', FALSE, 3),
    (gen_random_uuid(), q_id, 'を問わず', TRUE, 4);

  -- G53: hard grammar - N1 dare to
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「リスクを承知の上で、（　）新しい技術を採用した。」あえてする意味を表す正しいものはどれですか？',
    '「あえて」は困難やリスクを知りながらも意図的に行動することを表します。(리스크를 알면서도 일부러 새로운 기술을 채용했다)', 1, 53, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'せっかく', FALSE, 1),
    (gen_random_uuid(), q_id, 'あえて', TRUE, 2),
    (gen_random_uuid(), q_id, 'さすがに', FALSE, 3),
    (gen_random_uuid(), q_id, 'ようやく', FALSE, 4);

  -- G54: hard grammar - N2 considering
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「入社1年目（　）、彼のスキルは非常に高い。」評価の基準を表す正しいものはどれですか？',
    '「にしては」は基準と比べて意外だという評価を表します。(입사 1년차치고는 그의 스킬은 매우 높다)', 1, 54, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にしては', TRUE, 1),
    (gen_random_uuid(), q_id, 'としては', FALSE, 2),
    (gen_random_uuid(), q_id, 'にとっては', FALSE, 3),
    (gen_random_uuid(), q_id, 'に関しては', FALSE, 4);

  -- G55: hard grammar - N1 formal negation
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「この問題は簡単に解決でき（　）ものではない。」否定の強調として正しいものはどれですか？',
    '「得る」の否定形「得ない」は可能性の否定を表します。「できるものではない」の強調形です。(이 문제는 간단히 해결될 수 있는 것이 아니다)', 1, 55, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'かねる', FALSE, 1),
    (gen_random_uuid(), q_id, '得る', TRUE, 2),
    (gen_random_uuid(), q_id, 'がたい', FALSE, 3),
    (gen_random_uuid(), q_id, 'づらい', FALSE, 4);

  -- G56: hard grammar - N2 instead of
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「残業が多い（　）、給料は良い。」代償を表す正しいものはどれですか？',
    '「かわりに」はマイナス面とプラス面の代償関係を表します。(야근이 많은 대신 급료는 좋다)', 1, 56, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'うえに', FALSE, 1),
    (gen_random_uuid(), q_id, 'ばかりか', FALSE, 2),
    (gen_random_uuid(), q_id, 'かわりに', TRUE, 3),
    (gen_random_uuid(), q_id, 'どころか', FALSE, 4);

  -- G57: hard grammar - N1 honorific
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「部長が先にお帰りに（　）。」尊敬語として正しいものはどれですか？',
    '「なりました」は「お〜になる」の尊敬語パターンです。(부장님이 먼저 돌아가셨습니다)', 1, 57, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'されました', FALSE, 1),
    (gen_random_uuid(), q_id, 'いたしました', FALSE, 2),
    (gen_random_uuid(), q_id, 'なりました', TRUE, 3),
    (gen_random_uuid(), q_id, 'ございました', FALSE, 4);

  -- G58: hard grammar - N1 humble
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「資料は私が（　）。」謙譲語として正しいものはどれですか？',
    '「お持ちいたします」は「持つ」の謙譲語です。(자료는 제가 가져가겠습니다)', 1, 58, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お持ちになります', FALSE, 1),
    (gen_random_uuid(), q_id, 'お持ちいたします', TRUE, 2),
    (gen_random_uuid(), q_id, 'お持ちされます', FALSE, 3),
    (gen_random_uuid(), q_id, 'お持ちでございます', FALSE, 4);

  -- G59: hard grammar - N2 not necessarily
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「高いソフトウェアが（　）良いとは限らない。」部分否定を表す正しいものはどれですか？',
    '「必ずしも」は部分否定の副詞で、「〜とは限らない」と共に使われます。(비싼 소프트웨어가 반드시 좋다고는 할 수 없다)', 1, 59, 'N2', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '必ずしも', TRUE, 1),
    (gen_random_uuid(), q_id, '決して', FALSE, 2),
    (gen_random_uuid(), q_id, 'めったに', FALSE, 3),
    (gen_random_uuid(), q_id, 'まさか', FALSE, 4);

  -- G60: hard grammar - N1 as if
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    '「彼は何事もなかった（　）、平然としていた。」比喩を表す正しいものはどれですか？',
    '「かのように」は事実と異なる比喩を表すN1文型です。(그는 아무 일도 없었던 것처럼 태연하게 있었다)', 1, 60, 'N1', 'grammar');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ばかりに', FALSE, 1),
    (gen_random_uuid(), q_id, 'ものなら', FALSE, 2),
    (gen_random_uuid(), q_id, 'かのように', TRUE, 3),
    (gen_random_uuid(), q_id, 'とばかりに', FALSE, 4);

END $$;

-- ============================================
-- READING: N5 (3) + N4 (3) = 6 questions, sort_order 61-66
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- R1: easy reading - simple notice
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「お知らせ\n明日（5月10日）は社内清掃の日です。\n午前9時から11時まで、自分の机の周りをきれいにしてください。\nゴミ袋は受付でもらえます。」\n\nこのお知らせは何について書いていますか？',
    '簡単な社内お知らせの読解です。清掃の日程と準備物について書かれています。(사내 청소의 날에 관한 공지입니다)', 1, 61, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議の予定', FALSE, 1),
    (gen_random_uuid(), q_id, '社内清掃の案内', TRUE, 2),
    (gen_random_uuid(), q_id, '休みの連絡', FALSE, 3),
    (gen_random_uuid(), q_id, '受付の場所', FALSE, 4);

  -- R2: easy reading - simple email
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次のメールを読んで、質問に答えてください。\n\n「田中様\nお疲れ様です。山田です。\n明日の打ち合わせの時間を14時から15時に変更したいのですが、\nご都合はいかがでしょうか。\nお忙しいところ恐れ入りますが、ご確認をお願いいたします。」\n\n山田さんは何をお願いしていますか？',
    'ビジネスメールの読解です。打ち合わせの時間変更の確認をお願いしています。(회의 시간 변경 확인을 부탁하고 있습니다)', 1, 62, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議室の予約', FALSE, 1),
    (gen_random_uuid(), q_id, '資料の準備', FALSE, 2),
    (gen_random_uuid(), q_id, '打ち合わせ時間の変更確認', TRUE, 3),
    (gen_random_uuid(), q_id, '打ち合わせの中止', FALSE, 4);

  -- R3: easy reading - daily life
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「私は毎朝6時に起きます。朝ごはんを食べてから、7時に家を出ます。\n会社まで電車で30分かかります。会社は9時からですが、\nいつも8時半ごろに着きます。」\n\nこの人は何時ごろ会社に着きますか？',
    '日常生活の文章の読解です。「8時半ごろに着きます」が答えです。(이 사람은 8시 반쯤 회사에 도착합니다)', 1, 63, 'N5', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '7時', FALSE, 1),
    (gen_random_uuid(), q_id, '7時半', FALSE, 2),
    (gen_random_uuid(), q_id, '8時半', TRUE, 3),
    (gen_random_uuid(), q_id, '9時', FALSE, 4);

  -- R4: easy reading - store sign
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の案内を読んで、質問に答えてください。\n\n「営業時間\n月曜日〜金曜日：10:00〜20:00\n土曜日：10:00〜18:00\n日曜日・祝日：休み\n※年末年始（12/29〜1/3）は休業いたします。」\n\n土曜日は何時まで開いていますか？',
    '営業時間の案内の読解です。土曜日は18時までです。(토요일은 18시까지 영업합니다)', 1, 64, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '17時まで', FALSE, 1),
    (gen_random_uuid(), q_id, '18時まで', TRUE, 2),
    (gen_random_uuid(), q_id, '19時まで', FALSE, 3),
    (gen_random_uuid(), q_id, '20時まで', FALSE, 4);

  -- R5: easy reading - weather
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「今日の天気は朝から雨です。午後からは風も強くなるでしょう。\n明日は晴れますが、気温は今日より5度ほど下がります。\n出かけるときは暖かい服を着てください。」\n\n明日の天気はどうですか？',
    '天気予報の読解です。明日は晴れるが気温が下がります。(내일은 맑지만 기온이 내려갑니다)', 1, 65, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '雨で暖かい', FALSE, 1),
    (gen_random_uuid(), q_id, '雨で寒い', FALSE, 2),
    (gen_random_uuid(), q_id, '晴れで暖かい', FALSE, 3),
    (gen_random_uuid(), q_id, '晴れだが気温が下がる', TRUE, 4);

  -- R6: easy reading - cafeteria menu
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の案内を読んで、質問に答えてください。\n\n「社員食堂からのお知らせ\n来週月曜日からメニューが変わります。\nA定食（魚）：500円\nB定食（肉）：550円\nC定食（野菜）：450円\nアレルギーのある方は受付にお知らせください。」\n\n一番安い定食はどれですか？',
    '食堂メニューの読解です。C定食（野菜）が450円で最も安いです。(C정식(야채)이 450엔으로 가장 저렴합니다)', 1, 66, 'N4', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A定食', FALSE, 1),
    (gen_random_uuid(), q_id, 'B定食', FALSE, 2),
    (gen_random_uuid(), q_id, 'C定食', TRUE, 3),
    (gen_random_uuid(), q_id, 'どれも同じ値段', FALSE, 4);

END $$;

-- ============================================
-- READING: N3 (6 questions) sort_order 67-72
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- R7: medium reading - work procedure
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「当社では、有給休暇を取る場合、少なくとも3日前までに上司に申請書を\n提出しなければなりません。急な病気の場合は、当日の朝までに電話で\n連絡してください。メールだけの連絡は認められません。\nまた、連続して5日以上休む場合は、部長の承認も必要です。」\n\n急に病気になった場合、どうすればいいですか？',
    '有給休暇の手続きに関する文章です。急病の場合は当日朝までに電話連絡が必要です。(갑자기 아프면 당일 아침까지 전화로 연락해야 합니다)', 1, 67, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メールで連絡する', FALSE, 1),
    (gen_random_uuid(), q_id, '3日前に申請書を出す', FALSE, 2),
    (gen_random_uuid(), q_id, '当日の朝までに電話する', TRUE, 3),
    (gen_random_uuid(), q_id, '部長に直接報告する', FALSE, 4);

  -- R8: medium reading - product review
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「このノートパソコンは軽くて持ち運びに便利です。バッテリーも\n10時間以上持ちます。ただし、画面が少し小さいので、長時間の\n作業には向いていないかもしれません。価格は性能の割にはお手頃で、\n初めてパソコンを買う人にはおすすめです。」\n\nこのノートパソコンの欠点は何ですか？',
    'レビュー文の読解です。「画面が少し小さい」が欠点として述べられています。(화면이 조금 작다는 것이 단점입니다)', 1, 68, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '重くて持ち運びにくい', FALSE, 1),
    (gen_random_uuid(), q_id, 'バッテリーが短い', FALSE, 2),
    (gen_random_uuid(), q_id, '値段が高い', FALSE, 3),
    (gen_random_uuid(), q_id, '画面が少し小さい', TRUE, 4);

  -- R9: medium reading - company announcement
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「社員の皆様へ\n来月から社内のWi-Fiパスワードが変更されます。新しいパスワードは\n各部署のリーダーから配布されます。セキュリティ上の理由から、\nパスワードをメモに書いて机に貼ったり、社外の人に教えたりしないで\nください。不明な点があれば、IT部門にお問い合わせください。」\n\nパスワードについて、してはいけないことは何ですか？',
    '社内通知の読解です。パスワードをメモに書いて貼ったり、社外の人に教えたりしてはいけません。(비밀번호를 메모에 적어 붙이거나 외부인에게 알려주면 안 됩니다)', 1, 69, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IT部門に聞くこと', FALSE, 1),
    (gen_random_uuid(), q_id, 'リーダーからもらうこと', FALSE, 2),
    (gen_random_uuid(), q_id, 'メモに書いて机に貼ること', TRUE, 3),
    (gen_random_uuid(), q_id, '新しいパスワードを使うこと', FALSE, 4);

  -- R10: medium reading - instructions
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「新入社員研修について\n期間：4月1日〜4月14日（2週間）\n場所：本社3階 研修室A\n内容：第1週はビジネスマナーと社内システムの使い方を学びます。\n第2週は各部署での実習を行います。\n持ち物：筆記用具、社員証、ノートパソコン\n昼食は社員食堂を利用できます（無料）。」\n\n第2週は何をしますか？',
    '新入社員研修の案内の読解です。第2週は各部署での実習です。(2주차에는 각 부서에서 실습을 합니다)', 1, 70, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ビジネスマナーを学ぶ', FALSE, 1),
    (gen_random_uuid(), q_id, '社内システムを学ぶ', FALSE, 2),
    (gen_random_uuid(), q_id, '各部署で実習する', TRUE, 3),
    (gen_random_uuid(), q_id, '研修室で自習する', FALSE, 4);

  -- R11: medium reading - opinion text
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「最近、在宅勤務が増えている。通勤時間がなくなるため、自分の時間が\n増えるという利点がある。しかし、同僚とのコミュニケーションが\n減ってしまうという問題もある。そのため、週に2〜3回はオフィスに\n出勤するハイブリッド型の働き方を取り入れる企業が増えている。」\n\nハイブリッド型の働き方とは何ですか？',
    '在宅勤務に関する意見文の読解です。ハイブリッド型は在宅とオフィス勤務を組み合わせた方式です。(하이브리드형은 재택과 사무실 출근을 조합한 방식입니다)', 1, 71, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎日在宅勤務をすること', FALSE, 1),
    (gen_random_uuid(), q_id, '毎日オフィスに行くこと', FALSE, 2),
    (gen_random_uuid(), q_id, '在宅とオフィス勤務を組み合わせること', TRUE, 3),
    (gen_random_uuid(), q_id, '週末も仕事をすること', FALSE, 4);

  -- R12: medium reading - event information
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「社内勉強会のお知らせ\nテーマ：『効率的なコードレビューの方法』\n日時：6月15日（金）18:00〜19:30\n場所：会議室B（オンライン参加も可）\n講師：開発部 佐藤リーダー\n参加希望の方は6月10日までにSlackの#study-groupチャンネルで\nお知らせください。資料は当日配布します。」\n\nオンラインで参加する場合、何をしなければなりませんか？',
    '勉強会のお知らせの読解です。参加方法に関係なく、Slackで申し込む必要があります。(온라인 참가도 Slack에서 신청해야 합니다)', 1, 72, 'N3', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議室Bに行く', FALSE, 1),
    (gen_random_uuid(), q_id, '佐藤リーダーにメールする', FALSE, 2),
    (gen_random_uuid(), q_id, '6月10日までにSlackで知らせる', TRUE, 3),
    (gen_random_uuid(), q_id, '資料を事前にダウンロードする', FALSE, 4);

END $$;

-- ============================================
-- READING: N2 (9 questions) sort_order 73-81
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- R13: hard reading - IT project report
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「今回のシステム移行プロジェクトにおいて、最も大きな課題はデータの\n整合性の確保であった。旧システムと新システムではデータ構造が大幅に\n異なるため、単純なデータ移行では不整合が生じる恐れがあった。\nそこで、移行ツールを独自に開発し、データの変換と検証を自動化する\nアプローチを採用した。結果として、99.8%の精度でデータ移行を\n完了することができた。」\n\nデータ移行の課題に対して、どのような対策をとりましたか？',
    'IT プロジェクト報告書の読解です。独自の移行ツールを開発して自動化しました。(독자적인 마이그레이션 도구를 개발하여 자동화했습니다)', 1, 73, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '旧システムのデータ構造に合わせた', FALSE, 1),
    (gen_random_uuid(), q_id, '手動でデータを一つずつ確認した', FALSE, 2),
    (gen_random_uuid(), q_id, '移行ツールを開発して自動化した', TRUE, 3),
    (gen_random_uuid(), q_id, 'データ移行を中止した', FALSE, 4);

  -- R14: hard reading - business article
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「日本のIT業界では、多重下請け構造が長年の課題となっている。\n大手SIerが受注した案件が二次、三次と下請けに流れることで、\n末端のエンジニアの待遇が悪化するという問題がある。近年では\nこの構造を見直し、直接雇用やフリーランスとの直接契約を\n増やす動きも出てきている。しかし、急にこの構造を変えることは\n難しく、段階的な改革が求められている。」\n\n筆者は多重下請け構造についてどのように考えていますか？',
    '日本のIT業界の構造問題に関する文章です。段階的な改革が必要だと述べています。(단계적인 개혁이 필요하다고 서술하고 있습니다)', 1, 74, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すぐに廃止すべきである', FALSE, 1),
    (gen_random_uuid(), q_id, '問題はないので維持すべきである', FALSE, 2),
    (gen_random_uuid(), q_id, '段階的に改革していく必要がある', TRUE, 3),
    (gen_random_uuid(), q_id, 'フリーランスだけにすべきである', FALSE, 4);

  -- R15: hard reading - technical specification
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「マイクロサービスアーキテクチャを採用する際には、サービス間の\n通信方法を慎重に選択する必要がある。同期通信はレスポンスを\nすぐに得られるが、一つのサービスが停止すると連鎖的に障害が\n広がるリスクがある。一方、非同期通信はメッセージキューを\n介することで各サービスの独立性を保てるが、処理結果の\nリアルタイム性は損なわれる。」\n\n非同期通信のデメリットは何ですか？',
    'マイクロサービスの通信方法に関する技術文書の読解です。非同期通信はリアルタイム性が損なわれます。(비동기 통신은 실시간성이 저하됩니다)', 1, 75, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サービスの独立性が低い', FALSE, 1),
    (gen_random_uuid(), q_id, '連鎖的な障害が起きやすい', FALSE, 2),
    (gen_random_uuid(), q_id, 'リアルタイム性が損なわれる', TRUE, 3),
    (gen_random_uuid(), q_id, 'メッセージキューが不要', FALSE, 4);

  -- R16: hard reading - policy document
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「個人情報保護法の改正により、企業はより厳格なデータ管理が\n求められるようになった。特に、第三者への個人データの提供には\n本人の同意が原則として必要となり、同意なく提供した場合は\n罰則が科される可能性がある。また、個人情報の漏洩が発生した場合、\n企業は速やかに本人および個人情報保護委員会に報告する義務がある。\nこれらの規制は、個人の権利を守ると同時に、企業の信頼性を\n高める効果も期待されている。」\n\n個人情報が漏洩した場合、企業は何をしなければなりませんか？',
    '個人情報保護に関する法律文書の読解です。漏洩時は本人と委員会への報告義務があります。(유출 시 본인과 위원회에 보고할 의무가 있습니다)', 1, 76, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '第三者に連絡する', FALSE, 1),
    (gen_random_uuid(), q_id, '本人と個人情報保護委員会に報告する', TRUE, 2),
    (gen_random_uuid(), q_id, '罰金を自主的に支払う', FALSE, 3),
    (gen_random_uuid(), q_id, 'データを全て削除する', FALSE, 4);

  -- R17: hard reading - editorial
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「AIの発展は目覚ましいが、それが人間の仕事を完全に奪うという\n見方は単純すぎると言わざるを得ない。確かに、定型的な作業は\n自動化されるだろう。しかし、創造性やコミュニケーション能力が\n求められる仕事はAIには代替しがたい。むしろ、AIを道具として\n使いこなす能力が、これからの時代に求められるスキルとなるだろう。\n重要なのは、AIを恐れるのではなく、AIと共存する方法を\n模索することである。」\n\n筆者が最も言いたいことは何ですか？',
    'AI に関する論説文の読解です。AIと共存する方法を考えることが重要だと主張しています。(AI와 공존하는 방법을 모색하는 것이 중요하다고 주장하고 있습니다)', 1, 77, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AIは人間の仕事を全て奪う', FALSE, 1),
    (gen_random_uuid(), q_id, 'AIの発展を止めるべきだ', FALSE, 2),
    (gen_random_uuid(), q_id, '定型的な作業だけ自動化すべきだ', FALSE, 3),
    (gen_random_uuid(), q_id, 'AIと共存する方法を考えることが重要だ', TRUE, 4);

  -- R18: hard reading - meeting minutes
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「議事録\n日時：2024年3月15日 14:00〜15:30\n議題：次期システム開発の技術選定について\n\n結論：\n1. フロントエンドはReactを継続使用する\n2. バックエンドはJavaからGoへの移行を検討する\n3. データベースはPostgreSQLを維持する\n4. 次回会議までに、Go移行のコストと工数を調査すること\n\n備考：Go移行については、既存チームのスキルセットを考慮し、\n段階的に進める方針とする。完全移行には1年程度を見込む。」\n\n次回会議までに何をする予定ですか？',
    '会議の議事録の読解です。次回までにGo移行のコストと工数を調査します。(다음 회의까지 Go 이전의 비용과 공수를 조사합니다)', 1, 78, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Reactへの移行計画を立てる', FALSE, 1),
    (gen_random_uuid(), q_id, 'Go移行のコストと工数を調査する', TRUE, 2),
    (gen_random_uuid(), q_id, 'PostgreSQLの代替を探す', FALSE, 3),
    (gen_random_uuid(), q_id, 'チームメンバーを増やす', FALSE, 4);

  -- R19: hard reading - abstract reasoning
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「技術的負債という概念は、ソフトウェア開発において避けては\n通れない問題である。短期的な納期を優先して安易な実装を\n選択すると、将来的にその「借金」を返すために多大な工数が\n必要になる。しかし、完璧な設計を追求するあまり開発が遅延\nすれば、ビジネス機会を逃すことになりかねない。したがって、\n技術的負債を完全にゼロにすることを目指すのではなく、\n許容できる範囲を見極めながら管理することが肝要である。」\n\n筆者が「技術的負債」について主張していることはどれですか？',
    '技術的負債に関する論考文です。完全排除ではなく許容範囲内での管理が重要だと主張しています。(완전 배제가 아닌 허용 범위 내 관리가 중요하다고 주장합니다)', 1, 79, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '技術的負債は絶対に作ってはならない', FALSE, 1),
    (gen_random_uuid(), q_id, '納期を優先して安易な実装を選ぶべきだ', FALSE, 2),
    (gen_random_uuid(), q_id, '許容範囲を見極めながら管理すべきだ', TRUE, 3),
    (gen_random_uuid(), q_id, '技術的負債は気にしなくてよい', FALSE, 4);

  -- R20: hard reading - contract terms
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「本契約において、受託者は委託者の書面による事前承諾なくして、\n本業務の全部または一部を第三者に再委託してはならない。\nただし、再委託を行う場合は、受託者が当該第三者の行為について\n全責任を負うものとする。また、秘密情報の取り扱いについては、\n本契約終了後3年間にわたり守秘義務が継続するものとする。」\n\n再委託について正しい記述はどれですか？',
    '契約書の読解です。再委託には委託者の書面による事前承諾が必要です。(재위탁에는 위탁자의 서면에 의한 사전 승인이 필요합니다)', 1, 80, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自由に再委託できる', FALSE, 1),
    (gen_random_uuid(), q_id, '書面による事前承諾があれば再委託できる', TRUE, 2),
    (gen_random_uuid(), q_id, '再委託は一切禁止されている', FALSE, 3),
    (gen_random_uuid(), q_id, '口頭の承諾があれば再委託できる', FALSE, 4);

  -- R21: hard reading - performance evaluation
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「当社のパフォーマンス改善施策として、コードレビューの義務化を\n導入してから半年が経過した。その結果、本番環境でのバグ発生率は\n40%減少し、チーム全体のコード品質も向上した。一方で、レビューに\nかかる時間が増加し、開発速度が約15%低下したという課題も\n浮き彫りになった。今後は、AIによる自動レビューツールを導入し、\n人間のレビューは設計判断に焦点を当てることで、品質と速度の\n両立を図る方針である。」\n\n今後の方針として正しいものはどれですか？',
    'コードレビュー施策の評価文書の読解です。AI自動レビュー導入で品質と速度を両立する方針です。(AI 자동 리뷰 도입으로 품질과 속도를 양립하는 방침입니다)', 1, 81, 'N2', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードレビューを廃止する', FALSE, 1),
    (gen_random_uuid(), q_id, 'レビュー時間をさらに増やす', FALSE, 2),
    (gen_random_uuid(), q_id, 'AI自動レビューを導入し人間は設計判断に集中する', TRUE, 3),
    (gen_random_uuid(), q_id, '開発速度を優先して品質を下げる', FALSE, 4);

END $$;

-- ============================================
-- READING: N1 (9 questions) sort_order 82-90
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- R22: hard reading - security policy
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「セキュリティ対策は、往々にして利便性とのトレードオフの関係にある。\n厳格な認証プロセスを導入すれば安全性は向上するが、ユーザーの操作性は\n低下する。多要素認証の導入により不正アクセスは大幅に減少したものの、\nログインに要する時間が増加し、ユーザーからの不満の声も上がっている。\nセキュリティと利便性の最適なバランスを見出すことが、\nシステム設計者に求められる重要な課題である。」\n\nこの文章の主旨はどれですか？',
    'セキュリティと利便性のバランスについての文章です。両者の最適なバランスが重要です。(보안과 편의성의 최적 균형이 중요합니다)', 1, 82, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'セキュリティを最優先にすべきだ', FALSE, 1),
    (gen_random_uuid(), q_id, '利便性を最優先にすべきだ', FALSE, 2),
    (gen_random_uuid(), q_id, 'セキュリティと利便性のバランスが重要だ', TRUE, 3),
    (gen_random_uuid(), q_id, '多要素認証は廃止すべきだ', FALSE, 4);

  -- R23: hard reading - agile methodology
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「アジャイル開発の本質は、変化への迅速な対応にある。従来の\nウォーターフォール型では、要件定義の段階で全てを決定する\n必要があったが、アジャイル開発では短いイテレーションを\n繰り返しながら、顧客のフィードバックを反映していく。\nただし、これは計画が不要だということではない。むしろ、\n変化に対応するためにこそ、優先順位の明確化と継続的な\n見直しが不可欠なのである。」\n\nアジャイル開発について、筆者が強調していることはどれですか？',
    'アジャイル開発に関する文章です。変化に対応するために計画と見直しが重要だと述べています。(변화에 대응하기 위해 계획과 검토가 중요하다고 강조합니다)', 1, 83, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '計画は一切不要である', FALSE, 1),
    (gen_random_uuid(), q_id, 'ウォーターフォール型の方が優れている', FALSE, 2),
    (gen_random_uuid(), q_id, '変化対応のために優先順位と見直しが必要だ', TRUE, 3),
    (gen_random_uuid(), q_id, '顧客のフィードバックは無視すべきだ', FALSE, 4);

  -- R24: hard reading - HR policy
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「当社の人材育成方針は、OJT（On-the-Job Training）を基盤としつつ、\nOff-JTとの組み合わせにより、効果的なスキル向上を目指すものである。\n新入社員には6ヶ月間のメンター制度を設け、先輩社員が日常業務を\n通じて指導を行う。加えて、月1回の社内勉強会や外部研修への\n参加機会を提供している。ただし、育成にかかるコストと業務効率の\nバランスには常に留意する必要がある。」\n\n当社の人材育成の基盤は何ですか？',
    '人材育成方針に関する文書の読解です。OJTが基盤です。(OJT가 기반입니다)', 1, 84, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '外部研修', FALSE, 1),
    (gen_random_uuid(), q_id, '社内勉強会', FALSE, 2),
    (gen_random_uuid(), q_id, 'OJT（実務研修）', TRUE, 3),
    (gen_random_uuid(), q_id, 'eラーニング', FALSE, 4);

  -- R25: hard reading - system architecture
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「CI/CD（継続的インテグレーション・継続的デリバリー）パイプラインの\n構築は、開発効率の向上に大きく貢献する。コードがリポジトリに\nプッシュされるたびに自動テストが実行され、品質が担保される。\nさらに、テストを通過したコードは自動的にステージング環境に\nデプロイされるため、手動デプロイによるヒューマンエラーが排除される。\nただし、パイプラインの構築と維持にはそれなりの工数が必要であり、\n小規模プロジェクトでは費用対効果を検討する必要がある。」\n\nCI/CDパイプラインの課題として述べられていることはどれですか？',
    'CI/CDに関する技術文書の読解です。構築と維持に工数がかかることが課題です。(구축과 유지에 공수가 드는 것이 과제입니다)', 1, 85, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自動テストの精度が低い', FALSE, 1),
    (gen_random_uuid(), q_id, '構築と維持に工数がかかる', TRUE, 2),
    (gen_random_uuid(), q_id, 'ヒューマンエラーが増える', FALSE, 3),
    (gen_random_uuid(), q_id, '品質が担保できない', FALSE, 4);

  -- R26: hard reading - cultural difference
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「日本企業で働く外国人エンジニアが最も戸惑うのは、「報連相」の\n文化であろう。欧米企業では結果を出すことが重要視されるが、\n日本企業ではプロセスの共有が同様に重視される。小さな進捗でも\n報告し、問題が発生する前に相談する姿勢が求められる。これは\n非効率に見えるかもしれないが、チーム全体でリスクを早期に\n発見し、対処する仕組みとして機能している。」\n\n「報連相」が日本企業で重視される理由はどれですか？',
    '報連相の文化に関する文章です。チーム全体でリスクを早期発見・対処するためです。(팀 전체로 리스크를 조기 발견·대처하기 위함입니다)', 1, 86, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '個人の成果を評価するため', FALSE, 1),
    (gen_random_uuid(), q_id, '上司の権威を示すため', FALSE, 2),
    (gen_random_uuid(), q_id, 'チームでリスクを早期発見・対処するため', TRUE, 3),
    (gen_random_uuid(), q_id, '外国人エンジニアを管理するため', FALSE, 4);

  -- R27: hard reading - database design
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「データベースの正規化は、データの冗長性を排除し、整合性を\n保つための重要な手法である。しかし、過度な正規化はテーブルの\n結合が増加し、検索パフォーマンスの低下を招くことがある。\nそのため、実務では意図的に正規化を崩す「非正規化」を行う\nケースもある。特に、読み取り頻度が高く、リアルタイム性が\n求められるシステムでは、非正規化によるパフォーマンス向上が\nビジネス要件を満たすために不可欠な場合がある。」\n\n非正規化を行う主な理由はどれですか？',
    'データベース設計に関する技術文書の読解です。パフォーマンス向上が主な理由です。(퍼포먼스 향상이 주된 이유입니다)', 1, 87, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの整合性を高めるため', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブル数を減らすため', FALSE, 2),
    (gen_random_uuid(), q_id, '検索パフォーマンスを向上させるため', TRUE, 3),
    (gen_random_uuid(), q_id, 'データの冗長性を増やすため', FALSE, 4);

  -- R28: hard reading - project post-mortem
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「プロジェクトの振り返り（ポストモーテム）は、失敗から学ぶための\n重要なプロセスである。しかし、多くの組織では、振り返りが\n犯人探しの場になってしまい、建設的な議論ができないという問題がある。\n効果的な振り返りを行うためには、個人を責めるのではなく、\nプロセスやシステムに問題がなかったかを分析する「ブレームレス」な\n文化を醸成することが不可欠である。失敗を隠さず共有できる環境こそが、\n組織の学習と成長を促進するのである。」\n\n効果的な振り返りに必要なことはどれですか？',
    'ポストモーテムに関する文章です。個人を責めずプロセスを分析する文化が必要です。(개인을 비난하지 않고 프로세스를 분석하는 문화가 필요합니다)', 1, 88, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '責任者を明確にすること', FALSE, 1),
    (gen_random_uuid(), q_id, '失敗を報告しないこと', FALSE, 2),
    (gen_random_uuid(), q_id, '個人を責めずプロセスを分析する文化', TRUE, 3),
    (gen_random_uuid(), q_id, '振り返り会議を減らすこと', FALSE, 4);

  -- R29: hard reading - API design
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「REST APIの設計において、バージョニング戦略は慎重に検討する\n必要がある。URLにバージョン番号を含める方法（例：/api/v2/users）は\n直感的で分かりやすいが、URLの変更によりクライアント側の修正が\n必要になる。一方、ヘッダーにバージョン情報を含める方法は\nURLを一定に保てるが、テストやデバッグが複雑になるという\nトレードオフがある。いずれの方法を選択するにせよ、後方互換性を\n維持しつつ、段階的に旧バージョンを廃止する計画が重要である。」\n\nURLにバージョン番号を含める方法の欠点はどれですか？',
    'REST API設計に関する技術文書です。URL変更によりクライアント修正が必要になります。(URL 변경으로 클라이언트 수정이 필요해집니다)', 1, 89, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストが複雑になる', FALSE, 1),
    (gen_random_uuid(), q_id, 'URLの変更でクライアント修正が必要になる', TRUE, 2),
    (gen_random_uuid(), q_id, '直感的でない', FALSE, 3),
    (gen_random_uuid(), q_id, '後方互換性を維持できない', FALSE, 4);

  -- R30: hard reading - work-life balance
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の文章を読んで、質問に答えてください。\n\n「働き方改革が叫ばれて久しいが、IT業界における長時間労働は\n依然として根深い問題である。納期のプレッシャーや人手不足が\n主な要因とされるが、属人化した業務プロセスも見逃せない。\n特定の個人に知識やスキルが集中すると、その人がいないと\n業務が回らなくなり、結果として当該社員の負担が増大する。\nこの問題を解決するには、ドキュメンテーションの徹底と\nペアプログラミングの導入により、知識の共有を促進する\nことが効果的である。」\n\n属人化による問題の解決策として述べられていることはどれですか？',
    '属人化と知識共有に関する文章です。ドキュメントとペアプロで知識共有を促進することが解決策です。(문서화와 페어프로그래밍으로 지식 공유를 촉진하는 것이 해결책입니다)', 1, 90, 'N1', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人員を増やすこと', FALSE, 1),
    (gen_random_uuid(), q_id, '納期を延長すること', FALSE, 2),
    (gen_random_uuid(), q_id, 'ドキュメント整備とペアプログラミング', TRUE, 3),
    (gen_random_uuid(), q_id, '外部委託を増やすこと', FALSE, 4);

END $$;

-- ============================================
-- LISTENING: N5 (3) + N4 (3) = 6 questions, sort_order 91-96
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- L1: easy listening - self introduction
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n田中：はじめまして。田中です。よろしくお願いします。\nキム：はじめまして。キムです。韓国から来ました。\n田中：そうですか。日本語が上手ですね。\nキム：ありがとうございます。まだまだです。\n\nキムさんはどこから来ましたか？',
    '自己紹介の会話です。キムさんは「韓国から来ました」と言っています。(김씨는 한국에서 왔습니다)', 1, 91, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '中国', FALSE, 1),
    (gen_random_uuid(), q_id, '韓国', TRUE, 2),
    (gen_random_uuid(), q_id, 'アメリカ', FALSE, 3),
    (gen_random_uuid(), q_id, 'タイ', FALSE, 4);

  -- L2: easy listening - asking directions
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\nキム：すみません。駅はどこですか？\n通行人：この道をまっすぐ行って、二つ目の信号を右に曲がってください。\nキム：右ですね。どのくらいかかりますか？\n通行人：歩いて5分くらいです。\n\n駅に行くには、二つ目の信号をどうしますか？',
    '道案内の会話です。「二つ目の信号を右に曲がる」が正解です。(두 번째 신호에서 우회전합니다)', 1, 92, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左に曲がる', FALSE, 1),
    (gen_random_uuid(), q_id, 'まっすぐ行く', FALSE, 2),
    (gen_random_uuid(), q_id, '右に曲がる', TRUE, 3),
    (gen_random_uuid(), q_id, '後ろに戻る', FALSE, 4);

  -- L3: easy listening - ordering food
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n店員：いらっしゃいませ。ご注文はお決まりですか？\nキム：コーヒーを一つお願いします。\n店員：ホットとアイス、どちらになさいますか？\nキム：ホットでお願いします。\n店員：かしこまりました。\n\nキムさんは何を注文しましたか？',
    '飲食店での注文の会話です。ホットコーヒーを注文しました。(핫 커피를 주문했습니다)', 1, 93, 'N5', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アイスコーヒー', FALSE, 1),
    (gen_random_uuid(), q_id, 'ホットコーヒー', TRUE, 2),
    (gen_random_uuid(), q_id, '紅茶', FALSE, 3),
    (gen_random_uuid(), q_id, 'ジュース', FALSE, 4);

  -- L4: easy listening - schedule
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n鈴木：キムさん、明日の会議は何時からですか？\nキム：10時からです。場所は3階の会議室Aです。\n鈴木：10時ですね。分かりました。何か持っていくものはありますか？\nキム：ノートパソコンをお願いします。\n\n会議は何時からですか？',
    'スケジュール確認の会話です。会議は10時からです。(회의는 10시부터입니다)', 1, 94, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '9時', FALSE, 1),
    (gen_random_uuid(), q_id, '10時', TRUE, 2),
    (gen_random_uuid(), q_id, '11時', FALSE, 3),
    (gen_random_uuid(), q_id, '3時', FALSE, 4);

  -- L5: easy listening - phone call
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n受付：はい、ABCカンパニーです。\nキム：お世話になっております。DEF株式会社のキムです。\n　　　山田様はいらっしゃいますか？\n受付：申し訳ございません。山田はただいま外出しております。\nキム：そうですか。戻りは何時ごろですか？\n受付：3時ごろ戻る予定です。\n\n山田さんは今どこにいますか？',
    '電話応対の会話です。山田さんは外出中です。(야마다 씨는 외출 중입니다)', 1, 95, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議中', FALSE, 1),
    (gen_random_uuid(), q_id, '休憩中', FALSE, 2),
    (gen_random_uuid(), q_id, '外出中', TRUE, 3),
    (gen_random_uuid(), q_id, '出張中', FALSE, 4);

  -- L6: easy listening - weather talk
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n田中：今日は暑いですね。\nキム：そうですね。30度以上あるそうです。\n田中：冷たいものが飲みたいですね。\nキム：自動販売機で何か買いましょうか。\n田中：いいですね。お茶をお願いします。\n\n今日の天気はどうですか？',
    '天気の会話です。「暑い」「30度以上」と言っているので暑い天気です。(오늘은 더운 날씨입니다)', 1, 96, 'N4', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '寒い', FALSE, 1),
    (gen_random_uuid(), q_id, '涼しい', FALSE, 2),
    (gen_random_uuid(), q_id, '暑い', TRUE, 3),
    (gen_random_uuid(), q_id, '雨が降っている', FALSE, 4);

END $$;

-- ============================================
-- LISTENING: N3 (6 questions) sort_order 97-102
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- L7: medium listening - work assignment
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n佐藤：キムさん、このタスクの進捗はどうですか？\nキム：すみません、少し遅れています。データベースの設計で\n　　　予想以上に時間がかかっていまして。\n佐藤：そうですか。期限は金曜日ですよね。間に合いそうですか？\nキム：木曜日までにはなんとか終わらせます。\n佐藤：分かりました。もし助けが必要なら、遠慮なく言ってくださいね。\nキム：ありがとうございます。\n\nキムさんのタスクが遅れている理由は何ですか？',
    '業務の進捗確認の会話です。データベースの設計に時間がかかっています。(데이터베이스 설계에 시간이 걸리고 있습니다)', 1, 97, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テストの実施に予想以上の時間がかかっている', FALSE, 1),
    (gen_random_uuid(), q_id, 'データベースの設計に時間がかかっている', TRUE, 2),
    (gen_random_uuid(), q_id, '体調不良で数日間作業が進まなかった', FALSE, 3),
    (gen_random_uuid(), q_id, '他の優先タスクの対応に追われていた', FALSE, 4);

  -- L8: medium listening - office discussion
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n山田：来週の歓迎会の場所、決まりましたか？\n鈴木：はい、駅前のイタリアンレストランを予約しました。\n山田：何人ですか？\n鈴木：今のところ12人です。でも、まだ返事をしていない人が3人います。\n山田：そうですか。明日までに確認してもらえますか？\n鈴木：はい、明日のお昼までに全員に確認します。\n\n歓迎会の場所はどこですか？',
    '歓迎会の準備に関する会話です。駅前のイタリアンレストランです。(역 앞 이탈리안 레스토랑입니다)', 1, 98, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会社の近くにある中華レストラン', FALSE, 1),
    (gen_random_uuid(), q_id, '駅前にある和食の居酒屋', FALSE, 2),
    (gen_random_uuid(), q_id, '駅前のイタリアンレストラン', TRUE, 3),
    (gen_random_uuid(), q_id, '会社から徒歩圏内のホテル内', FALSE, 4);

  -- L9: medium listening - request handling
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n上司：キムさん、明日のプレゼンの資料はできていますか？\nキム：はい、ほぼ完成しています。グラフのデータだけ最新のものに\n　　　更新する必要があります。\n上司：分かりました。更新したら、私に確認のメールを送ってください。\nキム：はい、今日中に送ります。\n上司：それから、プレゼンは英語でお願いしますね。\nキム：承知しました。\n\nキムさんがまだやっていないことは何ですか？',
    'プレゼン準備の会話です。グラフのデータ更新がまだです。(그래프 데이터 업데이트가 아직입니다)', 1, 99, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プレゼン資料の全体作成', FALSE, 1),
    (gen_random_uuid(), q_id, 'グラフのデータ更新', TRUE, 2),
    (gen_random_uuid(), q_id, '英語への翻訳と校正作業', FALSE, 3),
    (gen_random_uuid(), q_id, '確認メールの送信準備', FALSE, 4);

  -- L10: medium listening - trouble reporting
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n鈴木：すみません、プリンターが動かないんですが。\nIT担当：どんな状態ですか？\n鈴木：電源は入っていますが、紙が詰まったというメッセージが出ています。\nIT担当：分かりました。紙を取り出してみてください。\n　　　　カバーを開けて、詰まった紙をゆっくり引き出してください。\n鈴木：やってみます。あ、取れました。\nIT担当：よかったです。それで動くはずです。\n\nプリンターの問題は何でしたか？',
    'トラブル報告の会話です。紙が詰まっていました。(종이가 걸려 있었습니다)', 1, 100, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '電源が入らない', FALSE, 1),
    (gen_random_uuid(), q_id, 'インクがない', FALSE, 2),
    (gen_random_uuid(), q_id, '紙が詰まった', TRUE, 3),
    (gen_random_uuid(), q_id, 'ネットワークに接続できない', FALSE, 4);

  -- L11: medium listening - scheduling change
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n田中：キムさん、来週の出張の件ですが、日程が変更になりました。\nキム：えっ、そうですか。もともと水曜日でしたよね？\n田中：はい、先方の都合で木曜日に変わりました。\n　　　時間は同じ10時からです。\nキム：分かりました。ホテルの予約も変更しなければなりませんね。\n田中：そうですね。お願いします。\n\n出張はいつに変更されましたか？',
    'スケジュール変更の会話です。水曜日から木曜日に変更されました。(수요일에서 목요일로 변경되었습니다)', 1, 101, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '火曜日', FALSE, 1),
    (gen_random_uuid(), q_id, '水曜日', FALSE, 2),
    (gen_random_uuid(), q_id, '木曜日', TRUE, 3),
    (gen_random_uuid(), q_id, '金曜日', FALSE, 4);

  -- L12: medium listening - lunch conversation
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n佐藤：キムさん、昼ご飯、一緒にどうですか？\nキム：いいですね。どこに行きましょうか？\n佐藤：新しくできたラーメン屋はどうですか？\nキム：あ、でも私は昨日もラーメンを食べたので、\n　　　今日は違うものがいいです。\n佐藤：じゃあ、隣の定食屋にしましょう。日替わり定食がおいしいですよ。\nキム：それにしましょう。\n\n二人はどこで昼ご飯を食べますか？',
    '昼食の相談の会話です。定食屋に行くことになりました。(정식집에 가기로 했습니다)', 1, 102, 'N3', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ラーメン屋', FALSE, 1),
    (gen_random_uuid(), q_id, '社員食堂', FALSE, 2),
    (gen_random_uuid(), q_id, '定食屋', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンビニ', FALSE, 4);

END $$;

-- ============================================
-- LISTENING: N2 (9 questions) sort_order 103-111
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- L13: hard listening - sprint planning
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n佐藤：今スプリントの振り返りですが、予定していた8つのタスクのうち、\n　　　完了したのは6つでした。\n田中：残りの2つは何が原因で遅れたんですか？\n佐藤：一つはAPIの仕様が途中で変更になったためです。\n　　　もう一つは、テスト環境の不具合で検証に時間がかかりました。\n田中：なるほど。次のスプリントでは、仕様変更のリスクを見込んで\n　　　バッファを設けましょう。\n佐藤：そうですね。ストーリーポイントを少し減らして計画します。\n\n次のスプリントで対策として行うことはどれですか？',
    'スプリント振り返りの会話です。バッファを設けてポイントを減らす計画です。(버퍼를 두고 포인트를 줄여 계획합니다)', 1, 103, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '開発メンバーを増員して作業を分担する', FALSE, 1),
    (gen_random_uuid(), q_id, 'テスト環境を刷新して検証速度を上げる', FALSE, 2),
    (gen_random_uuid(), q_id, 'バッファを設けてポイントを減らす', TRUE, 3),
    (gen_random_uuid(), q_id, '未完了のタスクを全て次回に延期する', FALSE, 4);

  -- L14: hard listening - code review discussion
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n山田：キムさん、コードレビューのフィードバックなんですが、\n　　　この関数は責務が多すぎると思います。\nキム：具体的にはどの部分でしょうか？\n山田：データの取得と加工と表示を全部一つの関数でやっていますよね。\n　　　単一責任の原則に沿って、それぞれ分割した方がいいですよ。\nキム：なるほど、確かにテストも書きにくい状態ですね。\n山田：そうなんです。分割すればユニットテストも書きやすくなります。\n\n山田さんが指摘した問題は何ですか？',
    'コードレビューの会話です。一つの関数に責務が多すぎることが問題です。(하나의 함수에 책임이 너무 많다는 것이 문제입니다)', 1, 104, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変数名が分かりにくく可読性が低い', FALSE, 1),
    (gen_random_uuid(), q_id, '一つの関数に責務が多すぎる', TRUE, 2),
    (gen_random_uuid(), q_id, 'コメントやドキュメントが不足している', FALSE, 3),
    (gen_random_uuid(), q_id, 'パフォーマンスに重大な問題がある', FALSE, 4);

  -- L15: hard listening - client meeting
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\nクライアント：御社のシステムを導入する場合、既存のデータは\n　　　　　　　移行できますか？\n営業：はい、もちろん可能です。ただし、データ量にもよりますが、\n　　　移行作業には通常2〜3週間ほどかかります。\nクライアント：費用はどのくらいでしょうか？\n営業：データ移行だけで申しますと、100万円からになります。\n　　　ただ、年度末までにご契約いただければ、2割引きで\n　　　ご提供できます。\nクライアント：検討させていただきます。\n\n年度末までに契約した場合の移行費用はいくらですか？',
    'クライアントとの商談の会話です。100万円の2割引で80万円です。(100만엔의 20% 할인으로 80만엔입니다)', 1, 105, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '50万円から', FALSE, 1),
    (gen_random_uuid(), q_id, '80万円から', TRUE, 2),
    (gen_random_uuid(), q_id, '100万円から', FALSE, 3),
    (gen_random_uuid(), q_id, '120万円から', FALSE, 4);

  -- L16: hard listening - incident response
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n鈴木：大変です！本番環境でエラーが発生しています。\n佐藤：落ち着いて。まず影響範囲を確認してください。\n　　　全ユーザーに影響がありますか？\n鈴木：ログを確認したところ、特定のAPIエンドポイントだけです。\n　　　決済機能には影響はありません。\n佐藤：分かりました。では、まず該当のエンドポイントを\n　　　メンテナンスモードに切り替えて、原因調査に入りましょう。\n　　　それから、お客様にはステータスページで状況を通知してください。\n\n佐藤さんが最初に指示したことはどれですか？',
    'インシデント対応の会話です。まず影響範囲を確認するよう指示しました。(먼저 영향 범위를 확인하도록 지시했습니다)', 1, 106, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '影響範囲を確認すること', TRUE, 1),
    (gen_random_uuid(), q_id, 'メンテナンスモードに切り替えること', FALSE, 2),
    (gen_random_uuid(), q_id, '原因を調査すること', FALSE, 3),
    (gen_random_uuid(), q_id, 'お客様に通知すること', FALSE, 4);

  -- L17: hard listening - performance review
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n上司：キムさん、今期の評価面談です。全体的に良い成績でしたね。\nキム：ありがとうございます。\n上司：特にコードの品質が向上しています。ただ、一点だけ\n　　　改善点があります。\nキム：何でしょうか？\n上司：チームミーティングでの発言をもう少し増やしてほしいんです。\n　　　技術的な知識は十分あるので、それをチームに共有することで\n　　　全体のレベルアップにつながります。\nキム：分かりました。来期は積極的に発言するようにします。\n\n上司がキムさんに求めていることは何ですか？',
    '評価面談の会話です。チームミーティングでの発言を増やすよう求めています。(팀 미팅에서의 발언을 늘리도록 요구하고 있습니다)', 1, 107, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードの品質をさらに向上させて基準を超えること', FALSE, 1),
    (gen_random_uuid(), q_id, '残業時間を大幅に削減して効率を高めること', FALSE, 2),
    (gen_random_uuid(), q_id, 'チームミーティングで積極的に発言すること', TRUE, 3),
    (gen_random_uuid(), q_id, '新しいプログラミング言語やフレームワークを学ぶこと', FALSE, 4);

  -- L18: hard listening - architecture discussion
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n田中：現在のモノリシックなアーキテクチャをマイクロサービスに\n　　　移行すべきか検討しています。\n山田：メリットは理解していますが、チームの規模を考えると、\n　　　運用の複雑さが大きな課題になりませんか？\n田中：確かにそうですね。現在のチームは5人ですから。\n山田：まずはモジュラーモノリスで機能を分離して、\n　　　チームが成長してからマイクロサービスに移行する方が\n　　　現実的だと思います。\n田中：段階的なアプローチですね。それが一番リスクが少なそうです。\n\n山田さんが提案したアプローチはどれですか？',
    'アーキテクチャ議論の会話です。まずモジュラーモノリスにして段階的に移行する提案です。(먼저 모듈러 모노리스로 하고 단계적으로 이전하는 제안입니다)', 1, 108, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すぐにマイクロサービスに全面的に移行して運用する', FALSE, 1),
    (gen_random_uuid(), q_id, 'モノリシックのまま最適化して現状の運用を続ける', FALSE, 2),
    (gen_random_uuid(), q_id, 'まずモジュラーモノリスにして段階的に移行する', TRUE, 3),
    (gen_random_uuid(), q_id, '外部のクラウドサービスに全面的に移行して運用する', FALSE, 4);

  -- L19: hard listening - salary negotiation context
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n部長：来期のプロジェクト体制についてですが、キムさんを\n　　　サブリーダーに推薦したいと思います。\n課長：キムさんですか。技術力は申し分ないですが、\n　　　リーダーシップの経験がまだ浅いのが気になります。\n部長：それは承知していますが、今のうちから経験を積ませないと、\n　　　いつまでたっても育ちません。まずは小規模なチームで\n　　　試してみてはどうでしょうか。\n課長：そうですね。3〜4人のチームなら、フォローもしやすいですし。\n　　　分かりました、その方向で進めましょう。\n\n部長がキムさんをサブリーダーに推薦した理由はどれですか？',
    '人事に関する会話です。早いうちからリーダーシップ経験を積ませるためです。(일찍부터 리더십 경험을 쌓게 하기 위해서입니다)', 1, 109, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リーダーシップ経験が豊富だから', FALSE, 1),
    (gen_random_uuid(), q_id, '他に適任者がいないから', FALSE, 2),
    (gen_random_uuid(), q_id, '早いうちから経験を積ませるため', TRUE, 3),
    (gen_random_uuid(), q_id, '本人が希望したから', FALSE, 4);

  -- L20: hard listening - deployment discussion
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n鈴木：今回のリリースですが、ブルーグリーンデプロイメントで\n　　　進めたいと思います。\n佐藤：カナリアリリースではなくて？\n鈴木：今回は大きな仕様変更があるので、一部ユーザーだけに\n　　　公開するよりも、環境を丸ごと切り替えて、問題があれば\n　　　即座にロールバックできる方が安全だと判断しました。\n佐藤：なるほど。ロールバック手順は準備できていますか？\n鈴木：はい、検証環境で3回テスト済みです。\n\nブルーグリーンデプロイメントを選んだ理由はどれですか？',
    'デプロイ戦略の会話です。大きな仕様変更があり、即座にロールバックできる方が安全だからです。(큰 사양 변경이 있어 즉시 롤백할 수 있는 것이 안전하기 때문입니다)', 1, 110, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インフラコストが安く日常的な運用負担が少ないから', FALSE, 1),
    (gen_random_uuid(), q_id, '大きな仕様変更で即座にロールバックできるから', TRUE, 2),
    (gen_random_uuid(), q_id, 'カナリアリリースより設定が簡単で導入が早いから', FALSE, 3),
    (gen_random_uuid(), q_id, 'チームが以前から慣れていて導入の実績があるから', FALSE, 4);

  -- L21: hard listening - mentoring session
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\nメンター：キムさん、日本のIT現場で一番大事なのは何だと思いますか？\nキム：技術力でしょうか？\nメンター：もちろん技術力も大事ですが、それ以上に\n　　　　「報連相」が重要視されます。\nキム：報告・連絡・相談ですよね。\nメンター：そうです。特に問題が発生したときに、一人で抱え込まずに\n　　　　早めに相談することが大切です。日本では「悪い知らせほど\n　　　　早く」という考え方があります。\nキム：韓国でも同じような考え方がありますが、日本ではより\n　　　頻繁に報告するんですね。\n\nメンターが最も強調していることはどれですか？',
    'メンタリングの会話です。問題発生時に早めに相談することの重要性を強調しています。(문제 발생 시 빨리 상담하는 것의 중요성을 강조하고 있습니다)', 1, 111, 'N2', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '技術力を常に向上させて貢献すること', FALSE, 1),
    (gen_random_uuid(), q_id, '問題を一人で最後まで解決すること', FALSE, 2),
    (gen_random_uuid(), q_id, '問題が起きたら早めに相談すること', TRUE, 3),
    (gen_random_uuid(), q_id, '韓国と日本の文化の違いを学ぶこと', FALSE, 4);

END $$;

-- ============================================
-- LISTENING: N1 (9 questions) sort_order 112-120
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- L22: hard listening - requirement gathering
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\nPM：要件定義の段階で、お客様から新しい要望が出ました。\n　　ユーザー権限管理機能を追加してほしいそうです。\n開発者：それは当初のスコープには含まれていませんよね？\nPM：はい。ただ、お客様にとっては重要な機能らしいです。\n開発者：追加するとなると、工数が2週間ほど増えますし、\n　　　　テスト範囲も広がります。\nPM：では、まず影響範囲を整理して、見積もりを出した上で\n　　お客様と再度協議しましょう。スコープを広げるなら\n　　納期か費用の調整が必要です。\n\nPMの対応方針はどれですか？',
    '要件変更に関する会話です。影響範囲を整理して見積もりを出した上でお客様と協議します。(영향 범위를 정리하고 견적을 낸 후 고객과 협의합니다)', 1, 112, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '要望をそのままスコープに含めて即座に対応する', FALSE, 1),
    (gen_random_uuid(), q_id, 'スコープ外の要望として丁重にお断りする', FALSE, 2),
    (gen_random_uuid(), q_id, '影響を整理して見積もり後にお客様と協議する', TRUE, 3),
    (gen_random_uuid(), q_id, '開発チームを増員して納期内に間に合わせる', FALSE, 4);

  -- L23: hard listening - technical training
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n講師：Dockerコンテナの最大のメリットは環境の一貫性です。\n　　　「自分の環境では動くのに、本番では動かない」という\n　　　問題を解消できます。\n受講生：VMとの違いは何ですか？\n講師：VMはOSごと仮想化しますが、コンテナはOSのカーネルを\n　　　共有するので、起動が非常に速く、リソースの消費も\n　　　少ないのが特徴です。\n受講生：セキュリティ面ではどうですか？\n講師：カーネルを共有するため、VMに比べて分離性は低いです。\n　　　そのため、センシティブな環境ではVMが適している場合もあります。\n\nコンテナのデメリットとして述べられていることはどれですか？',
    '技術研修の会話です。カーネル共有のためVMに比べて分離性が低いことがデメリットです。(커널을 공유하므로 VM에 비해 격리성이 낮은 것이 단점입니다)', 1, 113, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '起動に時間がかかり速度が遅い', FALSE, 1),
    (gen_random_uuid(), q_id, 'リソースの消費が非常に多い', FALSE, 2),
    (gen_random_uuid(), q_id, 'VMに比べて分離性が低い', TRUE, 3),
    (gen_random_uuid(), q_id, '環境の一貫性を維持できない', FALSE, 4);

  -- L24: hard listening - conflict resolution
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\nマネージャー：AチームとBチームの間でAPIの仕様について意見が\n　　　　　　食い違っているようですね。\nリーダー：はい、AチームはRESTを主張していますが、\n　　　　Bチームはパフォーマンスの面からgRPCを推しています。\nマネージャー：両チームの要件を再度確認しましょう。\n　　　　　　外部公開が必要な部分はREST、内部通信はgRPCという\n　　　　　　ハイブリッドアプローチも一つの選択肢です。\nリーダー：なるほど、要件によって使い分けるんですね。\n　　　　両チームに提案してみます。\n\nマネージャーが提案した解決策はどれですか？',
    'チーム間の意見対立に関する会話です。外部はREST、内部はgRPCのハイブリッドアプローチです。(외부는 REST, 내부는 gRPC의 하이브리드 접근법입니다)', 1, 114, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全てのAPIをRESTに統一して運用する', FALSE, 1),
    (gen_random_uuid(), q_id, '全てのAPIをgRPCに統一して運用する', FALSE, 2),
    (gen_random_uuid(), q_id, '外部REST・内部gRPCのハイブリッド', TRUE, 3),
    (gen_random_uuid(), q_id, 'GraphQLなど第三の技術を新規採用する', FALSE, 4);

  -- L25: hard listening - retrospective
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n佐藤：先月のプロジェクトの反省点として、ドキュメントの不足が\n　　　挙げられています。\n田中：確かに、設計書が古いまま更新されていなかったですね。\n佐藤：新しいメンバーが参加したときに、コードを読むしかなくて\n　　　キャッチアップに時間がかかったそうです。\n田中：今後はプルリクエストのレビュー時に、関連ドキュメントの\n　　　更新も確認項目に入れましょう。\n佐藤：それは良い案ですね。レビューチェックリストに追加します。\n\nドキュメント不足による具体的な問題は何でしたか？',
    'プロジェクト振り返りの会話です。新メンバーのキャッチアップに時間がかかりました。(새 멤버의 적응에 시간이 걸렸습니다)', 1, 115, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本番環境でバグが頻繁に発生するようになった', FALSE, 1),
    (gen_random_uuid(), q_id, '新メンバーのキャッチアップに時間がかかった', TRUE, 2),
    (gen_random_uuid(), q_id, 'ユニットテストの作成が困難になっていた', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイの手順が不明確で失敗が続いた', FALSE, 4);

  -- L26: hard listening - estimation meeting
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n課長：この機能の見積もりはどのくらいですか？\nキム：開発だけで言えば3日程度ですが、テストとコードレビューを\n　　　含めると5日は見ておいた方がいいと思います。\n課長：お客様には3日と伝えてしまったんですが。\nキム：品質を担保するためには、テスト期間は削れません。\n　　　もし3日で納品するなら、機能を絞る必要があります。\n課長：分かりました。お客様に正確な見積もりを再提示します。\n\nキムさんの主張はどれですか？',
    '見積もり会議の会話です。テスト期間は品質のために削れないと主張しています。(테스트 기간은 품질을 위해 줄일 수 없다고 주장합니다)', 1, 116, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3日あれば開発からテストまで全て完了できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'テスト期間は品質のために削れない', TRUE, 2),
    (gen_random_uuid(), q_id, 'お客様の要望通りの納期に合わせるべきだ', FALSE, 3),
    (gen_random_uuid(), q_id, '予算を増やして機能を追加すべきだ', FALSE, 4);

  -- L27: hard listening - business etiquette
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n先輩：キムさん、日本の会社では名刺交換にもルールがあるんですよ。\nキム：そうなんですか？\n先輩：まず、相手より先に名刺を出すのが礼儀です。両手で差し出して、\n　　　相手の名刺も両手で受け取ります。\nキム：受け取った名刺はすぐにしまっても大丈夫ですか？\n先輩：いいえ、それは失礼にあたります。打ち合わせ中は\n　　　テーブルの上に置いておくのがマナーです。\n　　　相手の名前を確認するためにも役立ちますよ。\n\n名刺を受け取った後、すべきことはどれですか？',
    'ビジネスマナーの会話です。名刺は打ち合わせ中テーブルの上に置いておきます。(명함은 미팅 중 테이블 위에 놓아둡니다)', 1, 117, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すぐにカバンの中にしまう', FALSE, 1),
    (gen_random_uuid(), q_id, 'ポケットに丁寧に入れておく', FALSE, 2),
    (gen_random_uuid(), q_id, 'テーブルの上に置いておく', TRUE, 3),
    (gen_random_uuid(), q_id, '名刺入れに重ねて保管する', FALSE, 4);

  -- L28: hard listening - security briefing
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\nセキュリティ担当：最近、社内でフィッシングメールの被害が\n　　　　　　　　増えています。先月だけで5件の報告がありました。\n部長：具体的にはどんな手口ですか？\nセキュリティ担当：取引先を装ったメールで、添付ファイルを\n　　　　　　　　開かせるパターンが多いです。\n部長：対策はどうしますか？\nセキュリティ担当：まず、全社員向けのセキュリティ研修を実施します。\n　　　　　　　　また、不審なメールを簡単に報告できるボタンを\n　　　　　　　　メーラーに追加する予定です。\n\nフィッシングメールの主な手口はどれですか？',
    'セキュリティブリーフィングの会話です。取引先を装い添付ファイルを開かせるのが主な手口です。(거래처를 사칭하여 첨부파일을 열게 하는 것이 주된 수법입니다)', 1, 118, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パスワードを電話で巧みに聞き出す手口', FALSE, 1),
    (gen_random_uuid(), q_id, '取引先を装い添付ファイルを開かせる', TRUE, 2),
    (gen_random_uuid(), q_id, '偽のログインページに誘導して情報を盗む', FALSE, 3),
    (gen_random_uuid(), q_id, 'ウイルス入りのUSBメモリを配布する', FALSE, 4);

  -- L29: hard listening - team building
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\n山田：最近チームのモチベーションが下がっているように感じます。\n佐藤：何が原因だと思いますか？\n山田：連続するデッドラインと、成果が見えにくいことだと思います。\n　　　バックエンドのリファクタリングって、ユーザーからは\n　　　見えないですからね。\n佐藤：なるほど。では、毎週のデモタイムを設けましょう。\n　　　パフォーマンスの改善数値やコード品質のメトリクスを\n　　　共有することで、成果を可視化できると思います。\n山田：いいですね。小さな成功を積み重ねることが大事ですよね。\n\n佐藤さんが提案した解決策の目的はどれですか？',
    'チームビルディングの会話です。デモタイムで成果を可視化してモチベーションを上げる提案です。(데모 타임으로 성과를 가시화하여 동기부여를 높이는 제안입니다)', 1, 119, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'デッドラインを延長してチームの負担を軽くすること', FALSE, 1),
    (gen_random_uuid(), q_id, 'チームのメンバーを入れ替えて士気を回復すること', FALSE, 2),
    (gen_random_uuid(), q_id, '成果を可視化してモチベーションを上げること', TRUE, 3),
    (gen_random_uuid(), q_id, 'バックエンドのリファクタリング作業を中止すること', FALSE, 4);

  -- L30: hard listening - cross-cultural communication
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice',
    E'次の会話を聞いて、質問に答えてください。\n\nキム：日本の会議で「検討します」と言われたとき、\n　　　それは前向きな返事だと思っていいですか？\nメンター：実は、それは注意が必要な表現です。「検討します」は\n　　　　文字通り「考えます」という意味ですが、\n　　　　日本のビジネスでは婉曲な断りである場合も多いです。\nキム：えっ、そうなんですか？どう見分ければいいですか？\nメンター：相手の表情やその後のフォローアップに注目してください。\n　　　　具体的な日程や条件の話が続けば前向きですが、\n　　　　そのまま連絡が途絶えた場合は、断られた可能性が高いです。\n\n「検討します」の意味について正しいものはどれですか？',
    '日本のビジネスコミュニケーションの会話です。「検討します」は婉曲な断りの場合もあります。(「검토하겠습니다」는 완곡한 거절인 경우도 있습니다)', 1, 120, 'N1', 'listening');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '必ず前向きな返事であり承諾を意味する', FALSE, 1),
    (gen_random_uuid(), q_id, '必ず断りの意味であり拒否を表している', FALSE, 2),
    (gen_random_uuid(), q_id, '前向きな場合も婉曲な断りの場合もある', TRUE, 3),
    (gen_random_uuid(), q_id, '返事を保留するという意味だけで使われる', FALSE, 4);

END $$;
