-- ============================================
-- 敬語テスト Seed Data (3セット × ~17問 = 50問)
-- quiz_type: 'keigo', is_assessment: FALSE
-- Total: 50 questions, 200 options
-- + Pool quiz (20問ランダム抽出)
-- ============================================

BEGIN;

-- ============================================
-- 0. Clean up existing data (idempotent)
-- ============================================
DELETE FROM quiz_answers WHERE attempt_id IN (
  SELECT id FROM quiz_attempts WHERE quiz_id IN (
    'b4000001-0000-0000-0000-000000000001',
    'b4000002-0000-0000-0000-000000000002',
    'b4000003-0000-0000-0000-000000000003',
    'f0000001-0000-0000-0000-000000000004'
  )
);
DELETE FROM quiz_attempts WHERE quiz_id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003',
  'f0000001-0000-0000-0000-000000000004'
);
DELETE FROM quiz_question_options WHERE question_id IN (
  SELECT id FROM quiz_questions WHERE quiz_id IN (
    'b4000001-0000-0000-0000-000000000001',
    'b4000002-0000-0000-0000-000000000002',
    'b4000003-0000-0000-0000-000000000003'
  )
);
DELETE FROM quiz_questions WHERE quiz_id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003'
);
DELETE FROM quizzes WHERE id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003',
  'f0000001-0000-0000-0000-000000000004'
);

