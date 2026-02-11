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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「経験」の読み方と意味として正しいものは？', '経験(けいけん)は「경험」という意味です。', 1, 2, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けいざい - 경제', FALSE, 1),
    (gen_random_uuid(), q_id, 'けっか　 - 결과', FALSE, 2),
    (gen_random_uuid(), q_id, 'けんきゅう - 연구', FALSE, 3),
    (gen_random_uuid(), q_id, 'けいけん - 경험', TRUE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「相談」の読み方と意味として正しいものは？', '相談(そうだん)は「상담」という意味です。', 1, 6, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しんだん - 진단', FALSE, 1),
    (gen_random_uuid(), q_id, 'しつもん - 질문', FALSE, 2),
    (gen_random_uuid(), q_id, 'そうだん - 상담', TRUE, 3),
    (gen_random_uuid(), q_id, 'そうさく - 수색', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「割合」の読み方と意味として正しいものは？', '割合(わりあい)は「비율」という意味です。', 1, 16, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'わりびき - 할인', FALSE, 1),
    (gen_random_uuid(), q_id, 'かつよう - 활용', FALSE, 2),
    (gen_random_uuid(), q_id, 'わりあい - 비율', TRUE, 3),
    (gen_random_uuid(), q_id, 'わりあて - 배분', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「受付」の読み方と意味として正しいものは？', '受付(うけつけ)は「접수/안내 데스크」という意味です。', 1, 22, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'うけとり - 수취', FALSE, 1),
    (gen_random_uuid(), q_id, 'うけつけ - 접수', TRUE, 2),
    (gen_random_uuid(), q_id, 'うけもち - 담당', FALSE, 3),
    (gen_random_uuid(), q_id, 'じゅけん - 수험', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「紹介」の読み方と意味として正しいものは？', '紹介(しょうかい)は「소개」という意味です。', 1, 26, 'easy', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しょうかい - 소개', TRUE, 1),
    (gen_random_uuid(), q_id, 'しょうがい - 장애', FALSE, 2),
    (gen_random_uuid(), q_id, 'しょうひん - 상품', FALSE, 3),
    (gen_random_uuid(), q_id, 'しょうめい - 증명', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「影響」の読み方と意味として正しいものは？', '影響(えいきょう)は「영향」という意味です。', 1, 34, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'えいぎょう - 영업', FALSE, 1),
    (gen_random_uuid(), q_id, 'えいよう　 - 영양', FALSE, 2),
    (gen_random_uuid(), q_id, 'えいがく　 - 영학', FALSE, 3),
    (gen_random_uuid(), q_id, 'えいきょう - 영향', TRUE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「効率」の読み方と意味として正しいものは？', '効率(こうりつ)は「효율」という意味です。', 1, 38, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こうけん - 공헌', FALSE, 1),
    (gen_random_uuid(), q_id, 'こうせい - 구성', FALSE, 2),
    (gen_random_uuid(), q_id, 'こうか　 - 효과', FALSE, 3),
    (gen_random_uuid(), q_id, 'こうりつ - 효율', TRUE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「基準」の読み方と意味として正しいものは？', '基準(きじゅん)は「기준」という意味です。', 1, 49, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'きそ　　 - 기초', FALSE, 1),
    (gen_random_uuid(), q_id, 'きほん　 - 기본', FALSE, 2),
    (gen_random_uuid(), q_id, 'きじゅん - 기준', TRUE, 3),
    (gen_random_uuid(), q_id, 'きかく　 - 기획', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「適切」の読み方と意味として正しいものは？', '適切(てきせつ)は「적절」という意味です。', 1, 54, 'medium', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'てきとう - 적당', FALSE, 1),
    (gen_random_uuid(), q_id, 'てきよう - 적용', FALSE, 2),
    (gen_random_uuid(), q_id, 'てきかく - 적격', FALSE, 3),
    (gen_random_uuid(), q_id, 'てきせつ - 적절', TRUE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「顕著」の読み方と意味として正しいものは？', '顕著(けんちょ)は「뚜렷한/현저한」という意味のN1語彙です。', 1, 61, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'けんちょ　 - 뚜렷한/현저한', TRUE, 1),
    (gen_random_uuid(), q_id, 'けんめい　 - 현명한/똑똑한', FALSE, 2),
    (gen_random_uuid(), q_id, 'げんじょう - 현상/상태', FALSE, 3),
    (gen_random_uuid(), q_id, 'けんぜん　 - 건전한/온전한', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「瞬時」の読み方と意味として正しいものは？', '瞬時(しゅんじ)は「순간/순식간」という意味です。', 1, 65, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'しゅんじ　 - 순간/순식간', TRUE, 1),
    (gen_random_uuid(), q_id, 'しゅんかん - 순간/찰나', FALSE, 2),
    (gen_random_uuid(), q_id, 'ぜんじ　　 - 전시/진열', FALSE, 3),
    (gen_random_uuid(), q_id, 'りんじ　　 - 임시/임의', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「冗長」の読み方と意味として正しいものは？', '冗長(じょうちょう)は「중복된/장황한」という意味です。IT用語として「冗長化」などで使われます。', 1, 70, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'じょうきょう - 상황/형편', FALSE, 1),
    (gen_random_uuid(), q_id, 'じょうほう　 - 정보/데이터', FALSE, 2),
    (gen_random_uuid(), q_id, 'じょうけん　 - 조건/전제', FALSE, 3),
    (gen_random_uuid(), q_id, 'じょうちょう - 장황한/중복된', TRUE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「俯瞰」の読み方と意味として正しいものは？', '俯瞰(ふかん)は「부감/조감(높은 곳에서 내려다봄)」という意味です。', 1, 73, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'びかん　 - 미관/아름다움', FALSE, 1),
    (gen_random_uuid(), q_id, 'ぼうかん - 방관/관망', FALSE, 2),
    (gen_random_uuid(), q_id, 'ふかん　 - 부감/조감', TRUE, 3),
    (gen_random_uuid(), q_id, 'たいかん - 체감/실감', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「恣意的」の読み方と意味として正しいものは？', '恣意的(しいてき)は「자의적인」という意味です。', 1, 78, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こういてき - 호의적인', FALSE, 1),
    (gen_random_uuid(), q_id, 'しいてき　 - 자의적인', TRUE, 2),
    (gen_random_uuid(), q_id, 'いしてき　 - 의식적인', FALSE, 3),
    (gen_random_uuid(), q_id, 'ごういてき - 합의적인', FALSE, 4);

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
  VALUES (q_id, 'a0000001-0000-0000-0000-000000000001', 'multiple_choice', '「網羅」の読み方と意味として正しいものは？', '網羅(もうら)は「망라/모두 포함」という意味です。', 1, 83, 'hard', NULL);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'もうら　 - 망라/모두 포함', TRUE, 1),
    (gen_random_uuid(), q_id, 'もうろう - 몽롱/흐릿함', FALSE, 2),
    (gen_random_uuid(), q_id, 'ぼうら　 - 방라/흩어짐', FALSE, 3),
    (gen_random_uuid(), q_id, 'もうそう - 망상/공상', FALSE, 4);

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
