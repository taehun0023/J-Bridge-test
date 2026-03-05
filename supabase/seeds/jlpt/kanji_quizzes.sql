-- ============================================
-- 漢字テスト Seed Data (5レベル × 30問 = 150問)
-- quiz_type: 'jlpt_kanji', is_assessment: FALSE
-- Total: 150 questions, 600 options
-- + 5 Pool quizzes (20問ランダム抽出)
-- ============================================

BEGIN;

-- ============================================
-- 0. Clean up existing data (idempotent)
-- ============================================
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'ca000001-0000-0000-0000-000000000001',
    'ca000002-0000-0000-0000-000000000002',
    'ca000003-0000-0000-0000-000000000003',
    'ca000004-0000-0000-0000-000000000004',
    'ca000005-0000-0000-0000-000000000005',
    'e0000001-0000-0000-0000-000000000051',
    'e0000001-0000-0000-0000-000000000052',
    'e0000001-0000-0000-0000-000000000053',
    'e0000001-0000-0000-0000-000000000054',
    'e0000001-0000-0000-0000-000000000055'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'ca000001-0000-0000-0000-000000000001',
  'ca000002-0000-0000-0000-000000000002',
  'ca000003-0000-0000-0000-000000000003',
  'ca000004-0000-0000-0000-000000000004',
  'ca000005-0000-0000-0000-000000000005',
  'e0000001-0000-0000-0000-000000000051',
  'e0000001-0000-0000-0000-000000000052',
  'e0000001-0000-0000-0000-000000000053',
  'e0000001-0000-0000-0000-000000000054',
  'e0000001-0000-0000-0000-000000000055'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'ca000001-0000-0000-0000-000000000001',
    'ca000002-0000-0000-0000-000000000002',
    'ca000003-0000-0000-0000-000000000003',
    'ca000004-0000-0000-0000-000000000004',
    'ca000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'ca000001-0000-0000-0000-000000000001',
  'ca000002-0000-0000-0000-000000000002',
  'ca000003-0000-0000-0000-000000000003',
  'ca000004-0000-0000-0000-000000000004',
  'ca000005-0000-0000-0000-000000000005'
);
DELETE FROM quizzes WHERE id IN (
  'ca000001-0000-0000-0000-000000000001',
  'ca000002-0000-0000-0000-000000000002',
  'ca000003-0000-0000-0000-000000000003',
  'ca000004-0000-0000-0000-000000000004',
  'ca000005-0000-0000-0000-000000000005',
  'e0000001-0000-0000-0000-000000000051',
  'e0000001-0000-0000-0000-000000000052',
  'e0000001-0000-0000-0000-000000000053',
  'e0000001-0000-0000-0000-000000000054',
  'e0000001-0000-0000-0000-000000000055'
);

