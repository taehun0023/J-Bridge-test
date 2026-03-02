-- ============================================
-- JLPT Grammar Quizzes (5 quizzes, 20 questions each)
-- N5/N4/N3/N2/N1 levels
-- ============================================

-- Cleanup existing grammar quiz data
DELETE FROM comprehensive_exam_answers WHERE selected_option_id IN (
  SELECT id FROM quiz_question_options WHERE question_id IN (
    SELECT id FROM quiz_questions WHERE quiz_id IN (
      'b0000001-0000-0000-0000-000000000001',
      'b0000002-0000-0000-0000-000000000002',
      'b0000003-0000-0000-0000-000000000003',
      'b0000004-0000-0000-0000-000000000004',
      'b0000005-0000-0000-0000-000000000005'
    )
  )
);
DELETE FROM comprehensive_exam_answers WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'b0000001-0000-0000-0000-000000000001',
    'b0000002-0000-0000-0000-000000000002',
    'b0000003-0000-0000-0000-000000000003',
    'b0000004-0000-0000-0000-000000000004',
    'b0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'b0000001-0000-0000-0000-000000000001',
    'b0000002-0000-0000-0000-000000000002',
    'b0000003-0000-0000-0000-000000000003',
    'b0000004-0000-0000-0000-000000000004',
    'b0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'b0000001-0000-0000-0000-000000000001',
  'b0000002-0000-0000-0000-000000000002',
  'b0000003-0000-0000-0000-000000000003',
  'b0000004-0000-0000-0000-000000000004',
  'b0000005-0000-0000-0000-000000000005'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'b0000001-0000-0000-0000-000000000001',
    'b0000002-0000-0000-0000-000000000002',
    'b0000003-0000-0000-0000-000000000003',
    'b0000004-0000-0000-0000-000000000004',
    'b0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'b0000001-0000-0000-0000-000000000001',
  'b0000002-0000-0000-0000-000000000002',
  'b0000003-0000-0000-0000-000000000003',
  'b0000004-0000-0000-0000-000000000004',
  'b0000005-0000-0000-0000-000000000005'
);
DELETE FROM quizzes WHERE id IN (
  'b0000001-0000-0000-0000-000000000001',
  'b0000002-0000-0000-0000-000000000002',
  'b0000003-0000-0000-0000-000000000003',
  'b0000004-0000-0000-0000-000000000004',
  'b0000005-0000-0000-0000-000000000005'
);

-- Insert 5 grammar quizzes
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment) VALUES
  ('b0000001-0000-0000-0000-000000000001', 'N5 文法クイズ', 'jlpt_grammar', 70, 10, FALSE),
  ('b0000002-0000-0000-0000-000000000002', 'N4 文法クイズ', 'jlpt_grammar', 70, 12, FALSE),
  ('b0000003-0000-0000-0000-000000000003', 'N3 文法クイズ', 'jlpt_grammar', 70, 15, FALSE),
  ('b0000004-0000-0000-0000-000000000004', 'N2 文法クイズ', 'jlpt_grammar', 70, 15, FALSE),
  ('b0000005-0000-0000-0000-000000000005', 'N1 文法クイズ', 'jlpt_grammar', 70, 20, FALSE);