-- ============================================
-- Quiz 1: 敬語変換規則テスト
-- テーマ: 尊敬語・謙譲語の正しい変換
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b4000001-0000-0000-0000-000000000001';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, '敬語変換規則テスト', 'keigo', 70, 15, FALSE, NULL);

  -- Q1: 「する」の尊敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「お客様がする」を尊敬語に変換した場合、正しいものはどれですか？',
    '「する」の尊敬語は「される」または「なさる」です。「いたす」は謙譲語なので、お客様の動作には使えません。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お客様がされる', TRUE, 1),
    (gen_random_uuid(), q_id, 'お客様がいたす', FALSE, 2),
    (gen_random_uuid(), q_id, 'お客様が申す', FALSE, 3),
    (gen_random_uuid(), q_id, 'お客様がしてあげる', FALSE, 4);

  -- Q2: 「見る」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「私が資料を見る」を謙譲語に変換した場合、正しいものはどれですか？',
    '「見る」の謙譲語は「拝見する」です。「ご覧になる」は尊敬語なので、自分の動作には使えません。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '私が資料をご覧になる', FALSE, 1),
    (gen_random_uuid(), q_id, '私が資料を拝見する', TRUE, 2),
    (gen_random_uuid(), q_id, '私が資料を見られる', FALSE, 3),
    (gen_random_uuid(), q_id, '私が資料をお見えになる', FALSE, 4);

  -- Q3: 「言う」の尊敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「部長が言った」を尊敬語に変換した場合、正しいものはどれですか？',
    '「言う」の尊敬語は「おっしゃる」です。「申す」は謙譲語で、自分の動作に使います。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '部長が申した', FALSE, 1),
    (gen_random_uuid(), q_id, '部長が言われた', FALSE, 2),
    (gen_random_uuid(), q_id, '部長がおっしゃった', TRUE, 3),
    (gen_random_uuid(), q_id, '部長がお言いになった', FALSE, 4);

  -- Q4: 「食べる」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司から食事をすすめられた際、「食べる」の謙譲語として正しいものはどれですか？',
    '「食べる」の謙譲語は「いただく」です。「召し上がる」は尊敬語で、相手の動作に使います。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ありがたく召し上がります', FALSE, 1),
    (gen_random_uuid(), q_id, 'ありがたくいただきます', TRUE, 2),
    (gen_random_uuid(), q_id, 'ありがたく食べられます', FALSE, 3),
    (gen_random_uuid(), q_id, 'ありがたくお食べします', FALSE, 4);

  -- Q5: 「行く」の尊敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「お客様が明日会社に来る」を尊敬語に変換した場合、正しいものはどれですか？',
    '「来る」の尊敬語は「いらっしゃる」「お見えになる」「お越しになる」です。「参る」は謙譲語です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お客様が明日会社に参る', FALSE, 1),
    (gen_random_uuid(), q_id, 'お客様が明日会社にいらっしゃる', TRUE, 2),
    (gen_random_uuid(), q_id, 'お客様が明日会社におる', FALSE, 3),
    (gen_random_uuid(), q_id, 'お客様が明日会社に来られてあげる', FALSE, 4);

  -- Q6: 「知る」の尊敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先の担当者に「この件を知っていますか」と尋ねる場合、最も適切な表現はどれですか？',
    '「知る」の尊敬語は「ご存じ」です。相手が知っているかどうかを尋ねる場合は「ご存じですか」を使います。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'この件を存じていますか', FALSE, 1),
    (gen_random_uuid(), q_id, 'この件をご存じですか', TRUE, 2),
    (gen_random_uuid(), q_id, 'この件を知っておられますか', FALSE, 3),
    (gen_random_uuid(), q_id, 'この件をお知りになっていますか', FALSE, 4);

  -- Q7: 「聞く」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に質問したい場合、「聞く」の謙譲語として最も適切な表現はどれですか？',
    '「聞く」の謙譲語は「伺う」です。「お聞きになる」は尊敬語で、相手の動作に使います。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '一点お聞きになりたいのですが', FALSE, 1),
    (gen_random_uuid(), q_id, '一点伺いたいのですが', TRUE, 2),
    (gen_random_uuid(), q_id, '一点聞かせていただきたいのですが', FALSE, 3),
    (gen_random_uuid(), q_id, '一点お聞かせ願いたいのですが', FALSE, 4);

  -- Q8: 「読む」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先から送られた報告書を読んだことを伝える場合、最も適切な表現はどれですか？',
    '「読む」の謙譲語は「拝読する」です。相手が書いたもの・送ったものを読む場合に使う格式の高い表現です。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '報告書をお読みになりました', FALSE, 1),
    (gen_random_uuid(), q_id, '報告書を拝読いたしました', TRUE, 2),
    (gen_random_uuid(), q_id, '報告書を読ませていただきました', FALSE, 3),
    (gen_random_uuid(), q_id, '報告書を読まれました', FALSE, 4);

  -- Q9: 「もらう」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司から資料を受け取った場合、「もらう」の謙譲語として正しいものはどれですか？',
    '「もらう」の謙譲語は「いただく」です。上司や目上の人から何かを受け取る際に使います。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '資料を差し上げました', FALSE, 1),
    (gen_random_uuid(), q_id, '資料をいただきました', TRUE, 2),
    (gen_random_uuid(), q_id, '資料をくださいました', FALSE, 3),
    (gen_random_uuid(), q_id, '資料をお受けしました', FALSE, 4);

  -- Q10: 「会う」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先の社長に初めて会った際、「会えてうれしい」を最も適切に表現したものはどれですか？',
    '「会う」の謙譲語は「お目にかかる」です。「お目にかかれて光栄です」は格式の高い挨拶表現です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お会いできてうれしいです', FALSE, 1),
    (gen_random_uuid(), q_id, 'お目にかかれて光栄です', TRUE, 2),
    (gen_random_uuid(), q_id, '会えてうれしく存じます', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご面会できて光栄です', FALSE, 4);

  -- Q11: 「いる」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '電話で自分が在席していることを伝える場合、「いる」の謙譲語として正しいものはどれですか？',
    '「いる」の謙譲語は「おる」です。自分の状態を謙遜して伝える表現です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '私はいらっしゃいます', FALSE, 1),
    (gen_random_uuid(), q_id, '私はおります', TRUE, 2),
    (gen_random_uuid(), q_id, '私はございます', FALSE, 3),
    (gen_random_uuid(), q_id, '私はいられます', FALSE, 4);

  -- Q12: お/ご〜になる（尊敬語の一般形）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「お客様が資料を使う」を「お/ご〜になる」パターンで尊敬語にした場合、正しいものはどれですか？',
    '「使う」は和語なので「お」をつけて「お使いになる」とします。漢語には「ご」をつけるのが基本ルールです。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お客様が資料をご使いになる', FALSE, 1),
    (gen_random_uuid(), q_id, 'お客様が資料をお使いになる', TRUE, 2),
    (gen_random_uuid(), q_id, 'お客様が資料をお使いする', FALSE, 3),
    (gen_random_uuid(), q_id, 'お客様が資料をお使いいただく', FALSE, 4);

  -- Q13: お/ご〜する（謙譲語の一般形）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「私がお客様を案内する」を「お/ご〜する」パターンで謙譲語にした場合、正しいものはどれですか？',
    '「案内する」は漢語なので「ご」をつけて「ご案内する」「ご案内いたす」とします。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '私がお客様をお案内する', FALSE, 1),
    (gen_random_uuid(), q_id, '私がお客様をご案内いたします', TRUE, 2),
    (gen_random_uuid(), q_id, '私がお客様をご案内になります', FALSE, 3),
    (gen_random_uuid(), q_id, '私がお客様を案内されます', FALSE, 4);

  -- Q14: 「思う」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '会議で自分の意見を述べる際、「私もそう思います」を謙譲語で表現した場合、最も適切なものはどれですか？',
    '「思う」の謙譲語は「存じる」です。「存じます」は自分の考えを謙遜して述べる丁寧な表現です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '私もそうお思いになります', FALSE, 1),
    (gen_random_uuid(), q_id, '私もそのように存じます', TRUE, 2),
    (gen_random_uuid(), q_id, '私もそう思われます', FALSE, 3),
    (gen_random_uuid(), q_id, '私もそうございます', FALSE, 4);

  -- Q15: 「ございます」の使い方
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '来客に会議室の場所を案内する際、最も丁寧な表現はどれですか？',
    '「ございます」は「あります」の最も丁寧な形です。来客やお客様に対して使う格式の高い丁寧語です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議室は3階にあります', FALSE, 1),
    (gen_random_uuid(), q_id, '会議室は3階にございます', TRUE, 2),
    (gen_random_uuid(), q_id, '会議室は3階にいらっしゃいます', FALSE, 3),
    (gen_random_uuid(), q_id, '会議室は3階におります', FALSE, 4);

  -- Q16: 「あげる」の謙譲語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に資料を渡す際、「あげる」の謙譲語として正しいものはどれですか？',
    '「あげる」の謙譲語は「差し上げる」です。相手に何かを提供・贈呈する際に使います。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '資料をお渡しになります', FALSE, 1),
    (gen_random_uuid(), q_id, '資料をあげさせていただきます', FALSE, 2),
    (gen_random_uuid(), q_id, '資料を差し上げます', TRUE, 3),
    (gen_random_uuid(), q_id, '資料をくださいます', FALSE, 4);

  -- Q17: お/ご〜いただく（謙譲語の依頼形）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に書類を確認してもらいたい場合、「お/ご〜いただく」パターンで最も適切な表現はどれですか？',
    '「確認」は漢語なので「ご確認いただけますでしょうか」が正しい形です。依頼形として非常に丁寧な表現です。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お確認いただけますでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, 'ご確認いただけますでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご確認されますでしょうか', FALSE, 3),
    (gen_random_uuid(), q_id, 'お確認になりますでしょうか', FALSE, 4);