-- ============================================
-- N5 漢字テスト (30 questions)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'ca000001-0000-0000-0000-000000000001';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'N5漢字テスト', 'jlpt_kanji', 70, 15, FALSE, NULL);

  -- === 読み方問題 (Q1-Q10) ===

  -- Q1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「一人」の読み方として正しいものはどれですか？',
    '「一人」は「ひとり」と読みます。「一」の訓読みは「ひと.つ」で、「一人」は特殊な読み方です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ひとり', TRUE, 1),
    (gen_random_uuid(), q_id, 'いちにん', FALSE, 2),
    (gen_random_uuid(), q_id, 'ふたり', FALSE, 3),
    (gen_random_uuid(), q_id, 'ひとつ', FALSE, 4);

  -- Q2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「天気」の読み方として正しいものはどれですか？',
    '「天気」は「てんき」と読みます。「天」の音読みは「テン」、「気」の音読みは「キ」です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'てんき', TRUE, 1),
    (gen_random_uuid(), q_id, 'てんけ', FALSE, 2),
    (gen_random_uuid(), q_id, 'あまき', FALSE, 3),
    (gen_random_uuid(), q_id, 'てんげ', FALSE, 4);

  -- Q3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「学校」の読み方として正しいものはどれですか？',
    '「学校」は「がっこう」と読みます。「学」の音読みは「ガク」で、連濁により「がっ」となります。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'がっこう', TRUE, 1),
    (gen_random_uuid(), q_id, 'がくこう', FALSE, 2),
    (gen_random_uuid(), q_id, 'がくきょう', FALSE, 3),
    (gen_random_uuid(), q_id, 'まなこう', FALSE, 4);

  -- Q4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「毎日」の読み方として正しいものはどれですか？',
    '「毎日」は「まいにち」と読みます。「毎」の音読みは「マイ」、「日」の音読みは「ニチ」です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'まいにち', TRUE, 1),
    (gen_random_uuid(), q_id, 'まいじつ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ごとにち', FALSE, 3),
    (gen_random_uuid(), q_id, 'まいひ', FALSE, 4);

  -- Q5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「電車」の読み方として正しいものはどれですか？',
    '「電車」は「でんしゃ」と読みます。「電」の音読みは「デン」、「車」の音読みは「シャ」です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'でんしゃ', TRUE, 1),
    (gen_random_uuid(), q_id, 'でんくるま', FALSE, 2),
    (gen_random_uuid(), q_id, 'いなずまぐるま', FALSE, 3),
    (gen_random_uuid(), q_id, 'でんちゃ', FALSE, 4);

  -- Q6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「今日」の読み方として正しいものはどれですか？',
    '「今日」は「きょう」と読みます。「こんにち」とも読めますが、日常会話では「きょう」が一般的です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'きょう', TRUE, 1),
    (gen_random_uuid(), q_id, 'こんじつ', FALSE, 2),
    (gen_random_uuid(), q_id, 'いまび', FALSE, 3),
    (gen_random_uuid(), q_id, 'きんにち', FALSE, 4);

  -- Q7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「名前」の読み方として正しいものはどれですか？',
    '「名前」は「なまえ」と読みます。「名」の訓読みは「な」、「前」の訓読みは「まえ」です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'なまえ', TRUE, 1),
    (gen_random_uuid(), q_id, 'めいぜん', FALSE, 2),
    (gen_random_uuid(), q_id, 'みょうまえ', FALSE, 3),
    (gen_random_uuid(), q_id, 'なぜん', FALSE, 4);

  -- Q8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「入口」の読み方として正しいものはどれですか？',
    '「入口」は「いりぐち」と読みます。「入」の訓読みは「い.る」、「口」の訓読みは「くち」で、連濁により「ぐち」となります。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いりぐち', TRUE, 1),
    (gen_random_uuid(), q_id, 'にゅうこう', FALSE, 2),
    (gen_random_uuid(), q_id, 'はいりくち', FALSE, 3),
    (gen_random_uuid(), q_id, 'いりくち', FALSE, 4);

  -- Q9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「花火」の読み方として正しいものはどれですか？',
    '「花火」は「はなび」と読みます。「花」の訓読みは「はな」、「火」の訓読みは「ひ」で、連濁により「び」となります。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'はなび', TRUE, 1),
    (gen_random_uuid(), q_id, 'かか', FALSE, 2),
    (gen_random_uuid(), q_id, 'はなひ', FALSE, 3),
    (gen_random_uuid(), q_id, 'かび', FALSE, 4);

  -- Q10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「先生」の読み方として正しいものはどれですか？',
    '「先生」は「せんせい」と読みます。「先」の音読みは「セン」、「生」の音読みは「セイ」です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'せんせい', TRUE, 1),
    (gen_random_uuid(), q_id, 'さきなま', FALSE, 2),
    (gen_random_uuid(), q_id, 'せんしょう', FALSE, 3),
    (gen_random_uuid(), q_id, 'さきいき', FALSE, 4);

  -- === 意味問題 (Q11-Q20) ===

  -- Q11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「山」の意味として正しいものはどれですか？',
    '「山」は「산(山), 산」という意味です。音読みは「サン」、訓読みは「やま」です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '산', TRUE, 1),
    (gen_random_uuid(), q_id, '강', FALSE, 2),
    (gen_random_uuid(), q_id, '하늘', FALSE, 3),
    (gen_random_uuid(), q_id, '바다', FALSE, 4);

  -- Q12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「食」の意味として正しいものはどれですか？',
    '「食」は「식(食), 먹다」という意味です。「食べる」（たべる）は「먹다」です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '먹다', TRUE, 1),
    (gen_random_uuid(), q_id, '마시다', FALSE, 2),
    (gen_random_uuid(), q_id, '걷다', FALSE, 3),
    (gen_random_uuid(), q_id, '자다', FALSE, 4);

  -- Q13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「雨」の意味として正しいものはどれですか？',
    '「雨」は「우(雨), 비」という意味です。訓読みは「あめ」です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비', TRUE, 1),
    (gen_random_uuid(), q_id, '눈', FALSE, 2),
    (gen_random_uuid(), q_id, '바람', FALSE, 3),
    (gen_random_uuid(), q_id, '구름', FALSE, 4);

  -- Q14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「手」の意味として正しいものはどれですか？',
    '「手」は「수(手), 손」という意味です。訓読みは「て」です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '손', TRUE, 1),
    (gen_random_uuid(), q_id, '발', FALSE, 2),
    (gen_random_uuid(), q_id, '눈', FALSE, 3),
    (gen_random_uuid(), q_id, '귀', FALSE, 4);

  -- Q15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「高」の意味として正しいものはどれですか？',
    '「高」は「고(高), 높다」という意味です。「高い」（たかい）は「높다, 비싸다」です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '높다', TRUE, 1),
    (gen_random_uuid(), q_id, '낮다', FALSE, 2),
    (gen_random_uuid(), q_id, '싸다', FALSE, 3),
    (gen_random_uuid(), q_id, '길다', FALSE, 4);

  -- Q16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「友」の意味として正しいものはどれですか？',
    '「友」は「우(友), 벗」という意味です。「友達」（ともだち）は「친구」です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '벗', TRUE, 1),
    (gen_random_uuid(), q_id, '가족', FALSE, 2),
    (gen_random_uuid(), q_id, '선생님', FALSE, 3),
    (gen_random_uuid(), q_id, '아이', FALSE, 4);

  -- Q17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「白」の意味として正しいものはどれですか？',
    '「白」は「백(白), 흰」という意味です。「白い」（しろい）は「하얗다」です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '흰색', TRUE, 1),
    (gen_random_uuid(), q_id, '검은색', FALSE, 2),
    (gen_random_uuid(), q_id, '빨간색', FALSE, 3),
    (gen_random_uuid(), q_id, '파란색', FALSE, 4);

  -- Q18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「車」の意味として正しいものはどれですか？',
    '「車」は「차(車), 수레」という意味です。訓読みは「くるま」で、자동차(車)を意味します。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '차', TRUE, 1),
    (gen_random_uuid(), q_id, '배', FALSE, 2),
    (gen_random_uuid(), q_id, '비행기', FALSE, 3),
    (gen_random_uuid(), q_id, '자전거', FALSE, 4);

  -- Q19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「休」の意味として正しいものはどれですか？',
    '「休」は「휴(休), 쉬다」という意味です。「休む」（やすむ）は「쉬다」です。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '쉬다', TRUE, 1),
    (gen_random_uuid(), q_id, '일하다', FALSE, 2),
    (gen_random_uuid(), q_id, '놀다', FALSE, 3),
    (gen_random_uuid(), q_id, '배우다', FALSE, 4);

  -- Q20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「国」の意味として正しいものはどれですか？',
    '「国」は「국(國), 나라」という意味です。訓読みは「くに」です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '나라', TRUE, 1),
    (gen_random_uuid(), q_id, '도시', FALSE, 2),
    (gen_random_uuid(), q_id, '마을', FALSE, 3),
    (gen_random_uuid(), q_id, '집', FALSE, 4);

  -- === 漢字選択問題 (Q21-Q30) ===

  -- Q21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「みず」と読む漢字はどれですか？',
    '「水」は訓読みで「みず」と読みます。「물」という意味です。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '水', TRUE, 1),
    (gen_random_uuid(), q_id, '火', FALSE, 2),
    (gen_random_uuid(), q_id, '木', FALSE, 3),
    (gen_random_uuid(), q_id, '土', FALSE, 4);

  -- Q22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「사람」に当たる漢字はどれですか？',
    '「人」は「사람」という意味です。訓読みは「ひと」、音読みは「ジン、ニン」です。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人', TRUE, 1),
    (gen_random_uuid(), q_id, '大', FALSE, 2),
    (gen_random_uuid(), q_id, '子', FALSE, 3),
    (gen_random_uuid(), q_id, '女', FALSE, 4);

  -- Q23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「ひがし」と読む漢字はどれですか？',
    '「東」は訓読みで「ひがし」と読みます。「동쪽」という意味です。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '東', TRUE, 1),
    (gen_random_uuid(), q_id, '西', FALSE, 2),
    (gen_random_uuid(), q_id, '南', FALSE, 3),
    (gen_random_uuid(), q_id, '北', FALSE, 4);

  -- Q24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「크다」に当たる漢字はどれですか？',
    '「大」は「크다」という意味です。「大きい」（おおきい）は「크다」です。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大', TRUE, 1),
    (gen_random_uuid(), q_id, '小', FALSE, 2),
    (gen_random_uuid(), q_id, '長', FALSE, 3),
    (gen_random_uuid(), q_id, '多', FALSE, 4);

  -- Q25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「かわ」と読む漢字はどれですか？',
    '「川」は訓読みで「かわ」と読みます。「강, 내」という意味です。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '川', TRUE, 1),
    (gen_random_uuid(), q_id, '山', FALSE, 2),
    (gen_random_uuid(), q_id, '田', FALSE, 3),
    (gen_random_uuid(), q_id, '花', FALSE, 4);

  -- Q26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「듣다」に当たる漢字はどれですか？',
    '「聞」は「듣다」という意味です。「聞く」（きく）は「듣다」です。',
    2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '聞', TRUE, 1),
    (gen_random_uuid(), q_id, '読', FALSE, 2),
    (gen_random_uuid(), q_id, '書', FALSE, 3),
    (gen_random_uuid(), q_id, '話', FALSE, 4);

  -- Q27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「そと」と読む漢字はどれですか？',
    '「外」は訓読みで「そと」と読みます。「바깥」という意味です。',
    2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '外', TRUE, 1),
    (gen_random_uuid(), q_id, '中', FALSE, 2),
    (gen_random_uuid(), q_id, '上', FALSE, 3),
    (gen_random_uuid(), q_id, '下', FALSE, 4);

  -- Q28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「보다」に当たる漢字はどれですか？',
    '「見」は「보다」という意味です。「見る」（みる）は「보다」です。',
    2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '見', TRUE, 1),
    (gen_random_uuid(), q_id, '聞', FALSE, 2),
    (gen_random_uuid(), q_id, '言', FALSE, 3),
    (gen_random_uuid(), q_id, '買', FALSE, 4);

  -- Q29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「つき」と読む漢字はどれですか？',
    '「月」は訓読みで「つき」と読みます。「달」という意味です。',
    2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '月', TRUE, 1),
    (gen_random_uuid(), q_id, '日', FALSE, 2),
    (gen_random_uuid(), q_id, '年', FALSE, 3),
    (gen_random_uuid(), q_id, '時', FALSE, 4);

  -- Q30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「집」に当たる漢字はどれですか？',
    '「家」は「집」という意味です。訓読みは「いえ」、音読みは「カ、ケ」です。',
    2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '家', TRUE, 1),
    (gen_random_uuid(), q_id, '店', FALSE, 2),
    (gen_random_uuid(), q_id, '校', FALSE, 3),
    (gen_random_uuid(), q_id, '社', FALSE, 4);

END $$;