-- ============================================
-- N5 文法クイズ (20 questions)
-- Grammar: です/ます, ない, たい, てください, ている, た, から, けど/が, と思う, ことができる, 前に/後で, 時, ましょう, でしょう, つもり, すぎる, やすい, ほうがいい, たら, ので
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 〜です/ます (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜です」の役割として正しいものは？', '「〜です」は名詞や形容詞の丁寧形を作る助動詞で、文末を丁寧にする役割があります。韓語の「~입니다」に相当します。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '과거를 나타낸다', FALSE, 1),
    (gen_random_uuid(), q_id, '문장을 정중하게 만든다', TRUE, 2),
    (gen_random_uuid(), q_id, '부정을 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '추측을 나타낸다', FALSE, 4);

  -- Q2: 〜ない (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '私は朝ごはんを（　）。', '「食べない」は「食べる」の否定形です。「〜ない」は動詞の未然形に付けて否定を表します。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '食べます', FALSE, 1),
    (gen_random_uuid(), q_id, '食べた', FALSE, 2),
    (gen_random_uuid(), q_id, '食べない', TRUE, 3),
    (gen_random_uuid(), q_id, '食べて', FALSE, 4);

  -- Q3: 〜たい (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜たい」の意味として正しいものは？', '「〜たい」は話者の願望を表す助動詞で、「~하고 싶다」という意味です。動詞の連用形（ます形の「ます」を取った形）に付きます。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '~할 수 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '~했다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶다', TRUE, 4);

  -- Q4: 〜てください (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', 'すみません、ここに名前を（　）ください。', '「書いてください」は「書く」のて形＋ください で丁寧な依頼を表します。「〜てください」は「~해 주세요」という意味です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '書いて', TRUE, 1),
    (gen_random_uuid(), q_id, '書かない', FALSE, 2),
    (gen_random_uuid(), q_id, '書きたい', FALSE, 3),
    (gen_random_uuid(), q_id, '書くと', FALSE, 4);

  -- Q5: 〜ている (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「田中さんは今、本を読んでいます。」の「読んでいます」は何を表していますか？', '「〜ている」は進行中の動作や状態の継続を表します。この文では「今」があるので、現在進行中の動作を表しています。', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '과거의 동작', FALSE, 1),
    (gen_random_uuid(), q_id, '미래의 예정', FALSE, 2),
    (gen_random_uuid(), q_id, '현재 진행 중인 동작', TRUE, 3),
    (gen_random_uuid(), q_id, '가능한 동작', FALSE, 4);

  -- Q6: 〜た (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '昨日、映画を（　）。', '過去の出来事を表すには「〜た」形を使います。「見る」の過去形は「見た」です。「昨日」があるので過去形が必要です。', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '見ます', FALSE, 1),
    (gen_random_uuid(), q_id, '見た', TRUE, 2),
    (gen_random_uuid(), q_id, '見ている', FALSE, 3),
    (gen_random_uuid(), q_id, '見ない', FALSE, 4);

  -- Q7: 〜から (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「雨が降っているから、傘を持っていきます。」の「から」の意味は？', '「〜から」は理由・原因を表す接続助詞で、「~이니까 / ~때문에」という意味です。前の文が理由、後の文が結果を表します。', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이유 (~이니까)', TRUE, 1),
    (gen_random_uuid(), q_id, '양보 (~이지만)', FALSE, 2),
    (gen_random_uuid(), q_id, '조건 (~하면)', FALSE, 3),
    (gen_random_uuid(), q_id, '시간 (~할 때)', FALSE, 4);

  -- Q8: 〜けど/が (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', 'この料理はおいしい（　）、少し高いです。', '「〜けど」は逆接を表す接続助詞で、「~지만」という意味です。前後の文が対比的な内容のときに使います。', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'から', FALSE, 1),
    (gen_random_uuid(), q_id, 'ので', FALSE, 2),
    (gen_random_uuid(), q_id, 'けど', TRUE, 3),
    (gen_random_uuid(), q_id, 'たら', FALSE, 4);

  -- Q9: 〜と思う (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '明日は天気がいい（　）思います。', '「〜と思う」は話者の意見や推量を表します。普通形に「と」を付けて使います。「いいと思います」で「좋을 것이라고 생각합니다」という意味です。', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'を', FALSE, 1),
    (gen_random_uuid(), q_id, 'に', FALSE, 2),
    (gen_random_uuid(), q_id, 'と', TRUE, 3),
    (gen_random_uuid(), q_id, 'で', FALSE, 4);

  -- Q10: 〜ことができる (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「日本語を話すことができます。」の意味は？', '「〜ことができる」は能力や可能性を表す文型で、「~할 수 있다」という意味です。動詞の辞書形に付きます。', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본어를 말하고 싶습니다', FALSE, 1),
    (gen_random_uuid(), q_id, '일본어를 말해야 합니다', FALSE, 2),
    (gen_random_uuid(), q_id, '일본어를 말하고 있습니다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본어를 말할 수 있습니다', TRUE, 4);

  -- Q11: 〜前に/後で (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '寝る（　）に、歯を磨きます。', '「〜前に」は「~하기 전에」という意味で、時間的に先の動作を表します。動詞の辞書形＋前に の形で使います。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '前', TRUE, 1),
    (gen_random_uuid(), q_id, '後', FALSE, 2),
    (gen_random_uuid(), q_id, '間', FALSE, 3),
    (gen_random_uuid(), q_id, '中', FALSE, 4);

  -- Q12: 〜時 (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '日本に行く（　）、パスポートが必要です。', '「〜時」は「~할 때」という意味です。動詞の辞書形＋時 で「～する時」を表します。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'から', FALSE, 1),
    (gen_random_uuid(), q_id, '時', TRUE, 2),
    (gen_random_uuid(), q_id, 'ので', FALSE, 3),
    (gen_random_uuid(), q_id, 'まで', FALSE, 4);

  -- Q13: 〜ましょう (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「一緒に昼ごはんを食べましょう。」の「〜ましょう」は何を表しますか？', '「〜ましょう」は勧誘（誘い）を表す文型で、「~합시다」という意味です。相手を誘う時に使います。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '명령', FALSE, 1),
    (gen_random_uuid(), q_id, '부탁', FALSE, 2),
    (gen_random_uuid(), q_id, '권유 (~합시다)', TRUE, 3),
    (gen_random_uuid(), q_id, '금지', FALSE, 4);

  -- Q14: 〜でしょう (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '明日はたぶん雨が降る（　）。', '「〜でしょう」は推量を表し、「~일 것이다 / ~이겠지요」という意味です。「たぶん」と一緒に使われることが多いです。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ましょう', FALSE, 1),
    (gen_random_uuid(), q_id, 'ません', FALSE, 2),
    (gen_random_uuid(), q_id, 'でしょう', TRUE, 3),
    (gen_random_uuid(), q_id, 'ました', FALSE, 4);

  -- Q15: 〜つもり (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜つもりだ」は意志・予定を表し、動詞の辞書形に付きます。「来年、日本に行くつもりです」が正しい形です。「行ったつもり」は過去形で「行ったことにする」という別の意味になります。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '来年、日本に行きますつもりです。', FALSE, 1),
    (gen_random_uuid(), q_id, '来年、日本に行くつもりです。', TRUE, 2),
    (gen_random_uuid(), q_id, '来年、日本に行ってつもりです。', FALSE, 3),
    (gen_random_uuid(), q_id, '来年、日本に行くないつもりです。', FALSE, 4);

  -- Q16: 〜すぎる (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜すぎる」の意味として正しいものは？', '「〜すぎる」は程度が過度であることを表す文型で、「너무 ~하다」という意味です。動詞のます形や形容詞の語幹に付きます。例：「食べすぎる」＝「너무 많이 먹다」', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조금 ~하다', FALSE, 1),
    (gen_random_uuid(), q_id, '너무 ~하다', TRUE, 2),
    (gen_random_uuid(), q_id, '~하기 쉽다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하는 편이 좋다', FALSE, 4);

  -- Q17: 〜やすい (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「このアプリは使いやすいです。」の「〜やすい」の意味は？', '「〜やすい」は動作が容易であることを表す文型で、「~하기 쉽다」という意味です。動詞のます形の「ます」を取った形に付きます。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하기 어렵다', FALSE, 1),
    (gen_random_uuid(), q_id, '~하고 싶다', FALSE, 2),
    (gen_random_uuid(), q_id, '~하기 쉽다', TRUE, 3),
    (gen_random_uuid(), q_id, '~해야 한다', FALSE, 4);

  -- Q18: 〜ほうがいい (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '風邪を引いたなら、早く寝た（　）いいですよ。', '「〜たほうがいい」は助言・忠告を表す文型で、「~하는 편이 좋다」という意味です。動詞の過去形（た形）に「ほうがいい」を付けます。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'のが', FALSE, 1),
    (gen_random_uuid(), q_id, 'ほうが', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'ように', FALSE, 4);

  -- Q19: 〜たら (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '駅に着い（　）、電話してください。', '「〜たら」は条件を表す文型で、「~하면 / ~했더니」という意味です。動詞のた形に「ら」を付けます。「着いたら」で「도착하면」です。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ても', FALSE, 1),
    (gen_random_uuid(), q_id, 'てから', FALSE, 2),
    (gen_random_uuid(), q_id, 'たら', TRUE, 3),
    (gen_random_uuid(), q_id, 'ので', FALSE, 4);

  -- Q20: 〜ので (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜ので」は理由を表す接続助詞で、「~이므로 / ~이기 때문에」という意味です。丁寧で客観的な理由表現です。な形容詞・名詞には「なので」を付けます。「病気なので」が正しい形です。', 1, 20, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '病気だので、学校を休みました。', FALSE, 1),
    (gen_random_uuid(), q_id, '病気のので、学校を休みました。', FALSE, 2),
    (gen_random_uuid(), q_id, '病気なので、学校を休みました。', TRUE, 3),
    (gen_random_uuid(), q_id, '病気にので、学校を休みました。', FALSE, 4);
END $$;

-- ============================================
-- N4 文法クイズ (20 questions)
-- Grammar: たり〜たり, ながら, のに, ようにする, ことがある, し〜し, そうだ(伝聞), らしい, みたいだ, ておく, てある, ところだ, ようだ, かもしれない, はずだ, (ら)れる, (さ)せる, ように, てしまう, ために
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 〜たり〜たり (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「〜たり〜たりする」の意味として正しいものは？', '「〜たり〜たりする」は複数の動作を例示する文型で、「~하거나 ~하거나 하다」という意味です。いくつかの動作の中から代表的なものを挙げる時に使います。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하면서 ~하다', FALSE, 1),
    (gen_random_uuid(), q_id, '~하거나 ~하거나 하다', TRUE, 2),
    (gen_random_uuid(), q_id, '~한 후에 ~하다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하기 위해 ~하다', FALSE, 4);

  -- Q2: 〜ながら (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '音楽を聞き（　）、勉強します。', '「〜ながら」は二つの動作の同時進行を表します。動詞のます形の「ます」を取った形に付きます。「聞きながら」で「들으면서」という意味です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'たり', FALSE, 1),
    (gen_random_uuid(), q_id, 'ながら', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'のに', FALSE, 4);

  -- Q3: 〜のに (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「薬を飲んだのに、まだ頭が痛い。」の「のに」の意味は？', '「〜のに」は逆接・不満・意外性を表す接続助詞で、「~인데도 / ~했는데도」という意味です。期待に反する結果を述べる時に使います。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~이니까', FALSE, 1),
    (gen_random_uuid(), q_id, '~할 때', FALSE, 2),
    (gen_random_uuid(), q_id, '~했는데도', TRUE, 3),
    (gen_random_uuid(), q_id, '~하기 위해', FALSE, 4);

  -- Q4: 〜ようにする (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '毎日、コードを書く（　）にしています。', '「〜ようにする」は習慣化の努力を表す文型で、「~하도록 하다」という意味です。動詞の辞書形＋ようにする で使います。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ため', FALSE, 1),
    (gen_random_uuid(), q_id, 'こと', FALSE, 2),
    (gen_random_uuid(), q_id, 'よう', TRUE, 3),
    (gen_random_uuid(), q_id, 'はず', FALSE, 4);

  -- Q5: 〜ことがある (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「〜たことがある」の意味として正しいものは？', '「〜たことがある」は過去の経験を表す文型で、「~한 적이 있다」という意味です。動詞の過去形（た形）に付きます。', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~할 수 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '~하기로 했다', FALSE, 2),
    (gen_random_uuid(), q_id, '~하게 되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 적이 있다', TRUE, 4);

  -- Q6: 〜し〜し (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', 'この店は安い（　）、おいしい（　）、よく来ます。', '「〜し〜し」は理由の列挙を表す文型で、「~하기도 하고 ~하기도 하고」という意味です。複数の理由を並べる時に使います。', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'し、し', TRUE, 1),
    (gen_random_uuid(), q_id, 'たり、たり', FALSE, 2),
    (gen_random_uuid(), q_id, 'ながら、ながら', FALSE, 3),
    (gen_random_uuid(), q_id, 'から、から', FALSE, 4);

  -- Q7: 〜そうだ(伝聞) (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「来週、新しいプロジェクトが始まるそうです。」の「そうです」は何を表しますか？', '伝聞の「〜そうだ」は他の人から聞いた情報を伝える時に使います。「~라고 합니다 / ~라고 들었습니다」という意味です。動詞の普通形に付きます。', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자신의 추측', FALSE, 1),
    (gen_random_uuid(), q_id, '다른 사람에게 들은 정보 (전문)', TRUE, 2),
    (gen_random_uuid(), q_id, '외관으로 판단한 것', FALSE, 3),
    (gen_random_uuid(), q_id, '확실한 사실', FALSE, 4);

  -- Q8: 〜らしい (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', 'あの人は先生（　）。服装がとてもきちんとしている。', '「〜らしい」は根拠に基づく推量を表し、「~인 것 같다 / ~답다」という意味です。名詞に直接付けて使います。', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'みたい', FALSE, 1),
    (gen_random_uuid(), q_id, 'そうだ', FALSE, 2),
    (gen_random_uuid(), q_id, 'らしい', TRUE, 3),
    (gen_random_uuid(), q_id, 'ようだ', FALSE, 4);

  -- Q9: 〜みたいだ (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「彼は疲れているみたいだ。」の「みたいだ」の意味は？', '「〜みたいだ」は見た目や状況から判断した推量を表す口語的表現で、「~인 것 같다」という意味です。「ようだ」のカジュアルな表現です。', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~이다 (단정)', FALSE, 1),
    (gen_random_uuid(), q_id, '~인 것 같다 (추측)', TRUE, 2),
    (gen_random_uuid(), q_id, '~하려고 한다 (의지)', FALSE, 3),
    (gen_random_uuid(), q_id, '~이었다 (과거)', FALSE, 4);

  -- Q10: 〜ておく (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '会議の前に資料を準備し（　）。', '「〜ておく」は将来のために事前に行動する意味で、「~해 두다」に相当します。「準備しておく」で「준비해 두다」という意味です。', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'てある', FALSE, 1),
    (gen_random_uuid(), q_id, 'ている', FALSE, 2),
    (gen_random_uuid(), q_id, 'ておく', TRUE, 3),
    (gen_random_uuid(), q_id, 'てしまう', FALSE, 4);

  -- Q11: 〜てある (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「窓が開けてあります。」の「〜てある」は何を表しますか？', '「〜てある」は誰かが意図的にした行為の結果が残っている状態を表します。「~해져 있다 / ~해 놓여 있다」という意味です。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '현재 진행 중인 동작', FALSE, 1),
    (gen_random_uuid(), q_id, '미래를 위한 준비', FALSE, 2),
    (gen_random_uuid(), q_id, '자연스러운 상태', FALSE, 3),
    (gen_random_uuid(), q_id, '의도적 행위의 결과 상태', TRUE, 4);

  -- Q12: 〜ところだ (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '今からご飯を食べる（　）です。', '「〜ところだ」は動作の段階（直前・最中・直後）を表します。「食べるところだ」は「이제 막 먹으려는 참이다」で、動作の直前を表します。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ところ', TRUE, 1),
    (gen_random_uuid(), q_id, 'はず', FALSE, 2),
    (gen_random_uuid(), q_id, 'つもり', FALSE, 3),
    (gen_random_uuid(), q_id, 'わけ', FALSE, 4);

  -- Q13: 〜ようだ (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '外は寒い（　）。コートを着ている人が多い。', '「〜ようだ」は状況証拠に基づく推量を表し、「~인 것 같다」という意味です。観察した根拠を基に判断する時に使います。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そうだ', FALSE, 1),
    (gen_random_uuid(), q_id, 'ようだ', TRUE, 2),
    (gen_random_uuid(), q_id, 'らしい', FALSE, 3),
    (gen_random_uuid(), q_id, 'だろう', FALSE, 4);

  -- Q14: 〜かもしれない (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「〜かもしれない」の意味として正しいものは？', '「〜かもしれない」は不確実な推量を表す文型で、「~일지도 모른다」という意味です。確信度が低い推測に使います。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '~일지도 모른다', TRUE, 2),
    (gen_random_uuid(), q_id, '~임에 틀림없다', FALSE, 3),
    (gen_random_uuid(), q_id, '~할 수 없다', FALSE, 4);

  -- Q15: 〜はずだ (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜はずだ」は根拠のある確信を表す文型で、動詞の普通形に付きます。「田中さんはもう帰ったはずです」が正しい形です。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中さんはもう帰りますはずです。', FALSE, 1),
    (gen_random_uuid(), q_id, '田中さんはもう帰るのはずです。', FALSE, 2),
    (gen_random_uuid(), q_id, '田中さんはもう帰ったはずです。', TRUE, 3),
    (gen_random_uuid(), q_id, '田中さんはもう帰ってはずです。', FALSE, 4);

  -- Q16: 〜(ら)れる (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「先生に褒められました。」の「〜られる」は何を表しますか？', '「〜(ら)れる」は受身を表す助動詞で、「~당하다 / ~받다 / ~되다」という意味です。この文では「칭찬받았습니다」で受身を表しています。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가능 (~할 수 있다)', FALSE, 1),
    (gen_random_uuid(), q_id, '수동 (~받다/~되다)', TRUE, 2),
    (gen_random_uuid(), q_id, '사역 (~시키다)', FALSE, 3),
    (gen_random_uuid(), q_id, '존경 (~하시다)', FALSE, 4);

  -- Q17: 〜(さ)せる (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '「〜(さ)せる」の意味として正しいものは？', '「〜(さ)せる」は使役を表す助動詞で、「~시키다 / ~하게 하다」という意味です。他の人に動作を行わせる時に使います。例：「子どもに野菜を食べさせる」＝「아이에게 야채를 먹게 하다」', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~되다 (수동)', FALSE, 1),
    (gen_random_uuid(), q_id, '~하게 하다 (사역)', TRUE, 2),
    (gen_random_uuid(), q_id, '~할 수 있다 (가능)', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶다 (희망)', FALSE, 4);

  -- Q18: 〜ように (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', 'テストに合格できる（　）、毎日勉強しています。', '「〜ように」は目的を表す文型で、可能動詞や状態動詞と一緒に使います。「~하도록 / ~할 수 있게」という意味です。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ために', FALSE, 1),
    (gen_random_uuid(), q_id, 'ように', TRUE, 2),
    (gen_random_uuid(), q_id, 'ことに', FALSE, 3),
    (gen_random_uuid(), q_id, 'のに', FALSE, 4);

  -- Q19: 〜てしまう (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '電車の中で寝（　）、終点まで行ってしまいました。', '「〜てしまう」は完了や後悔・残念な気持ちを表す文型で、「~해 버리다」という意味です。「寝てしまう」で「자 버리다」です。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'てしまい', TRUE, 1),
    (gen_random_uuid(), q_id, 'ておき', FALSE, 2),
    (gen_random_uuid(), q_id, 'てあり', FALSE, 3),
    (gen_random_uuid(), q_id, 'ていき', FALSE, 4);

  -- Q20: 〜ために (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜ために」は目的を表す文型で、意志動詞の辞書形に付きます。「日本で働くために、日本語を勉強しています」が正しい形です。「ために」の前は辞書形を使います。', 1, 20, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本で働いたために、日本語を勉強しています。', FALSE, 1),
    (gen_random_uuid(), q_id, '日本で働くために、日本語を勉強しています。', TRUE, 2),
    (gen_random_uuid(), q_id, '日本で働きますために、日本語を勉強しています。', FALSE, 3),
    (gen_random_uuid(), q_id, '日本で働いてために、日本語を勉強しています。', FALSE, 4);
END $$;

-- ============================================
-- N3 文法クイズ (20 questions)
-- Grammar: てもいい, なければならない, ようにする, ことにする, ために, たばかり, そうだ(様態), てしまう, ようになる, はずだ, ことになる, わけだ, ばいい, ほどだ, ことはない, わけだ, からこそ, に対して, おかげで, べきだ
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 〜てもいい (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「〜てもいい」の意味として正しいものは？', '「〜てもいい」は許可を表す文型で、「~해도 된다」という意味です。動詞のて形に付きます。例：「ここに座ってもいいですか？」', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해도 된다', TRUE, 1),
    (gen_random_uuid(), q_id, '~하면 안 된다', FALSE, 2),
    (gen_random_uuid(), q_id, '~해야만 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶다', FALSE, 4);

  -- Q2: 〜なければならない (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '会議の資料は明日まで（　）ならない。', '「〜なければならない」は義務を表す文型で、「~하지 않으면 안 된다 / ~해야 한다」という意味です。「準備しなければならない」で「준비하지 않으면 안 된다」です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '準備しても', FALSE, 1),
    (gen_random_uuid(), q_id, '準備しなければ', TRUE, 2),
    (gen_random_uuid(), q_id, '準備しないで', FALSE, 3),
    (gen_random_uuid(), q_id, '準備しようと', FALSE, 4);

  -- Q3: 〜ようにする (적절한 문법 선택 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', 'バグを減らす（　）にして、コードレビューを行っています。', '「〜ようにする」は努力や習慣的な取り組みを表します。「バグを減らすようにする」で「버그를 줄이도록 하다」という意味です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ため', FALSE, 1),
    (gen_random_uuid(), q_id, 'こと', FALSE, 2),
    (gen_random_uuid(), q_id, 'もの', FALSE, 3),
    (gen_random_uuid(), q_id, 'よう', TRUE, 4);

  -- Q4: 〜ことにする (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「来月から毎日運動することにしました。」の「ことにする」は何を表しますか？', '「〜ことにする」は自分の意志による決定を表す文型で、「~하기로 하다」という意味です。自分で決断した時に使います。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '습관이 되었다', FALSE, 1),
    (gen_random_uuid(), q_id, '자신의 의지로 결정했다', TRUE, 2),
    (gen_random_uuid(), q_id, '다른 사람이 결정했다', FALSE, 3),
    (gen_random_uuid(), q_id, '자연스럽게 그렇게 되었다', FALSE, 4);

  -- Q5: 〜ために (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', 'スキルアップの（　）、毎日プログラミングの勉強をしています。', '「〜ために」は目的を表す文型で、「~하기 위해」という意味です。名詞＋の＋ために の形で使います。', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ように', FALSE, 1),
    (gen_random_uuid(), q_id, 'ために', TRUE, 2),
    (gen_random_uuid(), q_id, 'ことに', FALSE, 3),
    (gen_random_uuid(), q_id, 'ところに', FALSE, 4);

  -- Q6: 〜たばかり (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「さっき昼ご飯を食べたばかりです。」の「〜たばかり」は何を表しますか？', '「〜たばかり」は動作が完了して間もないことを表す文型で、「~한 지 얼마 안 되다 / 막 ~했다」という意味です。', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '오래전에 한 동작', FALSE, 1),
    (gen_random_uuid(), q_id, '지금 하고 있는 동작', FALSE, 2),
    (gen_random_uuid(), q_id, '막 완료한 동작', TRUE, 3),
    (gen_random_uuid(), q_id, '아직 하지 않은 동작', FALSE, 4);

  -- Q7: 〜そうだ(様態) (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', 'このケーキはおいし（　）ですね。', '様態の「〜そうだ」は見た目からの判断を表し、「~할 것 같다 / ~해 보인다」という意味です。い形容詞の場合は「い」を取って「そうだ」を付けます。「おいしそうだ」で「맛있어 보인다」です。', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いそう', FALSE, 1),
    (gen_random_uuid(), q_id, 'くそう', FALSE, 2),
    (gen_random_uuid(), q_id, 'そう', TRUE, 3),
    (gen_random_uuid(), q_id, 'さそう', FALSE, 4);

  -- Q8: 〜てしまう (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「大切なファイルを消してしまいました。」の「〜てしまう」は何を表しますか？', '「〜てしまう」は①完了、または②残念・後悔の気持ちを表します。この文では大切なファイルを消したことへの後悔を表しています。「~해 버리다」に相当します。', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기쁨', FALSE, 1),
    (gen_random_uuid(), q_id, '후회·유감', TRUE, 2),
    (gen_random_uuid(), q_id, '희망', FALSE, 3),
    (gen_random_uuid(), q_id, '추측', FALSE, 4);

  -- Q9: 〜ようになる (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '練習を続けて、日本語が話せる（　）なりました。', '「〜ようになる」は変化の結果を表す文型で、「~하게 되다」という意味です。能力や状態の変化を表す時に使います。', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ことに', FALSE, 1),
    (gen_random_uuid(), q_id, 'ように', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'ところに', FALSE, 4);

  -- Q10: 〜はずだ (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '彼は毎日練習しているから、上手な（　）です。', '「〜はずだ」は根拠に基づく確信を表す文型で、「~일 것이다 / ~임에 틀림없다」という意味です。論理的な根拠がある時に使います。', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'わけ', FALSE, 1),
    (gen_random_uuid(), q_id, 'もの', FALSE, 2),
    (gen_random_uuid(), q_id, 'はず', TRUE, 3),
    (gen_random_uuid(), q_id, 'こと', FALSE, 4);

  -- Q11: 〜ことになる (의미 선택 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「来月から東京のオフィスに転勤することになりました。」の「ことになる」は何を表しますか？', '「〜ことになる」は自分以外の決定や自然な成り行きで決まったことを表します。「~하게 되었다」という意味で、会社の人事異動など外部の決定に使います。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자신이 결정한 것', FALSE, 1),
    (gen_random_uuid(), q_id, '외부 요인에 의해 결정된 것', TRUE, 2),
    (gen_random_uuid(), q_id, '아직 결정되지 않은 것', FALSE, 3),
    (gen_random_uuid(), q_id, '과거에 결정된 것이 취소된 것', FALSE, 4);

  -- Q12: 〜わけだ (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '毎日3時間勉強している。それなら上手になる（　）だ。', '「〜わけだ」は論理的な帰結・納得を表す文型で、「~인 셈이다 / 그러니까 ~인 것이다」という意味です。前の情報から当然の結論を導く時に使います。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'はず', FALSE, 1),
    (gen_random_uuid(), q_id, 'つもり', FALSE, 2),
    (gen_random_uuid(), q_id, 'わけ', TRUE, 3),
    (gen_random_uuid(), q_id, 'ところ', FALSE, 4);

  -- Q13: 〜ばいい (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', 'パスワードを忘れた時は、リセットボタンを（　）いい。', '「〜ばいい」は助言や提案を表す文型で、「~하면 된다」という意味です。「押せばいい」で「누르면 된다」です。動詞の仮定形（ば形）に付きます。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '押しては', FALSE, 1),
    (gen_random_uuid(), q_id, '押すと', FALSE, 2),
    (gen_random_uuid(), q_id, '押したら', FALSE, 3),
    (gen_random_uuid(), q_id, '押せば', TRUE, 4);

  -- Q14: 〜ほどだ (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「涙が出るほど嬉しかった。」の「〜ほど」は何を表しますか？', '「〜ほどだ」は程度を強調する表現で、「~할 정도로」という意味です。「涙が出るほど」で「눈물이 날 정도로」です。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정도·수준의 강조', TRUE, 1),
    (gen_random_uuid(), q_id, '이유', FALSE, 2),
    (gen_random_uuid(), q_id, '조건', FALSE, 3),
    (gen_random_uuid(), q_id, '시간', FALSE, 4);

  -- Q15: 〜ことはない (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜ことはない」は「~할 필요는 없다」という意味で、不必要を表します。動詞の辞書形＋ことはない の形で使います。「そんなに心配することはない」が正しい形です。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そんなに心配するのことはない。', FALSE, 1),
    (gen_random_uuid(), q_id, 'そんなに心配したことはない。', FALSE, 2),
    (gen_random_uuid(), q_id, 'そんなに心配することはない。', TRUE, 3),
    (gen_random_uuid(), q_id, 'そんなに心配しますことはない。', FALSE, 4);

  -- Q16: 〜わけだ (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「彼は10年間日本に住んでいた。日本語が上手なわけだ。」の「〜わけだ」は何を表しますか？', '「〜わけだ」は論理的な帰結・納得を表す文型で、「~인 셈이다 / 그러니까 ~인 것이다」という意味です。前の事実から当然の結論を導きます。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '추측 (~일 것이다)', FALSE, 1),
    (gen_random_uuid(), q_id, '납득·당연한 귀결 (~인 셈이다)', TRUE, 2),
    (gen_random_uuid(), q_id, '의무 (~해야 한다)', FALSE, 3),
    (gen_random_uuid(), q_id, '전문 (~라고 한다)', FALSE, 4);

  -- Q17: 〜からこそ (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '「あなたのことが大切だからこそ、厳しく言うのです。」の「〜からこそ」の意味は？', '「〜からこそ」は理由を強調する文型で、「~이기 때문에야말로 / 바로 ~이니까」という意味です。「まさにその理由だからこそ」という強い因果関係を示します。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~임에도 불구하고', FALSE, 1),
    (gen_random_uuid(), q_id, '~이기 때문에야말로 (이유 강조)', TRUE, 2),
    (gen_random_uuid(), q_id, '~할 뿐만 아니라', FALSE, 3),
    (gen_random_uuid(), q_id, '~하는 대신에', FALSE, 4);

  -- Q18: 〜に対して (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', 'お客様（　）、丁寧な言葉遣いを心がけてください。', '「〜に対して」は対象を示す文型で、「~에 대해서」という意味です。動作や態度の対象を明示する時に使います。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'について', FALSE, 1),
    (gen_random_uuid(), q_id, 'にとって', FALSE, 2),
    (gen_random_uuid(), q_id, 'に対して', TRUE, 3),
    (gen_random_uuid(), q_id, 'に関して', FALSE, 4);

  -- Q19: 〜おかげで (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '先輩が教えてくれた（　）、プロジェクトを無事に終えることができました。', '「〜おかげで」は良い結果の原因・感謝を表す文型で、「~덕분에」という意味です。ポジティブな結果に対して使います。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'せいで', FALSE, 1),
    (gen_random_uuid(), q_id, 'おかげで', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'ばかりに', FALSE, 4);

  -- Q20: 〜べきだ (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜べきだ」は義務・当然を表す文型で、「~해야 한다」という意味です。動詞の辞書形に付きます。ただし「する」は「すべきだ」という形もあります。「報告するべきだ」が正しい形です。', 1, 20, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '問題があったら、すぐに報告しますべきだ。', FALSE, 1),
    (gen_random_uuid(), q_id, '問題があったら、すぐに報告するべきだ。', TRUE, 2),
    (gen_random_uuid(), q_id, '問題があったら、すぐに報告したべきだ。', FALSE, 3),
    (gen_random_uuid(), q_id, '問題があったら、すぐに報告してべきだ。', FALSE, 4);
END $$;

-- ============================================
-- N2 文法クイズ (20 questions)
-- Grammar: にもかかわらず, わけにはいかない, ばかりだ, ばかりか〜も, とともに, がたい, なり〜なり, べき, ものの, に基づいて, 一方だ, に反して, 上で, としても, にしたがって, というより, 一方で, に伴い, 次第, 上で
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 〜にもかかわらず (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「〜にもかかわらず」の意味として正しいものは？', '「〜にもかかわらず」は逆接を強調する表現で、「~임에도 불구하고」という意味です。期待に反する結果を強く述べる時に使います。', 1, 1, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~이기 때문에', FALSE, 1),
    (gen_random_uuid(), q_id, '~임에도 불구하고', TRUE, 2),
    (gen_random_uuid(), q_id, '~에 따라서', FALSE, 3),
    (gen_random_uuid(), q_id, '~와 함께', FALSE, 4);

  -- Q2: 〜わけにはいかない (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '納期が迫っているので、休む（　）。', '「〜わけにはいかない」は社会的・道義的理由でできないことを表す文型で、「~할 수는 없다」という意味です。「休むわけにはいかない」で「쉴 수는 없다」です。', 1, 2, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ことはない', FALSE, 1),
    (gen_random_uuid(), q_id, 'はずがない', FALSE, 2),
    (gen_random_uuid(), q_id, 'わけにはいかない', TRUE, 3),
    (gen_random_uuid(), q_id, 'ものではない', FALSE, 4);

  -- Q3: 〜ばかりだ (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「最近、物価が上がるばかりだ。」の「ばかりだ」は何を表しますか？', '「〜ばかりだ」は一方的な変化の進行を表し、「~하기만 하다 / 계속 ~하다」という意味です。悪い方向への変化に使われることが多いです。', 1, 3, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '막 ~했다', FALSE, 1),
    (gen_random_uuid(), q_id, '~뿐이다', FALSE, 2),
    (gen_random_uuid(), q_id, '계속 한 방향으로 진행', TRUE, 3),
    (gen_random_uuid(), q_id, '~한 적이 있다', FALSE, 4);

  -- Q4: 〜ばかりか〜も (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '彼は英語（　）、フランス語も話せる。', '「〜ばかりか〜も」は「〜だけでなく〜も」を強調する表現で、「~뿐만 아니라 ~도」という意味です。', 1, 4, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'だけか', FALSE, 1),
    (gen_random_uuid(), q_id, 'しか', FALSE, 2),
    (gen_random_uuid(), q_id, 'ばかりか', TRUE, 3),
    (gen_random_uuid(), q_id, 'までか', FALSE, 4);

  -- Q5: 〜とともに (의미 선택 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「技術の進歩とともに、新しい課題も生まれている。」の「とともに」の意味は？', '「〜とともに」は「〜と一緒に/〜に伴って」を表す文型で、「~와 함께 / ~에 따라」という意味です。同時変化を表します。', 1, 5, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 반해서', FALSE, 1),
    (gen_random_uuid(), q_id, '~에도 불구하고', FALSE, 2),
    (gen_random_uuid(), q_id, '~에 따라 / ~와 함께', TRUE, 3),
    (gen_random_uuid(), q_id, '~의 결과로', FALSE, 4);

  -- Q6: 〜がたい (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'この問題の原因は理解し（　）。', '「〜がたい」は心理的・感情的に困難であることを表す文型で、「~하기 어렵다」という意味です。動詞のます形の「ます」を取った形に付きます。', 1, 6, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にくい', FALSE, 1),
    (gen_random_uuid(), q_id, 'づらい', FALSE, 2),
    (gen_random_uuid(), q_id, 'かねる', FALSE, 3),
    (gen_random_uuid(), q_id, 'がたい', TRUE, 4);

  -- Q7: 〜なり〜なり (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'わからないことがあったら、先輩に聞く（　）ネットで調べる（　）してください。', '「〜なり〜なり」は選択肢を例示する文型で、「~하든지 ~하든지」という意味です。「AなりBなりする」で「A든 B든 하다」です。', 1, 7, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'とか、とか', FALSE, 1),
    (gen_random_uuid(), q_id, 'なり、なり', TRUE, 2),
    (gen_random_uuid(), q_id, 'たり、たり', FALSE, 3),
    (gen_random_uuid(), q_id, 'やら、やら', FALSE, 4);

  -- Q8: 〜べき (의미 선택 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「セキュリティ対策は常に最新にするべきだ。」の「〜べきだ」は何を表しますか？', '「〜べきだ」は義務・当然を表す文型で、「~해야 한다 / ~하는 것이 당연하다」という意味です。社会的な規範や道義的な義務に使います。', 1, 8, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '의무·당연 (~해야 한다)', TRUE, 1),
    (gen_random_uuid(), q_id, '가능 (~할 수 있다)', FALSE, 2),
    (gen_random_uuid(), q_id, '추측 (~일 것이다)', FALSE, 3),
    (gen_random_uuid(), q_id, '희망 (~하고 싶다)', FALSE, 4);

  -- Q9: 〜ものの (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'プログラミングの本を買った（　）、まだ読んでいない。', '「〜ものの」は逆接を表す書き言葉的な表現で、「~했지만 / ~이긴 하지만」という意味です。「〜けれど」のフォーマルな表現です。', 1, 9, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ものの', TRUE, 1),
    (gen_random_uuid(), q_id, 'ものだ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ものか', FALSE, 3),
    (gen_random_uuid(), q_id, 'ものを', FALSE, 4);

  -- Q10: 〜に基づいて (의미 선택 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「要件定義書に基づいて、システムを開発します。」の「に基づいて」の意味は？', '「〜に基づいて」は根拠や基準を示す文型で、「~에 근거하여 / ~에 기반하여」という意味です。', 1, 10, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 반하여', FALSE, 1),
    (gen_random_uuid(), q_id, '~에 관하여', FALSE, 2),
    (gen_random_uuid(), q_id, '~에 대하여', FALSE, 3),
    (gen_random_uuid(), q_id, '~에 근거하여', TRUE, 4);

  -- Q11: 〜一方だ (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'IT業界の人手不足は深刻になる（　）だ。', '「〜一方だ」は一方的な変化の継続を表す文型で、「~하기만 하다 / 계속 ~해지다」という意味です。「ばかりだ」と似ていますが、より書き言葉的です。', 1, 11, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '一方', TRUE, 1),
    (gen_random_uuid(), q_id, '一度', FALSE, 2),
    (gen_random_uuid(), q_id, '一番', FALSE, 3),
    (gen_random_uuid(), q_id, '一体', FALSE, 4);

  -- Q12: 〜に反して (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「予想に反して、プロジェクトは成功した。」の「に反して」は何を表しますか？', '「〜に反して」は期待や予想と反対の結果を表す文型で、「~에 반하여 / ~와 달리」という意味です。', 1, 12, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 따라서', FALSE, 1),
    (gen_random_uuid(), q_id, '~에 반하여', TRUE, 2),
    (gen_random_uuid(), q_id, '~에 근거하여', FALSE, 3),
    (gen_random_uuid(), q_id, '~와 함께', FALSE, 4);

  -- Q13: 〜上で (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '仕様書をよく読んだ（　）で、コーディングを始めてください。', '「〜上で」は「〜した後で / 〜してから」を表す文型で、「~한 후에 / ~한 다음에」という意味です。先行動作の完了を前提とします。', 1, 13, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '後', FALSE, 1),
    (gen_random_uuid(), q_id, '上', TRUE, 2),
    (gen_random_uuid(), q_id, '前', FALSE, 3),
    (gen_random_uuid(), q_id, '中', FALSE, 4);

  -- Q14: 〜としても (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '仮に締め切りを延ばした（　）、品質が上がるとは限らない。', '「〜としても」は仮定の逆接を表す文型で、「~한다고 해도 / ~라고 해도」という意味です。仮定の状況でも結果が変わらないことを表します。', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にしても', FALSE, 1),
    (gen_random_uuid(), q_id, 'としても', TRUE, 2),
    (gen_random_uuid(), q_id, 'からしても', FALSE, 3),
    (gen_random_uuid(), q_id, 'としたら', FALSE, 4);

  -- Q15: 〜にしたがって (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜にしたがって」は変化の連動を表す文型で、「~에 따라」という意味です。動詞の辞書形＋にしたがって の形で使います。「経験が増えるにしたがって」が正しい形です。', 1, 15, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '経験が増えたにしたがって、仕事が楽になった。', FALSE, 1),
    (gen_random_uuid(), q_id, '経験が増えるのにしたがって、仕事が楽になった。', FALSE, 2),
    (gen_random_uuid(), q_id, '経験が増えますにしたがって、仕事が楽になった。', FALSE, 3),
    (gen_random_uuid(), q_id, '経験が増えるにしたがって、仕事が楽になった。', TRUE, 4);

  -- Q16: 〜というより (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「彼は優秀というより、努力家だと思う。」の「〜というより」の意味は？', '「〜というより」は前の表現を訂正・修正してより適切な表現を提示する文型で、「~라기보다는」という意味です。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~뿐만 아니라', FALSE, 1),
    (gen_random_uuid(), q_id, '~라기보다는', TRUE, 2),
    (gen_random_uuid(), q_id, '~에 의하면', FALSE, 3),
    (gen_random_uuid(), q_id, '~와 마찬가지로', FALSE, 4);

  -- Q17: 〜一方で (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '「AIは便利な一方で、倫理的な問題も多い。」の「〜一方で」は何を表しますか？', '「〜一方で」は対比を表す文型で、「~하는 한편 / ~하는 반면에」という意味です。二つの対照的な側面を並べる時に使います。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이유 (~이기 때문에)', FALSE, 1),
    (gen_random_uuid(), q_id, '대비 (~하는 반면에)', TRUE, 2),
    (gen_random_uuid(), q_id, '조건 (~하면)', FALSE, 3),
    (gen_random_uuid(), q_id, '결과 (~한 결과)', FALSE, 4);

  -- Q18: 〜に伴い (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ユーザー数の増加（　）、サーバーの増強が必要となった。', '「〜に伴い」は変化に連動する別の変化を表す文型で、「~에 따라 / ~에 수반하여」という意味です。フォーマルな場面で使います。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'に関して', FALSE, 1),
    (gen_random_uuid(), q_id, 'に対して', FALSE, 2),
    (gen_random_uuid(), q_id, 'に伴い', TRUE, 3),
    (gen_random_uuid(), q_id, 'に基づき', FALSE, 4);

  -- Q19: 〜次第 (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'テストが完了し（　）、結果をご報告いたします。', '「〜次第」は「〜したらすぐに」を表す文型で、「~하는 대로」という意味です。動詞のます形の「ます」を取った形に付きます。ビジネス場面でよく使います。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '次第', TRUE, 1),
    (gen_random_uuid(), q_id, '上で', FALSE, 2),
    (gen_random_uuid(), q_id, 'からには', FALSE, 3),
    (gen_random_uuid(), q_id, '限り', FALSE, 4);

  -- Q20: 〜上で (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜上で」は「〜する際に / 〜するにあたって」を表す文型で、「~하는 데 있어서 / ~할 때」という意味です。「契約する上で」が正しい形です。動詞の辞書形＋上で の形で使います。', 1, 20, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '契約します上で、注意すべき点がいくつかあります。', FALSE, 1),
    (gen_random_uuid(), q_id, '契約した上で、注意すべき点がいくつかあります。', FALSE, 2),
    (gen_random_uuid(), q_id, '契約する上で、注意すべき点がいくつかあります。', TRUE, 3),
    (gen_random_uuid(), q_id, '契約して上で、注意すべき点がいくつかあります。', FALSE, 4);
END $$;

-- ============================================
-- N1 文法クイズ (20 questions)
-- Grammar: をもって, たりとも〜ない, んがために, を余儀なくされる, ともなると, 以上は, とあって, にしてみれば, ゆえに, ないまでも, をおいて〜ない, ずにはいられない, にほかならない, をものともせず, てやまない, なり, ならでは, あっての, ずにはいられない, にほかならない
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q1: 〜をもって (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「本日をもって、このサービスを終了いたします。」の「をもって」の意味は？', '「〜をもって」は期限・手段を示す格式高い表現で、「~을/를 가지고 / ~으로써」という意味です。この文では期限（「이것을 끝으로」）を表しています。', 1, 1, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 대해서', FALSE, 1),
    (gen_random_uuid(), q_id, '~을/를 끝으로 / ~으로써', TRUE, 2),
    (gen_random_uuid(), q_id, '~에 의하면', FALSE, 3),
    (gen_random_uuid(), q_id, '~에 관해서', FALSE, 4);

  -- Q2: 〜たりとも〜ない (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'セキュリティに関しては、一瞬（　）油断してはならない。', '「〜たりとも〜ない」は「ほんの少しでも〜ない」を表す強調表現で、「~조차도 ~없다 / ~라도 ~안 된다」という意味です。', 1, 2, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'でさえ', FALSE, 1),
    (gen_random_uuid(), q_id, 'ばかり', FALSE, 2),
    (gen_random_uuid(), q_id, 'たりとも', TRUE, 3),
    (gen_random_uuid(), q_id, 'だけでも', FALSE, 4);

  -- Q3: 〜んがために (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「〜んがために」の意味として正しいものは？', '「〜んがために」は目的を表す文語的な表現で、「~하기 위해서」という強い意志を伴う目的表現です。「ために」よりも格式が高く、強い決意を示します。', 1, 3, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~한 결과', FALSE, 1),
    (gen_random_uuid(), q_id, '~했음에도 불구하고', FALSE, 2),
    (gen_random_uuid(), q_id, '~하기 위해서 (강한 의지)', TRUE, 3),
    (gen_random_uuid(), q_id, '~하는 도중에', FALSE, 4);

  -- Q4: 〜を余儀なくされる (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'サーバー障害により、システムの全面停止を（　）。', '「〜を余儀なくされる」は外部の力によって仕方なくそうせざるを得ない状態を表す文型で、「~을/를 어쩔 수 없이 하게 되다」という意味です。', 1, 4, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '禁じ得ない', FALSE, 1),
    (gen_random_uuid(), q_id, '余儀なくされた', TRUE, 2),
    (gen_random_uuid(), q_id, 'ものともしなかった', FALSE, 3),
    (gen_random_uuid(), q_id, '限りではなかった', FALSE, 4);

  -- Q5: 〜ともなると (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「プロジェクトリーダーともなると、技術力だけでなくマネジメント力も求められる。」の「ともなると」は何を表しますか？', '「〜ともなると」は「〜のような立場/レベルになると」を表す文型で、「~정도가 되면 / ~쯤 되면」という意味です。高い立場や程度に達した場合の当然の結果を述べます。', 1, 5, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~라고 해도', FALSE, 1),
    (gen_random_uuid(), q_id, '~이기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '~에도 불구하고', FALSE, 3),
    (gen_random_uuid(), q_id, '~정도가 되면 (당연히)', TRUE, 4);

  -- Q6: 〜以上は (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'エンジニアとして働く（　）、常に新しい技術を学ぶ必要がある。', '「〜以上は」は「〜からには」と同様に、前提条件から当然の帰結を述べる文型で、「~하는 이상은 / ~한 이상은」という意味です。', 1, 6, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '以上は', TRUE, 1),
    (gen_random_uuid(), q_id, '上では', FALSE, 2),
    (gen_random_uuid(), q_id, '以来は', FALSE, 3),
    (gen_random_uuid(), q_id, '以外は', FALSE, 4);

  -- Q7: 〜とあって (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「新製品の発表会とあって、会場は満員だった。」の「とあって」の意味は？', '「〜とあって」は特別な事情・理由を表す文型で、「~인 만큼 / ~이라서」という意味です。特殊な状況が理由であることを示します。', 1, 7, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에도 불구하고', FALSE, 1),
    (gen_random_uuid(), q_id, '~인 만큼 / ~이라서 (특별한 사정)', TRUE, 2),
    (gen_random_uuid(), q_id, '~와 달리', FALSE, 3),
    (gen_random_uuid(), q_id, '~에 의하면', FALSE, 4);

  -- Q8: 〜にしてみれば (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'クライアント（　）、納期の延長は受け入れがたいだろう。', '「〜にしてみれば」は他者の立場に立った推量を表す文型で、「~의 입장에서 보면」という意味です。他人の視点から考える時に使います。', 1, 8, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'としたら', FALSE, 1),
    (gen_random_uuid(), q_id, 'にとって', FALSE, 2),
    (gen_random_uuid(), q_id, 'にしてみれば', TRUE, 3),
    (gen_random_uuid(), q_id, 'からすると', FALSE, 4);

  -- Q9: 〜ゆえに (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「〜ゆえに」の意味として正しいものは？', '「〜ゆえに」は原因・理由を表す文語的な表現で、「~이기 때문에 / ~인 고로」という意味です。「から」「ので」の格式高い表現です。', 1, 9, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~임에도 불구하고', FALSE, 1),
    (gen_random_uuid(), q_id, '~이기 때문에 (격식체)', TRUE, 2),
    (gen_random_uuid(), q_id, '~하는 한', FALSE, 3),
    (gen_random_uuid(), q_id, '~에 의하면', FALSE, 4);

  -- Q10: 〜ないまでも (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '完璧では（　）、最低限の品質は保証すべきだ。', '「〜ないまでも」は「〜とまではいかなくても」を表す文型で、「~하지는 않더라도 / ~까지는 아니더라도」という意味です。', 1, 10, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ないとしても', FALSE, 1),
    (gen_random_uuid(), q_id, 'なくても', FALSE, 2),
    (gen_random_uuid(), q_id, 'ないまでも', TRUE, 3),
    (gen_random_uuid(), q_id, 'ないからには', FALSE, 4);

  -- Q11: 〜をおいて〜ない (적절한 문법 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'このプロジェクトを任せられるのは、彼女（　）他にいない。', '「〜をおいて〜ない」は「〜以外に〜ない」を表す強調表現で、「~을/를 제외하고는 ~없다」という意味です。唯一の存在を強調します。', 1, 11, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'をもって', FALSE, 1),
    (gen_random_uuid(), q_id, 'をおいて', TRUE, 2),
    (gen_random_uuid(), q_id, 'をよそに', FALSE, 3),
    (gen_random_uuid(), q_id, 'をはじめ', FALSE, 4);

  -- Q12: 〜ずにはいられない (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「その美しいコードを見て、感心せずにはいられなかった。」の「〜ずにはいられない」は何を表しますか？', '「〜ずにはいられない」は自然と抑えられない感情や衝動を表す文型で、「~하지 않을 수 없다 / 저절로 ~하게 된다」という意味です。', 1, 12, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하지 않아도 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '하지 않으면 안 된다 (의무)', FALSE, 2),
    (gen_random_uuid(), q_id, '하지 않을 수 없다 (자연스러운 감정)', TRUE, 3),
    (gen_random_uuid(), q_id, '하지 않는 편이 좋다', FALSE, 4);

  -- Q13: 〜にほかならない (빈칸 채우기 - IT 직장 맥락)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'このプロジェクトの成功は、チーム全員の努力の結果（　）。', '「〜にほかならない」は断定・強調を表す文型で、「~에 다름 아니다 / 바로 ~이다」という意味です。「まさに〜だ」という強い断定です。', 1, 13, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'に限らない', FALSE, 1),
    (gen_random_uuid(), q_id, 'に過ぎない', FALSE, 2),
    (gen_random_uuid(), q_id, 'にほかならない', TRUE, 3),
    (gen_random_uuid(), q_id, 'に相違ない', FALSE, 4);

  -- Q14: 〜をものともせず (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「数々の困難をものともせず、プロジェクトを完成させた。」の「をものともせず」は何を表しますか？', '「〜をものともせず」は困難や障害を気にせず立ち向かうことを表す文型で、「~을/를 아랑곳하지 않고 / ~에 굴하지 않고」という意味です。', 1, 14, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~을/를 아랑곳하지 않고', TRUE, 1),
    (gen_random_uuid(), q_id, '~을/를 바탕으로', FALSE, 2),
    (gen_random_uuid(), q_id, '~을/를 계기로', FALSE, 3),
    (gen_random_uuid(), q_id, '~을/를 비롯하여', FALSE, 4);

  -- Q15: 〜てやまない (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜てやまない」は強い感情が止まらないことを表す文型で、「~하여 마지않다 / 진심으로 ~하다」という意味です。動詞のて形に付きます。「皆様のご成功を願ってやみません」が正しい形です。', 1, 15, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '皆様のご成功を願いてやみません。', FALSE, 1),
    (gen_random_uuid(), q_id, '皆様のご成功を願うてやみません。', FALSE, 2),
    (gen_random_uuid(), q_id, '皆様のご成功を願ってやみません。', TRUE, 3),
    (gen_random_uuid(), q_id, '皆様のご成功を願ったてやみません。', FALSE, 4);

  -- Q16: 〜なり (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「家に帰るなり、倒れてしまった。」の「〜なり」の意味は？', '「〜なり」は「〜するとすぐに」を表す文型で、「~하자마자」という意味です。前の動作が終わった直後に次の動作が起こることを示します。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하든지 (선택)', FALSE, 1),
    (gen_random_uuid(), q_id, '~하자마자 (즉시)', TRUE, 2),
    (gen_random_uuid(), q_id, '~하면서 (동시)', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 결과 (결과)', FALSE, 4);

  -- Q17: 〜ならでは (의미 선택)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '「〜ならでは」の意味として正しいものは？', '「〜ならでは」は「〜だからこそできる / 〜でなければできない」を表す文型で、「~만의 / ~이 아니면 안 되는」という意味です。その対象の独自性・特別さを強調します。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에도 불구하고', FALSE, 1),
    (gen_random_uuid(), q_id, '~만의 / ~이 아니면 안 되는', TRUE, 2),
    (gen_random_uuid(), q_id, '~에 의하면', FALSE, 3),
    (gen_random_uuid(), q_id, '~와 상관없이', FALSE, 4);

  -- Q18: 〜あっての (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'チームメンバー（　）プロジェクトの成功だと実感しています。', '「〜あっての」は「〜があるからこその」を表す文型で、「~이 있어야만 가능한」という意味です。何かの存在が不可欠であることを強調します。', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'による', FALSE, 1),
    (gen_random_uuid(), q_id, 'あっての', TRUE, 2),
    (gen_random_uuid(), q_id, 'としての', FALSE, 3),
    (gen_random_uuid(), q_id, 'にとっての', FALSE, 4);

  -- Q19: 〜ずにはいられない (빈칸 채우기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'あの映画のラストシーンには、涙を流さ（　）いられなかった。', '「〜ずにはいられない」は感情や衝動を抑えられないことを表す文型で、「~하지 않을 수 없다」という意味です。「流す」→「流さずには」の形で使います。', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ないでは', FALSE, 1),
    (gen_random_uuid(), q_id, 'ずには', TRUE, 2),
    (gen_random_uuid(), q_id, 'なくては', FALSE, 3),
    (gen_random_uuid(), q_id, 'ないには', FALSE, 4);

  -- Q20: 〜にほかならない (오류 찾기)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '次の文で文法的に正しいものはどれですか？', '「〜にほかならない」は強い断定を表す文型で、「~에 다름 아니다」という意味です。名詞＋にほかならない、または「〜からにほかならない」の形で使います。「努力の成果にほかならない」が正しい形です。', 1, 20, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '彼の成功は、日々の努力の成果をほかならない。', FALSE, 1),
    (gen_random_uuid(), q_id, '彼の成功は、日々の努力の成果がほかならない。', FALSE, 2),
    (gen_random_uuid(), q_id, '彼の成功は、日々の努力の成果にほかならない。', TRUE, 3),
    (gen_random_uuid(), q_id, '彼の成功は、日々の努力の成果でほかならない。', FALSE, 4);
END $$;

-- ============================================
-- Additional Grammar Questions (+6 per quiz, Q21-Q26)
-- ============================================

-- N5 追加問題 (Q21-Q26)
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q21: 〜てから (순서 표현)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「手を洗ってから、ごはんを食べます」の意味として正しいものは？', '「〜てから」は動作の順序を表す文型で、「~하고 나서」という意味です。手を洗った後にごはんを食べるという順序を示しています。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '손을 씻으면서 밥을 먹는다', FALSE, 1),
    (gen_random_uuid(), q_id, '손을 씻고 나서 밥을 먹는다', TRUE, 2),
    (gen_random_uuid(), q_id, '손을 씻지 않고 밥을 먹는다', FALSE, 3),
    (gen_random_uuid(), q_id, '손을 씻기 전에 밥을 먹는다', FALSE, 4);

  -- Q22: 〜に (목적지 조사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', 'あした　がっこう（　）いきます。', '「〜に」は移動の目的地を表す助詞で、「~에」に相当します。「学校に行きます」で「학교에 갑니다」の意味です。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'を', FALSE, 1),
    (gen_random_uuid(), q_id, 'で', FALSE, 2),
    (gen_random_uuid(), q_id, 'に', TRUE, 3),
    (gen_random_uuid(), q_id, 'が', FALSE, 4);

  -- Q23: 〜も (「も」의 사용법)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', 'わたしは　にほんご（　）べんきょうしています。えいご（　）べんきょうしています。', '「〜も」は「~도」に相当する助詞で、同類のものを並列する時に使います。日本語も英語も勉強しているという意味です。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'を / を', FALSE, 1),
    (gen_random_uuid(), q_id, 'も / も', TRUE, 2),
    (gen_random_uuid(), q_id, 'は / は', FALSE, 3),
    (gen_random_uuid(), q_id, 'が / が', FALSE, 4);

  -- Q24: 〜あげる/もらう/くれる (수수표현)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', 'ともだちが　わたしに　ほんを（　）。', '「くれる」は다른 사람이 나에게 무언가를 주는 것을 나타내는 동사입니다。友達(주어)が 私(받는 사람)に 本を くれました。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あげました', FALSE, 1),
    (gen_random_uuid(), q_id, 'もらいました', FALSE, 2),
    (gen_random_uuid(), q_id, 'くれました', TRUE, 3),
    (gen_random_uuid(), q_id, 'やりました', FALSE, 4);

  -- Q25: 〜なくてもいい (허가 불필요)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', '「明日は休みですから、早く起きなくてもいいです」の意味は？', '「〜なくてもいい」は「~하지 않아도 된다」という意味で、必要ないことを表します。明日は休みなので早く起きる必要はないということです。', 1, 25, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내일은 쉬는 날이니까 일찍 일어나야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '내일은 쉬는 날이니까 일찍 일어나지 않아도 된다', TRUE, 2),
    (gen_random_uuid(), q_id, '내일은 쉬는 날이니까 일찍 일어나고 싶다', FALSE, 3),
    (gen_random_uuid(), q_id, '내일은 쉬는 날이니까 일찍 일어날 수 없다', FALSE, 4);

  -- Q26: 〜まだ〜ていません (미완료)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000001-0000-0000-0000-000000000001', 'multiple_choice', 'A：「もう宿題をしましたか。」 B：「いいえ、（　）。」', '「まだ〜ていません」は「아직 ~하지 않았습니다」의 의미로, 아직 완료되지 않은 상태를 나타냅니다。', 1, 26, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もうしました', FALSE, 1),
    (gen_random_uuid(), q_id, 'しません', FALSE, 2),
    (gen_random_uuid(), q_id, 'まだしていません', TRUE, 3),
    (gen_random_uuid(), q_id, 'しなかったです', FALSE, 4);
END $$;

-- N4 追加問題 (Q21-Q26)
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q21: 〜てあげる (행위 수수)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '妹に漢字を教えて（　）。', '「〜てあげる」は상대방을 위해 행위를 해주는 것을 나타냅니다。「教えてあげた」で「가르쳐 주었다」の意味です。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もらった', FALSE, 1),
    (gen_random_uuid(), q_id, 'くれた', FALSE, 2),
    (gen_random_uuid(), q_id, 'あげた', TRUE, 3),
    (gen_random_uuid(), q_id, 'やった', FALSE, 4);

  -- Q22: 〜てもらう (행위 수수 - 받는 쪽)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '友達に荷物を持って（　）。', '「〜てもらう」は다른 사람에게 행위를 받는 것을 나타냅니다。「持ってもらった」で「들어 받았다」의 의미입니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あげた', FALSE, 1),
    (gen_random_uuid(), q_id, 'もらった', TRUE, 2),
    (gen_random_uuid(), q_id, 'くれた', FALSE, 3),
    (gen_random_uuid(), q_id, 'おいた', FALSE, 4);

  -- Q23: 〜ことにする (결정 표현)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '来月から毎日運動する（　）しました。', '「〜ことにする」는 자신의 의지로 결정하는 것을 나타내는 문형으로、「~하기로 하다」의 의미입니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ように', FALSE, 1),
    (gen_random_uuid(), q_id, 'ために', FALSE, 2),
    (gen_random_uuid(), q_id, 'ことに', TRUE, 3),
    (gen_random_uuid(), q_id, 'ことが', FALSE, 4);

  -- Q24: 〜ことになる (결정 - 타자/자연)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '来月から大阪に転勤する（　）なりました。', '「〜ことになる」는 외부 요인이나 상황에 의한 결정을 나타내는 문형으로、「~하게 되다」의 의미입니다。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ように', FALSE, 1),
    (gen_random_uuid(), q_id, 'ことに', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'はずに', FALSE, 4);

  -- Q25: 〜ても (역접 가정)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '雨が降っ（　）、サッカーの試合をします。', '「〜ても」は역접 가정을 나타내는 문형으로、「~하더라도」의 의미입니다。비가 와도 축구 시합을 한다는 의미입니다。', 1, 25, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'たら', FALSE, 1),
    (gen_random_uuid(), q_id, 'ても', TRUE, 2),
    (gen_random_uuid(), q_id, 'ので', FALSE, 3),
    (gen_random_uuid(), q_id, 'から', FALSE, 4);

  -- Q26: 〜ば〜ほど (비례 표현)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000002-0000-0000-0000-000000000002', 'multiple_choice', '日本語は勉強すれば（　）おもしろくなります。', '「〜ば〜ほど」は「~하면 ~할수록」의 의미로, 비례관계를 나타냅니다。공부하면 할수록 재미있어진다는 뜻입니다。', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'するだけ', FALSE, 1),
    (gen_random_uuid(), q_id, 'するほど', TRUE, 2),
    (gen_random_uuid(), q_id, 'するまで', FALSE, 3),
    (gen_random_uuid(), q_id, 'するなら', FALSE, 4);
END $$;

-- N3 追加問題 (Q21-Q26)
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q21: 〜ようとする (시도 표현)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ドアを開けよう（　）したが、鍵がかかっていた。', '「〜ようとする」は「~하려고 하다」의 의미로, 시도나 의도를 나타냅니다。문을 열려고 했지만 잠겨 있었다는 뜻입니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'に', FALSE, 1),
    (gen_random_uuid(), q_id, 'と', TRUE, 2),
    (gen_random_uuid(), q_id, 'で', FALSE, 3),
    (gen_random_uuid(), q_id, 'か', FALSE, 4);

  -- Q22: 〜ことにしている (습관적 결정)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '健康のために、毎朝ジョギングをする（　）している。', '「〜ことにしている」は습관적인 결정이나 자기 규칙을 나타내는 문형으로、「~하기로 하고 있다」의 의미입니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ように', FALSE, 1),
    (gen_random_uuid(), q_id, 'ことに', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'はずに', FALSE, 4);

  -- Q23: 〜せいで (부정적 원인)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '台風の（　）、飛行機が欠航になった。', '「〜せいで」는 부정적인 결과의 원인을 나타내는 문형으로、「~탓에 / ~때문에(부정적)」의 의미입니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おかげで', FALSE, 1),
    (gen_random_uuid(), q_id, 'せいで', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'ことで', FALSE, 4);

  -- Q24: 〜っぽい (경향/인상)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '最近の天気は秋（　）くなってきた。', '「〜っぽい」は「~스러운 / ~같은」의 의미로, 어떤 경향이나 인상을 나타냅니다。「秋っぽい」로 가을 같은 느낌이 된다는 뜻입니다。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'みたい', FALSE, 1),
    (gen_random_uuid(), q_id, 'らし', FALSE, 2),
    (gen_random_uuid(), q_id, 'っぽ', TRUE, 3),
    (gen_random_uuid(), q_id, 'そう', FALSE, 4);

  -- Q25: 〜かわりに (대신/대가)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '手伝ってくれた（　）、昼ご飯をおごりますよ。', '「〜かわりに」は「~대신에」의 의미로, 교환이나 보상의 조건을 나타냅니다。도와준 대신에 점심을 사겠다는 뜻입니다。', 1, 25, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ついでに', FALSE, 1),
    (gen_random_uuid(), q_id, 'かわりに', TRUE, 2),
    (gen_random_uuid(), q_id, 'ために', FALSE, 3),
    (gen_random_uuid(), q_id, 'おかげで', FALSE, 4);

  -- Q26: 〜ついでに (겸사겸사)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000003-0000-0000-0000-000000000003', 'multiple_choice', '買い物に行く（　）、クリーニングも出してきてくれない？', '「〜ついでに」は「~하는 김에」의 의미로, 메인 행동을 하면서 부수적인 행동도 함께 하는 것을 나타냅니다。', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'かわりに', FALSE, 1),
    (gen_random_uuid(), q_id, 'ために', FALSE, 2),
    (gen_random_uuid(), q_id, 'ついでに', TRUE, 3),
    (gen_random_uuid(), q_id, 'ながら', FALSE, 4);
END $$;

-- N2 追加問題 (Q21-Q26)
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q21: 〜ものなら (불가능/도전 가정)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'できる（　）やってみろ。', '「〜ものなら」は「~할 수 있다면 / ~한다면」의 의미로, 실현이 어려운 가정을 나타냅니다。할 수 있으면 해봐라 라는 도전적 의미입니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ことなら', FALSE, 1),
    (gen_random_uuid(), q_id, 'ものなら', TRUE, 2),
    (gen_random_uuid(), q_id, 'としたら', FALSE, 3),
    (gen_random_uuid(), q_id, 'ばかりか', FALSE, 4);

  -- Q22: 〜からして (판단 근거)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'あの店は外観（　）高級そうだ。', '「〜からして」は「~부터가」의 의미로, 가장 기본적인 것을 예로 들어 판단을 나타냅니다。외관부터가 고급스럽다는 뜻입니다。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にして', FALSE, 1),
    (gen_random_uuid(), q_id, 'からして', TRUE, 2),
    (gen_random_uuid(), q_id, 'として', FALSE, 3),
    (gen_random_uuid(), q_id, 'にとって', FALSE, 4);

  -- Q23: 〜てたまらない (참을 수 없는 감정)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '試験の結果が心配で（　）。', '「〜てたまらない」は「~해서 견딜 수 없다」의 의미로, 감정이나 감각이 매우 강한 상태를 나타냅니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しかたない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ならない', FALSE, 2),
    (gen_random_uuid(), q_id, 'たまらない', TRUE, 3),
    (gen_random_uuid(), q_id, 'いられない', FALSE, 4);

  -- Q24: 〜に限って (한정/의외)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '傘を持っていない日（　）、雨が降る。', '「〜に限って」は「~에 한해서 / 하필 ~할 때」의 의미로, 의외의 상황이나 한정을 나타냅니다。우산이 없는 날에 한해 비가 온다는 뜻입니다。', 1, 24, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'にかけて', FALSE, 1),
    (gen_random_uuid(), q_id, 'に限って', TRUE, 2),
    (gen_random_uuid(), q_id, 'につれて', FALSE, 3),
    (gen_random_uuid(), q_id, 'に関して', FALSE, 4);

  -- Q25: 〜どころか (부정적 강조)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', '彼は英語（　）、日本語も中国語も話せる。', '「〜どころか」は「~는커녕 / ~은 물론이고」의 의미로, 예상과 다른 정도를 강조합니다。영어는 물론이고 일본어, 중국어까지 할 수 있다는 뜻입니다。', 1, 25, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ばかりか', FALSE, 1),
    (gen_random_uuid(), q_id, 'どころか', TRUE, 2),
    (gen_random_uuid(), q_id, 'だけでなく', FALSE, 3),
    (gen_random_uuid(), q_id, 'のみならず', FALSE, 4);

  -- Q26: 〜を中心に (중심 표현)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000004-0000-0000-0000-000000000004', 'multiple_choice', 'この授業は会話（　）進められます。', '「〜を中心に」は「~을 중심으로」의 의미로, 무언가를 중심 축으로 하는 것을 나타냅니다。회화를 중심으로 수업이 진행된다는 뜻입니다。', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'をもとに', FALSE, 1),
    (gen_random_uuid(), q_id, 'を中心に', TRUE, 2),
    (gen_random_uuid(), q_id, 'に関して', FALSE, 3),
    (gen_random_uuid(), q_id, 'について', FALSE, 4);
END $$;

-- N1 追加問題 (Q21-Q26)
DO $$
DECLARE q_id UUID;
BEGIN
  -- Q21: 〜ともあろう (지위에 어울리지 않는 행동)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '社長（　）人が、そんな初歩的なミスをするとは信じられない。', '「〜ともあろう」は「~정도 되는 / ~다운 지위의」의 의미로, 높은 지위나 입장에 어울리지 않는 행동에 대한 비난이나 놀라움을 나타냅니다。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ともあろう', TRUE, 1),
    (gen_random_uuid(), q_id, 'ともなると', FALSE, 2),
    (gen_random_uuid(), q_id, 'としての', FALSE, 3),
    (gen_random_uuid(), q_id, 'にあたる', FALSE, 4);

  -- Q22: 〜ないものでもない (완곡한 긍정)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '条件次第では、協力でき（　）。', '「〜ないものでもない」는 이중부정을 통한 완곡한 긍정 표현으로、「~하지 못할 것도 없다」의 의미입니다。조건에 따라 협력할 수도 있다는 뉘앙스입니다。', 1, 22, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'るものではない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ないものでもない', TRUE, 2),
    (gen_random_uuid(), q_id, 'ないではいられない', FALSE, 3),
    (gen_random_uuid(), q_id, 'ざるをえない', FALSE, 4);

  -- Q23: 〜てからというもの (전환점)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本に来て（　）、毎日が新しい発見の連続だ。', '「〜てからというもの」は「~하고 나서부터는 쭉」의 의미로, 어떤 시점을 계기로 상태가 계속 변한 것을 나타냅니다。', 1, 23, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'からには', FALSE, 1),
    (gen_random_uuid(), q_id, 'からというもの', TRUE, 2),
    (gen_random_uuid(), q_id, 'てはじめて', FALSE, 3),
    (gen_random_uuid(), q_id, 'たとたん', FALSE, 4);

  -- Q24: 〜まじき (있어서는 안 되는)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', '教師に（　）行為として、厳しく批判された。', '「〜まじき」は「~해서는 안 되는 / ~답지 않은」의 의미로, 그 입장에서 있어서는 안 되는 행위를 비난할 때 사용합니다。', 1, 24, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あるべき', FALSE, 1),
    (gen_random_uuid(), q_id, 'あるまじき', TRUE, 2),
    (gen_random_uuid(), q_id, 'あらざる', FALSE, 3),
    (gen_random_uuid(), q_id, 'ありえない', FALSE, 4);

  -- Q25: 〜極まりない (극도의 정도)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'あの政治家の発言は無責任（　）。', '「〜極まりない」は「더없이 ~하다 / 극히 ~하다」의 의미로, 정도가 극에 달해 있음을 나타내는 강조 표현입니다。', 1, 25, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'きわまる', FALSE, 1),
    (gen_random_uuid(), q_id, '極まりない', TRUE, 2),
    (gen_random_uuid(), q_id, 'この上ない', FALSE, 3),
    (gen_random_uuid(), q_id, 'に堪えない', FALSE, 4);

  -- Q26: 〜とは (의외/감탄)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'b0000005-0000-0000-0000-000000000005', 'multiple_choice', 'まさか彼が辞職する（　）、誰も予想していなかった。', '「〜とは」는 의외성이나 놀라움을 나타내는 문형으로、「~하다니 / ~라고는」의 의미입니다。예상치 못한 일에 대한 놀라움을 표현합니다。', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'とは', TRUE, 1),
    (gen_random_uuid(), q_id, 'ものを', FALSE, 2),
    (gen_random_uuid(), q_id, 'ことに', FALSE, 3),
    (gen_random_uuid(), q_id, 'ところを', FALSE, 4);
END $$;

-- Update time limits (+3 minutes each)
UPDATE quizzes SET time_limit_minutes = time_limit_minutes + 3 WHERE id IN (
  'b0000001-0000-0000-0000-000000000001',
  'b0000002-0000-0000-0000-000000000002',
  'b0000003-0000-0000-0000-000000000003',
  'b0000004-0000-0000-0000-000000000004',
  'b0000005-0000-0000-0000-000000000005'
);
