-- ============================================
-- J-Bridge Assessment Quiz Seed Data
-- 5 Assessment Quizzes for Onboarding
-- Total: 390 questions, 1560 options
-- ============================================

BEGIN;

-- ============================================
-- 0. Clean up existing assessment data
-- ============================================
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'a0000001-0000-0000-0000-000000000001',
    'a0000002-0000-0000-0000-000000000002',
    'a0000003-0000-0000-0000-000000000003',
    'a0000004-0000-0000-0000-000000000004',
    'a0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'a0000001-0000-0000-0000-000000000001',
  'a0000002-0000-0000-0000-000000000002',
  'a0000003-0000-0000-0000-000000000003',
  'a0000004-0000-0000-0000-000000000004',
  'a0000005-0000-0000-0000-000000000005'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'a0000001-0000-0000-0000-000000000001',
    'a0000002-0000-0000-0000-000000000002',
    'a0000003-0000-0000-0000-000000000003',
    'a0000004-0000-0000-0000-000000000004',
    'a0000005-0000-0000-0000-000000000005'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'a0000001-0000-0000-0000-000000000001',
  'a0000002-0000-0000-0000-000000000002',
  'a0000003-0000-0000-0000-000000000003',
  'a0000004-0000-0000-0000-000000000004',
  'a0000005-0000-0000-0000-000000000005'
);
DELETE FROM quizzes WHERE id IN (
  'a0000001-0000-0000-0000-000000000001',
  'a0000002-0000-0000-0000-000000000002',
  'a0000003-0000-0000-0000-000000000003',
  'a0000004-0000-0000-0000-000000000004',
  'a0000005-0000-0000-0000-000000000005'
);

-- ============================================
-- 1. Assessment Quizzes (5)
-- ============================================
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt) VALUES
  ('a0000001-0000-0000-0000-000000000001', '生活日本語ランク試験', 'jlpt_vocab', 0, 25, TRUE, 30),
  ('a0000002-0000-0000-0000-000000000002', 'ビジネス日本語ランク試験', 'it_terminology', 0, 25, TRUE, 30),
  ('a0000003-0000-0000-0000-000000000003', 'CS知識ランク試験', 'core_programming', 0, 30, TRUE, 30),
  ('a0000004-0000-0000-0000-000000000004', '開発実務能力ランク試験', 'framework', 0, 30, TRUE, 30),
  ('a0000005-0000-0000-0000-000000000005', 'ビジネスリテラシーランク試験', 'attitude_culture', 0, 25, TRUE, 30);

-- ============================================
-- Quiz 1: JLPT 일본어 능력 평가 (90 questions)
-- Easy=N3, Medium=N2, Hard=N1
-- Correct answer positions randomized across sort_order 1-4
-- Distractors improved for plausibility and length balance
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- ==========================================
  -- EASY (N3) - 30 questions (sort_order 1-30)
  -- ==========================================

  -- Q1: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「約束」の意味は何ですか？', '約束(やくそく)は「약속」という意味のN3レベルの名詞です。', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '예약', FALSE, 1),
    (gen_random_uuid(), q_id, '약속', TRUE, 2),
    (gen_random_uuid(), q_id, '약점', FALSE, 3),
    (gen_random_uuid(), q_id, '약국', FALSE, 4);

  -- Q2: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「経験」の意味は何ですか？', '経験(けいけん)は「경험」という意味です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '경제', FALSE, 1),
    (gen_random_uuid(), q_id, '결과', FALSE, 2),
    (gen_random_uuid(), q_id, '연구', FALSE, 3),
    (gen_random_uuid(), q_id, '경험', TRUE, 4);

  -- Q3: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜てもいい」の意味として正しいものは？', '「〜てもいい」は許可を表す文法で、「~해도 된다」という意味です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해도 된다', TRUE, 1),
    (gen_random_uuid(), q_id, '~하면 안 된다', FALSE, 2),
    (gen_random_uuid(), q_id, '~해야만 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶다', FALSE, 4);

  -- Q4: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「届ける」の意味は何ですか？', '届ける(とどける)は「전달하다/배달하다」という意味のN3動詞です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '출발하다', FALSE, 1),
    (gen_random_uuid(), q_id, '도착하다', FALSE, 2),
    (gen_random_uuid(), q_id, '전달하다', TRUE, 3),
    (gen_random_uuid(), q_id, '준비하다', FALSE, 4);

  -- Q5: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜なければならない」の意味は？', '「〜なければならない」は義務を表し、「~하지 않으면 안 된다 / ~해야 한다」という意味です。', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하고 싶다', FALSE, 1),
    (gen_random_uuid(), q_id, '~해야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '~할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '~해도 된다', FALSE, 4);

  -- Q6: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「相談」の意味は何ですか？', '相談(そうだん)は「상담」という意味です。', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '진단', FALSE, 1),
    (gen_random_uuid(), q_id, '질문', FALSE, 2),
    (gen_random_uuid(), q_id, '상담', TRUE, 3),
    (gen_random_uuid(), q_id, '수색', FALSE, 4);

  -- Q7: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「変更」の意味は何ですか？', '変更(へんこう)は「변경」という意味のN3名詞です。', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변화', FALSE, 1),
    (gen_random_uuid(), q_id, '편리', FALSE, 2),
    (gen_random_uuid(), q_id, '평가', FALSE, 3),
    (gen_random_uuid(), q_id, '변경', TRUE, 4);

  -- Q8: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ようにする」の意味として正しいものは？', '「〜ようにする」は努力や習慣化を表し、「~하도록 하다」という意味です。', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~한 적이 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '~할 예정이다', FALSE, 2),
    (gen_random_uuid(), q_id, '~하는 중이다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하도록 하다', TRUE, 4);

  -- Q9: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「集める」の意味は何ですか？', '集める(あつめる)は「모으다」という意味のN3動詞です。', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모으다', TRUE, 1),
    (gen_random_uuid(), q_id, '모이다', FALSE, 2),
    (gen_random_uuid(), q_id, '나누다', FALSE, 3),
    (gen_random_uuid(), q_id, '보내다', FALSE, 4);

  -- Q10: N3 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「田中さんは毎朝6時に起きて、ジョギングをしてから会社に行きます。」\n田中さんは朝、何をしますか？', '文章から田中さんの朝の行動を読み取る問題です。起きてからジョギングをして会社に行くという順序を理解する必要があります。', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회사에 가서 조깅을 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '조깅을 하고 회사에 간다', TRUE, 2),
    (gen_random_uuid(), q_id, '6시에 바로 회사에 간다', FALSE, 3),
    (gen_random_uuid(), q_id, '저녁에 조깅을 하고 쉰다', FALSE, 4);

  -- Q11: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「連絡」の意味は何ですか？', '連絡(れんらく)は「연락」という意味です。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '연락', TRUE, 1),
    (gen_random_uuid(), q_id, '연습', FALSE, 2),
    (gen_random_uuid(), q_id, '연속', FALSE, 3),
    (gen_random_uuid(), q_id, '연휴', FALSE, 4);

  -- Q12: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ことにする」の意味として正しいものは？', '「〜ことにする」は自分の意志で決めることを表し、「~하기로 하다」という意味です。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~한 적이 있다 (경험)', FALSE, 1),
    (gen_random_uuid(), q_id, '~할 수 있다 (가능)', FALSE, 2),
    (gen_random_uuid(), q_id, '~하기로 하다 (결정)', TRUE, 3),
    (gen_random_uuid(), q_id, '~하게 되다 (변화)', FALSE, 4);

  -- Q13: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「比較」の意味は何ですか？', '比較(ひかく)は「비교」という意味のN3名詞です。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비용', FALSE, 1),
    (gen_random_uuid(), q_id, '비교', TRUE, 2),
    (gen_random_uuid(), q_id, '비밀', FALSE, 3),
    (gen_random_uuid(), q_id, '비판', FALSE, 4);

  -- Q14: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「申し込む」の意味は何ですか？', '申し込む(もうしこむ)は「신청하다」という意味のN3動詞です。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설명하다', FALSE, 1),
    (gen_random_uuid(), q_id, '소개하다', FALSE, 2),
    (gen_random_uuid(), q_id, '신고하다', FALSE, 3),
    (gen_random_uuid(), q_id, '신청하다', TRUE, 4);

  -- Q15: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜たばかり」の意味として正しいものは？', '「〜たばかり」は動作が完了して間もないことを表し、「막 ~했다」という意味です。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '막 ~했다', TRUE, 1),
    (gen_random_uuid(), q_id, '아직 ~못했다', FALSE, 2),
    (gen_random_uuid(), q_id, '항상 ~한다', FALSE, 3),
    (gen_random_uuid(), q_id, '곧 ~할 것이다', FALSE, 4);

  -- Q16: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「割合」の意味は何ですか？', '割合(わりあい)は「비율」という意味です。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '할인', FALSE, 1),
    (gen_random_uuid(), q_id, '활용', FALSE, 2),
    (gen_random_uuid(), q_id, '비율', TRUE, 3),
    (gen_random_uuid(), q_id, '배분', FALSE, 4);

  -- Q17: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「参加」の意味は何ですか？', '参加(さんか)は「참가」という意味のN3名詞です。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '참고', FALSE, 1),
    (gen_random_uuid(), q_id, '참석', FALSE, 2),
    (gen_random_uuid(), q_id, '산책', FALSE, 3),
    (gen_random_uuid(), q_id, '참가', TRUE, 4);

  -- Q18: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ために」の意味として正しいものは？（目的）', '「〜ために」は目的を表し、「~하기 위해서」という意味です。', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하기 위해서', TRUE, 1),
    (gen_random_uuid(), q_id, '~했기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '~하는 동안에', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 후에서', FALSE, 4);

  -- Q19: N3 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「この店は安くておいしいので、いつも人が多いです。」\nこの店について正しいものは？', '「安くておいしい」から値段が安くて味が良いことがわかります。「いつも人が多い」から人気があることがわかります。', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비싸지만 맛있어서 항상 사람이 많다', FALSE, 1),
    (gen_random_uuid(), q_id, '싸지만 맛이 없어서 항상 사람이 적다', FALSE, 2),
    (gen_random_uuid(), q_id, '가격이 싸고 맛있어서 항상 사람이 많다', TRUE, 3),
    (gen_random_uuid(), q_id, '비싸고 맛이 없지만 항상 사람이 많다', FALSE, 4);

  -- Q20: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「確認」の意味は何ですか？', '確認(かくにん)は「확인」という意味のN3名詞です。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '확실', FALSE, 1),
    (gen_random_uuid(), q_id, '확대', FALSE, 2),
    (gen_random_uuid(), q_id, '확보', FALSE, 3),
    (gen_random_uuid(), q_id, '확인', TRUE, 4);

  -- Q21: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ようになる」の意味として正しいものは？', '「〜ようになる」は変化を表し、「~하게 되다」という意味です。', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하게 되다', TRUE, 1),
    (gen_random_uuid(), q_id, '~하기로 하다', FALSE, 2),
    (gen_random_uuid(), q_id, '~할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶다', FALSE, 4);

  -- Q22: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「受付」の意味は何ですか？', '受付(うけつけ)は「접수/안내 데스크」という意味です。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수취', FALSE, 1),
    (gen_random_uuid(), q_id, '접수', TRUE, 2),
    (gen_random_uuid(), q_id, '담당', FALSE, 3),
    (gen_random_uuid(), q_id, '수험', FALSE, 4);

  -- Q23: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「調べる」の意味は何ですか？', '調べる(しらべる)は「조사하다/알아보다」という意味のN3動詞です。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '준비하다', FALSE, 1),
    (gen_random_uuid(), q_id, '정리하다', FALSE, 2),
    (gen_random_uuid(), q_id, '조사하다', TRUE, 3),
    (gen_random_uuid(), q_id, '조절하다', FALSE, 4);

  -- Q24: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜てしまう」の意味として正しいものは？', '「〜てしまう」は完了や後悔を表し、「~해 버리다」という意味です。', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해 버리다 (완료/후회)', TRUE, 1),
    (gen_random_uuid(), q_id, '~하고 있다 (진행)', FALSE, 2),
    (gen_random_uuid(), q_id, '~할 것이다 (예정)', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶다 (희망)', FALSE, 4);

  -- Q25: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「予定」の意味は何ですか？', '予定(よてい)は「예정」という意味のN3名詞です。', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '예약', FALSE, 1),
    (gen_random_uuid(), q_id, '예상', FALSE, 2),
    (gen_random_uuid(), q_id, '예산', FALSE, 3),
    (gen_random_uuid(), q_id, '예정', TRUE, 4);

  -- Q26: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「紹介」の意味は何ですか？', '紹介(しょうかい)は「소개」という意味です。', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소개', TRUE, 1),
    (gen_random_uuid(), q_id, '장애', FALSE, 2),
    (gen_random_uuid(), q_id, '상품', FALSE, 3),
    (gen_random_uuid(), q_id, '증명', FALSE, 4);

  -- Q27: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜そうだ」（様態）の使い方として正しいものは？\n例：おいしそうだ', '「〜そうだ」（様態）は見た目からの推測を表し、「~할 것 같다/~해 보인다」という意味です。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~라고 한다 (전문)', FALSE, 1),
    (gen_random_uuid(), q_id, '~해 보인다 (외관 추측)', TRUE, 2),
    (gen_random_uuid(), q_id, '~인 것 같다 (추측)', FALSE, 3),
    (gen_random_uuid(), q_id, '~하기 쉽다 (경향)', FALSE, 4);

  -- Q28: N3 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「明日は雨が降るかもしれないので、傘を持って行ったほうがいいですよ。」\nこの文は何を言っていますか？', '「雨が降るかもしれない」は可能性、「持って行ったほうがいい」はアドバイスを表します。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내일은 반드시 비가 오니 우산을 사야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '비가 올 수 있으니 우산을 가져가는 게 좋다', TRUE, 2),
    (gen_random_uuid(), q_id, '내일은 비가 오지 않으니 우산이 필요 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '비가 그치면 우산을 가져가는 게 좋다', FALSE, 4);

  -- Q29: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「準備」の意味は何ですか？', '準備(じゅんび)は「준비」という意味のN3名詞です。', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주의', FALSE, 1),
    (gen_random_uuid(), q_id, '주문', FALSE, 2),
    (gen_random_uuid(), q_id, '준비', TRUE, 3),
    (gen_random_uuid(), q_id, '주장', FALSE, 4);

  -- Q30: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜はずだ」の意味として正しいものは？', '「〜はずだ」は確信のある推測を表し、「~일 것이다/~할 것이다」という意味です。', 1, 30, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해야 한다 (의무)', FALSE, 1),
    (gen_random_uuid(), q_id, '~하고 싶다 (희망)', FALSE, 2),
    (gen_random_uuid(), q_id, '~인 것 같다 (불확실)', FALSE, 3),
    (gen_random_uuid(), q_id, '~일 것이다 (확신 추측)', TRUE, 4);

  -- ==========================================
  -- MEDIUM (N2) - 30 questions (sort_order 31-60)
  -- ==========================================

  -- Q31: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「把握する」の意味は何ですか？', '把握する(はあくする)は「파악하다」という意味のN2動詞です。', 1, 31, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '포기하다', FALSE, 1),
    (gen_random_uuid(), q_id, '파괴하다', FALSE, 2),
    (gen_random_uuid(), q_id, '판단하다', FALSE, 3),
    (gen_random_uuid(), q_id, '파악하다', TRUE, 4);

  -- Q32: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜にもかかわらず」の意味として正しいものは？', '「〜にもかかわらず」は逆接を表し、「~임에도 불구하고」という意味です。', 1, 32, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하기 때문에', FALSE, 1),
    (gen_random_uuid(), q_id, '~임에도 불구하고', TRUE, 2),
    (gen_random_uuid(), q_id, '~하자마자 곧바로', FALSE, 3),
    (gen_random_uuid(), q_id, '~하는 한에서는', FALSE, 4);

  -- Q33: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「対応」の意味は何ですか？', '対応(たいおう)は「대응」という意味のN2名詞です。', 1, 33, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대답', FALSE, 1),
    (gen_random_uuid(), q_id, '대상', FALSE, 2),
    (gen_random_uuid(), q_id, '대응', TRUE, 3),
    (gen_random_uuid(), q_id, '대회', FALSE, 4);

  -- Q34: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「影響」の意味は何ですか？', '影響(えいきょう)は「영향」という意味です。', 1, 34, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영업', FALSE, 1),
    (gen_random_uuid(), q_id, '영양', FALSE, 2),
    (gen_random_uuid(), q_id, '영학', FALSE, 3),
    (gen_random_uuid(), q_id, '영향', TRUE, 4);

  -- Q35: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜わけにはいかない」の意味として正しいものは？', '「〜わけにはいかない」は社会的・道義的理由で「~할 수 없다」という意味です。', 1, 35, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~할 수 없다 (도의적 이유)', TRUE, 1),
    (gen_random_uuid(), q_id, '~할 필요가 없다 (불필요)', FALSE, 2),
    (gen_random_uuid(), q_id, '~해야만 한다 (강한 의무)', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶지 않다 (거부)', FALSE, 4);

  -- Q36: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「維持」の意味は何ですか？', '維持(いじ)は「유지」という意味のN2名詞です。', 1, 36, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '의지', FALSE, 1),
    (gen_random_uuid(), q_id, '유지', TRUE, 2),
    (gen_random_uuid(), q_id, '위치', FALSE, 3),
    (gen_random_uuid(), q_id, '인지', FALSE, 4);

  -- Q37: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜に違いない」の意味として正しいものは？', '「〜に違いない」は強い確信を表し、「~임에 틀림없다」という意味です。', 1, 37, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~임에 틀림없다', TRUE, 1),
    (gen_random_uuid(), q_id, '~와 다르다', FALSE, 2),
    (gen_random_uuid(), q_id, '~일 리가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '~인 것 같다', FALSE, 4);

  -- Q38: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「効率」の意味は何ですか？', '効率(こうりつ)は「효율」という意味です。', 1, 38, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공헌', FALSE, 1),
    (gen_random_uuid(), q_id, '구성', FALSE, 2),
    (gen_random_uuid(), q_id, '효과', FALSE, 3),
    (gen_random_uuid(), q_id, '효율', TRUE, 4);

  -- Q39: N2 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「最近、リモートワークが普及したことにより、通勤時間が減り、その分を自己啓発に充てる人が増えている。」\nこの文の主な内容は？', '文章はリモートワークの普及→通勤時間の減少→自己啓発時間の増加という因果関係を述べています。', 1, 39, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재택근무 확산으로 통근 시간이 줄고 자기계발에 시간을 쓰는 사람이 늘었다', TRUE, 1),
    (gen_random_uuid(), q_id, '재택근무로 인해 사람들이 운동하는 시간이 줄었다는 내용이다', FALSE, 2),
    (gen_random_uuid(), q_id, '통근 시간이 오히려 늘어서 자기계발을 못 한다는 내용이다', FALSE, 3),
    (gen_random_uuid(), q_id, '재택근무는 업무 효율이 낮아서 부정적이라는 내용이다', FALSE, 4);

  -- Q40: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「検討」の意味は何ですか？', '検討(けんとう)は「검토」という意味のN2名詞です。', 1, 40, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '검사', FALSE, 1),
    (gen_random_uuid(), q_id, '검토', TRUE, 2),
    (gen_random_uuid(), q_id, '검증', FALSE, 3),
    (gen_random_uuid(), q_id, '견학', FALSE, 4);

  -- Q41: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜に伴い」の意味として正しいものは？', '「〜に伴い」は「~에 따라/~와 함께」という意味です。', 1, 41, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 반해서', FALSE, 1),
    (gen_random_uuid(), q_id, '~보다 먼저', FALSE, 2),
    (gen_random_uuid(), q_id, '~에 따라 / ~와 함께', TRUE, 3),
    (gen_random_uuid(), q_id, '~한 후에야 비로소', FALSE, 4);

  -- Q42: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「実施」の意味は何ですか？', '実施(じっし)は「실시」という意味のN2名詞です。', 1, 42, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '실험', FALSE, 1),
    (gen_random_uuid(), q_id, '실제', FALSE, 2),
    (gen_random_uuid(), q_id, '실력', FALSE, 3),
    (gen_random_uuid(), q_id, '실시', TRUE, 4);

  -- Q43: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「傾向」の意味は何ですか？', '傾向(けいこう)は「경향」という意味です。', 1, 43, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '경향', TRUE, 1),
    (gen_random_uuid(), q_id, '경험', FALSE, 2),
    (gen_random_uuid(), q_id, '경영', FALSE, 3),
    (gen_random_uuid(), q_id, '계산', FALSE, 4);

  -- Q44: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜一方で」の意味として正しいものは？', '「〜一方で」は対比を表し、「~하는 한편 / ~하는 반면에」という意味です。', 1, 44, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하기 위해서', FALSE, 1),
    (gen_random_uuid(), q_id, '~하는 한편 / ~하는 반면에', TRUE, 2),
    (gen_random_uuid(), q_id, '~한 결과로서', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 이상은', FALSE, 4);

  -- Q45: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「提案」の意味は何ですか？', '提案(ていあん)は「제안」という意味のN2名詞です。', 1, 45, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '제출', FALSE, 1),
    (gen_random_uuid(), q_id, '제한', FALSE, 2),
    (gen_random_uuid(), q_id, '제안', TRUE, 3),
    (gen_random_uuid(), q_id, '제작', FALSE, 4);

  -- Q46: N2 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「日本企業では、個人の成果だけでなく、チームへの貢献度も評価の対象となることが多い。そのため、協調性が重視される傾向がある。」\nこの文から分かることは？', '日本企業の評価基準についての文章で、チームへの貢献度と協調性の重要性を述べています。', 1, 46, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본 기업은 개인 성과만을 중심으로 평가를 진행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '팀 공헌도는 일본 기업의 평가 기준에 포함되지 않는다', FALSE, 2),
    (gen_random_uuid(), q_id, '일본 기업은 협조성보다 기술 역량을 더 중시하는 편이다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본 기업은 개인 성과뿐 아니라 팀 공헌도도 평가하므로 협조성이 중시된다', TRUE, 4);

  -- Q47: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「改善」の意味は何ですか？', '改善(かいぜん)は「개선」という意味のN2名詞です。', 1, 47, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개발', FALSE, 1),
    (gen_random_uuid(), q_id, '개정', FALSE, 2),
    (gen_random_uuid(), q_id, '개시', FALSE, 3),
    (gen_random_uuid(), q_id, '개선', TRUE, 4);

  -- Q48: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜をはじめ」の意味として正しいものは？', '「〜をはじめ」は代表例を挙げる表現で、「~을 비롯해서」という意味です。', 1, 48, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~을 제외하고서', FALSE, 1),
    (gen_random_uuid(), q_id, '~을 비롯해서', TRUE, 2),
    (gen_random_uuid(), q_id, '~을 시작으로만', FALSE, 3),
    (gen_random_uuid(), q_id, '~만을 대상으로', FALSE, 4);

  -- Q49: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「基準」の意味は何ですか？', '基準(きじゅん)は「기준」という意味です。', 1, 49, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기초', FALSE, 1),
    (gen_random_uuid(), q_id, '기본', FALSE, 2),
    (gen_random_uuid(), q_id, '기준', TRUE, 3),
    (gen_random_uuid(), q_id, '기획', FALSE, 4);

  -- Q50: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「納得」の意味は何ですか？', '納得(なっとく)は「납득/이해」という意味のN2名詞です。', 1, 50, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '납부 / 지불', FALSE, 1),
    (gen_random_uuid(), q_id, '납품 / 배송', FALSE, 2),
    (gen_random_uuid(), q_id, '낙관 / 긍정', FALSE, 3),
    (gen_random_uuid(), q_id, '납득 / 이해', TRUE, 4);

  -- Q51: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ざるを得ない」の意味として正しいものは？', '「〜ざるを得ない」は「~하지 않을 수 없다」という意味です。', 1, 51, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~할 필요가 없다', FALSE, 1),
    (gen_random_uuid(), q_id, '~하면 안 된다', FALSE, 2),
    (gen_random_uuid(), q_id, '~할 수도 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하지 않을 수 없다', TRUE, 4);

  -- Q52: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「方針」の意味は何ですか？', '方針(ほうしん)は「방침」という意味のN2名詞です。', 1, 52, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방법', FALSE, 1),
    (gen_random_uuid(), q_id, '방침', TRUE, 2),
    (gen_random_uuid(), q_id, '방문', FALSE, 3),
    (gen_random_uuid(), q_id, '방향', FALSE, 4);

  -- Q53: N2 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「プロジェクトの締め切りが近づいているにもかかわらず、まだ要件定義が完了していない。このままでは納期に間に合わない恐れがある。」\nこの文の状況として正しいものは？', '締め切りが近い+要件定義未完了→納期遅延の恐れがあるという状況を読み取る問題です。', 1, 53, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프로젝트가 순조롭게 진행되어 여유가 있다', FALSE, 1),
    (gen_random_uuid(), q_id, '요건 정의가 이미 완료되어 납기에 여유가 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '마감이 다가오는데 요건 정의가 안 끝나서 납기에 늦을 수 있다', TRUE, 3),
    (gen_random_uuid(), q_id, '납기에는 문제없지만 품질이 걱정되는 상황이다', FALSE, 4);

  -- Q54: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「適切」の意味は何ですか？', '適切(てきせつ)は「적절」という意味です。', 1, 54, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '적당', FALSE, 1),
    (gen_random_uuid(), q_id, '적용', FALSE, 2),
    (gen_random_uuid(), q_id, '적격', FALSE, 3),
    (gen_random_uuid(), q_id, '적절', TRUE, 4);

  -- Q55: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜に基づいて」の意味として正しいものは？', '「〜に基づいて」は「~에 기반하여/~에 근거하여」という意味です。', 1, 55, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 기반하여 / ~에 근거하여', TRUE, 1),
    (gen_random_uuid(), q_id, '~에 반해서 / ~와 대조적으로', FALSE, 2),
    (gen_random_uuid(), q_id, '~와 관계없이 / ~에 상관없이', FALSE, 3),
    (gen_random_uuid(), q_id, '~을 제외하고 / ~을 빼고서', FALSE, 4);

  -- Q56: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「促進」の意味は何ですか？', '促進(そくしん)は「촉진」という意味のN2名詞です。', 1, 56, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '측정', FALSE, 1),
    (gen_random_uuid(), q_id, '촉진', TRUE, 2),
    (gen_random_uuid(), q_id, '축소', FALSE, 3),
    (gen_random_uuid(), q_id, '추진', FALSE, 4);

  -- Q57: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜上で」の意味として正しいものは？（条件）', '「〜上で」は条件を示す表現で、「~하는 데 있어서/~한 후에」という意味です。', 1, 57, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하는 동안에', FALSE, 1),
    (gen_random_uuid(), q_id, '~하기 전에는', FALSE, 2),
    (gen_random_uuid(), q_id, '~하는 데 있어서', TRUE, 3),
    (gen_random_uuid(), q_id, '~한 대신에는', FALSE, 4);

  -- Q58: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「処理」の意味は何ですか？', '処理(しょり)は「처리」という意味のN2名詞です。', 1, 58, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '처리', TRUE, 1),
    (gen_random_uuid(), q_id, '조리', FALSE, 2),
    (gen_random_uuid(), q_id, '정리', FALSE, 3),
    (gen_random_uuid(), q_id, '관리', FALSE, 4);

  -- Q59: N2 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「近年、働き方改革の一環として、フレックスタイム制度を導入する企業が増えている。これにより、社員は自分のライフスタイルに合わせた勤務が可能となった。」\nこの文の要点は？', 'フレックスタイム制度の導入とその効果（自由な勤務時間）についての文章です。', 1, 59, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 기업이 유연 근무제를 의무적으로 도입하게 되었다는 내용이다', FALSE, 1),
    (gen_random_uuid(), q_id, '유연 근무제 도입으로 직원들이 자신의 라이프스타일에 맞춰 근무할 수 있게 되었다', TRUE, 2),
    (gen_random_uuid(), q_id, '유연 근무제는 직원들에게 인기가 없어서 도입이 줄고 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '근무 시간이 더 길어져서 직원들의 불만이 증가하고 있다', FALSE, 4);

  -- Q60: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜に関して」の意味として正しいものは？', '「〜に関して」は「~에 관해서」という意味です。', 1, 60, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 의해서', FALSE, 1),
    (gen_random_uuid(), q_id, '~에 따라서', FALSE, 2),
    (gen_random_uuid(), q_id, '~에 관해서', TRUE, 3),
    (gen_random_uuid(), q_id, '~에 대해서', FALSE, 4);

  -- ==========================================
  -- HARD (N1) - 30 questions (sort_order 61-90)
  -- ==========================================

  -- Q61: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「顕著」の意味は何ですか？', '顕著(けんちょ)は「뚜렷한/현저한」という意味のN1語彙です。', 1, 61, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '뚜렷한/현저한', TRUE, 1),
    (gen_random_uuid(), q_id, '현명한/똑똑한', FALSE, 2),
    (gen_random_uuid(), q_id, '현상/상태', FALSE, 3),
    (gen_random_uuid(), q_id, '건전한/온전한', FALSE, 4);

  -- Q62: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜をもって」の意味として正しいものは？（手段）', '「〜をもって」は手段や期限を表し、「~으로써/~을 가지고」という意味です。', 1, 62, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~을 위해서 / ~할 목적으로', FALSE, 1),
    (gen_random_uuid(), q_id, '~으로써 / ~을 가지고', TRUE, 2),
    (gen_random_uuid(), q_id, '~에 의하면 / ~에 따르면', FALSE, 3),
    (gen_random_uuid(), q_id, '~에도 불구하고 / ~이지만', FALSE, 4);

  -- Q63: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「齟齬」の意味は何ですか？', '齟齬(そご)は「어긋남/불일치」という意味のN1語彙です。', 1, 63, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조화 / 일치', FALSE, 1),
    (gen_random_uuid(), q_id, '갈등 / 분쟁', FALSE, 2),
    (gen_random_uuid(), q_id, '어긋남 / 불일치', TRUE, 3),
    (gen_random_uuid(), q_id, '오해 / 착각', FALSE, 4);

  -- Q64: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜たりとも〜ない」の意味として正しいものは？', '「〜たりとも〜ない」は「단 ~도 ~않다」という強い否定を表します。', 1, 64, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하거나 ~하거나 (나열)', FALSE, 1),
    (gen_random_uuid(), q_id, '~만큼은 ~하다 (비교)', FALSE, 2),
    (gen_random_uuid(), q_id, '~든지 ~든지 (선택)', FALSE, 3),
    (gen_random_uuid(), q_id, '단 ~도 ~않다 (강한 부정)', TRUE, 4);

  -- Q65: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「瞬時」の意味は何ですか？', '瞬時(しゅんじ)は「순간/순식간」という意味です。', 1, 65, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '순간/순식간', TRUE, 1),
    (gen_random_uuid(), q_id, '순간/찰나', FALSE, 2),
    (gen_random_uuid(), q_id, '전시/진열', FALSE, 3),
    (gen_random_uuid(), q_id, '임시/임의', FALSE, 4);

  -- Q66: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜んがために」の意味として正しいものは？', '「〜んがために」は強い目的を表し、「~하기 위해서」という意味の硬い文語表現です。', 1, 66, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~했기 때문에 (원인/이유)', FALSE, 1),
    (gen_random_uuid(), q_id, '~하기 위해서 (문어적/강한 목적)', TRUE, 2),
    (gen_random_uuid(), q_id, '~할 수밖에 없다 (불가피)', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 적이 있다 (경험/과거)', FALSE, 4);

  -- Q67: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「脆弱」の意味は何ですか？', '脆弱(ぜいじゃく)は「취약」という意味のN1語彙です。IT分野でもよく使われます。', 1, 67, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '강력', FALSE, 1),
    (gen_random_uuid(), q_id, '유연', FALSE, 2),
    (gen_random_uuid(), q_id, '취약', TRUE, 3),
    (gen_random_uuid(), q_id, '안정', FALSE, 4);

  -- Q68: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「技術革新が加速する現代において、既存のスキルセットに安住することなく、常に自己研鑽を怠らない姿勢が求められる。特にIT業界では、新技術の台頭により、数年前の知識が陳腐化することも珍しくない。」\n筆者の主張として最も適切なものは？', '技術革新時代における継続的学習の重要性を述べた文章です。', 1, 68, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기존 기술을 확실히 익히면 새로운 기술은 배울 필요가 없다', FALSE, 1),
    (gen_random_uuid(), q_id, 'IT 업계에서는 기존 기술에 안주하지 말고 끊임없이 자기연찬해야 한다', TRUE, 2),
    (gen_random_uuid(), q_id, '새로운 기술이 나와도 기존 지식이 진부해지는 일은 거의 없다', FALSE, 3),
    (gen_random_uuid(), q_id, 'IT 업계의 기술 변화 속도는 다른 업계와 크게 다르지 않다', FALSE, 4);

  -- Q69: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜を余儀なくされる」の意味として正しいものは？', '「〜を余儀なくされる」は「~하지 않을 수 없게 되다/~을 강요받다」という意味です。', 1, 69, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~할 여유가 있게 되다 (여유)', FALSE, 1),
    (gen_random_uuid(), q_id, '~하고 싶어지다 (자발적 희망)', FALSE, 2),
    (gen_random_uuid(), q_id, '~하지 않을 수 없게 되다 (강제)', TRUE, 3),
    (gen_random_uuid(), q_id, '~할 필요가 없어지다 (면제)', FALSE, 4);

  -- Q70: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「冗長」の意味は何ですか？', '冗長(じょうちょう)は「중복된/장황한」という意味です。IT用語として「冗長化」などで使われます。', 1, 70, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상황/형편', FALSE, 1),
    (gen_random_uuid(), q_id, '정보/데이터', FALSE, 2),
    (gen_random_uuid(), q_id, '조건/전제', FALSE, 3),
    (gen_random_uuid(), q_id, '장황한/중복된', TRUE, 4);

  -- Q71: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「逸脱」の意味は何ですか？', '逸脱(いつだつ)は「일탈/이탈」という意味のN1語彙です。', 1, 71, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '탈출 / 탈주', FALSE, 1),
    (gen_random_uuid(), q_id, '도주 / 도피', FALSE, 2),
    (gen_random_uuid(), q_id, '회피 / 기피', FALSE, 3),
    (gen_random_uuid(), q_id, '일탈 / 이탈', TRUE, 4);

  -- Q72: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ともなると」の意味として正しいものは？', '「〜ともなると」は「~정도가 되면」という意味で、ある段階に達した場合を表します。', 1, 72, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하더라도 / ~할지라도', FALSE, 1),
    (gen_random_uuid(), q_id, '~정도가 되면 / ~쯤 되면', TRUE, 2),
    (gen_random_uuid(), q_id, '~함과 동시에 / ~하면서', FALSE, 3),
    (gen_random_uuid(), q_id, '~하기는커녕 / ~은 고사하고', FALSE, 4);

  -- Q73: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「俯瞰」の意味は何ですか？', '俯瞰(ふかん)は「부감/조감(높은 곳에서 내려다봄)」という意味です。', 1, 73, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '미관/아름다움', FALSE, 1),
    (gen_random_uuid(), q_id, '방관/관망', FALSE, 2),
    (gen_random_uuid(), q_id, '부감/조감', TRUE, 3),
    (gen_random_uuid(), q_id, '체감/실감', FALSE, 4);

  -- Q74: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜にほかならない」の意味として正しいものは？', '「〜にほかならない」は「다름 아닌 ~이다/바로 ~이다」という意味です。', 1, 74, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~가 아니다 / ~이 아니다', FALSE, 1),
    (gen_random_uuid(), q_id, '~일 리가 없다 / ~할 리가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '~와 다르다 / ~와 차이가 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '다름 아닌 ~이다 / 바로 ~이다', TRUE, 4);

  -- Q75: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「乖離」の意味は何ですか？', '乖離(かいり)は「괴리/이탈」という意味のN1語彙です。', 1, 75, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '괴리 / 이탈', TRUE, 1),
    (gen_random_uuid(), q_id, '일치 / 합치', FALSE, 2),
    (gen_random_uuid(), q_id, '근접 / 접근', FALSE, 3),
    (gen_random_uuid(), q_id, '연결 / 접속', FALSE, 4);

  -- Q76: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「システム開発においては、要件の曖昧さが後工程での手戻りを招く最大の要因であるとされる。したがって、上流工程における要件定義の精度を高めることが、プロジェクト成功の鍵を握ると言っても過言ではない。」\n筆者の主張は？', '要件定義の重要性とプロジェクト成功の関係について述べた文章です。', 1, 76, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하류 공정에서의 테스트 정확도가 프로젝트 성공의 열쇠이다', FALSE, 1),
    (gen_random_uuid(), q_id, '상류 공정에서의 요건 정의 정확도가 프로젝트 성공의 열쇠이다', TRUE, 2),
    (gen_random_uuid(), q_id, '요건이 다소 애매해도 개발 과정에서 자연스럽게 해결된다', FALSE, 3),
    (gen_random_uuid(), q_id, '요건 정의보다는 코딩 기술이 프로젝트 성공에 더 중요하다', FALSE, 4);

  -- Q77: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ないまでも」の意味として正しいものは？', '「〜ないまでも」は「~하지는 못하더라도」という意味です。', 1, 77, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하지 않으면 안 된다', FALSE, 1),
    (gen_random_uuid(), q_id, '~하지 않는 한에서', FALSE, 2),
    (gen_random_uuid(), q_id, '~하지는 못하더라도', TRUE, 3),
    (gen_random_uuid(), q_id, '~하지 않아도 된다', FALSE, 4);

  -- Q78: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「恣意的」の意味は何ですか？', '恣意的(しいてき)は「자의적인」という意味です。', 1, 78, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '호의적인', FALSE, 1),
    (gen_random_uuid(), q_id, '자의적인', TRUE, 2),
    (gen_random_uuid(), q_id, '의식적인', FALSE, 3),
    (gen_random_uuid(), q_id, '합의적인', FALSE, 4);

  -- Q79: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜をおいて他にない」の意味として正しいものは？', '「〜をおいて他にない」は「~을 제외하고는 없다/~밖에 없다」という意味です。', 1, 79, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~을 놓아두다 / ~을 방치하다', FALSE, 1),
    (gen_random_uuid(), q_id, '~이 아니다 / ~일 리가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '~을 대신하다 / ~을 대체하다', FALSE, 3),
    (gen_random_uuid(), q_id, '~을 제외하고는 없다 / ~밖에 없다', TRUE, 4);

  -- Q80: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「踏襲」の意味は何ですか？', '踏襲(とうしゅう)は「답습/그대로 따름」という意味のN1語彙です。', 1, 80, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '답습 / 그대로 따름', TRUE, 1),
    (gen_random_uuid(), q_id, '혁신 / 새롭게 바꿈', FALSE, 2),
    (gen_random_uuid(), q_id, '폐지 / 중단시키기', FALSE, 3),
    (gen_random_uuid(), q_id, '변경 / 일부 수정함', FALSE, 4);

  -- Q81: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「グローバル化が進展する中、異文化間コミュニケーション能力の涵養は喫緊の課題である。単に語学力を磨くのみならず、相手の文化的背景に対する深い理解と尊重の念を持つことが不可欠である。」\nこの文の主旨は？', 'グローバル化時代の異文化コミュニケーション能力の重要性についての論述です。', 1, 81, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '어학 능력만 충분히 갖추면 이문화 커뮤니케이션에 문제가 없다', FALSE, 1),
    (gen_random_uuid(), q_id, '글로벌화는 아직 진전되지 않아서 준비할 필요가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '어학 능력뿐 아니라 문화적 배경에 대한 이해와 존중이 필요하다', TRUE, 3),
    (gen_random_uuid(), q_id, '이문화 커뮤니케이션보다 자국 문화 이해가 더 중요하다', FALSE, 4);

  -- Q82: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜が最後」の意味として正しいものは？', '「〜が最後」は「한번 ~하면 (그 후에는 되돌릴 수 없다)」という意味です。', 1, 82, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '한번 ~하면 (되돌릴 수 없다)', TRUE, 1),
    (gen_random_uuid(), q_id, '~가 마지막이다 (종료의 의미)', FALSE, 2),
    (gen_random_uuid(), q_id, '~이 가장 좋다 (최선의 의미)', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 적이 있다 (경험의 의미)', FALSE, 4);

  -- Q83: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「網羅」の意味は何ですか？', '網羅(もうら)は「망라/모두 포함」という意味です。', 1, 83, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '망라/모두 포함', TRUE, 1),
    (gen_random_uuid(), q_id, '몽롱/흐릿함', FALSE, 2),
    (gen_random_uuid(), q_id, '방라/흩어짐', FALSE, 3),
    (gen_random_uuid(), q_id, '망상/공상', FALSE, 4);

  -- Q84: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「矛盾」の意味は何ですか？', '矛盾(むじゅん)は「모순」という意味のN1語彙です。', 1, 84, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조화', FALSE, 1),
    (gen_random_uuid(), q_id, '모순', TRUE, 2),
    (gen_random_uuid(), q_id, '균형', FALSE, 3),
    (gen_random_uuid(), q_id, '일관', FALSE, 4);

  -- Q85: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜と相まって」の意味として正しいものは？', '「〜と相まって」は「~와 어우러져/~와 합쳐져서」という意味です。', 1, 85, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~와 대조적으로 / ~와 반대로', FALSE, 1),
    (gen_random_uuid(), q_id, '~와 무관하게 / ~에 상관없이', FALSE, 2),
    (gen_random_uuid(), q_id, '~와 어우러져 / ~와 합쳐져서', TRUE, 3),
    (gen_random_uuid(), q_id, '~와 별개로 / ~와는 따로', FALSE, 4);

  -- Q86: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「アジャイル開発手法の浸透に伴い、ウォーターフォール型の開発プロセスを墨守することの是非が問われている。しかしながら、大規模なシステム開発においては、依然として綿密な計画に基づく開発手法が有効な場面も少なくない。」\nこの文の要旨は？', 'アジャイルとウォーターフォールの使い分けについての議論です。', 1, 86, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '워터폴 개발은 시대에 뒤떨어졌으므로 완전히 폐기해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '애자일 개발은 실제로는 효과가 없어서 도입이 줄고 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '대규모 시스템 개발에서는 애자일만을 사용하는 것이 바람직하다', FALSE, 3),
    (gen_random_uuid(), q_id, '애자일이 확산되고 있지만 대규모 개발에서는 여전히 계획 기반 개발이 유효한 경우가 많다', TRUE, 4);

  -- Q87: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「簡潔」の意味は何ですか？', '簡潔(かんけつ)は「간결」という意味です。', 1, 87, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '간결', TRUE, 1),
    (gen_random_uuid(), q_id, '완전', FALSE, 2),
    (gen_random_uuid(), q_id, '간단', FALSE, 3),
    (gen_random_uuid(), q_id, '감상', FALSE, 4);

  -- Q88: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜とは言え」の意味として正しいものは？', '「〜とは言え」は「~라고는 하지만/~이기는 하지만」という逆接を表します。', 1, 88, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~라고 말하다 / ~라고 전하다', FALSE, 1),
    (gen_random_uuid(), q_id, '~라고 들었다 / ~라고 알려졌다', FALSE, 2),
    (gen_random_uuid(), q_id, '~라고는 하지만 / ~이기는 하지만', TRUE, 3),
    (gen_random_uuid(), q_id, '~가 당연하다 / ~가 자명하다', FALSE, 4);

  -- Q89: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「暫定的」の意味は何ですか？', '暫定的(ざんていてき)は「잠정적인」という意味のN1語彙です。', 1, 89, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영구적인', FALSE, 1),
    (gen_random_uuid(), q_id, '잠정적인', TRUE, 2),
    (gen_random_uuid(), q_id, '확정적인', FALSE, 3),
    (gen_random_uuid(), q_id, '일시적인', FALSE, 4);

  -- Q90: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「セキュリティ対策は、往々にして利便性とのトレードオフの関係にある。厳格な認証プロセスを導入すれば安全性は向上するが、ユーザーの操作性は低下する。両者のバランスをいかに取るかが、設計者の腕の見せ所である。」\nこの文の主旨は？', 'セキュリティと利便性のバランスの重要性についての文章です。', 1, 90, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보안을 최우선으로 하고 편의성은 포기해야 한다', FALSE, 1),
    (gen_random_uuid(), q_id, '편의성이 보안보다 사용자에게 더 중요하다', FALSE, 2),
    (gen_random_uuid(), q_id, '보안과 편의성의 균형을 어떻게 잡을지가 설계자의 역량이다', TRUE, 3),
    (gen_random_uuid(), q_id, '보안과 편의성은 서로 관계가 없는 별개의 문제이다', FALSE, 4);