-- ============================================
-- N4 漢字テスト (30 questions)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'ca000002-0000-0000-0000-000000000002';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'N4漢字テスト', 'jlpt_kanji', 70, 15, FALSE, NULL);

  -- === 読み方問題 (Q1-Q10) ===

  -- Q1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「仕事」の読み方として正しいものはどれですか？',
    '「仕事」は「しごと」と読みます。「仕」の音読みは「シ」、「事」の訓読みは「こと」です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しごと', TRUE, 1),
    (gen_random_uuid(), q_id, 'しこと', FALSE, 2),
    (gen_random_uuid(), q_id, 'つかごと', FALSE, 3),
    (gen_random_uuid(), q_id, 'じごと', FALSE, 4);

  -- Q2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「世界」の読み方として正しいものはどれですか？',
    '「世界」は「せかい」と読みます。「世」の音読みは「セ」、「界」の音読みは「カイ」です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'せかい', TRUE, 1),
    (gen_random_uuid(), q_id, 'せいかい', FALSE, 2),
    (gen_random_uuid(), q_id, 'よかい', FALSE, 3),
    (gen_random_uuid(), q_id, 'せがい', FALSE, 4);

  -- Q3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「勉強」の読み方として正しいものはどれですか？',
    '「勉強」は「べんきょう」と読みます。「勉」の音読みは「ベン」、「強」の音読みは「キョウ」です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'べんきょう', TRUE, 1),
    (gen_random_uuid(), q_id, 'べんごう', FALSE, 2),
    (gen_random_uuid(), q_id, 'めんきょう', FALSE, 3),
    (gen_random_uuid(), q_id, 'べんつよ', FALSE, 4);

  -- Q4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「料理」の読み方として正しいものはどれですか？',
    '「料理」は「りょうり」と読みます。「料」の音読みは「リョウ」、「理」の音読みは「リ」です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'りょうり', TRUE, 1),
    (gen_random_uuid(), q_id, 'りょうち', FALSE, 2),
    (gen_random_uuid(), q_id, 'りょり', FALSE, 3),
    (gen_random_uuid(), q_id, 'りょうじ', FALSE, 4);

  -- Q5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「動物」の読み方として正しいものはどれですか？',
    '「動物」は「どうぶつ」と読みます。「動」の音読みは「ドウ」、「物」の音読みは「ブツ」です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'どうぶつ', TRUE, 1),
    (gen_random_uuid(), q_id, 'どうもつ', FALSE, 2),
    (gen_random_uuid(), q_id, 'うごもの', FALSE, 3),
    (gen_random_uuid(), q_id, 'どうもの', FALSE, 4);

  -- Q6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「病院」の読み方として正しいものはどれですか？',
    '「病院」は「びょういん」と読みます。「病」の音読みは「ビョウ」、「院」の音読みは「イン」です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'びょういん', TRUE, 1),
    (gen_random_uuid(), q_id, 'びょうえん', FALSE, 2),
    (gen_random_uuid(), q_id, 'へいいん', FALSE, 3),
    (gen_random_uuid(), q_id, 'やまいいん', FALSE, 4);

  -- Q7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「写真」の読み方として正しいものはどれですか？',
    '「写真」は「しゃしん」と読みます。「写」の音読みは「シャ」、「真」の音読みは「シン」です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しゃしん', TRUE, 1),
    (gen_random_uuid(), q_id, 'しゃま', FALSE, 2),
    (gen_random_uuid(), q_id, 'うつしん', FALSE, 3),
    (gen_random_uuid(), q_id, 'しゃちん', FALSE, 4);

  -- Q8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「運転」の読み方として正しいものはどれですか？',
    '「運転」は「うんてん」と読みます。「運」の音読みは「ウン」、「転」の音読みは「テン」です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'うんてん', TRUE, 1),
    (gen_random_uuid(), q_id, 'うんでん', FALSE, 2),
    (gen_random_uuid(), q_id, 'はこてん', FALSE, 3),
    (gen_random_uuid(), q_id, 'うんころ', FALSE, 4);

  -- Q9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「図書館」の読み方として正しいものはどれですか？',
    '「図書館」は「としょかん」と読みます。「図」の音読みは「ト」、「書」の音読みは「ショ」、「館」の音読みは「カン」です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'としょかん', TRUE, 1),
    (gen_random_uuid(), q_id, 'ずしょかん', FALSE, 2),
    (gen_random_uuid(), q_id, 'としょやかた', FALSE, 3),
    (gen_random_uuid(), q_id, 'とかきかん', FALSE, 4);

  -- Q10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「映画」の読み方として正しいものはどれですか？',
    '「映画」は「えいが」と読みます。「映」の音読みは「エイ」、「画」の音読みは「ガ」です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'えいが', TRUE, 1),
    (gen_random_uuid(), q_id, 'えいかく', FALSE, 2),
    (gen_random_uuid(), q_id, 'うつが', FALSE, 3),
    (gen_random_uuid(), q_id, 'えいかい', FALSE, 4);

  -- === 意味問題 (Q11-Q20) ===

  -- Q11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「働」の意味として正しいものはどれですか？',
    '「働」は「동(働), 일하다」という意味です。「働く」（はたらく）は「일하다」です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일하다', TRUE, 1),
    (gen_random_uuid(), q_id, '놀다', FALSE, 2),
    (gen_random_uuid(), q_id, '움직이다', FALSE, 3),
    (gen_random_uuid(), q_id, '만들다', FALSE, 4);

  -- Q12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「海」の意味として正しいものはどれですか？',
    '「海」は「해(海), 바다」という意味です。訓読みは「うみ」です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '바다', TRUE, 1),
    (gen_random_uuid(), q_id, '강', FALSE, 2),
    (gen_random_uuid(), q_id, '호수', FALSE, 3),
    (gen_random_uuid(), q_id, '산', FALSE, 4);

  -- Q13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「教」の意味として正しいものはどれですか？',
    '「教」は「교(教), 가르치다」という意味です。「教える」（おしえる）は「가르치다」です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가르치다', TRUE, 1),
    (gen_random_uuid(), q_id, '배우다', FALSE, 2),
    (gen_random_uuid(), q_id, '읽다', FALSE, 3),
    (gen_random_uuid(), q_id, '쓰다', FALSE, 4);

  -- Q14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「心」の意味として正しいものはどれですか？',
    '「心」は「심(心), 마음」という意味です。訓読みは「こころ」です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '마음', TRUE, 1),
    (gen_random_uuid(), q_id, '머리', FALSE, 2),
    (gen_random_uuid(), q_id, '몸', FALSE, 3),
    (gen_random_uuid(), q_id, '생각', FALSE, 4);

  -- Q15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「薬」の意味として正しいものはどれですか？',
    '「薬」は「약(藥), 약」という意味です。訓読みは「くすり」です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '약', TRUE, 1),
    (gen_random_uuid(), q_id, '병', FALSE, 2),
    (gen_random_uuid(), q_id, '독', FALSE, 3),
    (gen_random_uuid(), q_id, '물', FALSE, 4);

  -- Q16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「広」の意味として正しいものはどれですか？',
    '「広」は「광(廣), 넓다」という意味です。「広い」（ひろい）は「넓다」です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '넓다', TRUE, 1),
    (gen_random_uuid(), q_id, '좁다', FALSE, 2),
    (gen_random_uuid(), q_id, '깊다', FALSE, 3),
    (gen_random_uuid(), q_id, '높다', FALSE, 4);

  -- Q17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「走」の意味として正しいものはどれですか？',
    '「走」は「주(走), 달리다」という意味です。「走る」（はしる）は「달리다」です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '달리다', TRUE, 1),
    (gen_random_uuid(), q_id, '걷다', FALSE, 2),
    (gen_random_uuid(), q_id, '서다', FALSE, 3),
    (gen_random_uuid(), q_id, '앉다', FALSE, 4);

  -- Q18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「重」の意味として正しいものはどれですか？',
    '「重」は「중(重), 무겁다」という意味です。「重い」（おもい）は「무겁다」です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '무겁다', TRUE, 1),
    (gen_random_uuid(), q_id, '가볍다', FALSE, 2),
    (gen_random_uuid(), q_id, '크다', FALSE, 3),
    (gen_random_uuid(), q_id, '작다', FALSE, 4);

  -- Q19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「借」の意味として正しいものはどれですか？',
    '「借」は「차(借), 빌리다」という意味です。「借りる」（かりる）は「빌리다」です。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빌리다', TRUE, 1),
    (gen_random_uuid(), q_id, '빌려주다', FALSE, 2),
    (gen_random_uuid(), q_id, '사다', FALSE, 3),
    (gen_random_uuid(), q_id, '팔다', FALSE, 4);

  -- Q20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「風」の意味として正しいものはどれですか？',
    '「風」は「풍(風), 바람」という意味です。訓読みは「かぜ」です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '바람', TRUE, 1),
    (gen_random_uuid(), q_id, '비', FALSE, 2),
    (gen_random_uuid(), q_id, '구름', FALSE, 3),
    (gen_random_uuid(), q_id, '눈', FALSE, 4);

  -- === 漢字選択問題 (Q21-Q30) ===

  -- Q21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「はたらく」と読む漢字はどれですか？',
    '「働」は訓読みで「はたらく」と読みます。「일하다」という意味です。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '働', TRUE, 1),
    (gen_random_uuid(), q_id, '動', FALSE, 2),
    (gen_random_uuid(), q_id, '力', FALSE, 3),
    (gen_random_uuid(), q_id, '仕', FALSE, 4);

  -- Q22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「의사」に当たる漢字の組み合わせはどれですか？',
    '「医者」は「의사」という意味です。「医」の音読みは「イ」です。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '医者', TRUE, 1),
    (gen_random_uuid(), q_id, '薬者', FALSE, 2),
    (gen_random_uuid(), q_id, '病者', FALSE, 3),
    (gen_random_uuid(), q_id, '院者', FALSE, 4);

  -- Q23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「おもう」と読む漢字はどれですか？',
    '「思」は訓読みで「おもう」と読みます。「생각하다」という意味です。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '思', TRUE, 1),
    (gen_random_uuid(), q_id, '考', FALSE, 2),
    (gen_random_uuid(), q_id, '意', FALSE, 3),
    (gen_random_uuid(), q_id, '心', FALSE, 4);

  -- Q24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「겨울」に当たる漢字はどれですか？',
    '「冬」は「겨울」という意味です。訓読みは「ふゆ」です。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '冬', TRUE, 1),
    (gen_random_uuid(), q_id, '春', FALSE, 2),
    (gen_random_uuid(), q_id, '夏', FALSE, 3),
    (gen_random_uuid(), q_id, '秋', FALSE, 4);

  -- Q25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「あるく」と読む漢字はどれですか？',
    '「歩」は訓読みで「あるく」と読みます。「걷다」という意味です。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '歩', TRUE, 1),
    (gen_random_uuid(), q_id, '走', FALSE, 2),
    (gen_random_uuid(), q_id, '進', FALSE, 3),
    (gen_random_uuid(), q_id, '通', FALSE, 4);

  -- Q26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「소중하다」に当たる漢字の組み合わせはどれですか？',
    '「大切」は「소중하다」という意味です。「大」は「ダイ」、「切」は「セツ」と読みます。',
    2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '大切', TRUE, 1),
    (gen_random_uuid(), q_id, '大変', FALSE, 2),
    (gen_random_uuid(), q_id, '重要', FALSE, 3),
    (gen_random_uuid(), q_id, '特別', FALSE, 4);

  -- Q27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「かお」と読む漢字はどれですか？',
    '「顔」は訓読みで「かお」と読みます。「얼굴」という意味です。',
    2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '顔', TRUE, 1),
    (gen_random_uuid(), q_id, '頭', FALSE, 2),
    (gen_random_uuid(), q_id, '首', FALSE, 3),
    (gen_random_uuid(), q_id, '鼻', FALSE, 4);

  -- Q28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「다르다」に当たる漢字はどれですか？',
    '「違」は「다르다」という意味です。「違う」（ちがう）は「다르다」です。',
    2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '違', TRUE, 1),
    (gen_random_uuid(), q_id, '同', FALSE, 2),
    (gen_random_uuid(), q_id, '変', FALSE, 3),
    (gen_random_uuid(), q_id, '別', FALSE, 4);

  -- Q29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「おくる」と読む漢字はどれですか？',
    '「送」は訓読みで「おくる」と読みます。「보내다」という意味です。',
    2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '送', TRUE, 1),
    (gen_random_uuid(), q_id, '届', FALSE, 2),
    (gen_random_uuid(), q_id, '運', FALSE, 3),
    (gen_random_uuid(), q_id, '通', FALSE, 4);

  -- Q30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「경험」に当たる漢字の組み合わせはどれですか？',
    '「経験」は「경험」という意味です。「経」は「ケイ」、「験」は「ケン」と読みます。',
    2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '経験', TRUE, 1),
    (gen_random_uuid(), q_id, '試験', FALSE, 2),
    (gen_random_uuid(), q_id, '経済', FALSE, 3),
    (gen_random_uuid(), q_id, '研究', FALSE, 4);

