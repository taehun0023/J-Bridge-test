-- ============================================
-- J-Bridge Assessment Quiz Seed Data
-- 5 Assessment Quizzes for Onboarding
-- Total: 390 questions, 1560 options
-- ============================================

BEGIN;

-- ============================================
-- 1. Assessment Quizzes (5개)
-- ============================================
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt) VALUES
  ('a0000001-0000-0000-0000-000000000001', 'JLPT 일본어 능력 평가', 'jlpt_vocab', 0, 25, TRUE, 30),
  ('a0000002-0000-0000-0000-000000000002', 'IT 일본어 능력 평가', 'it_terminology', 0, 25, TRUE, 30),
  ('a0000003-0000-0000-0000-000000000003', '핵심 프로그래밍 능력 평가', 'core_programming', 0, 30, TRUE, 30),
  ('a0000004-0000-0000-0000-000000000004', '프레임워크 능력 평가', 'framework', 0, 30, TRUE, 30),
  ('a0000005-0000-0000-0000-000000000005', '태도/문화 이해도 평가', 'attitude_culture', 0, 10, TRUE, 10);

-- ============================================
-- Quiz 1: JLPT 일본어 능력 평가 (90 questions)
-- Easy=N3, Medium=N2, Hard=N1
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
    (gen_random_uuid(), q_id, '약속', TRUE, 1),
    (gen_random_uuid(), q_id, '예약', FALSE, 2),
    (gen_random_uuid(), q_id, '약국', FALSE, 3),
    (gen_random_uuid(), q_id, '약점', FALSE, 4);

  -- Q2: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「経験」の読み方と意味として正しいものは？', '経験(けいけん)は「경험」という意味です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けいけん - 경험', TRUE, 1),
    (gen_random_uuid(), q_id, 'けいざい - 경제', FALSE, 2),
    (gen_random_uuid(), q_id, 'けんきゅう - 연구', FALSE, 3),
    (gen_random_uuid(), q_id, 'けっか - 결과', FALSE, 4);

  -- Q3: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜てもいい」の意味として正しいものは？', '「〜てもいい」は許可を表す文法で、「~해도 된다」という意味です。', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해도 된다', TRUE, 1),
    (gen_random_uuid(), q_id, '~하면 안 된다', FALSE, 2),
    (gen_random_uuid(), q_id, '~해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶다', FALSE, 4);

  -- Q4: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「届ける」の意味は何ですか？', '届ける(とどける)は「전달하다/배달하다」という意味のN3動詞です。', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전달하다', TRUE, 1),
    (gen_random_uuid(), q_id, '도착하다', FALSE, 2),
    (gen_random_uuid(), q_id, '출발하다', FALSE, 3),
    (gen_random_uuid(), q_id, '준비하다', FALSE, 4);

  -- Q5: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜なければならない」の意味は？', '「〜なければならない」は義務を表し、「~하지 않으면 안 된다 / ~해야 한다」という意味です。', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해야 한다', TRUE, 1),
    (gen_random_uuid(), q_id, '~하고 싶다', FALSE, 2),
    (gen_random_uuid(), q_id, '~할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '~해도 된다', FALSE, 4);

  -- Q6: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「相談」の読み方と意味として正しいものは？', '相談(そうだん)は「상담」という意味です。', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そうだん - 상담', TRUE, 1),
    (gen_random_uuid(), q_id, 'しんだん - 진단', FALSE, 2),
    (gen_random_uuid(), q_id, 'そうさ - 조사', FALSE, 3),
    (gen_random_uuid(), q_id, 'しつもん - 질문', FALSE, 4);

  -- Q7: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「変更」の意味は何ですか？', '変更(へんこう)は「변경」という意味のN3名詞です。', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변경', TRUE, 1),
    (gen_random_uuid(), q_id, '변화', FALSE, 2),
    (gen_random_uuid(), q_id, '편리', FALSE, 3),
    (gen_random_uuid(), q_id, '평가', FALSE, 4);

  -- Q8: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ようにする」の意味として正しいものは？', '「〜ようにする」は努力や習慣化を表し、「~하도록 하다」という意味です。', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하도록 하다', TRUE, 1),
    (gen_random_uuid(), q_id, '~한 적이 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '~할 예정이다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하는 중이다', FALSE, 4);

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
    (gen_random_uuid(), q_id, '조깅을 하고 회사에 간다', TRUE, 1),
    (gen_random_uuid(), q_id, '회사에 가서 조깅을 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '6시에 회사에 간다', FALSE, 3),
    (gen_random_uuid(), q_id, '저녁에 조깅을 한다', FALSE, 4);

  -- Q11: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「連絡」の読み方と意味として正しいものは？', '連絡(れんらく)は「연락」という意味です。', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'れんらく - 연락', TRUE, 1),
    (gen_random_uuid(), q_id, 'れんしゅう - 연습', FALSE, 2),
    (gen_random_uuid(), q_id, 'れんぞく - 연속', FALSE, 3),
    (gen_random_uuid(), q_id, 'れんきゅう - 연휴', FALSE, 4);

  -- Q12: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ことにする」の意味として正しいものは？', '「〜ことにする」は自分の意志で決めることを表し、「~하기로 하다」という意味です。', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하기로 하다 (결정)', TRUE, 1),
    (gen_random_uuid(), q_id, '~한 적이 있다 (경험)', FALSE, 2),
    (gen_random_uuid(), q_id, '~할 수 있다 (가능)', FALSE, 3),
    (gen_random_uuid(), q_id, '~하게 되다 (변화)', FALSE, 4);

  -- Q13: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「比較」の意味は何ですか？', '比較(ひかく)は「비교」という意味のN3名詞です。', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비교', TRUE, 1),
    (gen_random_uuid(), q_id, '비용', FALSE, 2),
    (gen_random_uuid(), q_id, '비밀', FALSE, 3),
    (gen_random_uuid(), q_id, '비판', FALSE, 4);

  -- Q14: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「申し込む」の意味は何ですか？', '申し込む(もうしこむ)は「신청하다」という意味のN3動詞です。', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '신청하다', TRUE, 1),
    (gen_random_uuid(), q_id, '신고하다', FALSE, 2),
    (gen_random_uuid(), q_id, '설명하다', FALSE, 3),
    (gen_random_uuid(), q_id, '소개하다', FALSE, 4);

  -- Q15: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜たばかり」の意味として正しいものは？', '「〜たばかり」は動作が完了して間もないことを表し、「막 ~했다」という意味です。', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '막 ~했다', TRUE, 1),
    (gen_random_uuid(), q_id, '아직 ~하지 않았다', FALSE, 2),
    (gen_random_uuid(), q_id, '항상 ~한다', FALSE, 3),
    (gen_random_uuid(), q_id, '곧 ~할 것이다', FALSE, 4);

  -- Q16: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「割合」の読み方と意味として正しいものは？', '割合(わりあい)は「비율」という意味です。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'わりあい - 비율', TRUE, 1),
    (gen_random_uuid(), q_id, 'かつあい - 활애', FALSE, 2),
    (gen_random_uuid(), q_id, 'わりびき - 할인', FALSE, 3),
    (gen_random_uuid(), q_id, 'かつよう - 활용', FALSE, 4);

  -- Q17: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「参加」の意味は何ですか？', '参加(さんか)は「참가」という意味のN3名詞です。', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '참가', TRUE, 1),
    (gen_random_uuid(), q_id, '참고', FALSE, 2),
    (gen_random_uuid(), q_id, '참석', FALSE, 3),
    (gen_random_uuid(), q_id, '산책', FALSE, 4);

  -- Q18: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ために」の意味として正しいものは？（目的）', '「〜ために」は目的を表し、「~하기 위해서」という意味です。', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하기 위해서', TRUE, 1),
    (gen_random_uuid(), q_id, '~했기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '~하는 동안', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 후에', FALSE, 4);

  -- Q19: N3 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「この店は安くておいしいので、いつも人が多いです。」\nこの店について正しいものは？', '「安くておいしい」から値段が安くて味が良いことがわかります。「いつも人が多い」から人気があることがわかります。', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가격이 싸고 맛있어서 항상 사람이 많다', TRUE, 1),
    (gen_random_uuid(), q_id, '비싸지만 맛있어서 사람이 많다', FALSE, 2),
    (gen_random_uuid(), q_id, '싸지만 맛이 없어서 사람이 적다', FALSE, 3),
    (gen_random_uuid(), q_id, '비싸고 맛이 없지만 사람이 많다', FALSE, 4);

  -- Q20: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「確認」の意味は何ですか？', '確認(かくにん)は「확인」という意味のN3名詞です。', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '확인', TRUE, 1),
    (gen_random_uuid(), q_id, '확실', FALSE, 2),
    (gen_random_uuid(), q_id, '확대', FALSE, 3),
    (gen_random_uuid(), q_id, '확보', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「受付」の読み方と意味として正しいものは？', '受付(うけつけ)は「접수/안내 데스크」という意味です。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'うけつけ - 접수', TRUE, 1),
    (gen_random_uuid(), q_id, 'じゅふ - 수부', FALSE, 2),
    (gen_random_uuid(), q_id, 'うけとり - 수취', FALSE, 3),
    (gen_random_uuid(), q_id, 'じゅけん - 수험', FALSE, 4);

  -- Q23: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「調べる」の意味は何ですか？', '調べる(しらべる)は「조사하다/알아보다」という意味のN3動詞です。', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조사하다', TRUE, 1),
    (gen_random_uuid(), q_id, '준비하다', FALSE, 2),
    (gen_random_uuid(), q_id, '정리하다', FALSE, 3),
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
    (gen_random_uuid(), q_id, '예정', TRUE, 1),
    (gen_random_uuid(), q_id, '예약', FALSE, 2),
    (gen_random_uuid(), q_id, '예상', FALSE, 3),
    (gen_random_uuid(), q_id, '예산', FALSE, 4);

  -- Q26: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「紹介」の読み方と意味として正しいものは？', '紹介(しょうかい)は「소개」という意味です。', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しょうかい - 소개', TRUE, 1),
    (gen_random_uuid(), q_id, 'しょうがい - 장애', FALSE, 2),
    (gen_random_uuid(), q_id, 'しょうひ - 소비', FALSE, 3),
    (gen_random_uuid(), q_id, 'しょうめい - 증명', FALSE, 4);

  -- Q27: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜そうだ」（様態）の使い方として正しいものは？\n例：おいしそうだ', '「〜そうだ」（様態）は見た目からの推測を表し、「~할 것 같다/~해 보인다」という意味です。', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~해 보인다 (외관 추측)', TRUE, 1),
    (gen_random_uuid(), q_id, '~라고 한다 (전문)', FALSE, 2),
    (gen_random_uuid(), q_id, '~인 것 같다 (추측)', FALSE, 3),
    (gen_random_uuid(), q_id, '~하기 쉽다 (경향)', FALSE, 4);

  -- Q28: N3 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「明日は雨が降るかもしれないので、傘を持って行ったほうがいいですよ。」\nこの文は何を言っていますか？', '「雨が降るかもしれない」は可能性、「持って行ったほうがいい」はアドバイスを表します。', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비가 올 수 있으니 우산을 가져가는 게 좋다', TRUE, 1),
    (gen_random_uuid(), q_id, '내일은 반드시 비가 온다', FALSE, 2),
    (gen_random_uuid(), q_id, '우산을 사야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '비가 오지 않을 것이다', FALSE, 4);

  -- Q29: N3 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「準備」の意味は何ですか？', '準備(じゅんび)は「준비」という意味のN3名詞です。', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '준비', TRUE, 1),
    (gen_random_uuid(), q_id, '주의', FALSE, 2),
    (gen_random_uuid(), q_id, '주문', FALSE, 3),
    (gen_random_uuid(), q_id, '주장', FALSE, 4);

  -- Q30: N3 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜はずだ」の意味として正しいものは？', '「〜はずだ」は確信のある推測を表し、「~일 것이다/~할 것이다」という意味です。', 1, 30, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~일 것이다 (확신 추측)', TRUE, 1),
    (gen_random_uuid(), q_id, '~해야 한다 (의무)', FALSE, 2),
    (gen_random_uuid(), q_id, '~하고 싶다 (희망)', FALSE, 3),
    (gen_random_uuid(), q_id, '~인 것 같다 (불확실 추측)', FALSE, 4);

  -- ==========================================
  -- MEDIUM (N2) - 30 questions (sort_order 31-60)
  -- ==========================================

  -- Q31: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「把握する」の意味は何ですか？', '把握する(はあくする)は「파악하다」という意味のN2動詞です。', 1, 31, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '파악하다', TRUE, 1),
    (gen_random_uuid(), q_id, '포기하다', FALSE, 2),
    (gen_random_uuid(), q_id, '파괴하다', FALSE, 3),
    (gen_random_uuid(), q_id, '판단하다', FALSE, 4);

  -- Q32: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜にもかかわらず」の意味として正しいものは？', '「〜にもかかわらず」は逆接を表し、「~임에도 불구하고」という意味です。', 1, 32, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~임에도 불구하고', TRUE, 1),
    (gen_random_uuid(), q_id, '~하기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '~하는 한', FALSE, 3),
    (gen_random_uuid(), q_id, '~하자마자', FALSE, 4);

  -- Q33: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「対応」の意味は何ですか？', '対応(たいおう)は「대응」という意味のN2名詞です。', 1, 33, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '대응', TRUE, 1),
    (gen_random_uuid(), q_id, '대답', FALSE, 2),
    (gen_random_uuid(), q_id, '대상', FALSE, 3),
    (gen_random_uuid(), q_id, '대회', FALSE, 4);

  -- Q34: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「影響」の読み方と意味として正しいものは？', '影響(えいきょう)は「영향」という意味です。', 1, 34, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'えいきょう - 영향', TRUE, 1),
    (gen_random_uuid(), q_id, 'えいぎょう - 영업', FALSE, 2),
    (gen_random_uuid(), q_id, 'えいが - 영화', FALSE, 3),
    (gen_random_uuid(), q_id, 'えいよう - 영양', FALSE, 4);

  -- Q35: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜わけにはいかない」の意味として正しいものは？', '「〜わけにはいかない」は社会的・道義的理由で「~할 수 없다」という意味です。', 1, 35, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~할 수 없다 (도의적 이유)', TRUE, 1),
    (gen_random_uuid(), q_id, '~할 필요가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '~해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '~하고 싶지 않다', FALSE, 4);

  -- Q36: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「維持」の意味は何ですか？', '維持(いじ)は「유지」という意味のN2名詞です。', 1, 36, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '유지', TRUE, 1),
    (gen_random_uuid(), q_id, '의지', FALSE, 2),
    (gen_random_uuid(), q_id, '위치', FALSE, 3),
    (gen_random_uuid(), q_id, '이지', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「効率」の読み方と意味として正しいものは？', '効率(こうりつ)は「효율」という意味です。', 1, 38, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こうりつ - 효율', TRUE, 1),
    (gen_random_uuid(), q_id, 'こうか - 효과', FALSE, 2),
    (gen_random_uuid(), q_id, 'こうけん - 공헌', FALSE, 3),
    (gen_random_uuid(), q_id, 'こうせい - 구성', FALSE, 4);

  -- Q39: N2 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「最近、リモートワークが普及したことにより、通勤時間が減り、その分を自己啓発に充てる人が増えている。」\nこの文の主な内容は？', '文章はリモートワークの普及→通勤時間の減少→自己啓発時間の増加という因果関係を述べています。', 1, 39, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재택근무 확산으로 통근 시간이 줄고 자기계발에 시간을 쓰는 사람이 늘었다', TRUE, 1),
    (gen_random_uuid(), q_id, '재택근무로 인해 운동하는 사람이 줄었다', FALSE, 2),
    (gen_random_uuid(), q_id, '통근 시간이 늘어서 자기계발을 못 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '재택근무는 효율이 낮다', FALSE, 4);

  -- Q40: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「検討」の意味は何ですか？', '検討(けんとう)は「검토」という意味のN2名詞です。', 1, 40, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '검토', TRUE, 1),
    (gen_random_uuid(), q_id, '검사', FALSE, 2),
    (gen_random_uuid(), q_id, '검증', FALSE, 3),
    (gen_random_uuid(), q_id, '견학', FALSE, 4);

  -- Q41: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜に伴い」の意味として正しいものは？', '「〜に伴い」は「~에 따라/~와 함께」という意味です。', 1, 41, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 따라 / ~와 함께', TRUE, 1),
    (gen_random_uuid(), q_id, '~에 반해서', FALSE, 2),
    (gen_random_uuid(), q_id, '~보다 먼저', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 후에야', FALSE, 4);

  -- Q42: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「実施」の意味は何ですか？', '実施(じっし)は「실시」という意味のN2名詞です。', 1, 42, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '실시', TRUE, 1),
    (gen_random_uuid(), q_id, '실험', FALSE, 2),
    (gen_random_uuid(), q_id, '실제', FALSE, 3),
    (gen_random_uuid(), q_id, '실력', FALSE, 4);

  -- Q43: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「傾向」の読み方と意味として正しいものは？', '傾向(けいこう)は「경향」という意味です。', 1, 43, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けいこう - 경향', TRUE, 1),
    (gen_random_uuid(), q_id, 'けいけん - 경험', FALSE, 2),
    (gen_random_uuid(), q_id, 'けいえい - 경영', FALSE, 3),
    (gen_random_uuid(), q_id, 'けいさん - 계산', FALSE, 4);

  -- Q44: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜一方で」の意味として正しいものは？', '「〜一方で」は対比を表し、「~하는 한편 / ~하는 반면에」という意味です。', 1, 44, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하는 한편 / ~하는 반면에', TRUE, 1),
    (gen_random_uuid(), q_id, '~하기 위해서', FALSE, 2),
    (gen_random_uuid(), q_id, '~한 결과', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 이상', FALSE, 4);

  -- Q45: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「提案」の意味は何ですか？', '提案(ていあん)は「제안」という意味のN2名詞です。', 1, 45, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '제안', TRUE, 1),
    (gen_random_uuid(), q_id, '제출', FALSE, 2),
    (gen_random_uuid(), q_id, '제한', FALSE, 3),
    (gen_random_uuid(), q_id, '제작', FALSE, 4);

  -- Q46: N2 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「日本企業では、個人の成果だけでなく、チームへの貢献度も評価の対象となることが多い。そのため、協調性が重視される傾向がある。」\nこの文から分かることは？', '日本企業の評価基準についての文章で、チームへの貢献度と協調性の重要性を述べています。', 1, 46, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본 기업은 개인 성과뿐 아니라 팀 공헌도도 평가하므로 협조성이 중시된다', TRUE, 1),
    (gen_random_uuid(), q_id, '일본 기업은 개인 성과만 평가한다', FALSE, 2),
    (gen_random_uuid(), q_id, '팀 공헌도는 평가에 포함되지 않는다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본 기업은 협조성을 중시하지 않는다', FALSE, 4);

  -- Q47: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「改善」の意味は何ですか？', '改善(かいぜん)は「개선」という意味のN2名詞です。', 1, 47, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개선', TRUE, 1),
    (gen_random_uuid(), q_id, '개발', FALSE, 2),
    (gen_random_uuid(), q_id, '개정', FALSE, 3),
    (gen_random_uuid(), q_id, '개시', FALSE, 4);

  -- Q48: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜をはじめ」の意味として正しいものは？', '「〜をはじめ」は代表例を挙げる表現で、「~을 비롯해서」という意味です。', 1, 48, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~을 비롯해서', TRUE, 1),
    (gen_random_uuid(), q_id, '~을 제외하고', FALSE, 2),
    (gen_random_uuid(), q_id, '~을 시작으로', FALSE, 3),
    (gen_random_uuid(), q_id, '~만', FALSE, 4);

  -- Q49: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「基準」の読み方と意味として正しいものは？', '基準(きじゅん)は「기준」という意味です。', 1, 49, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'きじゅん - 기준', TRUE, 1),
    (gen_random_uuid(), q_id, 'きそ - 기초', FALSE, 2),
    (gen_random_uuid(), q_id, 'きほん - 기본', FALSE, 3),
    (gen_random_uuid(), q_id, 'きかく - 기획', FALSE, 4);

  -- Q50: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「納得」の意味は何ですか？', '納得(なっとく)は「납득/이해」という意味のN2名詞です。', 1, 50, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '납득 / 이해', TRUE, 1),
    (gen_random_uuid(), q_id, '납부', FALSE, 2),
    (gen_random_uuid(), q_id, '납품', FALSE, 3),
    (gen_random_uuid(), q_id, '낙관', FALSE, 4);

  -- Q51: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ざるを得ない」の意味として正しいものは？', '「〜ざるを得ない」は「~하지 않을 수 없다」という意味です。', 1, 51, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하지 않을 수 없다', TRUE, 1),
    (gen_random_uuid(), q_id, '~할 필요가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '~하면 안 된다', FALSE, 3),
    (gen_random_uuid(), q_id, '~할 수 있다', FALSE, 4);

  -- Q52: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「方針」の意味は何ですか？', '方針(ほうしん)は「방침」という意味のN2名詞です。', 1, 52, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방침', TRUE, 1),
    (gen_random_uuid(), q_id, '방법', FALSE, 2),
    (gen_random_uuid(), q_id, '방문', FALSE, 3),
    (gen_random_uuid(), q_id, '방향', FALSE, 4);

  -- Q53: N2 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「プロジェクトの締め切りが近づいているにもかかわらず、まだ要件定義が完了していない。このままでは納期に間に合わない恐れがある。」\nこの文の状況として正しいものは？', '締め切りが近い+要件定義未完了→納期遅延の恐れがあるという状況を読み取る問題です。', 1, 53, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '마감이 다가오는데 요건 정의가 안 끝나서 납기에 늦을 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '프로젝트가 순조롭게 진행되고 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '요건 정의가 이미 완료되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '납기에 여유가 있다', FALSE, 4);

  -- Q54: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「適切」の読み方と意味として正しいものは？', '適切(てきせつ)は「적절」という意味です。', 1, 54, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'てきせつ - 적절', TRUE, 1),
    (gen_random_uuid(), q_id, 'てきとう - 적당', FALSE, 2),
    (gen_random_uuid(), q_id, 'てきよう - 적용', FALSE, 3),
    (gen_random_uuid(), q_id, 'てきかく - 적격', FALSE, 4);

  -- Q55: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜に基づいて」の意味として正しいものは？', '「〜に基づいて」は「~에 기반하여/~에 근거하여」という意味です。', 1, 55, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 기반하여 / ~에 근거하여', TRUE, 1),
    (gen_random_uuid(), q_id, '~에 반해서', FALSE, 2),
    (gen_random_uuid(), q_id, '~와 관계없이', FALSE, 3),
    (gen_random_uuid(), q_id, '~을 제외하고', FALSE, 4);

  -- Q56: N2 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「促進」の意味は何ですか？', '促進(そくしん)は「촉진」という意味のN2名詞です。', 1, 56, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '촉진', TRUE, 1),
    (gen_random_uuid(), q_id, '측정', FALSE, 2),
    (gen_random_uuid(), q_id, '축소', FALSE, 3),
    (gen_random_uuid(), q_id, '추진', FALSE, 4);

  -- Q57: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜上で」の意味として正しいものは？（条件）', '「〜上で」は条件を示す表現で、「~하는 데 있어서/~한 후에」という意味です。', 1, 57, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하는 데 있어서', TRUE, 1),
    (gen_random_uuid(), q_id, '~하는 동안에', FALSE, 2),
    (gen_random_uuid(), q_id, '~하기 전에', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 대신에', FALSE, 4);

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
    (gen_random_uuid(), q_id, '유연 근무제 도입으로 직원들이 자신의 라이프스타일에 맞춰 근무할 수 있게 되었다', TRUE, 1),
    (gen_random_uuid(), q_id, '모든 기업이 유연 근무제를 의무적으로 도입했다', FALSE, 2),
    (gen_random_uuid(), q_id, '유연 근무제는 직원들에게 인기가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '근무 시간이 더 길어졌다', FALSE, 4);

  -- Q60: N2 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜に関して」の意味として正しいものは？', '「〜に関して」は「~에 관해서」という意味です。', 1, 60, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~에 관해서', TRUE, 1),
    (gen_random_uuid(), q_id, '~에 대해서', FALSE, 2),
    (gen_random_uuid(), q_id, '~에 의해서', FALSE, 3),
    (gen_random_uuid(), q_id, '~에 따라서', FALSE, 4);

  -- ==========================================
  -- HARD (N1) - 30 questions (sort_order 61-90)
  -- ==========================================

  -- Q61: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「顕著」の読み方と意味として正しいものは？', '顕著(けんちょ)は「뚜렷한/현저한」という意味のN1語彙です。', 1, 61, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けんちょ - 뚜렷한/현저한', TRUE, 1),
    (gen_random_uuid(), q_id, 'けんめい - 현명한', FALSE, 2),
    (gen_random_uuid(), q_id, 'げんじょう - 현상', FALSE, 3),
    (gen_random_uuid(), q_id, 'けんぜん - 건전한', FALSE, 4);

  -- Q62: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜をもって」の意味として正しいものは？（手段）', '「〜をもって」は手段や期限を表し、「~으로써/~을 가지고」という意味です。', 1, 62, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~으로써 / ~을 가지고', TRUE, 1),
    (gen_random_uuid(), q_id, '~을 위해서', FALSE, 2),
    (gen_random_uuid(), q_id, '~에 의하면', FALSE, 3),
    (gen_random_uuid(), q_id, '~에도 불구하고', FALSE, 4);

  -- Q63: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「齟齬」の意味は何ですか？', '齟齬(そご)は「어긋남/불일치」という意味のN1語彙です。', 1, 63, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '어긋남 / 불일치', TRUE, 1),
    (gen_random_uuid(), q_id, '조화 / 일치', FALSE, 2),
    (gen_random_uuid(), q_id, '갈등 / 분쟁', FALSE, 3),
    (gen_random_uuid(), q_id, '오해 / 착각', FALSE, 4);

  -- Q64: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜たりとも〜ない」の意味として正しいものは？', '「〜たりとも〜ない」は「단 ~도 ~않다」という強い否定を表します。', 1, 64, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '단 ~도 ~않다 (강한 부정)', TRUE, 1),
    (gen_random_uuid(), q_id, '~하거나 ~하거나', FALSE, 2),
    (gen_random_uuid(), q_id, '~만큼 ~하다', FALSE, 3),
    (gen_random_uuid(), q_id, '~든지 ~든지', FALSE, 4);

  -- Q65: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「瞬時」の読み方と意味として正しいものは？', '瞬時(しゅんじ)は「순간/순식간」という意味です。', 1, 65, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しゅんじ - 순간/순식간', TRUE, 1),
    (gen_random_uuid(), q_id, 'しゅんかん - 순간', FALSE, 2),
    (gen_random_uuid(), q_id, 'ぜんじ - 전시', FALSE, 3),
    (gen_random_uuid(), q_id, 'りんじ - 임시', FALSE, 4);

  -- Q66: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜んがために」の意味として正しいものは？', '「〜んがために」は強い目的を表し、「~하기 위해서」という意味の硬い文語表現です。', 1, 66, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하기 위해서 (문어적/강한 목적)', TRUE, 1),
    (gen_random_uuid(), q_id, '~했기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '~할 수밖에 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 적이 있다', FALSE, 4);

  -- Q67: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「脆弱」の意味は何ですか？', '脆弱(ぜいじゃく)は「취약」という意味のN1語彙です。IT分野でもよく使われます。', 1, 67, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취약', TRUE, 1),
    (gen_random_uuid(), q_id, '강력', FALSE, 2),
    (gen_random_uuid(), q_id, '유연', FALSE, 3),
    (gen_random_uuid(), q_id, '안정', FALSE, 4);

  -- Q68: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「技術革新が加速する現代において、既存のスキルセットに安住することなく、常に自己研鑽を怠らない姿勢が求められる。特にIT業界では、新技術の台頭により、数年前の知識が陳腐化することも珍しくない。」\n筆者の主張として最も適切なものは？', '技術革新時代における継続的学習の重要性を述べた文章です。', 1, 68, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'IT 업계에서는 기존 기술에 안주하지 말고 끊임없이 자기연찬해야 한다', TRUE, 1),
    (gen_random_uuid(), q_id, '기존 기술만 잘 알면 충분하다', FALSE, 2),
    (gen_random_uuid(), q_id, '새로운 기술은 배울 필요가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, 'IT 업계의 기술 변화는 느리다', FALSE, 4);

  -- Q69: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜を余儀なくされる」の意味として正しいものは？', '「〜を余儀なくされる」は「~하지 않을 수 없게 되다/~을 강요받다」という意味です。', 1, 69, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하지 않을 수 없게 되다 / ~을 강요받다', TRUE, 1),
    (gen_random_uuid(), q_id, '~할 여유가 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '~하고 싶어지다', FALSE, 3),
    (gen_random_uuid(), q_id, '~할 필요가 없어지다', FALSE, 4);

  -- Q70: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「冗長」の読み方と意味として正しいものは？', '冗長(じょうちょう)は「중복된/장황한」という意味です。IT用語として「冗長化」などで使われます。', 1, 70, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'じょうちょう - 장황한/중복된', TRUE, 1),
    (gen_random_uuid(), q_id, 'じょうきょう - 상황', FALSE, 2),
    (gen_random_uuid(), q_id, 'じょうほう - 정보', FALSE, 3),
    (gen_random_uuid(), q_id, 'じょうけん - 조건', FALSE, 4);

  -- Q71: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「逸脱」の意味は何ですか？', '逸脱(いつだつ)は「일탈/이탈」という意味のN1語彙です。', 1, 71, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일탈 / 이탈', TRUE, 1),
    (gen_random_uuid(), q_id, '탈출', FALSE, 2),
    (gen_random_uuid(), q_id, '도주', FALSE, 3),
    (gen_random_uuid(), q_id, '회피', FALSE, 4);

  -- Q72: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ともなると」の意味として正しいものは？', '「〜ともなると」は「~정도가 되면」という意味で、ある段階に達した場合を表します。', 1, 72, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~정도가 되면 / ~쯤 되면', TRUE, 1),
    (gen_random_uuid(), q_id, '~하더라도', FALSE, 2),
    (gen_random_uuid(), q_id, '~함과 동시에', FALSE, 3),
    (gen_random_uuid(), q_id, '~하기는커녕', FALSE, 4);

  -- Q73: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「俯瞰」の読み方と意味として正しいものは？', '俯瞰(ふかん)は「부감/조감(높은 곳에서 내려다봄)」という意味です。', 1, 73, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ふかん - 부감/조감', TRUE, 1),
    (gen_random_uuid(), q_id, 'びかん - 미관', FALSE, 2),
    (gen_random_uuid(), q_id, 'ぼうかん - 방관', FALSE, 3),
    (gen_random_uuid(), q_id, 'たいかん - 체감', FALSE, 4);

  -- Q74: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜にほかならない」の意味として正しいものは？', '「〜にほかならない」は「다름 아닌 ~이다/바로 ~이다」という意味です。', 1, 74, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '다름 아닌 ~이다 / 바로 ~이다', TRUE, 1),
    (gen_random_uuid(), q_id, '~가 아니다', FALSE, 2),
    (gen_random_uuid(), q_id, '~일 리가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '~와 다르다', FALSE, 4);

  -- Q75: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「乖離」の意味は何ですか？', '乖離(かいり)は「괴리/이탈」という意味のN1語彙です。', 1, 75, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '괴리 / 이탈', TRUE, 1),
    (gen_random_uuid(), q_id, '일치 / 합치', FALSE, 2),
    (gen_random_uuid(), q_id, '가까움 / 근접', FALSE, 3),
    (gen_random_uuid(), q_id, '연결 / 접속', FALSE, 4);

  -- Q76: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「システム開発においては、要件の曖昧さが後工程での手戻りを招く最大の要因であるとされる。したがって、上流工程における要件定義の精度を高めることが、プロジェクト成功の鍵を握ると言っても過言ではない。」\n筆者の主張は？', '要件定義の重要性とプロジェクト成功の関係について述べた文章です。', 1, 76, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상류 공정에서의 요건 정의 정확도가 프로젝트 성공의 열쇠이다', TRUE, 1),
    (gen_random_uuid(), q_id, '하류 공정이 가장 중요하다', FALSE, 2),
    (gen_random_uuid(), q_id, '요건이 애매해도 문제없다', FALSE, 3),
    (gen_random_uuid(), q_id, '요건 정의는 필요하지 않다', FALSE, 4);

  -- Q77: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜ないまでも」の意味として正しいものは？', '「〜ないまでも」は「~하지는 못하더라도」という意味です。', 1, 77, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~하지는 못하더라도', TRUE, 1),
    (gen_random_uuid(), q_id, '~하지 않으면', FALSE, 2),
    (gen_random_uuid(), q_id, '~하지 않는 한', FALSE, 3),
    (gen_random_uuid(), q_id, '~하지 않아도', FALSE, 4);

  -- Q78: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「恣意的」の読み方と意味として正しいものは？', '恣意的(しいてき)は「자의적인」という意味です。', 1, 78, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しいてき - 자의적인', TRUE, 1),
    (gen_random_uuid(), q_id, 'こういてき - 공의적인', FALSE, 2),
    (gen_random_uuid(), q_id, 'けいいてき - 경의적인', FALSE, 3),
    (gen_random_uuid(), q_id, 'ごういてき - 합의적인', FALSE, 4);

  -- Q79: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜をおいて他にない」の意味として正しいものは？', '「〜をおいて他にない」は「~을 제외하고는 없다/~밖에 없다」という意味です。', 1, 79, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~을 제외하고는 없다 / ~밖에 없다', TRUE, 1),
    (gen_random_uuid(), q_id, '~을 놓아두다', FALSE, 2),
    (gen_random_uuid(), q_id, '~이 아니다', FALSE, 3),
    (gen_random_uuid(), q_id, '~을 대신하다', FALSE, 4);

  -- Q80: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「踏襲」の意味は何ですか？', '踏襲(とうしゅう)は「답습/그대로 따름」という意味のN1語彙です。', 1, 80, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '답습 / 그대로 따름', TRUE, 1),
    (gen_random_uuid(), q_id, '혁신 / 개혁', FALSE, 2),
    (gen_random_uuid(), q_id, '폐지 / 중단', FALSE, 3),
    (gen_random_uuid(), q_id, '변경 / 수정', FALSE, 4);

  -- Q81: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「グローバル化が進展する中、異文化間コミュニケーション能力の涵養は喫緊の課題である。単に語学力を磨くのみならず、相手の文化的背景に対する深い理解と尊重の念を持つことが不可欠である。」\nこの文の主旨は？', 'グローバル化時代の異文化コミュニケーション能力の重要性についての論述です。', 1, 81, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '어학 능력뿐 아니라 문화적 배경에 대한 이해와 존중이 필요하다', TRUE, 1),
    (gen_random_uuid(), q_id, '어학 능력만 있으면 충분하다', FALSE, 2),
    (gen_random_uuid(), q_id, '글로벌화는 진전되지 않고 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '이문화 커뮤니케이션은 중요하지 않다', FALSE, 4);

  -- Q82: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜が最後」の意味として正しいものは？', '「〜が最後」は「한번 ~하면 (그 후에는 되돌릴 수 없다)」という意味です。', 1, 82, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '한번 ~하면 (되돌릴 수 없다)', TRUE, 1),
    (gen_random_uuid(), q_id, '~가 마지막이다', FALSE, 2),
    (gen_random_uuid(), q_id, '~이 가장 좋다', FALSE, 3),
    (gen_random_uuid(), q_id, '~한 적이 있다', FALSE, 4);

  -- Q83: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「網羅」の読み方と意味として正しいものは？', '網羅(もうら)は「망라/모두 포함」という意味です。', 1, 83, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もうら - 망라/모두 포함', TRUE, 1),
    (gen_random_uuid(), q_id, 'あみら - 어미라', FALSE, 2),
    (gen_random_uuid(), q_id, 'ぼうら - 방라', FALSE, 3),
    (gen_random_uuid(), q_id, 'もうろ - 모로', FALSE, 4);

  -- Q84: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「矛盾」の意味は何ですか？', '矛盾(むじゅん)は「모순」という意味のN1語彙です。', 1, 84, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모순', TRUE, 1),
    (gen_random_uuid(), q_id, '조화', FALSE, 2),
    (gen_random_uuid(), q_id, '균형', FALSE, 3),
    (gen_random_uuid(), q_id, '일관', FALSE, 4);

  -- Q85: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜と相まって」の意味として正しいものは？', '「〜と相まって」は「~와 어우러져/~와 합쳐져서」という意味です。', 1, 85, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~와 어우러져 / ~와 합쳐져서', TRUE, 1),
    (gen_random_uuid(), q_id, '~와 대조적으로', FALSE, 2),
    (gen_random_uuid(), q_id, '~와 무관하게', FALSE, 3),
    (gen_random_uuid(), q_id, '~와 반대로', FALSE, 4);

  -- Q86: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「アジャイル開発手法の浸透に伴い、ウォーターフォール型の開発プロセスを墨守することの是非が問われている。しかしながら、大規模なシステム開発においては、依然として綿密な計画に基づく開発手法が有効な場面も少なくない。」\nこの文の要旨は？', 'アジャイルとウォーターフォールの使い分けについての議論です。', 1, 86, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '애자일이 확산되고 있지만 대규모 개발에서는 여전히 계획 기반 개발이 유효한 경우가 많다', TRUE, 1),
    (gen_random_uuid(), q_id, '워터폴 개발은 완전히 폐기해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '애자일 개발은 효과가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '대규모 시스템에는 애자일만 사용해야 한다', FALSE, 4);

  -- Q87: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「簡潔」の読み方と意味として正しいものは？', '簡潔(かんけつ)は「간결」という意味です。', 1, 87, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'かんけつ - 간결', TRUE, 1),
    (gen_random_uuid(), q_id, 'かんぜん - 완전', FALSE, 2),
    (gen_random_uuid(), q_id, 'かんたん - 간단', FALSE, 3),
    (gen_random_uuid(), q_id, 'かんそう - 감상', FALSE, 4);

  -- Q88: N1 문법
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「〜とは言え」の意味として正しいものは？', '「〜とは言え」は「~라고는 하지만/~이기는 하지만」という逆接を表します。', 1, 88, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '~라고는 하지만 / ~이기는 하지만', TRUE, 1),
    (gen_random_uuid(), q_id, '~라고 말하다', FALSE, 2),
    (gen_random_uuid(), q_id, '~라고 들었다', FALSE, 3),
    (gen_random_uuid(), q_id, '~가 당연하다', FALSE, 4);

  -- Q89: N1 어휘
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「暫定的」の意味は何ですか？', '暫定的(ざんていてき)は「잠정적인」という意味のN1語彙です。', 1, 89, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잠정적인', TRUE, 1),
    (gen_random_uuid(), q_id, '영구적인', FALSE, 2),
    (gen_random_uuid(), q_id, '확정적인', FALSE, 3),
    (gen_random_uuid(), q_id, '일시적인', FALSE, 4);

  -- Q90: N1 독해
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '次の文を読んで正しいものを選んでください。\n「セキュリティ対策は、往々にして利便性とのトレードオフの関係にある。厳格な認証プロセスを導入すれば安全性は向上するが、ユーザーの操作性は低下する。両者のバランスをいかに取るかが、設計者の腕の見せ所である。」\nこの文の主旨は？', 'セキュリティと利便性のバランスの重要性についての文章です。', 1, 90, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보안과 편의성의 균형을 어떻게 잡을지가 설계자의 역량이다', TRUE, 1),
    (gen_random_uuid(), q_id, '보안을 최우선으로 해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '편의성이 보안보다 중요하다', FALSE, 3),
    (gen_random_uuid(), q_id, '보안과 편의성은 관계가 없다', FALSE, 4);

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
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「実装する」(じっそうする) の意味は？', '実装する(じっそうする)は「구현하다」という意味のIT用語です。', 1, 1, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '구현하다', TRUE, 1),
    (gen_random_uuid(), q_id, '설계하다', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트하다', FALSE, 3),
    (gen_random_uuid(), q_id, '배포하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「環境構築」の意味は？', '環境構築(かんきょうこうちく)は「환경 구축」という意味です。開発環境のセットアップを指します。', 1, 2, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '환경 구축', TRUE, 1),
    (gen_random_uuid(), q_id, '환경 파괴', FALSE, 2),
    (gen_random_uuid(), q_id, '환경 보전', FALSE, 3),
    (gen_random_uuid(), q_id, '환경 변수', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「画面」(がめん) の意味は？', '画面(がめん)は「화면」という意味のIT基本用語です。', 1, 3, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '화면', TRUE, 1),
    (gen_random_uuid(), q_id, '화상', FALSE, 2),
    (gen_random_uuid(), q_id, '그림', FALSE, 3),
    (gen_random_uuid(), q_id, '사진', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「修正」(しゅうせい) の意味は？', '修正(しゅうせい)は「수정」という意味です。バグ修正などで使います。', 1, 4, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '수정', TRUE, 1),
    (gen_random_uuid(), q_id, '삭제', FALSE, 2),
    (gen_random_uuid(), q_id, '추가', FALSE, 3),
    (gen_random_uuid(), q_id, '작성', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「不具合」(ふぐあい) の意味は？', '不具合(ふぐあい)は「버그/결함」という意味です。ソフトウェアの問題を指します。', 1, 5, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버그 / 결함', TRUE, 1),
    (gen_random_uuid(), q_id, '기능', FALSE, 2),
    (gen_random_uuid(), q_id, '사양', FALSE, 3),
    (gen_random_uuid(), q_id, '업데이트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「仕様」(しよう) の意味は？', '仕様(しよう)は「사양/스펙」という意味のIT用語です。', 1, 6, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사양 / 스펙', TRUE, 1),
    (gen_random_uuid(), q_id, '사용법', FALSE, 2),
    (gen_random_uuid(), q_id, '시험', FALSE, 3),
    (gen_random_uuid(), q_id, '설정', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「テスト」の意味は？', 'テストはソフトウェアの「테스트」を意味します。', 1, 7, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '테스트', TRUE, 1),
    (gen_random_uuid(), q_id, '배포', FALSE, 2),
    (gen_random_uuid(), q_id, '설계', FALSE, 3),
    (gen_random_uuid(), q_id, '분석', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「データベース」の意味は？', 'データベースは「데이터베이스」を意味するIT基本用語です。', 1, 8, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터 분석', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 센터', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터 전송', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「設計」(せっけい) の意味は？', '設計(せっけい)は「설계」という意味のIT用語です。', 1, 9, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '설계', TRUE, 1),
    (gen_random_uuid(), q_id, '설치', FALSE, 2),
    (gen_random_uuid(), q_id, '설정', FALSE, 3),
    (gen_random_uuid(), q_id, '설명', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「開発」(かいはつ) の意味は？', '開発(かいはつ)は「개발」という意味です。ソフトウェア開発の基本用語です。', 1, 10, 'easy', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '개발', TRUE, 1),
    (gen_random_uuid(), q_id, '개선', FALSE, 2),
    (gen_random_uuid(), q_id, '개시', FALSE, 3),
    (gen_random_uuid(), q_id, '개요', FALSE, 4);

  -- vocab medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「結合テスト」(けつごうテスト) の意味は？', '結合テストは「결합 테스트/통합 테스트」で、モジュール間の連携を確認するテストです。', 1, 11, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결합 테스트 / 통합 테스트', TRUE, 1),
    (gen_random_uuid(), q_id, '단위 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '성능 테스트', FALSE, 3),
    (gen_random_uuid(), q_id, '회귀 테스트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「要件定義」(ようけんていぎ) の意味は？', '要件定義は「요건 정의」で、システム開発の最初の工程です。', 1, 12, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요건 정의', TRUE, 1),
    (gen_random_uuid(), q_id, '기본 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '상세 설계', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 리뷰', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「排他制御」(はいたせいぎょ) の意味は？', '排他制御は「배타 제어」で、同時アクセスを制御する仕組みです。', 1, 13, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배타 제어 (동시 접근 제어)', TRUE, 1),
    (gen_random_uuid(), q_id, '접근 제한', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 암호화', FALSE, 3),
    (gen_random_uuid(), q_id, '캐시 관리', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「冗長化」(じょうちょうか) の意味は？', '冗長化は「이중화/다중화」で、システムの可用性を高める手法です。', 1, 14, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이중화 / 다중화', TRUE, 1),
    (gen_random_uuid(), q_id, '최적화', FALSE, 2),
    (gen_random_uuid(), q_id, '간소화', FALSE, 3),
    (gen_random_uuid(), q_id, '자동화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「脆弱性」(ぜいじゃくせい) の意味は？', '脆弱性は「취약성」で、セキュリティの弱点を指します。', 1, 15, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '취약성', TRUE, 1),
    (gen_random_uuid(), q_id, '안전성', FALSE, 2),
    (gen_random_uuid(), q_id, '신뢰성', FALSE, 3),
    (gen_random_uuid(), q_id, '확장성', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「納品」(のうひん) の意味は？', '納品は「납품」で、成果物を顧客に引き渡すことです。', 1, 16, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '납품', TRUE, 1),
    (gen_random_uuid(), q_id, '발주', FALSE, 2),
    (gen_random_uuid(), q_id, '수주', FALSE, 3),
    (gen_random_uuid(), q_id, '견적', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「工数」(こうすう) の意味は？', '工数は「공수/인건비」で、作業にかかる人月を表します。', 1, 17, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공수 (작업량/인월)', TRUE, 1),
    (gen_random_uuid(), q_id, '공정', FALSE, 2),
    (gen_random_uuid(), q_id, '공장', FALSE, 3),
    (gen_random_uuid(), q_id, '공통', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「外部設計」(がいぶせっけい) の意味は？', '外部設計は「외부 설계」で、ユーザーインターフェースの設計を指します。', 1, 18, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '외부 설계 (UI/UX 설계)', TRUE, 1),
    (gen_random_uuid(), q_id, '내부 설계', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 설계', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크 설계', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「進捗」(しんちょく) の意味は？', '進捗は「진척」で、プロジェクトの進行状況を指します。', 1, 19, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '진척 / 진행 상황', TRUE, 1),
    (gen_random_uuid(), q_id, '완료', FALSE, 2),
    (gen_random_uuid(), q_id, '지연', FALSE, 3),
    (gen_random_uuid(), q_id, '보류', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「見積もり」(みつもり) の意味は？', '見積もりは「견적」で、費用や工数の概算を指します。', 1, 20, 'medium', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '견적', TRUE, 1),
    (gen_random_uuid(), q_id, '청구', FALSE, 2),
    (gen_random_uuid(), q_id, '계약', FALSE, 3),
    (gen_random_uuid(), q_id, '발주', FALSE, 4);

  -- vocab hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「可用性」(かようせい) の意味は？', '可用性は「가용성」で、システムが利用可能な状態を維持する度合いです。', 1, 21, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가용성 (Availability)', TRUE, 1),
    (gen_random_uuid(), q_id, '확장성 (Scalability)', FALSE, 2),
    (gen_random_uuid(), q_id, '보안성 (Security)', FALSE, 3),
    (gen_random_uuid(), q_id, '이식성 (Portability)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「疎結合」(そけつごう) の意味は？', '疎結合は「느슨한 결합(Loose Coupling)」で、モジュール間の依存度が低い設計を指します。', 1, 22, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '느슨한 결합 (Loose Coupling)', TRUE, 1),
    (gen_random_uuid(), q_id, '긴밀한 결합 (Tight Coupling)', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 바인딩', FALSE, 3),
    (gen_random_uuid(), q_id, '의존성 주입', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「非機能要件」(ひきのうようけん) の意味は？', '非機能要件は「비기능 요건」で、性能、セキュリティ、可用性などシステムの品質に関する要件です。', 1, 23, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비기능 요건 (성능/보안/가용성 등)', TRUE, 1),
    (gen_random_uuid(), q_id, '기능 요건', FALSE, 2),
    (gen_random_uuid(), q_id, '화면 설계서', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 계획서', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「デグレード」(デグレ) の意味は？', 'デグレードは「디그레이드/기능 퇴행」で、修正により他の機能が壊れることです。', 1, 24, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '디그레이드 (수정으로 인한 기능 퇴행)', TRUE, 1),
    (gen_random_uuid(), q_id, '업그레이드', FALSE, 2),
    (gen_random_uuid(), q_id, '다운그레이드', FALSE, 3),
    (gen_random_uuid(), q_id, '리팩토링', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「方式設計」(ほうしきせっけい) の意味は？', '方式設計は「방식 설계」で、システムの技術的なアーキテクチャを決定する設計工程です。', 1, 25, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '방식 설계 (아키텍처 설계)', TRUE, 1),
    (gen_random_uuid(), q_id, '화면 설계', FALSE, 2),
    (gen_random_uuid(), q_id, 'DB 설계', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크 설계', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「回帰テスト」(かいきテスト) の意味は？', '回帰テストは「회귀 테스트(Regression Test)」で、修正後に既存機能が正常か確認するテストです。', 1, 26, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '회귀 테스트 (Regression Test)', TRUE, 1),
    (gen_random_uuid(), q_id, '단위 테스트 (Unit Test)', FALSE, 2),
    (gen_random_uuid(), q_id, '부하 테스트 (Load Test)', FALSE, 3),
    (gen_random_uuid(), q_id, '인수 테스트 (Acceptance Test)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「死活監視」(しかつかんし) の意味は？', '死活監視は「생사 감시/헬스 체크」で、サーバーが稼働中かを確認する監視です。', 1, 27, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '생사 감시 / 헬스 체크', TRUE, 1),
    (gen_random_uuid(), q_id, '성능 모니터링', FALSE, 2),
    (gen_random_uuid(), q_id, '로그 분석', FALSE, 3),
    (gen_random_uuid(), q_id, '보안 감사', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「負荷分散」(ふかぶんさん) の意味は？', '負荷分散は「부하 분산(Load Balancing)」で、トラフィックを複数サーバーに分散する技術です。', 1, 28, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부하 분산 (Load Balancing)', TRUE, 1),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터 분산', FALSE, 3),
    (gen_random_uuid(), q_id, '캐시 분산', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「暫定対応」(ざんていたいおう) の意味は？', '暫定対応は「임시 대응/워크어라운드」で、恒久対応までの一時的な対処を指します。', 1, 29, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '임시 대응 / 워크어라운드', TRUE, 1),
    (gen_random_uuid(), q_id, '영구 대응', FALSE, 2),
    (gen_random_uuid(), q_id, '긴급 배포', FALSE, 3),
    (gen_random_uuid(), q_id, '롤백', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '「恒久対応」(こうきゅうたいおう) の意味は？', '恒久対応は「영구 대응/근본 해결」で、根本的な問題解決を指します。', 1, 30, 'hard', 'vocab');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '영구 대응 / 근본 해결', TRUE, 1),
    (gen_random_uuid(), q_id, '임시 대응', FALSE, 2),
    (gen_random_uuid(), q_id, '긴급 패치', FALSE, 3),
    (gen_random_uuid(), q_id, '핫픽스', FALSE, 4);

  -- ==========================================
  -- READING category (30 questions, sort_order 31-60)
  -- ==========================================

  -- reading easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「ログイン画面でユーザーIDとパスワードを入力し、ログインボタンを押してください。」\nこの文は何の説明ですか？', 'ログイン手順の説明文です。', 1, 31, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그인 방법 설명', TRUE, 1),
    (gen_random_uuid(), q_id, '회원가입 방법', FALSE, 2),
    (gen_random_uuid(), q_id, '비밀번호 변경 방법', FALSE, 3),
    (gen_random_uuid(), q_id, '로그아웃 방법', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「このボタンをクリックすると、データが保存されます。保存が完了すると、確認メッセージが表示されます。」\nボタンをクリックすると何が起きますか？', 'ボタンクリック後の動作説明を読み取る問題です。', 1, 32, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터가 저장되고 확인 메시지가 표시된다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터가 삭제된다', FALSE, 2),
    (gen_random_uuid(), q_id, '화면이 닫힌다', FALSE, 3),
    (gen_random_uuid(), q_id, '에러가 발생한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「エラーが発生した場合は、画面に表示されるエラーメッセージを確認し、担当者に連絡してください。」\nエラーが発生したらどうすればいいですか？', 'エラー発生時の対応手順を読み取る問題です。', 1, 33, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '에러 메시지를 확인하고 담당자에게 연락한다', TRUE, 1),
    (gen_random_uuid(), q_id, '컴퓨터를 재시작한다', FALSE, 2),
    (gen_random_uuid(), q_id, '무시하고 계속 작업한다', FALSE, 3),
    (gen_random_uuid(), q_id, '브라우저를 닫는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「毎日9時から18時まで、サーバーのバックアップを取ります。バックアップ中は処理が遅くなる場合があります。」\nバックアップについて正しいのは？', 'バックアップのスケジュールと影響についての文章です。', 1, 34, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매일 9시부터 18시까지 백업하며 처리가 느려질 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '백업은 주 1회만 실행된다', FALSE, 2),
    (gen_random_uuid(), q_id, '백업 중에는 시스템을 사용할 수 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '백업은 자동으로 삭제된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「新しいバージョンをリリースしました。アップデート内容は以下の通りです。\n・ログイン機能の不具合を修正\n・検索速度を改善」\n今回のアップデートで行われたことは？', 'リリースノートの内容を読み取る問題です。', 1, 35, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '로그인 버그 수정과 검색 속도 개선', TRUE, 1),
    (gen_random_uuid(), q_id, '새로운 기능 추가', FALSE, 2),
    (gen_random_uuid(), q_id, '디자인 변경', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스 이관', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「パスワードは8文字以上で、英数字と記号を含めてください。」\nパスワードの条件は？', 'パスワードポリシーを読み取る問題です。', 1, 36, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8자 이상, 영문자+숫자+기호 포함', TRUE, 1),
    (gen_random_uuid(), q_id, '4자 이상, 숫자만', FALSE, 2),
    (gen_random_uuid(), q_id, '6자 이상, 영문자만', FALSE, 3),
    (gen_random_uuid(), q_id, '제한 없음', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のメールを読んでください。\n「お疲れ様です。明日のミーティングの時間が10時から14時に変更になりました。ご確認ください。」\nメールの内容は？', 'ミーティング時間の変更連絡メールです。', 1, 37, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '내일 미팅 시간이 10시에서 14시로 변경됨', TRUE, 1),
    (gen_random_uuid(), q_id, '미팅이 취소됨', FALSE, 2),
    (gen_random_uuid(), q_id, '미팅 장소가 변경됨', FALSE, 3),
    (gen_random_uuid(), q_id, '미팅 참석자가 변경됨', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「テスト環境にデプロイが完了しました。動作確認をお願いします。問題があれば、チケットを作成してください。」\nこの文の依頼事項は？', 'テスト環境デプロイ後の確認依頼です。', 1, 38, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '동작 확인 후 문제가 있으면 티켓을 생성한다', TRUE, 1),
    (gen_random_uuid(), q_id, '본번 환경에 배포한다', FALSE, 2),
    (gen_random_uuid(), q_id, '테스트 코드를 작성한다', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 리뷰를 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「本日のリリースは、サーバーメンテナンスのため、明日に延期します。」\nどういう意味ですか？', 'リリース延期の連絡文です。', 1, 39, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 유지보수 때문에 릴리스가 내일로 연기된다', TRUE, 1),
    (gen_random_uuid(), q_id, '릴리스가 취소된다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 유지보수가 완료되었다', FALSE, 3),
    (gen_random_uuid(), q_id, '릴리스가 오늘 예정대로 진행된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「ファイルをアップロードする前に、ファイルサイズが10MB以下であることを確認してください。」\nアップロード前に確認すべきことは？', 'ファイルアップロードの制限に関する文章です。', 1, 40, 'easy', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '파일 크기가 10MB 이하인지 확인', TRUE, 1),
    (gen_random_uuid(), q_id, '파일 이름을 변경', FALSE, 2),
    (gen_random_uuid(), q_id, '파일을 압축', FALSE, 3),
    (gen_random_uuid(), q_id, '파일 형식을 변환', FALSE, 4);

  -- reading medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の仕様書を読んでください。\n「ユーザーがログインに3回連続で失敗した場合、アカウントを30分間ロックする。ロック解除後、再度ログインが可能となる。」\nこの仕様の条件は？', 'ログインセキュリティの仕様を読み取る問題です。', 1, 41, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '3회 연속 로그인 실패 시 30분간 계정 잠금', TRUE, 1),
    (gen_random_uuid(), q_id, '5회 실패 시 영구 잠금', FALSE, 2),
    (gen_random_uuid(), q_id, '1회 실패 시 10분 잠금', FALSE, 3),
    (gen_random_uuid(), q_id, '로그인 실패 시 비밀번호 초기화', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のチケットを読んでください。\n「【不具合】商品検索画面で、カテゴリーフィルターを選択した状態でページネーションを操作すると、フィルターがリセットされる。\n【再現手順】1.カテゴリーを選択 2.次のページへ移動 3.フィルターが解除される\n【期待動作】ページ遷移後もフィルターが維持される」\nこの不具合は？', 'バグチケットの内容を理解する問題です。', 1, 42, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '페이지 이동 시 카테고리 필터가 초기화되는 버그', TRUE, 1),
    (gen_random_uuid(), q_id, '검색이 작동하지 않는 버그', FALSE, 2),
    (gen_random_uuid(), q_id, '페이지네이션이 작동하지 않는 버그', FALSE, 3),
    (gen_random_uuid(), q_id, '카테고리가 표시되지 않는 버그', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「今回の改修では、APIのレスポンスタイムを現状の平均500msから200ms以下に短縮することを目標とする。そのため、データベースクエリの最適化とキャッシュの導入を検討する。」\n改修の目標は？', 'パフォーマンス改善の目標と方法を読み取る問題です。', 1, 43, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'API 응답 시간을 500ms에서 200ms 이하로 단축', TRUE, 1),
    (gen_random_uuid(), q_id, '새로운 API를 추가', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스를 교체', FALSE, 3),
    (gen_random_uuid(), q_id, '서버 대수를 늘리기', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の会議メモを読んでください。\n「【決定事項】\n・リリース日は来週金曜日に確定\n・テスト期間は水曜日まで延長\n・本番デプロイは田中さんが担当\n【宿題】\n・山田さん：テストケースの追加\n・鈴木さん：障害対応手順書の作成」\n田中さんの担当は？', '会議メモから担当者の役割を読み取る問題です。', 1, 44, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '본번 배포 담당', TRUE, 1),
    (gen_random_uuid(), q_id, '테스트 케이스 추가', FALSE, 2),
    (gen_random_uuid(), q_id, '장애 대응 절차서 작성', FALSE, 3),
    (gen_random_uuid(), q_id, '리리스 일정 조정', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の仕様を読んでください。\n「注文データのCSVエクスポート機能を実装する。出力項目は注文番号、注文日、顧客名、金額の4項目とし、文字コードはUTF-8、区切り文字はカンマとする。」\nCSVの文字コードは？', 'CSV出力仕様を読み取る問題です。', 1, 45, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'UTF-8', TRUE, 1),
    (gen_random_uuid(), q_id, 'Shift_JIS', FALSE, 2),
    (gen_random_uuid(), q_id, 'EUC-JP', FALSE, 3),
    (gen_random_uuid(), q_id, 'ASCII', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のコードレビューコメントを読んでください。\n「この処理ではN+1問題が発生しています。ループ内でDBクエリを実行するのではなく、一括取得してからループ処理を行うようにリファクタリングしてください。」\n指摘されている問題は？', 'コードレビューの指摘内容を理解する問題です。', 1, 46, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'N+1 문제 (루프 내 DB 쿼리 반복 실행)', TRUE, 1),
    (gen_random_uuid(), q_id, 'SQL 인젝션 취약점', FALSE, 2),
    (gen_random_uuid(), q_id, '메모리 누수', FALSE, 3),
    (gen_random_uuid(), q_id, '무한 루프', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の障害報告を読んでください。\n「14時30分にWebサーバーのCPU使用率が100%に達し、応答不能となった。原因はバッチ処理の実行タイミングがピーク時間と重なったためと判明。暫定対応としてバッチ処理を停止し、15時に復旧した。」\n障害の原因は？', '障害報告書から原因を読み取る問題です。', 1, 47, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배치 처리가 피크 시간과 겹쳐서 CPU 사용률 100%', TRUE, 1),
    (gen_random_uuid(), q_id, '하드디스크 용량 부족', FALSE, 2),
    (gen_random_uuid(), q_id, '네트워크 장애', FALSE, 3),
    (gen_random_uuid(), q_id, '메모리 부족', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「本システムはマイクロサービスアーキテクチャを採用し、各サービスはREST APIで通信する。認証にはJWTトークンを使用し、トークンの有効期限は1時間とする。」\n認証方式は？', 'システム仕様から認証方式を読み取る問題です。', 1, 48, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JWT 토큰 (유효기간 1시간)', TRUE, 1),
    (gen_random_uuid(), q_id, 'Session 기반 인증', FALSE, 2),
    (gen_random_uuid(), q_id, 'OAuth 2.0', FALSE, 3),
    (gen_random_uuid(), q_id, 'Basic 인증', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のプルリクエストの説明を読んでください。\n「【変更内容】\nユーザー一覧画面のページネーションを実装しました。\n1ページあたりの表示件数は20件で、総件数も表示します。\n【テスト】\n・0件の場合の表示確認\n・1ページ以下の場合にページネーションが表示されないことを確認」\nテストで確認したことは？', 'PRの説明からテスト内容を読み取る問題です。', 1, 49, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '0건일 때의 표시와 1페이지 이하일 때 페이지네이션 비표시 확인', TRUE, 1),
    (gen_random_uuid(), q_id, '성능 테스트', FALSE, 2),
    (gen_random_uuid(), q_id, '보안 테스트', FALSE, 3),
    (gen_random_uuid(), q_id, '부하 테스트', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文を読んでください。\n「Git運用ルール：developブランチから作業ブランチを切り、作業完了後にdevelopへマージする。mainブランチへのマージはリリース時のみとし、必ずタグを付ける。」\nmainブランチへのマージはいつ行いますか？', 'Git運用ルールを読み取る問題です。', 1, 50, 'medium', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '릴리스 시에만 (태그 필수)', TRUE, 1),
    (gen_random_uuid(), q_id, '매일', FALSE, 2),
    (gen_random_uuid(), q_id, '작업 완료 시마다', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 리뷰 완료 시', FALSE, 4);

  -- reading hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の設計書を読んでください。\n「本システムのデータベース設計において、ユーザーテーブルと注文テーブルは1対多の関係とする。注文テーブルにはuser_idを外部キーとして持ち、CASCADE削除を設定する。これにより、ユーザーが削除された場合、関連する注文データも自動的に削除される。」\nCASCADE削除の意味は？', 'データベース設計のCASCADE削除の仕様を理解する問題です。', 1, 51, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사용자 삭제 시 관련 주문 데이터도 자동 삭제', TRUE, 1),
    (gen_random_uuid(), q_id, '주문 삭제 시 사용자도 삭제', FALSE, 2),
    (gen_random_uuid(), q_id, '사용자 삭제가 불가능', FALSE, 3),
    (gen_random_uuid(), q_id, '주문 데이터는 별도로 수동 삭제', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のアーキテクチャ文書を読んでください。\n「本システムではCQRSパターンを採用する。書き込み操作はCommand側で処理し、RDBMSに永続化する。読み取り操作はQuery側で処理し、読み取り専用のNoSQLデータベースから取得する。データの同期はイベント駆動で非同期に行う。」\nCQRSパターンの特徴として正しいのは？', 'CQRSアーキテクチャパターンの理解を問う問題です。', 1, 52, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '쓰기와 읽기를 분리하고 이벤트 기반으로 비동기 동기화', TRUE, 1),
    (gen_random_uuid(), q_id, '쓰기와 읽기에 같은 DB를 사용', FALSE, 2),
    (gen_random_uuid(), q_id, '동기 방식으로 데이터를 동기화', FALSE, 3),
    (gen_random_uuid(), q_id, 'NoSQL만 사용', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の障害分析レポートを読んでください。\n「根本原因分析（RCA）の結果、今回の障害はデプロイスクリプトにおけるロールバック手順の不備に起因するものと判明した。具体的には、データベースマイグレーションの巻き戻し処理が未実装であったため、デプロイ失敗時にデータの整合性が崩れた。再発防止策として、全マイグレーションにロールバックスクリプトの実装を必須とする。」\n再発防止策は？', '障害分析レポートの再発防止策を読み取る問題です。', 1, 53, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '모든 마이그레이션에 롤백 스크립트 구현을 필수화', TRUE, 1),
    (gen_random_uuid(), q_id, '배포를 중단', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스를 교체', FALSE, 3),
    (gen_random_uuid(), q_id, '마이그레이션을 사용하지 않음', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のSLA文書を読んでください。\n「サービスレベル目標：\n・可用性：99.9%（年間ダウンタイム8.76時間以内）\n・平均応答時間：200ms以下\n・インシデント対応：重大障害は30分以内に一次対応開始\n目標未達の場合、月額利用料の10%を返金する。」\n年間許容ダウンタイムは？', 'SLA文書の可用性指標を読み取る問題です。', 1, 54, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '8.76시간 이내', TRUE, 1),
    (gen_random_uuid(), q_id, '24시간 이내', FALSE, 2),
    (gen_random_uuid(), q_id, '1시간 이내', FALSE, 3),
    (gen_random_uuid(), q_id, '0시간 (다운타임 불허)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の技術文書を読んでください。\n「コンテナオーケストレーションにはKubernetesを使用する。Podの水平スケーリングはHPAにより、CPU使用率が70%を超えた場合に自動的にレプリカ数を増加させる。最小レプリカ数は2、最大レプリカ数は10とする。」\nスケーリングの条件は？', 'Kubernetes HPAの設定を読み取る問題です。', 1, 55, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CPU 사용률 70% 초과 시 자동 스케일링 (최소2, 최대10)', TRUE, 1),
    (gen_random_uuid(), q_id, '메모리 사용률 기반 스케일링', FALSE, 2),
    (gen_random_uuid(), q_id, '수동으로만 스케일링', FALSE, 3),
    (gen_random_uuid(), q_id, '시간 기반 스케줄링', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のCI/CDパイプライン設計書を読んでください。\n「パイプラインは以下の段階で構成する：\n1. ソースコードチェックアウト\n2. 静的解析（SonarQube）\n3. 単体テスト実行\n4. ビルド\n5. 結合テスト実行\n6. ステージング環境デプロイ\n7. 承認ゲート\n8. 本番デプロイ\nいずれかのステージが失敗した場合、パイプラインは停止し、担当者に通知する。」\n承認ゲートはどの段階で行われますか？', 'CI/CDパイプラインの設計を読み取る問題です。', 1, 56, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스테이징 환경 배포 후, 본번 배포 전', TRUE, 1),
    (gen_random_uuid(), q_id, '소스 코드 체크아웃 직후', FALSE, 2),
    (gen_random_uuid(), q_id, '단위 테스트 실행 전', FALSE, 3),
    (gen_random_uuid(), q_id, '본번 배포 후', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次のセキュリティレビュー結果を読んでください。\n「1. SQLインジェクション対策：パラメータバインドが未実装の箇所が3件あり。至急対応が必要。\n2. XSS対策：出力時のエスケープ処理は全画面で実装済み。\n3. CSRF対策：トークン検証が一部のフォームで欠落。中優先度で対応。\n4. 認証・認可：適切に実装されている。」\n至急対応が必要な項目は？', 'セキュリティレビュー結果から優先度を読み取る問題です。', 1, 57, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'SQL 인젝션 대책 (파라미터 바인딩 미구현 3건)', TRUE, 1),
    (gen_random_uuid(), q_id, 'XSS 대책', FALSE, 2),
    (gen_random_uuid(), q_id, 'CSRF 대책', FALSE, 3),
    (gen_random_uuid(), q_id, '인증/인가', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の性能テスト結果を読んでください。\n「同時接続数1000ユーザーの負荷テストを実施した結果、95パーセンタイルの応答時間は800msで、目標の500msを超過している。ボトルネック分析の結果、データベースの接続プール枯渇が原因と特定された。接続プールのサイズを現状の50から100に拡張することを推奨する。」\nボトルネックの原因は？', '性能テスト結果の分析を読み取る問題です。', 1, 58, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터베이스 커넥션 풀 고갈', TRUE, 1),
    (gen_random_uuid(), q_id, 'CPU 사용률 과다', FALSE, 2),
    (gen_random_uuid(), q_id, '네트워크 대역폭 부족', FALSE, 3),
    (gen_random_uuid(), q_id, '디스크 I/O 병목', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の技術提案書を読んでください。\n「現行システムのモノリシックアーキテクチャをマイクロサービスに移行することを提案する。移行にあたっては、ストラングラーフィグパターンを採用し、段階的に機能を切り出す。まず認証サービスを分離し、次にユーザー管理、最後に注文管理を移行する。各フェーズ間のデータ整合性はSagaパターンで担保する。」\n移行の順序として正しいのは？', 'マイクロサービス移行提案書の理解を問う問題です。', 1, 59, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인증 → 사용자 관리 → 주문 관리', TRUE, 1),
    (gen_random_uuid(), q_id, '주문 관리 → 사용자 관리 → 인증', FALSE, 2),
    (gen_random_uuid(), q_id, '사용자 관리 → 인증 → 주문 관리', FALSE, 3),
    (gen_random_uuid(), q_id, '동시에 모두 이관', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の運用設計書を読んでください。\n「監視設計：\n・インフラ監視：Prometheusでメトリクスを収集し、Grafanaで可視化\n・アプリケーション監視：分散トレーシングにJaegerを使用\n・ログ管理：ELKスタック（Elasticsearch, Logstash, Kibana）で集約\n・アラート：PagerDutyと連携し、重要度に応じてエスカレーション\nログの保持期間は90日とし、その後アーカイブストレージに移動する。」\nログの保持期間は？', '運用設計書からログ保持期間を読み取る問題です。', 1, 60, 'hard', 'reading');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '90일 (이후 아카이브 스토리지로 이동)', TRUE, 1),
    (gen_random_uuid(), q_id, '30일', FALSE, 2),
    (gen_random_uuid(), q_id, '365일', FALSE, 3),
    (gen_random_uuid(), q_id, '무기한', FALSE, 4);

  -- ==========================================
  -- FILL_BLANK category (30 questions, sort_order 61-90)
  -- ==========================================

  -- fill_blank easy (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「サーバーに___を送信します。」', '「リクエスト(Request)」はサーバーへの要求を意味するIT基本用語です。', 1, 61, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リクエスト', TRUE, 1),
    (gen_random_uuid(), q_id, 'レスポンス', FALSE, 2),
    (gen_random_uuid(), q_id, 'エラー', FALSE, 3),
    (gen_random_uuid(), q_id, 'ログ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___を修正してから、もう一度テストしてください。」', '「バグ(Bug)」はプログラムの不具合を意味するIT用語です。', 1, 62, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'バグ', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'デザイン', FALSE, 3),
    (gen_random_uuid(), q_id, 'ドキュメント', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「コードの変更を___にコミットしてください。」', '「リポジトリ(Repository)」はソースコードの保管場所です。', 1, 63, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'リポジトリ', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバー', FALSE, 2),
    (gen_random_uuid(), q_id, 'クラウド', FALSE, 3),
    (gen_random_uuid(), q_id, 'フォルダ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「新しい機能を追加するために、___を作成しました。」', '「ブランチ(Branch)」は独立した開発ラインを作るGitの機能です。', 1, 64, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブランチ', TRUE, 1),
    (gen_random_uuid(), q_id, 'ファイル', FALSE, 2),
    (gen_random_uuid(), q_id, 'フォルダ', FALSE, 3),
    (gen_random_uuid(), q_id, 'プロジェクト', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___が完了したら、本番環境にデプロイします。」', '「テスト」は本番環境へのデプロイ前に行う品質確認です。', 1, 65, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト', TRUE, 1),
    (gen_random_uuid(), q_id, '設計', FALSE, 2),
    (gen_random_uuid(), q_id, '要件定義', FALSE, 3),
    (gen_random_uuid(), q_id, 'コーディング', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「データを___に保存してください。」', '「データベース」はデータを構造的に保存・管理するシステムです。', 1, 66, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'データベース', TRUE, 1),
    (gen_random_uuid(), q_id, 'メモリ', FALSE, 2),
    (gen_random_uuid(), q_id, 'キャッシュ', FALSE, 3),
    (gen_random_uuid(), q_id, 'ログ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「この___は、ユーザー情報を管理する画面です。」', '「画面」はUIの表示領域を指すIT用語です。', 1, 67, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '画面', TRUE, 1),
    (gen_random_uuid(), q_id, 'サーバー', FALSE, 2),
    (gen_random_uuid(), q_id, 'データベース', FALSE, 3),
    (gen_random_uuid(), q_id, 'ネットワーク', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「プルリクエストの___が完了しました。マージしてください。」', '「レビュー(Review)」はコードの品質チェックを意味します。', 1, 68, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レビュー', TRUE, 1),
    (gen_random_uuid(), q_id, 'テスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'ビルド', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___エラーが発生しました。ステータスコードは404です。」', 'ステータスコード404は「ページが見つからない」エラーです。', 1, 69, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Not Found', TRUE, 1),
    (gen_random_uuid(), q_id, 'Internal Server', FALSE, 2),
    (gen_random_uuid(), q_id, 'Unauthorized', FALSE, 3),
    (gen_random_uuid(), q_id, 'Bad Request', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「アプリケーションを___にデプロイしました。」', '「サーバー」はアプリケーションを実行するコンピュータです。', 1, 70, 'easy', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーバー', TRUE, 1),
    (gen_random_uuid(), q_id, 'クライアント', FALSE, 2),
    (gen_random_uuid(), q_id, 'ブラウザ', FALSE, 3),
    (gen_random_uuid(), q_id, 'エディタ', FALSE, 4);

  -- fill_blank medium (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___テストでは、モジュール間のインターフェースが正しく動作するか確認します。」', '結合テストはモジュール間の連携を確認するテストです。', 1, 71, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '結合', TRUE, 1),
    (gen_random_uuid(), q_id, '単体', FALSE, 2),
    (gen_random_uuid(), q_id, '負荷', FALSE, 3),
    (gen_random_uuid(), q_id, '受入', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「データベースの___を最適化することで、検索速度が向上しました。」', 'インデックスはデータベースの検索性能を向上させる仕組みです。', 1, 72, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'インデックス', TRUE, 1),
    (gen_random_uuid(), q_id, 'テーブル', FALSE, 2),
    (gen_random_uuid(), q_id, 'カラム', FALSE, 3),
    (gen_random_uuid(), q_id, 'スキーマ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「APIの___にはJSON形式を使用します。」', 'レスポンスはAPIがクライアントに返す応答データです。', 1, 73, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'レスポンス', TRUE, 1),
    (gen_random_uuid(), q_id, 'リクエスト', FALSE, 2),
    (gen_random_uuid(), q_id, 'ヘッダー', FALSE, 3),
    (gen_random_uuid(), q_id, 'パラメータ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___管理にはGitHubのIssue機能を使用しています。」', 'タスク管理はプロジェクトの作業を追跡・管理する活動です。', 1, 74, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'タスク', TRUE, 1),
    (gen_random_uuid(), q_id, 'バージョン', FALSE, 2),
    (gen_random_uuid(), q_id, 'ソースコード', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「セキュリティ対策として、パスワードは___化して保存します。」', 'ハッシュ化はパスワードを不可逆に変換するセキュリティ手法です。', 1, 75, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ハッシュ', TRUE, 1),
    (gen_random_uuid(), q_id, '暗号', FALSE, 2),
    (gen_random_uuid(), q_id, '圧縮', FALSE, 3),
    (gen_random_uuid(), q_id, 'エンコード', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___駆動開発では、先にテストコードを書いてから実装を行います。」', 'テスト駆動開発(TDD)はテストファーストのプラクティスです。', 1, 76, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'テスト', TRUE, 1),
    (gen_random_uuid(), q_id, 'ドメイン', FALSE, 2),
    (gen_random_uuid(), q_id, 'イベント', FALSE, 3),
    (gen_random_uuid(), q_id, 'データ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「コードの品質を保つために、定期的に___を実施しています。」', 'コードレビューはコード品質を維持するためのレビュープロセスです。', 1, 77, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'コードレビュー', TRUE, 1),
    (gen_random_uuid(), q_id, 'デバッグ', FALSE, 2),
    (gen_random_uuid(), q_id, 'リファクタリング', FALSE, 3),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「この機能は次の___で対応する予定です。」', 'スプリントはアジャイル開発の反復的な開発サイクルです。', 1, 78, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'スプリント', TRUE, 1),
    (gen_random_uuid(), q_id, 'ミーティング', FALSE, 2),
    (gen_random_uuid(), q_id, 'リリース', FALSE, 3),
    (gen_random_uuid(), q_id, 'レビュー', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「本番障害の___として、サーバーを再起動しました。」', '暫定対応は恒久対応までの一時的な対処です。', 1, 79, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '暫定対応', TRUE, 1),
    (gen_random_uuid(), q_id, '恒久対応', FALSE, 2),
    (gen_random_uuid(), q_id, '原因調査', FALSE, 3),
    (gen_random_uuid(), q_id, '影響調査', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___パターンを適用して、オブジェクトの生成ロジックをカプセル化しました。」', 'ファクトリーパターンはオブジェクト生成をカプセル化するデザインパターンです。', 1, 80, 'medium', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ファクトリー', TRUE, 1),
    (gen_random_uuid(), q_id, 'シングルトン', FALSE, 2),
    (gen_random_uuid(), q_id, 'オブザーバー', FALSE, 3),
    (gen_random_uuid(), q_id, 'ストラテジー', FALSE, 4);

  -- fill_blank hard (10 questions)
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「マイクロサービス間のデータ整合性を保つために、___パターンを採用しました。」', 'Sagaパターンは分散トランザクションを管理するパターンです。', 1, 81, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Saga', TRUE, 1),
    (gen_random_uuid(), q_id, 'CQRS', FALSE, 2),
    (gen_random_uuid(), q_id, 'Circuit Breaker', FALSE, 3),
    (gen_random_uuid(), q_id, 'Bulkhead', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「外部サービスの障害が伝播しないように、___パターンを導入しました。」', 'サーキットブレーカーパターンは障害の伝播を防ぐパターンです。', 1, 82, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'サーキットブレーカー', TRUE, 1),
    (gen_random_uuid(), q_id, 'リトライ', FALSE, 2),
    (gen_random_uuid(), q_id, 'フォールバック', FALSE, 3),
    (gen_random_uuid(), q_id, 'タイムアウト', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「データベースの___レベルをREAD COMMITTEDに設定しています。」', 'トランザクション分離レベルはデータの一貫性を制御する設定です。', 1, 83, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '分離（アイソレーション）', TRUE, 1),
    (gen_random_uuid(), q_id, '接続', FALSE, 2),
    (gen_random_uuid(), q_id, 'セキュリティ', FALSE, 3),
    (gen_random_uuid(), q_id, 'パフォーマンス', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「コンテナの___にはDockerfileを使用し、マルチステージビルドで最終イメージのサイズを削減しています。」', 'ビルドはDockerイメージを作成するプロセスです。', 1, 84, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ビルド', TRUE, 1),
    (gen_random_uuid(), q_id, 'デプロイ', FALSE, 2),
    (gen_random_uuid(), q_id, 'オーケストレーション', FALSE, 3),
    (gen_random_uuid(), q_id, 'モニタリング', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___原則に従い、クラスは変更の理由がただ一つだけであるべきです。」', '単一責任の原則(SRP)はSOLID原則の一つです。', 1, 85, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '単一責任', TRUE, 1),
    (gen_random_uuid(), q_id, 'オープン・クローズド', FALSE, 2),
    (gen_random_uuid(), q_id, 'リスコフ置換', FALSE, 3),
    (gen_random_uuid(), q_id, '依存性逆転', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「認証情報を安全に管理するため、___管理ツールとしてVaultを導入しました。」', 'シークレット管理はAPI鍵やパスワードを安全に扱う仕組みです。', 1, 86, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'シークレット', TRUE, 1),
    (gen_random_uuid(), q_id, 'バージョン', FALSE, 2),
    (gen_random_uuid(), q_id, 'コンフィグ', FALSE, 3),
    (gen_random_uuid(), q_id, 'パッケージ', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___テストでは、同時に1000ユーザーがアクセスした場合のシステムの挙動を確認します。」', '負荷テストはシステムの性能限界を確認するテストです。', 1, 87, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '負荷', TRUE, 1),
    (gen_random_uuid(), q_id, '結合', FALSE, 2),
    (gen_random_uuid(), q_id, '受入', FALSE, 3),
    (gen_random_uuid(), q_id, '回帰', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「本番環境へのデプロイは___デプロイ方式を採用し、ダウンタイムゼロでリリースします。」', 'ブルーグリーンデプロイはダウンタイムなしでリリースする方式です。', 1, 88, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ブルーグリーン', TRUE, 1),
    (gen_random_uuid(), q_id, 'ローリング', FALSE, 2),
    (gen_random_uuid(), q_id, 'カナリア', FALSE, 3),
    (gen_random_uuid(), q_id, 'インプレース', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「___の原則に基づき、上位モジュールは下位モジュールに依存すべきではなく、両者とも抽象に依存すべきです。」', '依存性逆転の原則(DIP)はSOLID原則のDです。', 1, 89, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '依存性逆転', TRUE, 1),
    (gen_random_uuid(), q_id, '単一責任', FALSE, 2),
    (gen_random_uuid(), q_id, 'インターフェース分離', FALSE, 3),
    (gen_random_uuid(), q_id, 'リスコフ置換', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000002-0000-0000-0000-000000000002', 'multiple_choice', '次の文の空欄に入る言葉は？\n「分散システムにおいて、___定理により、一貫性、可用性、分断耐性の3つを同時に満たすことはできない。」', 'CAP定理は分散システムの基本的な制約を示す定理です。', 1, 90, 'hard', 'fill_blank');
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'CAP', TRUE, 1),
    (gen_random_uuid(), q_id, 'ACID', FALSE, 2),
    (gen_random_uuid(), q_id, 'BASE', FALSE, 3),
    (gen_random_uuid(), q_id, 'SOLID', FALSE, 4);

END $$;

-- ============================================
-- Quiz 3: 핵심 프로그래밍 능력 평가 (90 questions)
-- All in Korean, question_category: NULL
-- Easy: 변수/타입/연산자/입출력 (30)
-- Medium: 제어문/함수/배열/문자열 (30)
-- Hard: OOP/알고리즘/에러처리/재귀 (30)
-- ============================================
DO $$
DECLARE q_id UUID;
BEGIN
  -- ==========================================
  -- EASY - 30 questions (sort_order 1-30)
  -- ==========================================

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'int와 float의 차이점으로 올바른 것은?', 'int는 정수형, float는 부동소수점(실수)형 데이터 타입입니다.', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'int는 정수, float는 실수를 저장한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'int는 문자, float는 숫자를 저장한다', FALSE, 2),
    (gen_random_uuid(), q_id, '둘 다 같은 타입이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'int는 실수, float는 정수를 저장한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '변수 선언 시 const의 역할은?', 'const는 상수를 선언하여 한 번 할당된 값을 변경할 수 없게 합니다.', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '값을 변경할 수 없는 상수를 선언한다', TRUE, 1),
    (gen_random_uuid(), q_id, '전역 변수를 선언한다', FALSE, 2),
    (gen_random_uuid(), q_id, '함수를 선언한다', FALSE, 3),
    (gen_random_uuid(), q_id, '변수를 삭제한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 중 Boolean 타입이 가질 수 있는 값은?', 'Boolean은 참(true)과 거짓(false) 두 가지 값만 가질 수 있는 논리 타입입니다.', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true와 false', TRUE, 1),
    (gen_random_uuid(), q_id, '0부터 100까지의 숫자', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 문자열', FALSE, 3),
    (gen_random_uuid(), q_id, 'null만', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '10 % 3의 결과값은?', '% 연산자는 나머지를 구하는 모듈러 연산자입니다. 10 / 3 = 3 나머지 1.', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1', TRUE, 1),
    (gen_random_uuid(), q_id, '3', FALSE, 2),
    (gen_random_uuid(), q_id, '3.33', FALSE, 3),
    (gen_random_uuid(), q_id, '0', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '문자열(String)과 문자(char)의 차이점은?', 'char는 단일 문자를 저장하고, String은 문자들의 배열(문자열)을 저장합니다.', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'char는 단일 문자, String은 여러 문자의 조합', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같다', FALSE, 2),
    (gen_random_uuid(), q_id, 'char는 숫자, String은 문자', FALSE, 3),
    (gen_random_uuid(), q_id, 'String은 단일 문자만 저장 가능', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 중 할당 연산자는?', '=는 오른쪽 값을 왼쪽 변수에 할당하는 할당 연산자입니다.', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '=', TRUE, 1),
    (gen_random_uuid(), q_id, '==', FALSE, 2),
    (gen_random_uuid(), q_id, '!=', FALSE, 3),
    (gen_random_uuid(), q_id, '>=', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'null의 의미로 올바른 것은?', 'null은 변수에 값이 없음을 나타내는 특별한 값입니다.', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '값이 없음을 나타낸다', TRUE, 1),
    (gen_random_uuid(), q_id, '숫자 0과 같다', FALSE, 2),
    (gen_random_uuid(), q_id, '빈 문자열과 같다', FALSE, 3),
    (gen_random_uuid(), q_id, 'false와 같다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '변수의 이름 규칙으로 올바른 것은?', '변수 이름은 숫자로 시작할 수 없고, 예약어를 사용할 수 없습니다.', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '숫자로 시작할 수 없다', TRUE, 1),
    (gen_random_uuid(), q_id, '반드시 대문자로 시작해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '공백을 포함할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '특수문자로만 구성해야 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '정수를 실수로 변환하는 것을 무엇이라 하는가?', '타입 캐스팅(형변환)은 하나의 데이터 타입을 다른 타입으로 변환하는 것입니다.', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '타입 캐스팅 (형변환)', TRUE, 1),
    (gen_random_uuid(), q_id, '타입 선언', FALSE, 2),
    (gen_random_uuid(), q_id, '변수 초기화', FALSE, 3),
    (gen_random_uuid(), q_id, '메모리 할당', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '논리 연산자 && (AND)의 결과로 올바른 것은?\ntrue && false = ?', '&&는 두 조건이 모두 true일 때만 true를 반환합니다.', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'false', TRUE, 1),
    (gen_random_uuid(), q_id, 'true', FALSE, 2),
    (gen_random_uuid(), q_id, 'null', FALSE, 3),
    (gen_random_uuid(), q_id, 'undefined', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 중 비교 연산자가 아닌 것은?', '=는 할당 연산자이고, ==, !=, >=는 비교 연산자입니다.', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '= (할당 연산자)', TRUE, 1),
    (gen_random_uuid(), q_id, '== (같음)', FALSE, 2),
    (gen_random_uuid(), q_id, '!= (같지 않음)', FALSE, 3),
    (gen_random_uuid(), q_id, '>= (크거나 같음)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '변수를 선언만 하고 값을 할당하지 않으면 어떻게 되는가?', '초기화하지 않은 변수는 언어에 따라 null, undefined 또는 0 등 기본값을 가지거나 컴파일 에러가 발생합니다.', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '기본값(null/undefined/0 등)을 가지거나 에러 발생', TRUE, 1),
    (gen_random_uuid(), q_id, '자동으로 1이 할당된다', FALSE, 2),
    (gen_random_uuid(), q_id, '변수가 생성되지 않는다', FALSE, 3),
    (gen_random_uuid(), q_id, '빈 문자열이 할당된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '++ 연산자의 역할은?', '++는 증감 연산자로, 변수의 값을 1 증가시킵니다.', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변수 값을 1 증가시킨다', TRUE, 1),
    (gen_random_uuid(), q_id, '변수 값을 2배로 만든다', FALSE, 2),
    (gen_random_uuid(), q_id, '변수를 삭제한다', FALSE, 3),
    (gen_random_uuid(), q_id, '두 변수를 더한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 코드의 출력 결과는?\nint a = 5;\nint b = 2;\nSystem.out.println(a / b);', '정수 나눗셈에서는 소수점 이하가 버려집니다. 5/2=2 (정수 나눗셈).', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '2', TRUE, 1),
    (gen_random_uuid(), q_id, '2.5', FALSE, 2),
    (gen_random_uuid(), q_id, '3', FALSE, 3),
    (gen_random_uuid(), q_id, '에러 발생', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '논리 연산자 || (OR)의 결과로 올바른 것은?\ntrue || false = ?', '||는 하나라도 true이면 true를 반환합니다.', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'true', TRUE, 1),
    (gen_random_uuid(), q_id, 'false', FALSE, 2),
    (gen_random_uuid(), q_id, 'null', FALSE, 3),
    (gen_random_uuid(), q_id, '에러', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '주석(Comment)의 목적은?', '주석은 코드에 설명을 추가하여 가독성을 높이며 실행에 영향을 주지 않습니다.', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드에 대한 설명을 추가하며 실행에 영향 없음', TRUE, 1),
    (gen_random_uuid(), q_id, '코드 실행 속도를 높인다', FALSE, 2),
    (gen_random_uuid(), q_id, '변수를 선언한다', FALSE, 3),
    (gen_random_uuid(), q_id, '에러를 수정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '문자열 "123"을 정수 123으로 변환하는 것을 무엇이라 하는가?', '파싱(Parsing)은 문자열을 분석하여 다른 데이터 타입으로 변환하는 과정입니다.', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '파싱 (Parsing) / 형변환', TRUE, 1),
    (gen_random_uuid(), q_id, '인코딩', FALSE, 2),
    (gen_random_uuid(), q_id, '직렬화', FALSE, 3),
    (gen_random_uuid(), q_id, '컴파일', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '컴파일러(Compiler)의 역할은?', '컴파일러는 고수준 프로그래밍 언어를 기계어로 번역하는 프로그램입니다.', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소스 코드를 기계어로 번역한다', TRUE, 1),
    (gen_random_uuid(), q_id, '코드를 실행한다', FALSE, 2),
    (gen_random_uuid(), q_id, '버그를 찾아준다', FALSE, 3),
    (gen_random_uuid(), q_id, '코드를 저장한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'let과 var의 차이점으로 올바른 것은? (JavaScript 기준)', 'var는 함수 스코프, let은 블록 스코프를 가집니다.', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'var는 함수 스코프, let은 블록 스코프', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 스코프를 가진다', FALSE, 2),
    (gen_random_uuid(), q_id, 'let은 상수를 선언한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'var는 블록 스코프를 가진다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 중 문자열 연결(concatenation)의 예시로 올바른 것은?', '문자열 연결은 + 연산자로 두 문자열을 하나로 합치는 것입니다.', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, E'"Hello" + " " + "World" \\u2192 "Hello World"', TRUE, 1),
    (gen_random_uuid(), q_id, E'"Hello" - "World" \\u2192 "HelloWorld"', FALSE, 2),
    (gen_random_uuid(), q_id, E'"Hello" * "World" \\u2192 "HelloWorld"', FALSE, 3),
    (gen_random_uuid(), q_id, E'"Hello" / "World" \\u2192 "Hello World"', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '인터프리터(Interpreter)와 컴파일러의 차이점은?', '인터프리터는 코드를 한 줄씩 실행하고, 컴파일러는 전체 코드를 먼저 번역한 후 실행합니다.', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인터프리터는 한 줄씩 실행, 컴파일러는 전체를 번역 후 실행', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 방식으로 동작한다', FALSE, 2),
    (gen_random_uuid(), q_id, '인터프리터가 항상 더 빠르다', FALSE, 3),
    (gen_random_uuid(), q_id, '컴파일러는 코드를 실행하지 않는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '삼항 연산자의 문법으로 올바른 것은?', '삼항 연산자는 조건 ? 참일때값 : 거짓일때값 형태입니다.', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조건 ? 참값 : 거짓값', TRUE, 1),
    (gen_random_uuid(), q_id, '조건 : 참값 ? 거짓값', FALSE, 2),
    (gen_random_uuid(), q_id, '조건 && 참값 || 거짓값', FALSE, 3),
    (gen_random_uuid(), q_id, '조건 -> 참값 <- 거짓값', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'print와 println의 차이점은?', 'println은 출력 후 줄바꿈을 추가하고, print는 줄바꿈 없이 출력합니다.', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'println은 줄바꿈 포함, print는 줄바꿈 미포함', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같다', FALSE, 2),
    (gen_random_uuid(), q_id, 'print가 줄바꿈을 포함한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'println은 숫자만 출력한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '비트 연산자 & (AND)의 결과로 올바른 것은?\n1010 & 1100 = ?', '비트 AND 연산은 양쪽 비트가 모두 1일 때만 1이 됩니다.', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1000', TRUE, 1),
    (gen_random_uuid(), q_id, '1110', FALSE, 2),
    (gen_random_uuid(), q_id, '0110', FALSE, 3),
    (gen_random_uuid(), q_id, '1010', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'camelCase 네이밍 규칙의 예시로 올바른 것은?', 'camelCase는 첫 단어는 소문자, 이후 단어의 첫 글자는 대문자로 작성합니다.', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'myVariableName', TRUE, 1),
    (gen_random_uuid(), q_id, 'MyVariableName', FALSE, 2),
    (gen_random_uuid(), q_id, 'my_variable_name', FALSE, 3),
    (gen_random_uuid(), q_id, 'MY_VARIABLE_NAME', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '스택(Stack) 메모리와 힙(Heap) 메모리의 차이점은?', '스택은 기본 타입과 참조를, 힙은 객체와 동적 할당 데이터를 저장합니다.', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '스택은 기본타입/참조, 힙은 객체/동적 데이터 저장', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 메모리 영역이다', FALSE, 2),
    (gen_random_uuid(), q_id, '스택은 크고 힙은 작다', FALSE, 3),
    (gen_random_uuid(), q_id, '힙은 자동으로 정리되지 않는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'IDE(통합 개발 환경)가 제공하는 기능이 아닌 것은?', 'IDE는 코드 편집, 디버깅, 빌드 등을 제공하지만 서버 호스팅은 별도 서비스입니다.', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 호스팅', TRUE, 1),
    (gen_random_uuid(), q_id, '코드 편집기', FALSE, 2),
    (gen_random_uuid(), q_id, '디버거', FALSE, 3),
    (gen_random_uuid(), q_id, '자동 완성', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '강타입(Strongly Typed) 언어의 특징은?', '강타입 언어는 변수의 타입이 엄격히 지켜져야 하며, 암묵적 형변환이 제한적입니다.', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '타입이 엄격하여 암묵적 형변환이 제한적', TRUE, 1),
    (gen_random_uuid(), q_id, '타입을 선언할 필요가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '모든 변수가 문자열이다', FALSE, 3),
    (gen_random_uuid(), q_id, '변수 타입이 자동으로 변한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다음 중 이스케이프 문자 \n의 의미는?', '\n은 줄바꿈(개행)을 나타내는 이스케이프 문자입니다.', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '줄바꿈 (개행)', TRUE, 1),
    (gen_random_uuid(), q_id, '탭', FALSE, 2),
    (gen_random_uuid(), q_id, '공백', FALSE, 3),
    (gen_random_uuid(), q_id, '백스페이스', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '동적 타이핑(Dynamic Typing) 언어의 예시는?', 'Python, JavaScript는 동적 타이핑 언어로 변수 타입을 미리 선언하지 않아도 됩니다.', 1, 30, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Python, JavaScript', TRUE, 1),
    (gen_random_uuid(), q_id, 'Java, C++', FALSE, 2),
    (gen_random_uuid(), q_id, 'C, Rust', FALSE, 3),
    (gen_random_uuid(), q_id, 'Go, TypeScript', FALSE, 4);

  -- ==========================================
  -- MEDIUM - 30 questions (sort_order 31-60)
  -- ==========================================

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'for문과 while문의 차이점으로 올바른 것은?', 'for문은 반복 횟수가 정해진 경우, while문은 조건이 충족되는 동안 반복할 때 주로 사용합니다.', 1, 31, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'for문은 반복 횟수가 정해진 경우, while문은 조건 기반 반복', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 기능이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'while문은 반복 횟수가 정해진 경우에만 사용', FALSE, 3),
    (gen_random_uuid(), q_id, 'for문은 조건 반복만 가능하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '콜백 함수(Callback Function)란?', '콜백 함수는 다른 함수에 인자로 전달되어 나중에 호출되는 함수입니다.', 1, 32, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '다른 함수에 인자로 전달되어 나중에 호출되는 함수', TRUE, 1),
    (gen_random_uuid(), q_id, '자기 자신을 호출하는 함수', FALSE, 2),
    (gen_random_uuid(), q_id, '반환값이 없는 함수', FALSE, 3),
    (gen_random_uuid(), q_id, '전역에서만 호출 가능한 함수', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '배열의 인덱스가 0부터 시작하는 이유는?', '메모리에서 배열의 시작 주소로부터의 오프셋을 나타내기 때문에 0부터 시작합니다.', 1, 33, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '메모리 시작 주소로부터의 오프셋(간격)을 나타내기 때문', TRUE, 1),
    (gen_random_uuid(), q_id, '관례일 뿐 특별한 이유 없음', FALSE, 2),
    (gen_random_uuid(), q_id, '1부터 시작하면 속도가 느려서', FALSE, 3),
    (gen_random_uuid(), q_id, '언어 설계자의 개인적 취향', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'switch문에서 break를 생략하면 어떻게 되는가?', 'break가 없으면 다음 case로 계속 실행되는 fall-through가 발생합니다.', 1, 34, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'fall-through: 다음 case도 연속 실행된다', TRUE, 1),
    (gen_random_uuid(), q_id, '에러가 발생한다', FALSE, 2),
    (gen_random_uuid(), q_id, '자동으로 break가 추가된다', FALSE, 3),
    (gen_random_uuid(), q_id, '첫 번째 case만 실행된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '함수의 매개변수(parameter)와 인자(argument)의 차이는?', '매개변수는 함수 정의 시 선언하는 변수, 인자는 함수 호출 시 전달하는 실제 값입니다.', 1, 35, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '매개변수는 함수 정의의 변수, 인자는 호출 시 전달하는 값', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 의미이다', FALSE, 2),
    (gen_random_uuid(), q_id, '매개변수는 반환값, 인자는 입력값', FALSE, 3),
    (gen_random_uuid(), q_id, '인자는 함수 정의에만 사용된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '문자열에서 substring 메서드의 역할은?', 'substring은 문자열의 일부분을 추출하여 새로운 문자열을 반환합니다.', 1, 36, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '문자열의 일부분을 추출하여 반환', TRUE, 1),
    (gen_random_uuid(), q_id, '문자열을 숫자로 변환', FALSE, 2),
    (gen_random_uuid(), q_id, '문자열을 정렬', FALSE, 3),
    (gen_random_uuid(), q_id, '문자열을 삭제', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '지역 변수(Local Variable)와 전역 변수(Global Variable)의 차이는?', '지역 변수는 선언된 블록/함수 내에서만, 전역 변수는 프로그램 전체에서 접근 가능합니다.', 1, 37, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '지역 변수는 블록/함수 내, 전역 변수는 프로그램 전체에서 접근', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 어디서나 접근 가능하다', FALSE, 2),
    (gen_random_uuid(), q_id, '전역 변수는 함수 내에서만 사용 가능', FALSE, 3),
    (gen_random_uuid(), q_id, '지역 변수는 프로그램 종료 시까지 유지된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'do-while문의 특징은?', 'do-while문은 조건 확인 전에 먼저 한 번 실행합니다.', 1, 38, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조건과 무관하게 최소 한 번은 실행된다', TRUE, 1),
    (gen_random_uuid(), q_id, '조건이 거짓이면 한 번도 실행되지 않는다', FALSE, 2),
    (gen_random_uuid(), q_id, 'while문과 완전히 동일하다', FALSE, 3),
    (gen_random_uuid(), q_id, '무한 루프에서만 사용 가능하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '배열에서 push와 pop 메서드의 역할은?', 'push는 배열 끝에 요소를 추가하고, pop은 배열 끝의 요소를 제거 후 반환합니다.', 1, 39, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'push는 끝에 추가, pop은 끝에서 제거', TRUE, 1),
    (gen_random_uuid(), q_id, 'push는 앞에 추가, pop은 앞에서 제거', FALSE, 2),
    (gen_random_uuid(), q_id, '둘 다 배열을 정렬한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'push는 제거, pop은 추가', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '함수 오버로딩(Overloading)이란?', '함수 오버로딩은 같은 이름의 함수를 매개변수의 타입이나 개수를 달리하여 여러 개 정의하는 것입니다.', 1, 40, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '같은 이름의 함수를 매개변수를 달리하여 여러 개 정의', TRUE, 1),
    (gen_random_uuid(), q_id, '부모 클래스의 함수를 자식 클래스에서 재정의', FALSE, 2),
    (gen_random_uuid(), q_id, '함수를 삭제하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '함수를 반복 호출하는 것', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'HashMap(Dictionary)의 특징으로 올바른 것은?', 'HashMap은 키-값 쌍으로 데이터를 저장하며, 키는 중복될 수 없습니다.', 1, 41, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '키-값 쌍으로 저장하며 키는 중복 불가', TRUE, 1),
    (gen_random_uuid(), q_id, '인덱스로만 접근 가능하다', FALSE, 2),
    (gen_random_uuid(), q_id, '키와 값 모두 중복 가능하다', FALSE, 3),
    (gen_random_uuid(), q_id, '순서가 보장된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'continue문의 역할은?', 'continue는 현재 반복을 건너뛰고 다음 반복으로 진행합니다.', 1, 42, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '현재 반복을 건너뛰고 다음 반복으로 진행', TRUE, 1),
    (gen_random_uuid(), q_id, '반복문을 완전히 종료', FALSE, 2),
    (gen_random_uuid(), q_id, '프로그램을 종료', FALSE, 3),
    (gen_random_uuid(), q_id, '함수를 종료', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '값에 의한 전달(Pass by Value)과 참조에 의한 전달(Pass by Reference)의 차이는?', '값 전달은 복사본을 전달하고, 참조 전달은 원본 주소를 전달합니다.', 1, 43, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '값 전달은 복사본, 참조 전달은 원본 주소를 전달', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 방식이다', FALSE, 2),
    (gen_random_uuid(), q_id, '값 전달은 원본을 전달한다', FALSE, 3),
    (gen_random_uuid(), q_id, '참조 전달은 복사본을 전달한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '정규 표현식(Regular Expression)의 용도는?', '정규 표현식은 문자열에서 특정 패턴을 검색, 매칭, 치환하는 데 사용합니다.', 1, 44, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '문자열에서 특정 패턴을 검색/매칭/치환', TRUE, 1),
    (gen_random_uuid(), q_id, '숫자 계산', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 쿼리 작성', FALSE, 3),
    (gen_random_uuid(), q_id, '파일 시스템 관리', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '클로저(Closure)란?', '클로저는 함수가 선언된 환경의 변수를 기억하고 접근할 수 있는 함수입니다.', 1, 45, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '선언된 환경의 변수를 기억하고 접근할 수 있는 함수', TRUE, 1),
    (gen_random_uuid(), q_id, '클래스를 닫는 키워드', FALSE, 2),
    (gen_random_uuid(), q_id, '프로그램을 종료하는 함수', FALSE, 3),
    (gen_random_uuid(), q_id, '메모리를 해제하는 함수', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '배열의 map() 메서드의 역할은?', 'map()은 배열의 각 요소에 함수를 적용하여 새로운 배열을 반환합니다.', 1, 46, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '각 요소에 함수를 적용하여 새 배열을 반환', TRUE, 1),
    (gen_random_uuid(), q_id, '배열을 정렬한다', FALSE, 2),
    (gen_random_uuid(), q_id, '조건에 맞는 요소만 필터링', FALSE, 3),
    (gen_random_uuid(), q_id, '배열을 하나의 값으로 축소', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'enum(열거형)의 용도는?', 'enum은 관련된 상수들의 집합을 정의하여 코드의 가독성과 안전성을 높입니다.', 1, 47, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관련된 상수들의 집합을 정의하여 가독성과 안전성 향상', TRUE, 1),
    (gen_random_uuid(), q_id, '배열을 정렬하는 키워드', FALSE, 2),
    (gen_random_uuid(), q_id, '함수를 그룹화하는 방법', FALSE, 3),
    (gen_random_uuid(), q_id, '변수 타입을 변환하는 방법', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '배열의 filter() 메서드의 역할은?', 'filter()는 조건에 맞는 요소만 추출하여 새로운 배열을 반환합니다.', 1, 48, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조건에 맞는 요소만 추출하여 새 배열 반환', TRUE, 1),
    (gen_random_uuid(), q_id, '각 요소에 함수를 적용', FALSE, 2),
    (gen_random_uuid(), q_id, '배열을 하나의 값으로 축소', FALSE, 3),
    (gen_random_uuid(), q_id, '배열을 뒤집는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'void 리턴 타입의 의미는?', 'void는 함수가 값을 반환하지 않음을 나타내는 리턴 타입입니다.', 1, 49, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '함수가 값을 반환하지 않음', TRUE, 1),
    (gen_random_uuid(), q_id, '함수가 정수를 반환', FALSE, 2),
    (gen_random_uuid(), q_id, '함수가 null을 반환', FALSE, 3),
    (gen_random_uuid(), q_id, '함수가 문자열을 반환', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '2차원 배열이란?', '2차원 배열은 배열 안에 배열이 있는 구조로, 행과 열로 데이터를 관리합니다.', 1, 50, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배열 안에 배열이 있는 구조 (행/열)', TRUE, 1),
    (gen_random_uuid(), q_id, '배열의 길이가 2인 배열', FALSE, 2),
    (gen_random_uuid(), q_id, '2개의 요소만 가질 수 있는 배열', FALSE, 3),
    (gen_random_uuid(), q_id, '2가지 타입의 요소를 가진 배열', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'reduce() 메서드의 역할은?', 'reduce()는 배열의 모든 요소를 하나의 값으로 축소(집계)합니다.', 1, 51, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배열의 모든 요소를 하나의 값으로 축소/집계', TRUE, 1),
    (gen_random_uuid(), q_id, '배열의 크기를 줄인다', FALSE, 2),
    (gen_random_uuid(), q_id, '조건에 맞는 요소를 필터링', FALSE, 3),
    (gen_random_uuid(), q_id, '배열을 정렬한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '제네릭(Generics)의 목적은?', '제네릭은 타입을 매개변수로 받아 재사용 가능하고 타입 안전한 코드를 작성할 수 있게 합니다.', 1, 52, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '타입을 매개변수화하여 재사용성과 타입 안전성 확보', TRUE, 1),
    (gen_random_uuid(), q_id, '코드를 암호화한다', FALSE, 2),
    (gen_random_uuid(), q_id, '메모리를 자동 관리한다', FALSE, 3),
    (gen_random_uuid(), q_id, '에러를 자동 수정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'sort() 메서드의 기본 동작 방식은? (JavaScript 기준)', 'JavaScript의 sort()는 기본적으로 요소를 문자열로 변환하여 유니코드 순으로 정렬합니다.', 1, 53, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요소를 문자열로 변환하여 유니코드 순으로 정렬', TRUE, 1),
    (gen_random_uuid(), q_id, '항상 숫자 오름차순으로 정렬', FALSE, 2),
    (gen_random_uuid(), q_id, '항상 내림차순으로 정렬', FALSE, 3),
    (gen_random_uuid(), q_id, '랜덤으로 섞는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '호이스팅(Hoisting)이란? (JavaScript 기준)', '호이스팅은 변수와 함수 선언이 코드 실행 전에 해당 스코프의 최상단으로 끌어올려지는 동작입니다.', 1, 54, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변수/함수 선언이 스코프 최상단으로 끌어올려지는 동작', TRUE, 1),
    (gen_random_uuid(), q_id, '코드를 서버에 업로드하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '변수를 삭제하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '메모리를 해제하는 것', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '문자열 split() 메서드의 역할은?', 'split()은 구분자를 기준으로 문자열을 분리하여 배열로 반환합니다.', 1, 55, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '구분자를 기준으로 문자열을 분리하여 배열로 반환', TRUE, 1),
    (gen_random_uuid(), q_id, '문자열을 합친다', FALSE, 2),
    (gen_random_uuid(), q_id, '문자열을 뒤집는다', FALSE, 3),
    (gen_random_uuid(), q_id, '문자열을 대문자로 변환한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '스택 오버플로우(Stack Overflow)가 발생하는 원인은?', '재귀 함수의 종료 조건이 없거나 재귀 깊이가 너무 깊으면 스택 메모리가 초과되어 발생합니다.', 1, 56, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '종료 조건 없는 재귀나 과도한 재귀 깊이로 스택 메모리 초과', TRUE, 1),
    (gen_random_uuid(), q_id, '배열의 크기가 너무 클 때', FALSE, 2),
    (gen_random_uuid(), q_id, '변수를 너무 많이 선언할 때', FALSE, 3),
    (gen_random_uuid(), q_id, '인터넷 연결이 끊겼을 때', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '람다 표현식(Lambda Expression)이란?', '람다 표현식은 이름 없는 익명 함수를 간결하게 표현하는 방법입니다.', 1, 57, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '이름 없는 익명 함수를 간결하게 표현하는 방법', TRUE, 1),
    (gen_random_uuid(), q_id, '클래스를 정의하는 방법', FALSE, 2),
    (gen_random_uuid(), q_id, '변수를 선언하는 방법', FALSE, 3),
    (gen_random_uuid(), q_id, '에러를 처리하는 방법', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'LinkedList와 ArrayList의 차이점으로 올바른 것은?', 'ArrayList는 인덱스 접근이 빠르고, LinkedList는 삽입/삭제가 빠릅니다.', 1, 58, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ArrayList는 인덱스 접근 빠름, LinkedList는 삽입/삭제 빠름', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 성능이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'LinkedList가 인덱스 접근이 더 빠르다', FALSE, 3),
    (gen_random_uuid(), q_id, 'ArrayList는 삽입이 더 빠르다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'forEach와 for...of의 차이점은? (JavaScript 기준)', 'forEach는 배열 메서드로 break 사용 불가, for...of는 반복문으로 break 사용 가능합니다.', 1, 59, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'forEach는 break 불가, for...of는 break 가능', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 기능이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'forEach만 객체에 사용 가능', FALSE, 3),
    (gen_random_uuid(), q_id, 'for...of는 배열에 사용 불가', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '깊은 복사(Deep Copy)와 얕은 복사(Shallow Copy)의 차이는?', '얕은 복사는 참조만 복사하고, 깊은 복사는 객체의 모든 레벨을 새로 생성합니다.', 1, 60, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '얕은 복사는 참조 복사, 깊은 복사는 모든 레벨을 새로 생성', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 방식이다', FALSE, 2),
    (gen_random_uuid(), q_id, '깊은 복사가 참조만 복사한다', FALSE, 3),
    (gen_random_uuid(), q_id, '얕은 복사가 모든 레벨을 복사한다', FALSE, 4);

  -- ==========================================
  -- HARD - 30 questions (sort_order 61-90)
  -- ==========================================

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다형성(Polymorphism)이란?', '다형성은 같은 인터페이스/메서드가 다른 타입의 객체에서 다르게 동작하는 OOP 개념입니다.', 1, 61, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '같은 인터페이스가 다른 타입에서 다르게 동작하는 것', TRUE, 1),
    (gen_random_uuid(), q_id, '하나의 클래스만 사용하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '변수 타입을 변환하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터를 암호화하는 것', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'O(n log n) 시간 복잡도를 가지는 정렬 알고리즘은?', '병합 정렬(Merge Sort)은 평균 및 최악의 경우 O(n log n)의 시간 복잡도를 가집니다.', 1, 62, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '병합 정렬 (Merge Sort)', TRUE, 1),
    (gen_random_uuid(), q_id, '버블 정렬 (Bubble Sort)', FALSE, 2),
    (gen_random_uuid(), q_id, '선택 정렬 (Selection Sort)', FALSE, 3),
    (gen_random_uuid(), q_id, '삽입 정렬 (Insertion Sort)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'try-catch-finally에서 finally 블록의 특징은?', 'finally 블록은 예외 발생 여부와 관계없이 항상 실행됩니다.', 1, 63, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '예외 발생 여부와 관계없이 항상 실행된다', TRUE, 1),
    (gen_random_uuid(), q_id, '예외가 발생한 경우에만 실행된다', FALSE, 2),
    (gen_random_uuid(), q_id, '예외가 발생하지 않은 경우에만 실행된다', FALSE, 3),
    (gen_random_uuid(), q_id, '선택적으로 실행된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '캡슐화(Encapsulation)의 주요 목적은?', '캡슐화는 데이터와 메서드를 하나로 묶고, 외부에서의 직접 접근을 제한하여 데이터 보호를 합니다.', 1, 64, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 은닉과 접근 제어를 통한 데이터 보호', TRUE, 1),
    (gen_random_uuid(), q_id, '코드 실행 속도 향상', FALSE, 2),
    (gen_random_uuid(), q_id, '메모리 사용량 감소', FALSE, 3),
    (gen_random_uuid(), q_id, '코드 줄 수 감소', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '이진 탐색(Binary Search)의 시간 복잡도는?', '이진 탐색은 정렬된 배열에서 반씩 줄여가며 탐색하므로 O(log n)입니다.', 1, 65, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(log n)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(n)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n^2)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(1)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '추상 클래스(Abstract Class)와 인터페이스(Interface)의 차이점은?', '추상 클래스는 일부 구현을 포함할 수 있고, 인터페이스는 메서드 시그니처만 정의합니다.', 1, 66, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '추상 클래스는 일부 구현 포함 가능, 인터페이스는 시그니처만', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 것이다', FALSE, 2),
    (gen_random_uuid(), q_id, '인터페이스만 구현 코드를 가질 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '추상 클래스는 인스턴스화할 수 있다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '재귀 함수에서 기저 조건(Base Case)의 역할은?', '기저 조건은 재귀 호출을 중단하는 조건으로, 없으면 무한 재귀에 빠집니다.', 1, 67, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '재귀 호출을 중단하는 조건 (없으면 무한 재귀)', TRUE, 1),
    (gen_random_uuid(), q_id, '함수를 시작하는 조건', FALSE, 2),
    (gen_random_uuid(), q_id, '에러를 처리하는 조건', FALSE, 3),
    (gen_random_uuid(), q_id, '반복문을 시작하는 조건', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SOLID 원칙에서 S(Single Responsibility Principle)의 의미는?', '단일 책임 원칙은 클래스는 하나의 책임만 가져야 한다는 원칙입니다.', 1, 68, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클래스는 하나의 책임만 가져야 한다', TRUE, 1),
    (gen_random_uuid(), q_id, '함수는 하나의 매개변수만 가져야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '파일은 하나의 클래스만 포함해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '변수는 하나의 타입만 가져야 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '해시 테이블의 충돌(Collision) 해결 방법으로 올바른 것은?', '체이닝은 같은 해시 값을 가진 요소를 연결 리스트로 연결하여 충돌을 해결합니다.', 1, 69, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '체이닝 (연결 리스트) 또는 오픈 어드레싱', TRUE, 1),
    (gen_random_uuid(), q_id, '충돌한 데이터를 삭제', FALSE, 2),
    (gen_random_uuid(), q_id, '해시 테이블을 다시 생성', FALSE, 3),
    (gen_random_uuid(), q_id, '충돌을 무시', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '디자인 패턴 중 싱글톤(Singleton) 패턴이란?', '싱글톤 패턴은 클래스의 인스턴스가 하나만 존재하도록 보장하는 패턴입니다.', 1, 70, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클래스의 인스턴스가 하나만 존재하도록 보장', TRUE, 1),
    (gen_random_uuid(), q_id, '여러 인스턴스를 생성하는 패턴', FALSE, 2),
    (gen_random_uuid(), q_id, '객체를 복제하는 패턴', FALSE, 3),
    (gen_random_uuid(), q_id, '인터페이스를 구현하는 패턴', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Promise와 async/await의 관계는?', 'async/await는 Promise를 더 읽기 쉽게 작성하기 위한 문법적 설탕(Syntactic Sugar)입니다.', 1, 71, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'async/await는 Promise를 더 읽기 쉽게 하는 문법적 설탕', TRUE, 1),
    (gen_random_uuid(), q_id, '둘은 완전히 다른 기능이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'async/await가 Promise를 대체했다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Promise가 더 새로운 기술이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'BFS(너비 우선 탐색)와 DFS(깊이 우선 탐색)의 차이점은?', 'BFS는 같은 레벨을 먼저 탐색하고(큐 사용), DFS는 한 경로를 끝까지 탐색합니다(스택/재귀 사용).', 1, 72, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'BFS는 레벨별 탐색(큐), DFS는 경로별 탐색(스택/재귀)', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 순서로 탐색한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'BFS가 항상 더 빠르다', FALSE, 3),
    (gen_random_uuid(), q_id, 'DFS만 그래프에 사용 가능하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '가비지 컬렉션(Garbage Collection)이란?', '가비지 컬렉션은 더 이상 참조되지 않는 객체의 메모리를 자동으로 해제하는 메모리 관리 기법입니다.', 1, 73, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '참조되지 않는 객체의 메모리를 자동 해제하는 기법', TRUE, 1),
    (gen_random_uuid(), q_id, '불필요한 코드를 삭제하는 기능', FALSE, 2),
    (gen_random_uuid(), q_id, '파일을 정리하는 기능', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스를 정리하는 기능', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '옵저버 패턴(Observer Pattern)이란?', '옵저버 패턴은 한 객체의 상태 변화를 관찰하는 여러 객체에 자동 통지하는 패턴입니다.', 1, 74, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '한 객체의 상태 변화를 관찰하는 여러 객체에 자동 통지', TRUE, 1),
    (gen_random_uuid(), q_id, '하나의 인스턴스만 생성하는 패턴', FALSE, 2),
    (gen_random_uuid(), q_id, '객체 생성을 위임하는 패턴', FALSE, 3),
    (gen_random_uuid(), q_id, '알고리즘을 캡슐화하는 패턴', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '동적 프로그래밍(Dynamic Programming)의 핵심 개념은?', '동적 프로그래밍은 부분 문제의 결과를 저장(메모이제이션)하여 중복 계산을 피하는 기법입니다.', 1, 75, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부분 문제 결과를 저장하여 중복 계산을 피하는 기법', TRUE, 1),
    (gen_random_uuid(), q_id, '실행 중에 코드를 수정하는 기법', FALSE, 2),
    (gen_random_uuid(), q_id, '동적으로 변수를 생성하는 기법', FALSE, 3),
    (gen_random_uuid(), q_id, '프로그램을 실시간으로 컴파일하는 기법', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '데드락(Deadlock)이란?', '데드락은 두 개 이상의 프로세스/스레드가 서로 상대방의 자원을 기다리며 무한 대기하는 상태입니다.', 1, 76, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '둘 이상의 프로세스가 서로의 자원을 기다리며 무한 대기', TRUE, 1),
    (gen_random_uuid(), q_id, '프로그램이 갑자기 종료되는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '메모리가 부족한 상태', FALSE, 3),
    (gen_random_uuid(), q_id, 'CPU 사용률이 100%인 상태', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'SOLID 원칙에서 O(Open/Closed Principle)의 의미는?', '개방-폐쇄 원칙은 확장에는 열려 있고, 수정에는 닫혀 있어야 한다는 원칙입니다.', 1, 77, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '확장에는 열려 있고, 수정에는 닫혀 있어야 한다', TRUE, 1),
    (gen_random_uuid(), q_id, '코드는 항상 공개해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '파일은 열고 닫아야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스는 항상 열려 있어야 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '팩토리얼 n!의 재귀적 정의로 올바른 것은?', 'n! = n * (n-1)! (n > 0), 0! = 1로 정의됩니다.', 1, 78, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'n! = n * (n-1)!, 0! = 1', TRUE, 1),
    (gen_random_uuid(), q_id, 'n! = n + (n-1)!, 0! = 0', FALSE, 2),
    (gen_random_uuid(), q_id, 'n! = n * n, 0! = 0', FALSE, 3),
    (gen_random_uuid(), q_id, 'n! = (n+1) * n!, 0! = 1', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '스트래티지 패턴(Strategy Pattern)이란?', '스트래티지 패턴은 알고리즘을 캡슐화하여 런타임에 교체할 수 있게 하는 패턴입니다.', 1, 79, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '알고리즘을 캡슐화하여 런타임에 교체 가능하게 하는 패턴', TRUE, 1),
    (gen_random_uuid(), q_id, '객체를 복제하는 패턴', FALSE, 2),
    (gen_random_uuid(), q_id, '상태를 관리하는 패턴', FALSE, 3),
    (gen_random_uuid(), q_id, '프록시를 사용하는 패턴', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '빅오 표기법에서 O(1)의 의미는?', 'O(1)은 입력 크기에 관계없이 일정한 시간이 걸리는 상수 시간 복잡도입니다.', 1, 80, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '입력 크기에 관계없이 일정한 시간 (상수 시간)', TRUE, 1),
    (gen_random_uuid(), q_id, '1번만 실행된다', FALSE, 2),
    (gen_random_uuid(), q_id, '가장 느린 알고리즘', FALSE, 3),
    (gen_random_uuid(), q_id, '입력이 1개인 경우에만 적용', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '의존성 주입(Dependency Injection)이란?', '의존성 주입은 객체가 필요로 하는 의존 객체를 외부에서 제공받는 설계 패턴입니다.', 1, 81, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '필요한 의존 객체를 외부에서 제공받는 설계 패턴', TRUE, 1),
    (gen_random_uuid(), q_id, '내부에서 직접 객체를 생성하는 패턴', FALSE, 2),
    (gen_random_uuid(), q_id, '전역 변수를 사용하는 패턴', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터를 주입하는 보안 공격', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '이벤트 루프(Event Loop)의 역할은? (JavaScript 기준)', '이벤트 루프는 콜 스택이 비면 태스크 큐에서 콜백을 가져와 실행하는 메커니즘입니다.', 1, 82, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '콜 스택이 비면 태스크 큐에서 콜백을 가져와 실행', TRUE, 1),
    (gen_random_uuid(), q_id, '반복문을 실행하는 메커니즘', FALSE, 2),
    (gen_random_uuid(), q_id, '이벤트를 생성하는 메커니즘', FALSE, 3),
    (gen_random_uuid(), q_id, '메모리를 정리하는 메커니즘', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '힙(Heap) 자료구조의 특징은?', '힙은 완전 이진 트리로, 최대힙은 부모가 항상 자식보다 크고, 최소힙은 부모가 항상 자식보다 작습니다.', 1, 83, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '완전 이진 트리로 부모-자식 간 크기 관계가 보장', TRUE, 1),
    (gen_random_uuid(), q_id, '모든 노드가 정렬되어 있다', FALSE, 2),
    (gen_random_uuid(), q_id, '선형 구조의 자료구조이다', FALSE, 3),
    (gen_random_uuid(), q_id, '키-값 쌍으로 저장된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '커스텀 예외(Custom Exception)를 만드는 이유는?', '커스텀 예외는 도메인 특화된 에러 상황을 명확히 표현하고, 적절한 에러 처리를 가능하게 합니다.', 1, 84, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '도메인 특화 에러를 명확히 표현하고 적절한 처리를 위해', TRUE, 1),
    (gen_random_uuid(), q_id, '코드 줄 수를 늘리기 위해', FALSE, 2),
    (gen_random_uuid(), q_id, '기본 예외가 동작하지 않아서', FALSE, 3),
    (gen_random_uuid(), q_id, '에러를 무시하기 위해', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '그래프(Graph) 자료구조에서 인접 리스트와 인접 행렬의 차이점은?', '인접 리스트는 메모리 효율적(희소 그래프), 인접 행렬은 간선 확인이 O(1)(밀집 그래프)입니다.', 1, 85, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인접 리스트는 메모리 효율적, 인접 행렬은 간선 확인 O(1)', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 성능이다', FALSE, 2),
    (gen_random_uuid(), q_id, '인접 행렬이 항상 더 효율적이다', FALSE, 3),
    (gen_random_uuid(), q_id, '인접 리스트는 사용할 수 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '리스코프 치환 원칙(Liskov Substitution Principle)이란?', '자식 클래스는 부모 클래스를 대체해도 프로그램의 정확성이 유지되어야 한다는 원칙입니다.', 1, 86, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자식 클래스는 부모 클래스를 대체해도 정확성이 유지', TRUE, 1),
    (gen_random_uuid(), q_id, '부모 클래스는 삭제해야 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '상속을 사용하지 말아야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '자식 클래스는 부모보다 작아야 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '멀티스레딩에서 Race Condition이란?', 'Race Condition은 여러 스레드가 공유 자원에 동시에 접근하여 결과가 실행 순서에 따라 달라지는 상태입니다.', 1, 87, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '여러 스레드가 공유 자원에 동시 접근하여 결과가 비결정적', TRUE, 1),
    (gen_random_uuid(), q_id, '스레드가 빠르게 실행되는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '스레드 생성 시 발생하는 에러', FALSE, 3),
    (gen_random_uuid(), q_id, '스레드 간 통신이 불가능한 상태', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '다익스트라(Dijkstra) 알고리즘의 용도는?', '다익스트라 알고리즘은 가중 그래프에서 한 정점에서 다른 모든 정점까지의 최단 경로를 구합니다.', 1, 88, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '가중 그래프에서 최단 경로를 구하는 알고리즘', TRUE, 1),
    (gen_random_uuid(), q_id, '배열을 정렬하는 알고리즘', FALSE, 2),
    (gen_random_uuid(), q_id, '문자열을 검색하는 알고리즘', FALSE, 3),
    (gen_random_uuid(), q_id, '트리를 생성하는 알고리즘', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', 'Checked Exception과 Unchecked Exception의 차이는? (Java 기준)', 'Checked Exception은 컴파일 시 처리를 강제하고, Unchecked Exception은 런타임에 발생합니다.', 1, 89, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Checked는 컴파일 시 처리 강제, Unchecked는 런타임 발생', TRUE, 1),
    (gen_random_uuid(), q_id, '둘 다 같은 것이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Unchecked가 컴파일 시 처리를 강제한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Checked Exception은 처리할 수 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000003-0000-0000-0000-000000000003', 'multiple_choice', '시간 복잡도가 가장 좋은 것부터 나열한 순서는?', 'O(1) < O(log n) < O(n) < O(n log n) < O(n^2) < O(2^n) 순서입니다.', 1, 90, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'O(1) < O(log n) < O(n) < O(n log n) < O(n^2)', TRUE, 1),
    (gen_random_uuid(), q_id, 'O(n^2) < O(n) < O(log n) < O(1)', FALSE, 2),
    (gen_random_uuid(), q_id, 'O(n) < O(1) < O(n^2) < O(log n)', FALSE, 3),
    (gen_random_uuid(), q_id, 'O(log n) < O(1) < O(n) < O(n^2)', FALSE, 4);

END $$;

-- ============================================================
-- Quiz 4: 프레임워크 능력 평가 (Framework) — 90 questions
-- ============================================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== EASY (30 questions): MVC, REST API, HTTP 기초 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC 패턴에서 Controller의 주요 역할은?', 'Controller는 사용자의 입력을 받아 Model과 View를 연결하는 중재자 역할을 합니다.', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사용자 요청을 처리하고 Model과 View를 연결한다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터베이스에 직접 접근하여 데이터를 저장한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTML 페이지를 렌더링한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSS 스타일을 적용한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC 패턴에서 Model이 담당하는 것은?', 'Model은 애플리케이션의 데이터와 비즈니스 로직을 관리합니다.', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터와 비즈니스 로직 관리', TRUE, 1),
    (gen_random_uuid(), q_id, '사용자 인터페이스 표시', FALSE, 2),
    (gen_random_uuid(), q_id, 'URL 라우팅 처리', FALSE, 3),
    (gen_random_uuid(), q_id, '네트워크 통신 관리', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC에서 View의 역할은?', 'View는 Model의 데이터를 사용자에게 보여주는 화면(UI)을 담당합니다.', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사용자에게 데이터를 시각적으로 표시한다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터를 검증하고 저장한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'API 엔드포인트를 정의한다', FALSE, 3),
    (gen_random_uuid(), q_id, '사용자 인증을 처리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP GET 메서드의 주요 용도는?', 'GET은 서버에서 리소스를 조회(읽기)할 때 사용합니다.', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버에서 데이터를 조회한다', TRUE, 1),
    (gen_random_uuid(), q_id, '서버에 새 데이터를 생성한다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버의 데이터를 삭제한다', FALSE, 3),
    (gen_random_uuid(), q_id, '서버의 데이터를 수정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP POST 메서드의 주요 용도는?', 'POST는 서버에 새로운 리소스를 생성할 때 사용합니다.', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버에 새로운 데이터를 생성한다', TRUE, 1),
    (gen_random_uuid(), q_id, '서버에서 데이터를 조회한다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버의 데이터를 삭제한다', FALSE, 3),
    (gen_random_uuid(), q_id, '서버와의 연결을 테스트한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 200의 의미는?', '200 OK는 요청이 성공적으로 처리되었음을 나타냅니다.', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요청 성공 (OK)', TRUE, 1),
    (gen_random_uuid(), q_id, '리소스를 찾을 수 없음', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 내부 오류', FALSE, 3),
    (gen_random_uuid(), q_id, '인증 필요', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 404의 의미는?', '404 Not Found는 요청한 리소스를 서버에서 찾을 수 없음을 의미합니다.', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리소스를 찾을 수 없음 (Not Found)', TRUE, 1),
    (gen_random_uuid(), q_id, '서버 내부 오류', FALSE, 2),
    (gen_random_uuid(), q_id, '요청 성공', FALSE, 3),
    (gen_random_uuid(), q_id, '리다이렉션', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 500의 의미는?', '500 Internal Server Error는 서버 내부에서 예기치 않은 오류가 발생했음을 나타냅니다.', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버 내부 오류 (Internal Server Error)', TRUE, 1),
    (gen_random_uuid(), q_id, '잘못된 요청', FALSE, 2),
    (gen_random_uuid(), q_id, '요청 성공', FALSE, 3),
    (gen_random_uuid(), q_id, '리소스를 찾을 수 없음', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 리소스를 삭제할 때 사용하는 HTTP 메서드는?', 'DELETE 메서드는 서버의 특정 리소스를 삭제할 때 사용합니다.', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DELETE', TRUE, 1),
    (gen_random_uuid(), q_id, 'REMOVE', FALSE, 2),
    (gen_random_uuid(), q_id, 'POST', FALSE, 3),
    (gen_random_uuid(), q_id, 'GET', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 기존 리소스를 수정할 때 주로 사용하는 HTTP 메서드는?', 'PUT은 리소스 전체를 교체하고, PATCH는 부분 수정에 사용합니다. 일반적으로 수정에는 PUT을 많이 사용합니다.', 1, 10, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PUT', TRUE, 1),
    (gen_random_uuid(), q_id, 'POST', FALSE, 2),
    (gen_random_uuid(), q_id, 'GET', FALSE, 3),
    (gen_random_uuid(), q_id, 'DELETE', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST에서 "Stateless"의 의미는?', 'Stateless는 각 요청이 독립적이며 서버가 클라이언트의 상태를 저장하지 않는 것을 의미합니다.', 1, 11, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버가 클라이언트 상태를 저장하지 않는다', TRUE, 1),
    (gen_random_uuid(), q_id, '서버가 항상 같은 응답을 반환한다', FALSE, 2),
    (gen_random_uuid(), q_id, '클라이언트가 서버에 상태를 저장한다', FALSE, 3),
    (gen_random_uuid(), q_id, '요청에 인증이 필요 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JSON의 정식 명칭은?', 'JSON은 JavaScript Object Notation의 약자로, 경량 데이터 교환 형식입니다.', 1, 12, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JavaScript Object Notation', TRUE, 1),
    (gen_random_uuid(), q_id, 'Java Standard Object Notation', FALSE, 2),
    (gen_random_uuid(), q_id, 'JavaScript Open Network', FALSE, 3),
    (gen_random_uuid(), q_id, 'Java Serialized Object Name', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'API란 무엇인가?', 'API(Application Programming Interface)는 소프트웨어 간 상호작용을 위한 인터페이스입니다.', 1, 13, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '소프트웨어 간 상호작용을 위한 인터페이스', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터베이스 관리 시스템', FALSE, 2),
    (gen_random_uuid(), q_id, '프로그래밍 언어의 한 종류', FALSE, 3),
    (gen_random_uuid(), q_id, '웹 브라우저의 기능', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 201의 의미는?', '201 Created는 요청이 성공하여 새로운 리소스가 생성되었음을 나타냅니다.', 1, 14, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리소스가 성공적으로 생성됨 (Created)', TRUE, 1),
    (gen_random_uuid(), q_id, '요청이 수락되었으나 처리 중', FALSE, 2),
    (gen_random_uuid(), q_id, '리다이렉션 필요', FALSE, 3),
    (gen_random_uuid(), q_id, '권한 없음', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 401의 의미는?', '401 Unauthorized는 인증이 필요하거나 인증에 실패했음을 나타냅니다.', 1, 15, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '인증 필요 또는 인증 실패 (Unauthorized)', TRUE, 1),
    (gen_random_uuid(), q_id, '요청 금지 (Forbidden)', FALSE, 2),
    (gen_random_uuid(), q_id, '리소스를 찾을 수 없음', FALSE, 3),
    (gen_random_uuid(), q_id, '서버 내부 오류', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'URL에서 쿼리 파라미터를 시작하는 기호는?', 'URL에서 쿼리 문자열은 물음표(?)로 시작합니다. 예: /users?page=1', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '? (물음표)', TRUE, 1),
    (gen_random_uuid(), q_id, '& (앰퍼샌드)', FALSE, 2),
    (gen_random_uuid(), q_id, '# (해시)', FALSE, 3),
    (gen_random_uuid(), q_id, '/ (슬래시)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 /users/123은 무엇을 의미하는가?', '/users/123은 users 리소스 중 ID가 123인 특정 사용자를 나타냅니다.', 1, 17, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ID가 123인 특정 사용자 리소스', TRUE, 1),
    (gen_random_uuid(), q_id, '123번째 페이지의 사용자 목록', FALSE, 2),
    (gen_random_uuid(), q_id, '123명의 사용자 조회', FALSE, 3),
    (gen_random_uuid(), q_id, '사용자 123명 삭제', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 요청 시 헤더(Header)의 역할은?', 'HTTP 헤더는 요청/응답에 대한 메타데이터(인증 토큰, 콘텐츠 타입 등)를 전달합니다.', 1, 18, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요청/응답의 메타데이터를 전달한다', TRUE, 1),
    (gen_random_uuid(), q_id, '실제 데이터(본문)를 전달한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'URL을 지정한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'HTML을 렌더링한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Content-Type: application/json은 무엇을 의미하는가?', 'Content-Type 헤더는 요청/응답 본문의 데이터 형식을 나타내며, application/json은 JSON 형식을 의미합니다.', 1, 19, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '요청/응답 본문이 JSON 형식임을 나타낸다', TRUE, 1),
    (gen_random_uuid(), q_id, '서버가 JSON만 지원한다는 뜻이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'URL이 JSON 파일을 가리킨다', FALSE, 3),
    (gen_random_uuid(), q_id, 'JavaScript 파일을 실행한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '프레임워크(Framework)와 라이브러리(Library)의 차이점은?', '프레임워크는 전체 구조를 제공하고 개발자의 코드를 호출(IoC)하는 반면, 라이브러리는 개발자가 필요할 때 호출합니다.', 1, 20, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '프레임워크는 제어의 역전(IoC)이 있고, 라이브러리는 개발자가 호출한다', TRUE, 1),
    (gen_random_uuid(), q_id, '프레임워크가 라이브러리보다 파일 크기가 크다', FALSE, 2),
    (gen_random_uuid(), q_id, '라이브러리는 무료이고 프레임워크는 유료이다', FALSE, 3),
    (gen_random_uuid(), q_id, '차이가 없다, 같은 의미이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CRUD는 무엇의 약자인가?', 'CRUD는 Create(생성), Read(읽기), Update(수정), Delete(삭제)의 약자로 기본적인 데이터 조작 연산입니다.', 1, 21, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Create, Read, Update, Delete', TRUE, 1),
    (gen_random_uuid(), q_id, 'Copy, Read, Undo, Delete', FALSE, 2),
    (gen_random_uuid(), q_id, 'Create, Run, Upload, Download', FALSE, 3),
    (gen_random_uuid(), q_id, 'Connect, Retrieve, Update, Disconnect', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 403의 의미는?', '403 Forbidden은 서버가 요청을 이해했으나 권한이 없어 거부했음을 나타냅니다.', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '접근 금지 (Forbidden)', TRUE, 1),
    (gen_random_uuid(), q_id, '인증 필요 (Unauthorized)', FALSE, 2),
    (gen_random_uuid(), q_id, '리소스를 찾을 수 없음', FALSE, 3),
    (gen_random_uuid(), q_id, '요청 시간 초과', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GET과 POST의 가장 큰 차이점은?', 'GET은 데이터를 조회하며 URL에 파라미터를 포함하고, POST는 데이터를 생성하며 요청 본문에 데이터를 포함합니다.', 1, 23, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GET은 데이터 조회, POST는 데이터 생성에 사용한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'GET은 느리고 POST는 빠르다', FALSE, 2),
    (gen_random_uuid(), q_id, 'GET은 보안이 높고 POST는 낮다', FALSE, 3),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 302의 의미는?', '302 Found는 요청한 리소스가 일시적으로 다른 URL로 이동했음을 나타냅니다(리다이렉트).', 1, 24, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '임시 리다이렉트 (Found)', TRUE, 1),
    (gen_random_uuid(), q_id, '요청 성공', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 오류', FALSE, 3),
    (gen_random_uuid(), q_id, '요청 형식 오류', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTPS에서 S가 의미하는 것은?', 'HTTPS의 S는 Secure의 약자로, SSL/TLS를 사용한 암호화 통신을 의미합니다.', 1, 25, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Secure (보안)', TRUE, 1),
    (gen_random_uuid(), q_id, 'Server (서버)', FALSE, 2),
    (gen_random_uuid(), q_id, 'Speed (속도)', FALSE, 3),
    (gen_random_uuid(), q_id, 'Standard (표준)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST API에서 PATCH와 PUT의 차이점은?', 'PUT은 리소스 전체를 교체하고, PATCH는 리소스의 일부만 수정합니다.', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'PUT은 전체 교체, PATCH는 부분 수정', TRUE, 1),
    (gen_random_uuid(), q_id, 'PUT은 생성, PATCH는 삭제', FALSE, 2),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, 'PATCH가 PUT보다 빠르다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 요청에서 Body(본문)는 주로 어떤 메서드에서 사용하는가?', 'POST, PUT, PATCH 메서드는 요청 본문에 데이터를 포함하여 전송합니다. GET은 일반적으로 본문을 사용하지 않습니다.', 1, 27, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'POST, PUT, PATCH', TRUE, 1),
    (gen_random_uuid(), q_id, 'GET, HEAD', FALSE, 2),
    (gen_random_uuid(), q_id, 'DELETE만', FALSE, 3),
    (gen_random_uuid(), q_id, '모든 메서드에서 동일하게 사용', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'MVC 패턴을 사용하는 주요 이점은?', 'MVC 패턴은 관심사의 분리(Separation of Concerns)를 통해 코드의 유지보수성과 확장성을 높입니다.', 1, 28, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '관심사의 분리로 유지보수성이 높아진다', TRUE, 1),
    (gen_random_uuid(), q_id, '코드 실행 속도가 빨라진다', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 성능이 향상된다', FALSE, 3),
    (gen_random_uuid(), q_id, '보안이 자동으로 강화된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'HTTP 상태 코드 400의 의미는?', '400 Bad Request는 클라이언트의 요청 문법이 잘못되었거나 유효하지 않은 요청임을 나타냅니다.', 1, 29, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '잘못된 요청 (Bad Request)', TRUE, 1),
    (gen_random_uuid(), q_id, '인증 실패', FALSE, 2),
    (gen_random_uuid(), q_id, '서버 내부 오류', FALSE, 3),
    (gen_random_uuid(), q_id, '요청 시간 초과', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'REST의 정식 명칭은?', 'REST는 Representational State Transfer의 약자로 분산 시스템 설계를 위한 아키텍처 스타일입니다.', 1, 30, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Representational State Transfer', TRUE, 1),
    (gen_random_uuid(), q_id, 'Remote Execution System Transfer', FALSE, 2),
    (gen_random_uuid(), q_id, 'Request-Response Standard Technology', FALSE, 3),
    (gen_random_uuid(), q_id, 'Resource Exchange and Storage Technology', FALSE, 4);

  -- ===== MEDIUM (30 questions): Spring Boot, React, Routing =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @RestController와 @Controller의 차이점은?', '@RestController는 @Controller + @ResponseBody를 결합한 것으로, 메서드 반환값을 JSON/XML 등으로 직접 응답합니다.', 1, 31, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@RestController는 반환값을 직접 HTTP 응답 본문으로 전달한다', TRUE, 1),
    (gen_random_uuid(), q_id, '@RestController는 View를 렌더링한다', FALSE, 2),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 3),
    (gen_random_uuid(), q_id, '@Controller가 REST API용이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Autowired의 역할은?', '@Autowired는 의존성 주입(DI)을 자동으로 수행하여 필요한 빈(Bean)을 주입합니다.', 1, 32, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '의존성을 자동으로 주입한다', TRUE, 1),
    (gen_random_uuid(), q_id, '클래스를 자동으로 생성한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTP 요청을 자동으로 매핑한다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스 연결을 자동으로 설정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @RequestMapping의 역할은?', '@RequestMapping은 HTTP 요청 URL을 컨트롤러의 메서드에 매핑합니다.', 1, 33, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTP 요청 URL을 컨트롤러 메서드에 매핑한다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터베이스 테이블을 매핑한다', FALSE, 2),
    (gen_random_uuid(), q_id, '의존성을 주입한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'JSON을 자바 객체로 변환한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Service 어노테이션의 용도는?', '@Service는 비즈니스 로직을 담당하는 서비스 계층의 클래스에 사용하는 스테레오타입 어노테이션입니다.', 1, 34, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비즈니스 로직을 담당하는 서비스 클래스를 나타낸다', TRUE, 1),
    (gen_random_uuid(), q_id, 'REST API 엔드포인트를 정의한다', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 엔티티를 정의한다', FALSE, 3),
    (gen_random_uuid(), q_id, '설정 파일을 로드한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Repository 어노테이션의 용도는?', '@Repository는 데이터 액세스 계층(DAO)의 클래스에 사용하며, DB 예외를 스프링 예외로 변환합니다.', 1, 35, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 액세스 계층(DAO) 클래스를 나타낸다', TRUE, 1),
    (gen_random_uuid(), q_id, '컨트롤러 클래스를 나타낸다', FALSE, 2),
    (gen_random_uuid(), q_id, '설정 클래스를 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '테스트 클래스를 나타낸다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useState 훅의 역할은?', 'useState는 함수형 컴포넌트에서 상태(state)를 관리하기 위한 React 훅입니다.', 1, 36, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '함수형 컴포넌트에서 상태를 관리한다', TRUE, 1),
    (gen_random_uuid(), q_id, '사이드 이펙트를 처리한다', FALSE, 2),
    (gen_random_uuid(), q_id, '컴포넌트 간 데이터를 전달한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'API 호출을 관리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useEffect 훅의 역할은?', 'useEffect는 컴포넌트의 사이드 이펙트(API 호출, DOM 조작, 구독 등)를 처리합니다.', 1, 37, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '사이드 이펙트(API 호출, 구독 등)를 처리한다', TRUE, 1),
    (gen_random_uuid(), q_id, '상태를 관리한다', FALSE, 2),
    (gen_random_uuid(), q_id, '컴포넌트를 렌더링한다', FALSE, 3),
    (gen_random_uuid(), q_id, '이벤트 핸들러를 등록한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 props의 역할은?', 'props는 부모 컴포넌트에서 자식 컴포넌트로 데이터를 전달하는 메커니즘입니다.', 1, 38, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '부모에서 자식 컴포넌트로 데이터를 전달한다', TRUE, 1),
    (gen_random_uuid(), q_id, '컴포넌트 내부 상태를 관리한다', FALSE, 2),
    (gen_random_uuid(), q_id, '브라우저 이벤트를 처리한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSS 스타일을 적용한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'SPA(Single Page Application)란?', 'SPA는 하나의 HTML 페이지에서 JavaScript로 콘텐츠를 동적으로 교체하여 페이지 전환 없이 동작하는 웹 앱입니다.', 1, 39, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하나의 페이지에서 동적으로 콘텐츠를 교체하는 웹 앱', TRUE, 1),
    (gen_random_uuid(), q_id, '한 페이지에 모든 기능을 담은 간단한 웹사이트', FALSE, 2),
    (gen_random_uuid(), q_id, '서버에서 매번 새 페이지를 렌더링하는 웹 앱', FALSE, 3),
    (gen_random_uuid(), q_id, '모바일 전용 웹 앱', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 Virtual DOM의 역할은?', 'Virtual DOM은 실제 DOM의 가상 복사본으로, 변경 사항을 효율적으로 비교(diffing)하여 최소한의 DOM 업데이트만 수행합니다.', 1, 40, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '변경 사항을 비교하여 최소한의 DOM 업데이트를 수행한다', TRUE, 1),
    (gen_random_uuid(), q_id, '서버에서 HTML을 미리 렌더링한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'CSS 애니메이션을 최적화한다', FALSE, 3),
    (gen_random_uuid(), q_id, '브라우저 메모리를 절약한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js에서 SSR(Server-Side Rendering)의 장점은?', 'SSR은 서버에서 HTML을 미리 렌더링하여 초기 로딩 속도를 개선하고 SEO에 유리합니다.', 1, 41, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '초기 로딩 속도 개선과 SEO 향상', TRUE, 1),
    (gen_random_uuid(), q_id, '클라이언트 측 자바스크립트 실행 속도 향상', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 쿼리 최적화', FALSE, 3),
    (gen_random_uuid(), q_id, 'CSS 번들 크기 감소', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @GetMapping의 역할은?', '@GetMapping은 HTTP GET 요청을 특정 메서드에 매핑하는 축약형 어노테이션입니다(@RequestMapping(method = GET)의 축약).', 1, 42, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTP GET 요청을 특정 메서드에 매핑한다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터베이스에서 데이터를 가져온다', FALSE, 2),
    (gen_random_uuid(), q_id, '의존성을 주입한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'JSON을 파싱한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 컴포넌트의 key prop이 필요한 이유는?', 'key는 리스트 렌더링 시 각 요소를 고유하게 식별하여 React가 효율적으로 DOM을 업데이트할 수 있게 합니다.', 1, 43, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리스트 요소를 고유하게 식별하여 효율적 업데이트를 돕는다', TRUE, 1),
    (gen_random_uuid(), q_id, 'CSS 스타일을 적용하기 위해 필요하다', FALSE, 2),
    (gen_random_uuid(), q_id, '이벤트 핸들러를 연결하기 위해 필요하다', FALSE, 3),
    (gen_random_uuid(), q_id, '컴포넌트 간 데이터를 전달하기 위해 필요하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot의 application.properties 파일의 용도는?', 'application.properties는 DB 연결, 서버 포트, 로깅 등 애플리케이션 설정을 외부화하는 파일입니다.', 1, 44, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '애플리케이션 설정(DB, 포트 등)을 외부화한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'Java 소스 코드를 컴파일한다', FALSE, 2),
    (gen_random_uuid(), q_id, '의존성 목록을 관리한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'API 문서를 생성한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Router에서 <Route path="/users/:id">의 :id는 무엇인가?', ':id는 URL 파라미터(동적 세그먼트)로, /users/123에서 id=123으로 추출됩니다.', 1, 45, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'URL에서 동적으로 변하는 파라미터(동적 세그먼트)', TRUE, 1),
    (gen_random_uuid(), q_id, 'CSS 선택자', FALSE, 2),
    (gen_random_uuid(), q_id, '정적 파일 경로', FALSE, 3),
    (gen_random_uuid(), q_id, '쿼리 파라미터', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 의존성 주입(DI)의 장점은?', 'DI는 객체 간 결합도를 낮추고 테스트 용이성을 높이며 코드 재사용성을 향상시킵니다.', 1, 46, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결합도를 낮추고 테스트 용이성을 높인다', TRUE, 1),
    (gen_random_uuid(), q_id, '코드 실행 속도를 높인다', FALSE, 2),
    (gen_random_uuid(), q_id, '메모리 사용량을 줄인다', FALSE, 3),
    (gen_random_uuid(), q_id, 'UI를 자동 생성한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 조건부 렌더링을 구현하는 올바른 방법은?', 'React에서는 삼항 연산자, &&, if문 등으로 조건부 렌더링을 구현합니다.', 1, 47, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '{condition ? <A /> : <B />} 삼항 연산자 사용', TRUE, 1),
    (gen_random_uuid(), q_id, 'display: none CSS 속성만 사용', FALSE, 2),
    (gen_random_uuid(), q_id, 'v-if 디렉티브 사용', FALSE, 3),
    (gen_random_uuid(), q_id, '#if 전처리기 사용', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @PathVariable의 역할은?', '@PathVariable은 URL 경로의 변수를 메서드 파라미터에 바인딩합니다. 예: /users/{id}에서 id를 추출합니다.', 1, 48, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'URL 경로의 변수를 메서드 파라미터에 바인딩한다', TRUE, 1),
    (gen_random_uuid(), q_id, '쿼리 파라미터를 바인딩한다', FALSE, 2),
    (gen_random_uuid(), q_id, '요청 본문을 바인딩한다', FALSE, 3),
    (gen_random_uuid(), q_id, '응답 헤더를 설정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 이벤트 핸들링 시 onClick={handleClick}과 onClick={handleClick()}의 차이는?', 'onClick={handleClick}은 함수 참조를 전달하고, onClick={handleClick()}은 렌더링 시 즉시 실행됩니다.', 1, 49, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전자는 함수 참조 전달, 후자는 렌더링 시 즉시 실행', TRUE, 1),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '전자는 느리고 후자가 빠르다', FALSE, 3),
    (gen_random_uuid(), q_id, '전자는 클래스 컴포넌트, 후자는 함수 컴포넌트용', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @RequestBody의 역할은?', '@RequestBody는 HTTP 요청 본문(JSON 등)을 자바 객체로 역직렬화하여 메서드 파라미터에 바인딩합니다.', 1, 50, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTP 요청 본문을 자바 객체로 변환한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'URL 경로 변수를 바인딩한다', FALSE, 2),
    (gen_random_uuid(), q_id, '응답 본문을 설정한다', FALSE, 3),
    (gen_random_uuid(), q_id, '쿠키 값을 읽는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React의 JSX란 무엇인가?', 'JSX는 JavaScript XML의 약자로, JavaScript 안에서 HTML과 유사한 문법을 사용할 수 있게 해주는 확장 문법입니다.', 1, 51, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JavaScript에서 HTML과 유사한 문법을 사용하는 확장 문법', TRUE, 1),
    (gen_random_uuid(), q_id, 'JavaScript의 새로운 버전', FALSE, 2),
    (gen_random_uuid(), q_id, 'Java Server Extension', FALSE, 3),
    (gen_random_uuid(), q_id, '서버 사이드 렌더링 엔진', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js에서 App Router의 파일 기반 라우팅에서 page.tsx의 역할은?', 'Next.js App Router에서 page.tsx는 해당 경로의 UI를 정의하는 파일로, 폴더 구조가 곧 URL 경로가 됩니다.', 1, 52, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '해당 경로의 UI를 정의하는 페이지 컴포넌트', TRUE, 1),
    (gen_random_uuid(), q_id, '전역 레이아웃을 정의하는 파일', FALSE, 2),
    (gen_random_uuid(), q_id, 'API 엔드포인트를 정의하는 파일', FALSE, 3),
    (gen_random_uuid(), q_id, '에러 처리를 위한 파일', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Entity 어노테이션의 역할은?', '@Entity는 해당 클래스가 JPA 엔티티(DB 테이블과 매핑되는 객체)임을 나타냅니다.', 1, 53, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '클래스를 데이터베이스 테이블과 매핑되는 JPA 엔티티로 지정한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'REST API 엔드포인트를 생성한다', FALSE, 2),
    (gen_random_uuid(), q_id, '서비스 계층 클래스를 나타낸다', FALSE, 3),
    (gen_random_uuid(), q_id, '설정 파일을 로드한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useContext 훅의 역할은?', 'useContext는 Context API를 통해 컴포넌트 트리에서 prop drilling 없이 데이터를 전달합니다.', 1, 54, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'prop drilling 없이 컴포넌트 트리에서 데이터를 전달한다', TRUE, 1),
    (gen_random_uuid(), q_id, '로컬 상태를 관리한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'API를 호출한다', FALSE, 3),
    (gen_random_uuid(), q_id, '라우팅을 처리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @Transactional의 역할은?', '@Transactional은 메서드를 트랜잭션으로 감싸 DB 작업의 원자성을 보장합니다. 실패 시 자동 롤백됩니다.', 1, 55, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'DB 작업의 원자성을 보장하고 실패 시 롤백한다', TRUE, 1),
    (gen_random_uuid(), q_id, '비동기 처리를 활성화한다', FALSE, 2),
    (gen_random_uuid(), q_id, '캐시를 활성화한다', FALSE, 3),
    (gen_random_uuid(), q_id, '로깅을 활성화한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useMemo 훅의 용도는?', 'useMemo는 계산 비용이 높은 값을 메모이제이션하여 불필요한 재계산을 방지합니다.', 1, 56, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '비용이 높은 계산 결과를 메모이제이션한다', TRUE, 1),
    (gen_random_uuid(), q_id, '상태를 관리한다', FALSE, 2),
    (gen_random_uuid(), q_id, '사이드 이펙트를 처리한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'DOM 요소에 접근한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js에서 layout.tsx 파일의 역할은?', 'layout.tsx는 하위 경로들에 공통 레이아웃(네비게이션, 사이드바 등)을 적용하며 상태를 유지합니다.', 1, 57, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '하위 경로에 공통 레이아웃을 적용하고 상태를 유지한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'API 라우트를 정의한다', FALSE, 2),
    (gen_random_uuid(), q_id, '에러 페이지를 표시한다', FALSE, 3),
    (gen_random_uuid(), q_id, '정적 파일을 서빙한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @PostMapping의 역할은?', '@PostMapping은 HTTP POST 요청을 특정 메서드에 매핑하는 축약형 어노테이션입니다.', 1, 58, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'HTTP POST 요청을 특정 메서드에 매핑한다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터베이스에 데이터를 삽입한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'JSON을 파싱한다', FALSE, 3),
    (gen_random_uuid(), q_id, '파일을 업로드한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 useRef 훅의 용도는?', 'useRef는 리렌더링 없이 값을 유지하거나 DOM 요소에 직접 접근하기 위해 사용합니다.', 1, 59, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '리렌더링 없이 값을 유지하거나 DOM에 접근한다', TRUE, 1),
    (gen_random_uuid(), q_id, '상태를 관리하고 리렌더링을 트리거한다', FALSE, 2),
    (gen_random_uuid(), q_id, '사이드 이펙트를 처리한다', FALSE, 3),
    (gen_random_uuid(), q_id, '메모이제이션을 수행한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @SpringBootApplication의 역할은?', '@SpringBootApplication은 @Configuration, @EnableAutoConfiguration, @ComponentScan을 결합한 메인 어노테이션입니다.', 1, 60, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '@Configuration + @EnableAutoConfiguration + @ComponentScan 결합', TRUE, 1),
    (gen_random_uuid(), q_id, '웹 서버를 시작하는 역할만 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 설정만 담당한다', FALSE, 3),
    (gen_random_uuid(), q_id, '보안 설정을 활성화한다', FALSE, 4);

  -- ===== HARD (30 questions): DB설계, 상태관리, ORM, 배포/CI/CD =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스 정규화(Normalization)의 주요 목적은?', '정규화는 데이터 중복을 최소화하고 데이터 무결성을 보장하기 위해 테이블을 분리하는 과정입니다.', 1, 61, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터 중복을 최소화하고 무결성을 보장한다', TRUE, 1),
    (gen_random_uuid(), q_id, '쿼리 실행 속도를 최대화한다', FALSE, 2),
    (gen_random_uuid(), q_id, '테이블 수를 최소화한다', FALSE, 3),
    (gen_random_uuid(), q_id, '인덱스를 자동 생성한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Redux와 React Context API의 주요 차이점은?', 'Redux는 예측 가능한 상태 관리와 미들웨어/DevTools를 제공하고, Context API는 가벼운 상태 공유에 적합합니다.', 1, 62, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Redux는 미들웨어/DevTools 지원, Context는 경량 상태 공유용', TRUE, 1),
    (gen_random_uuid(), q_id, '차이가 없다, 동일한 기능이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Context API가 Redux보다 성능이 항상 좋다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Redux는 클래스 컴포넌트 전용이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Docker 컨테이너란?', 'Docker 컨테이너는 애플리케이션과 그 의존성을 격리된 환경에서 실행하는 경량 가상화 단위입니다.', 1, 63, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '앱과 의존성을 격리된 환경에서 실행하는 경량 가상화 단위', TRUE, 1),
    (gen_random_uuid(), q_id, '가상 머신(VM)과 동일한 것이다', FALSE, 2),
    (gen_random_uuid(), q_id, '코드 저장소의 한 종류이다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스 관리 도구이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ORM(Object-Relational Mapping)의 장점은?', 'ORM은 객체지향 코드로 DB를 조작할 수 있게 하여 생산성을 높이고 SQL 작성을 줄여줍니다.', 1, 64, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '객체지향 코드로 DB를 조작하여 생산성을 높인다', TRUE, 1),
    (gen_random_uuid(), q_id, 'SQL 쿼리 성능이 항상 최적화된다', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터베이스 없이 개발할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '프론트엔드와 백엔드를 통합한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CI/CD에서 CI(Continuous Integration)의 의미는?', 'CI는 개발자들의 코드 변경사항을 자주(매일) 메인 브랜치에 통합하고 자동 빌드/테스트를 수행하는 것입니다.', 1, 65, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '코드를 자주 통합하고 자동 빌드/테스트를 수행하는 것', TRUE, 1),
    (gen_random_uuid(), q_id, '운영 서버에 자동 배포하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '코드 리뷰를 자동화하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '이슈 트래킹을 자동화하는 것', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'N+1 쿼리 문제란?', 'N+1 문제는 1개의 쿼리로 N개의 결과를 가져온 후, 각 결과에 대해 추가 쿼리를 실행하여 총 N+1개의 쿼리가 발생하는 성능 문제입니다.', 1, 66, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '1개 조회 후 N개의 추가 쿼리가 발생하는 성능 문제', TRUE, 1),
    (gen_random_uuid(), q_id, 'N개의 테이블에 1개의 레코드만 있는 문제', FALSE, 2),
    (gen_random_uuid(), q_id, '인덱스가 N+1개 생성되는 문제', FALSE, 3),
    (gen_random_uuid(), q_id, 'N개의 커넥션이 동시에 필요한 문제', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JPA에서 @OneToMany 관계의 fetch 전략 중 LAZY의 의미는?', 'LAZY 로딩은 연관 엔티티를 실제로 접근할 때까지 로딩을 지연시키는 전략입니다.', 1, 67, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '연관 엔티티를 실제 접근 시점에 로딩한다', TRUE, 1),
    (gen_random_uuid(), q_id, '연관 엔티티를 즉시 함께 로딩한다', FALSE, 2),
    (gen_random_uuid(), q_id, '연관 엔티티를 캐시에서 로딩한다', FALSE, 3),
    (gen_random_uuid(), q_id, '연관 엔티티를 비동기로 로딩한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Dockerfile에서 COPY와 ADD의 차이점은?', 'COPY는 단순 파일 복사만 하고, ADD는 tar 압축 해제와 URL 다운로드 기능을 추가로 지원합니다.', 1, 68, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ADD는 tar 해제와 URL 다운로드를 추가 지원한다', TRUE, 1),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, 'COPY가 ADD보다 더 많은 기능을 제공한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'ADD는 보안상 사용이 금지되어 있다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Redux에서 미들웨어(Middleware)의 역할은?', '미들웨어는 액션이 리듀서에 도달하기 전에 가로채어 비동기 로직, 로깅, 에러 처리 등을 수행합니다.', 1, 69, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '액션이 리듀서에 도달하기 전에 비동기 로직 등을 수행한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'UI 컴포넌트를 렌더링한다', FALSE, 2),
    (gen_random_uuid(), q_id, '상태를 직접 수정한다', FALSE, 3),
    (gen_random_uuid(), q_id, 'API 서버 역할을 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 인덱스(Index)를 과도하게 생성하면 발생하는 문제는?', '인덱스가 많으면 INSERT/UPDATE/DELETE 시 인덱스 갱신 오버헤드가 증가하고 저장 공간을 추가로 소비합니다.', 1, 70, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '쓰기 성능 저하와 저장 공간 증가', TRUE, 1),
    (gen_random_uuid(), q_id, '읽기 성능이 저하된다', FALSE, 2),
    (gen_random_uuid(), q_id, '데이터가 손상된다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터베이스가 자동으로 삭제한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Docker Compose의 역할은?', 'Docker Compose는 여러 컨테이너로 구성된 애플리케이션을 YAML 파일로 정의하고 한 번에 관리합니다.', 1, 71, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '여러 컨테이너를 YAML로 정의하고 한 번에 관리한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'Docker 이미지를 빌드한다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Docker Hub에 이미지를 업로드한다', FALSE, 3),
    (gen_random_uuid(), q_id, '컨테이너의 CPU를 제한한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'JPA에서 영속성 컨텍스트(Persistence Context)란?', '영속성 컨텍스트는 엔티티를 관리하는 1차 캐시로, 동일 트랜잭션에서 같은 엔티티를 반복 조회 시 DB를 다시 조회하지 않습니다.', 1, 72, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '엔티티를 관리하는 1차 캐시로 반복 DB 조회를 방지한다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터베이스 연결 풀이다', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTP 세션 저장소이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'JSON 직렬화 도구이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CD(Continuous Deployment)와 Continuous Delivery의 차이는?', 'Continuous Delivery는 수동 승인 후 배포하고, Continuous Deployment는 테스트 통과 시 자동 운영 배포합니다.', 1, 73, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Delivery는 수동 승인 필요, Deployment는 자동 운영 배포', TRUE, 1),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 2),
    (gen_random_uuid(), q_id, 'Delivery가 더 자동화된 것이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'Deployment는 테스트 환경만 대상이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 역정규화(Denormalization)를 하는 이유는?', '역정규화는 조회 성능 향상을 위해 의도적으로 데이터 중복을 허용하는 것입니다.', 1, 74, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '조회 성능 향상을 위해 의도적으로 데이터 중복을 허용한다', TRUE, 1),
    (gen_random_uuid(), q_id, '데이터 무결성을 더 강화하기 위해', FALSE, 2),
    (gen_random_uuid(), q_id, '테이블 수를 줄이기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '인덱스를 자동 생성하기 위해', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React에서 서버 컴포넌트(Server Component)의 특징은?', '서버 컴포넌트는 서버에서만 렌더링되어 클라이언트 번들에 포함되지 않으며, DB 직접 접근이 가능합니다.', 1, 75, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서버에서만 렌더링되고 클라이언트 번들에 포함되지 않는다', TRUE, 1),
    (gen_random_uuid(), q_id, '클라이언트에서만 렌더링된다', FALSE, 2),
    (gen_random_uuid(), q_id, 'useState를 사용할 수 있다', FALSE, 3),
    (gen_random_uuid(), q_id, '이벤트 핸들러를 등록할 수 있다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 @ControllerAdvice의 역할은?', '@ControllerAdvice는 전역 예외 처리, 데이터 바인딩, 모델 속성 추가를 위한 AOP 기반 어드바이저입니다.', 1, 76, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '전역 예외 처리와 공통 로직을 AOP로 적용한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'API 문서를 자동 생성한다', FALSE, 2),
    (gen_random_uuid(), q_id, '보안 필터를 설정한다', FALSE, 3),
    (gen_random_uuid(), q_id, '트랜잭션을 관리한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GitHub Actions에서 workflow의 trigger 이벤트로 적절하지 않은 것은?', 'push, pull_request, schedule 등이 trigger 이벤트이며, database_change는 GitHub Actions 이벤트가 아닙니다.', 1, 77, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'database_change', TRUE, 1),
    (gen_random_uuid(), q_id, 'push', FALSE, 2),
    (gen_random_uuid(), q_id, 'pull_request', FALSE, 3),
    (gen_random_uuid(), q_id, 'schedule', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Zustand와 Redux를 비교했을 때 Zustand의 장점은?', 'Zustand는 보일러플레이트가 적고, 설정이 간단하며, 번들 크기가 작습니다.', 1, 78, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '보일러플레이트가 적고 설정이 간단하며 가볍다', TRUE, 1),
    (gen_random_uuid(), q_id, 'DevTools 지원이 더 강력하다', FALSE, 2),
    (gen_random_uuid(), q_id, '미들웨어 생태계가 더 풍부하다', FALSE, 3),
    (gen_random_uuid(), q_id, '서버 사이드 렌더링을 기본 지원한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 트랜잭션의 ACID 속성 중 Isolation이란?', 'Isolation(격리성)은 동시에 실행되는 트랜잭션들이 서로 영향을 주지 않도록 격리하는 것입니다.', 1, 79, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '동시 실행 트랜잭션이 서로 영향을 주지 않도록 격리', TRUE, 1),
    (gen_random_uuid(), q_id, '트랜잭션이 모두 성공하거나 모두 실패하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '커밋된 데이터가 영구 저장되는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터가 항상 유효한 상태를 유지하는 것', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Security에서 JWT(JSON Web Token) 인증의 장점은?', 'JWT는 서버가 세션을 저장하지 않아도 되는 Stateless 인증 방식으로, 수평 확장(스케일 아웃)에 유리합니다.', 1, 80, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'Stateless 인증으로 수평 확장에 유리하다', TRUE, 1),
    (gen_random_uuid(), q_id, '세션보다 보안이 항상 강력하다', FALSE, 2),
    (gen_random_uuid(), q_id, '토큰 크기가 항상 작다', FALSE, 3),
    (gen_random_uuid(), q_id, '토큰을 서버에서 무효화하기 쉽다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Next.js의 ISR(Incremental Static Regeneration)이란?', 'ISR은 빌드 후에도 특정 페이지를 백그라운드에서 재생성하여 정적 생성의 장점과 최신 데이터를 동시에 제공합니다.', 1, 81, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '빌드 후에도 백그라운드에서 정적 페이지를 재생성한다', TRUE, 1),
    (gen_random_uuid(), q_id, '클라이언트에서 페이지를 동적으로 생성한다', FALSE, 2),
    (gen_random_uuid(), q_id, '서버에서 매 요청마다 페이지를 렌더링한다', FALSE, 3),
    (gen_random_uuid(), q_id, '정적 파일을 CDN에 자동 배포한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'ORM의 N+1 문제를 해결하는 가장 일반적인 방법은?', 'Eager Loading(즉시 로딩) 또는 JOIN FETCH를 사용하여 연관 엔티티를 한 번의 쿼리로 함께 가져옵니다.', 1, 82, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'JOIN FETCH 또는 Eager Loading으로 한 번에 조회', TRUE, 1),
    (gen_random_uuid(), q_id, '인덱스를 추가한다', FALSE, 2),
    (gen_random_uuid(), q_id, '캐시를 사용한다', FALSE, 3),
    (gen_random_uuid(), q_id, '테이블을 합친다(역정규화)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Kubernetes(K8s)의 Pod란?', 'Pod는 K8s에서 배포 가능한 가장 작은 단위로, 하나 이상의 컨테이너를 포함합니다.', 1, 83, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '배포 가능한 가장 작은 단위로 하나 이상의 컨테이너 포함', TRUE, 1),
    (gen_random_uuid(), q_id, '가상 머신 하나를 의미한다', FALSE, 2),
    (gen_random_uuid(), q_id, '네트워크 로드 밸런서이다', FALSE, 3),
    (gen_random_uuid(), q_id, '데이터 저장소이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '마이크로서비스 아키텍처(MSA)의 단점은?', 'MSA는 서비스 간 통신 복잡도, 분산 트랜잭션 관리, 모니터링/디버깅 어려움 등의 단점이 있습니다.', 1, 84, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '서비스 간 통신 복잡도와 분산 트랜잭션 관리 어려움', TRUE, 1),
    (gen_random_uuid(), q_id, '확장성이 낮다', FALSE, 2),
    (gen_random_uuid(), q_id, '단일 기술 스택만 사용해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '배포 빈도가 낮아진다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'React Query(TanStack Query)의 staleTime 옵션의 의미는?', 'staleTime은 데이터가 신선(fresh)한 것으로 간주되는 시간으로, 이 시간 내에는 리패칭하지 않습니다.', 1, 85, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '데이터가 fresh로 간주되는 시간(리패칭 방지)', TRUE, 1),
    (gen_random_uuid(), q_id, '캐시가 삭제되는 시간', FALSE, 2),
    (gen_random_uuid(), q_id, 'API 요청 타임아웃 시간', FALSE, 3),
    (gen_random_uuid(), q_id, '리트라이 간격', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'Spring Boot에서 프로파일(Profile)의 용도는?', '프로파일은 환경별(개발/스테이징/운영) 설정을 분리하여 같은 코드로 다른 환경에 배포할 수 있게 합니다.', 1, 86, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '환경별 설정을 분리하여 같은 코드로 다른 환경에 배포', TRUE, 1),
    (gen_random_uuid(), q_id, '사용자 프로필 정보를 관리한다', FALSE, 2),
    (gen_random_uuid(), q_id, '애플리케이션 성능을 측정한다', FALSE, 3),
    (gen_random_uuid(), q_id, '보안 정책을 설정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', '데이터베이스에서 낙관적 잠금(Optimistic Locking)의 구현 방식은?', '낙관적 잠금은 버전 번호나 타임스탬프를 사용하여 커밋 시점에 충돌을 감지합니다.', 1, 87, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '버전 번호/타임스탬프로 커밋 시 충돌을 감지한다', TRUE, 1),
    (gen_random_uuid(), q_id, '레코드를 읽을 때 즉시 잠금을 건다', FALSE, 2),
    (gen_random_uuid(), q_id, '테이블 전체를 잠금한다', FALSE, 3),
    (gen_random_uuid(), q_id, '트랜잭션을 사용하지 않는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'WebSocket과 HTTP의 주요 차이점은?', 'WebSocket은 양방향 실시간 통신을 지원하며, 한 번 연결 후 지속적으로 데이터를 주고받을 수 있습니다.', 1, 88, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'WebSocket은 양방향 실시간 통신을 지속적으로 지원한다', TRUE, 1),
    (gen_random_uuid(), q_id, 'WebSocket이 HTTP보다 보안이 강하다', FALSE, 2),
    (gen_random_uuid(), q_id, 'HTTP는 양방향 통신을 지원한다', FALSE, 3),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'GraphQL과 REST API의 주요 차이점은?', 'GraphQL은 클라이언트가 필요한 데이터만 정확히 요청할 수 있어 Over-fetching/Under-fetching 문제를 해결합니다.', 1, 89, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'GraphQL은 필요한 데이터만 정확히 요청할 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, 'GraphQL이 REST보다 항상 빠르다', FALSE, 2),
    (gen_random_uuid(), q_id, 'REST는 쿼리 언어를 사용한다', FALSE, 3),
    (gen_random_uuid(), q_id, '차이가 없다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000004-0000-0000-0000-000000000004', 'multiple_choice', 'CI/CD 파이프라인에서 Blue-Green 배포 전략이란?', 'Blue-Green 배포는 두 개의 동일한 환경을 유지하고, 새 버전을 대기 환경에 배포 후 트래픽을 전환하는 무중단 배포 전략입니다.', 1, 90, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '두 환경을 유지하고 트래픽을 전환하는 무중단 배포', TRUE, 1),
    (gen_random_uuid(), q_id, '서버를 순차적으로 업데이트하는 것', FALSE, 2),
    (gen_random_uuid(), q_id, '일부 사용자에게만 새 버전을 제공하는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '모든 서버를 동시에 업데이트하는 것', FALSE, 4);

END $$;

-- ============================================================
-- Quiz 5: 태도/문화 이해도 평가 (Attitude/Culture) — 30 questions
-- ============================================================
DO $$
DECLARE q_id UUID;
BEGIN

  -- ===== EASY (9 questions): 비즈니스 인사, 기본 경어, 출퇴근 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 아침에 출근했을 때 적절한 인사는?', '일본 직장에서 아침 출근 시에는 "おはようございます"(좋은 아침입니다)가 기본 인사입니다.', 1, 1, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おはようございます (좋은 아침입니다)', TRUE, 1),
    (gen_random_uuid(), q_id, 'こんにちは (안녕하세요)', FALSE, 2),
    (gen_random_uuid(), q_id, 'お疲れ様です (수고하셨습니다)', FALSE, 3),
    (gen_random_uuid(), q_id, 'さようなら (안녕히 가세요)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 퇴근할 때 남아있는 동료에게 하는 인사는?', '먼저 퇴근할 때는 "お先に失礼します"(먼저 실례합니다)라고 인사합니다.', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お先に失礼します (먼저 실례합니다)', TRUE, 1),
    (gen_random_uuid(), q_id, 'さようなら (안녕히 가세요)', FALSE, 2),
    (gen_random_uuid(), q_id, 'バイバイ (바이바이)', FALSE, 3),
    (gen_random_uuid(), q_id, 'では、また (그럼, 또)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 명함을 교환할 때의 올바른 매너는?', '명함은 양손으로 건네고 받으며, 받은 명함은 바로 주머니에 넣지 않고 테이블 위에 놓습니다.', 1, 3, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '양손으로 건네고 받으며, 받은 명함은 테이블에 놓는다', TRUE, 1),
    (gen_random_uuid(), q_id, '한 손으로 건네고 바로 주머니에 넣는다', FALSE, 2),
    (gen_random_uuid(), q_id, '명함에 메모를 적으며 대화한다', FALSE, 3),
    (gen_random_uuid(), q_id, '명함은 이메일로 보내는 것이 일반적이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "敬語(けいご)"란?', '경어는 일본어에서 상대방에 대한 존경과 예의를 표현하는 언어 체계로, 존경어, 겸양어, 정중어로 나뉩니다.', 1, 4, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상대방에 대한 존경과 예의를 표현하는 언어 체계', TRUE, 1),
    (gen_random_uuid(), q_id, '사투리의 한 종류', FALSE, 2),
    (gen_random_uuid(), q_id, '일본의 전통 문학 장르', FALSE, 3),
    (gen_random_uuid(), q_id, '비즈니스 이메일 형식', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 출근 시간에 대한 일반적인 기대는?', '일본에서는 시간 엄수가 매우 중요하며, 정시보다 5-10분 일찍 도착하는 것이 일반적입니다.', 1, 5, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정시보다 5-10분 일찍 도착하는 것이 바람직하다', TRUE, 1),
    (gen_random_uuid(), q_id, '정시에 도착하면 충분하다', FALSE, 2),
    (gen_random_uuid(), q_id, '5분 정도 늦어도 괜찮다', FALSE, 3),
    (gen_random_uuid(), q_id, '출근 시간은 자유롭게 결정한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 전화를 받을 때 첫 마디로 적절한 것은?', '일본 회사에서 전화를 받을 때는 "お電話ありがとうございます、○○会社の△△です"라고 합니다.', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お電話ありがとうございます (전화 감사합니다)', TRUE, 1),
    (gen_random_uuid(), q_id, 'もしもし (여보세요)', FALSE, 2),
    (gen_random_uuid(), q_id, 'はい (네)', FALSE, 3),
    (gen_random_uuid(), q_id, 'こんにちは (안녕하세요)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 お辞儀(おじぎ, 인사 절)의 종류가 아닌 것은?', '일본의 인사 절에는 会釈(에샤쿠, 15도), 敬礼(케이레이, 30도), 最敬礼(사이케이레이, 45도)가 있습니다.', 1, 7, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '直礼 (ちょくれい)', TRUE, 1),
    (gen_random_uuid(), q_id, '会釈 (えしゃく, 15도)', FALSE, 2),
    (gen_random_uuid(), q_id, '敬礼 (けいれい, 30도)', FALSE, 3),
    (gen_random_uuid(), q_id, '最敬礼 (さいけいれい, 45도)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 동료가 퇴근할 때 하는 인사는?', '동료가 먼저 퇴근할 때는 "お疲れ様でした"(수고하셨습니다)라고 인사합니다.', 1, 8, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様でした (수고하셨습니다)', TRUE, 1),
    (gen_random_uuid(), q_id, 'ご苦労様です (수고하십니다 - 상사→부하 표현)', FALSE, 2),
    (gen_random_uuid(), q_id, 'さようなら (안녕히 가세요)', FALSE, 3),
    (gen_random_uuid(), q_id, '頑張ってください (힘내세요)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 복장에 대한 일반적인 기준은?', '일본 회사에서는 깔끔하고 단정한 비즈니스 캐주얼 또는 정장이 기본이며, 회사 규정을 따릅니다.', 1, 9, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '깔끔하고 단정한 비즈니스 캐주얼/정장이 기본이다', TRUE, 1),
    (gen_random_uuid(), q_id, '자유로운 복장이 일반적이다', FALSE, 2),
    (gen_random_uuid(), q_id, '매일 양복/정장을 반드시 착용해야 한다', FALSE, 3),
    (gen_random_uuid(), q_id, '복장 규정은 없다', FALSE, 4);

  -- ===== MEDIUM (12 questions): 호렌소, 회의 매너, 이메일 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 "ホウレンソウ(호렌소)"란?', '호렌소는 報告(보고), 連絡(연락), 相談(상담)의 약자로, 일본 직장의 핵심 커뮤니케이션 원칙입니다.', 1, 10, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '報告(보고)・連絡(연락)・相談(상담)의 약자', TRUE, 1),
    (gen_random_uuid(), q_id, '일본의 전통 음식 이름', FALSE, 2),
    (gen_random_uuid(), q_id, '회사의 조직 구조 명칭', FALSE, 3),
    (gen_random_uuid(), q_id, '프로젝트 관리 방법론', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회의에서 상사가 발언 중일 때 적절한 행동은?', '일본에서는 상사의 발언을 끝까지 경청한 후 의견을 말하는 것이 예의입니다.', 1, 11, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '끝까지 경청한 후 의견을 말한다', TRUE, 1),
    (gen_random_uuid(), q_id, '좋은 아이디어가 있으면 바로 끼어든다', FALSE, 2),
    (gen_random_uuid(), q_id, '반대 의견은 바로 표현한다', FALSE, 3),
    (gen_random_uuid(), q_id, '메신저로 다른 동료에게 의견을 공유한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 비즈니스 이메일에서 첫 줄에 적는 것은?', '일본 비즈니스 이메일은 "○○会社 △△様" 또는 "お世話になっております"로 시작하는 것이 일반적입니다.', 1, 12, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '상대방의 소속과 이름, 그리고 인사말(お世話になっております)', TRUE, 1),
    (gen_random_uuid(), q_id, '자기소개부터 시작한다', FALSE, 2),
    (gen_random_uuid(), q_id, '용건을 바로 적는다', FALSE, 3),
    (gen_random_uuid(), q_id, '날짜와 시간을 먼저 적는다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '호렌소 중 "報告(보고)"를 할 때 가장 중요한 것은?', '보고는 결론부터 먼저 말하고(結論ファースト), 사실에 기반하여 간결하게 전달하는 것이 중요합니다.', 1, 13, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결론부터 먼저, 사실 기반으로 간결하게 전달한다', TRUE, 1),
    (gen_random_uuid(), q_id, '배경 설명을 상세하게 먼저 한다', FALSE, 2),
    (gen_random_uuid(), q_id, '좋은 결과만 보고한다', FALSE, 3),
    (gen_random_uuid(), q_id, '가능한 한 미루다가 한꺼번에 보고한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회의에서 의사록(議事録)을 작성하는 이유는?', '의사록은 결정 사항, 담당자, 기한을 명확히 기록하여 이후 확인과 책임 소재를 분명히 하기 위해 작성합니다.', 1, 14, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '결정 사항과 담당자, 기한을 명확히 기록하기 위해', TRUE, 1),
    (gen_random_uuid(), q_id, '법적 의무이기 때문에', FALSE, 2),
    (gen_random_uuid(), q_id, '상사에게 보여주기 위해', FALSE, 3),
    (gen_random_uuid(), q_id, '형식적인 절차에 불과하다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 비즈니스 이메일 마지막에 적는 인사는?', '일본 비즈니스 이메일 마지막에는 "よろしくお願いいたします"(잘 부탁드립니다)를 적는 것이 일반적입니다.', 1, 15, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'よろしくお願いいたします (잘 부탁드립니다)', TRUE, 1),
    (gen_random_uuid(), q_id, 'では (그럼)', FALSE, 2),
    (gen_random_uuid(), q_id, 'バイバイ (바이바이)', FALSE, 3),
    (gen_random_uuid(), q_id, '以上 (이상)', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 회의 시작 시간 5분 전에 도착하는 것이 중요한 이유는?', '일본에서 시간 엄수는 상대방에 대한 존중의 표현이며, 지각은 신뢰를 잃게 하는 큰 결례입니다.', 1, 16, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '시간 엄수는 상대방에 대한 존중이며 신뢰의 기본이다', TRUE, 1),
    (gen_random_uuid(), q_id, '일찍 도착하면 보너스를 받는다', FALSE, 2),
    (gen_random_uuid(), q_id, '일본에서는 특별히 중요하지 않다', FALSE, 3),
    (gen_random_uuid(), q_id, '회의실을 먼저 차지하기 위해서이다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '호렌소 중 "相談(상담)"을 할 때 적절한 태도는?', '상담 시에는 자신의 의견이나 해결안을 먼저 준비한 후 상사에게 확인/조언을 구하는 것이 바람직합니다.', 1, 17, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '자신의 의견/해결안을 준비한 후 조언을 구한다', TRUE, 1),
    (gen_random_uuid(), q_id, '문제만 전달하고 해결은 상사에게 맡긴다', FALSE, 2),
    (gen_random_uuid(), q_id, '혼자서 해결할 때까지 상담하지 않는다', FALSE, 3),
    (gen_random_uuid(), q_id, '동료에게만 상담하고 상사에게는 보고만 한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 회사에서 업무 중 실수를 했을 때 적절한 대응은?', '실수를 발견하면 즉시 상사에게 보고하고, 대응 방안을 함께 논의하는 것이 중요합니다. 숨기면 더 큰 문제가 됩니다.', 1, 18, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '즉시 상사에게 보고하고 대응 방안을 함께 논의한다', TRUE, 1),
    (gen_random_uuid(), q_id, '스스로 해결한 후 보고한다', FALSE, 2),
    (gen_random_uuid(), q_id, '다른 사람 탓으로 돌린다', FALSE, 3),
    (gen_random_uuid(), q_id, '심각하지 않으면 보고하지 않아도 된다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "お疲れ様です"와 "ご苦労様です"의 차이는?', '"お疲れ様です"는 누구에게나 사용 가능하지만, "ご苦労様です"는 상사가 부하에게 사용하는 표현입니다.', 1, 19, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様は누구에게나, ご苦労様は상사→부하 표현', TRUE, 1),
    (gen_random_uuid(), q_id, '의미가 같아서 서로 바꿔 사용할 수 있다', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご苦労様が더 정중한 표현이다', FALSE, 3),
    (gen_random_uuid(), q_id, 'お疲れ様は친구에게만 사용한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 회의 시 좌석 배치에서 "上座(かみざ)"란?', '上座는 출입구에서 가장 먼 자리로, 상위 직급이나 손님이 앉는 상석입니다.', 1, 20, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '출입구에서 가장 먼 자리로 상위 직급/손님이 앉는 상석', TRUE, 1),
    (gen_random_uuid(), q_id, '출입구 바로 옆 자리', FALSE, 2),
    (gen_random_uuid(), q_id, '회의실 중앙 자리', FALSE, 3),
    (gen_random_uuid(), q_id, '먼저 도착한 사람이 앉는 자리', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 비즈니스 이메일에서 CC에 상사를 포함하는 이유는?', 'CC에 상사를 포함하는 것은 정보 공유와 보고를 동시에 하는 호렌소의 일환이며, 일본 비즈니스의 일반적 관행입니다.', 1, 21, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '정보 공유와 보고를 동시에 하기 위한 호렌소의 일환', TRUE, 1),
    (gen_random_uuid(), q_id, '상사의 승인을 받기 위해', FALSE, 2),
    (gen_random_uuid(), q_id, '회사 규정상 필수이기 때문에', FALSE, 3),
    (gen_random_uuid(), q_id, '특별한 이유 없이 관습적인 것이다', FALSE, 4);

  -- ===== HARD (9 questions): 네마와시, 갈등 해결, 이문화 커뮤니케이션 =====

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "根回し(ねまわし, 네마와시)"란?', '네마와시는 공식 회의 전에 관계자들에게 미리 설명하고 동의를 구하는 비공식 사전 조율 과정입니다.', 1, 22, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '공식 회의 전에 관계자들과 사전 조율하는 비공식 과정', TRUE, 1),
    (gen_random_uuid(), q_id, '나무를 옮겨 심는 원예 기법', FALSE, 2),
    (gen_random_uuid(), q_id, '직원 평가 제도', FALSE, 3),
    (gen_random_uuid(), q_id, '회의록 작성 방법', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 직장에서 상사의 의견에 동의하지 않을 때 적절한 대응은?', '직접적 반박보다는 "なるほど、一方で…"(그렇군요, 한편으로는...) 등 완곡하게 다른 관점을 제시합니다.', 1, 23, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '완곡하게 다른 관점을 제시한다 (例: なるほど、一方で…)', TRUE, 1),
    (gen_random_uuid(), q_id, '직접적으로 "틀렸습니다"라고 말한다', FALSE, 2),
    (gen_random_uuid(), q_id, '무조건 동의하고 따른다', FALSE, 3),
    (gen_random_uuid(), q_id, '다른 동료 앞에서 공개적으로 반박한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "空気を読む(くうきをよむ)"의 비즈니스적 의미는?', '空気を読む는 말로 표현되지 않은 분위기나 상황을 파악하고, 그에 맞게 행동하는 것을 의미합니다.', 1, 24, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '말로 표현되지 않은 분위기/상황을 파악하고 적절히 행동한다', TRUE, 1),
    (gen_random_uuid(), q_id, '공기의 질을 측정하는 환경 활동', FALSE, 2),
    (gen_random_uuid(), q_id, '상사의 지시를 따르는 것', FALSE, 3),
    (gen_random_uuid(), q_id, '회의에서 적극적으로 발언하는 것', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '한국과 일본의 의사결정 방식의 주요 차이점은?', '한국은 톱다운(Top-down) 의사결정이 빠른 반면, 일본은 稟議(품의)와 네마와시를 통한 합의 형성(ボトムアップ)을 중시합니다.', 1, 25, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본은 합의 형성(ボトムアップ)을 중시하여 의사결정이 느릴 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '한국과 일본의 의사결정 방식은 동일하다', FALSE, 2),
    (gen_random_uuid(), q_id, '일본은 한국보다 의사결정이 항상 빠르다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본은 톱다운 방식을 선호한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "建前(たてまえ)"와 "本音(ほんね)"의 의미는?', '建前는 공적/사회적 입장(표면적 의견)이고, 本音는 개인의 진짜 생각(속마음)입니다. 이 구분을 이해하는 것이 중요합니다.', 1, 26, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '建前는 공적 입장(표면), 本音는 진짜 속마음', TRUE, 1),
    (gen_random_uuid(), q_id, '건축 용어이다', FALSE, 2),
    (gen_random_uuid(), q_id, '둘 다 같은 의미이다', FALSE, 3),
    (gen_random_uuid(), q_id, '本音는 거짓말을 의미한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본 IT 기업에서 팀 갈등 발생 시 가장 적절한 해결 방법은?', '일본에서는 직접적인 대립을 피하고, 제3자(상사나 리더)를 통해 중재하거나 개별 면담으로 해결하는 것을 선호합니다.', 1, 27, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '제3자 중재 또는 개별 면담을 통한 해결', TRUE, 1),
    (gen_random_uuid(), q_id, '팀 전체 앞에서 공개적으로 토론한다', FALSE, 2),
    (gen_random_uuid(), q_id, '갈등을 무시하고 시간이 해결하길 기다린다', FALSE, 3),
    (gen_random_uuid(), q_id, '이메일로 서로의 불만을 공유한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "稟議(りんぎ)"란?', '稟議는 제안서를 관련 부서와 상위 직급자에게 순차적으로 회람하여 승인을 얻는 일본 특유의 의사결정 시스템입니다.', 1, 28, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '제안서를 순차적으로 회람하여 승인을 얻는 의사결정 시스템', TRUE, 1),
    (gen_random_uuid(), q_id, '면접 과정의 일종', FALSE, 2),
    (gen_random_uuid(), q_id, '직원 교육 프로그램', FALSE, 3),
    (gen_random_uuid(), q_id, '연봉 협상 절차', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '한국인 IT 엔지니어가 일본 파견 시 가장 주의해야 할 커뮤니케이션 차이는?', '한국은 직접적 표현을 선호하지만, 일본은 간접적 표현과 맥락(문맥)을 중시하는 하이컨텍스트 문화입니다.', 1, 29, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '일본은 간접적 표현과 맥락을 중시하는 하이컨텍스트 문화', TRUE, 1),
    (gen_random_uuid(), q_id, '기술 용어의 차이만 주의하면 된다', FALSE, 2),
    (gen_random_uuid(), q_id, '한국과 일본의 커뮤니케이션 방식은 같다', FALSE, 3),
    (gen_random_uuid(), q_id, '일본은 한국보다 직접적 표현을 선호한다', FALSE, 4);

  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order, difficulty, question_category)
  VALUES (q_id, 'a0000005-0000-0000-0000-000000000005', 'multiple_choice', '일본에서 "和(わ)"를 중시하는 것이 IT 프로젝트에 미치는 영향은?', '和(조화)를 중시하면 팀 결속력은 높지만, 반대 의견 표현이 어려워 문제가 숨겨질 수 있습니다. 적절한 균형이 필요합니다.', 1, 30, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '팀 결속력은 높지만 반대 의견 표현이 어려울 수 있다', TRUE, 1),
    (gen_random_uuid(), q_id, '프로젝트 진행에 아무 영향이 없다', FALSE, 2),
    (gen_random_uuid(), q_id, '항상 긍정적인 영향만 준다', FALSE, 3),
    (gen_random_uuid(), q_id, '개인의 창의성이 극대화된다', FALSE, 4);

END $$;

-- ============================================
-- Tag Quiz 3 (Programming) question_category
-- Each difficulty group of 30 → 10 java + 10 javascript + 10 sql
-- ============================================
UPDATE quiz_questions SET question_category = 'java'       WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 1  AND 10;
UPDATE quiz_questions SET question_category = 'javascript'  WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 11 AND 20;
UPDATE quiz_questions SET question_category = 'sql'         WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 21 AND 30;
UPDATE quiz_questions SET question_category = 'java'       WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 31 AND 40;
UPDATE quiz_questions SET question_category = 'javascript'  WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 41 AND 50;
UPDATE quiz_questions SET question_category = 'sql'         WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 51 AND 60;
UPDATE quiz_questions SET question_category = 'java'       WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 61 AND 70;
UPDATE quiz_questions SET question_category = 'javascript'  WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 71 AND 80;
UPDATE quiz_questions SET question_category = 'sql'         WHERE quiz_id = 'a0000003-0000-0000-0000-000000000003' AND sort_order BETWEEN 81 AND 90;

-- ============================================
-- Tag Quiz 4 (Framework) question_category
-- Each difficulty group of 30 → 10 spring_boot + 10 react + 10 db_design
-- ============================================
UPDATE quiz_questions SET question_category = 'spring_boot' WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 1  AND 10;
UPDATE quiz_questions SET question_category = 'react'       WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 11 AND 20;
UPDATE quiz_questions SET question_category = 'db_design'   WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 21 AND 30;
UPDATE quiz_questions SET question_category = 'spring_boot' WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 31 AND 40;
UPDATE quiz_questions SET question_category = 'react'       WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 41 AND 50;
UPDATE quiz_questions SET question_category = 'db_design'   WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 51 AND 60;
UPDATE quiz_questions SET question_category = 'spring_boot' WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 61 AND 70;
UPDATE quiz_questions SET question_category = 'react'       WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 71 AND 80;
UPDATE quiz_questions SET question_category = 'db_design'   WHERE quiz_id = 'a0000004-0000-0000-0000-000000000004' AND sort_order BETWEEN 81 AND 90;

COMMIT;