END $$;

-- ============================================
-- Quiz 2: よくある間違いテスト
-- テーマ: 敬語の誤用を見つける
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b4000002-0000-0000-0000-000000000002';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'よくある敬語の間違いテスト', 'keigo', 70, 15, FALSE, NULL);

  -- Q1: 二重敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次の文のうち、二重敬語（敬語の重複）になっているものはどれですか？',
    '「お読みになられる」は「お読みになる」（尊敬語）+「〜られる」（尊敬語）で二重敬語です。正しくは「お読みになる」です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '部長がお読みになる', FALSE, 1),
    (gen_random_uuid(), q_id, '部長がお読みになられる', TRUE, 2),
    (gen_random_uuid(), q_id, '部長が拝読される', FALSE, 3),
    (gen_random_uuid(), q_id, '部長がお読みくださる', FALSE, 4);

  -- Q2: 自分への尊敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次の文のうち、敬語の使い方が間違っているものはどれですか？',
    '「私がおっしゃったのは」は自分の動作に尊敬語を使っているため誤りです。正しくは「私が申し上げたのは」です。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '部長がおっしゃったのは正しいと思います', FALSE, 1),
    (gen_random_uuid(), q_id, '私がおっしゃったのはそういう意味ではありません', TRUE, 2),
    (gen_random_uuid(), q_id, '私が申し上げたのはそういう意味ではありません', FALSE, 3),
    (gen_random_uuid(), q_id, 'お客様がおっしゃった通りに対応いたします', FALSE, 4);

  -- Q3: バイト敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次の文のうち、いわゆる「バイト敬語」で正しくない表現はどれですか？',
    '「こちらが資料になります」の「〜になります」は変化を表す表現で、ここでは不適切です。「こちらが資料でございます」が正しい表現です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こちらが資料でございます', FALSE, 1),
    (gen_random_uuid(), q_id, 'こちらが資料になります', TRUE, 2),
    (gen_random_uuid(), q_id, 'こちらの資料をご覧ください', FALSE, 3),
    (gen_random_uuid(), q_id, '資料をお持ちいたしました', FALSE, 4);

  -- Q4: ら抜き言葉
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次の文のうち、「ら抜き言葉」になっているものはどれですか？',
    '「見れますか」は「見られますか」の「ら」が抜けた形です。ビジネスの場では「見られますか」が正しい表現です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こちらの画面が見られますか', FALSE, 1),
    (gen_random_uuid(), q_id, 'こちらの画面が見れますか', TRUE, 2),
    (gen_random_uuid(), q_id, 'こちらの画面をご覧になれますか', FALSE, 3),
    (gen_random_uuid(), q_id, 'こちらの画面をご覧いただけますか', FALSE, 4);

  -- Q5: よろしかったでしょうか
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '現在の確認をする際、正しい表現はどれですか？',
    '「よろしかったでしょうか」は過去形で、現在の確認には不適切です。「よろしいでしょうか」が正しい現在形の表現です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'この内容でよろしかったでしょうか', FALSE, 1),
    (gen_random_uuid(), q_id, 'この内容でよろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'この内容でよろしかったですか', FALSE, 3),
    (gen_random_uuid(), q_id, 'この内容でよかったでしょうか', FALSE, 4);

  -- Q6: 了解しました
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司からの指示を受けた際、最もビジネスに適した返答はどれですか？',
    '「承知いたしました」「かしこまりました」は上司や目上の人への返答として最も適切です。「了解しました」は同等の立場向けです。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '了解しました', FALSE, 1),
    (gen_random_uuid(), q_id, 'わかりました', FALSE, 2),
    (gen_random_uuid(), q_id, '承知いたしました', TRUE, 3),
    (gen_random_uuid(), q_id, 'OKです', FALSE, 4);

  -- Q7: なるほどですね
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司の説明に対して同意を示す際、最も適切な表現はどれですか？',
    '「なるほどですね」は文法的に不自然で、目上の人に使うと失礼です。「おっしゃる通りです」が適切な同意表現です。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'なるほどですね', FALSE, 1),
    (gen_random_uuid(), q_id, 'おっしゃる通りでございます', TRUE, 2),
    (gen_random_uuid(), q_id, 'そうなんですね', FALSE, 3),
    (gen_random_uuid(), q_id, 'まあそうですよね', FALSE, 4);

  -- Q8: お/ごの付け間違い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次の「お/ご」の使い方で、間違っているものはどれですか？',
    '外来語には「お/ご」をつけないのが原則です。「おコーヒー」は不適切で、「コーヒー」とそのまま使います。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お茶をどうぞ', FALSE, 1),
    (gen_random_uuid(), q_id, 'おコーヒーをどうぞ', TRUE, 2),
    (gen_random_uuid(), q_id, 'お水をどうぞ', FALSE, 3),
    (gen_random_uuid(), q_id, 'ご連絡ください', FALSE, 4);

  -- Q9: 謙譲語と尊敬語の混同
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '「お客様が来ました」を敬語に直す場合、正しいものはどれですか？',
    '「参る」は謙譲語で自分の動作に使います。お客様の動作には尊敬語「いらっしゃる」を使うのが正しいです。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お客様が参りました', FALSE, 1),
    (gen_random_uuid(), q_id, 'お客様がいらっしゃいました', TRUE, 2),
    (gen_random_uuid(), q_id, 'お客様がおりました', FALSE, 3),
    (gen_random_uuid(), q_id, 'お客様が来られてあげました', FALSE, 4);

  -- Q10: すみません vs 申し訳ございません
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に迷惑をかけた際の謝罪として、最も適切な表現はどれですか？',
    '取引先への謝罪には「申し訳ございません」が最も適切です。「すみません」は日常的すぎてビジネスでは格式が足りません。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'すみませんでした', FALSE, 1),
    (gen_random_uuid(), q_id, 'ごめんなさい', FALSE, 2),
    (gen_random_uuid(), q_id, '申し訳ございません', TRUE, 3),
    (gen_random_uuid(), q_id, '悪かったです', FALSE, 4);

  -- Q11: させていただくの乱用
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次の「させていただく」の使い方で、不適切なものはどれですか？',
    '「させていただく」は相手の許可が必要な場面で使うのが原則です。「拝見する」だけで十分謙譲の意味があるため、「拝見させていただく」は過剰です。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '本日は休暇を取得させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '資料を拝見させていただきます', TRUE, 2),
    (gen_random_uuid(), q_id, '説明させていただきます', FALSE, 3),
    (gen_random_uuid(), q_id, '先に退室させていただきます', FALSE, 4);

  -- Q12: 〜してあげる（目上に失礼）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司に情報を伝える際、最も適切な表現はどれですか？',
    '「教えてあげます」は恩恵を与えるニュアンスがあり、目上の人に使うと失礼です。「お伝えいたします」が適切な謙譲表現です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '部長に教えてあげます', FALSE, 1),
    (gen_random_uuid(), q_id, '部長にお教えします', FALSE, 2),
    (gen_random_uuid(), q_id, '部長にお伝えいたします', TRUE, 3),
    (gen_random_uuid(), q_id, '部長に知らせてあげます', FALSE, 4);

  -- Q13: ご苦労様です vs お疲れ様です
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '上司が外出から戻ってきた際、最も適切な声かけはどれですか？',
    '「ご苦労様です」は目上が目下に使う表現です。上司に対しては「お疲れ様です」を使うのがマナーです。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ご苦労様です', FALSE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様です', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご苦労様でした', FALSE, 3),
    (gen_random_uuid(), q_id, 'お帰りなさい', FALSE, 4);

  -- Q14: ちょっとお聞きしたいんですけど
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に質問する際、最もビジネスにふさわしい表現はどれですか？',
    '「ちょっとお聞きしたいんですけど」は「ちょっと」「〜んですけど」がカジュアルすぎます。「少々お伺いしたいのですが」が適切です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'ちょっとお聞きしたいんですけど', FALSE, 1),
    (gen_random_uuid(), q_id, '聞きたいことがあるんですが', FALSE, 2),
    (gen_random_uuid(), q_id, '少々お伺いしたいのですが', TRUE, 3),
    (gen_random_uuid(), q_id, 'ちょっと質問いいですか', FALSE, 4);

  -- Q15: 二重敬語の見分け
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次のうち、二重敬語になっていない正しい表現はどれですか？',
    '「ご覧になる」は「見る」の正しい尊敬語です。「おっしゃられる」「お召し上がりになられる」「ご覧になられる」はいずれも二重敬語です。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'おっしゃられる', FALSE, 1),
    (gen_random_uuid(), q_id, 'お召し上がりになられる', FALSE, 2),
    (gen_random_uuid(), q_id, 'ご覧になる', TRUE, 3),
    (gen_random_uuid(), q_id, 'ご覧になられる', FALSE, 4);

  -- Q16: でよろしかったですかの誤用
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '注文を確認する際、「ご注文は以上で____」の空欄に入る正しい表現はどれですか？',
    '現在の注文確認には現在形を使います。「よろしかったですか」は過去形で文法的に不適切です。「よろしいでしょうか」が正しい表現です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'よろしかったですか', FALSE, 1),
    (gen_random_uuid(), q_id, 'よろしいでしょうか', TRUE, 2),
    (gen_random_uuid(), q_id, 'よろしかったでしょうか', FALSE, 3),
    (gen_random_uuid(), q_id, 'いいですか', FALSE, 4);