END $$;

-- ============================================
-- N3 漢字テスト (30 questions)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'ca000003-0000-0000-0000-000000000003';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'N3漢字テスト', 'jlpt_kanji', 70, 15, FALSE, NULL);

  -- === 読み方問題 (Q1-Q10) ===

  -- Q1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「経験」の読み方として正しいものはどれですか？',
    '「経験」は「けいけん」と読みます。「経」の音読みは「ケイ」、「験」の音読みは「ケン」です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けいけん', TRUE, 1),
    (gen_random_uuid(), q_id, 'きょうけん', FALSE, 2),
    (gen_random_uuid(), q_id, 'けいげん', FALSE, 3),
    (gen_random_uuid(), q_id, 'けいかん', FALSE, 4);

  -- Q2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「受付」の読み方として正しいものはどれですか？',
    '「受付」は「うけつけ」と読みます。「受」の訓読みは「う.ける」、「付」の訓読みは「つ.ける」です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'うけつけ', TRUE, 1),
    (gen_random_uuid(), q_id, 'じゅふ', FALSE, 2),
    (gen_random_uuid(), q_id, 'うけつき', FALSE, 3),
    (gen_random_uuid(), q_id, 'じゅつけ', FALSE, 4);

  -- Q3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「届ける」の読み方として正しいものはどれですか？',
    '「届ける」は「とどける」と読みます。「届」の訓読みは「とど.ける」です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'とどける', TRUE, 1),
    (gen_random_uuid(), q_id, 'おくける', FALSE, 2),
    (gen_random_uuid(), q_id, 'つける', FALSE, 3),
    (gen_random_uuid(), q_id, 'きょける', FALSE, 4);

  -- Q4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「商品」の読み方として正しいものはどれですか？',
    '「商品」は「しょうひん」と読みます。「商」の音読みは「ショウ」、「品」の音読みは「ヒン」です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しょうひん', TRUE, 1),
    (gen_random_uuid(), q_id, 'あきひん', FALSE, 2),
    (gen_random_uuid(), q_id, 'しょうしな', FALSE, 3),
    (gen_random_uuid(), q_id, 'しょうぴん', FALSE, 4);

  -- Q5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「景色」の読み方として正しいものはどれですか？',
    '「景色」は「けしき」と読みます。「景」の音読みは「ケイ」ですが、「景色」は慣用読みで「けしき」です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けしき', TRUE, 1),
    (gen_random_uuid(), q_id, 'けいしょく', FALSE, 2),
    (gen_random_uuid(), q_id, 'けいしき', FALSE, 3),
    (gen_random_uuid(), q_id, 'かげいろ', FALSE, 4);

  -- Q6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「相談」の読み方として正しいものはどれですか？',
    '「相談」は「そうだん」と読みます。「相」の音読みは「ソウ」、「談」の音読みは「ダン」です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そうだん', TRUE, 1),
    (gen_random_uuid(), q_id, 'あいだん', FALSE, 2),
    (gen_random_uuid(), q_id, 'そうたん', FALSE, 3),
    (gen_random_uuid(), q_id, 'しょうだん', FALSE, 4);

  -- Q7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「預ける」の読み方として正しいものはどれですか？',
    '「預ける」は「あずける」と読みます。「預」の訓読みは「あず.ける」です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あずける', TRUE, 1),
    (gen_random_uuid(), q_id, 'よける', FALSE, 2),
    (gen_random_uuid(), q_id, 'あたえる', FALSE, 3),
    (gen_random_uuid(), q_id, 'つける', FALSE, 4);

  -- Q8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「環境」の読み方として正しいものはどれですか？',
    '「環境」は「かんきょう」と読みます。「環」の音読みは「カン」、「境」の音読みは「キョウ」です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'かんきょう', TRUE, 1),
    (gen_random_uuid(), q_id, 'たまきょう', FALSE, 2),
    (gen_random_uuid(), q_id, 'かんけい', FALSE, 3),
    (gen_random_uuid(), q_id, 'わんきょう', FALSE, 4);

  -- Q9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「確認」の読み方として正しいものはどれですか？',
    '「確認」は「かくにん」と読みます。「確」の音読みは「カク」、「認」の音読みは「ニン」です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'かくにん', TRUE, 1),
    (gen_random_uuid(), q_id, 'たしにん', FALSE, 2),
    (gen_random_uuid(), q_id, 'かくじん', FALSE, 3),
    (gen_random_uuid(), q_id, 'かくみと', FALSE, 4);

  -- Q10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「規則」の読み方として正しいものはどれですか？',
    '「規則」は「きそく」と読みます。「規」の音読みは「キ」、「則」の音読みは「ソク」です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'きそく', TRUE, 1),
    (gen_random_uuid(), q_id, 'きのり', FALSE, 2),
    (gen_random_uuid(), q_id, 'きぞく', FALSE, 3),
    (gen_random_uuid(), q_id, 'のりそく', FALSE, 4);

  -- === 意味問題 (Q11-Q20) ===

  -- Q11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「届」の意味として正しいものはどれですか？',
    '「届」は「届ける」（とどける）で「전달하다, 닿다」という意味です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전달하다', TRUE, 1),
    (gen_random_uuid(), q_id, '보내다', FALSE, 2),
    (gen_random_uuid(), q_id, '받다', FALSE, 3),
    (gen_random_uuid(), q_id, '열다', FALSE, 4);

  -- Q12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「集」の意味として正しいものはどれですか？',
    '「集」は「집(集), 모으다」という意味です。「集める」（あつめる）は「모으다」です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모으다', TRUE, 1),
    (gen_random_uuid(), q_id, '나누다', FALSE, 2),
    (gen_random_uuid(), q_id, '놓다', FALSE, 3),
    (gen_random_uuid(), q_id, '잡다', FALSE, 4);

  -- Q13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「落」の意味として正しいものはどれですか？',
    '「落」は「락(落), 떨어지다」という意味です。「落ちる」（おちる）は「떨어지다」です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '떨어지다', TRUE, 1),
    (gen_random_uuid(), q_id, '올라가다', FALSE, 2),
    (gen_random_uuid(), q_id, '날다', FALSE, 3),
    (gen_random_uuid(), q_id, '뛰다', FALSE, 4);

  -- Q14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「島」の意味として正しいものはどれですか？',
    '「島」は「도(島), 섬」という意味です。訓読みは「しま」です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '섬', TRUE, 1),
    (gen_random_uuid(), q_id, '호수', FALSE, 2),
    (gen_random_uuid(), q_id, '반도', FALSE, 3),
    (gen_random_uuid(), q_id, '대륙', FALSE, 4);

  -- Q15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「配」の意味として正しいものはどれですか？',
    '「配」は「배(配), 나누다, 배달하다」という意味です。「配る」（くばる）は「나누다」です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '나누다', TRUE, 1),
    (gen_random_uuid(), q_id, '모으다', FALSE, 2),
    (gen_random_uuid(), q_id, '숨기다', FALSE, 3),
    (gen_random_uuid(), q_id, '던지다', FALSE, 4);

  -- Q16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「港」の意味として正しいものはどれですか？',
    '「港」は「항(港), 항구」という意味です。訓読みは「みなと」です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '항구', TRUE, 1),
    (gen_random_uuid(), q_id, '공항', FALSE, 2),
    (gen_random_uuid(), q_id, '다리', FALSE, 3),
    (gen_random_uuid(), q_id, '역', FALSE, 4);

  -- Q17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「祭」の意味として正しいものはどれですか？',
    '「祭」は「제(祭), 축제」という意味です。訓読みは「まつり」です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '축제', TRUE, 1),
    (gen_random_uuid(), q_id, '행사', FALSE, 2),
    (gen_random_uuid(), q_id, '제사', FALSE, 3),
    (gen_random_uuid(), q_id, '모임', FALSE, 4);

  -- Q18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「深」の意味として正しいものはどれですか？',
    '「深」は「심(深), 깊다」という意味です。「深い」（ふかい）は「깊다」です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '깊다', TRUE, 1),
    (gen_random_uuid(), q_id, '얕다', FALSE, 2),
    (gen_random_uuid(), q_id, '넓다', FALSE, 3),
    (gen_random_uuid(), q_id, '좁다', FALSE, 4);

  -- Q19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「庭」の意味として正しいものはどれですか？',
    '「庭」は「정(庭), 정원, 뜰」という意味です。訓読みは「にわ」です。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정원', TRUE, 1),
    (gen_random_uuid(), q_id, '지붕', FALSE, 2),
    (gen_random_uuid(), q_id, '방', FALSE, 3),
    (gen_random_uuid(), q_id, '벽', FALSE, 4);

  -- Q20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「央」の意味として正しいものはどれですか？',
    '「央」は「앙(央), 가운데」という意味です。「中央」（ちゅうおう）は「중앙」です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가운데', TRUE, 1),
    (gen_random_uuid(), q_id, '바깥', FALSE, 2),
    (gen_random_uuid(), q_id, '위', FALSE, 3),
    (gen_random_uuid(), q_id, '옆', FALSE, 4);

  -- === 漢字選択問題 (Q21-Q30) ===

  -- Q21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「きめる」と読む漢字はどれですか？',
    '「決」は訓読みで「きめる」と読みます。「결정하다」という意味です。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '決', TRUE, 1),
    (gen_random_uuid(), q_id, '定', FALSE, 2),
    (gen_random_uuid(), q_id, '固', FALSE, 3),
    (gen_random_uuid(), q_id, '結', FALSE, 4);

  -- Q22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「조사하다」に当たる漢字はどれですか？',
    '「調」は「조사하다」に関連する漢字です。「調べる」（しらべる）は「조사하다」です。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '調', TRUE, 1),
    (gen_random_uuid(), q_id, '査', FALSE, 2),
    (gen_random_uuid(), q_id, '探', FALSE, 3),
    (gen_random_uuid(), q_id, '検', FALSE, 4);

  -- Q23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「なおす」と読む漢字はどれですか？',
    '「直」は訓読みで「なおす」と読みます。「고치다, 바로잡다」という意味です。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '直', TRUE, 1),
    (gen_random_uuid(), q_id, '修', FALSE, 2),
    (gen_random_uuid(), q_id, '治', FALSE, 3),
    (gen_random_uuid(), q_id, '正', FALSE, 4);

  -- Q24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「놀라다」に当たる漢字はどれですか？',
    '「驚」は「놀라다」という意味です。「驚く」（おどろく）は「놀라다」です。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '驚', TRUE, 1),
    (gen_random_uuid(), q_id, '怒', FALSE, 2),
    (gen_random_uuid(), q_id, '泣', FALSE, 3),
    (gen_random_uuid(), q_id, '笑', FALSE, 4);

  -- Q25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「すすめる」と読む漢字はどれですか？',
    '「進」は訓読みで「すすめる」と読みます。「진행하다, 나아가다」という意味です。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '進', TRUE, 1),
    (gen_random_uuid(), q_id, '送', FALSE, 2),
    (gen_random_uuid(), q_id, '運', FALSE, 3),
    (gen_random_uuid(), q_id, '歩', FALSE, 4);

  -- Q26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「인구」に当たる漢字の組み合わせはどれですか？',
    '「人口」は「인구」という意味です。「人」は「ジン」、「口」は「コウ」と読みます。',
    2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '人口', TRUE, 1),
    (gen_random_uuid(), q_id, '人数', FALSE, 2),
    (gen_random_uuid(), q_id, '入口', FALSE, 3),
    (gen_random_uuid(), q_id, '出口', FALSE, 4);

  -- Q27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「はこぶ」と読む漢字はどれですか？',
    '「運」は訓読みで「はこぶ」と読みます。「운반하다, 나르다」という意味です。',
    2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '運', TRUE, 1),
    (gen_random_uuid(), q_id, '送', FALSE, 2),
    (gen_random_uuid(), q_id, '届', FALSE, 3),
    (gen_random_uuid(), q_id, '持', FALSE, 4);

  -- Q28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「안전」に当たる漢字の組み合わせはどれですか？',
    '「安全」は「안전」という意味です。「安」は「アン」、「全」は「ゼン」と読みます。',
    2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '安全', TRUE, 1),
    (gen_random_uuid(), q_id, '安心', FALSE, 2),
    (gen_random_uuid(), q_id, '完全', FALSE, 3),
    (gen_random_uuid(), q_id, '安定', FALSE, 4);

  -- Q29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「つたえる」と読む漢字はどれですか？',
    '「伝」は訓読みで「つたえる」と読みます。「전하다」という意味です。',
    2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '伝', TRUE, 1),
    (gen_random_uuid(), q_id, '届', FALSE, 2),
    (gen_random_uuid(), q_id, '告', FALSE, 3),
    (gen_random_uuid(), q_id, '知', FALSE, 4);

  -- Q30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「교통」に当たる漢字の組み合わせはどれですか？',
    '「交通」は「교통」という意味です。「交」は「コウ」、「通」は「ツウ」と読みます。',
    2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '交通', TRUE, 1),
    (gen_random_uuid(), q_id, '通行', FALSE, 2),
    (gen_random_uuid(), q_id, '交差', FALSE, 3),
    (gen_random_uuid(), q_id, '通信', FALSE, 4);