END $$;

-- ============================================
-- Quiz 2: IT 일본어 능력 평가 (90 questions)
-- question_category: 'vocab', 'reading', 'fill_blank'
-- Each category: 30 questions (easy 10, medium 10, hard 10)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- ==========================================
  -- VOCAB category (30 questions, sort_order 1-30)
  -- ==========================================

  -- vocab easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「実装する」の意味は？', '実装する(じっそうする)は「구현하다」という意味のIT用語です。', 1, 1, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설계하다', FALSE, 1),
    (gen_random_uuid(), q_id, '구현하다', TRUE, 2),
    (gen_random_uuid(), q_id, '배포하다', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「環境構築」の意味は？', '環境構築(かんきょうこうちく)は「환경 구축」という意味です。開発環境のセットアップを指します。', 1, 2, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '환경 구축', TRUE, 1),
    (gen_random_uuid(), q_id, '환경 설정', FALSE, 2),
    (gen_random_uuid(), q_id, '환경 변수', FALSE, 3),
    (gen_random_uuid(), q_id, '환경 테스트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「画面」の意味は？', '画面(がめん)は「화면」という意味のIT基本用語です。', 1, 3, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기능', FALSE, 1),
    (gen_random_uuid(), q_id, '항목', FALSE, 2),
    (gen_random_uuid(), q_id, '화상', FALSE, 3),
    (gen_random_uuid(), q_id, '화면', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「修正」の意味は？', '修正(しゅうせい)は「수정」という意味です。バグ修正などで使います。', 1, 4, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '삭제', FALSE, 1),
    (gen_random_uuid(), q_id, '작성', FALSE, 2),
    (gen_random_uuid(), q_id, '추가', FALSE, 3),
    (gen_random_uuid(), q_id, '수정', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「不具合」の意味は？', '不具合(ふぐあい)は「버그/결함」という意味です。ソフトウェアの問題を指します。', 1, 5, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양 변경', FALSE, 1),
    (gen_random_uuid(), q_id, '버그 / 결함', TRUE, 2),
    (gen_random_uuid(), q_id, '기능 추가', FALSE, 3),
    (gen_random_uuid(), q_id, '업데이트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「仕様」の意味は？', '仕様(しよう)は「사양/스펙」という意味のIT用語です。', 1, 6, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양 / 스펙', TRUE, 1),
    (gen_random_uuid(), q_id, '사용 방법', FALSE, 2),
    (gen_random_uuid(), q_id, '설정 항목', FALSE, 3),
    (gen_random_uuid(), q_id, '시험 계획', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「テスト」の意味は？', 'テストはソフトウェアの「테스트」を意味します。', 1, 7, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배포 작업', FALSE, 1),
    (gen_random_uuid(), q_id, '설계 작업', FALSE, 2),
    (gen_random_uuid(), q_id, '분석 작업', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「データベース」の意味は？', 'データベースは「데이터베이스」を意味するIT基本用語です。', 1, 8, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 분석', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터 센터', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 전송', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「設計」の意味は？', '設計(せっけい)は「설계」という意味のIT用語です。', 1, 9, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설치', FALSE, 1),
    (gen_random_uuid(), q_id, '설계', TRUE, 2),
    (gen_random_uuid(), q_id, '설정', FALSE, 3),
    (gen_random_uuid(), q_id, '설명', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「開発」の意味は？', '開発(かいはつ)は「개발」という意味です。ソフトウェア開発の基本用語です。', 1, 10, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개선', FALSE, 1),
    (gen_random_uuid(), q_id, '개시', FALSE, 2),
    (gen_random_uuid(), q_id, '개발', TRUE, 3),
    (gen_random_uuid(), q_id, '개요', FALSE, 4);

  -- vocab medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「結合テスト」の意味は？', '結合テストは「결합 테스트/통합 테스트」で、モジュール間の連携を確認するテストです。', 1, 11, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '단위 테스트 / 유닛 테스트', FALSE, 1),
    (gen_random_uuid(), q_id, '성능 테스트 / 부하 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '결합 테스트 / 통합 테스트', TRUE, 3),
    (gen_random_uuid(), q_id, '회귀 테스트 / 리그레션 테스트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「要件定義」の意味は？', '要件定義は「요건 정의」で、システム開発の最初の工程です。', 1, 12, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요건 정의', TRUE, 1),
    (gen_random_uuid(), q_id, '기본 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '상세 설계', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 리뷰', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「排他制御」の意味は？', '排他制御は「배타 제어」で、同時アクセスを制御する仕組みです。', 1, 13, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '접근 권한 제어 (인가 처리)', FALSE, 1),
    (gen_random_uuid(), q_id, '배타 제어 (동시 접근 제어)', TRUE, 2),
    (gen_random_uuid(), q_id, '데이터 암호화 (보안 처리)', FALSE, 3),
    (gen_random_uuid(), q_id, '캐시 무효화 (갱신 처리)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「冗長化」の意味は？', '冗長化は「이중화/다중화」で、システムの可用性を高める手法です。', 1, 14, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '최적화 / 튜닝', FALSE, 1),
    (gen_random_uuid(), q_id, '간소화 / 경량화', FALSE, 2),
    (gen_random_uuid(), q_id, '자동화 / 스크립트화', FALSE, 3),
    (gen_random_uuid(), q_id, '이중화 / 다중화', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「脆弱性」の意味は？', '脆弱性は「취약성」で、セキュリティの弱点を指します。', 1, 15, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취약성', TRUE, 1),
    (gen_random_uuid(), q_id, '안전성', FALSE, 2),
    (gen_random_uuid(), q_id, '신뢰성', FALSE, 3),
    (gen_random_uuid(), q_id, '확장성', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「納品」の意味は？', '納品は「납품」で、成果物を顧客に引き渡すことです。', 1, 16, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '발주', FALSE, 1),
    (gen_random_uuid(), q_id, '수주', FALSE, 2),
    (gen_random_uuid(), q_id, '견적', FALSE, 3),
    (gen_random_uuid(), q_id, '납품', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「工数」の意味は？', '工数は「공수/인건비」で、作業にかかる人月を表します。', 1, 17, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공정 (작업 단계/절차)', FALSE, 1),
    (gen_random_uuid(), q_id, '공수 (작업량/인월)', TRUE, 2),
    (gen_random_uuid(), q_id, '공통 (공유 모듈/라이브러리)', FALSE, 3),
    (gen_random_uuid(), q_id, '공개 (외부 공개/릴리스)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「外部設計」の意味は？', '外部設計は「외부 설계」で、ユーザーインターフェースの設計を指します。', 1, 18, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '외부 설계 (UI/UX 설계)', TRUE, 1),
    (gen_random_uuid(), q_id, '내부 설계 (모듈 상세 설계)', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 설계 (ER 설계)', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크 설계 (인프라 설계)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「進捗」の意味は？', '進捗は「진척」で、プロジェクトの進行状況を指します。', 1, 19, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '완료 / 종료 처리', FALSE, 1),
    (gen_random_uuid(), q_id, '지연 / 일정 초과', FALSE, 2),
    (gen_random_uuid(), q_id, '진척 / 진행 상황', TRUE, 3),
    (gen_random_uuid(), q_id, '보류 / 대기 상태', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「見積もり」の意味は？', '見積もりは「견적」で、費用や工数の概算を指します。', 1, 20, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '청구', FALSE, 1),
    (gen_random_uuid(), q_id, '계약', FALSE, 2),
    (gen_random_uuid(), q_id, '발주', FALSE, 3),
    (gen_random_uuid(), q_id, '견적', TRUE, 4);

  -- vocab hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「可用性」の意味は？', '可用性は「가용성」で、システムが利用可能な状態を維持する度合いです。', 1, 21, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '확장성 (Scalability)', FALSE, 1),
    (gen_random_uuid(), q_id, '가용성 (Availability)', TRUE, 2),
    (gen_random_uuid(), q_id, '보안성 (Security)', FALSE, 3),
    (gen_random_uuid(), q_id, '이식성 (Portability)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「疎結合」の意味は？', '疎結合は「느슨한 결합(Loose Coupling)」で、モジュール間の依存度が低い設計を指します。', 1, 22, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '긴밀한 결합 (Tight Coupling)', FALSE, 1),
    (gen_random_uuid(), q_id, '의존성 주입 (Dependency Injection)', FALSE, 2),
    (gen_random_uuid(), q_id, '느슨한 결합 (Loose Coupling)', TRUE, 3),
    (gen_random_uuid(), q_id, '데이터 바인딩 (Data Binding)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「非機能要件」の意味は？', '非機能要件は「비기능 요건」で、性能、セキュリティ、可用性などシステムの品質に関する要件です。', 1, 23, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비기능 요건 (성능/보안/가용성 등)', TRUE, 1),
    (gen_random_uuid(), q_id, '기능 요건 (업무 로직/화면 요건)', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 설계서 (UI 레이아웃 정의)', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 계획서 (검증 절차 정의)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「デグレード」の意味は？', 'デグレードは「디그레이드/기능 퇴행」で、修正により他の機能が壊れることです。', 1, 24, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '업그레이드 (기능 개선/버전 향상)', FALSE, 1),
    (gen_random_uuid(), q_id, '다운그레이드 (이전 버전 복원)', FALSE, 2),
    (gen_random_uuid(), q_id, '리팩토링 (코드 구조 개선/정리)', FALSE, 3),
    (gen_random_uuid(), q_id, '디그레이드 (수정으로 인한 기능 퇴행)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「方式設計」の意味は？', '方式設計は「방식 설계」で、システムの技術的なアーキテクチャを決定する設計工程です。', 1, 25, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방식 설계 (아키텍처 설계)', TRUE, 1),
    (gen_random_uuid(), q_id, '화면 설계 (UI 레이아웃 설계)', FALSE, 2),
    (gen_random_uuid(), q_id, 'DB 설계 (테이블 정규화 설계)', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크 설계 (통신 구성 설계)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「回帰テスト」の意味は？', '回帰テストは「회귀 테스트(Regression Test)」で、修正後に既存機能が正常か確認するテストです。', 1, 26, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '단위 테스트 (Unit Test)', FALSE, 1),
    (gen_random_uuid(), q_id, '부하 테스트 (Load Test)', FALSE, 2),
    (gen_random_uuid(), q_id, '회귀 테스트 (Regression Test)', TRUE, 3),
    (gen_random_uuid(), q_id, '인수 테스트 (Acceptance Test)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「死活監視」の意味は？', '死活監視は「생사 감시/헬스 체크」で、サーバーが稼働中かを確認する監視です。', 1, 27, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '성능 모니터링 (리소스 감시)', FALSE, 1),
    (gen_random_uuid(), q_id, '로그 분석 (이벤트 추적 감시)', FALSE, 2),
    (gen_random_uuid(), q_id, '보안 감사 (취약점 탐지 감시)', FALSE, 3),
    (gen_random_uuid(), q_id, '생사 감시 / 헬스 체크', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「負荷分散」の意味は？', '負荷分散は「부하 분산(Load Balancing)」で、トラフィックを複数サーバーに分散する技術です。', 1, 28, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부하 분산 (Load Balancing)', TRUE, 1),
    (gen_random_uuid(), q_id, '부하 테스트 (Load Testing)', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 분산 (Data Sharding)', FALSE, 3),
    (gen_random_uuid(), q_id, '캐시 분산 (Cache Distribution)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「暫定対応」の意味は？', '暫定対応は「임시 대응/워크어라운드」で、恒久対応までの一時的な対処を指します。', 1, 29, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영구 대응 / 근본적 해결 조치', FALSE, 1),
    (gen_random_uuid(), q_id, '임시 대응 / 워크어라운드', TRUE, 2),
    (gen_random_uuid(), q_id, '긴급 배포 / 핫픽스 적용', FALSE, 3),
    (gen_random_uuid(), q_id, '롤백 처리 / 이전 버전 복원', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「恒久対応」の意味は？', '恒久対応は「영구 대응/근본 해결」で、根本的な問題解決を指します。', 1, 30, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '임시 대응 / 워크어라운드 적용', FALSE, 1),
    (gen_random_uuid(), q_id, '긴급 패치 / 핫픽스 배포', FALSE, 2),
    (gen_random_uuid(), q_id, '영구 대응 / 근본 해결', TRUE, 3),
    (gen_random_uuid(), q_id, '장애 전파 / 에스컬레이션 처리', FALSE, 4);

  -- ==========================================
  -- READING category (30 questions, sort_order 31-60)
  -- ==========================================

  -- reading easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「ログイン画面でユーザーIDとパスワードを入力し、ログインボタンを押してください。」\nこの文は何の説明ですか？', 'ログイン手順の説明文です。', 1, 31, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비밀번호 재설정 방법에 대한 설명', FALSE, 1),
    (gen_random_uuid(), q_id, '로그인 방법에 대한 설명', TRUE, 2),
    (gen_random_uuid(), q_id, '회원가입 절차에 대한 설명', FALSE, 3),
    (gen_random_uuid(), q_id, '로그아웃 절차에 대한 설명', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「このボタンをクリックすると、データが保存されます。保存が完了すると、確認メッセージが表示されます。」\nボタンをクリックすると何が起きますか？', 'ボタンクリック後の動作説明を読み取る問題です。', 1, 32, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터가 저장되고 확인 메시지가 표시된다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터가 삭제되고 경고 메시지가 표시된다', FALSE, 2),
    (gen_random_uuid(), q_id, '화면이 닫히고 메인 화면으로 이동한다', FALSE, 3),
    (gen_random_uuid(), q_id, '에러가 발생하고 재시도 메시지가 표시된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「エラーが発生した場合は、画面に表示されるエラーメッセージを確認し、担当者に連絡してください。」\nエラーが発生したらどうすればいいですか？', 'エラー発生時の対応手順を読み取る問題です。', 1, 33, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시스템을 재시작하고 다시 작업을 수행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '에러를 무시하고 다음 작업을 계속 진행한다', FALSE, 2),
    (gen_random_uuid(), q_id, '에러 메시지를 확인하고 담당자에게 연락한다', TRUE, 3),
    (gen_random_uuid(), q_id, '브라우저를 닫고 새로운 세션을 시작한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「毎日9時から18時まで、サーバーのバックアップを取ります。バックアップ中は処理が遅くなる場合があります。」\nバックアップについて正しいのは？', 'バックアップのスケジュールと影響についての文章です。', 1, 34, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매일 9시부터 18시까지 백업하며 처리가 느려질 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '주 1회 야간에만 백업하며 서비스에 영향이 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '백업 중에는 시스템을 전혀 사용할 수 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '백업 완료 후 데이터가 자동으로 삭제 처리된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「新しいバージョンをリリースしました。アップデート内容は以下の通りです。\n・ログイン機能の不具合を修正\n・検索速度を改善」\n今回のアップデートで行われたことは？', 'リリースノートの内容を読み取る問題です。', 1, 35, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새로운 결제 기능을 추가하고 UI를 변경함', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스를 이관하고 서버를 교체함', FALSE, 2),
    (gen_random_uuid(), q_id, '보안 패치를 적용하고 디자인을 변경함', FALSE, 3),
    (gen_random_uuid(), q_id, '로그인 버그를 수정하고 검색 속도를 개선함', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「パスワードは8文字以上で、英数字と記号を含めてください。」\nパスワードの条件は？', 'パスワードポリシーを読み取る問題です。', 1, 36, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4자 이상, 숫자만 포함하면 됨', FALSE, 1),
    (gen_random_uuid(), q_id, '6자 이상, 영문자만 포함하면 됨', FALSE, 2),
    (gen_random_uuid(), q_id, '8자 이상, 영문자+숫자+기호 포함', TRUE, 3),
    (gen_random_uuid(), q_id, '10자 이상, 대문자만 포함하면 됨', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のメールを読んでください。\n「お疲れ様です。明日のミーティングの時間が10時から14時に変更になりました。ご確認ください。」\nメールの内容は？', 'ミーティング時間の変更連絡メールです。', 1, 37, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내일 미팅 시간이 10시에서 14시로 변경됨', TRUE, 1),
    (gen_random_uuid(), q_id, '내일 미팅 장소가 회의실 A로 변경됨', FALSE, 2),
    (gen_random_uuid(), q_id, '내일 미팅 참석자가 추가로 변경됨', FALSE, 3),
    (gen_random_uuid(), q_id, '내일 미팅 안건이 다른 주제로 변경됨', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「テスト環境にデプロイが完了しました。動作確認をお願いします。問題があれば、チケットを作成してください。」\nこの文の依頼事項は？', 'テスト環境デプロイ後の確認依頼です。', 1, 38, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '본번 환경에 즉시 배포를 진행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '테스트 코드를 새로 작성한다', FALSE, 2),
    (gen_random_uuid(), q_id, '코드 리뷰를 실시하고 승인한다', FALSE, 3),
    (gen_random_uuid(), q_id, '동작 확인 후 문제가 있으면 티켓을 생성한다', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「本日のリリースは、サーバーメンテナンスのため、明日に延期します。」\nどういう意味ですか？', 'リリース延期の連絡文です。', 1, 39, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 유지보수가 완료되어 릴리스를 진행한다', FALSE, 1),
    (gen_random_uuid(), q_id, '서버 유지보수 때문에 릴리스가 내일로 연기된다', TRUE, 2),
    (gen_random_uuid(), q_id, '릴리스가 취소되어 다음 주로 재조정된다', FALSE, 3),
    (gen_random_uuid(), q_id, '릴리스가 오늘 예정대로 정상 진행된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「ファイルをアップロードする前に、ファイルサイズが10MB以下であることを確認してください。」\nアップロード前に確認すべきことは？', 'ファイルアップロードの制限に関する文章です。', 1, 40, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '파일 이름이 규칙에 맞는지 확인한다', FALSE, 1),
    (gen_random_uuid(), q_id, '파일 형식이 지원되는 포맷인지 확인한다', FALSE, 2),
    (gen_random_uuid(), q_id, '파일을 ZIP으로 압축해서 준비한다', FALSE, 3),
    (gen_random_uuid(), q_id, '파일 크기가 10MB 이하인지 확인한다', TRUE, 4);

  -- reading medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の仕様書を読んでください。\n「ユーザーがログインに3回連続で失敗した場合、アカウントを30分間ロックする。ロック解除後、再度ログインが可能となる。」\nこの仕様の条件は？', 'ログインセキュリティの仕様を読み取る問題です。', 1, 41, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3회 연속 로그인 실패 시 30분간 계정 잠금', TRUE, 1),
    (gen_random_uuid(), q_id, '5회 연속 로그인 실패 시 영구적 계정 잠금', FALSE, 2),
    (gen_random_uuid(), q_id, '1회 로그인 실패 시 10분간 계정 잠금', FALSE, 3),
    (gen_random_uuid(), q_id, '3회 연속 로그인 실패 시 비밀번호 초기화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のチケットを読んでください。\n「【不具合】商品検索画面で、カテゴリーフィルターを選択した状態でページネーションを操作すると、フィルターがリセットされる。\n【再現手順】1.カテゴリーを選択 2.次のページへ移動 3.フィルターが解除される\n【期待動作】ページ遷移後もフィルターが維持される」\nこの不具合は？', 'バグチケットの内容を理解する問題です。', 1, 42, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '검색 기능 자체가 전혀 작동하지 않는 버그', FALSE, 1),
    (gen_random_uuid(), q_id, '페이지 이동 시 카테고리 필터가 초기화되는 버그', TRUE, 2),
    (gen_random_uuid(), q_id, '페이지네이션 버튼이 표시되지 않는 버그', FALSE, 3),
    (gen_random_uuid(), q_id, '카테고리 목록이 데이터베이스에서 로드 안 되는 버그', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「今回の改修では、APIのレスポンスタイムを現状の平均500msから200ms以下に短縮することを目標とする。そのため、データベースクエリの最適化とキャッシュの導入を検討する。」\n改修の目標は？', 'パフォーマンス改善の目標と方法を読み取る問題です。', 1, 43, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '새로운 API 엔드포인트를 추가하여 기능을 확장', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스를 다른 제품으로 완전히 교체', FALSE, 2),
    (gen_random_uuid(), q_id, 'API 응답 시간을 500ms에서 200ms 이하로 단축', TRUE, 3),
    (gen_random_uuid(), q_id, '서버 대수를 늘려서 트래픽 분산을 최적화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の会議メモを読んでください。\n「【決定事項】\n・リリース日は来週金曜日に確定\n・テスト期間は水曜日まで延長\n・本番デプロイは田中さんが担当\n【宿題】\n・山田さん：テストケースの追加\n・鈴木さん：障害対応手順書の作成」\n田中さんの担当は？', '会議メモから担当者の役割を読み取る問題です。', 1, 44, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트 케이스를 추가 작성하는 담당', FALSE, 1),
    (gen_random_uuid(), q_id, '장애 대응 절차서를 작성하는 담당', FALSE, 2),
    (gen_random_uuid(), q_id, '릴리스 일정을 조정하고 관리하는 담당', FALSE, 3),
    (gen_random_uuid(), q_id, '본번 환경에 배포를 실행하는 담당', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の仕様を読んでください。\n「注文データのCSVエクスポート機能を実装する。出力項目は注文番号、注文日、顧客名、金額の4項目とし、文字コードはUTF-8、区切り文字はカンマとする。」\nCSVの文字コードは？', 'CSV出力仕様を読み取る問題です。', 1, 45, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Shift_JIS', FALSE, 1),
    (gen_random_uuid(), q_id, 'UTF-8', TRUE, 2),
    (gen_random_uuid(), q_id, 'EUC-JP', FALSE, 3),
    (gen_random_uuid(), q_id, 'ISO-8859-1', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のコードレビューコメントを読んでください。\n「この処理ではN+1問題が発生しています。ループ内でDBクエリを実行するのではなく、一括取得してからループ処理を行うようにリファクタリングしてください。」\n指摘されている問題は？', 'コードレビューの指摘内容を理解する問題です。', 1, 46, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SQL 인젝션에 의한 보안 취약점 문제', FALSE, 1),
    (gen_random_uuid(), q_id, '메모리 누수에 의한 리소스 고갈 문제', FALSE, 2),
    (gen_random_uuid(), q_id, 'N+1 문제 (루프 내 DB 쿼리 반복 실행)', TRUE, 3),
    (gen_random_uuid(), q_id, '무한 루프에 의한 프로세스 정지 문제', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の障害報告を読んでください。\n「14時30分にWebサーバーのCPU使用率が100%に達し、応答不能となった。原因はバッチ処理の実行タイミングがピーク時間と重なったためと判明。暫定対応としてバッチ処理を停止し、15時に復旧した。」\n障害の原因は？', '障害報告書から原因を読み取る問題です。', 1, 47, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하드디스크 용량 부족으로 인한 디스크 I/O 에러', FALSE, 1),
    (gen_random_uuid(), q_id, '네트워크 장비 고장으로 인한 통신 두절 장애', FALSE, 2),
    (gen_random_uuid(), q_id, '메모리 부족으로 인한 Out of Memory 에러', FALSE, 3),
    (gen_random_uuid(), q_id, '배치 처리가 피크 시간과 겹쳐서 CPU 사용률 100%', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「本システムはマイクロサービスアーキテクチャを採用し、各サービスはREST APIで通信する。認証にはJWTトークンを使用し、トークンの有効期限は1時間とする。」\n認証方式は？', 'システム仕様から認証方式を読み取る問題です。', 1, 48, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Session 기반 인증 (서버 측 상태 관리)', FALSE, 1),
    (gen_random_uuid(), q_id, 'OAuth 2.0 인증 (외부 프로바이더 연계)', FALSE, 2),
    (gen_random_uuid(), q_id, 'JWT 토큰 인증 (유효기간 1시간 설정)', TRUE, 3),
    (gen_random_uuid(), q_id, 'Basic 인증 (ID/패스워드 직접 전송)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のプルリクエストの説明を読んでください。\n「【変更内容】\nユーザー一覧画面のページネーションを実装しました。\n1ページあたりの表示件数は20件で、総件数も表示します。\n【テスト】\n・0件の場合の表示確認\n・1ページ以下の場合にページネーションが表示されないことを確認」\nテストで確認したことは？', 'PRの説明からテスト内容を読み取る問題です。', 1, 49, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '동시 접속 1000명 시의 응답 속도를 확인', FALSE, 1),
    (gen_random_uuid(), q_id, '0건일 때의 표시와 1페이지 이하일 때 페이지네이션 비표시 확인', TRUE, 2),
    (gen_random_uuid(), q_id, 'XSS 및 SQL 인젝션에 대한 보안 검증을 실시', FALSE, 3),
    (gen_random_uuid(), q_id, '대량 데이터 10만 건 이상에서의 부하 테스트 실시', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文を読んでください。\n「Git運用ルール：developブランチから作業ブランチを切り、作業完了後にdevelopへマージする。mainブランチへのマージはリリース時のみとし、必ずタグを付ける。」\nmainブランチへのマージはいつ行いますか？', 'Git運用ルールを読み取る問題です。', 1, 50, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '작업 완료 시마다 수시로 머지를 실행', FALSE, 1),
    (gen_random_uuid(), q_id, '코드 리뷰가 완료된 직후에 머지 실행', FALSE, 2),
    (gen_random_uuid(), q_id, '매일 정해진 시간에 자동으로 머지 실행', FALSE, 3),
    (gen_random_uuid(), q_id, '릴리스 시에만 머지하고 반드시 태그 부여', TRUE, 4);

  -- reading hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の設計書を読んでください。\n「本システムのデータベース設計において、ユーザーテーブルと注文テーブルは1対多の関係とする。注文テーブルにはuser_idを外部キーとして持ち、CASCADE削除を設定する。これにより、ユーザーが削除された場合、関連する注文データも自動的に削除される。」\nCASCADE削除の意味は？', 'データベース設計のCASCADE削除の仕様を理解する問題です。', 1, 51, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주문 삭제 시 관련 사용자 데이터도 자동으로 삭제된다', FALSE, 1),
    (gen_random_uuid(), q_id, '사용자 삭제 시 관련 주문 데이터도 자동으로 삭제된다', TRUE, 2),
    (gen_random_uuid(), q_id, '외부 키 제약으로 인해 사용자 삭제 자체가 불가능하다', FALSE, 3),
    (gen_random_uuid(), q_id, '주문 데이터는 별도의 배치 처리로 수동 삭제해야 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のアーキテクチャ文書を読んでください。\n「本システムではCQRSパターンを採用する。書き込み操作はCommand側で処理し、RDBMSに永続化する。読み取り操作はQuery側で処理し、読み取り専用のNoSQLデータベースから取得する。データの同期はイベント駆動で非同期に行う。」\nCQRSパターンの特徴として正しいのは？', 'CQRSアーキテクチャパターンの理解を問う問題です。', 1, 52, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '쓰기와 읽기를 분리하고 이벤트 기반으로 비동기 동기화', TRUE, 1),
    (gen_random_uuid(), q_id, '쓰기와 읽기를 같은 DB에서 동기 방식으로 일괄 처리', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 데이터를 NoSQL에만 저장하여 성능을 최적화', FALSE, 3),
    (gen_random_uuid(), q_id, '동기 방식의 2PC 트랜잭션으로 데이터를 동기화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の障害分析レポートを読んでください。\n「根本原因分析（RCA）の結果、今回の障害はデプロイスクリプトにおけるロールバック手順の不備に起因するものと判明した。具体的には、データベースマイグレーションの巻き戻し処理が未実装であったため、デプロイ失敗時にデータの整合性が崩れた。再発防止策として、全マイグレーションにロールバックスクリプトの実装を必須とする。」\n再発防止策は？', '障害分析レポートの再発防止策を読み取る問題です。', 1, 53, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 배포 작업을 당분간 중단하고 재검토한다', FALSE, 1),
    (gen_random_uuid(), q_id, '데이터베이스를 다른 제품으로 전면 교체한다', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 마이그레이션에 롤백 스크립트 구현을 필수화', TRUE, 3),
    (gen_random_uuid(), q_id, '마이그레이션 사용을 중지하고 수동 SQL로 전환', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のSLA文書を読んでください。\n「サービスレベル目標：\n・可用性：99.9%（年間ダウンタイム8.76時間以内）\n・平均応答時間：200ms以下\n・インシデント対応：重大障害は30分以内に一次対応開始\n目標未達の場合、月額利用料の10%を返金する。」\n年間許容ダウンタイムは？', 'SLA文書の可用性指標を読み取る問題です。', 1, 54, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '24시간 이내 (99.7% 가용성 기준)', FALSE, 1),
    (gen_random_uuid(), q_id, '1시간 이내 (99.99% 가용성 기준)', FALSE, 2),
    (gen_random_uuid(), q_id, '8.76시간 이내 (99.9% 가용성 기준)', TRUE, 3),
    (gen_random_uuid(), q_id, '0시간 (100% 가용성, 다운타임 불허)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の技術文書を読んでください。\n「コンテナオーケストレーションにはKubernetesを使用する。Podの水平スケーリングはHPAにより、CPU使用率が70%を超えた場合に自動的にレプリカ数を増加させる。最小レプリカ数は2、最大レプリカ数は10とする。」\nスケーリングの条件は？', 'Kubernetes HPAの設定を読み取る問題です。', 1, 55, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPU 사용률 70% 초과 시 자동 스케일링 (최소2, 최대10)', TRUE, 1),
    (gen_random_uuid(), q_id, '메모리 사용률 80% 초과 시 자동 스케일링 (최소1, 최대5)', FALSE, 2),
    (gen_random_uuid(), q_id, '관리자가 수동으로 레플리카 수를 조정 (최소1, 최대10)', FALSE, 3),
    (gen_random_uuid(), q_id, '시간 기반 스케줄링으로 피크 시간에 자동 확장 (최소2, 최대8)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のCI/CDパイプライン設計書を読んでください。\n「パイプラインは以下の段階で構成する：\n1. ソースコードチェックアウト\n2. 静的解析（SonarQube）\n3. 単体テスト実行\n4. ビルド\n5. 結合テスト実行\n6. ステージング環境デプロイ\n7. 承認ゲート\n8. 本番デプロイ\nいずれかのステージが失敗した場合、パイプラインは停止し、担当者に通知する。」\n承認ゲートはどの段階で行われますか？', 'CI/CDパイプラインの設計を読み取る問題です。', 1, 56, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소스 코드 체크아웃 직후에 승인 게이트를 실행', FALSE, 1),
    (gen_random_uuid(), q_id, '스테이징 환경 배포 후, 본번 배포 전에 승인 게이트 실행', TRUE, 2),
    (gen_random_uuid(), q_id, '단위 테스트 실행 전에 승인 게이트를 실행', FALSE, 3),
    (gen_random_uuid(), q_id, '본번 배포가 완료된 후에 승인 게이트를 실행', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次のセキュリティレビュー結果を読んでください。\n「1. SQLインジェクション対策：パラメータバインドが未実装の箇所が3件あり。至急対応が必要。\n2. XSS対策：出力時のエスケープ処理は全画面で実装済み。\n3. CSRF対策：トークン検証が一部のフォームで欠落。中優先度で対応。\n4. 認証・認可：適切に実装されている。」\n至急対応が必要な項目は？', 'セキュリティレビュー結果から優先度を読み取る問題です。', 1, 57, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'XSS 대책 (출력 시 이스케이프 처리 관련)', FALSE, 1),
    (gen_random_uuid(), q_id, 'CSRF 대책 (토큰 검증 누락 관련 항목)', FALSE, 2),
    (gen_random_uuid(), q_id, '인증/인가 (권한 관리 및 접근 제어)', FALSE, 3),
    (gen_random_uuid(), q_id, 'SQL 인젝션 대책 (파라미터 바인딩 미구현 3건)', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の性能テスト結果を読んでください。\n「同時接続数1000ユーザーの負荷テストを実施した結果、95パーセンタイルの応答時間は800msで、目標の500msを超過している。ボトルネック分析の結果、データベースの接続プール枯渇が原因と特定された。接続プールのサイズを現状の50から100に拡張することを推奨する。」\nボトルネックの原因は？', '性能テスト結果の分析を読み取る問題です。', 1, 58, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스 커넥션 풀 고갈이 원인으로 특정됨', TRUE, 1),
    (gen_random_uuid(), q_id, 'CPU 사용률 과다로 인한 처리 지연이 원인임', FALSE, 2),
    (gen_random_uuid(), q_id, '네트워크 대역폭 부족으로 인한 패킷 손실이 원인', FALSE, 3),
    (gen_random_uuid(), q_id, '디스크 I/O 병목으로 인한 읽기/쓰기 지연이 원인', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の技術提案書を読んでください。\n「現行システムのモノリシックアーキテクチャをマイクロサービスに移行することを提案する。移行にあたっては、ストラングラーフィグパターンを採用し、段階的に機能を切り出す。まず認証サービスを分離し、次にユーザー管理、最後に注文管理を移行する。各フェーズ間のデータ整合性はSagaパターンで担保する。」\n移行の順序として正しいのは？', 'マイクロサービス移行提案書の理解を問う問題です。', 1, 59, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '주문 관리 → 사용자 관리 → 인증 서비스 순서', FALSE, 1),
    (gen_random_uuid(), q_id, '사용자 관리 → 인증 서비스 → 주문 관리 순서', FALSE, 2),
    (gen_random_uuid(), q_id, '인증 서비스 → 사용자 관리 → 주문 관리 순서', TRUE, 3),
    (gen_random_uuid(), q_id, '모든 서비스를 동시에 일괄적으로 이관하는 방식', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の運用設計書を読んでください。\n「監視設計：\n・インフラ監視：Prometheusでメトリクスを収集し、Grafanaで可視化\n・アプリケーション監視：分散トレーシングにJaegerを使用\n・ログ管理：ELKスタック（Elasticsearch, Logstash, Kibana）で集約\n・アラート：PagerDutyと連携し、重要度に応じてエスカレーション\nログの保持期間は90日とし、その後アーカイブストレージに移動する。」\nログの保持期間は？', '運用設計書からログ保持期間を読み取る問題です。', 1, 60, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '30일간 보관 후 완전 삭제 처리', FALSE, 1),
    (gen_random_uuid(), q_id, '90일간 보관 후 아카이브 스토리지로 이동', TRUE, 2),
    (gen_random_uuid(), q_id, '365일간 보관 후 아카이브 스토리지로 이동', FALSE, 3),
    (gen_random_uuid(), q_id, '무기한 보관하며 자동 삭제 없이 유지', FALSE, 4);

  -- ==========================================
  -- FILL_BLANK category (30 questions, sort_order 61-90)
  -- ==========================================

  -- fill_blank easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「サーバーに___を送信します。」', '「リクエスト(Request)」はサーバーへの要求を意味するIT基本用語です。', 1, 61, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レスポンス', FALSE, 1),
    (gen_random_uuid(), q_id, 'リクエスト', TRUE, 2),
    (gen_random_uuid(), q_id, 'パケット', FALSE, 3),
    (gen_random_uuid(), q_id, 'セッション', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___を修正してから、もう一度テストしてください。」', '「バグ(Bug)」はプログラムの不具合を意味するIT用語です。', 1, 62, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ログ', FALSE, 2),
    (gen_random_uuid(), q_id, 'スペック', FALSE, 3),
    (gen_random_uuid(), q_id, 'チケット', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「コードの変更を___にコミットしてください。」', '「リポジトリ(Repository)」はソースコードの保管場所です。', 1, 63, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブランチ', FALSE, 1),
    (gen_random_uuid(), q_id, 'クラウド', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンテナ', FALSE, 3),
    (gen_random_uuid(), q_id, 'リポジトリ', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「新しい機能を追加するために、___を作成しました。」', '「ブランチ(Branch)」は独立した開発ラインを作るGitの機能です。', 1, 64, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンテナ', FALSE, 1),
    (gen_random_uuid(), q_id, 'モジュール', FALSE, 2),
    (gen_random_uuid(), q_id, 'ブランチ', TRUE, 3),
    (gen_random_uuid(), q_id, 'パッケージ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___が完了したら、本番環境にデプロイします。」', '「テスト」は本番環境へのデプロイ前に行う品質確認です。', 1, 65, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト', TRUE, 1),
    (gen_random_uuid(), q_id, 'レビュー', FALSE, 2),
    (gen_random_uuid(), q_id, 'コーディング', FALSE, 3),
    (gen_random_uuid(), q_id, '要件定義', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「データを___に保存してください。」', '「データベース」はデータを構造的に保存・管理するシステムです。', 1, 66, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キャッシュ', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ログ', FALSE, 3),
    (gen_random_uuid(), q_id, 'データベース', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「この___は、ユーザー情報を管理する画面です。」', '「画面」はUIの表示領域を指すIT用語です。', 1, 67, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバー', FALSE, 1),
    (gen_random_uuid(), q_id, '画面', TRUE, 2),
    (gen_random_uuid(), q_id, 'モジュール', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「プルリクエストの___が完了しました。マージしてください。」', '「レビュー(Review)」はコードの品質チェックを意味します。', 1, 68, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レビュー', TRUE, 1),
    (gen_random_uuid(), q_id, 'ビルド', FALSE, 2),
    (gen_random_uuid(), q_id, 'テスト', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___エラーが発生しました。ステータスコードは404です。」', 'ステータスコード404は「ページが見つからない」エラーです。', 1, 69, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Bad Request', FALSE, 1),
    (gen_random_uuid(), q_id, 'Unauthorized', FALSE, 2),
    (gen_random_uuid(), q_id, 'Internal Server', FALSE, 3),
    (gen_random_uuid(), q_id, 'Not Found', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「アプリケーションを___にデプロイしました。」', '「サーバー」はアプリケーションを実行するコンピュータです。', 1, 70, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブラウザ', FALSE, 1),
    (gen_random_uuid(), q_id, 'クライアント', FALSE, 2),
    (gen_random_uuid(), q_id, 'エディタ', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバー', TRUE, 4);

  -- fill_blank medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___テストでは、モジュール間のインターフェースが正しく動作するか確認します。」', '結合テストはモジュール間の連携を確認するテストです。', 1, 71, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '単体', FALSE, 1),
    (gen_random_uuid(), q_id, '結合', TRUE, 2),
    (gen_random_uuid(), q_id, '負荷', FALSE, 3),
    (gen_random_uuid(), q_id, '受入', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「データベースの___を最適化することで、検索速度が向上しました。」', 'インデックスはデータベースの検索性能を向上させる仕組みです。', 1, 72, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブル', FALSE, 1),
    (gen_random_uuid(), q_id, 'スキーマ', FALSE, 2),
    (gen_random_uuid(), q_id, 'インデックス', TRUE, 3),
    (gen_random_uuid(), q_id, 'パーティション', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「APIの___にはJSON形式を使用します。」', 'レスポンスはAPIがクライアントに返す応答データです。', 1, 73, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエスト', FALSE, 1),
    (gen_random_uuid(), q_id, 'ヘッダー', FALSE, 2),
    (gen_random_uuid(), q_id, 'パラメータ', FALSE, 3),
    (gen_random_uuid(), q_id, 'レスポンス', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___管理にはGitHubのIssue機能を使用しています。」', 'タスク管理はプロジェクトの作業を追跡・管理する活動です。', 1, 74, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'タスク', TRUE, 1),
    (gen_random_uuid(), q_id, 'バージョン', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソースコード', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「セキュリティ対策として、パスワードは___化して保存します。」', 'ハッシュ化はパスワードを不可逆に変換するセキュリティ手法です。', 1, 75, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '暗号', FALSE, 1),
    (gen_random_uuid(), q_id, 'エンコード', FALSE, 2),
    (gen_random_uuid(), q_id, 'ハッシュ', TRUE, 3),
    (gen_random_uuid(), q_id, '圧縮', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___駆動開発では、先にテストコードを書いてから実装を行います。」', 'テスト駆動開発(TDD)はテストファーストのプラクティスです。', 1, 76, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン', FALSE, 1),
    (gen_random_uuid(), q_id, 'イベント', FALSE, 2),
    (gen_random_uuid(), q_id, 'データ', FALSE, 3),
    (gen_random_uuid(), q_id, 'テスト', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「コードの品質を保つために、定期的に___を実施しています。」', 'コードレビューはコード品質を維持するためのレビュープロセスです。', 1, 77, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードレビュー', TRUE, 1),
    (gen_random_uuid(), q_id, 'リファクタリング', FALSE, 2),
    (gen_random_uuid(), q_id, 'デバッグ', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロファイリング', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「この機能は次の___で対応する予定です。」', 'スプリントはアジャイル開発の反復的な開発サイクルです。', 1, 78, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ミーティング', FALSE, 1),
    (gen_random_uuid(), q_id, 'スプリント', TRUE, 2),
    (gen_random_uuid(), q_id, 'リリース', FALSE, 3),
    (gen_random_uuid(), q_id, 'イテレーション', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「本番障害の___として、サーバーを再起動しました。」', '暫定対応は恒久対応までの一時的な対処です。', 1, 79, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '原因調査', FALSE, 1),
    (gen_random_uuid(), q_id, '影響調査', FALSE, 2),
    (gen_random_uuid(), q_id, '暫定対応', TRUE, 3),
    (gen_random_uuid(), q_id, '恒久対応', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___パターンを適用して、オブジェクトの生成ロジックをカプセル化しました。」', 'ファクトリーパターンはオブジェクト生成をカプセル化するデザインパターンです。', 1, 80, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'シングルトン', FALSE, 1),
    (gen_random_uuid(), q_id, 'オブザーバー', FALSE, 2),
    (gen_random_uuid(), q_id, 'ストラテジー', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファクトリー', TRUE, 4);

  -- fill_blank hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「マイクロサービス間のデータ整合性を保つために、___パターンを採用しました。」', 'Sagaパターンは分散トランザクションを管理するパターンです。', 1, 81, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CQRS', FALSE, 1),
    (gen_random_uuid(), q_id, 'Saga', TRUE, 2),
    (gen_random_uuid(), q_id, 'Bulkhead', FALSE, 3),
    (gen_random_uuid(), q_id, 'Circuit Breaker', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「外部サービスの障害が伝播しないように、___パターンを導入しました。」', 'サーキットブレーカーパターンは障害の伝播を防ぐパターンです。', 1, 82, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーキットブレーカー', TRUE, 1),
    (gen_random_uuid(), q_id, 'フォールバック', FALSE, 2),
    (gen_random_uuid(), q_id, 'バルクヘッド', FALSE, 3),
    (gen_random_uuid(), q_id, 'リトライ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「データベースの___レベルをREAD COMMITTEDに設定しています。」', 'トランザクション分離レベルはデータの一貫性を制御する設定です。', 1, 83, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '接続（コネクション）', FALSE, 1),
    (gen_random_uuid(), q_id, 'セキュリティ', FALSE, 2),
    (gen_random_uuid(), q_id, '分離（アイソレーション）', TRUE, 3),
    (gen_random_uuid(), q_id, 'パフォーマンス', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「コンテナの___にはDockerfileを使用し、マルチステージビルドで最終イメージのサイズを削減しています。」', 'ビルドはDockerイメージを作成するプロセスです。', 1, 84, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 1),
    (gen_random_uuid(), q_id, 'オーケストレーション', FALSE, 2),
    (gen_random_uuid(), q_id, 'モニタリング', FALSE, 3),
    (gen_random_uuid(), q_id, 'ビルド', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___原則に従い、クラスは変更の理由がただ一つだけであるべきです。」', '単一責任の原則(SRP)はSOLID原則の一つです。', 1, 85, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '単一責任', TRUE, 1),
    (gen_random_uuid(), q_id, 'オープン・クローズド', FALSE, 2),
    (gen_random_uuid(), q_id, 'リスコフ置換', FALSE, 3),
    (gen_random_uuid(), q_id, 'インターフェース分離', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「認証情報を安全に管理するため、___管理ツールとしてVaultを導入しました。」', 'シークレット管理はAPI鍵やパスワードを安全に扱う仕組みです。', 1, 86, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンフィグ', FALSE, 1),
    (gen_random_uuid(), q_id, 'シークレット', TRUE, 2),
    (gen_random_uuid(), q_id, 'バージョン', FALSE, 3),
    (gen_random_uuid(), q_id, 'パッケージ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___テストでは、同時に1000ユーザーがアクセスした場合のシステムの挙動を確認します。」', '負荷テストはシステムの性能限界を確認するテストです。', 1, 87, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '結合', FALSE, 1),
    (gen_random_uuid(), q_id, '回帰', FALSE, 2),
    (gen_random_uuid(), q_id, '負荷', TRUE, 3),
    (gen_random_uuid(), q_id, '受入', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「本番環境へのデプロイは___デプロイ方式を採用し、ダウンタイムゼロでリリースします。」', 'ブルーグリーンデプロイはダウンタイムなしでリリースする方式です。', 1, 88, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ローリング', FALSE, 1),
    (gen_random_uuid(), q_id, 'カナリア', FALSE, 2),
    (gen_random_uuid(), q_id, 'ブルーグリーン', TRUE, 3),
    (gen_random_uuid(), q_id, 'インプレース', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「___の原則に基づき、上位モジュールは下位モジュールに依存すべきではなく、両者とも抽象に依存すべきです。」', '依存性逆転の原則(DIP)はSOLID原則のDです。', 1, 89, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '依存性逆転', TRUE, 1),
    (gen_random_uuid(), q_id, 'インターフェース分離', FALSE, 2),
    (gen_random_uuid(), q_id, 'リスコフ置換', FALSE, 3),
    (gen_random_uuid(), q_id, 'オープン・クローズド', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', E'次の文の空欄に入る言葉は？\n「分散システムにおいて、___定理により、一貫性、可用性、分断耐性の3つを同時に満たすことはできない。」', 'CAP定理は分散システムの基本的な制約を示す定理です。', 1, 90, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ACID', FALSE, 1),
    (gen_random_uuid(), q_id, 'BASE', FALSE, 2),
    (gen_random_uuid(), q_id, 'CAP', TRUE, 3),
    (gen_random_uuid(), q_id, 'SOLID', FALSE, 4);

END $$;

-- ============================================
-- Quiz 3: CS知識ランク試験 (90 questions)
-- Categories: algorithm, data_structure, os, network
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== algorithm - EASY (9) =====

  -- Q1: O記法の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '要素数nの配列を先頭から順に探索する線形探索の時間計算量はどれか。', '線形探索は最悪の場合すべての要素を調べるため、時間計算量はO(n)です。', 1, 1, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 4);

  -- Q2: 二分探索の前提
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分探索を適用するための前提条件として正しいものはどれか。', '二分探索は中央の要素と比較して探索範囲を半分に絞るため、データがソート済みである必要があります。', 1, 2, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データがソート済みであること', TRUE, 1),
    (gen_random_uuid(), q_id, 'データが連結リストに格納されていること', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの要素数が2の累乗であること', FALSE, 3),
    (gen_random_uuid(), q_id, 'データに重複がないこと', FALSE, 4);

  -- Q3: 二分探索の計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ソート済み配列に対する二分探索の平均時間計算量はどれか。', '二分探索は毎回探索範囲を半分にするため、時間計算量はO(log n)です。', 1, 3, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(log n)', TRUE, 4);

  -- Q4: バブルソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'バブルソートの最悪時間計算量はどれか。', 'バブルソートは隣接要素の比較・交換を繰り返すため、最悪時間計算量はO(n²)です。', 1, 4, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n²)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 4);

  -- Q5: 選択ソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '選択ソートの動作として正しいものはどれか。', '選択ソートは未整列部分から最小値（または最大値）を見つけ、先頭の要素と交換する操作を繰り返します。', 1, 5, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '隣接する要素を比較して交換を繰り返す', FALSE, 1),
    (gen_random_uuid(), q_id, '未整列部分から最小値を選び先頭と交換する', TRUE, 2),
    (gen_random_uuid(), q_id, '要素を適切な位置に挿入していく', FALSE, 3),
    (gen_random_uuid(), q_id, 'ピボットを基準に分割を繰り返す', FALSE, 4);

  -- Q6: 挿入ソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '挿入ソートの最良時間計算量はどれか。', '挿入ソートは配列がすでにソート済みの場合、各要素を1回ずつ確認するだけで済むため、最良時間計算量はO(n)です。', 1, 6, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 4);

  -- Q7: 再帰の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '再帰関数に必ず必要なものはどれか。', '再帰関数にはベースケース（終了条件）がないと無限に自身を呼び出し続け、スタックオーバーフローを起こします。', 1, 7, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'グローバル変数', FALSE, 1),
    (gen_random_uuid(), q_id, '複数の引数', FALSE, 2),
    (gen_random_uuid(), q_id, '戻り値の型宣言', FALSE, 3),
    (gen_random_uuid(), q_id, 'ベースケース（終了条件）', TRUE, 4);

  -- Q8: O記法の意味
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'O記法（ビッグオー記法）が表すものとして最も適切なのはどれか。', 'O記法はアルゴリズムの最悪時における計算量の上界（増加のオーダー）を表す記法です。', 1, 8, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラムの実行にかかる正確な秒数', FALSE, 1),
    (gen_random_uuid(), q_id, 'アルゴリズムの最悪時における計算量の増加オーダー', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモリ使用量の最小値', FALSE, 3),
    (gen_random_uuid(), q_id, 'CPUのクロック周波数に対する性能比', FALSE, 4);

  -- Q9: 安定ソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '安定ソートの説明として正しいものはどれか。', '安定ソートとは、同じキー値を持つ要素の相対的な順序がソート後も保持されるソートアルゴリズムのことです。', 1, 9, 'easy', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '常にO(n log n)で動作するソート', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリ使用量がO(1)であるソート', FALSE, 2),
    (gen_random_uuid(), q_id, '同じ値の要素の相対順序がソート後も保持されるソート', TRUE, 3),
    (gen_random_uuid(), q_id, '入力データに関係なく常に同じ実行時間のソート', FALSE, 4);

  -- ===== algorithm - MEDIUM (9) =====

  -- Q10: クイックソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クイックソートの平均時間計算量はどれか。', 'クイックソートはピボットを基準に分割統治を行い、平均時間計算量はO(n log n)です。ただし最悪はO(n²)になります。', 1, 10, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n log n)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 4);

  -- Q11: マージソート
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'マージソートの特徴として正しいものはどれか。', 'マージソートは安定ソートであり、最悪でもO(n log n)を保証しますが、追加のメモリ領域O(n)が必要です。', 1, 11, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '追加メモリ不要のインプレースソートである', FALSE, 1),
    (gen_random_uuid(), q_id, '最悪計算量がO(n²)になる場合がある', FALSE, 2),
    (gen_random_uuid(), q_id, '安定ソートであり最悪でもO(n log n)を保証する', TRUE, 3),
    (gen_random_uuid(), q_id, '不安定ソートだが平均計算量が最も速い', FALSE, 4);

  -- Q12: ハッシュ法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュ法における探索の平均時間計算量はどれか。', 'ハッシュ法ではハッシュ関数で直接アクセスするため、衝突がなければ平均O(1)で探索できます。', 1, 12, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- Q13: グリーディ法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'グリーディ法（貪欲法）の説明として正しいものはどれか。', 'グリーディ法は各段階で局所的に最適な選択を行う手法で、常にグローバル最適解が得られるとは限りません。', 1, 13, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべての組み合わせを試して最適解を求める', FALSE, 1),
    (gen_random_uuid(), q_id, '問題を小さな部分問題に分割して結果を統合する', FALSE, 2),
    (gen_random_uuid(), q_id, '過去の計算結果を記録して再利用する', FALSE, 3),
    (gen_random_uuid(), q_id, '各段階で局所的に最適な選択を繰り返す', TRUE, 4);

  -- Q14: 分割統治法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '分割統治法を用いているアルゴリズムとして最も適切なのはどれか。', 'マージソートは配列を半分に分割し、再帰的にソートしてからマージする典型的な分割統治法のアルゴリズムです。', 1, 14, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '線形探索', FALSE, 1),
    (gen_random_uuid(), q_id, 'マージソート', TRUE, 2),
    (gen_random_uuid(), q_id, 'バブルソート', FALSE, 3),
    (gen_random_uuid(), q_id, 'ダイクストラ法', FALSE, 4);

  -- Q15: DFS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '深さ優先探索（DFS）の実装に一般的に使用されるデータ構造はどれか。', 'DFSは最後に訪れた頂点から探索を進めるため、スタック（または再帰呼び出しスタック）を使用します。', 1, 15, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キュー', FALSE, 1),
    (gen_random_uuid(), q_id, 'ヒープ', FALSE, 2),
    (gen_random_uuid(), q_id, 'スタック', TRUE, 3),
    (gen_random_uuid(), q_id, 'ハッシュテーブル', FALSE, 4);

  -- Q16: BFS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '幅優先探索（BFS）の実装に一般的に使用されるデータ構造はどれか。', 'BFSは発見した頂点を順に処理するため、先入先出のキューを使用します。', 1, 16, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スタック', FALSE, 1),
    (gen_random_uuid(), q_id, 'キュー', TRUE, 2),
    (gen_random_uuid(), q_id, '二分探索木', FALSE, 3),
    (gen_random_uuid(), q_id, '配列', FALSE, 4);

  -- Q17: 動的計画法の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '動的計画法（DP）の基本的な考え方として正しいものはどれか。', '動的計画法は部分問題の解をメモ化（記録）して再利用することで、重複計算を避け効率的に解を求めます。', 1, 17, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '乱数を使って近似解を高速に求める', FALSE, 1),
    (gen_random_uuid(), q_id, '部分問題の解を記録し再利用して重複計算を避ける', TRUE, 2),
    (gen_random_uuid(), q_id, '常に局所最適な選択を繰り返す', FALSE, 3),
    (gen_random_uuid(), q_id, '問題をランダムに分割して並列処理する', FALSE, 4);

  -- Q18: クイックソートの最悪ケース
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クイックソートの最悪時間計算量がO(n²)になるのはどのような場合か。', 'ピボットが常に最小値または最大値に選ばれると、分割が偏り最悪O(n²)になります。すでにソート済みの配列で先頭をピボットにすると発生しやすいです。', 1, 18, 'medium', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '配列の要素がすべて同じ値の場合', FALSE, 1),
    (gen_random_uuid(), q_id, '配列の要素数が奇数の場合', FALSE, 2),
    (gen_random_uuid(), q_id, 'ピボットが常に最小値または最大値に選ばれる場合', TRUE, 3),
    (gen_random_uuid(), q_id, '配列にランダムな値が含まれる場合', FALSE, 4);

  -- ===== algorithm - HARD (9) =====

  -- Q19: ダイクストラ法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ダイクストラ法の制約として正しいものはどれか。', 'ダイクストラ法は負の重みを持つ辺があると正しく動作しません。負の辺がある場合はベルマンフォード法を使います。', 1, 19, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'グラフが無向グラフでなければならない', FALSE, 1),
    (gen_random_uuid(), q_id, '辺の重みが負でないことが必要である', TRUE, 2),
    (gen_random_uuid(), q_id, 'グラフが完全グラフでなければならない', FALSE, 3),
    (gen_random_uuid(), q_id, '頂点数が辺数より多くなければならない', FALSE, 4);

  -- Q20: ベルマンフォード法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ベルマンフォード法の時間計算量はどれか（頂点数V、辺数E）。', 'ベルマンフォード法はすべての辺を(V-1)回緩和するため、時間計算量はO(VE)です。', 1, 20, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V + E)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(V log V)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(E log V)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(VE)', TRUE, 4);

  -- Q21: 高度なDP（ナップサック問題）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '0-1ナップサック問題をDPで解く場合の時間計算量はどれか（品物数n、容量W）。', '0-1ナップサック問題は品物ごとに各容量の最適値を更新するため、時間計算量はO(nW)です。', 1, 21, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n log W)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(nW)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(2^n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 4);

  -- Q22: 最小全域木（クラスカル法）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'クラスカル法で最小全域木を求める際に使用される代表的なデータ構造はどれか。', 'クラスカル法では辺を重みの昇順に処理し、閉路の検出にUnion-Find（素集合データ構造）を使用します。', 1, 22, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '優先度キュー', FALSE, 1),
    (gen_random_uuid(), q_id, 'Union-Find（素集合データ構造）', TRUE, 2),
    (gen_random_uuid(), q_id, 'AVL木', FALSE, 3),
    (gen_random_uuid(), q_id, 'ハッシュテーブル', FALSE, 4);

  -- Q23: NP完全問題
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'NP完全問題の説明として正しいものはどれか。', 'NP完全問題はNPに属し、かつすべてのNP問題が多項式時間で帰着可能な問題です。多項式時間の解法は見つかっていません。', 1, 23, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '多項式時間で必ず解ける問題', FALSE, 1),
    (gen_random_uuid(), q_id, '解が存在しないことが証明された問題', FALSE, 2),
    (gen_random_uuid(), q_id, 'NPに属し全てのNP問題から多項式時間で帰着可能な問題', TRUE, 3),
    (gen_random_uuid(), q_id, '指数時間でしか検証できない問題', FALSE, 4);

  -- Q24: 計算量クラス P vs NP
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '計算量クラスPの説明として正しいものはどれか。', 'クラスPは決定性チューリングマシンで多項式時間で解ける決定問題の集合です。', 1, 24, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '決定性チューリングマシンで多項式時間で解ける問題の集合', TRUE, 1),
    (gen_random_uuid(), q_id, '非決定性チューリングマシンでのみ解ける問題の集合', FALSE, 2),
    (gen_random_uuid(), q_id, '解の検証に指数時間かかる問題の集合', FALSE, 3),
    (gen_random_uuid(), q_id, '近似アルゴリズムでしか解けない問題の集合', FALSE, 4);

  -- Q25: ダイクストラ法の計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '優先度キュー（二分ヒープ）を使ったダイクストラ法の時間計算量はどれか（頂点数V、辺数E）。', '二分ヒープを使うと頂点の取り出しにO(log V)、各辺の緩和にO(log V)かかるため、全体でO((V + E) log V)です。', 1, 25, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V²)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(VE)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O((V + E) log V)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(V log E)', FALSE, 4);

  -- Q26: プリム法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プリム法とクラスカル法の共通点として正しいものはどれか。', 'プリム法もクラスカル法もグラフの最小全域木を求める貪欲アルゴリズムです。', 1, 26, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'どちらも最短経路を求めるアルゴリズムである', FALSE, 1),
    (gen_random_uuid(), q_id, 'どちらも動的計画法に基づくアルゴリズムである', FALSE, 2),
    (gen_random_uuid(), q_id, 'どちらも負の辺がある場合のみ使用される', FALSE, 3),
    (gen_random_uuid(), q_id, 'どちらも最小全域木を求める貪欲アルゴリズムである', TRUE, 4);

  -- Q27: メモ化再帰とDP
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'メモ化再帰（トップダウンDP）とボトムアップDPの違いとして正しいものはどれか。', 'メモ化再帰は必要な部分問題のみを解くのに対し、ボトムアップDPは小さい部分問題からすべて順に解いていきます。', 1, 27, 'hard', 'algorithm');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモ化再帰は再帰を使わずループで実装する', FALSE, 1),
    (gen_random_uuid(), q_id, 'ボトムアップDPは必要な部分問題だけを計算する', FALSE, 2),
    (gen_random_uuid(), q_id, 'メモ化再帰は必要な部分問題のみを解きボトムアップは全部分問題を順に解く', TRUE, 3),
    (gen_random_uuid(), q_id, '両者の計算量は常に異なる', FALSE, 4);

  -- ===== data_structure - EASY (9) =====

  -- Q28: 配列の特徴
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '配列のインデックスによるアクセスの時間計算量はどれか。', '配列は連続したメモリ領域に格納されるため、インデックスで直接アクセスでき、時間計算量はO(1)です。', 1, 28, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(n²)', FALSE, 4);

  -- Q29: 連結リスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '単方向連結リストの先頭への挿入の時間計算量はどれか。', '連結リストの先頭への挿入は新しいノードを作成しポインタを付け替えるだけなので、O(1)です。', 1, 29, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- Q30: スタック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'スタックのデータ操作方式として正しいものはどれか。', 'スタックはLIFO（Last In, First Out）方式で、最後に追加された要素が最初に取り出されます。', 1, 30, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'FIFO（先入先出）', FALSE, 1),
    (gen_random_uuid(), q_id, 'LIFO（後入先出）', TRUE, 2),
    (gen_random_uuid(), q_id, 'ランダムアクセス', FALSE, 3),
    (gen_random_uuid(), q_id, '優先度順', FALSE, 4);

  -- Q31: キュー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'キューのデータ操作方式として正しいものはどれか。', 'キューはFIFO（First In, First Out）方式で、最初に追加された要素が最初に取り出されます。', 1, 31, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LIFO（後入先出）', FALSE, 1),
    (gen_random_uuid(), q_id, '優先度順', FALSE, 2),
    (gen_random_uuid(), q_id, 'FIFO（先入先出）', TRUE, 3),
    (gen_random_uuid(), q_id, 'ランダムアクセス', FALSE, 4);

  -- Q32: ハッシュテーブル基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュテーブルでキーから値を取得する平均時間計算量はどれか。', 'ハッシュテーブルはハッシュ関数でインデックスを計算して直接アクセスするため、衝突が少なければ平均O(1)です。', 1, 32, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 4);

  -- Q33: 配列 vs 連結リスト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '連結リストが配列より優れている操作はどれか。', '連結リストは中間要素の挿入・削除時にポインタの付け替えだけで済むため、O(1)で実行できます（位置が既知の場合）。配列では要素のシフトが必要です。', 1, 33, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インデックスによるランダムアクセス', FALSE, 1),
    (gen_random_uuid(), q_id, '中間位置への要素の挿入・削除', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモリの効率的な使用', FALSE, 3),
    (gen_random_uuid(), q_id, 'キャッシュ効率の高い順次アクセス', FALSE, 4);

  -- Q34: スタックの応用
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'スタックが利用される場面として最も適切なものはどれか。', '括弧の対応チェックでは開き括弧をスタックにpushし、閉じ括弧が来たらpopして対応を確認します。', 1, 34, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プリンタのジョブ管理', FALSE, 1),
    (gen_random_uuid(), q_id, 'CPUのタスクスケジューリング', FALSE, 2),
    (gen_random_uuid(), q_id, '括弧の対応チェック', TRUE, 3),
    (gen_random_uuid(), q_id, '最短経路の探索', FALSE, 4);

  -- Q35: キューの応用
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'キューが利用される場面として最も適切なものはどれか。', 'プリンタのジョブ管理は先に依頼された印刷から順に処理するFIFO方式で、キューが適しています。', 1, 35, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数の再帰呼び出し管理', FALSE, 1),
    (gen_random_uuid(), q_id, 'ブラウザの戻るボタン履歴', FALSE, 2),
    (gen_random_uuid(), q_id, '式の逆ポーランド記法の評価', FALSE, 3),
    (gen_random_uuid(), q_id, 'プリンタのジョブ管理', TRUE, 4);

  -- Q36: 連結リストの探索
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '単方向連結リストで特定の要素を探索する時間計算量はどれか。', '連結リストではインデックスによる直接アクセスができないため、先頭から順にたどる必要があり、最悪O(n)です。', 1, 36, 'easy', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- ===== data_structure - MEDIUM (9) =====

  -- Q37: 二分探索木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分探索木（BST）の性質として正しいものはどれか。', '二分探索木では、任意のノードの左部分木のすべての値はそのノードより小さく、右部分木のすべての値はそのノードより大きくなります。', 1, 37, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '各ノードは最大3つの子を持つ', FALSE, 1),
    (gen_random_uuid(), q_id, '左の子は親より小さく右の子は親より大きい', TRUE, 2),
    (gen_random_uuid(), q_id, '常に完全二分木である', FALSE, 3),
    (gen_random_uuid(), q_id, '葉ノードの深さはすべて同じである', FALSE, 4);

  -- Q38: ヒープ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '最小ヒープにおいて最小値を取得する時間計算量はどれか。', '最小ヒープでは最小値が常にルートにあるため、O(1)で取得できます。削除後の再構成にはO(log n)かかります。', 1, 38, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- Q39: グラフ表現（隣接行列）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '頂点数Vのグラフを隣接行列で表現した場合の空間計算量はどれか。', '隣接行列はV×Vの2次元配列を使用するため、空間計算量はO(V²)です。', 1, 39, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(V + E)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(V²)', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(E²)', FALSE, 4);

  -- Q40: グラフ表現（隣接リスト）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '隣接リストでグラフを表現した場合の空間計算量はどれか（頂点数V、辺数E）。', '隣接リストは各頂点のリストと各辺の情報を保持するため、空間計算量はO(V + E)です。', 1, 40, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(V²)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(V + E)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(E)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(V × E)', FALSE, 4);

  -- Q41: ハッシュ衝突解決（チェイン法）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュテーブルの衝突解決法であるチェイン法の説明として正しいものはどれか。', 'チェイン法は同じハッシュ値を持つ要素を連結リストで管理する方式です。', 1, 41, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '衝突時に次の空きスロットを探す', FALSE, 1),
    (gen_random_uuid(), q_id, '衝突時にハッシュ関数を変えて再計算する', FALSE, 2),
    (gen_random_uuid(), q_id, '同じハッシュ値の要素を連結リストで管理する', TRUE, 3),
    (gen_random_uuid(), q_id, '衝突時にテーブルサイズを2倍にする', FALSE, 4);

  -- Q42: オープンアドレス法
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ハッシュテーブルの衝突解決法であるオープンアドレス法（線形探査）の説明として正しいものはどれか。', 'オープンアドレス法の線形探査は、衝突が発生したら次のスロットを順に調べて空きを見つけます。', 1, 42, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '衝突したら次の空きスロットを順に探す', TRUE, 1),
    (gen_random_uuid(), q_id, '衝突した要素を別のハッシュテーブルに格納する', FALSE, 2),
    (gen_random_uuid(), q_id, '衝突した要素を連結リストで管理する', FALSE, 3),
    (gen_random_uuid(), q_id, '衝突したら要素を破棄する', FALSE, 4);

  -- Q43: 優先度キュー
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '優先度キューの実装に最もよく使われるデータ構造はどれか。', '優先度キューはヒープで実装するのが一般的で、挿入・削除がO(log n)で効率的に行えます。', 1, 43, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ソート済み配列', FALSE, 1),
    (gen_random_uuid(), q_id, '連結リスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'ヒープ', TRUE, 3),
    (gen_random_uuid(), q_id, 'ハッシュテーブル', FALSE, 4);

  -- Q44: 二分探索木の最悪ケース
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分探索木の探索が最悪O(n)になるのはどのような場合か。', '昇順または降順にデータを挿入すると木が一方向に偏り（退化して連結リストのようになり）、探索がO(n)になります。', 1, 44, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ノード数が2の累乗のとき', FALSE, 1),
    (gen_random_uuid(), q_id, '木が完全二分木のとき', FALSE, 2),
    (gen_random_uuid(), q_id, 'データがランダムな順序で挿入されたとき', FALSE, 3),
    (gen_random_uuid(), q_id, 'データが昇順または降順に挿入されて木が偏ったとき', TRUE, 4);

  -- Q45: ヒープの挿入計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '二分ヒープへの要素挿入の時間計算量はどれか。', '二分ヒープへの挿入は末尾に追加してから親と比較して上に移動（ヒープアップ）するため、木の高さに比例しO(log n)です。', 1, 45, 'medium', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(log n)', TRUE, 2),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(n log n)', FALSE, 4);

  -- ===== data_structure - HARD (9) =====

  -- Q46: AVL木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'AVL木の特徴として正しいものはどれか。', 'AVL木は各ノードの左右部分木の高さの差が最大1以内に保たれる自己平衡二分探索木です。', 1, 46, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '各ノードの左右部分木の高さの差が最大1以内である', TRUE, 1),
    (gen_random_uuid(), q_id, '各ノードが赤または黒の色を持つ', FALSE, 2),
    (gen_random_uuid(), q_id, '各ノードが最大4つの子を持てる', FALSE, 3),
    (gen_random_uuid(), q_id, '葉ノードにのみデータを格納する', FALSE, 4);

  -- Q47: B木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'B木が主に使用される場面として最も適切なのはどれか。', 'B木はノードに複数のキーを持ちディスクI/Oを減らすため、データベースやファイルシステムのインデックスに広く使われています。', 1, 47, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモリ内のソート処理', FALSE, 1),
    (gen_random_uuid(), q_id, 'データベースやファイルシステムのインデックス', TRUE, 2),
    (gen_random_uuid(), q_id, 'グラフの最短経路探索', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワークパケットのルーティング', FALSE, 4);

  -- Q48: トライ木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'トライ木（Trie）の説明として正しいものはどれか。', 'トライ木は文字列の各文字をノードとして格納する木構造で、文字列の探索が文字列長mに対してO(m)で行えます。', 1, 48, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '数値データの高速ソートに使われる', FALSE, 1),
    (gen_random_uuid(), q_id, 'グラフの閉路検出に使われる', FALSE, 2),
    (gen_random_uuid(), q_id, '文字列の各文字をノードとして格納し高速な文字列探索を実現する', TRUE, 3),
    (gen_random_uuid(), q_id, 'ヒープ条件を満たす完全二分木である', FALSE, 4);

  -- Q49: Union-Find
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Union-Find（素集合データ構造）で経路圧縮とランクによる統合を両方適用した場合の1操作あたりの償却計算量はどれか。', '経路圧縮とランクによる統合を組み合わせると、1操作あたりの償却計算量はほぼO(1)であるO(α(n))になります。α(n)は逆アッカーマン関数です。', 1, 49, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(log n)', FALSE, 1),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(α(n))（ほぼ定数時間）', TRUE, 3),
    (gen_random_uuid(), q_id, 'O(√n)', FALSE, 4);

  -- Q50: 赤黒木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '赤黒木の性質として正しいものはどれか。', '赤黒木ではルートから任意の葉までの黒ノードの数（黒高さ）が同じであるという性質により、木の高さがO(log n)に保たれます。', 1, 50, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべてのノードが同じ深さにある', FALSE, 1),
    (gen_random_uuid(), q_id, '左右の部分木の高さの差が常に0である', FALSE, 2),
    (gen_random_uuid(), q_id, 'ルートから任意の葉までの黒ノード数が等しい', TRUE, 3),
    (gen_random_uuid(), q_id, '赤ノードは必ず2つの子を持つ', FALSE, 4);

  -- Q51: AVL木の回転
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'AVL木で挿入後にバランスが崩れた場合に行う操作はどれか。', 'AVL木ではバランス因子が-1から1の範囲を超えた場合、単回転または二重回転を行って平衡を回復します。', 1, 51, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ノードの色を変更する', FALSE, 1),
    (gen_random_uuid(), q_id, '木を再構築する', FALSE, 2),
    (gen_random_uuid(), q_id, '回転操作（単回転または二重回転）を行う', TRUE, 3),
    (gen_random_uuid(), q_id, 'ノードを分割して新しい親を作る', FALSE, 4);

  -- Q52: B木のノード特性
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '次数mのB木において、ルート以外の各ノードが持つキーの最小数はいくつか。', '次数mのB木では、ルート以外の各ノードは最低⌈m/2⌉-1個のキーを持つ必要があります。', 1, 52, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', FALSE, 1),
    (gen_random_uuid(), q_id, 'm-1', FALSE, 2),
    (gen_random_uuid(), q_id, '⌈m/2⌉-1', TRUE, 3),
    (gen_random_uuid(), q_id, 'm/2', FALSE, 4);

  -- Q53: 赤黒木 vs AVL木
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '赤黒木とAVL木の比較として正しいものはどれか。', 'AVL木はより厳密に平衡が保たれるため探索が速い反面、挿入・削除時の回転が多くなります。赤黒木は緩い平衡条件で挿入・削除が効率的です。', 1, 53, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '赤黒木の方が探索が常に速い', FALSE, 1),
    (gen_random_uuid(), q_id, 'AVL木の方が挿入・削除が常に速い', FALSE, 2),
    (gen_random_uuid(), q_id, '赤黒木は挿入・削除が効率的でAVL木は探索が効率的', TRUE, 3),
    (gen_random_uuid(), q_id, '両者の性能は完全に同一である', FALSE, 4);

  -- Q54: トライ木の空間計算量
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'トライ木の欠点として最も適切なものはどれか。', 'トライ木は各ノードが文字集合サイズ分のポインタを持つため、メモリ使用量が大きくなりがちです。', 1, 54, 'hard', 'data_structure');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '文字列の探索がO(n²)になる', FALSE, 1),
    (gen_random_uuid(), q_id, 'ソート済みデータしか格納できない', FALSE, 2),
    (gen_random_uuid(), q_id, '各ノードが文字集合サイズ分のポインタを持ちメモリ使用量が大きい', TRUE, 3),
    (gen_random_uuid(), q_id, '同じ前方一致の文字列を格納できない', FALSE, 4);

  -- ===== os - EASY (6) =====

  -- Q55: プロセスとスレッド
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プロセスとスレッドの違いとして正しいものはどれか。', 'スレッドは同一プロセス内でメモリ空間を共有して動作しますが、プロセスはそれぞれ独立したメモリ空間を持ちます。', 1, 55, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スレッドはプロセスより多くのメモリを消費する', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロセスは同一メモリ空間を共有する', FALSE, 2),
    (gen_random_uuid(), q_id, 'スレッドは同一プロセス内でメモリ空間を共有する', TRUE, 3),
    (gen_random_uuid(), q_id, 'プロセスとスレッドに違いはない', FALSE, 4);

  -- Q56: メモリ管理の基本
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プログラム実行時にローカル変数が格納される領域はどれか。', 'ローカル変数は関数呼び出し時にスタック領域に確保され、関数の終了とともに自動的に解放されます。', 1, 56, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ヒープ領域', FALSE, 1),
    (gen_random_uuid(), q_id, 'スタック領域', TRUE, 2),
    (gen_random_uuid(), q_id, 'データ領域（静的領域）', FALSE, 3),
    (gen_random_uuid(), q_id, 'コード領域', FALSE, 4);

  -- Q57: ファイルシステム
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ファイルシステムの主な役割として正しいものはどれか。', 'ファイルシステムはディスク上のデータを階層的に整理し、ファイルの作成・読み書き・削除を管理します。', 1, 57, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPUのタスクスケジューリング', FALSE, 1),
    (gen_random_uuid(), q_id, 'ネットワーク接続の管理', FALSE, 2),
    (gen_random_uuid(), q_id, 'ディスク上のデータを階層的に整理し管理する', TRUE, 3),
    (gen_random_uuid(), q_id, 'メモリの仮想アドレス変換', FALSE, 4);

  -- Q58: プロセスの状態
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'プロセスの基本的な状態遷移に含まれないものはどれか。', 'プロセスの基本状態は「実行」「準備（実行可能）」「待ち（ブロック）」です。「コンパイル中」はプロセスの状態ではありません。', 1, 58, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行状態', FALSE, 1),
    (gen_random_uuid(), q_id, '準備状態（実行可能）', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンパイル中', TRUE, 3),
    (gen_random_uuid(), q_id, '待ち状態（ブロック）', FALSE, 4);

  -- Q59: ヒープ領域
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ヒープ領域の説明として正しいものはどれか。', 'ヒープ領域はプログラムが実行時に動的にメモリを確保・解放するための領域です。', 1, 59, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数のローカル変数が格納される領域', FALSE, 1),
    (gen_random_uuid(), q_id, 'プログラムの実行コードが配置される領域', FALSE, 2),
    (gen_random_uuid(), q_id, 'グローバル変数と静的変数が格納される領域', FALSE, 3),
    (gen_random_uuid(), q_id, '動的にメモリを確保・解放するための領域', TRUE, 4);

  -- Q60: カーネルの役割
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OSのカーネルの役割として最も適切なものはどれか。', 'カーネルはOSの中核部分で、ハードウェア管理、プロセス管理、メモリ管理などシステム全体を制御します。', 1, 60, 'easy', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ハードウェアやプロセス、メモリなどシステム全体を制御する', TRUE, 1),
    (gen_random_uuid(), q_id, 'ユーザーのGUIを描画する', FALSE, 2),
    (gen_random_uuid(), q_id, 'アプリケーションのインストールを行う', FALSE, 3),
    (gen_random_uuid(), q_id, 'ファイルの圧縮と暗号化を行う', FALSE, 4);

  -- ===== os - MEDIUM (6) =====

  -- Q61: デッドロック
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'デッドロックが発生するために必要な4つの条件に含まれないものはどれか。', 'デッドロックの4条件は「相互排除」「保持と待機」「横取り不可」「循環待ち」です。「優先度逆転」はデッドロックの必要条件ではありません。', 1, 61, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '相互排除', FALSE, 1),
    (gen_random_uuid(), q_id, '保持と待機', FALSE, 2),
    (gen_random_uuid(), q_id, '優先度逆転', TRUE, 3),
    (gen_random_uuid(), q_id, '循環待ち', FALSE, 4);

  -- Q62: ページング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ページングの説明として正しいものはどれか。', 'ページングはメモリを固定サイズのページに分割し、仮想アドレスから物理アドレスへページテーブルを使って変換する手法です。', 1, 62, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモリを可変サイズのセグメントに分割する', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリを固定サイズのページに分割し仮想アドレスを物理アドレスに変換する', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスク全体をメモリとして使用する', FALSE, 3),
    (gen_random_uuid(), q_id, 'CPUキャッシュの管理方式の一つ', FALSE, 4);

  -- Q63: 仮想メモリ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '仮想メモリの利点として正しいものはどれか。', '仮想メモリにより物理メモリより大きなアドレス空間を使用でき、各プロセスが独立したアドレス空間を持てます。', 1, 63, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'プログラムの実行速度が必ず向上する', FALSE, 1),
    (gen_random_uuid(), q_id, '物理メモリより大きなアドレス空間を利用できる', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスクI/Oが不要になる', FALSE, 3),
    (gen_random_uuid(), q_id, 'メモリリークが完全に防止される', FALSE, 4);

  -- Q64: ラウンドロビン
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ラウンドロビンスケジューリングの説明として正しいものはどれか。', 'ラウンドロビンは各プロセスに等しいタイムスライス（量子）を割り当て、時間切れで次のプロセスに切り替える公平な方式です。', 1, 64, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '最も短い実行時間のプロセスを優先する', FALSE, 1),
    (gen_random_uuid(), q_id, '各プロセスに等しいタイムスライスを順番に割り当てる', TRUE, 2),
    (gen_random_uuid(), q_id, '優先度の高いプロセスが常に先に実行される', FALSE, 3),
    (gen_random_uuid(), q_id, '先に到着したプロセスが完了するまで実行される', FALSE, 4);

  -- Q65: コンテキストスイッチ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'コンテキストスイッチの説明として正しいものはどれか。', 'コンテキストスイッチは実行中のプロセスの状態を保存し、別のプロセスの状態を復元してCPUの実行を切り替える操作です。', 1, 65, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メモリの内容をディスクに書き出すこと', FALSE, 1),
    (gen_random_uuid(), q_id, 'プロセスの状態を保存し別のプロセスの状態を復元してCPUを切り替えること', TRUE, 2),
    (gen_random_uuid(), q_id, 'ユーザーモードからカーネルモードへの遷移のみを指す', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロセスを終了して新しいプロセスを起動すること', FALSE, 4);

  -- Q66: ページフォルト
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ページフォルトが発生する状況として正しいものはどれか。', 'ページフォルトはアクセスしようとしたページが物理メモリ上に存在せずディスクから読み込む必要がある場合に発生します。', 1, 66, 'medium', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPUキャッシュにデータが見つからなかった場合', FALSE, 1),
    (gen_random_uuid(), q_id, 'アクセスしたページが物理メモリ上に存在しない場合', TRUE, 2),
    (gen_random_uuid(), q_id, 'ファイルシステムのエラーが発生した場合', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロセスの優先度が変更された場合', FALSE, 4);

  -- ===== os - HARD (6) =====

  -- Q67: セマフォとミューテックス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'セマフォとミューテックスの違いとして正しいものはどれか。', 'ミューテックスはロックした本人のみが解放でき排他制御に特化しています。セマフォはカウンタ値を持ち複数のリソースへの同時アクセスを制御できます。', 1, 67, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'セマフォはバイナリ値しか取れない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ミューテックスはカウンタ値を持つ', FALSE, 2),
    (gen_random_uuid(), q_id, 'ミューテックスはロック取得者のみ解放でき、セマフォはカウンタで複数アクセスを制御する', TRUE, 3),
    (gen_random_uuid(), q_id, '両者に機能上の違いはない', FALSE, 4);

  -- Q68: メモリ断片化
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '外部断片化の説明として正しいものはどれか。', '外部断片化は空きメモリが小さなブロックに分散し、合計では十分な空きがあるのに連続した大きな領域が確保できない状態です。', 1, 68, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '確保されたメモリブロック内部に未使用部分が生じること', FALSE, 1),
    (gen_random_uuid(), q_id, '空きメモリが分散して大きな連続領域を確保できないこと', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスクの空き容量が不足していること', FALSE, 3),
    (gen_random_uuid(), q_id, 'CPUキャッシュのヒット率が低下すること', FALSE, 4);

  -- Q69: LRUページ置換
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'LRU（Least Recently Used）ページ置換アルゴリズムの説明として正しいものはどれか。', 'LRUは最も長い間アクセスされていないページを置換対象に選ぶアルゴリズムで、時間的局所性の原理に基づいています。', 1, 69, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '最も最近にアクセスされたページを置換する', FALSE, 1),
    (gen_random_uuid(), q_id, '最もアクセス回数が少ないページを置換する', FALSE, 2),
    (gen_random_uuid(), q_id, 'ランダムにページを選んで置換する', FALSE, 3),
    (gen_random_uuid(), q_id, '最も長い間アクセスされていないページを置換する', TRUE, 4);

  -- Q70: スラッシング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'スラッシングの説明として正しいものはどれか。', 'スラッシングはページフォルトが頻発しOSがページの入れ替えに多くの時間を費やし、実質的な処理がほとんど進まなくなる状態です。', 1, 70, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPUの温度が上がりすぎて性能が低下する現象', FALSE, 1),
    (gen_random_uuid(), q_id, 'ページフォルトが頻発しページ入れ替えにCPU時間が費やされ処理が進まない状態', TRUE, 2),
    (gen_random_uuid(), q_id, 'ディスクのシーク時間が増大する現象', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワークの帯域幅が飽和する状態', FALSE, 4);

  -- Q71: 内部断片化
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '内部断片化が発生する原因として正しいものはどれか。', '内部断片化は固定サイズのメモリブロックを割り当てた際に、実際に必要な量よりブロックが大きいために生じる未使用部分です。', 1, 71, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '可変サイズのメモリ割り当てを行うこと', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリの空き領域が分散すること', FALSE, 2),
    (gen_random_uuid(), q_id, '固定サイズのブロック割り当てで使用量よりブロックが大きいこと', TRUE, 3),
    (gen_random_uuid(), q_id, 'ディスクのセクタサイズが不均一であること', FALSE, 4);

  -- Q72: ベラディの異常
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ベラディの異常（Belady''s Anomaly）の説明として正しいものはどれか。', 'ベラディの異常はFIFOページ置換で、ページフレーム数を増やしたにもかかわらずページフォルト率が増加する現象です。LRUでは発生しません。', 1, 72, 'hard', 'os');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'LRUでページフレームを増やすとページフォルトが増える現象', FALSE, 1),
    (gen_random_uuid(), q_id, 'FIFOでページフレームを増やしてもページフォルトが増えることがある現象', TRUE, 2),
    (gen_random_uuid(), q_id, 'すべてのページ置換アルゴリズムで発生する現象', FALSE, 3),
    (gen_random_uuid(), q_id, 'ページサイズを大きくするとフォルト率が上がる現象', FALSE, 4);

  -- ===== network - EASY (6) =====

  -- Q73: OSI参照モデル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OSI参照モデルの第3層（ネットワーク層）で動作するプロトコルはどれか。', 'IPはネットワーク層（第3層）で動作し、パケットのルーティングとアドレッシングを担当します。', 1, 73, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'TCP', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTP', FALSE, 2),
    (gen_random_uuid(), q_id, 'IP', TRUE, 3),
    (gen_random_uuid(), q_id, 'Ethernet', FALSE, 4);

  -- Q74: TCP vs UDP
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'TCPとUDPの違いとして正しいものはどれか。', 'TCPはコネクション型で信頼性のあるデータ転送を保証しますが、UDPはコネクションレスで信頼性を保証しない代わりに高速です。', 1, 74, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UDPはコネクション型でTCPはコネクションレスである', FALSE, 1),
    (gen_random_uuid(), q_id, 'TCPはコネクション型で信頼性を保証しUDPはコネクションレスで高速である', TRUE, 2),
    (gen_random_uuid(), q_id, 'TCPもUDPも信頼性を保証する', FALSE, 3),
    (gen_random_uuid(), q_id, 'UDPはTCPより常に遅い', FALSE, 4);

  -- Q75: IPアドレス
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'IPv4アドレスのビット数はどれか。', 'IPv4アドレスは32ビットで構成され、約43億個のアドレスを表現できます。', 1, 75, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '16ビット', FALSE, 1),
    (gen_random_uuid(), q_id, '32ビット', TRUE, 2),
    (gen_random_uuid(), q_id, '64ビット', FALSE, 3),
    (gen_random_uuid(), q_id, '128ビット', FALSE, 4);

  -- Q76: HTTP基礎
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HTTPプロトコルの特徴として正しいものはどれか。', 'HTTPはステートレスなプロトコルで、各リクエストは独立しており前回のリクエストの情報を保持しません。', 1, 76, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ステートフルで接続状態を常に保持する', FALSE, 1),
    (gen_random_uuid(), q_id, 'バイナリプロトコルでテキストデータを扱えない', FALSE, 2),
    (gen_random_uuid(), q_id, 'UDPの上で動作する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ステートレスで各リクエストが独立している', TRUE, 4);

  -- Q77: ポート番号
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HTTPSが標準で使用するポート番号はどれか。', 'HTTPSはポート443を標準で使用します。HTTPは80、SSHは22、FTPは21です。', 1, 77, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '80', FALSE, 1),
    (gen_random_uuid(), q_id, '443', TRUE, 2),
    (gen_random_uuid(), q_id, '22', FALSE, 3),
    (gen_random_uuid(), q_id, '8080', FALSE, 4);

  -- Q78: OSI参照モデルの層数
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'OSI参照モデルは全部で何層あるか。', 'OSI参照モデルは物理層・データリンク層・ネットワーク層・トランスポート層・セッション層・プレゼンテーション層・アプリケーション層の7層です。', 1, 78, 'easy', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4層', FALSE, 1),
    (gen_random_uuid(), q_id, '5層', FALSE, 2),
    (gen_random_uuid(), q_id, '7層', TRUE, 3),
    (gen_random_uuid(), q_id, '8層', FALSE, 4);

  -- ===== network - MEDIUM (6) =====

  -- Q79: DNS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'DNSの主な役割として正しいものはどれか。', 'DNS（Domain Name System）はドメイン名をIPアドレスに変換する名前解決の仕組みです。', 1, 79, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン名をIPアドレスに変換する', TRUE, 1),
    (gen_random_uuid(), q_id, 'データを暗号化して転送する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パケットの経路を制御する', FALSE, 3),
    (gen_random_uuid(), q_id, 'メールの送受信を管理する', FALSE, 4);

  -- Q80: サブネットマスク
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'サブネットマスク255.255.255.0（/24）のネットワークで使用可能なホストアドレスの数はどれか。', '/24のサブネットでは8ビットがホスト部で、2^8-2=254のホストアドレスが使用可能です（ネットワークアドレスとブロードキャストアドレスを除く）。', 1, 80, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '256', FALSE, 1),
    (gen_random_uuid(), q_id, '255', FALSE, 2),
    (gen_random_uuid(), q_id, '254', TRUE, 3),
    (gen_random_uuid(), q_id, '252', FALSE, 4);

  -- Q81: TCP3ウェイハンドシェイク
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'TCP3ウェイハンドシェイクの正しい順序はどれか。', 'TCP接続はクライアントがSYNを送り、サーバーがSYN+ACKを返し、クライアントがACKを送る3ステップで確立されます。', 1, 81, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ACK → SYN → SYN+ACK', FALSE, 1),
    (gen_random_uuid(), q_id, 'SYN → ACK → SYN+ACK', FALSE, 2),
    (gen_random_uuid(), q_id, 'SYN+ACK → SYN → ACK', FALSE, 3),
    (gen_random_uuid(), q_id, 'SYN → SYN+ACK → ACK', TRUE, 4);

  -- Q82: HTTPS/TLS
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HTTPSにおけるTLSの役割として正しいものはどれか。', 'TLSは通信の暗号化、サーバー認証、データの完全性保証を提供し、HTTP通信を安全にします。', 1, 82, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン名をIPアドレスに変換する', FALSE, 1),
    (gen_random_uuid(), q_id, '通信の暗号化とサーバー認証を行う', TRUE, 2),
    (gen_random_uuid(), q_id, 'パケットのルーティングを最適化する', FALSE, 3),
    (gen_random_uuid(), q_id, 'HTTPヘッダーを圧縮して転送速度を向上させる', FALSE, 4);

  -- Q83: ルーティング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ルーティングテーブルの役割として正しいものはどれか。', 'ルーティングテーブルはパケットの宛先IPアドレスに基づいて、次にどのルーター（ネクストホップ）に転送すべきかを決定するための情報を保持します。', 1, 83, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DNSの名前解決結果をキャッシュする', FALSE, 1),
    (gen_random_uuid(), q_id, 'ファイアウォールのルールを管理する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パケットの宛先に基づき転送先を決定する情報を保持する', TRUE, 3),
    (gen_random_uuid(), q_id, 'ネットワークの帯域幅を監視する', FALSE, 4);

  -- Q84: ARPプロトコル
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ARP（Address Resolution Protocol）の役割として正しいものはどれか。', 'ARPはIPアドレスから対応するMACアドレスを解決するプロトコルで、同一ネットワーク内の通信に使われます。', 1, 84, 'medium', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ドメイン名からIPアドレスを解決する', FALSE, 1),
    (gen_random_uuid(), q_id, 'IPアドレスからMACアドレスを解決する', TRUE, 2),
    (gen_random_uuid(), q_id, 'MACアドレスからポート番号を解決する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ポート番号からプロセスIDを解決する', FALSE, 4);

  -- ===== network - HARD (6) =====

  -- Q85: ロードバランシング
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'L7ロードバランサーがL4ロードバランサーと異なる点として正しいものはどれか。', 'L7ロードバランサーはアプリケーション層で動作し、HTTPヘッダーやURLパスなどの内容に基づいてルーティングできます。L4はトランスポート層でIPとポートに基づきます。', 1, 85, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IPアドレスとポート番号のみに基づいて振り分ける', FALSE, 1),
    (gen_random_uuid(), q_id, 'HTTPヘッダーやURLパスなどアプリケーション層の情報で振り分けられる', TRUE, 2),
    (gen_random_uuid(), q_id, 'MACアドレスに基づいて振り分ける', FALSE, 3),
    (gen_random_uuid(), q_id, 'L4より処理速度が常に速い', FALSE, 4);

  -- Q86: NAT
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'NAT（Network Address Translation）の主な目的として正しいものはどれか。', 'NATはプライベートIPアドレスをグローバルIPアドレスに変換することで、限られたIPv4アドレスを共有し、内部ネットワークを外部から隠蔽します。', 1, 86, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの暗号化を行う', FALSE, 1),
    (gen_random_uuid(), q_id, 'ドメイン名を解決する', FALSE, 2),
    (gen_random_uuid(), q_id, 'プライベートIPをグローバルIPに変換しアドレスを共有する', TRUE, 3),
    (gen_random_uuid(), q_id, 'パケットの順序制御を行う', FALSE, 4);

  -- Q87: WebSocket
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'WebSocketの特徴として正しいものはどれか。', 'WebSocketはHTTPのアップグレード機構で接続を確立した後、全二重通信（双方向同時通信）を低オーバーヘッドで行えます。', 1, 87, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエスト・レスポンス型の半二重通信のみ行える', FALSE, 1),
    (gen_random_uuid(), q_id, 'UDPの上で動作する軽量プロトコルである', FALSE, 2),
    (gen_random_uuid(), q_id, '全二重通信が可能でサーバーからクライアントへもリアルタイムに送信できる', TRUE, 3),
    (gen_random_uuid(), q_id, '毎回のメッセージにHTTPヘッダーが付与される', FALSE, 4);

  -- Q88: CDN
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'CDN（Content Delivery Network）の主な利点として正しいものはどれか。', 'CDNは世界各地に分散したエッジサーバーにコンテンツをキャッシュし、ユーザーに最も近いサーバーから配信することで遅延を低減します。', 1, 88, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データベースのクエリを最適化する', FALSE, 1),
    (gen_random_uuid(), q_id, 'サーバーサイドのコード実行を高速化する', FALSE, 2),
    (gen_random_uuid(), q_id, 'SSL証明書の発行を自動化する', FALSE, 3),
    (gen_random_uuid(), q_id, '地理的に分散したサーバーからコンテンツを配信し遅延を低減する', TRUE, 4);

  -- Q89: REST vs GraphQL
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'GraphQLがRESTと比較して優れている点として正しいものはどれか。', 'GraphQLではクライアントが必要なデータのみを指定して取得でき、REST APIで起こりがちなオーバーフェッチ（不要データの取得）を防げます。', 1, 89, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キャッシュが容易でパフォーマンスが常に良い', FALSE, 1),
    (gen_random_uuid(), q_id, 'クライアントが必要なデータのみを指定して取得できオーバーフェッチを防げる', TRUE, 2),
    (gen_random_uuid(), q_id, 'HTTPメソッドの使い分けが明確で直感的である', FALSE, 3),
    (gen_random_uuid(), q_id, 'サーバー側の実装が常にシンプルになる', FALSE, 4);

  -- Q90: ファイアウォール
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'ステートフルインスペクション型ファイアウォールの特徴として正しいものはどれか。', 'ステートフルインスペクションは通信の状態（コネクションの確立状況など）を追跡し、その文脈に基づいてパケットの許可・拒否を判断します。', 1, 90, 'hard', 'network');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'パケットのヘッダー情報のみで判断する', FALSE, 1),
    (gen_random_uuid(), q_id, 'アプリケーション層のデータ内容を解析する', FALSE, 2),
    (gen_random_uuid(), q_id, '通信の状態を追跡しコネクションの文脈に基づいて判断する', TRUE, 3),
    (gen_random_uuid(), q_id, 'すべてのパケットを暗号化して転送する', FALSE, 4);