END $$;

-- ============================================
-- Quiz 3: ウチ・ソト＋総合テスト
-- テーマ: ウチ・ソト切り替え + 敬語総合
-- ============================================
DO $$
DECLARE quiz_id UUID := 'b4000003-0000-0000-0000-000000000003';
DECLARE q_id UUID;
BEGIN
  INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, questions_per_attempt)
  VALUES (quiz_id, 'ウチ・ソト＋敬語総合テスト', 'keigo', 70, 15, FALSE, NULL);

  -- Q1: 社外への上司紹介
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社外の方に自社の部長を紹介する際、正しい表現はどれですか？',
    '社外の人に自社の上司を紹介する際は、敬称を外して「弊社の部長の田中」のように言います。「田中部長」は社内での呼び方です。',
    2, 1);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中部長をご紹介いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '弊社の部長の田中をご紹介いたします', TRUE, 2),
    (gen_random_uuid(), q_id, 'うちの田中部長をご紹介します', FALSE, 3),
    (gen_random_uuid(), q_id, '部長の田中様をご紹介いたします', FALSE, 4);

  -- Q2: 弊社 vs 御社
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先とのメールで、「____のご要望に沿えるよう、____一同努力いたします」の空欄に入る正しい組み合わせはどれですか？',
    '相手の会社は「御社」（口頭）/「貴社」（書面）、自社は「弊社」を使います。メールは書面なので「貴社」と「弊社」が正しい組み合わせです。',
    2, 2);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '弊社 / 御社', FALSE, 1),
    (gen_random_uuid(), q_id, '貴社 / 弊社', TRUE, 2),
    (gen_random_uuid(), q_id, '当社 / 御社', FALSE, 3),
    (gen_random_uuid(), q_id, '御社 / 当社', FALSE, 4);

  -- Q3: 電話応対（自社の人が不在）
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社外の方から電話があり、自社の佐藤課長が不在の場合、正しい応対はどれですか？',
    '社外の人に対しては自社の人を呼び捨てにし、謙譲語を使います。「佐藤は席を外しております」が正しい表現です。',
    2, 3);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '佐藤課長は席を外していらっしゃいます', FALSE, 1),
    (gen_random_uuid(), q_id, '佐藤は席を外しております', TRUE, 2),
    (gen_random_uuid(), q_id, '佐藤課長はただいま不在です', FALSE, 3),
    (gen_random_uuid(), q_id, '佐藤さんは席を外しております', FALSE, 4);

  -- Q4: 自社の人の発言を伝える
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に対して、自社の田中部長の発言を伝える際、正しい表現はどれですか？',
    '社外に自社上司の発言を伝える際は謙譲語「申す」を使い、敬称もつけません。「田中が申しておりました」が正しい表現です。',
    2, 4);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中部長がおっしゃっていました', FALSE, 1),
    (gen_random_uuid(), q_id, '弊社の田中が申しておりました', TRUE, 2),
    (gen_random_uuid(), q_id, '部長の田中様が言っておりました', FALSE, 3),
    (gen_random_uuid(), q_id, 'うちの田中部長が言っていました', FALSE, 4);

  -- Q5: 社内メールの書き出し
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社内の同僚に送るメールの書き出しとして、最も適切なものはどれですか？',
    '社内メールは「お疲れ様です」で始めるのが一般的です。「いつもお世話になっております」は社外向けの挨拶です。',
    2, 5);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いつもお世話になっております', FALSE, 1),
    (gen_random_uuid(), q_id, 'お疲れ様です', TRUE, 2),
    (gen_random_uuid(), q_id, 'ご無沙汰しております', FALSE, 3),
    (gen_random_uuid(), q_id, '平素より大変お世話になっております', FALSE, 4);

  -- Q6: 自社担当者を紹介
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に自社の担当者を紹介する際、正しい表現はどれですか？',
    '「弊社の担当の鈴木がご説明いたします」は、弊社（謙遜）+呼び捨て+謙譲語の正しいウチ・ソトパターンです。',
    2, 6);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '担当の鈴木さんがご説明いたします', FALSE, 1),
    (gen_random_uuid(), q_id, '弊社の担当の鈴木がご説明いたします', TRUE, 2),
    (gen_random_uuid(), q_id, '弊社の鈴木がご説明になります', FALSE, 3),
    (gen_random_uuid(), q_id, '当社の鈴木様がご説明されます', FALSE, 4);

  -- Q7: 参ります vs いらっしゃいます
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先との電話で、「弊社の担当が午後に____」の空欄に入る正しい表現はどれですか？',
    '自社の人の移動には謙譲語「参る」を使います。「いらっしゃる」は尊敬語で、相手側の動作に使います。',
    2, 7);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'いらっしゃいます', FALSE, 1),
    (gen_random_uuid(), q_id, '参ります', TRUE, 2),
    (gen_random_uuid(), q_id, '行かれます', FALSE, 3),
    (gen_random_uuid(), q_id, 'お越しになります', FALSE, 4);

  -- Q8: ウチの範囲の拡大
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '他社の人に自分の部署の同僚を紹介する場合、「ウチ」の範囲はどこまでですか？',
    '他社の人と話す場合、自社全体が「ウチ」になります。自分の部署の同僚はもちろん、他部署の上司も「ウチ」として扱います。',
    2, 8);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '自分の部署だけ', FALSE, 1),
    (gen_random_uuid(), q_id, '自社全体', TRUE, 2),
    (gen_random_uuid(), q_id, '自分のチームだけ', FALSE, 3),
    (gen_random_uuid(), q_id, '直属の上司まで', FALSE, 4);

  -- Q9: 社内会議 vs 客先での言葉遣い
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '社内会議では「田中部長がおっしゃった通り」と言いますが、取引先の前で同じ内容を伝える場合、正しい表現はどれですか？',
    '取引先の前では自社の上司も「ウチ」なので、敬称を外し謙譲語を使います。「弊社の田中が申しました通り」が正しい表現です。',
    2, 9);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '田中部長がおっしゃった通り', FALSE, 1),
    (gen_random_uuid(), q_id, '弊社の田中が申しました通り', TRUE, 2),
    (gen_random_uuid(), q_id, '部長の田中様がおっしゃった通り', FALSE, 3),
    (gen_random_uuid(), q_id, 'うちの田中部長が言った通り', FALSE, 4);

  -- Q10: 社外メールの書き出し
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先に送るメールの書き出しとして、最も適切なものはどれですか？',
    '社外メールでは「いつもお世話になっております」が最も一般的な書き出しです。「お疲れ様です」は社内向けの挨拶です。',
    2, 10);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'お疲れ様です', FALSE, 1),
    (gen_random_uuid(), q_id, 'いつもお世話になっております', TRUE, 2),
    (gen_random_uuid(), q_id, 'こんにちは', FALSE, 3),
    (gen_random_uuid(), q_id, 'お忙しいところ失礼します', FALSE, 4);

  -- Q11: お客様の前で同僚を紹介
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'お客様の前で自社のエンジニア佐藤を紹介する際、正しい表現はどれですか？',
    'お客様の前では同僚も「ウチ」なので呼び捨てにし、「でございます」「おります」等の謙譲・丁重表現を使います。',
    2, 11);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'こちらが佐藤さんです。エンジニアをしています', FALSE, 1),
    (gen_random_uuid(), q_id, 'こちらが弊社のエンジニアの佐藤でございます', TRUE, 2),
    (gen_random_uuid(), q_id, 'こちらが佐藤エンジニアでいらっしゃいます', FALSE, 3),
    (gen_random_uuid(), q_id, 'エンジニアの佐藤様をご紹介します', FALSE, 4);

  -- Q12: 取引先の行為に尊敬語
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先の担当者が確認してくれたことを伝える場合、正しい表現はどれですか？',
    '取引先（ソト）の行為には尊敬語を使います。「ご確認くださいました」「ご確認いただきました」が適切です。',
    2, 12);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '御社の田中様が確認しました', FALSE, 1),
    (gen_random_uuid(), q_id, '御社の田中様がご確認くださいました', TRUE, 2),
    (gen_random_uuid(), q_id, '御社の田中が確認いたしました', FALSE, 3),
    (gen_random_uuid(), q_id, '田中様が確認してあげました', FALSE, 4);

  -- Q13: 当部署 vs そちらの部署
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '他社と打ち合わせ中に、「この件は____で対応いたします」と自分の部署を指す場合、正しい表現はどれですか？',
    '自社の部署を指す場合は「当部署」「弊部署」を使います。「私どもの部署」も使えます。',
    2, 13);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, 'そちらの部署', FALSE, 1),
    (gen_random_uuid(), q_id, '当部署', TRUE, 2),
    (gen_random_uuid(), q_id, '御部署', FALSE, 3),
    (gen_random_uuid(), q_id, 'あちらの部署', FALSE, 4);

  -- Q14: 電話で折り返し連絡
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先から電話があり、担当の山田が不在の場合、折り返しの連絡を提案する最も適切な表現はどれですか？',
    '自社の人は呼び捨て+謙譲語が基本です。「山田が戻り次第、折り返しお電話いたします」が正しい表現です。',
    2, 14);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '山田さんが戻りましたら、お電話させていただきます', FALSE, 1),
    (gen_random_uuid(), q_id, '山田が戻り次第、折り返しお電話いたします', TRUE, 2),
    (gen_random_uuid(), q_id, '山田部長が戻られましたら、ご連絡いたします', FALSE, 3),
    (gen_random_uuid(), q_id, '山田が戻ったら、電話します', FALSE, 4);

  -- Q15: 総合問題 - 正しい敬語の組み合わせ
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '次のうち、敬語の使い方がすべて正しい文はどれですか？',
    '「部長がおっしゃった資料を拝見いたしました」は、部長の動作に尊敬語「おっしゃる」、自分の動作に謙譲語「拝見する」を正しく使い分けています。',
    2, 15);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '部長が申された資料をご覧になりました', FALSE, 1),
    (gen_random_uuid(), q_id, '部長がおっしゃった資料を拝見いたしました', TRUE, 2),
    (gen_random_uuid(), q_id, '部長が言われた資料を見させていただきました', FALSE, 3),
    (gen_random_uuid(), q_id, '部長がおっしゃられた資料を拝見させていただきました', FALSE, 4);

  -- Q16: 総合問題 - 社外向けの正しい表現
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    '取引先への電話で「担当の鈴木に確認して、折り返し連絡します」を敬語で伝える場合、最も適切な表現はどれですか？',
    '自社の鈴木は呼び捨て+謙譲語、自分の行動も謙譲語を使います。「担当の鈴木に確認いたしまして、折り返しご連絡いたします」が正しい表現です。',
    2, 16);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '担当の鈴木さんに確認して、折り返しご連絡します', FALSE, 1),
    (gen_random_uuid(), q_id, '担当の鈴木に確認いたしまして、折り返しご連絡いたします', TRUE, 2),
    (gen_random_uuid(), q_id, '鈴木課長にご確認いただいて、折り返しお電話いたします', FALSE, 3),
    (gen_random_uuid(), q_id, '担当の鈴木が確認されて、折り返し連絡いたします', FALSE, 4);

  -- Q17: 総合問題 - 場面に応じた敬語切り替え
  q_id := gen_random_uuid();
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, explanation, points, sort_order)
  VALUES (q_id, quiz_id, 'multiple_choice',
    'お客様が来社された際、会議室にご案内する表現として最も適切なものはどれですか？',
    '「ご案内いたします」は自分の動作を謙譲語で表現し、「どうぞこちらへ」は丁寧語で案内する適切な組み合わせです。',
    2, 17);
  INSERT INTO quiz_question_options (id, question_id, option_text, is_correct, sort_order) VALUES
    (gen_random_uuid(), q_id, '会議室まで案内しますので、ついてきてください', FALSE, 1),
    (gen_random_uuid(), q_id, '会議室にご案内いたします。どうぞこちらへ', TRUE, 2),
    (gen_random_uuid(), q_id, '会議室にご案内になります。こちらに行ってください', FALSE, 3),
    (gen_random_uuid(), q_id, '会議室まで参りますので、お越しください', FALSE, 4);

END $$;

-- ============================================
-- Pool Quiz: 敬語テスト（ランダム20問抽出）
-- ============================================
INSERT INTO quizzes (id, title, quiz_type, passing_score, time_limit_minutes, is_assessment, is_pool, questions_per_attempt)
VALUES ('f0000001-0000-0000-0000-000000000004', '敬語テスト', 'keigo', 70, 20, false, true, 20)
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- Post-insert: set question_category and difficulty
-- question_category = 'keigo' for all keigo questions
-- difficulty by sort_order: 初級 1-4, 中級 5-12, 上級 13-17
-- ============================================
UPDATE quiz_questions SET question_category = 'keigo'
WHERE quiz_id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003'
);

UPDATE quiz_questions SET difficulty = '初級'
WHERE quiz_id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 1 AND 4;

UPDATE quiz_questions SET difficulty = '中級'
WHERE quiz_id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 5 AND 12;

UPDATE quiz_questions SET difficulty = '上級'
WHERE quiz_id IN (
  'b4000001-0000-0000-0000-000000000001',
  'b4000002-0000-0000-0000-000000000002',
  'b4000003-0000-0000-0000-000000000003'
) AND sort_order BETWEEN 13 AND 17;

COMMIT;