END $$;

-- ============================================
-- N2 漢字テスト (30 questions)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'ca000004-0000-0000-0000-000000000004';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'N2漢字テスト', 'jlpt_kanji', 70, 15, FALSE, NULL);

  -- === 読み方問題 (Q1-Q10) ===

  -- Q1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「就職」の読み方として正しいものはどれですか？',
    '「就職」は「しゅうしょく」と読みます。「就」の音読みは「シュウ」、「職」の音読みは「ショク」です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しゅうしょく', TRUE, 1),
    (gen_random_uuid(), q_id, 'じゅうしょく', FALSE, 2),
    (gen_random_uuid(), q_id, 'しゅしょく', FALSE, 3),
    (gen_random_uuid(), q_id, 'しゅうしき', FALSE, 4);

  -- Q2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「貿易」の読み方として正しいものはどれですか？',
    '「貿易」は「ぼうえき」と読みます。「貿」の音読みは「ボウ」、「易」の音読みは「エキ」です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ぼうえき', TRUE, 1),
    (gen_random_uuid(), q_id, 'かいえき', FALSE, 2),
    (gen_random_uuid(), q_id, 'ぼうやく', FALSE, 3),
    (gen_random_uuid(), q_id, 'ほうえき', FALSE, 4);

  -- Q3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「革命」の読み方として正しいものはどれですか？',
    '「革命」は「かくめい」と読みます。「革」の音読みは「カク」、「命」の音読みは「メイ」です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'かくめい', TRUE, 1),
    (gen_random_uuid(), q_id, 'かわめい', FALSE, 2),
    (gen_random_uuid(), q_id, 'かくみょう', FALSE, 3),
    (gen_random_uuid(), q_id, 'げきめい', FALSE, 4);

  -- Q4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「講義」の読み方として正しいものはどれですか？',
    '「講義」は「こうぎ」と読みます。「講」の音読みは「コウ」、「義」の音読みは「ギ」です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こうぎ', TRUE, 1),
    (gen_random_uuid(), q_id, 'こうよし', FALSE, 2),
    (gen_random_uuid(), q_id, 'ごうぎ', FALSE, 3),
    (gen_random_uuid(), q_id, 'こうげ', FALSE, 4);

  -- Q5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「維持」の読み方として正しいものはどれですか？',
    '「維持」は「いじ」と読みます。「維」の音読みは「イ」、「持」の音読みは「ジ」です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いじ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ゆいじ', FALSE, 2),
    (gen_random_uuid(), q_id, 'いち', FALSE, 3),
    (gen_random_uuid(), q_id, 'いもち', FALSE, 4);

  -- Q6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「挑戦」の読み方として正しいものはどれですか？',
    '「挑戦」は「ちょうせん」と読みます。「挑」の音読みは「チョウ」、「戦」の音読みは「セン」です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ちょうせん', TRUE, 1),
    (gen_random_uuid(), q_id, 'とうせん', FALSE, 2),
    (gen_random_uuid(), q_id, 'ちょうたた', FALSE, 3),
    (gen_random_uuid(), q_id, 'ちょうぜん', FALSE, 4);

  -- Q7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「効率」の読み方として正しいものはどれですか？',
    '「効率」は「こうりつ」と読みます。「効」の音読みは「コウ」、「率」の音読みは「リツ」です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こうりつ', TRUE, 1),
    (gen_random_uuid(), q_id, 'こうそつ', FALSE, 2),
    (gen_random_uuid(), q_id, 'きくりつ', FALSE, 3),
    (gen_random_uuid(), q_id, 'こうれつ', FALSE, 4);

  -- Q8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「覆す」の読み方として正しいものはどれですか？',
    '「覆す」は「くつがえす」と読みます。「覆」の訓読みは「くつがえ.す、おお.う」です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'くつがえす', TRUE, 1),
    (gen_random_uuid(), q_id, 'おおす', FALSE, 2),
    (gen_random_uuid(), q_id, 'ふくす', FALSE, 3),
    (gen_random_uuid(), q_id, 'ひっくりす', FALSE, 4);

  -- Q9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「把握」の読み方として正しいものはどれですか？',
    '「把握」は「はあく」と読みます。「把」の音読みは「ハ」、「握」の音読みは「アク」です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'はあく', TRUE, 1),
    (gen_random_uuid(), q_id, 'ばあく', FALSE, 2),
    (gen_random_uuid(), q_id, 'はにぎ', FALSE, 3),
    (gen_random_uuid(), q_id, 'はやく', FALSE, 4);

  -- Q10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「奮闘」の読み方として正しいものはどれですか？',
    '「奮闘」は「ふんとう」と読みます。「奮」の音読みは「フン」、「闘」の音読みは「トウ」です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ふんとう', TRUE, 1),
    (gen_random_uuid(), q_id, 'ぶんとう', FALSE, 2),
    (gen_random_uuid(), q_id, 'ふんたた', FALSE, 3),
    (gen_random_uuid(), q_id, 'ふんどう', FALSE, 4);

  -- === 意味問題 (Q11-Q20) ===

  -- Q11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「偶」の意味として正しいものはどれですか？',
    '「偶」は「우(偶), 우연」という意味です。「偶然」（ぐうぜん）は「우연」です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '우연', TRUE, 1),
    (gen_random_uuid(), q_id, '필연', FALSE, 2),
    (gen_random_uuid(), q_id, '홀수', FALSE, 3),
    (gen_random_uuid(), q_id, '반드시', FALSE, 4);

  -- Q12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「誇」の意味として正しいものはどれですか？',
    '「誇」は「과(誇), 자랑하다」という意味です。「誇る」（ほこる）は「자랑하다」です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자랑하다', TRUE, 1),
    (gen_random_uuid(), q_id, '부끄럽다', FALSE, 2),
    (gen_random_uuid(), q_id, '슬프다', FALSE, 3),
    (gen_random_uuid(), q_id, '기쁘다', FALSE, 4);

  -- Q13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「拠」の意味として正しいものはどれですか？',
    '「拠」は「거(據), 근거」という意味です。「根拠」（こんきょ）は「근거」です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '근거', TRUE, 1),
    (gen_random_uuid(), q_id, '추측하다', FALSE, 2),
    (gen_random_uuid(), q_id, '설명하다', FALSE, 3),
    (gen_random_uuid(), q_id, '증명하다', FALSE, 4);

  -- Q14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「棄」の意味として正しいものはどれですか？',
    '「棄」は「기(棄), 버리다」という意味です。「廃棄」（はいき）は「폐기」です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버리다', TRUE, 1),
    (gen_random_uuid(), q_id, '줍다', FALSE, 2),
    (gen_random_uuid(), q_id, '모으다', FALSE, 3),
    (gen_random_uuid(), q_id, '쌓다', FALSE, 4);

  -- Q15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「促」の意味として正しいものはどれですか？',
    '「促」は「촉(促), 재촉하다」という意味です。「促す」（うながす）は「재촉하다」です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재촉하다', TRUE, 1),
    (gen_random_uuid(), q_id, '막다', FALSE, 2),
    (gen_random_uuid(), q_id, '늦추다', FALSE, 3),
    (gen_random_uuid(), q_id, '기다리다', FALSE, 4);

  -- Q16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「漏」の意味として正しいものはどれですか？',
    '「漏」は「루(漏), 새다」という意味です。「漏れる」（もれる）は「새다」です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새다', TRUE, 1),
    (gen_random_uuid(), q_id, '흐르다', FALSE, 2),
    (gen_random_uuid(), q_id, '넘치다', FALSE, 3),
    (gen_random_uuid(), q_id, '채우다', FALSE, 4);

  -- Q17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「兼」の意味として正しいものはどれですか？',
    '「兼」は「겸(兼), 겸하다」という意味です。「兼ねる」（かねる）は「겸하다」です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '겸하다', TRUE, 1),
    (gen_random_uuid(), q_id, '나누다', FALSE, 2),
    (gen_random_uuid(), q_id, '합치다', FALSE, 3),
    (gen_random_uuid(), q_id, '빼다', FALSE, 4);

  -- Q18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「繰」の意味として正しいものはどれですか？',
    '「繰」は「조(繰), 반복하다, 감다」という意味です。「繰り返す」（くりかえす）は「반복하다」です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '반복하다', TRUE, 1),
    (gen_random_uuid(), q_id, '풀다', FALSE, 2),
    (gen_random_uuid(), q_id, '자르다', FALSE, 3),
    (gen_random_uuid(), q_id, '엮다', FALSE, 4);

  -- Q19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「遮」の意味として正しいものはどれですか？',
    '「遮」は「차(遮), 가리다, 막다」という意味です。「遮る」（さえぎる）は「가로막다」です。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가리다', TRUE, 1),
    (gen_random_uuid(), q_id, '열다', FALSE, 2),
    (gen_random_uuid(), q_id, '보이다', FALSE, 3),
    (gen_random_uuid(), q_id, '통과하다', FALSE, 4);

  -- Q20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「雇」の意味として正しいものはどれですか？',
    '「雇」は「고(雇), 고용하다」という意味です。「雇う」（やとう）は「고용하다」です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '고용하다', TRUE, 1),
    (gen_random_uuid(), q_id, '해고하다', FALSE, 2),
    (gen_random_uuid(), q_id, '사직하다', FALSE, 3),
    (gen_random_uuid(), q_id, '출근하다', FALSE, 4);

  -- === 漢字選択問題 (Q21-Q30) ===

  -- Q21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「うながす」と読む漢字はどれですか？',
    '「促」は訓読みで「うながす」と読みます。「재촉하다」という意味です。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '促', TRUE, 1),
    (gen_random_uuid(), q_id, '速', FALSE, 2),
    (gen_random_uuid(), q_id, '催', FALSE, 3),
    (gen_random_uuid(), q_id, '迫', FALSE, 4);

  -- Q22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「수출」に当たる漢字の組み合わせはどれですか？',
    '「輸出」は「수출」という意味です。「輸」は「ユ」、「出」は「シュツ」と読みます。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '輸出', TRUE, 1),
    (gen_random_uuid(), q_id, '輸入', FALSE, 2),
    (gen_random_uuid(), q_id, '産出', FALSE, 3),
    (gen_random_uuid(), q_id, '搬出', FALSE, 4);

  -- Q23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「おぎなう」と読む漢字はどれですか？',
    '「補」は訓読みで「おぎなう」と読みます。「보충하다」という意味です。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '補', TRUE, 1),
    (gen_random_uuid(), q_id, '捕', FALSE, 2),
    (gen_random_uuid(), q_id, '舗', FALSE, 3),
    (gen_random_uuid(), q_id, '保', FALSE, 4);

  -- Q24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「경쟁」に当たる漢字の組み合わせはどれですか？',
    '「競争」は「경쟁」という意味です。「競」は「キョウ」、「争」は「ソウ」と読みます。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '競争', TRUE, 1),
    (gen_random_uuid(), q_id, '戦争', FALSE, 2),
    (gen_random_uuid(), q_id, '競技', FALSE, 3),
    (gen_random_uuid(), q_id, '闘争', FALSE, 4);

  -- Q25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「さまたげる」と読む漢字はどれですか？',
    '「妨」は訓読みで「さまたげる」と読みます。「방해하다」という意味です。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '妨', TRUE, 1),
    (gen_random_uuid(), q_id, '防', FALSE, 2),
    (gen_random_uuid(), q_id, '阻', FALSE, 3),
    (gen_random_uuid(), q_id, '遮', FALSE, 4);

  -- Q26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「소비」に当たる漢字の組み合わせはどれですか？',
    '「消費」は「소비」という意味です。「消」は「ショウ」、「費」は「ヒ」と読みます。',
    2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '消費', TRUE, 1),
    (gen_random_uuid(), q_id, '浪費', FALSE, 2),
    (gen_random_uuid(), q_id, '消化', FALSE, 3),
    (gen_random_uuid(), q_id, '経費', FALSE, 4);

  -- Q27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「こころみる」と読む漢字はどれですか？',
    '「試」は訓読みで「こころみる」と読みます。「시험해보다」という意味です。',
    2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '試', TRUE, 1),
    (gen_random_uuid(), q_id, '験', FALSE, 2),
    (gen_random_uuid(), q_id, '探', FALSE, 3),
    (gen_random_uuid(), q_id, '挑', FALSE, 4);

  -- Q28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「보수」に当たる漢字の組み合わせはどれですか？',
    '「報酬」は「보수」という意味です。「報」は「ホウ」、「酬」は「シュウ」と読みます。',
    2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '報酬', TRUE, 1),
    (gen_random_uuid(), q_id, '報告', FALSE, 2),
    (gen_random_uuid(), q_id, '保守', FALSE, 3),
    (gen_random_uuid(), q_id, '補修', FALSE, 4);

  -- Q29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「つぐなう」と読む漢字はどれですか？',
    '「償」は訓読みで「つぐなう」と読みます。「보상하다, 갚다」という意味です。',
    2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '償', TRUE, 1),
    (gen_random_uuid(), q_id, '賠', FALSE, 2),
    (gen_random_uuid(), q_id, '返', FALSE, 3),
    (gen_random_uuid(), q_id, '弁', FALSE, 4);

  -- Q30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「영향」に当たる漢字の組み合わせはどれですか？',
    '「影響」は「영향」という意味です。「影」は「エイ」、「響」は「キョウ」と読みます。',
    2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '影響', TRUE, 1),
    (gen_random_uuid(), q_id, '反響', FALSE, 2),
    (gen_random_uuid(), q_id, '影像', FALSE, 3),
    (gen_random_uuid(), q_id, '音響', FALSE, 4);