END $$;

-- ============================================
-- Quiz 4: 開発実務能力ランク試験 (90 questions)
-- Categories: java_core, spring_boot, javascript_core, react, sql
-- Java path: java_core + spring_boot + sql
-- JavaScript path: javascript_core + react + sql
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== java_core - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのプリミティブ型として正しいものはどれか。', 'Javaのプリミティブ型にはint、double、boolean、charなど8種類があり、Stringはプリミティブ型ではなく参照型である。', 1, 1, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'String', FALSE, 1),
    (gen_random_uuid(), q_id, 'int', TRUE, 2),
    (gen_random_uuid(), q_id, 'Integer', FALSE, 3),
    (gen_random_uuid(), q_id, 'Object', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaのStringクラスで文字列の長さを取得するメソッドはどれか。', 'String.length()は文字列の文字数を返すメソッドである。size()はCollectionのメソッドであり、Stringには存在しない。', 1, 2, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'size()', FALSE, 1),
    (gen_random_uuid(), q_id, 'count()', FALSE, 2),
    (gen_random_uuid(), q_id, 'length()', TRUE, 3),
    (gen_random_uuid(), q_id, 'getLength()', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaで配列を宣言する正しい構文はどれか。', 'Javaでは「int[] arr = new int[5];」のように型名の後に[]を付けて配列を宣言する。', 1, 3, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'int arr = new int[5];', FALSE, 1),
    (gen_random_uuid(), q_id, 'int[] arr = new int[5];', TRUE, 2),
    (gen_random_uuid(), q_id, 'array<int> arr = new array(5);', FALSE, 3),
    (gen_random_uuid(), q_id, 'int arr[] = new int[];', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのswitch文で各caseの最後に記述すべきキーワードはどれか。', 'break文を記述しないとフォールスルーが発生し、次のcaseも実行されてしまう。意図しない動作を防ぐためにbreakを記述する。', 1, 4, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'continue', FALSE, 1),
    (gen_random_uuid(), q_id, 'return', FALSE, 2),
    (gen_random_uuid(), q_id, 'exit', FALSE, 3),
    (gen_random_uuid(), q_id, 'break', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのfor文「for (int i = 0; i < 5; i++)」で、ループは何回実行されるか。', 'iは0から始まり、i < 5の条件が満たされる間ループするため、0,1,2,3,4の計5回実行される。', 1, 5, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '4回', FALSE, 1),
    (gen_random_uuid(), q_id, '5回', TRUE, 2),
    (gen_random_uuid(), q_id, '6回', FALSE, 3),
    (gen_random_uuid(), q_id, '無限ループ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaでクラスからオブジェクトを生成するキーワードはどれか。', 'newキーワードはコンストラクタを呼び出してヒープ領域にオブジェクトを生成する。', 1, 6, 'easy', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'create', FALSE, 1),
    (gen_random_uuid(), q_id, 'instance', FALSE, 2),
    (gen_random_uuid(), q_id, 'new', TRUE, 3),
    (gen_random_uuid(), q_id, 'init', FALSE, 4);

  -- ===== java_core - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaの継承でサブクラスが親クラスのメソッドを再定義することを何と呼ぶか。', 'オーバーライドは親クラスのメソッドをサブクラスで再定義することである。オーバーロードは同名メソッドを引数違いで複数定義することを指す。', 1, 7, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オーバーロード', FALSE, 1),
    (gen_random_uuid(), q_id, 'オーバーライド', TRUE, 2),
    (gen_random_uuid(), q_id, 'カプセル化', FALSE, 3),
    (gen_random_uuid(), q_id, 'アップキャスト', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのインターフェースについて正しい説明はどれか。', 'インターフェースはメソッドのシグネチャを定義し、実装クラスがそのメソッドを具体的に実装する。Java 8以降はdefaultメソッドも定義可能。', 1, 8, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インスタンスを直接生成できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'フィールドに可変の状態を持つことができる', FALSE, 2),
    (gen_random_uuid(), q_id, '1つのクラスは1つのインターフェースしか実装できない', FALSE, 3),
    (gen_random_uuid(), q_id, 'メソッドのシグネチャを定義し、実装クラスで具体化する', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのtry-catch文でfinallyブロックの特徴として正しいものはどれか。', 'finallyブロックは例外の発生有無にかかわらず必ず実行される。リソースの解放処理などに使用する。', 1, 9, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '例外が発生した場合のみ実行される', FALSE, 1),
    (gen_random_uuid(), q_id, '例外が発生しなかった場合のみ実行される', FALSE, 2),
    (gen_random_uuid(), q_id, '例外の発生有無にかかわらず必ず実行される', TRUE, 3),
    (gen_random_uuid(), q_id, 'catchブロックで例外を再スローした場合は実行されない', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaのArrayListとLinkedListの違いとして正しいものはどれか。', 'ArrayListは内部的に配列を使用するためランダムアクセスが高速だが、中間への挿入・削除は遅い。LinkedListはその逆の特性を持つ。', 1, 10, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ArrayListはスレッドセーフだがLinkedListはそうではない', FALSE, 1),
    (gen_random_uuid(), q_id, 'ArrayListはランダムアクセスが高速で、LinkedListは挿入・削除が高速', TRUE, 2),
    (gen_random_uuid(), q_id, 'LinkedListはイミュータブルだがArrayListはミュータブル', FALSE, 3),
    (gen_random_uuid(), q_id, 'ArrayListは重複を許さないがLinkedListは許す', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaのHashMapでキーにnullを使用した場合の動作はどれか。', 'HashMapはキーとしてnullを1つだけ許容する。一方、Hashtableはキーにnullを許容しない。', 1, 11, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'NullPointerExceptionが発生する', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンパイルエラーになる', FALSE, 2),
    (gen_random_uuid(), q_id, 'nullキーを1つだけ許容する', TRUE, 3),
    (gen_random_uuid(), q_id, 'nullキーを複数格納できる', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのジェネリクスを使う主な利点はどれか。', 'ジェネリクスによりコンパイル時に型安全性が保証され、不要なキャストを排除できる。実行時のClassCastExceptionを防止する効果がある。', 1, 12, 'medium', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '実行速度が大幅に向上する', FALSE, 1),
    (gen_random_uuid(), q_id, 'メモリ使用量が削減される', FALSE, 2),
    (gen_random_uuid(), q_id, 'マルチスレッド処理が安全になる', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンパイル時に型安全性が保証される', TRUE, 4);

  -- ===== java_core - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Java Stream APIのcollect(Collectors.groupingBy(...))の戻り値の型はどれか。', 'groupingByはストリームの要素を指定した条件でグループ化し、Map<K, List<V>>を返す。', 1, 13, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'List<Map<K, V>>', FALSE, 1),
    (gen_random_uuid(), q_id, 'Set<K>', FALSE, 2),
    (gen_random_uuid(), q_id, 'Map<K, List<V>>', TRUE, 3),
    (gen_random_uuid(), q_id, 'Optional<Map<K, V>>', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのラムダ式で外部変数を参照する場合、その変数に求められる条件はどれか。', 'ラムダ式からアクセスするローカル変数はfinalまたは実質的にfinal(値が変更されない)でなければならない。', 1, 14, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'static修飾子が付いていること', FALSE, 1),
    (gen_random_uuid(), q_id, 'finalまたは実質的にfinalであること', TRUE, 2),
    (gen_random_uuid(), q_id, 'volatile修飾子が付いていること', FALSE, 3),
    (gen_random_uuid(), q_id, 'publicアクセス修飾子であること', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのsynchronizedキーワードの説明として正しいものはどれか。', 'synchronizedはモニタロックを取得して排他制御を行い、同時に1つのスレッドだけがそのブロックを実行できるようにする。', 1, 15, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メソッドの実行を非同期にする', FALSE, 1),
    (gen_random_uuid(), q_id, '複数スレッドの同時実行を許可する', FALSE, 2),
    (gen_random_uuid(), q_id, 'スレッド間でデータをコピーする', FALSE, 3),
    (gen_random_uuid(), q_id, 'モニタロックにより排他制御を行う', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JVMのガベージコレクションについて正しい説明はどれか。', 'GCはヒープ領域の不要なオブジェクトを自動的に回収する。スタック領域はメソッド終了時に自動解放されるためGCの対象外。', 1, 16, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ヒープ領域の不要なオブジェクトを自動回収する', TRUE, 1),
    (gen_random_uuid(), q_id, 'スタック領域のローカル変数を定期的に削除する', FALSE, 2),
    (gen_random_uuid(), q_id, '開発者がSystem.gc()で確実に実行できる', FALSE, 3),
    (gen_random_uuid(), q_id, 'メソッド領域のクラス定義情報をクリアする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GoFデザインパターンのSingletonパターンの目的はどれか。', 'Singletonパターンはクラスのインスタンスが1つだけ存在することを保証し、そのグローバルなアクセスポイントを提供する。', 1, 17, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オブジェクトの生成手順を段階的に制御する', FALSE, 1),
    (gen_random_uuid(), q_id, 'クラスのインスタンスを1つだけに制限する', TRUE, 2),
    (gen_random_uuid(), q_id, 'オブジェクト間の依存関係を疎結合にする', FALSE, 3),
    (gen_random_uuid(), q_id, 'アルゴリズムの切り替えを容易にする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Javaのvolatileキーワードの効果として正しいものはどれか。', 'volatileはメインメモリから直接読み書きすることを保証し、スレッド間での可視性を確保する。ただし原子性は保証しない。', 1, 18, 'hard', 'java_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '変数への書き込みを原子的操作にする', FALSE, 1),
    (gen_random_uuid(), q_id, '変数をイミュータブルにする', FALSE, 2),
    (gen_random_uuid(), q_id, 'スレッド間での変数の可視性を保証する', TRUE, 3),
    (gen_random_uuid(), q_id, '変数へのアクセスにロックを取得する', FALSE, 4);

  -- ===== spring_boot - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootで@RestControllerアノテーションの役割はどれか。', '@RestControllerは@Controllerと@ResponseBodyを組み合わせたもので、メソッドの戻り値をそのままHTTPレスポンスボディとして返す。', 1, 19, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTMLテンプレートをレンダリングして返す', FALSE, 1),
    (gen_random_uuid(), q_id, 'レスポンスボディにデータを直接返すコントローラを定義する', TRUE, 2),
    (gen_random_uuid(), q_id, 'データベース接続を管理するBeanを定義する', FALSE, 3),
    (gen_random_uuid(), q_id, 'セキュリティフィルタを適用するコントローラを定義する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@RequestMappingアノテーションの用途はどれか。', '@RequestMappingはHTTPリクエストのURLパスとHTTPメソッドをコントローラのメソッドにマッピングする。', 1, 20, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データベーステーブルとエンティティをマッピングする', FALSE, 1),
    (gen_random_uuid(), q_id, 'オブジェクト間の依存関係をマッピングする', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTPリクエストのURLをコントローラメソッドにマッピングする', TRUE, 3),
    (gen_random_uuid(), q_id, 'JSONフィールドとJavaフィールドをマッピングする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@Autowiredアノテーションの役割はどれか。', '@Autowiredはスプリングコンテナに登録されたBeanを自動的に注入(DI)する。型に基づいて適切なBeanを検索して注入する。', 1, 21, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラスをSpring Beanとして登録する', FALSE, 1),
    (gen_random_uuid(), q_id, 'メソッドの戻り値をキャッシュする', FALSE, 2),
    (gen_random_uuid(), q_id, 'トランザクション管理を有効にする', FALSE, 3),
    (gen_random_uuid(), q_id, '依存するBeanを自動的に注入する', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootのapplication.propertiesファイルの役割はどれか。', 'application.propertiesはサーバーポート、DB接続情報、ログレベルなどアプリケーションの各種設定を定義するファイルである。', 1, 22, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'アプリケーションの各種設定を定義する', TRUE, 1),
    (gen_random_uuid(), q_id, 'Bean定義をXML形式で記述する', FALSE, 2),
    (gen_random_uuid(), q_id, 'テストケースの実行順序を指定する', FALSE, 3),
    (gen_random_uuid(), q_id, 'ビルドの依存関係を管理する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'DI(依存性の注入)の説明として正しいものはどれか。', 'DIはオブジェクトが必要とする依存オブジェクトを外部から注入する設計パターンで、疎結合を実現する。', 1, 23, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クラス内部で直接依存オブジェクトをnewで生成する', FALSE, 1),
    (gen_random_uuid(), q_id, '静的メソッドのみを使って処理を実行する', FALSE, 2),
    (gen_random_uuid(), q_id, '外部から依存オブジェクトを注入して疎結合を実現する', TRUE, 3),
    (gen_random_uuid(), q_id, 'グローバル変数で全クラスのインスタンスを共有する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootでサーバーのポート番号を変更する設定はどれか。', 'application.propertiesでserver.portを設定することでデフォルトの8080から別のポートに変更できる。', 1, 24, 'easy', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'spring.port=9090', FALSE, 1),
    (gen_random_uuid(), q_id, 'app.server.port=9090', FALSE, 2),
    (gen_random_uuid(), q_id, 'server.port=9090', TRUE, 3),
    (gen_random_uuid(), q_id, 'http.port=9090', FALSE, 4);

  -- ===== spring_boot - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@Service、@Repository、@Componentの共通点はどれか。', 'これらはすべて@Componentの特殊化であり、クラスをSpring Beanとして登録する。@Serviceはビジネスロジック層、@Repositoryはデータアクセス層を示す。', 1, 25, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すべてクラスをSpring Beanとして登録する', TRUE, 1),
    (gen_random_uuid(), q_id, 'すべてHTTPリクエストを処理できる', FALSE, 2),
    (gen_random_uuid(), q_id, 'すべてトランザクション管理機能を持つ', FALSE, 3),
    (gen_random_uuid(), q_id, 'すべてデータベースアクセス機能を提供する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Beanのデフォルトスコープはどれか。', 'Spring Beanのデフォルトスコープはsingletonで、アプリケーション全体で1つのインスタンスのみ生成される。', 1, 26, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'prototype', FALSE, 1),
    (gen_random_uuid(), q_id, 'request', FALSE, 2),
    (gen_random_uuid(), q_id, 'singleton', TRUE, 3),
    (gen_random_uuid(), q_id, 'session', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootの@Transactionalアノテーションの効果はどれか。', '@Transactionalを付けたメソッドはトランザクション内で実行され、例外発生時に自動的にロールバックされる。', 1, 27, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メソッドの実行を非同期にする', FALSE, 1),
    (gen_random_uuid(), q_id, 'メソッドの実行結果をキャッシュする', FALSE, 2),
    (gen_random_uuid(), q_id, 'メソッドをトランザクション内で実行し例外時にロールバックする', TRUE, 3),
    (gen_random_uuid(), q_id, 'メソッドへのアクセスを認証済みユーザーに制限する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Securityでパスワードを安全に保存するための推奨方法はどれか。', 'Spring SecurityではBCryptPasswordEncoderなどでパスワードをハッシュ化して保存する。平文保存は重大なセキュリティリスクとなる。', 1, 28, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '平文のまま保存する', FALSE, 1),
    (gen_random_uuid(), q_id, 'Base64でエンコードして保存する', FALSE, 2),
    (gen_random_uuid(), q_id, 'AESで暗号化して保存する', FALSE, 3),
    (gen_random_uuid(), q_id, 'BCryptなどでハッシュ化して保存する', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'RESTful API設計でリソース「ユーザー一覧取得」の適切なエンドポイントはどれか。', 'RESTful設計ではリソース名を複数形の名詞で表し、HTTPメソッドで操作を区別する。GET /usersがユーザー一覧取得の標準的な設計。', 1, 29, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'POST /getUsers', FALSE, 1),
    (gen_random_uuid(), q_id, 'GET /user/list', FALSE, 2),
    (gen_random_uuid(), q_id, 'GET /users', TRUE, 3),
    (gen_random_uuid(), q_id, 'GET /fetchAllUsers', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Bootで@PathVariableの用途はどれか。', '@PathVariableはURLパスの一部を変数として受け取る。例えば/users/{id}の{id}をメソッド引数にバインドする。', 1, 30, 'medium', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエストボディのJSONをオブジェクトにバインドする', FALSE, 1),
    (gen_random_uuid(), q_id, 'URLパスの一部を変数として受け取る', TRUE, 2),
    (gen_random_uuid(), q_id, 'クエリパラメータを変数として受け取る', FALSE, 3),
    (gen_random_uuid(), q_id, 'HTTPヘッダの値を変数として受け取る', FALSE, 4);

  -- ===== spring_boot - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring AOPにおける「Advice」の説明として正しいものはどれか。', 'Adviceは特定のJoinPointで実行される処理のこと。Before、After、Aroundなどの種類があり、横断的関心事を分離して実装する。', 1, 31, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'AOPを適用する対象クラスの条件式', FALSE, 1),
    (gen_random_uuid(), q_id, '特定のJoinPointで実行される横断的処理', TRUE, 2),
    (gen_random_uuid(), q_id, 'AOPプロキシの生成戦略の設定', FALSE, 3),
    (gen_random_uuid(), q_id, 'アスペクトの適用順序を制御する仕組み', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Springでカスタムバリデーションを作成する際に実装するインターフェースはどれか。', 'ConstraintValidatorインターフェースを実装し、isValidメソッドで検証ロジックを記述する。対応するアノテーションも定義する必要がある。', 1, 32, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Validator', FALSE, 1),
    (gen_random_uuid(), q_id, 'ValidationHandler', FALSE, 2),
    (gen_random_uuid(), q_id, 'ConstraintValidator', TRUE, 3),
    (gen_random_uuid(), q_id, 'FieldValidator', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JPA/HibernateのN+1問題の説明として正しいものはどれか。', 'N+1問題は親エンティティ取得に1回、関連する子エンティティの取得にN回のクエリが発行される問題。FETCH JOINやEntityGraphで解決できる。', 1, 33, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1つのクエリでN+1件のレコードを取得してメモリ不足になる問題', FALSE, 1),
    (gen_random_uuid(), q_id, 'トランザクションがN+1回ネストしてデッドロックが発生する問題', FALSE, 2),
    (gen_random_uuid(), q_id, '親エンティティ1回+子エンティティN回のクエリが発行される問題', TRUE, 3),
    (gen_random_uuid(), q_id, 'N+1個のテーブルをJOINしてパフォーマンスが低下する問題', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Batchの基本構成要素として正しい組み合わせはどれか。', 'Spring BatchはJob→Step→(Reader/Processor/Writer)の構造で、大量データのバッチ処理を標準化されたパターンで実装する。', 1, 34, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Task → Worker → Result', FALSE, 1),
    (gen_random_uuid(), q_id, 'Pipeline → Stage → Filter', FALSE, 2),
    (gen_random_uuid(), q_id, 'Job → Step → Reader/Processor/Writer', TRUE, 3),
    (gen_random_uuid(), q_id, 'Queue → Consumer → Handler', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'マイクロサービスアーキテクチャでサービス間通信の障害対策として使われるパターンはどれか。', 'サーキットブレーカーパターンは障害が発生したサービスへの呼び出しを遮断し、障害の連鎖を防止する。Resilience4jなどで実装できる。', 1, 35, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーキットブレーカーパターン', TRUE, 1),
    (gen_random_uuid(), q_id, 'ファクトリパターン', FALSE, 2),
    (gen_random_uuid(), q_id, 'オブザーバーパターン', FALSE, 3),
    (gen_random_uuid(), q_id, 'デコレータパターン', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring AOPのPointcut式「execution(* com.example.service.*.*(..))」の意味はどれか。', 'この式はcom.example.serviceパッケージの全クラスの全メソッド(任意の引数・戻り値)にマッチする。', 1, 36, 'hard', 'spring_boot');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'com.example.serviceパッケージのpublicメソッドのみ対象', FALSE, 1),
    (gen_random_uuid(), q_id, 'com.example.serviceパッケージの全クラスの全メソッドが対象', TRUE, 2),
    (gen_random_uuid(), q_id, 'com.example.serviceとそのサブパッケージの全メソッドが対象', FALSE, 3),
    (gen_random_uuid(), q_id, 'com.example.serviceパッケージの引数なしメソッドのみ対象', FALSE, 4);

  -- ===== javascript_core - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのlet、const、varの中で再代入が不可能なのはどれか。', 'constは宣言時に初期化が必須で、再代入ができない。ただしオブジェクトや配列の中身の変更は可能である。', 1, 37, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'var', FALSE, 1),
    (gen_random_uuid(), q_id, 'let', FALSE, 2),
    (gen_random_uuid(), q_id, 'const', TRUE, 3),
    (gen_random_uuid(), q_id, 'letとconst両方', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptで typeof null の結果はどれか。', 'typeof nullは"object"を返す。これはJavaScriptの初期実装からのバグだが、後方互換性のため修正されていない。', 1, 38, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"null"', FALSE, 1),
    (gen_random_uuid(), q_id, '"undefined"', FALSE, 2),
    (gen_random_uuid(), q_id, '"object"', TRUE, 3),
    (gen_random_uuid(), q_id, '"boolean"', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのアロー関数の正しい構文はどれか。', 'アロー関数は(引数) => { 処理 }の形式で記述する。ES6で導入され、従来のfunction式より簡潔に書ける。', 1, 39, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'function => (x) { return x; }', FALSE, 1),
    (gen_random_uuid(), q_id, '(x) -> { return x; }', FALSE, 2),
    (gen_random_uuid(), q_id, '(x) => { return x; }', TRUE, 3),
    (gen_random_uuid(), q_id, 'x --> { return x; }', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptの配列メソッドmap()の説明として正しいものはどれか。', 'map()は各要素にコールバック関数を適用し、その結果から新しい配列を生成して返す。元の配列は変更しない。', 1, 40, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '条件に合う要素だけを抽出した新しい配列を返す', FALSE, 1),
    (gen_random_uuid(), q_id, '各要素にコールバックを適用した新しい配列を返す', TRUE, 2),
    (gen_random_uuid(), q_id, '配列の全要素を1つの値に集約して返す', FALSE, 3),
    (gen_random_uuid(), q_id, '配列の末尾に新しい要素を追加する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのテンプレートリテラルで変数を埋め込む構文はどれか。', 'テンプレートリテラルはバッククォート(`)で囲み、${変数名}で変数を埋め込む。文字列連結より可読性が高い。', 1, 41, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '"Hello #{name}"', FALSE, 1),
    (gen_random_uuid(), q_id, '''Hello ${name}''', FALSE, 2),
    (gen_random_uuid(), q_id, '`Hello ${name}`', TRUE, 3),
    (gen_random_uuid(), q_id, '"Hello {{name}}"', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptの配列メソッドfilter()の説明として正しいものはどれか。', 'filter()はコールバック関数でtrueを返す要素だけを集めた新しい配列を返す。元の配列は変更されない。', 1, 42, 'easy', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '配列の最初の要素を取り出す', FALSE, 1),
    (gen_random_uuid(), q_id, '配列の要素を昇順にソートする', FALSE, 2),
    (gen_random_uuid(), q_id, '各要素を変換した新しい配列を返す', FALSE, 3),
    (gen_random_uuid(), q_id, '条件を満たす要素だけの新しい配列を返す', TRUE, 4);

  -- ===== javascript_core - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのクロージャの説明として正しいものはどれか。', 'クロージャは関数とその関数が宣言されたレキシカルスコープの組み合わせで、外部関数が終了した後も外部変数にアクセスできる。', 1, 43, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '非同期処理を同期的に実行する仕組み', FALSE, 1),
    (gen_random_uuid(), q_id, '関数が定義されたスコープの変数を保持し続ける仕組み', TRUE, 2),
    (gen_random_uuid(), q_id, 'オブジェクトのプロパティを外部からアクセス不能にする仕組み', FALSE, 3),
    (gen_random_uuid(), q_id, 'グローバル変数を自動的にガベージコレクションする仕組み', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのPromiseの3つの状態として正しいものはどれか。', 'Promiseはpending(保留)、fulfilled(成功)、rejected(失敗)の3つの状態を持ち、一度settledになると変更されない。', 1, 44, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'start、running、complete', FALSE, 1),
    (gen_random_uuid(), q_id, 'pending、fulfilled、rejected', TRUE, 2),
    (gen_random_uuid(), q_id, 'waiting、resolved、failed', FALSE, 3),
    (gen_random_uuid(), q_id, 'init、success、error', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのasync/awaitについて正しい説明はどれか。', 'awaitはasync関数内でPromiseの解決を待ち、コードを同期的に見えるように記述できる。async関数は常にPromiseを返す。', 1, 45, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'awaitはどの関数内でも使用できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'async関数は常にundefinedを返す', FALSE, 2),
    (gen_random_uuid(), q_id, 'awaitはスレッドをブロックして待機する', FALSE, 3),
    (gen_random_uuid(), q_id, 'async関数は常にPromiseを返し、awaitでPromiseの解決を待つ', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptの分割代入で正しい構文はどれか。', '分割代入はオブジェクトや配列から値を取り出して変数に代入する構文。オブジェクトは{}、配列は[]を使う。', 1, 46, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'const (a, b) = [1, 2];', FALSE, 1),
    (gen_random_uuid(), q_id, 'const {a, b} = {a: 1, b: 2};', TRUE, 2),
    (gen_random_uuid(), q_id, 'const <a, b> = {a: 1, b: 2};', FALSE, 3),
    (gen_random_uuid(), q_id, 'const [a, b] = {a: 1, b: 2};', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのスプレッド演算子(...)の使い方として正しいものはどれか。', 'スプレッド演算子は配列やオブジェクトの要素を展開する。配列の結合やオブジェクトのシャローコピーに使用される。', 1, 47, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'const merged = [...arr1, ...arr2];', TRUE, 1),
    (gen_random_uuid(), q_id, 'const merged = [..arr1, ..arr2];', FALSE, 2),
    (gen_random_uuid(), q_id, 'const merged = [*arr1, *arr2];', FALSE, 3),
    (gen_random_uuid(), q_id, 'const merged = [&arr1, &arr2];', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのプロトタイプチェーンの説明として正しいものはどれか。', 'プロトタイプチェーンはオブジェクトが自身にないプロパティを参照した際、__proto__を辿って親オブジェクトを順に検索する仕組みである。', 1, 48, 'medium', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数の呼び出し順序を管理するスタック構造', FALSE, 1),
    (gen_random_uuid(), q_id, '非同期処理のコールバックを管理するキュー構造', FALSE, 2),
    (gen_random_uuid(), q_id, 'オブジェクトのプロパティ検索を親オブジェクトに委譲する仕組み', TRUE, 3),
    (gen_random_uuid(), q_id, 'DOMノードの親子関係を表現するツリー構造', FALSE, 4);

  -- ===== javascript_core - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのイベントループでマイクロタスクに分類されるものはどれか。', 'Promise.then/catch/finallyやMutationObserverのコールバックはマイクロタスクに分類される。setTimeoutやsetIntervalはマクロタスク。', 1, 49, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'setTimeout', FALSE, 1),
    (gen_random_uuid(), q_id, 'setInterval', FALSE, 2),
    (gen_random_uuid(), q_id, 'requestAnimationFrame', FALSE, 3),
    (gen_random_uuid(), q_id, 'Promise.then', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのWeakMapの特徴として正しいものはどれか。', 'WeakMapのキーはオブジェクトのみで、キーへの参照が弱参照のためガベージコレクションの対象になる。列挙やサイズ取得はできない。', 1, 50, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'キーに文字列と数値のみ使用できる', FALSE, 1),
    (gen_random_uuid(), q_id, 'キーはオブジェクトのみで弱参照のためGC対象になる', TRUE, 2),
    (gen_random_uuid(), q_id, 'for...ofで列挙可能である', FALSE, 3),
    (gen_random_uuid(), q_id, 'sizeプロパティで要素数を取得できる', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptのProxyオブジェクトで実現できることはどれか。', 'Proxyはオブジェクトの基本操作(get、set、deleteなど)をインターセプトしてカスタムな動作を定義できる。バリデーションやログ出力に活用される。', 1, 51, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'オブジェクトのプロパティアクセスをインターセプトしてカスタム処理を行う', TRUE, 1),
    (gen_random_uuid(), q_id, 'オブジェクトのメモリ使用量を監視する', FALSE, 2),
    (gen_random_uuid(), q_id, 'オブジェクトをイミュータブルに変換する', FALSE, 3),
    (gen_random_uuid(), q_id, 'オブジェクトの型を動的に変換する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ESModules(ESM)とCommonJS(CJS)の違いとして正しいものはどれか。', 'ESMはimport/exportを使い静的解析が可能。CJSはrequire/module.exportsを使い動的にロードする。ESMはTree Shakingに対応しやすい。', 1, 52, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ESMはrequireを使い、CJSはimportを使う', FALSE, 1),
    (gen_random_uuid(), q_id, 'ESMはNode.js専用で、CJSはブラウザ専用', FALSE, 2),
    (gen_random_uuid(), q_id, 'ESMは静的解析が可能で、CJSは動的にロードする', TRUE, 3),
    (gen_random_uuid(), q_id, 'ESMとCJSは完全に同じ仕様で互換性がある', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'TypeScriptのユニオン型「string | number」の説明として正しいものはどれか。', 'ユニオン型は複数の型のいずれかを取りうることを示す。型ガードを使って実行時に型を絞り込むことができる。', 1, 53, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'stringとnumberの両方のプロパティを持つ型', FALSE, 1),
    (gen_random_uuid(), q_id, 'stringかnumberのいずれかの値を取りうる型', TRUE, 2),
    (gen_random_uuid(), q_id, 'stringをnumberに変換する型', FALSE, 3),
    (gen_random_uuid(), q_id, 'stringとnumberを結合した新しい型', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JavaScriptで以下のコード実行順序として正しいものはどれか。console.log("A"); setTimeout(() => console.log("B"), 0); Promise.resolve().then(() => console.log("C"));', 'A→C→Bの順。同期コード(A)が先に実行され、マイクロタスク(Promise.then: C)がマクロタスク(setTimeout: B)より優先される。', 1, 54, 'hard', 'javascript_core');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'A → B → C', FALSE, 1),
    (gen_random_uuid(), q_id, 'A → C → B', TRUE, 2),
    (gen_random_uuid(), q_id, 'C → A → B', FALSE, 3),
    (gen_random_uuid(), q_id, 'A → B → C が同時', FALSE, 4);

  -- ===== react - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのJSXで正しいものはどれか。', 'JSXではHTMLのclass属性はclassNameと書く。JavaScriptの予約語classと衝突するためである。', 1, 55, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '<div class="container">...</div>', FALSE, 1),
    (gen_random_uuid(), q_id, '<div className="container">...</div>', TRUE, 2),
    (gen_random_uuid(), q_id, '<div cssClass="container">...</div>', FALSE, 3),
    (gen_random_uuid(), q_id, '<div style-class="container">...</div>', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseStateフックの説明として正しいものはどれか。', 'useStateはコンポーネントに状態変数を追加するフック。現在の状態値と更新関数のペアを返す。', 1, 56, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンポーネントのライフサイクルを管理する', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンポーネントに状態変数と更新関数を提供する', TRUE, 2),
    (gen_random_uuid(), q_id, '副作用処理を実行する', FALSE, 3),
    (gen_random_uuid(), q_id, 'グローバルな状態を全コンポーネントで共有する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseEffectの第2引数に空配列[]を渡した場合の動作はどれか。', '空配列を渡すとコンポーネントの初回マウント時のみ実行される。クリーンアップ関数はアンマウント時に実行される。', 1, 57, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '毎回のレンダリング後に実行される', FALSE, 1),
    (gen_random_uuid(), q_id, '一度も実行されない', FALSE, 2),
    (gen_random_uuid(), q_id, '初回マウント時のみ実行される', TRUE, 3),
    (gen_random_uuid(), q_id, 'stateが変更されたときのみ実行される', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactで親コンポーネントから子コンポーネントにデータを渡す仕組みはどれか。', 'propsは親から子への一方向データフロー。子コンポーネントはpropsを受け取り、読み取り専用として扱う。', 1, 58, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'state', FALSE, 1),
    (gen_random_uuid(), q_id, 'context', FALSE, 2),
    (gen_random_uuid(), q_id, 'ref', FALSE, 3),
    (gen_random_uuid(), q_id, 'props', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのJSXで条件付きレンダリングを行う方法として正しいものはどれか。', 'JSX内では三項演算子(condition ? A : B)や論理AND演算子(condition && A)で条件付きレンダリングが可能。if文は直接使えない。', 1, 59, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '{if (show) <Component />}', FALSE, 1),
    (gen_random_uuid(), q_id, '{show ? <Component /> : null}', TRUE, 2),
    (gen_random_uuid(), q_id, '{switch(show) { case true: <Component /> }}', FALSE, 3),
    (gen_random_uuid(), q_id, '<Component v-if={show} />', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactでリストをレンダリングする際にkey属性が必要な理由はどれか。', 'keyは各要素を一意に識別するため、Reactの差分検出(reconciliation)を効率化する。keyがないとリスト全体の再レンダリングが発生しうる。', 1, 60, 'easy', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CSSスタイルを要素に適用するため', FALSE, 1),
    (gen_random_uuid(), q_id, 'イベントハンドラをバインドするため', FALSE, 2),
    (gen_random_uuid(), q_id, 'Reactの差分検出を効率化するため', TRUE, 3),
    (gen_random_uuid(), q_id, 'アクセシビリティを向上させるため', FALSE, 4);

  -- ===== react - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseContextフックの用途はどれか。', 'useContextはContext APIの値を購読するフック。propsのバケツリレーを避けて、ネストの深いコンポーネントにもデータを渡せる。', 1, 61, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DOM要素への直接参照を取得する', FALSE, 1),
    (gen_random_uuid(), q_id, 'propsを経由せずにコンポーネントツリー全体でデータを共有する', TRUE, 2),
    (gen_random_uuid(), q_id, '非同期データのローディング状態を管理する', FALSE, 3),
    (gen_random_uuid(), q_id, 'コンポーネントのメモ化を行う', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseRefフックの特徴として正しいものはどれか。', 'useRefは.currentプロパティを持つオブジェクトを返す。値を変更しても再レンダリングをトリガーしないため、DOM参照や前回値の保持に使う。', 1, 62, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '値の変更時に再レンダリングをトリガーする', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンポーネント間でデータを共有する', FALSE, 2),
    (gen_random_uuid(), q_id, '値の変更で再レンダリングされず、レンダリング間で値を保持する', TRUE, 3),
    (gen_random_uuid(), q_id, '非同期処理の結果を自動的にキャッシュする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのuseMemoとuseCallbackの違いとして正しいものはどれか。', 'useMemoは計算結果の値をメモ化し、useCallbackは関数自体をメモ化する。どちらも不要な再計算を防ぐパフォーマンス最適化に使う。', 1, 63, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'useMemoは関数を、useCallbackは値をメモ化する', FALSE, 1),
    (gen_random_uuid(), q_id, 'useMemoは値を、useCallbackは関数をメモ化する', TRUE, 2),
    (gen_random_uuid(), q_id, 'useMemoは同期処理用、useCallbackは非同期処理用', FALSE, 3),
    (gen_random_uuid(), q_id, '両者は同じ機能でエイリアスの関係である', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactのカスタムフックの命名規則として正しいものはどれか。', 'カスタムフックは「use」で始まる関数名にする必要がある。これによりReactがフックのルールを自動的に検証できる。', 1, 64, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'hookで始まる（例: hookFetchData）', FALSE, 1),
    (gen_random_uuid(), q_id, 'customで始まる（例: customFetchData）', FALSE, 2),
    (gen_random_uuid(), q_id, 'useで始まる（例: useFetchData）', TRUE, 3),
    (gen_random_uuid(), q_id, '特に命名規則はない', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Routerの<Link>コンポーネントと通常の<a>タグの違いはどれか。', 'Linkコンポーネントはクライアントサイドルーティングで画面遷移を行い、ページ全体のリロードを発生させない。SPAのUXを維持できる。', 1, 65, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '<Link>は外部リンク専用で、<a>は内部リンク専用', FALSE, 1),
    (gen_random_uuid(), q_id, '<Link>はページリロードなしでルーティングし、<a>はリロードが発生する', TRUE, 2),
    (gen_random_uuid(), q_id, '機能に違いはなく、<Link>は<a>のエイリアスである', FALSE, 3),
    (gen_random_uuid(), q_id, '<Link>はSEO対策用で、<a>はユーザー操作用', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactでuseEffectのクリーンアップ関数が実行されるタイミングはどれか。', 'クリーンアップ関数はコンポーネントのアンマウント時と、依存配列の値が変わって次のエフェクトが実行される前に呼ばれる。', 1, 66, 'medium', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コンポーネントの初回マウント時のみ', FALSE, 1),
    (gen_random_uuid(), q_id, '毎回のレンダリング前', FALSE, 2),
    (gen_random_uuid(), q_id, 'アンマウント時および次のエフェクト実行前', TRUE, 3),
    (gen_random_uuid(), q_id, 'ブラウザのタブが閉じられた時のみ', FALSE, 4);

  -- ===== react - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Server Componentsの特徴として正しいものはどれか。', 'Server Componentsはサーバー上でレンダリングされ、JavaScriptバンドルに含まれない。データフェッチを直接行い、クライアントへの転送量を削減する。', 1, 67, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'クライアント側でのみ実行され、SSRには対応しない', FALSE, 1),
    (gen_random_uuid(), q_id, 'useStateやuseEffectなどのフックを自由に使用できる', FALSE, 2),
    (gen_random_uuid(), q_id, 'サーバーでレンダリングされ、クライアントのJSバンドルに含まれない', TRUE, 3),
    (gen_random_uuid(), q_id, 'onClick等のイベントハンドラを直接設定できる', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js App Routerでpage.tsxファイルの役割はどれか。', 'App Routerではファイルシステムベースのルーティングを採用し、page.tsxはそのルートセグメントのUIを定義するファイルである。', 1, 68, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ルートセグメントのUIを定義するファイル', TRUE, 1),
    (gen_random_uuid(), q_id, 'エラーハンドリングを定義するファイル', FALSE, 2),
    (gen_random_uuid(), q_id, 'ローディングUIを定義するファイル', FALSE, 3),
    (gen_random_uuid(), q_id, 'レイアウトを定義するファイル', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.jsのSSR、SSG、ISRの説明として正しいものはどれか。', 'SSRはリクエスト毎にサーバーでレンダリング、SSGはビルド時に静的生成、ISRはSSGに加えて一定間隔でバックグラウンド再生成を行う。', 1, 69, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SSRはクライアントのみでレンダリングする方式', FALSE, 1),
    (gen_random_uuid(), q_id, 'SSGはリクエスト毎にサーバーでレンダリングする方式', FALSE, 2),
    (gen_random_uuid(), q_id, 'ISRはビルド時に生成し、一定間隔でバックグラウンド再生成する方式', TRUE, 3),
    (gen_random_uuid(), q_id, 'SSR、SSG、ISRはすべて同じ動作をする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのSuspenseコンポーネントの主な用途はどれか。', 'Suspenseは非同期処理(データフェッチやコード分割)の完了を待つ間にフォールバックUIを表示する。React 18以降で機能が拡張された。', 1, 70, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'エラー発生時にフォールバックUIを表示する', FALSE, 1),
    (gen_random_uuid(), q_id, 'コンポーネントのメモ化を行う', FALSE, 2),
    (gen_random_uuid(), q_id, '非同期処理の完了を待つ間にフォールバックUIを表示する', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンポーネントのレンダリング順序を制御する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ReactのErrorBoundaryの説明として正しいものはどれか。', 'ErrorBoundaryはクラスコンポーネントで実装され、子コンポーネントのレンダリング中のエラーをキャッチしてフォールバックUIを表示する。', 1, 71, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '関数コンポーネントのフックとして実装する', FALSE, 1),
    (gen_random_uuid(), q_id, 'イベントハンドラ内のエラーもキャッチできる', FALSE, 2),
    (gen_random_uuid(), q_id, '子コンポーネントのレンダリングエラーをキャッチしてフォールバックUIを表示する', TRUE, 3),
    (gen_random_uuid(), q_id, '非同期処理のエラーを自動的にリトライする', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Reactの状態管理でuseReducerが適している場面はどれか。', 'useReducerは複数の値が関連する複雑な状態遷移に適している。action typeに基づいて状態を更新し、ロジックを集約できる。', 1, 72, 'hard', 'react');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '単一のboolean値のトグル', FALSE, 1),
    (gen_random_uuid(), q_id, 'APIレスポンスのキャッシュ管理', FALSE, 2),
    (gen_random_uuid(), q_id, '複数の関連する値を持つ複雑な状態遷移', TRUE, 3),
    (gen_random_uuid(), q_id, 'コンポーネント間のグローバル状態共有', FALSE, 4);

  -- ===== sql - EASY (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLでテーブルから条件を指定してデータを取得する構文はどれか。', 'SELECT文のWHERE句で条件を指定してデータを絞り込む。ORDER BYで並び替えも可能。', 1, 73, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GET * FROM users FILTER age > 20;', FALSE, 1),
    (gen_random_uuid(), q_id, 'FIND * FROM users IF age > 20;', FALSE, 2),
    (gen_random_uuid(), q_id, 'SELECT * FROM users WHERE age > 20;', TRUE, 3),
    (gen_random_uuid(), q_id, 'FETCH * FROM users WHEN age > 20;', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLでテーブルに新しいレコードを追加する文はどれか。', 'INSERT INTO文でテーブルに新しい行を追加する。VALUES句で各カラムの値を指定する。', 1, 74, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ADD INTO users VALUES (...);', FALSE, 1),
    (gen_random_uuid(), q_id, 'INSERT INTO users VALUES (...);', TRUE, 2),
    (gen_random_uuid(), q_id, 'CREATE INTO users VALUES (...);', FALSE, 3),
    (gen_random_uuid(), q_id, 'PUT INTO users VALUES (...);', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのINNER JOINの説明として正しいものはどれか。', 'INNER JOINは両方のテーブルで結合条件に一致するレコードのみを返す。一致しないレコードは結果に含まれない。', 1, 75, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左テーブルの全レコードと右テーブルの一致レコードを返す', FALSE, 1),
    (gen_random_uuid(), q_id, '両テーブルの全レコードを返す', FALSE, 2),
    (gen_random_uuid(), q_id, '両テーブルで結合条件に一致するレコードのみを返す', TRUE, 3),
    (gen_random_uuid(), q_id, '右テーブルの全レコードと左テーブルの一致レコードを返す', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのCOUNT関数の説明として正しいものはどれか。', 'COUNT(*)はNULLを含む全行数を返し、COUNT(列名)はその列がNULLでない行数を返す。', 1, 76, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '指定した列の合計値を返す', FALSE, 1),
    (gen_random_uuid(), q_id, '指定した列の平均値を返す', FALSE, 2),
    (gen_random_uuid(), q_id, '指定した列の最大値を返す', FALSE, 3),
    (gen_random_uuid(), q_id, '行数を数えて返す', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのORDER BYでデフォルトの並び順はどれか。', 'ORDER BYのデフォルトはASC(昇順)。降順にする場合はDESCを明示的に指定する。', 1, 77, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DESC（降順）', FALSE, 1),
    (gen_random_uuid(), q_id, 'ASC（昇順）', TRUE, 2),
    (gen_random_uuid(), q_id, 'RANDOM（ランダム）', FALSE, 3),
    (gen_random_uuid(), q_id, 'INSERT順', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLでレコードを削除する文として正しいものはどれか。', 'DELETE FROM文でWHERE句を指定して条件に合うレコードを削除する。WHERE句を省略すると全件削除される。', 1, 78, 'easy', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'REMOVE FROM users WHERE id = 1;', FALSE, 1),
    (gen_random_uuid(), q_id, 'DROP FROM users WHERE id = 1;', FALSE, 2),
    (gen_random_uuid(), q_id, 'DELETE FROM users WHERE id = 1;', TRUE, 3),
    (gen_random_uuid(), q_id, 'ERASE FROM users WHERE id = 1;', FALSE, 4);

  -- ===== sql - MEDIUM (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのLEFT JOINの説明として正しいものはどれか。', 'LEFT JOINは左テーブルの全レコードを返し、右テーブルに一致がない場合はNULLで埋める。', 1, 79, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '左テーブルの全レコードを返し、右テーブルに一致がなければNULL', TRUE, 1),
    (gen_random_uuid(), q_id, '両テーブルで一致するレコードのみを返す', FALSE, 2),
    (gen_random_uuid(), q_id, '右テーブルの全レコードを返し、左テーブルに一致がなければNULL', FALSE, 3),
    (gen_random_uuid(), q_id, '両テーブルの全レコードを返し、一致がなければNULL', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのサブクエリの説明として正しいものはどれか。', 'サブクエリはSQL文の中に埋め込まれた別のSELECT文。WHERE句、FROM句、SELECT句などで使用でき、動的な条件指定が可能。', 1, 80, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルを結合するための専用構文', FALSE, 1),
    (gen_random_uuid(), q_id, 'SQL文の中に埋め込まれた別のSELECT文', TRUE, 2),
    (gen_random_uuid(), q_id, 'ストアドプロシージャの別名', FALSE, 3),
    (gen_random_uuid(), q_id, 'インデックスを作成するための構文', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのGROUP BYとHAVINGの関係として正しいものはどれか。', 'GROUP BYでグループ化した後、HAVINGでグループに対する条件を指定する。WHEREはグループ化前の行に、HAVINGはグループ化後に適用される。', 1, 81, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HAVINGはWHEREと同じで、どちらを使っても同じ結果になる', FALSE, 1),
    (gen_random_uuid(), q_id, 'HAVINGはGROUP BYなしでも使用できる', FALSE, 2),
    (gen_random_uuid(), q_id, 'HAVINGはGROUP BY後のグループに対して条件を指定する', TRUE, 3),
    (gen_random_uuid(), q_id, 'HAVINGはORDER BYの代わりに使用する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースインデックスの主な目的はどれか。', 'インデックスはテーブルのデータ検索を高速化する。ただし追加のストレージが必要で、INSERT/UPDATE/DELETEの速度は低下する。', 1, 82, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データの整合性を保証する', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブルの容量を削減する', FALSE, 2),
    (gen_random_uuid(), q_id, 'データの暗号化を行う', FALSE, 3),
    (gen_random_uuid(), q_id, 'データの検索速度を向上させる', TRUE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのトランザクションでCOMMITの役割はどれか。', 'COMMITはトランザクション内の全変更を確定してデータベースに反映する。ROLLBACKは変更を取り消してトランザクション開始前の状態に戻す。', 1, 83, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'トランザクション内の変更を取り消す', FALSE, 1),
    (gen_random_uuid(), q_id, 'トランザクション内の全変更を確定する', TRUE, 2),
    (gen_random_uuid(), q_id, 'トランザクションの分離レベルを設定する', FALSE, 3),
    (gen_random_uuid(), q_id, 'トランザクションのセーブポイントを作成する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのRIGHT JOINの説明として正しいものはどれか。', 'RIGHT JOINは右テーブルの全レコードを返し、左テーブルに一致がない場合はNULLで埋める。LEFT JOINの逆の動作をする。', 1, 84, 'medium', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '両テーブルで一致するレコードのみを返す', FALSE, 1),
    (gen_random_uuid(), q_id, '左テーブルの全レコードと右テーブルの一致レコードを返す', FALSE, 2),
    (gen_random_uuid(), q_id, '右テーブルの全レコードを返し、左テーブルに一致がなければNULL', TRUE, 3),
    (gen_random_uuid(), q_id, '両テーブルの全レコードを返す', FALSE, 4);

  -- ===== sql - HARD (6) =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのウィンドウ関数ROW_NUMBER()の説明として正しいものはどれか。', 'ROW_NUMBER()はパーティション内の各行に一意の連番を割り当てる。OVER句でパーティションと並び順を指定する。', 1, 85, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブル全体の行数を返す', FALSE, 1),
    (gen_random_uuid(), q_id, '指定した列の累積合計を計算する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パーティション内の各行に一意の連番を割り当てる', TRUE, 3),
    (gen_random_uuid(), q_id, '重複する行を自動的に削除する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのEXPLAIN文の主な用途はどれか。', 'EXPLAINはクエリの実行計画を表示し、テーブルスキャンやインデックスの使用状況を確認できる。パフォーマンスチューニングに不可欠。', 1, 86, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルの構造(DDL)を表示する', FALSE, 1),
    (gen_random_uuid(), q_id, 'クエリの実行計画を表示しパフォーマンスを分析する', TRUE, 2),
    (gen_random_uuid(), q_id, 'クエリの結果を見やすいフォーマットで表示する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルの統計情報を更新する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースの第3正規形(3NF)の条件として正しいものはどれか。', '第3正規形は第2正規形を満たし、かつ非キー属性が主キーに対して推移的関数従属していないこと。非キー列間の依存を排除する。', 1, 87, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '全カラムが原子的な値を持つこと', FALSE, 1),
    (gen_random_uuid(), q_id, '部分関数従属が存在しないこと', FALSE, 2),
    (gen_random_uuid(), q_id, '推移的関数従属が存在しないこと', TRUE, 3),
    (gen_random_uuid(), q_id, '全テーブルに外部キーが設定されていること', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースのデッドロック対策として有効なものはどれか。', 'テーブルやレコードのロック取得順序を全トランザクションで統一することで、循環待ちを防ぎデッドロックを回避できる。', 1, 88, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インデックスを全テーブルに作成する', FALSE, 1),
    (gen_random_uuid(), q_id, 'トランザクションの分離レベルをREAD UNCOMMITTEDにする', FALSE, 2),
    (gen_random_uuid(), q_id, 'ロック取得順序を全トランザクションで統一する', TRUE, 3),
    (gen_random_uuid(), q_id, 'すべてのクエリにNOLOCKヒントを付ける', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'データベースのパーティショニングの説明として正しいものはどれか。', 'パーティショニングは大きなテーブルを特定の条件(日付、ID範囲など)で分割して管理する。クエリ対象を限定しパフォーマンスを向上させる。', 1, 89, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テーブルのカラムを複数テーブルに分割する', FALSE, 1),
    (gen_random_uuid(), q_id, 'テーブルを条件に基づいて複数の物理的な区画に分割する', TRUE, 2),
    (gen_random_uuid(), q_id, 'データベースを複数のサーバーに複製する', FALSE, 3),
    (gen_random_uuid(), q_id, 'テーブルのインデックスを複数作成する', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SQLのウィンドウ関数LAG()の用途はどれか。', 'LAG()は現在の行から指定した行数だけ前の行の値を取得する。前月比較や差分計算などに使用される。', 1, 90, 'hard', 'sql');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '現在の行から指定した行数だけ前の行の値を取得する', TRUE, 1),
    (gen_random_uuid(), q_id, '現在の行から指定した行数だけ後の行の値を取得する', FALSE, 2),
    (gen_random_uuid(), q_id, 'パーティション内の最初の行の値を取得する', FALSE, 3),
    (gen_random_uuid(), q_id, 'パーティション内の最後の行の値を取得する', FALSE, 4);

END $$;

-- ============================================
-- Quiz 5: ビジネスリテラシーランク試験 (Attitude/Culture) — 30 questions
-- Categories: business_manner, communication, cross_culture
-- Easy: 基本マナー・挨拶・敬語 (9)
-- Medium: 報連相・会議・メール (12)
-- Hard: 根回し・異文化コミュニケーション (9)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== EASY (9 questions): ビジネス挨拶、基本敬語、出退勤 =====

  -- Q1
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で朝出勤したときの適切な挨拶はどれか。', '日本の職場では朝の出勤時に「おはようございます」が基本の挨拶です。', 1, 1, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おはようございます', TRUE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様です（業務中・退勤時の挨拶）', FALSE, 2),
    (gen_random_uuid(), q_id, 'こんにちは（昼間の一般的な挨拶）', FALSE, 3),
    (gen_random_uuid(), q_id, 'お世話になっております（外部取引先用の挨拶）', FALSE, 4);

  -- Q2
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で退勤する際、残っている同僚にかける挨拶はどれか。', '先に退勤する際は「お先に失礼します」と挨拶します。', 1, 2, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でした（同僚の退勤時の応答）', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご苦労様です（上司が部下に使う表現）', FALSE, 2),
    (gen_random_uuid(), q_id, 'お先に失礼します', TRUE, 3),
    (gen_random_uuid(), q_id, 'また明日よろしくお願いします', FALSE, 4);

  -- Q3
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で名刺交換をする際の正しいマナーはどれか。', '名刺は両手で渡し受け取り、受け取った名刺はすぐにポケットに入れずテーブルの上に置きます。', 1, 3, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '片手で軽く渡し、受け取ったらすぐに名刺入れに整理する', FALSE, 1),
    (gen_random_uuid(), q_id, '両手で渡し受け取り、受け取った名刺はテーブルに置く', TRUE, 2),
    (gen_random_uuid(), q_id, '受け取った名刺に相手の特徴をメモしながら会話を続ける', FALSE, 3),
    (gen_random_uuid(), q_id, '名刺を受け取ったらすぐに内容を確認しカバンに大切に保管する', FALSE, 4);

  -- Q4
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本語の「敬語（けいご）」とは何か。', '敬語は日本語で相手に対する尊敬と礼儀を表現する言語体系で、尊敬語、謙譲語、丁寧語に分かれます。', 1, 4, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本各地域の伝統的な方言を総称する言語分類体系', FALSE, 1),
    (gen_random_uuid(), q_id, 'ビジネス文書でのみ使用する格式体の書き言葉表現', FALSE, 2),
    (gen_random_uuid(), q_id, '日本の古典文学に由来する伝統的な文学表現様式', FALSE, 3),
    (gen_random_uuid(), q_id, '相手に対する尊敬と礼儀を表現する言語体系', TRUE, 4);

  -- Q5
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で出勤時間に対する一般的な期待はどれか。', '日本では時間厳守が非常に重要で、定時より5〜10分早く到着するのが一般的です。', 1, 5, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'フレックスタイム制で各自好きな時間に出勤するのが一般的', FALSE, 1),
    (gen_random_uuid(), q_id, '定時に間に合えば日本のビジネスマナーとして十分である', FALSE, 2),
    (gen_random_uuid(), q_id, '定時より5〜10分早く到着するのが望ましい', TRUE, 3),
    (gen_random_uuid(), q_id, '業務開始30分前に到着して準備するのが必須である', FALSE, 4);

  -- Q6
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で電話を受ける際、最初に言う言葉として適切なものはどれか。', '日本の会社で電話を受ける際は「お電話ありがとうございます、○○会社の△△です」と言います。', 1, 6, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もしもし、○○会社です', FALSE, 1),
    (gen_random_uuid(), q_id, 'お電話ありがとうございます', TRUE, 2),
    (gen_random_uuid(), q_id, 'はい、○○会社でございます', FALSE, 3),
    (gen_random_uuid(), q_id, 'お世話になっております、○○です', FALSE, 4);

  -- Q7
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のお辞儀（おじぎ）の種類でないものはどれか。', '日本のお辞儀には会釈（15度）、敬礼（30度）、最敬礼（45度）があります。', 1, 7, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会釈（えしゃく、15度 — 軽い会釈）', FALSE, 1),
    (gen_random_uuid(), q_id, '敬礼（けいれい、30度 — 一般的なビジネス挨拶）', FALSE, 2),
    (gen_random_uuid(), q_id, '最敬礼（さいけいれい、45度 — 深い感謝・謝罪）', FALSE, 3),
    (gen_random_uuid(), q_id, '直礼（ちょくれい）', TRUE, 4);

  -- Q8
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で同僚が退勤する際にかける挨拶はどれか。', '同僚が先に退勤する際は「お疲れ様でした」と挨拶します。', 1, 8, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でした', TRUE, 1),
    (gen_random_uuid(), q_id, 'お先に失礼します（自分が退勤する際の挨拶）', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご苦労様です（上司が部下に使う表現）', FALSE, 3),
    (gen_random_uuid(), q_id, 'また明日お願いします', FALSE, 4);

  -- Q9
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場での服装に関する一般的な基準はどれか。', '日本の会社では清潔感のあるビジネスカジュアルまたはスーツが基本で、会社の規定に従います。', 1, 9, 'easy', 'business_manner');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IT業界では自由な服装が一般的なので楽な服を着る', FALSE, 1),
    (gen_random_uuid(), q_id, '毎日必ず黒のスーツにネクタイを着用しなければならない', FALSE, 2),
    (gen_random_uuid(), q_id, '部署ごとに指定されたユニフォームを着用するのが一般的', FALSE, 3),
    (gen_random_uuid(), q_id, '清潔感のあるビジネスカジュアル・スーツが基本', TRUE, 4);

  -- ===== MEDIUM (12 questions): 報連相、会議マナー、メール =====

  -- Q10
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で「ホウレンソウ」とは何か。', 'ホウレンソウは報告・連絡・相談の略で、日本の職場の核心的なコミュニケーション原則です。', 1, 10, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PDCA（Plan-Do-Check-Act）サイクルの日本式名称', FALSE, 1),
    (gen_random_uuid(), q_id, '日本特有のプロジェクト管理手法であるカイゼンの下位原則', FALSE, 2),
    (gen_random_uuid(), q_id, '報告・連絡・相談の略', TRUE, 3),
    (gen_random_uuid(), q_id, '日本の組織の階層構造を表す経営用語', FALSE, 4);

  -- Q11
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議で上司が発言中のとき、適切な行動はどれか。', '日本では上司の発言を最後まで傾聴してから意見を述べるのが礼儀です。', 1, 11, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '積極性を見せるため良いアイデアはすぐに発言する', FALSE, 1),
    (gen_random_uuid(), q_id, '最後まで傾聴してから意見を述べる', TRUE, 2),
    (gen_random_uuid(), q_id, 'メモを取りながら同意する部分ですぐに相槌を打って割り込む', FALSE, 3),
    (gen_random_uuid(), q_id, '反対意見があれば論理的にすぐ反論して効率を高める', FALSE, 4);

  -- Q12
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスメールで最初に書く内容はどれか。', '日本のビジネスメールは「○○会社 △△様」または「お世話になっております」で始めるのが一般的です。', 1, 12, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'メールの目的と用件を簡潔に要約して書く', FALSE, 1),
    (gen_random_uuid(), q_id, '送信日と送信者の所属・役職を記載する', FALSE, 2),
    (gen_random_uuid(), q_id, '自己紹介と前回のミーティングへの感謝を書く', FALSE, 3),
    (gen_random_uuid(), q_id, '相手の所属・名前と挨拶（お世話になっております）', TRUE, 4);

  -- Q13
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ホウレンソウの「報告」をする際に最も重要なことはどれか。', '報告は結論から先に述べ（結論ファースト）、事実に基づいて簡潔に伝えることが重要です。', 1, 13, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '背景と経過を詳しく説明してから結論を最後に伝える', FALSE, 1),
    (gen_random_uuid(), q_id, '良い結果を中心に報告し、ネガティブな内容は別途伝える', FALSE, 2),
    (gen_random_uuid(), q_id, '結論から先に、事実に基づいて簡潔に伝える', TRUE, 3),
    (gen_random_uuid(), q_id, '一定期間の進捗をまとめて一括で総合報告する', FALSE, 4);

  -- Q14
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議で議事録を作成する理由はどれか。', '議事録は決定事項・担当者・期限を明確に記録し、後の確認と責任の所在を明らかにするために作成します。', 1, 14, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '決定事項と担当者、期限を明確に記録するため', TRUE, 1),
    (gen_random_uuid(), q_id, '会議に出席できなかった上司に内容を共有するため', FALSE, 2),
    (gen_random_uuid(), q_id, '法的に義務化された企業文書保管規定を遵守するため', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクト終了時の成果評価の根拠資料として活用するため', FALSE, 4);

  -- Q15
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスメールの最後に書く挨拶はどれか。', '日本のビジネスメールの最後には「よろしくお願いいたします」と書くのが一般的です。', 1, 15, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '失礼いたします（格式体の締め表現）', FALSE, 1),
    (gen_random_uuid(), q_id, 'お手数おかけしますが（依頼時の表現）', FALSE, 2),
    (gen_random_uuid(), q_id, '以上、ご確認ください', FALSE, 3),
    (gen_random_uuid(), q_id, 'よろしくお願いいたします', TRUE, 4);

  -- Q16
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で会議開始5分前に到着することが重要な理由はどれか。', '日本では時間厳守は相手に対する尊重の表現であり、遅刻は信頼を失う大きな失礼です。', 1, 16, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議資料を事前に準備し座席配置を確認するため', FALSE, 1),
    (gen_random_uuid(), q_id, '時間厳守は相手に対する尊重であり信頼の基本である', TRUE, 2),
    (gen_random_uuid(), q_id, '日本の会社では遅刻すると人事評価に直接減点が反映される', FALSE, 3),
    (gen_random_uuid(), q_id, '会議室の使用時間が限られており効率的な運営が必要なため', FALSE, 4);

  -- Q17
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', 'ホウレンソウの「相談」をする際の適切な姿勢はどれか。', '相談の際は自分の意見や解決案を準備してから上司に確認・助言を求めるのが望ましいです。', 1, 17, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '問題状況を正確に伝え解決方法は上司の判断に任せる', FALSE, 1),
    (gen_random_uuid(), q_id, '自分で完全に解決できるまで相談のタイミングを遅らせる', FALSE, 2),
    (gen_random_uuid(), q_id, '自分の意見・解決案を準備してから助言を求める', TRUE, 3),
    (gen_random_uuid(), q_id, 'まず同僚と十分に議論してから結論を上司に報告する', FALSE, 4);

  -- Q18
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会社で業務中にミスをしたときの適切な対応はどれか。', 'ミスを発見したら直ちに上司に報告し、対応策を一緒に検討することが重要です。隠すとより大きな問題になります。', 1, 18, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ミスの原因を自分で分析し解決してから結果を報告する', FALSE, 1),
    (gen_random_uuid(), q_id, '影響範囲が小さいミスは静かに修正し報告を省略する', FALSE, 2),
    (gen_random_uuid(), q_id, '同僚にまず相談しチームレベルの対策を立ててから報告する', FALSE, 3),
    (gen_random_uuid(), q_id, '直ちに上司に報告し対応策を一緒に検討する', TRUE, 4);

  -- Q19
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '「お疲れ様です」と「ご苦労様です」の違いはどれか。', '「お疲れ様です」は誰にでも使えますが、「ご苦労様です」は上司が部下に使う表現です。', 1, 19, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '「ご苦労様」がより丁寧な表現なので目上の人に使うのが適切', FALSE, 1),
    (gen_random_uuid(), q_id, '「お疲れ様」は誰にでも、「ご苦労様」は上司→部下の表現', TRUE, 2),
    (gen_random_uuid(), q_id, '両方とも意味と用法が同じで状況に応じて自由に使い分けられる', FALSE, 3),
    (gen_random_uuid(), q_id, '「お疲れ様」は社内のみ、「ご苦労様」は外部取引先に使う表現', FALSE, 4);

  -- Q20
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の会議における座席配置で「上座（かみざ）」とは何か。', '上座は出入口から最も遠い席で、上位の役職者やお客様が座る上席です。', 1, 20, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議を進行する司会者が座る会議室中央の指定席', FALSE, 1),
    (gen_random_uuid(), q_id, '会議室に先に到着した順に自由に選ぶ席', FALSE, 2),
    (gen_random_uuid(), q_id, '出入口に近い席で業務効率のため上司が座る席', FALSE, 3),
    (gen_random_uuid(), q_id, '出入口から最も遠い席で上位の役職者・お客様が座る上席', TRUE, 4);

  -- Q21
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のビジネスメールでCCに上司を含める理由はどれか。', 'CCに上司を含めることは情報共有と報告を同時に行うホウレンソウの一環であり、日本のビジネスの一般的な慣行です。', 1, 21, 'medium', 'communication');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '情報共有と報告を同時に行うホウレンソウの一環', TRUE, 1),
    (gen_random_uuid(), q_id, '上司の事前承認がなければメール送信が有効にならないため', FALSE, 2),
    (gen_random_uuid(), q_id, '問題発生時に上司が直ちに介入して解決できるようにするため', FALSE, 3),
    (gen_random_uuid(), q_id, '日本企業の内部監査規定により義務的に含めなければならないため', FALSE, 4);

  -- ===== HARD (9 questions): 根回し、葛藤解決、異文化コミュニケーション =====

  -- Q22
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「根回し（ねまわし）」とは何か。', '根回しは公式会議の前に関係者に事前に説明し同意を得る非公式の事前調整プロセスです。', 1, 22, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '稟議システムで文書を順次決裁する公式手続き', FALSE, 1),
    (gen_random_uuid(), q_id, 'カイゼン活動の一環で現場の問題を改善するプロセス', FALSE, 2),
    (gen_random_uuid(), q_id, '公式会議前に関係者と事前調整する非公式プロセス', TRUE, 3),
    (gen_random_uuid(), q_id, '組織内の部署間の業務分担を調整する人事管理制度', FALSE, 4);

  -- Q23
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本の職場で上司の意見に同意できないとき、適切な対応はどれか。', '直接的な反論より「なるほど、一方で…」など婉曲的に別の視点を提示します。', 1, 23, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議中は同意し、後で個別に書面で意見を伝える', FALSE, 1),
    (gen_random_uuid(), q_id, '婉曲的に別の視点を提示する（例：なるほど、一方で…）', TRUE, 2),
    (gen_random_uuid(), q_id, '論理的な根拠を持って明確かつ直接的に反対意見を述べる', FALSE, 3),
    (gen_random_uuid(), q_id, '上司の意見を受け入れ実行過程で自分のやり方を反映する', FALSE, 4);

  -- Q24
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「空気を読む（くうきをよむ）」のビジネス的な意味はどれか。', '空気を読むは言葉で表現されない雰囲気や状況を把握し、それに合わせて行動することを意味します。', 1, 24, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議前に参加者の立場を把握し根回しすること', FALSE, 1),
    (gen_random_uuid(), q_id, '上司の業務指示を正確に理解し迅速に実行すること', FALSE, 2),
    (gen_random_uuid(), q_id, '言葉で表現されない雰囲気・状況を把握し適切に行動する', TRUE, 3),
    (gen_random_uuid(), q_id, 'チームメンバーの業務負担を察し自発的に業務を分配すること', FALSE, 4);

  -- Q25
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国と日本の意思決定方式の主な違いはどれか。', '韓国はトップダウンの意思決定が速い一方、日本は稟議と根回しを通じた合意形成（ボトムアップ）を重視します。', 1, 25, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '日本は合意形成（ボトムアップ）を重視し意思決定が遅い場合がある', TRUE, 1),
    (gen_random_uuid(), q_id, '日本は韓国より経営陣のトップダウン決定が強く実行速度が速い', FALSE, 2),
    (gen_random_uuid(), q_id, '韓国も日本も現場担当者の自律的判断に意思決定を委ねる', FALSE, 3),
    (gen_random_uuid(), q_id, '日本はチームリーダーが単独決定し韓国はチーム合意を経る', FALSE, 4);

  -- Q26
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「建前（たてまえ）」と「本音（ほんね）」の意味はどれか。', '建前は公的・社会的立場（表面的な意見）で、本音は個人の本当の考え（本心）です。この区別を理解することが重要です。', 1, 26, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '建前は社内規則、本音は業務外の個人的目標を指す経営用語', FALSE, 1),
    (gen_random_uuid(), q_id, '建前は上司に報告する内容、本音は同僚と共有する非公式情報', FALSE, 2),
    (gen_random_uuid(), q_id, '建前は公的立場（表面）、本音は本当の本心', TRUE, 3),
    (gen_random_uuid(), q_id, '建前は会議での公式発言、本音は根回し過程での非公式意見', FALSE, 4);

  -- Q27
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本のIT企業でチーム内の葛藤が発生した際、最も適切な解決方法はどれか。', '日本では直接的な対立を避け、第三者（上司やリーダー）を通じた仲裁や個別面談で解決することを好みます。', 1, 27, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'チーム全員が集まる場で各自の意見を透明に共有し議論する', FALSE, 1),
    (gen_random_uuid(), q_id, '第三者の仲裁または個別面談を通じた解決', TRUE, 2),
    (gen_random_uuid(), q_id, '葛藤当事者間の直接対話で問題原因を分析し合意を導く', FALSE, 3),
    (gen_random_uuid(), q_id, '社内公式の葛藤解決手続きに従いHR部門に調整を依頼する', FALSE, 4);

  -- Q28
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「稟議（りんぎ）」とは何か。', '稟議は提案書を関連部署と上位役職者に順次回覧して承認を得る日本特有の意思決定システムです。', 1, 28, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '提案書を順次回覧して承認を得る意思決定システム', TRUE, 1),
    (gen_random_uuid(), q_id, '根回しと同じ概念で非公式的な事前合意を得るプロセス', FALSE, 2),
    (gen_random_uuid(), q_id, '新入社員が部署配属前に受ける社内オリエンテーション制度', FALSE, 3),
    (gen_random_uuid(), q_id, '四半期ごとに実施する社員の業務成果評価およびフィードバック手続き', FALSE, 4);

  -- Q29
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '韓国人ITエンジニアが日本派遣時に最も注意すべきコミュニケーションの違いはどれか。', '韓国は直接的な表現を好みますが、日本は間接的な表現と文脈（コンテクスト）を重視するハイコンテクスト文化です。', 1, 29, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '技術文書とコードレビューで使用する専門用語の違いに注意する', FALSE, 1),
    (gen_random_uuid(), q_id, '日本は間接的な表現と文脈を重視するハイコンテクスト文化', TRUE, 2),
    (gen_random_uuid(), q_id, '日本は韓国より直接的で明確な表現を好むローコンテクスト文化', FALSE, 3),
    (gen_random_uuid(), q_id, '日韓のコミュニケーション方式は類似しており敬語使用にのみ注意すればよい', FALSE, 4);

  -- Q30
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '日本で「和（わ）」を重視することがITプロジェクトに与える影響はどれか。', '和（調和）を重視するとチームの結束力は高いですが、反対意見の表現が難しく問題が隠れる可能性があります。適切なバランスが必要です。', 1, 30, 'hard', 'cross_culture');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'チームの結束力は高いが反対意見の表現が難しい場合がある', TRUE, 1),
    (gen_random_uuid(), q_id, '個人よりチーム成果を優先し開発者の創造的な解決策が増える', FALSE, 2),
    (gen_random_uuid(), q_id, '意思決定速度が速くなりプロジェクトのスケジュール遵守に好影響を与える', FALSE, 3),
    (gen_random_uuid(), q_id, 'チーム内の競争が減りコード品質向上と技術革新が促進される', FALSE, 4);

END $$;

COMMIT;