END $$;

-- ============================================
-- N1 漢字テスト (30 questions)
-- ============================================
DO $$
DECLARE quiz_id UUID := 'ca000005-0000-0000-0000-000000000005';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'N1漢字テスト', 'jlpt_kanji', 70, 15, FALSE, NULL);

  -- === 読み方問題 (Q1-Q10) ===

  -- Q1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「曖昧」の読み方として正しいものはどれですか？',
    '「曖昧」は「あいまい」と読みます。「曖」の音読みは「アイ」、「昧」の音読みは「マイ」です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'あいまい', TRUE, 1),
    (gen_random_uuid(), q_id, 'がいまい', FALSE, 2),
    (gen_random_uuid(), q_id, 'あいばい', FALSE, 3),
    (gen_random_uuid(), q_id, 'わいまい', FALSE, 4);

  -- Q2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「憂鬱」の読み方として正しいものはどれですか？',
    '「憂鬱」は「ゆううつ」と読みます。「憂」の音読みは「ユウ」、「鬱」の音読みは「ウツ」です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ゆううつ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ういつ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ゆうつ', FALSE, 3),
    (gen_random_uuid(), q_id, 'うれうつ', FALSE, 4);

  -- Q3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「怠惰」の読み方として正しいものはどれですか？',
    '「怠惰」は「たいだ」と読みます。「怠」の音読みは「タイ」、「惰」の音読みは「ダ」です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'たいだ', TRUE, 1),
    (gen_random_uuid(), q_id, 'おこだ', FALSE, 2),
    (gen_random_uuid(), q_id, 'たいな', FALSE, 3),
    (gen_random_uuid(), q_id, 'けだだ', FALSE, 4);

  -- Q4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「慶弔」の読み方として正しいものはどれですか？',
    '「慶弔」は「けいちょう」と読みます。「慶」の音読みは「ケイ」、「弔」の音読みは「チョウ」です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けいちょう', TRUE, 1),
    (gen_random_uuid(), q_id, 'よろこちょう', FALSE, 2),
    (gen_random_uuid(), q_id, 'けいとむ', FALSE, 3),
    (gen_random_uuid(), q_id, 'きょうちょう', FALSE, 4);

  -- Q5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「顕著」の読み方として正しいものはどれですか？',
    '「顕著」は「けんちょ」と読みます。「顕」の音読みは「ケン」、「著」の音読みは「チョ」です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けんちょ', TRUE, 1),
    (gen_random_uuid(), q_id, 'あきちょ', FALSE, 2),
    (gen_random_uuid(), q_id, 'けんじゃく', FALSE, 3),
    (gen_random_uuid(), q_id, 'げんちょ', FALSE, 4);

  -- Q6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「齟齬」の読み方として正しいものはどれですか？',
    '「齟齬」は「そご」と読みます。「齟」の音読みは「ソ」、「齬」の音読みは「ゴ」です。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そご', TRUE, 1),
    (gen_random_uuid(), q_id, 'しょご', FALSE, 2),
    (gen_random_uuid(), q_id, 'さご', FALSE, 3),
    (gen_random_uuid(), q_id, 'そぎ', FALSE, 4);

  -- Q7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「瞬時」の読み方として正しいものはどれですか？',
    '「瞬時」は「しゅんじ」と読みます。「瞬」の音読みは「シュン」、「時」の音読みは「ジ」です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しゅんじ', TRUE, 1),
    (gen_random_uuid(), q_id, 'またたきじ', FALSE, 2),
    (gen_random_uuid(), q_id, 'しゅんとき', FALSE, 3),
    (gen_random_uuid(), q_id, 'じゅんじ', FALSE, 4);

  -- Q8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「遡及」の読み方として正しいものはどれですか？',
    '「遡及」は「そきゅう」と読みます。「遡」の音読みは「ソ」、「及」の音読みは「キュウ」です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そきゅう', TRUE, 1),
    (gen_random_uuid(), q_id, 'さかきゅう', FALSE, 2),
    (gen_random_uuid(), q_id, 'そぎゅう', FALSE, 3),
    (gen_random_uuid(), q_id, 'そおよ', FALSE, 4);

  -- Q9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「恣意」の読み方として正しいものはどれですか？',
    '「恣意」は「しい」と読みます。「恣」の音読みは「シ」、「意」の音読みは「イ」です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しい', TRUE, 1),
    (gen_random_uuid(), q_id, 'じい', FALSE, 2),
    (gen_random_uuid(), q_id, 'しぎ', FALSE, 3),
    (gen_random_uuid(), q_id, 'きい', FALSE, 4);

  -- Q10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「逼迫」の読み方として正しいものはどれですか？',
    '「逼迫」は「ひっぱく」と読みます。「逼」の音読みは「ヒツ」、「迫」の音読みは「ハク」です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ひっぱく', TRUE, 1),
    (gen_random_uuid(), q_id, 'ひつはく', FALSE, 2),
    (gen_random_uuid(), q_id, 'ひっぱつ', FALSE, 3),
    (gen_random_uuid(), q_id, 'へきはく', FALSE, 4);

  -- === 意味問題 (Q11-Q20) ===

  -- Q11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「諮」の意味として正しいものはどれですか？',
    '「諮」は「자(諮), 자문하다」という意味です。「諮問」（しもん）は「자문」です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자문하다', TRUE, 1),
    (gen_random_uuid(), q_id, '질문하다', FALSE, 2),
    (gen_random_uuid(), q_id, '답변하다', FALSE, 3),
    (gen_random_uuid(), q_id, '토론하다', FALSE, 4);

  -- Q12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「紡」の意味として正しいものはどれですか？',
    '「紡」は「방(紡), 잣다, 뽑다」という意味です。「紡ぐ」（つむぐ）は「실을 잣다」です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '실을 잣다', TRUE, 1),
    (gen_random_uuid(), q_id, '실을 끊다', FALSE, 2),
    (gen_random_uuid(), q_id, '천을 짜다', FALSE, 3),
    (gen_random_uuid(), q_id, '옷을 만들다', FALSE, 4);

  -- Q13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「拘」の意味として正しいものはどれですか？',
    '「拘」は「구(拘), 구속하다, 구애하다」という意味です。「拘る」（こだわる）は「구애되다, 집착하다」です。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '구속하다', TRUE, 1),
    (gen_random_uuid(), q_id, '풀어주다', FALSE, 2),
    (gen_random_uuid(), q_id, '도망치다', FALSE, 3),
    (gen_random_uuid(), q_id, '포기하다', FALSE, 4);

  -- Q14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「践」の意味として正しいものはどれですか？',
    '「践」は「천(踐), 밟다, 실행하다」という意味です。「実践」（じっせん）は「실천」です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '밟다', TRUE, 1),
    (gen_random_uuid(), q_id, '멈추다', FALSE, 2),
    (gen_random_uuid(), q_id, '뛰다', FALSE, 3),
    (gen_random_uuid(), q_id, '걷다', FALSE, 4);

  -- Q15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「勅」の意味として正しいものはどれですか？',
    '「勅」は「칙(勅), 칙령」という意味です。天皇の命令を意味する字です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '칙령', TRUE, 1),
    (gen_random_uuid(), q_id, '법률', FALSE, 2),
    (gen_random_uuid(), q_id, '헌법', FALSE, 3),
    (gen_random_uuid(), q_id, '판결', FALSE, 4);

  -- Q16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「弊」の意味として正しいものはどれですか？',
    '「弊」は「폐(弊), 폐단, 해로움」という意味です。「弊社」（へいしゃ）は「폐사(자사의 겸양어)」です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '폐단', TRUE, 1),
    (gen_random_uuid(), q_id, '이익, 이점', FALSE, 2),
    (gen_random_uuid(), q_id, '평등, 공평', FALSE, 3),
    (gen_random_uuid(), q_id, '닫다, 잠그다', FALSE, 4);

  -- Q17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「賜」の意味として正しいものはどれですか？',
    '「賜」は「사(賜), 하사하다」という意味です。「賜る」（たまわる）は「하사받다」です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하사하다', TRUE, 1),
    (gen_random_uuid(), q_id, '빼앗다', FALSE, 2),
    (gen_random_uuid(), q_id, '빌려주다', FALSE, 3),
    (gen_random_uuid(), q_id, '사다', FALSE, 4);

  -- Q18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「蓄」の意味として正しいものはどれですか？',
    '「蓄」は「축(蓄), 쌓다, 저축하다」という意味です。「蓄える」（たくわえる）は「저축하다」です。',
    2, 18);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '쌓다', TRUE, 1),
    (gen_random_uuid(), q_id, '쓰다, 소비하다', FALSE, 2),
    (gen_random_uuid(), q_id, '빌리다', FALSE, 3),
    (gen_random_uuid(), q_id, '버리다', FALSE, 4);

  -- Q19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「怯」の意味として正しいものはどれですか？',
    '「怯」は「겁(怯), 겁내다」という意味です。「怯える」（おびえる）は「겁내다, 두려워하다」です。',
    2, 19);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '겁내다', TRUE, 1),
    (gen_random_uuid(), q_id, '기뻐하다', FALSE, 2),
    (gen_random_uuid(), q_id, '화내다', FALSE, 3),
    (gen_random_uuid(), q_id, '놀라다', FALSE, 4);

  -- Q20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「斥」の意味として正しいものはどれですか？',
    '「斥」は「척(斥), 물리치다, 배척하다」という意味です。「排斥」（はいせき）は「배척」です。',
    2, 20);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '물리치다', TRUE, 1),
    (gen_random_uuid(), q_id, '받아들이다', FALSE, 2),
    (gen_random_uuid(), q_id, '환영하다', FALSE, 3),
    (gen_random_uuid(), q_id, '초대하다', FALSE, 4);

  -- === 漢字選択問題 (Q21-Q30) ===

  -- Q21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「はばむ」と読む漢字はどれですか？',
    '「阻」は訓読みで「はばむ」と読みます。「저지하다, 막다」という意味です。',
    2, 21);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '阻', TRUE, 1),
    (gen_random_uuid(), q_id, '妨', FALSE, 2),
    (gen_random_uuid(), q_id, '遮', FALSE, 3),
    (gen_random_uuid(), q_id, '防', FALSE, 4);

  -- Q22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「선동」に当たる漢字の組み合わせはどれですか？',
    '「扇動」は「선동」という意味です。「扇」は「セン」、「動」は「ドウ」と読みます。',
    2, 22);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '扇動', TRUE, 1),
    (gen_random_uuid(), q_id, '煽動', FALSE, 2),
    (gen_random_uuid(), q_id, '運動', FALSE, 3),
    (gen_random_uuid(), q_id, '活動', FALSE, 4);

  -- Q23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「つちかう」と読む漢字はどれですか？',
    '「培」は訓読みで「つちかう」と読みます。「배양하다, 기르다」という意味です。',
    2, 23);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '培', TRUE, 1),
    (gen_random_uuid(), q_id, '倍', FALSE, 2),
    (gen_random_uuid(), q_id, '賠', FALSE, 3),
    (gen_random_uuid(), q_id, '陪', FALSE, 4);

  -- Q24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「모순」に当たる漢字の組み合わせはどれですか？',
    '「矛盾」は「모순」という意味です。「矛」は「ム」、「盾」は「ジュン」と読みます。',
    2, 24);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '矛盾', TRUE, 1),
    (gen_random_uuid(), q_id, '矛先', FALSE, 2),
    (gen_random_uuid(), q_id, '盾突', FALSE, 3),
    (gen_random_uuid(), q_id, '予盾', FALSE, 4);

  -- Q25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「さえぎる」と読む漢字はどれですか？',
    '「遮」は訓読みで「さえぎる」と読みます。「가로막다」という意味です。',
    2, 25);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '遮', TRUE, 1),
    (gen_random_uuid(), q_id, '阻', FALSE, 2),
    (gen_random_uuid(), q_id, '妨', FALSE, 3),
    (gen_random_uuid(), q_id, '隔', FALSE, 4);

  -- Q26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「탄핵」に当たる漢字の組み合わせはどれですか？',
    '「弾劾」は「탄핵」という意味です。「弾」は「ダン」、「劾」は「ガイ」と読みます。',
    2, 26);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '弾劾', TRUE, 1),
    (gen_random_uuid(), q_id, '弾圧', FALSE, 2),
    (gen_random_uuid(), q_id, '糾弾', FALSE, 3),
    (gen_random_uuid(), q_id, '弾力', FALSE, 4);

  -- Q27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「しいたげる」と読む漢字はどれですか？',
    '「虐」は訓読みで「しいたげる」と読みます。「학대하다」という意味です。',
    2, 27);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '虐', TRUE, 1),
    (gen_random_uuid(), q_id, '苦', FALSE, 2),
    (gen_random_uuid(), q_id, '責', FALSE, 3),
    (gen_random_uuid(), q_id, '罰', FALSE, 4);

  -- Q28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「파탄」に当たる漢字の組み合わせはどれですか？',
    '「破綻」は「파탄」という意味です。「破」は「ハ」、「綻」は「タン」と読みます。',
    2, 28);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '破綻', TRUE, 1),
    (gen_random_uuid(), q_id, '破壊', FALSE, 2),
    (gen_random_uuid(), q_id, '破滅', FALSE, 3),
    (gen_random_uuid(), q_id, '破産', FALSE, 4);

  -- Q29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「あがなう」と読む漢字はどれですか？',
    '「贖」は訓読みで「あがなう」と読みます。「속죄하다, 대가를 치르다」という意味です。',
    2, 29);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '贖', TRUE, 1),
    (gen_random_uuid(), q_id, '購', FALSE, 2),
    (gen_random_uuid(), q_id, '償', FALSE, 3),
    (gen_random_uuid(), q_id, '賠', FALSE, 4);

  -- Q30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「침식」に当たる漢字の組み合わせはどれですか？',
    '「侵食」は「침식」という意味です。「侵」は「シン」、「食」は「ショク」と読みます。',
    2, 30);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '侵食', TRUE, 1),
    (gen_random_uuid(), q_id, '侵略', FALSE, 2),
    (gen_random_uuid(), q_id, '浸食', FALSE, 3),
    (gen_random_uuid(), q_id, '侵害', FALSE, 4);

END $$;

-- ============================================
-- Pool Quizzes: 漢字テスト N5~N1（ランダム20問抽出）
-- ============================================
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES
  ('e0000001-0000-0000-0000-000000000051', 'N5 漢字テスト', 'jlpt_kanji', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000052', 'N4 漢字テスト', 'jlpt_kanji', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000053', 'N3 漢字テスト', 'jlpt_kanji', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000054', 'N2 漢字テスト', 'jlpt_kanji', 70, 15, false, true, 20),
  ('e0000001-0000-0000-0000-000000000055', 'N1 漢字テスト', 'jlpt_kanji', 70, 15, false, true, 20)
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- Post-insert: set question_category and difficulty
-- ============================================
UPDATE quiz_questions SET question_category = 'jlpt_kanji', difficulty = 'N5'
WHERE quiz_id = 'ca000001-0000-0000-0000-000000000001';

UPDATE quiz_questions SET question_category = 'jlpt_kanji', difficulty = 'N4'
WHERE quiz_id = 'ca000002-0000-0000-0000-000000000002';

UPDATE quiz_questions SET question_category = 'jlpt_kanji', difficulty = 'N3'
WHERE quiz_id = 'ca000003-0000-0000-0000-000000000003';

UPDATE quiz_questions SET question_category = 'jlpt_kanji', difficulty = 'N2'
WHERE quiz_id = 'ca000004-0000-0000-0000-000000000004';

UPDATE quiz_questions SET question_category = 'jlpt_kanji', difficulty = 'N1'
WHERE quiz_id = 'ca000005-0000-0000-0000-000000000005';

COMMIT;
